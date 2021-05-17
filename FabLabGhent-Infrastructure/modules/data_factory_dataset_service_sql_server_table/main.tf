resource "azurerm_data_factory_dataset_sql_server_table" "adf_ds_sql" {
  name                = var.data_factory_dataset_sql_server_table_name
  resource_group_name = var.resource_group_name 
  data_factory_name   = var.data_factory_name 
  linked_service_name = var.linked_service_name
}