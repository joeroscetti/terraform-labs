variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
}

variable "location" {
  description = "Azure region where the VNet will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name          = string
    address_prefix = string
  }))
  
  # Default subnets
  default = [
    {
      name          = "default-subnet1"
      address_prefix = "10.0.1.0/24"
    },
    {
      name          = "default-subnet2"
      address_prefix = "10.0.2.0/24"
    }
  ]
}
