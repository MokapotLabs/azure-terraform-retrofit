resource "random_string" "storage_suffix" {
  length  = 6
  special = false
  upper   = false
}

locals {
  environments = {
    dev = {
      location             = "eastus2"
      location_short       = "eus2"
      address_space        = ["10.10.0.0/16"]
      workload_subnet_cidr = "10.10.1.0/24"
      private_subnet_cidr  = "10.10.2.0/24"
      enable_public_ip     = true
      admin_cidrs          = var.dev_admin_cidrs
      vm_size              = "Standard_D2ps_v6"
      extra_tags = {
        release_channel = "development"
      }
    }
    prod = {
      location             = "westeurope"
      location_short       = "weu"
      address_space        = ["10.20.0.0/16"]
      workload_subnet_cidr = "10.20.1.0/24"
      private_subnet_cidr  = "10.20.2.0/24"
      enable_public_ip     = false
      admin_cidrs          = var.prod_admin_cidrs
      vm_size              = "Standard_D2ps_v6"
      extra_tags = {
        release_channel = "protected"
      }
    }
  }

  current_environment = local.environments[terraform.workspace]
  name_prefix         = "${var.project_name}-${terraform.workspace}-${local.current_environment.location_short}"
  vm_name             = "vm-${local.name_prefix}"
  storage_name        = substr(replace(lower("st${var.project_name}${terraform.workspace}${local.current_environment.location_short}${random_string.storage_suffix.result}"), "-", ""), 0, 24)

  common_tags = merge(var.extra_tags, local.current_environment.extra_tags, {
    environment = terraform.workspace
    location    = local.current_environment.location
    managed_by  = "terraform"
    project     = var.project_name
    repository  = "azure-terraform-retrofit"
  })

  ssh_rules = local.current_environment.enable_public_ip && length(local.current_environment.admin_cidrs) > 0 ? [
    {
      name                       = "allow-ssh-admin"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      destination_port_ranges    = ["22"]
      source_address_prefixes    = local.current_environment.admin_cidrs
      destination_address_prefix = "*"
      description                = "Allow SSH only from approved admin CIDRs."
    }
  ] : []

  subnets = {
    workload = {
      address_prefixes  = [local.current_environment.workload_subnet_cidr]
      service_endpoints = ["Microsoft.Storage"]
      nsg_rules         = local.ssh_rules
    }
    private = {
      address_prefixes  = [local.current_environment.private_subnet_cidr]
      service_endpoints = ["Microsoft.Storage"]
      nsg_rules         = []
    }
  }
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${local.name_prefix}"
  location = local.current_environment.location
  tags     = local.common_tags
}

module "vnet" {
  source = "./modules/vnet"

  project_name            = var.project_name
  environment             = terraform.workspace
  location                = local.current_environment.location
  resource_group_name     = azurerm_resource_group.this.name
  address_space           = local.current_environment.address_space
  subnets                 = local.subnets
  tags                    = local.common_tags
  ddos_protection_plan_id = var.ddos_protection_plan_id
}

resource "azurerm_public_ip" "vm" {
  count = local.current_environment.enable_public_ip ? 1 : 0

  name                = "pip-${local.name_prefix}-vm"
  location            = local.current_environment.location
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.common_tags
}

resource "azurerm_network_interface" "vm" {
  name                = "nic-${local.name_prefix}-vm"
  location            = local.current_environment.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = local.common_tags

  ip_configuration {
    name                          = "primary"
    subnet_id                     = module.vnet.subnet_ids["workload"]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = local.current_environment.enable_public_ip ? azurerm_public_ip.vm[0].id : null
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  name                            = local.vm_name
  computer_name                   = "vm${terraform.workspace}${local.current_environment.location_short}"
  resource_group_name             = azurerm_resource_group.this.name
  location                        = local.current_environment.location
  size                            = local.current_environment.vm_size
  admin_username                  = var.admin_username
  disable_password_authentication = true
  network_interface_ids           = [azurerm_network_interface.vm.id]
  tags                            = local.common_tags

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb         = 30
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-arm64"
    version   = "latest"
  }
}

resource "azurerm_storage_account" "this" {
  name                            = local.storage_name
  resource_group_name             = azurerm_resource_group.this.name
  location                        = local.current_environment.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  account_kind                    = "StorageV2"
  shared_access_key_enabled       = true
  default_to_oauth_authentication = false
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = true
  tags                            = local.common_tags

  share_properties {
    retention_policy {
      days = 7
    }
  }
}

resource "azurerm_storage_container" "this" {
  name                  = var.storage_container_name
  storage_account_id    = azurerm_storage_account.this.id
  container_access_type = "private"
}
