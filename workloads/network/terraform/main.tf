# main.tf

provider "azurerm" {
  features {}
}

# Remote state configuration


resource "azurerm_resource_group" "github_network" {
  name     = "github_network"
  location = "East US"
}

module "vnet" {
  source              = "../../../modules/network"
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
 
}