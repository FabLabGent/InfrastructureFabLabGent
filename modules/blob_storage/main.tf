resource "azurerm_storage_blob" "bs" {
  name                   = var.blob_name
  storage_account_name   = var.storage_account_name 
  storage_container_name = var.storage_container_name 
  type                   = var.blob_type
  access_tier            = var.blob_access_tier
}