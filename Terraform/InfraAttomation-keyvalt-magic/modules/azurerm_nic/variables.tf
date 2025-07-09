variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine."
  type        = string
}

variable "location" {
  description = "The Azure region where the virtual machine will be created."
  type        = string
}

variable "nic_name" {
  description = "The name of the network interface for the virtual machine."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network where the subnet is located."
  type        = string
}

variable "subnet_name" {
  description = "The ID of the subnet where the virtual machine will be deployed."
  type        = string
}

variable "public_ip_name" {
  description = "The ID of the public IP address to associate with the virtual machine."
  type        = string
  
}