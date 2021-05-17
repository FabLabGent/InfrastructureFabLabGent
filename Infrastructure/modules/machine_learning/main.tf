resource "azurerm_application_insights" "appi" {
  name                = var.application_insights_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  application_type    = var.application_insights_application_type
}

resource "azurerm_machine_learning_workspace" "mlw" {
  name                    = var.machine_learning_workspace_name
  location                = var.resource_group_location
  resource_group_name     = var.resource_group_name
  application_insights_id = azurerm_application_insights.appi.id
  key_vault_id            = var.key_vault_id
  storage_account_id      = var.storage_account_id 
  identity {
    type = "SystemAssigned"
  }
}