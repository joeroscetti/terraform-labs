# main.tf

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

# Remote state configuration
terraform {
  backend "azurerm" {
    resource_group_name   = "my-tfstate-rg"
    storage_account_name  = "mytfstate"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
