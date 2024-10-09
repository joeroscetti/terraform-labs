variable "kv_name" {
  description = "The name of the kv"
  type        = string
}

variable "location" {
  description = "The location/region where the Key Vault will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the Key Vault. Possible values are 'standard' and 'premium'."
  type        = string
  default     = "standard"  # You can change the default as per your requirements
}

variable "tenant_id" {
  description = "The Tenant ID for the Azure Active Directory that contains the Key Vault and access policies."
  type        = string
}

variable "object_id" {
  description = "The Object ID of the Service Principal or user to whom the Key Vault access policy applies."
  type        = string
}

variable "public_network_access_enabled" {
  description = "allow public network access."
  type        = string
  default     = true
}