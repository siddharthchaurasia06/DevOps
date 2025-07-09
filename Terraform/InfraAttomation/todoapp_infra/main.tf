module "resource_group" {
  source                  = "../modules/azurerm_resource_group"
  resource_group_name     = "rg-sid2"
  resource_group_location = "centralindia"
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../modules/azurerm_virtual_network"

  virtual_network_name     = "sid-vnet"
  virtual_network_location = "centralindia"
  resource_group_name      = "rg-sid2"
  address_space            = ["10.0.0.0/16"]
}

module "frontend_subnet" {
  depends_on = [module.virtual_network]
  source     = "../modules/azurerm_subnet"

  resource_group_name  = "rg-sid2"
  virtual_network_name = "sid-vnet"
  subnet_name          = "frontend-subnet"
  address_prefixes     = ["10.0.1.0/24"]
}

module "backend_subnet" {
  depends_on = [module.virtual_network]
  source     = "../modules/azurerm_subnet"

  resource_group_name  = "rg-sid2"
  virtual_network_name = "sid-vnet"
  subnet_name          = "backend-subnet"
  address_prefixes     = ["10.0.2.0/24"]
}


# module "public_ip" {
#   count = 2
#   source              = "../modules/azurerm_public_ip"
#   public_ip_name      = "pip-todoapp${count.index + 1}"
#   resource_group_name = "rg-sid2"
#   location            = "centralindia"
#   allocation_method   = "Static"
# }




# #HomeWork - Ye upr wala public IP ko frontend VM ke sath attach karna hai

# module "frontend_vm" {
#   depends_on = [module.frontend_subnet]
#   source     = "../modules/azurerm_virtual_machine"

#   resource_group_name = "rg-sid2"
#   location            = "centralindia"
#   vm_name             = "sidVM1"
#   vm_size             = "Standard_B1s"
#   admin_username      = "sidVM1"
#   admin_password      = "Sid@12345678"
#   image_publisher     = "Canonical"
#   image_offer         = "0001-com-ubuntu-server-focal"
#   image_sku           = "20_04-lts"
#   image_version       = "latest"
#   nic_name            = "nic-vm-frontend"
#   pip_id              = "/subscriptions/f569e8dc-40e1-4d01-9de4-e79fd05beaa6/resourceGroups/rg-sid2/providers/Microsoft.Network/publicIPAddresses/pip-todoapp1"
#   subnet_id           = "/subscriptions/f569e8dc-40e1-4d01-9de4-e79fd05beaa6/resourceGroups/rg-sid2/providers/Microsoft.Network/virtualNetworks/sid-vnet/subnets/frontend-subnet"
# }

# module "backend_vm" {
#   depends_on = [module.backend_subnet]
#   source     = "../modules/azurerm_virtual_machine"

#   resource_group_name = "rg-sid2"
#   location            = "centralindia"
#   vm_name             = "sidVM2"
#   vm_size             = "Standard_B1s"
#   admin_username      = "sidVM2"
#   admin_password      = "Sid@12345678"
#   image_publisher     = "Canonical"
#   image_offer         = "0001-com-ubuntu-server-focal"
#   image_sku           = "20_04-lts"
#   image_version       = "latest"
#   nic_name            = "nic-vm-backend"
#   pip_id              = "/subscriptions/f569e8dc-40e1-4d01-9de4-e79fd05beaa6/resourceGroups/rg-sid2/providers/Microsoft.Network/publicIPAddresses/pip-todoapp2"
#   subnet_id           = "/subscriptions/f569e8dc-40e1-4d01-9de4-e79fd05beaa6/resourceGroups/rg-sid2/providers/Microsoft.Network/virtualNetworks/sid-vnet/subnets/backend-subnet"
# }

