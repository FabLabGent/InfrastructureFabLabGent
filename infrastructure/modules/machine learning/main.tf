resource "azurerm_application_insights" "appi" {
  name                = var.application_insights_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = var.application_insights_application_type
}

resource "azurerm_machine_learning_workspace" "mlw" {
  name                    = var.machine_learning_workspace_name
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  application_insights_id = azurerm_application_insights.appi.id
  key_vault_id            = azurerm_key_vault.kv.id
  storage_account_id      = azurerm_storage_account.sa.id

  identity {
    type = "SystemAssigned"
  }
}