resource "azurerm_public_ip" "this" {
  for_each = {
    for k, v in var.vms : k => v if v.enable_public_ip
  }

  name                = "${each.key}-pip"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}
