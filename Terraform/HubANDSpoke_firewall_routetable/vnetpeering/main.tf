
resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                      = var.peering_name1
  resource_group_name       = var.resource_group_name_hub
  virtual_network_name      = var.hubvnet
  remote_virtual_network_id = data.azurerm_virtual_network.spoke.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = var.peering_name2
  resource_group_name       = var.resource_group_name_spoke
  virtual_network_name      = var.spokevnet
  remote_virtual_network_id = data.azurerm_virtual_network.hub.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}