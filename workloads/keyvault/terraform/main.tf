# main.tf

provider "azurerm" {
  features {}
}

# Remote state configuration
terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "github_keyvault" {
  name     = "github_keyvault"
  location = "East US"
}

