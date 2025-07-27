variable "name" {
  description = "Name of the Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "sku_name" {
  description = "SKU of the Key Vault (e.g., standard or premium)"
  type        = string
  default     = "standard"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the Key Vault"
  type        = bool
  default     = false
}

variable "purge_protection_enabled" {
  description = "Enable purge protection"
  type        = bool
  default     = true
}

variable "soft_delete_retention_days" {
  description = "Number of days to retain soft-deleted secrets"
  type        = number
  default     = 90
}

variable "enable_telemetry" {
  description = "Enable telemetry"
  type        = bool
  default     = true
}

variable "legacy_access_policies_enabled" {
  description = "Enable legacy access policies"
  type        = bool
  default     = false
}

variable "network_acls" {
  description = "Network rules for Key Vault access"
  type = object({
    bypass                       = string
    default_action               = string
    ip_rules                     = list(string)
    virtual_network_subnet_ids   = list(string)
  })
}

variable "role_assignments" {
  description = "Base role assignments"
  type = map(object({
    role_definition_id_or_name = string
    principal_id               = string
    description                = optional(string)
  }))
  default = {}
}

variable "key_vault_principal_id" {
  type = string
}

# variable "principal_id_kv_admin" {
#   description = "Principal ID of the Key Vault Administrator"
#   type        = string
# }

# variable "principal_id_kv_secrets_officer" {
#   description = "Principal ID for Secrets Officer"
#   type        = string
# }

# variable "principal_id_kv_cloud_team" {
#   description = "Principal ID of the Cloud Team"
#   type        = string
# }

# # Optional - If you want to use private endpoints in the future
# variable "kv_private_endpoint_name" {
#   description = "Private Endpoint name for Key Vault"
#   type        = string
#   default     = null
# }

# variable "private_endpoint_subnet_id" {
#   description = "Subnet ID where Private Endpoint will be created"
#   type        = string
#   default     = null
# }

# variable "private_dns_zone_resource_ids" {
#   description = "Private DNS Zone resource IDs for PE"
#   type        = list(string)
#   default     = []
# }

# variable "private_service_connection_name" {
#   description = "Name for the private service connection"
#   type        = string
#   default     = null
# }

# variable "network_interface_name" {
#   description = "Name of the network interface used in Private Endpoint"
#   type        = string
#   default     = null
# }