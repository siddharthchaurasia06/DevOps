resource "azurerm_subnet" "subnet" {
  for_each = var.subnet
  name                 = each.value.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}