variable "project_name" {
  description = "Short project identifier used for naming."
  type        = string
  default     = "acme"
}

variable "admin_username" {
  description = "Admin username for the Linux VM."
  type        = string
  default     = "azureuser"
}

variable "admin_ssh_public_key" {
  description = "SSH public key used for Linux VM access."
  type        = string
  sensitive   = true
}

variable "storage_container_name" {
  description = "Blob container name created in the environment storage account."
  type        = string
  default     = "appdata"
}

variable "ddos_protection_plan_id" {
  description = "Optional DDoS protection plan ID for the VNet."
  type        = string
  default     = null
}

variable "dev_admin_cidrs" {
  description = "CIDR ranges allowed to SSH into the dev VM."
  type        = list(string)
  default     = ["203.0.113.10/32"]
}

variable "prod_admin_cidrs" {
  description = "CIDR ranges allowed to SSH into the prod VM if public ingress is ever enabled."
  type        = list(string)
  default     = []
}

variable "extra_tags" {
  description = "Additional tags applied to all resources."
  type        = map(string)
  default     = {}
}
