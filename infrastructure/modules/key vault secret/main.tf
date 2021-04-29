resource "azurerm_key_vault_secret" "kvs" {
  name         = var.key_vault_secret_name
  value        = var.key_vault_secret_value
  key_vault_id = azurerm_key_vault.kv.id
}