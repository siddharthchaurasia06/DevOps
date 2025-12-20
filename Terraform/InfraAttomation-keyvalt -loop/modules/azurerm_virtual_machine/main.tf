
data "azurerm_network_interface" "nic_data" {
  for_each = var.vm
  name                = each.value.nic_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vm
  name                            = each.value.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.nic_data[each.key].id
  ]
  # If you want to use SSH key authentication, you can uncomment the following line

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher # Published ID from Azure Marketplace
    offer     = var.image_offer     # Product ID from Azure Marketplace
    sku       = var.image_sku       # Plan ID from Azure Marketplace
    version   = var.image_version   # Version of the image
  }
}