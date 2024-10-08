resource "azurerm_key_vault" "keyvault" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.resource_group_name
   sku_name           = var.sku_name
   tenant_id          = var.tenant_id

    access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
