# main.tf

provider "azurerm" {
  features {}
}

# Remote state configuration
terraform {
  backend "azurerm" {
    resource_group_name   = "Terraform-state"
    storage_account_name  = "terraformstateroscetti"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "github_testing" {
  name     = "github_testing"
  location = "East US"
}