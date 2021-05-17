resource "azurerm_iothub" "ioth" {
  name                = var.iothub_name
  resource_group_name = var.resource_group_name 
  location = var.resource_group_location 
  sku {
    name     = var.iothub_sku_name
    capacity = var.iothub_sku_capacity
  } 
}