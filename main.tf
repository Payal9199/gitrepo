module "postgresql-flexible_server" {
  source                        = "Azure/avm-res-dbforpostgresql-flexibleserver/azurerm"
  version                       = "0.1.4"

  location                      = var.location
  name                          = var.name
  resource_group_name           = var.resource_group_name

  server_version                = var.server_version
  sku_name                      = var.sku_name

  storage_mb                    = var.storage_mb
  storage_tier                  = var.storage_tier
  backup_retention_days         = var.backup_retention_days
  geo_redundant_backup_enabled  = var.geo_redundant_backup_enabled
  zone                          = var.zone

  public_network_access_enabled = var.public_network_access_enabled
  delegated_subnet_id           = var.delegated_subnet_id

  private_dns_zone_id           = var.private_dns_zone_id
  private_endpoints_manage_dns_zone_group = true

  administrator_login           = var.administrator_login
  administrator_password        = var.administrator_password

  authentication                = {
    active_directory_auth_enabled = var.active_directory_auth_enabled
    password_auth_enabled         = var.password_auth_enabled
    tenant_id                     = var.tenant_id
  }
    high_availability = {
    mode                      = var.high_availability.mode
    standby_availability_zone = var.high_availability.standby_availability_zone
  }

  # tags                   = {}
  enable_telemetry = var.enable_telemetry
#   databases = var.databases
# maintenance_window = var.maintenance_window
}


# resource "azurerm_postgresql_active_directory_administrator" "db_admin_roles" {
#   for_each             = var.ad_administrator

#   server_name          = module.postgresql_flexible_server.name
#   resource_group_name  = var.resource_group_name
#   tenant_id            = each.value.tenant_id
#   object_id            = each.value.object_id
#   login                = each.value.login  # Required

#   depends_on = [ module.postgresql_flexible_server ]
# }
