resource "azurerm_public_ip" "pip" {
  for_each = var.public_ip_name
  name                = each.value
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
}