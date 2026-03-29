output "environment" {
  description = "Terraform workspace currently being deployed."
  value       = terraform.workspace
}

output "resource_group_name" {
  description = "Resource group name for the environment."
  value       = azurerm_resource_group.this.name
}

output "vnet_id" {
  description = "Virtual network ID for the environment."
  value       = module.vnet.vnet_id
}

output "vnet_name" {
  description = "Virtual network name for the environment."
  value       = module.vnet.vnet_name
}

output "subnet_ids" {
  description = "Subnet IDs keyed by logical subnet name."
  value       = module.vnet.subnet_ids
}

output "vm_id" {
  description = "Linux VM ID."
  value       = azurerm_linux_virtual_machine.this.id
}

output "vm_name" {
  description = "Linux VM name."
  value       = azurerm_linux_virtual_machine.this.name
}

output "vm_private_ip" {
  description = "Private IP address assigned to the VM."
  value       = azurerm_network_interface.vm.ip_configuration[0].private_ip_address
}

output "vm_public_ip" {
  description = "Public IP address assigned to the VM, if enabled."
  value       = try(azurerm_public_ip.vm[0].ip_address, null)
}

output "storage_account_name" {
  description = "Storage account name for the environment."
  value       = azurerm_storage_account.this.name
}

output "storage_container_name" {
  description = "Blob container name for the environment."
  value       = azurerm_storage_container.this.name
}
