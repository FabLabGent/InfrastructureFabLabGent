resource "azurerm_data_factory_dataset_azure_blob" "adf_ds_blob" {
  name                = var.data_factory_dataset_azure_blob_name
  resource_group_name = var.resource_group_name 
  data_factory_name   = var.data_factory_name
  linked_service_name = var.linked_service_name 
  path                = var.adf_ds_blob_path
  filename            = var.adf_ds_blob_filename
}