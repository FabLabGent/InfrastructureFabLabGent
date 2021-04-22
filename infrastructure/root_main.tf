terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "2.41.0"
    }
}
} 

provider "azurerm" {
    version = "=2.41.0"
    features {}
    skip_provider_registration = true
}

resource "azurerm_resource_group" "FabLab" {
}

