resource "azurerm_data_factory" "df" {
  name                = var.data_factory_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}