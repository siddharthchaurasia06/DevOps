variable "rg_name" {
  description = "The name of the resource group where the SQL server will be created."
  type        = string
  
}

variable "location" {
  description = "The Azure region where the SQL server will be created."
  type        = string
}   
