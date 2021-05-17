resource "azurerm_data_factory_linked_service_key_vault" "adf_ls_kv" {
  name                = var.data_factory_linked_service_key_vault_name
  resource_group_name = var.resource_group_name
  data_factory_name   = var.data_factory_name 
  key_vault_id        = var.key_vault_id 
}