resource "azurerm_key_vault" "keyvault" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.resource_group_name
   sku_name           = var.sku_name
   tenant_id          = var.tenant_id
    public_network_access_enabled  = var.public_network_access_enabled

    access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id  # The Object ID of your service principal

    secret_permissions = [
      "Get",  # Allow getting secrets
      "Set",  # Allow setting secrets (optional)
      # You can add more permissions as needed
    ]

    key_permissions = [
      "Get",  # Allow getting keys (if needed)
      "List", # Allow listing keys (if needed)
      # You can add more permissions as needed
    ]

    certificate_permissions = [
      "Get",  # Allow getting certificates (if needed)
      # You can add more permissions as needed
    ]
  }
}
