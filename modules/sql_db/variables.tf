variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL Server."
  type        = string
}

variable "administrator_login" {
  description = "The administrator login name for the SQL Server."
  type        = string
}

variable "administrator_login_password" {
  description = "The password for the SQL Server administrator."
  type        = string
  sensitive   = true
}

variable "database_names" {
  description = "A list of names for the SQL Databases."
  type        = list(string)
}

variable "key_vault_id" {
  description = "A list of names for the SQL Databases."
  type        = string
}




