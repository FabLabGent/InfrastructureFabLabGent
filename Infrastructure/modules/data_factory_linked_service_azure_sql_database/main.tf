resource "azurerm_data_factory_linked_service_azure_sql_database" "adf_ls_sql" {
  name                = var.data_factory_linked_service_azure_sql_database_name
  resource_group_name = var.resource_group_name
  data_factory_name   = var.data_factory_name 
  connection_string   = var.connection_string
} 