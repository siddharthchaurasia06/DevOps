
resource "azurerm_route_table" "spoke_rt" {
  name                = var.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_route" "spoke1_to_spoke2" {
  name                   = var.route_name
  resource_group_name    = var.resource_group_name
  route_table_name       = azurerm_route_table.spoke_rt.name

  address_prefix         = var.address_prefixes
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = var.next_hop_ip_address
}


resource "azurerm_subnet_route_table_association" "spoke_assoc" {
  subnet_id      = data.azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.spoke_rt.id
}
