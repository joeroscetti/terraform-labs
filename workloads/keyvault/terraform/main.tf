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

module "keyvault" {
  source              = "../../../modules/keyvault"
  kv_name           = var.kv_name
  location            = azurerm_resource_group.github_keyvault.location
  resource_group_name = azurerm_resource_group.github_keyvault.name
  tenant_id           = var.tenant_id
  object_id           = var.object_id
 
}