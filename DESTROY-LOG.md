This is how a typical "terraform destroy" (dev) looks like, taken from the local terminal.

```
Switched to workspace "dev".
Acquiring state lock. This may take a few moments...
random_string.storage_suffix: Refreshing state... [id=2iti3a]
azurerm_resource_group.this: Refreshing state... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2]
module.vnet.azurerm_network_security_group.this["workload"]: Refreshing state... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkSecurityGroups/nsg-acme-dev-workload]
module.vnet.azurerm_virtual_network.this: Refreshing state... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2]
azurerm_public_ip.vm[0]: Refreshing state... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/publicIPAddresses/pip-acme-dev-eus2-vm]
azurerm_storage_account.this: Refreshing state... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Storage/storageAccounts/stacmedeveus22iti3a]
module.vnet.azurerm_subnet.this["private"]: Refreshing state... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-private]
module.vnet.azurerm_subnet.this["workload"]: Refreshing state... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload]
module.vnet.azurerm_network_security_rule.this["workload.allow-ssh-admin"]: Refreshing state... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkSecurityGroups/nsg-acme-dev-workload/securityRules/allow-ssh-admin]
module.vnet.azurerm_subnet_network_security_group_association.this["workload"]: Refreshing state... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload]
azurerm_network_interface.vm: Refreshing state... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkInterfaces/nic-acme-dev-eus2-vm]
azurerm_linux_virtual_machine.this: Refreshing state... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Compute/virtualMachines/vm-acme-dev-eus2]
azurerm_storage_container.this: Refreshing state... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Storage/storageAccounts/stacmedeveus22iti3a/blobServices/default/containers/appdata]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  - destroy

Terraform will perform the following actions:

  # azurerm_linux_virtual_machine.this will be destroyed
  - resource "azurerm_linux_virtual_machine" "this" {
      - admin_username                                         = "azureuser" -> null
      - allow_extension_operations                             = true -> null
      - bypass_platform_safety_checks_on_user_schedule_enabled = false -> null
      - computer_name                                          = "vmdeveus2" -> null
      - disable_password_authentication                        = true -> null
      - disk_controller_type                                   = "SCSI" -> null
      - encryption_at_host_enabled                             = false -> null
      - extensions_time_budget                                 = "PT1H30M" -> null
      - id                                                     = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Compute/virtualMachines/vm-acme-dev-eus2" -> null
      - location                                               = "eastus2" -> null
      - max_bid_price                                          = -1 -> null
      - name                                                   = "vm-acme-dev-eus2" -> null
      - network_interface_ids                                  = [
          - "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkInterfaces/nic-acme-dev-eus2-vm",
        ] -> null
      - os_managed_disk_id                                     = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Compute/disks/vm-acme-dev-eus2_OsDisk_1_873e7af9712f41caa05c3cf2064c4c03" -> null
      - patch_assessment_mode                                  = "ImageDefault" -> null
      - patch_mode                                             = "ImageDefault" -> null
      - platform_fault_domain                                  = -1 -> null
      - priority                                               = "Regular" -> null
      - private_ip_address                                     = "10.10.1.4" -> null
      - private_ip_addresses                                   = [
          - "10.10.1.4",
        ] -> null
      - provision_vm_agent                                     = true -> null
      - public_ip_address                                      = "20.7.151.151" -> null
      - public_ip_addresses                                    = [
          - "20.7.151.151",
        ] -> null
      - resource_group_name                                    = "rg-acme-dev-eus2" -> null
      - secure_boot_enabled                                    = false -> null
      - size                                                   = "Standard_D2ps_v6" -> null
      - tags                                                   = {
          - "environment"     = "dev"
          - "location"        = "eastus2"
          - "managed_by"      = "terraform"
          - "project"         = "acme"
          - "release_channel" = "development"
          - "repository"      = "azure-terraform-retrofit"
        } -> null
      - virtual_machine_id                                     = "627e5f66-2e6d-4361-a94f-7147c0d4081c" -> null
      - vm_agent_platform_updates_enabled                      = false -> null
      - vtpm_enabled                                           = false -> null
        # (13 unchanged attributes hidden)

      - admin_ssh_key {
          # At least one attribute in this block is (or was) sensitive,
          # so its contents will not be displayed.
        }

      - os_disk {
          - caching                          = "ReadWrite" -> null
          - disk_size_gb                     = 30 -> null
          - id                               = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Compute/disks/vm-acme-dev-eus2_OsDisk_1_873e7af9712f41caa05c3cf2064c4c03" -> null
          - name                             = "vm-acme-dev-eus2_OsDisk_1_873e7af9712f41caa05c3cf2064c4c03" -> null
          - storage_account_type             = "StandardSSD_LRS" -> null
          - write_accelerator_enabled        = false -> null
            # (3 unchanged attributes hidden)
        }

      - source_image_reference {
          - offer     = "0001-com-ubuntu-server-jammy" -> null
          - publisher = "Canonical" -> null
          - sku       = "22_04-lts-arm64" -> null
          - version   = "latest" -> null
        }
    }

  # azurerm_network_interface.vm will be destroyed
  - resource "azurerm_network_interface" "vm" {
      - accelerated_networking_enabled = false -> null
      - applied_dns_servers            = [] -> null
      - dns_servers                    = [] -> null
      - id                             = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkInterfaces/nic-acme-dev-eus2-vm" -> null
      - internal_domain_name_suffix    = "412ugg5udxtunnvrmepyd44xyc.cx.internal.cloudapp.net" -> null
      - ip_forwarding_enabled          = false -> null
      - location                       = "eastus2" -> null
      - mac_address                    = "7C-1E-52-EA-CA-A4" -> null
      - name                           = "nic-acme-dev-eus2-vm" -> null
      - private_ip_address             = "10.10.1.4" -> null
      - private_ip_addresses           = [
          - "10.10.1.4",
        ] -> null
      - resource_group_name            = "rg-acme-dev-eus2" -> null
      - tags                           = {
          - "environment"     = "dev"
          - "location"        = "eastus2"
          - "managed_by"      = "terraform"
          - "project"         = "acme"
          - "release_channel" = "development"
          - "repository"      = "azure-terraform-retrofit"
        } -> null
      - virtual_machine_id             = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Compute/virtualMachines/vm-acme-dev-eus2" -> null
        # (4 unchanged attributes hidden)

      - ip_configuration {
          - name                                               = "primary" -> null
          - primary                                            = true -> null
          - private_ip_address                                 = "10.10.1.4" -> null
          - private_ip_address_allocation                      = "Dynamic" -> null
          - private_ip_address_version                         = "IPv4" -> null
          - public_ip_address_id                               = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/publicIPAddresses/pip-acme-dev-eus2-vm" -> null
          - subnet_id                                          = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload" -> null
            # (1 unchanged attribute hidden)
        }
    }

  # azurerm_public_ip.vm[0] will be destroyed
  - resource "azurerm_public_ip" "vm" {
      - allocation_method       = "Static" -> null
      - ddos_protection_mode    = "VirtualNetworkInherited" -> null
      - id                      = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/publicIPAddresses/pip-acme-dev-eus2-vm" -> null
      - idle_timeout_in_minutes = 4 -> null
      - ip_address              = "20.7.151.151" -> null
      - ip_tags                 = {} -> null
      - ip_version              = "IPv4" -> null
      - location                = "eastus2" -> null
      - name                    = "pip-acme-dev-eus2-vm" -> null
      - resource_group_name     = "rg-acme-dev-eus2" -> null
      - sku                     = "Standard" -> null
      - sku_tier                = "Regional" -> null
      - tags                    = {
          - "environment"     = "dev"
          - "location"        = "eastus2"
          - "managed_by"      = "terraform"
          - "project"         = "acme"
          - "release_channel" = "development"
          - "repository"      = "azure-terraform-retrofit"
        } -> null
      - zones                   = [] -> null
        # (1 unchanged attribute hidden)
    }

  # azurerm_resource_group.this will be destroyed
  - resource "azurerm_resource_group" "this" {
      - id         = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2" -> null
      - location   = "eastus2" -> null
      - name       = "rg-acme-dev-eus2" -> null
      - tags       = {
          - "environment"     = "dev"
          - "location"        = "eastus2"
          - "managed_by"      = "terraform"
          - "project"         = "acme"
          - "release_channel" = "development"
          - "repository"      = "azure-terraform-retrofit"
        } -> null
        # (1 unchanged attribute hidden)
    }

  # azurerm_storage_account.this will be destroyed
  - resource "azurerm_storage_account" "this" {
      - access_tier                        = "Hot" -> null
      - account_kind                       = "StorageV2" -> null
      - account_replication_type           = "LRS" -> null
      - account_tier                       = "Standard" -> null
      - allow_nested_items_to_be_public    = false -> null
      - cross_tenant_replication_enabled   = false -> null
      - default_to_oauth_authentication    = false -> null
      - dns_endpoint_type                  = "Standard" -> null
      - https_traffic_only_enabled         = true -> null
      - id                                 = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Storage/storageAccounts/stacmedeveus22iti3a" -> null
      - infrastructure_encryption_enabled  = false -> null
      - is_hns_enabled                     = false -> null
      - large_file_share_enabled           = false -> null
      - local_user_enabled                 = true -> null
      - location                           = "eastus2" -> null
      - min_tls_version                    = "TLS1_2" -> null
      - name                               = "stacmedeveus22iti3a" -> null
      - nfsv3_enabled                      = false -> null
      - primary_access_key                 = (sensitive value) -> null
      - primary_blob_connection_string     = (sensitive value) -> null
      - primary_blob_endpoint              = "https://stacmedeveus22iti3a.blob.core.windows.net/" -> null
      - primary_blob_host                  = "stacmedeveus22iti3a.blob.core.windows.net" -> null
      - primary_connection_string          = (sensitive value) -> null
      - primary_dfs_endpoint               = "https://stacmedeveus22iti3a.dfs.core.windows.net/" -> null
      - primary_dfs_host                   = "stacmedeveus22iti3a.dfs.core.windows.net" -> null
      - primary_file_endpoint              = "https://stacmedeveus22iti3a.file.core.windows.net/" -> null
      - primary_file_host                  = "stacmedeveus22iti3a.file.core.windows.net" -> null
      - primary_location                   = "eastus2" -> null
      - primary_queue_endpoint             = "https://stacmedeveus22iti3a.queue.core.windows.net/" -> null
      - primary_queue_host                 = "stacmedeveus22iti3a.queue.core.windows.net" -> null
      - primary_table_endpoint             = "https://stacmedeveus22iti3a.table.core.windows.net/" -> null
      - primary_table_host                 = "stacmedeveus22iti3a.table.core.windows.net" -> null
      - primary_web_endpoint               = "https://stacmedeveus22iti3a.z20.web.core.windows.net/" -> null
      - primary_web_host                   = "stacmedeveus22iti3a.z20.web.core.windows.net" -> null
      - public_network_access_enabled      = true -> null
      - queue_encryption_key_type          = "Service" -> null
      - resource_group_name                = "rg-acme-dev-eus2" -> null
      - secondary_access_key               = (sensitive value) -> null
      - secondary_connection_string        = (sensitive value) -> null
      - sftp_enabled                       = false -> null
      - shared_access_key_enabled          = true -> null
      - table_encryption_key_type          = "Service" -> null
      - tags                               = {
          - "environment"     = "dev"
          - "location"        = "eastus2"
          - "managed_by"      = "terraform"
          - "project"         = "acme"
          - "release_channel" = "development"
          - "repository"      = "azure-terraform-retrofit"
        } -> null
        # (57 unchanged attributes hidden)

      - blob_properties {
          - change_feed_enabled           = false -> null
          - change_feed_retention_in_days = 0 -> null
          - last_access_time_enabled      = false -> null
          - versioning_enabled            = false -> null
            # (1 unchanged attribute hidden)
        }

      - queue_properties {
          - hour_metrics {
              - enabled               = false -> null
              - include_apis          = false -> null
              - retention_policy_days = 0 -> null
              - version               = "1.0" -> null
            }
          - logging {
              - delete                = false -> null
              - read                  = false -> null
              - retention_policy_days = 0 -> null
              - version               = "1.0" -> null
              - write                 = false -> null
            }
          - minute_metrics {
              - enabled               = false -> null
              - include_apis          = false -> null
              - retention_policy_days = 0 -> null
              - version               = "1.0" -> null
            }
        }

      - share_properties {
          - retention_policy {
              - days = 7 -> null
            }
        }
    }

  # azurerm_storage_container.this will be destroyed
  - resource "azurerm_storage_container" "this" {
      - container_access_type             = "private" -> null
      - default_encryption_scope          = "$account-encryption-key" -> null
      - encryption_scope_override_enabled = true -> null
      - has_immutability_policy           = false -> null
      - has_legal_hold                    = false -> null
      - id                                = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Storage/storageAccounts/stacmedeveus22iti3a/blobServices/default/containers/appdata" -> null
      - metadata                          = {} -> null
      - name                              = "appdata" -> null
      - resource_manager_id               = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Storage/storageAccounts/stacmedeveus22iti3a/blobServices/default/containers/appdata" -> null
      - storage_account_id                = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Storage/storageAccounts/stacmedeveus22iti3a" -> null
        # (1 unchanged attribute hidden)
    }

  # random_string.storage_suffix will be destroyed
  - resource "random_string" "storage_suffix" {
      - id          = "2iti3a" -> null
      - length      = 6 -> null
      - lower       = true -> null
      - min_lower   = 0 -> null
      - min_numeric = 0 -> null
      - min_special = 0 -> null
      - min_upper   = 0 -> null
      - number      = true -> null
      - numeric     = true -> null
      - result      = "2iti3a" -> null
      - special     = false -> null
      - upper       = false -> null
    }

  # module.vnet.azurerm_network_security_group.this["workload"] will be destroyed
  - resource "azurerm_network_security_group" "this" {
      - id                  = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkSecurityGroups/nsg-acme-dev-workload" -> null
      - location            = "eastus2" -> null
      - name                = "nsg-acme-dev-workload" -> null
      - resource_group_name = "rg-acme-dev-eus2" -> null
      - security_rule       = [
          - {
              - access                                     = "Allow"
              - description                                = "Allow SSH only from approved admin CIDRs."
              - destination_address_prefix                 = "*"
              - destination_address_prefixes               = []
              - destination_application_security_group_ids = []
              - destination_port_ranges                    = [
                  - "22",
                ]
              - direction                                  = "Inbound"
              - name                                       = "allow-ssh-admin"
              - priority                                   = 100
              - protocol                                   = "Tcp"
              - source_address_prefixes                    = [
                  - "193.19.207.212/32",
                ]
              - source_application_security_group_ids      = []
              - source_port_range                          = "*"
              - source_port_ranges                         = []
                # (2 unchanged attributes hidden)
            },
        ] -> null
      - tags                = {
          - "environment"     = "dev"
          - "location"        = "eastus2"
          - "managed_by"      = "terraform"
          - "project"         = "acme"
          - "release_channel" = "development"
          - "repository"      = "azure-terraform-retrofit"
        } -> null
    }

  # module.vnet.azurerm_network_security_rule.this["workload.allow-ssh-admin"] will be destroyed
  - resource "azurerm_network_security_rule" "this" {
      - access                                     = "Allow" -> null
      - description                                = "Allow SSH only from approved admin CIDRs." -> null
      - destination_address_prefix                 = "*" -> null
      - destination_address_prefixes               = [] -> null
      - destination_application_security_group_ids = [] -> null
      - destination_port_ranges                    = [
          - "22",
        ] -> null
      - direction                                  = "Inbound" -> null
      - id                                         = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkSecurityGroups/nsg-acme-dev-workload/securityRules/allow-ssh-admin" -> null
      - name                                       = "allow-ssh-admin" -> null
      - network_security_group_name                = "nsg-acme-dev-workload" -> null
      - priority                                   = 100 -> null
      - protocol                                   = "Tcp" -> null
      - resource_group_name                        = "rg-acme-dev-eus2" -> null
      - source_address_prefixes                    = [
          - "193.19.207.212/32",
        ] -> null
      - source_application_security_group_ids      = [] -> null
      - source_port_range                          = "*" -> null
      - source_port_ranges                         = [] -> null
        # (2 unchanged attributes hidden)
    }

  # module.vnet.azurerm_subnet.this["private"] will be destroyed
  - resource "azurerm_subnet" "this" {
      - address_prefixes                              = [
          - "10.10.2.0/24",
        ] -> null
      - default_outbound_access_enabled               = true -> null
      - id                                            = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-private" -> null
      - name                                          = "snet-acme-dev-private" -> null
      - private_endpoint_network_policies             = "Disabled" -> null
      - private_link_service_network_policies_enabled = true -> null
      - resource_group_name                           = "rg-acme-dev-eus2" -> null
      - service_endpoint_policy_ids                   = [] -> null
      - service_endpoints                             = [
          - "Microsoft.Storage",
        ] -> null
      - virtual_network_name                          = "vnet-acme-dev-eastus2" -> null
        # (1 unchanged attribute hidden)
    }

  # module.vnet.azurerm_subnet.this["workload"] will be destroyed
  - resource "azurerm_subnet" "this" {
      - address_prefixes                              = [
          - "10.10.1.0/24",
        ] -> null
      - default_outbound_access_enabled               = true -> null
      - id                                            = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload" -> null
      - name                                          = "snet-acme-dev-workload" -> null
      - private_endpoint_network_policies             = "Disabled" -> null
      - private_link_service_network_policies_enabled = true -> null
      - resource_group_name                           = "rg-acme-dev-eus2" -> null
      - service_endpoint_policy_ids                   = [] -> null
      - service_endpoints                             = [
          - "Microsoft.Storage",
        ] -> null
      - virtual_network_name                          = "vnet-acme-dev-eastus2" -> null
        # (1 unchanged attribute hidden)
    }

  # module.vnet.azurerm_subnet_network_security_group_association.this["workload"] will be destroyed
  - resource "azurerm_subnet_network_security_group_association" "this" {
      - id                        = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload" -> null
      - network_security_group_id = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkSecurityGroups/nsg-acme-dev-workload" -> null
      - subnet_id                 = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload" -> null
    }

  # module.vnet.azurerm_virtual_network.this will be destroyed
  - resource "azurerm_virtual_network" "this" {
      - address_space                  = [
          - "10.10.0.0/16",
        ] -> null
      - dns_servers                    = [] -> null
      - flow_timeout_in_minutes        = 0 -> null
      - guid                           = "1b43f9f6-1df4-46e7-b6b1-611f81fbd7c2" -> null
      - id                             = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2" -> null
      - location                       = "eastus2" -> null
      - name                           = "vnet-acme-dev-eastus2" -> null
      - private_endpoint_vnet_policies = "Disabled" -> null
      - resource_group_name            = "rg-acme-dev-eus2" -> null
      - subnet                         = [
          - {
              - address_prefixes                              = [
                  - "10.10.1.0/24",
                ]
              - default_outbound_access_enabled               = true
              - delegation                                    = []
              - id                                            = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload"
              - name                                          = "snet-acme-dev-workload"
              - private_endpoint_network_policies             = "Disabled"
              - private_link_service_network_policies_enabled = true
              - security_group                                = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkSecurityGroups/nsg-acme-dev-workload"
              - service_endpoint_policy_ids                   = []
              - service_endpoints                             = [
                  - "Microsoft.Storage",
                ]
                # (1 unchanged attribute hidden)
            },
          - {
              - address_prefixes                              = [
                  - "10.10.2.0/24",
                ]
              - default_outbound_access_enabled               = true
              - delegation                                    = []
              - id                                            = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-private"
              - name                                          = "snet-acme-dev-private"
              - private_endpoint_network_policies             = "Disabled"
              - private_link_service_network_policies_enabled = true
              - service_endpoint_policy_ids                   = []
              - service_endpoints                             = [
                  - "Microsoft.Storage",
                ]
                # (2 unchanged attributes hidden)
            },
        ] -> null
      - tags                           = {
          - "environment"     = "dev"
          - "location"        = "eastus2"
          - "managed_by"      = "terraform"
          - "project"         = "acme"
          - "release_channel" = "development"
          - "repository"      = "azure-terraform-retrofit"
        } -> null
        # (2 unchanged attributes hidden)
    }

Plan: 0 to add, 0 to change, 13 to destroy.

Changes to Outputs:
  - environment            = "dev" -> null
  - resource_group_name    = "rg-acme-dev-eus2" -> null
  - storage_account_name   = "stacmedeveus22iti3a" -> null
  - storage_container_name = "appdata" -> null
  - subnet_ids             = {
      - private  = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-private"
      - workload = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload"
    } -> null
  - vm_id                  = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Compute/virtualMachines/vm-acme-dev-eus2" -> null
  - vm_name                = "vm-acme-dev-eus2" -> null
  - vm_private_ip          = "10.10.1.4" -> null
  - vm_public_ip           = "20.7.151.151" -> null
  - vnet_id                = "/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2" -> null
  - vnet_name              = "vnet-acme-dev-eastus2" -> null

Do you really want to destroy all resources in workspace "dev"?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

module.vnet.azurerm_subnet_network_security_group_association.this["workload"]: Destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload]
azurerm_storage_container.this: Destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Storage/storageAccounts/stacmedeveus22iti3a/blobServices/default/containers/appdata]
module.vnet.azurerm_network_security_rule.this["workload.allow-ssh-admin"]: Destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkSecurityGroups/nsg-acme-dev-workload/securityRules/allow-ssh-admin]
azurerm_linux_virtual_machine.this: Destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Compute/virtualMachines/vm-acme-dev-eus2]
azurerm_storage_container.this: Destruction complete after 1s
azurerm_storage_account.this: Destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Storage/storageAccounts/stacmedeveus22iti3a]
azurerm_storage_account.this: Destruction complete after 3s
random_string.storage_suffix: Destroying... [id=2iti3a]
random_string.storage_suffix: Destruction complete after 0s
module.vnet.azurerm_subnet_network_security_group_association.this["workload"]: Destruction complete after 6s
module.vnet.azurerm_network_security_rule.this["workload.allow-ssh-admin"]: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-...workload/securityRules/allow-ssh-admin, 00m10s elapsed]
azurerm_linux_virtual_machine.this: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-...mpute/virtualMachines/vm-acme-dev-eus2, 00m10s elapsed]
module.vnet.azurerm_network_security_rule.this["workload.allow-ssh-admin"]: Destruction complete after 12s
module.vnet.azurerm_network_security_group.this["workload"]: Destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkSecurityGroups/nsg-acme-dev-workload]
azurerm_linux_virtual_machine.this: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-...mpute/virtualMachines/vm-acme-dev-eus2, 00m20s elapsed]
module.vnet.azurerm_network_security_group.this["workload"]: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-...rkSecurityGroups/nsg-acme-dev-workload, 00m10s elapsed]
module.vnet.azurerm_network_security_group.this["workload"]: Destruction complete after 12s
azurerm_linux_virtual_machine.this: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-...mpute/virtualMachines/vm-acme-dev-eus2, 00m30s elapsed]
azurerm_linux_virtual_machine.this: Destruction complete after 37s
azurerm_network_interface.vm: Destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/networkInterfaces/nic-acme-dev-eus2-vm]
azurerm_network_interface.vm: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-...networkInterfaces/nic-acme-dev-eus2-vm, 00m10s elapsed]
azurerm_network_interface.vm: Destruction complete after 13s
module.vnet.azurerm_subnet.this["workload"]: Destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-workload]
module.vnet.azurerm_subnet.this["private"]: Destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2/subnets/snet-acme-dev-private]
azurerm_public_ip.vm[0]: Destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/publicIPAddresses/pip-acme-dev-eus2-vm]
module.vnet.azurerm_subnet.this["workload"]: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-...eastus2/subnets/snet-acme-dev-workload, 00m10s elapsed]
module.vnet.azurerm_subnet.this["private"]: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-...-eastus2/subnets/snet-acme-dev-private, 00m10s elapsed]
azurerm_public_ip.vm[0]: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-...publicIPAddresses/pip-acme-dev-eus2-vm, 00m10s elapsed]
module.vnet.azurerm_subnet.this["workload"]: Destruction complete after 11s
azurerm_public_ip.vm[0]: Destruction complete after 12s
module.vnet.azurerm_subnet.this["private"]: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-...-eastus2/subnets/snet-acme-dev-private, 00m20s elapsed]
module.vnet.azurerm_subnet.this["private"]: Destruction complete after 22s
module.vnet.azurerm_virtual_network.this: Destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2/providers/Microsoft.Network/virtualNetworks/vnet-acme-dev-eastus2]
module.vnet.azurerm_virtual_network.this: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-.../virtualNetworks/vnet-acme-dev-eastus2, 00m10s elapsed]
module.vnet.azurerm_virtual_network.this: Destruction complete after 11s
azurerm_resource_group.this: Destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-6eb3494bcf2e/resourceGroups/rg-acme-dev-eus2]
azurerm_resource_group.this: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-...4bcf2e/resourceGroups/rg-acme-dev-eus2, 00m10s elapsed]
azurerm_resource_group.this: Still destroying... [id=/subscriptions/4d110979-de81-47ca-ae8e-...4bcf2e/resourceGroups/rg-acme-dev-eus2, 00m20s elapsed]
azurerm_resource_group.this: Destruction complete after 23s
Releasing state lock. This may take a few moments...

Destroy complete! Resources: 13 destroyed.
```

Completed in 6m 50s
