resource "azurerm_sql_server" "sqls" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.resource_group_location
  version                      = "12.0"
  administrator_login          = var.sql_server_administrator_login
  administrator_login_password = var.sql_server_administrator_login_password

  extended_auditing_policy {
    storage_endpoint                        = var.storage_endpoint
    storage_account_access_key              = var.storage_account_access_key 
    storage_account_access_key_is_secondary = "false"
    retention_in_days                       = 6
  }
}