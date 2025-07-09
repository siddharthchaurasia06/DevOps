
variable "x" {}

variable "y" {}


resource "azurerm_resource_group" "rg" {
  name     = var.x
  location = var.y
}