variable "location" {}
variable "rg_name" {}


resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}