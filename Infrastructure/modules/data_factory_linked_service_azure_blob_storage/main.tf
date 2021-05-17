resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf_ls_blob" {
  name                = var.data_factory_linked_service_azure_blob_storage_name
  resource_group_name = var.resource_group_name
  data_factory_name   = var.data_factory_name 
  connection_string   = var.primary_blob_connection_string
} 