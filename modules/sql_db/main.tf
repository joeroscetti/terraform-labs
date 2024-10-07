provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_sql_server" "this" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.this.name
  location                     = azurerm_resource_group.this.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_sql_database" "this" {
  count               = length(var.database_names)
  name                = var.database_names[count.index]
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  server_name         = azurerm_sql_server.this.name
  requested_service_objective_name = var.service_objective

  backup_retention_days = 7
  geo_redundant_backup  = "Enabled"  # Optional: Set to "Disabled" if not required
}
