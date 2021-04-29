resource "azurerm_storage_blob" "bs" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.sc.name
  type                   = var.blob_type
  source                 = var.blob_source
}