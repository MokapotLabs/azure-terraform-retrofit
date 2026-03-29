This is how a typical "terraform apply" (dev) looks like, taken from GH Actions

```
Initializing the backend...

Successfully configured the backend "azurerm"! Terraform will automatically
use this backend unless the backend configuration changes.
Initializing modules...
- vnet in modules/vnet
  Initializing provider plugins...
- Reusing previous version of hashicorp/azurerm from the dependency lock file
- Reusing previous version of hashicorp/random from the dependency lock file
- Installing hashicorp/azurerm v4.66.0...
- Installed hashicorp/azurerm v4.66.0 (signed by HashiCorp)
- Installing hashicorp/random v3.8.1...
- Installed hashicorp/random v3.8.1 (signed by HashiCorp)
  Terraform has made some changes to the provider dependency selections recorded
  in the .terraform.lock.hcl file. Review those changes and commit them to your
  version control system if they represent changes you intended to make.

Terraform has been successfully initialized!
Switched to workspace "dev".
Acquiring state lock. This may take a few moments...

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
+ create

Terraform will perform the following actions:

# azurerm_linux_virtual_machine.this will be created
+ resource "azurerm_linux_virtual_machine" "this" {
    + admin_username                                         = "azureuser"
    + allow_extension_operations                             = (known after apply)
    + bypass_platform_safety_checks_on_user_schedule_enabled = false
    + computer_name                                          = "vmdeveus2"
    + disable_password_authentication                        = true
    + disk_controller_type                                   = (known after apply)
    + extensions_time_budget                                 = "PT1H30M"
    + id                                                     = (known after apply)
    + location                                               = "eastus2"
    + max_bid_price                                          = -1
    + name                                                   = "vm-acme-dev-eus2"
    + network_interface_ids                                  = (known after apply)
    + os_managed_disk_id                                     = (known after apply)
    + patch_assessment_mode                                  = (known after apply)
    + patch_mode                                             = (known after apply)
    + platform_fault_domain                                  = -1
    + priority                                               = "Regular"
    + private_ip_address                                     = (known after apply)
    + private_ip_addresses                                   = (known after apply)
    + provision_vm_agent                                     = (known after apply)
    + public_ip_address                                      = (known after apply)
    + public_ip_addresses                                    = (known after apply)
    + resource_group_name                                    = "rg-acme-dev-eus2"
    + size                                                   = "Standard_D2ps_v6"
    + tags                                                   = {
        + "environment"     = "dev"
        + "location"        = "eastus2"
        + "managed_by"      = "terraform"
        + "project"         = "acme"
        + "release_channel" = "development"
        + "repository"      = "azure-terraform-retrofit"
          }
    + virtual_machine_id                                     = (known after apply)
    + vm_agent_platform_updates_enabled                      = (known after apply)

    + admin_ssh_key {
      # At least one attribute in this block is (or was) sensitive,
      # so its contents will not be displayed.
      }

    + os_disk {
        + caching                   = "ReadWrite"
        + disk_size_gb              = 30
        + id                        = (known after apply)
        + name                      = (known after apply)
        + storage_account_type      = "StandardSSD_LRS"
        + write_accelerator_enabled = false
          }

    + source_image_reference {
        + offer     = "0001-com-ubuntu-server-jammy"
        + publisher = "Canonical"
        + sku       = "22_04-lts-arm64"
        + version   = "latest"
          }

    + termination_notification (known after apply)
      }

# azurerm_network_interface.vm will be created
+ resource "azurerm_network_interface" "vm" {
    + accelerated_networking_enabled = false
    + applied_dns_servers            = (known after apply)
    + id                             = (known after apply)
    + internal_domain_name_suffix    = (known after apply)
    + ip_forwarding_enabled          = false
    + location                       = "eastus2"
    + mac_address                    = (known after apply)
    + name                           = "nic-acme-dev-eus2-vm"
    + private_ip_address             = (known after apply)
    + private_ip_addresses           = (known after apply)
    + resource_group_name            = "rg-acme-dev-eus2"
    + tags                           = {
        + "environment"     = "dev"
        + "location"        = "eastus2"
        + "managed_by"      = "terraform"
        + "project"         = "acme"
        + "release_channel" = "development"
        + "repository"      = "azure-terraform-retrofit"
          }
    + virtual_machine_id             = (known after apply)

    + ip_configuration {
        + gateway_load_balancer_frontend_ip_configuration_id = (known after apply)
        + name                                               = "primary"
        + primary                                            = (known after apply)
        + private_ip_address                                 = (known after apply)
        + private_ip_address_allocation                      = "Dynamic"
        + private_ip_address_version                         = "IPv4"
        + public_ip_address_id                               = (known after apply)
        + subnet_id                                          = (known after apply)
          }
          }

# azurerm_public_ip.vm[0] will be created
+ resource "azurerm_public_ip" "vm" {
    + allocation_method       = "Static"
    + ddos_protection_mode    = "VirtualNetworkInherited"
    + fqdn                    = (known after apply)
    + id                      = (known after apply)
    + idle_timeout_in_minutes = 4
    + ip_address              = (known after apply)
    + ip_version              = "IPv4"
    + location                = "eastus2"
    + name                    = "pip-acme-dev-eus2-vm"
    + resource_group_name     = "rg-acme-dev-eus2"
    + sku                     = "Standard"
    + sku_tier                = "Regional"
    + tags                    = {
        + "environment"     = "dev"
        + "location"        = "eastus2"
        + "managed_by"      = "terraform"
        + "project"         = "acme"
        + "release_channel" = "development"
        + "repository"      = "azure-terraform-retrofit"
          }
          }

# azurerm_resource_group.this will be created
+ resource "azurerm_resource_group" "this" {
    + id       = (known after apply)
    + location = "eastus2"
    + name     = "rg-acme-dev-eus2"
    + tags     = {
        + "environment"     = "dev"
        + "location"        = "eastus2"
        + "managed_by"      = "terraform"
        + "project"         = "acme"
        + "release_channel" = "development"
        + "repository"      = "azure-terraform-retrofit"
          }
          }

# azurerm_storage_account.this will be created
+ resource "azurerm_storage_account" "this" {
    + access_tier                        = (known after apply)
    + account_kind                       = "StorageV2"
    + account_replication_type           = "LRS"
    + account_tier                       = "Standard"
    + allow_nested_items_to_be_public    = false
    + cross_tenant_replication_enabled   = false
    + default_to_oauth_authentication    = false
    + dns_endpoint_type                  = "Standard"
    + https_traffic_only_enabled         = true
    + id                                 = (known after apply)
    + infrastructure_encryption_enabled  = false
    + is_hns_enabled                     = false
    + large_file_share_enabled           = (known after apply)
    + local_user_enabled                 = true
    + location                           = "eastus2"
    + min_tls_version                    = "TLS1_2"
    + name                               = (known after apply)
    + nfsv3_enabled                      = false
    + primary_access_key                 = (sensitive value)
    + primary_blob_connection_string     = (sensitive value)
    + primary_blob_endpoint              = (known after apply)
    + primary_blob_host                  = (known after apply)
    + primary_blob_internet_endpoint     = (known after apply)
    + primary_blob_internet_host         = (known after apply)
    + primary_blob_microsoft_endpoint    = (known after apply)
    + primary_blob_microsoft_host        = (known after apply)
    + primary_connection_string          = (sensitive value)
    + primary_dfs_endpoint               = (known after apply)
    + primary_dfs_host                   = (known after apply)
    + primary_dfs_internet_endpoint      = (known after apply)
    + primary_dfs_internet_host          = (known after apply)
    + primary_dfs_microsoft_endpoint     = (known after apply)
    + primary_dfs_microsoft_host         = (known after apply)
    + primary_file_endpoint              = (known after apply)
    + primary_file_host                  = (known after apply)
    + primary_file_internet_endpoint     = (known after apply)
    + primary_file_internet_host         = (known after apply)
    + primary_file_microsoft_endpoint    = (known after apply)
    + primary_file_microsoft_host        = (known after apply)
    + primary_location                   = (known after apply)
    + primary_queue_endpoint             = (known after apply)
    + primary_queue_host                 = (known after apply)
    + primary_queue_microsoft_endpoint   = (known after apply)
    + primary_queue_microsoft_host       = (known after apply)
    + primary_table_endpoint             = (known after apply)
    + primary_table_host                 = (known after apply)
    + primary_table_microsoft_endpoint   = (known after apply)
    + primary_table_microsoft_host       = (known after apply)
    + primary_web_endpoint               = (known after apply)
    + primary_web_host                   = (known after apply)
    + primary_web_internet_endpoint      = (known after apply)
    + primary_web_internet_host          = (known after apply)
    + primary_web_microsoft_endpoint     = (known after apply)
    + primary_web_microsoft_host         = (known after apply)
    + public_network_access_enabled      = true
    + queue_encryption_key_type          = "Service"
    + resource_group_name                = "rg-acme-dev-eus2"
    + secondary_access_key               = (sensitive value)
    + secondary_blob_connection_string   = (sensitive value)
    + secondary_blob_endpoint            = (known after apply)
    + secondary_blob_host                = (known after apply)
    + secondary_blob_internet_endpoint   = (known after apply)
    + secondary_blob_internet_host       = (known after apply)
    + secondary_blob_microsoft_endpoint  = (known after apply)
    + secondary_blob_microsoft_host      = (known after apply)
    + secondary_connection_string        = (sensitive value)
    + secondary_dfs_endpoint             = (known after apply)
    + secondary_dfs_host                 = (known after apply)
    + secondary_dfs_internet_endpoint    = (known after apply)
    + secondary_dfs_internet_host        = (known after apply)
    + secondary_dfs_microsoft_endpoint   = (known after apply)
    + secondary_dfs_microsoft_host       = (known after apply)
    + secondary_file_endpoint            = (known after apply)
    + secondary_file_host                = (known after apply)
    + secondary_file_internet_endpoint   = (known after apply)
    + secondary_file_internet_host       = (known after apply)
    + secondary_file_microsoft_endpoint  = (known after apply)
    + secondary_file_microsoft_host      = (known after apply)
    + secondary_location                 = (known after apply)
    + secondary_queue_endpoint           = (known after apply)
    + secondary_queue_host               = (known after apply)
    + secondary_queue_microsoft_endpoint = (known after apply)
    + secondary_queue_microsoft_host     = (known after apply)
    + secondary_table_endpoint           = (known after apply)
    + secondary_table_host               = (known after apply)
    + secondary_table_microsoft_endpoint = (known after apply)
    + secondary_table_microsoft_host     = (known after apply)
    + secondary_web_endpoint             = (known after apply)
    + secondary_web_host                 = (known after apply)
    + secondary_web_internet_endpoint    = (known after apply)
    + secondary_web_internet_host        = (known after apply)
    + secondary_web_microsoft_endpoint   = (known after apply)
    + secondary_web_microsoft_host       = (known after apply)
    + sftp_enabled                       = false
    + shared_access_key_enabled          = true
    + table_encryption_key_type          = "Service"
    + tags                               = {
        + "environment"     = "dev"
        + "location"        = "eastus2"
        + "managed_by"      = "terraform"
        + "project"         = "acme"
        + "release_channel" = "development"
        + "repository"      = "azure-terraform-retrofit"
          }

    + blob_properties (known after apply)

    + network_rules (known after apply)

    + queue_properties (known after apply)

    + routing (known after apply)

    + share_properties {
        + retention_policy {
            + days = 7
              }
              }

    + static_website (known after apply)
      }

# azurerm_storage_container.this will be created
+ resource "azurerm_storage_container" "this" {
    + container_access_type             = "private"
    + default_encryption_scope          = (known after apply)
    + encryption_scope_override_enabled = true
    + has_immutability_policy           = (known after apply)
    + has_legal_hold                    = (known after apply)
    + id                                = (known after apply)
    + metadata                          = (known after apply)
    + name                              = "appdata"
    + resource_manager_id               = (known after apply)
    + storage_account_id                = (known after apply)
      }

# random_string.storage_suffix will be created
+ resource "random_string" "storage_suffix" {
    + id          = (known after apply)
    + length      = 6
    + lower       = true
    + min_lower   = 0
    + min_numeric = 0
    + min_special = 0
    + min_upper   = 0
    + number      = true
    + numeric     = true
    + result      = (known after apply)
    + special     = false
    + upper       = false
      }

# module.vnet.azurerm_network_security_group.this["workload"] will be created
+ resource "azurerm_network_security_group" "this" {
    + id                  = (known after apply)
    + location            = "eastus2"
    + name                = "nsg-acme-dev-workload"
    + resource_group_name = "rg-acme-dev-eus2"
    + security_rule       = (known after apply)
    + tags                = {
        + "environment"     = "dev"
        + "location"        = "eastus2"
        + "managed_by"      = "terraform"
        + "project"         = "acme"
        + "release_channel" = "development"
        + "repository"      = "azure-terraform-retrofit"
          }
          }

# module.vnet.azurerm_network_security_rule.this["workload.allow-ssh-admin"] will be created
+ resource "azurerm_network_security_rule" "this" {
    + access                      = "Allow"
    + description                 = "Allow SSH only from approved admin CIDRs."
    + destination_address_prefix  = "*"
    + destination_port_ranges     = [
        + "22",
          ]
    + direction                   = "Inbound"
    + id                          = (known after apply)
    + name                        = "allow-ssh-admin"
    + network_security_group_name = "nsg-acme-dev-workload"
    + priority                    = 100
    + protocol                    = "Tcp"
    + resource_group_name         = "rg-acme-dev-eus2"
    + source_address_prefixes     = [
        + "193.19.207.212/32",
          ]
    + source_port_range           = "*"
      }

# module.vnet.azurerm_subnet.this["private"] will be created
+ resource "azurerm_subnet" "this" {
    + address_prefixes                              = [
        + "10.10.2.0/24",
          ]
    + default_outbound_access_enabled               = true
    + id                                            = (known after apply)
    + name                                          = "snet-acme-dev-private"
    + private_endpoint_network_policies             = "Disabled"
    + private_link_service_network_policies_enabled = true
    + resource_group_name                           = "rg-acme-dev-eus2"
    + service_endpoints                             = [
        + "Microsoft.Storage",
          ]
    + virtual_network_name                          = "vnet-acme-dev-eastus2"
      }

# module.vnet.azurerm_subnet.this["workload"] will be created
+ resource "azurerm_subnet" "this" {
    + address_prefixes                              = [
        + "10.10.1.0/24",
          ]
    + default_outbound_access_enabled               = true
    + id                                            = (known after apply)
    + name                                          = "snet-acme-dev-workload"
    + private_endpoint_network_policies             = "Disabled"
    + private_link_service_network_policies_enabled = true
    + resource_group_name                           = "rg-acme-dev-eus2"
    + service_endpoints                             = [
        + "Microsoft.Storage",
          ]
    + virtual_network_name                          = "vnet-acme-dev-eastus2"
      }

# module.vnet.azurerm_subnet_network_security_group_association.this["workload"] will be created
+ resource "azurerm_subnet_network_security_group_association" "this" {
    + id                        = (known after apply)
    + network_security_group_id = (known after apply)
    + subnet_id                 = (known after apply)
      }

# module.vnet.azurerm_virtual_network.this will be created
+ resource "azurerm_virtual_network" "this" {
    + address_space                  = [
        + "10.10.0.0/16",
          ]
    + dns_servers                    = (known after apply)
    + guid                           = (known after apply)
    + id                             = (known after apply)
    + location                       = "eastus2"
    + name                           = "vnet-acme-dev-eastus2"
    + private_endpoint_vnet_policies = "Disabled"
    + resource_group_name            = "rg-acme-dev-eus2"
    + subnet                         = (known after apply)
    + tags                           = {
        + "environment"     = "dev"
        + "location"        = "eastus2"
        + "managed_by"      = "terraform"
        + "project"         = "acme"
        + "release_channel" = "development"
        + "repository"      = "azure-terraform-retrofit"
          }
          }

Plan: 13 to add, 0 to change, 0 to destroy.

Changes to Outputs:
+ environment            = "dev"
+ resource_group_name    = "rg-acme-dev-eus2"
+ storage_account_name   = (known after apply)
+ storage_container_name = "appdata"
+ subnet_ids             = {
    + private  = (known after apply)
    + workload = (known after apply)
      }
+ vm_id                  = (known after apply)
+ vm_name                = "vm-acme-dev-eus2"
+ vm_private_ip          = (known after apply)
+ vm_public_ip           = (known after apply)
+ vnet_id                = (known after apply)
+ vnet_name              = "vnet-acme-dev-eastus2"
  random_string.storage_suffix: Creating...
  random_string.storage_suffix: Creation complete after 0s [id=96fcki]
  azurerm_resource_group.this: Creating...
  azurerm_resource_group.this: Still creating... [00m10s elapsed]
  azurerm_resource_group.this: Still creating... [00m20s elapsed]
  azurerm_resource_group.this: Creation complete after 27s [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2]
  module.vnet.azurerm_network_security_group.this["workload"]: Creating...
  module.vnet.azurerm_virtual_network.this: Creating...
  azurerm_public_ip.vm[0]: Creating...
  azurerm_storage_account.this: Creating...
  module.vnet.azurerm_network_security_group.this["workload"]: Creation complete after 4s [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkSecurityGroups/nsg-acme-dev-workload]
  module.vnet.azurerm_network_security_rule.this["workload.allow-ssh-admin"]: Creating...
  azurerm_public_ip.vm[0]: Creation complete after 4s [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/publicIPAddresses/pip-acme-dev-eus2-vm]
  module.vnet.azurerm_network_security_rule.this["workload.allow-ssh-admin"]: Creation complete after 3s [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkSecurityGroups/nsg-acme-dev-workload/securityRules/allow-ssh-admin]
  module.vnet.azurerm_virtual_network.this: Creation complete after 7s [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2]
  module.vnet.azurerm_subnet.this["workload"]: Creating...
  module.vnet.azurerm_subnet.this["private"]: Creating...
  azurerm_storage_account.this: Still creating... [00m10s elapsed]
  module.vnet.azurerm_subnet.this["private"]: Creation complete after 5s [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-private]
  module.vnet.azurerm_subnet.this["workload"]: Still creating... [00m10s elapsed]
  module.vnet.azurerm_subnet.this["workload"]: Creation complete after 11s [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload]
  module.vnet.azurerm_subnet_network_security_group_association.this["workload"]: Creating...
  azurerm_network_interface.vm: Creating...
  azurerm_storage_account.this: Still creating... [00m20s elapsed]
  module.vnet.azurerm_subnet_network_security_group_association.this["workload"]: Creation complete after 5s [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload]
  azurerm_network_interface.vm: Creation complete after 8s [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkInterfaces/nic-acme-dev-eus2-vm]
  azurerm_linux_virtual_machine.this: Creating...
  azurerm_storage_account.this: Still creating... [00m30s elapsed]
  azurerm_linux_virtual_machine.this: Still creating... [00m10s elapsed]
  azurerm_storage_account.this: Still creating... [00m40s elapsed]
  azurerm_linux_virtual_machine.this: Still creating... [00m20s elapsed]
  azurerm_storage_account.this: Still creating... [00m50s elapsed]
  azurerm_linux_virtual_machine.this: Still creating... [00m30s elapsed]
  azurerm_storage_account.this: Still creating... [01m00s elapsed]
  azurerm_linux_virtual_machine.this: Still creating... [00m40s elapsed]
  azurerm_storage_account.this: Creation complete after 1m8s [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Storage/storageAccounts/stacmedeveus296fcki]
  azurerm_storage_container.this: Creating...
  azurerm_storage_container.this: Creation complete after 2s [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Storage/storageAccounts/stacmedeveus296fcki/blobServices/default/containers/appdata]
  azurerm_linux_virtual_machine.this: Still creating... [00m50s elapsed]
  azurerm_linux_virtual_machine.this: Creation complete after 51s [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Compute/virtualMachines/vm-acme-dev-eus2]
  Releasing state lock. This may take a few moments...

Apply complete! Resources: 13 added, 0 changed, 0 destroyed.

Outputs:

environment = "dev"
resource_group_name = "rg-acme-dev-eus2"
storage_account_name = "stacmedeveus296fcki"
storage_container_name = "appdata"
subnet_ids = {
"private" = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-private"
"workload" = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload"
}
vm_id = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Compute/virtualMachines/vm-acme-dev-eus2"
vm_name = "vm-acme-dev-eus2"
vm_private_ip = "10.10.1.4"
vm_public_ip = "20.110.49.78"
vnet_id = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2"
vnet_name = "vnet-acme-dev-eastus2"
```

Completed in 2m 33s
