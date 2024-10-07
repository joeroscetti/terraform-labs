provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

module "sql_db" {
  source                    = "../../modules/sql_db"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sql_server_name          = var.sql_server_name
  administrator_login      = var.administrator_login
  administrator_login_password = var.administrator_login_password
  database_names           = var.database_names
  service_objective        = var.service_objective
}

