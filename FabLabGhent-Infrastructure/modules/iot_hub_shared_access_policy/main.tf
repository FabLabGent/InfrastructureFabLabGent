resource "azurerm_iothub_shared_access_policy" "ioth_sap" {
  name                = var.iothub_shared_access_policy_name
  resource_group_name = var.resource_group_name
  iothub_name         = var.iothub_name

  registry_read   = var.registry_read
  registry_write  = var.registry_write
  device_connect  = var.device_connect
  service_connect = var.service_connect
}