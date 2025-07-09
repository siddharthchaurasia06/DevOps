variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual machine."
  type        = string
}

variable "location" {
  description = "The Azure region where the virtual machine will be created."
  type        = string
}



variable "virtual_network_name" {
  description = "The name of the virtual network where the subnet is located."
  type        = string
}


variable "nic" {
  description = "The name of the network interface."
  type        = map(any)
  
}