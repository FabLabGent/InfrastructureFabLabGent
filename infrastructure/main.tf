terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "1.38.0"
    }
}
} 

provider "azurerm" {
    features {}
    skip_provider_registration = true
}

resource "azurerm_resource_group" "FabLab" {
    
}