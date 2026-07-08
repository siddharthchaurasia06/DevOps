data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.Virtual_Network
  resource_group_name  = var.resource_group_name
}