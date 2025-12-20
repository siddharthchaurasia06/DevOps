data "azurerm_subnet" "subnet-id" {
  for_each = var.nic
  name                 = each.value.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
}


data "azurerm_public_ip" "pip-data" {
  for_each            = var.nic
  name                = each.value.public_ip_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "nic" {
  for_each = var.nic
  name                = each.value.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet-id[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip-data[each.key].id
  }
}
