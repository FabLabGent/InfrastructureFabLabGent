resource "azurerm_sql_database" "sqldb" {
  name                = var.sql_database_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  server_name         = var.server_name 
}