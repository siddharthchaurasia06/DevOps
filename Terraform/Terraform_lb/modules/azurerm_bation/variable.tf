variable "resource_group_name" {
  description = "The name of the resource group in which to create the Bastion Host."
  type        = string
}

variable "location" {
  description = "The Azure region where the Bastion Host will be created."
  type        = string
}

variable "public_ip_name" {
  description = "The name of the public IP address to associate with the Bastion Host."
  type        = string    
}

variable "subnet_name" {
  description = "The name of the subnet where the Bastion Host will be deployed. Must be 'AzureBastionSubnet'."
  type        = string
  
}

variable "vnet_name" {
  description = "The name of the virtual network where the subnet is located."
  type        = string
}

variable "bation_name" {
  description = "The name of the Bastion Host."
  type        = string
}
