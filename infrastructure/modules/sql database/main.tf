resource "azurerm_sql_database" "sqldb" {
  name                = var.sql_database_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.sql_database_location
  server_name         = azurerm_sql_server.sqls.name

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.sa.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.sa.primary_access_key
    storage_account_access_key_is_secondary = var.sql_database_storage_account_access_key_is_secondary
    retention_in_days                       = var.sql_database_retention_in_days
  }
}