
resource "azurerm_subnet" "subnet" {
  name = var.name
  virtual_network_name =var.vnet
  address_prefixes = var.address_prefixes
  resource_group_name=var.rg
}