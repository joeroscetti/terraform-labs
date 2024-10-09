data "azurerm_key_vault_secret" "sql_admin_username" {
  name          = "db-admin-username"
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "sql_admin_password" {
  name          = "db-admin-password"
  key_vault_id = var.key_vault_id
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_mssql_database" "sql_database" {
  count               = length(var.database_names)
  name                = var.database_names[count.index]
  server_id         = azurerm_mssql_server.sql_server.id
  sku_name = "Basic"
}
