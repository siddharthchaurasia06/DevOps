data "azurerm_virtual_network" "hub" {
  name                = var.hubvnet
  resource_group_name = var.resource_group_name_hub
}

data "azurerm_virtual_network" "spoke" {
  name                = var.spokevnet
  resource_group_name = var.resource_group_name_spoke
}