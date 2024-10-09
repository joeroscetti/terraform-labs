data "azurerm_key_vault_secret" "sql_admin_username" {
  name          = "db-admin-username"
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "sql_admin_password" {
  name          = "db-admin-password"
  key_vault_id = var.key_vault_id
}

resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_sql_database" "sql_database" {
  count               = length(var.database_names)
  name                = var.database_names[count.index]
  resource_group_name = azurerm_resource_group.sql_server.name
  location            = azurerm_resource_group.sql_server.location
  server_name         = azurerm_sql_server.sql_server.name
  sku_name = "Basic"
}
