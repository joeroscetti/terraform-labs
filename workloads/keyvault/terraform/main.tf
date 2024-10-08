# main.tf

provider "azurerm" {
  features {}
}

# Remote state configuration


resource "azurerm_resource_group" "github_testing" {
  name     = "github_keyvault"
  location = "East US"
}

module "keyvault" {
  source              = "../../../modules/keyvault"
  kv_name           = var.kv_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  object_id           = var.object_id
 
}