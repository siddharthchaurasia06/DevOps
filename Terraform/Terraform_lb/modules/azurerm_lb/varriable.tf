variable "public_ip_name" {
  description = "The name of the public IP address to associate with the load balancer."
  type        = string    
}

variable "resource_group_name" {
  description = "The name of the resource group where the load balancer and public IP are located."
  type        = string
}

variable "location" {
  description = "The Azure region where the load balancer will be created."
  type        = string
}

variable "lb_name" {
  description = "The name of the load balancer."
  type        = string
}

variable "ip_configuration_name" {
  description = "The name of the frontend IP configuration for the load balancer."
  type        = string
}


