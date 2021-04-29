resource "azurerm_key_vault_key" "kvk" {
  name         = var.key_vault_key_name
  key_vault_id = azurerm_key_vault.kv.id
  key_type     = var.key_vault_key_type
  key_size     = var.key_vault_key_size

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}