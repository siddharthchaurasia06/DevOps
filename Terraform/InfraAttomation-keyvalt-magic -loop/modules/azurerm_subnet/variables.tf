variable "resource_group_name" {
  description = "The name of the resource group in which the subnet will be created."
  type        = string  
}

variable "virtual_network_name" {
  description = "The name of the virtual network in which the subnet will be created."
  type        = string  
}


variable "subnet" {
  description = "A map of additional subnet properties."
  type        = map(any)
  
}