resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.storage_account_account_tier 
  account_replication_type = var.storage_account_account_replication_type
  account_kind             = var.storage_account_account_kind
}