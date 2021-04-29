resource "azurerm_storage_container" "sc" {
  name                  = var.azurerm_storage_container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = var.azurerm_storage_container_container_access_type
}