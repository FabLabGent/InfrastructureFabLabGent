resource "azurerm_data_factory_pipeline" "adfpipe" {
  name                = var.data_factory_pipeline_name
  resource_group_name = var.resource_group_name 
  data_factory_name   = var.data_factory_name 
}