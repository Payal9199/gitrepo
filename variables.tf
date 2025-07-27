variable "location" {
  description = "The Azure region to deploy the PostgreSQL Flexible Server"
  type        = string
}

variable "name" {
  description = "The name of the PostgreSQL Flexible Server"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "server_version" {
  description = "The PostgreSQL server version"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the PostgreSQL server"
  type        = string
}

variable "storage_mb" {
  description = "The max storage size in MB"
  type        = number
}

variable "storage_tier" {
  description = "The storage tier (e.g., 'P4', 'P6')"
  type        = string
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
}

variable "geo_redundant_backup_enabled" {
  description = "Enable geo-redundant backups"
  type        = bool
}

variable "zone" {
  description = "The availability zone"
  type        = string
}

variable "public_network_access_enabled" {
  description = "Enable public network access"
  type        = bool
}

variable "delegated_subnet_id" {
  description = "The ID of the delegated subnet"
  type        = string
}

variable "private_dns_zone_id" {
  description = "The ID of the private DNS zone for the server"
  type        = string
}

variable "administrator_login" {
  description = "The administrator username"
  type        = string
}

variable "administrator_password" {
  description = "The administrator username"
  type = string
  sensitive = true
}

variable "active_directory_auth_enabled" {
  description = "Enable Microsoft Entra ID authentication"
  type        = bool
}

variable "password_auth_enabled" {
  description = "Enable password-based authentication"
  type        = bool
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID"
  type        = string
}

variable "enable_telemetry" {
  description = "Enable telemetry for the module"
  type        = bool
}

variable "high_availability" {
  description = "High availability configuration for PostgreSQL Flexible Server"
  type = object({
    mode                      = string
    standby_availability_zone = number
  })
}

# variable "databases" {
#     description = "Map of databases to create"
#     type = map(object({
#       name = string
#       charset = optional(string,"UTF8")
#       collation = optional(string, "en_US.utf8")
#     }))
# }
# variable "ad_administrator" {
#     description = "list of database administrator"
#     type = map(object({
#         tenant_id = string
#         object_id = string
#         principal_name = string
#         principal_type =string
#     }))
# }