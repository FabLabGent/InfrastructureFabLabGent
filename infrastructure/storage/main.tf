resource "azurerm_storage_account" "sa" {
  name                     = var.name_storage_account
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  primary_blob_connection_string = var.primary_connection_string
}

resource "azurerm_storage_container" "sc" {
  name                  = var.name_storage_container
  storage_account_name  = azurerm_storage_account.sa.name_storage_account
  container_access_type = "private"
}

resource "azurerm_storage_blob" "sb" {
  name                   = var.name_storage_blob
  storage_account_name   = azurerm_storage_account.sa.name_storage_account
  storage_container_name = azurerm_storage_container.sc.name_storage_container
  type                   = "Block"
  source                 = "some-local-file.zip"
}