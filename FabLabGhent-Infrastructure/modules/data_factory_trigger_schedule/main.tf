resource "azurerm_data_factory_trigger_schedule" "adfts" {
  name                = var.data_factory_trigger_schedule_name
  data_factory_name   = var.data_factory_name
  resource_group_name = var.resource_group_name
  pipeline_name       = var.pipeline_name 

  interval  = var.adf_trigger_interval
  frequency = var.adf_trigger_frequency
}