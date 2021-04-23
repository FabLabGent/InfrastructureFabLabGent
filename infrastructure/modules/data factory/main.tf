resource "azurerm_data_factory" "example" {
  name                = var.name
  location            = azurerm_resource_group.FabLab.location
  resource_group_name = azurerm_resource_group.FabLab.name
}