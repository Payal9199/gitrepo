module "keyvault_general" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.10.0"

  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  tenant_id                       = var.tenant_id
  sku_name                        = var.sku_name
  public_network_access_enabled   = var.public_network_access_enabled
  purge_protection_enabled        = var.purge_protection_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days
  enable_telemetry                = var.enable_telemetry
  legacy_access_policies_enabled = var.legacy_access_policies_enabled

  network_acls = {
    bypass         = var.network_acls.bypass  # Optional: allow Azure services like backup, monitoring
     default_action = var.network_acls.default_action          # Deny all unless explicitly allowed

    ip_rules                   = var.network_acls.ip_rules                 # list(string): your allowed IPs
    virtual_network_subnet_ids = var.network_acls.virtual_network_subnet_ids  # list(string): your allowed subnet IDs
}

  role_assignments =merge(var.role_assignments, {
    # key_vault_administrator = {
    #   role_definition_id_or_name = "Key Vault Admin"
    #   principal_id          = var.deployment_identity_principle_id #client config
    #   description           = "App access to read secrets"
    # }
    # kv_secrets_officer = {
    #     role_definition_id_or_name = "kv secrets officer"
    #     principal_id   = var.deployment_identity_principle_id #client config
    # }
  secrets_user_access = {
    role_definition_id_or_name = "Key Vault Secrets User"
    principal_id         = var.key_vault_principal_id
  }
  kv_secrets_officer = {
    role_definition_id_or_name = "Key Vault Secrets Officer"
    principal_id         = var.key_vault_principal_id
  }
  key_vault_administrator = {
    role_definition_id_or_name = "Key Vault Administrator"
    principal_id         = var.key_vault_principal_id
  }
}
#     cloud_team = {
#         role_definition_id_or_name = ""
#         principal_id = var.principal_id_kv_cloud_team
#     }
  )

#   private_endpoints = {
#     primary = {
#       name                            = var.kv_private_endpoint_name
#       subnet_resource_id              = var.private_endpoint_subnet_id
#       subresource_names               = ["vault"]
#       private_dns_zone_resource_ids   = var.private_dns_zone_resource_ids
#       private_service_connection_name = var.private_service_connection_name
#       network_interface_name          = var.network_interface_name
#       inherit_lock                    = false
#     }
#   }
}

