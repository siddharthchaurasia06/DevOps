# module "resource_group" {
#   source                  = "../modules/azurerm_resource_group"
#   resource_group_name     = "rg-sid2"
#   resource_group_location = "northeurope"
# }

# module "virtual_network" {
#   depends_on = [module.resource_group]
#   source     = "../modules/azurerm_virtual_network"

#   virtual_network_name     = "sid-vnet"
#   virtual_network_location = "northeurope"
#   resource_group_name      = "rg-sid2"
#   address_space            = ["10.0.0.0/16"]
# }

# module "subnet1" {
#   depends_on = [module.virtual_network]
#   source     = "../modules/azurerm_subnet"

#   resource_group_name  = "rg-sid2"
#   virtual_network_name = "sid-vnet"
#   subnet_name          = "subnet1"
#   address_prefixes     = ["10.0.1.0/24"]
# }

# module "subnet2" {
#   depends_on = [module.virtual_network]
#   source     = "../modules/azurerm_subnet"

#   resource_group_name  = "rg-sid2"
#   virtual_network_name = "sid-vnet"
#   subnet_name          = "AzureBastionSubnet"
#   address_prefixes     = ["10.0.2.0/24"]
# }


# # module "public_ip1" {
# #   depends_on = [ module.resource_group ]
# #   source              = "../modules/azurerm_public_ip"
# #   public_ip_name      = "pip-lb"
# #   resource_group_name = "rg-sid2"
# #   location            = "northeurope"
# #   allocation_method   = "Static"
# # }

# # module "public_ip2" {
# #   depends_on = [ module.resource_group ]
# #   source              = "../modules/azurerm_public_ip"
# #   public_ip_name      = "pip-bation"
# #   resource_group_name = "rg-sid2"
# #   location            = "northeurope"
# #   allocation_method   = "Static"
# # }

# module "public_ip3" {
#   depends_on = [ module.resource_group ]
#   source              = "../modules/azurerm_public_ip"
#   public_ip_name      = "pip-appgateway"
#   resource_group_name = "rg-sid2"
#   location            = "northeurope"
#   allocation_method   = "Static"
# }




# module "vm" {
#   count = 2
#   depends_on = [module.subnet1]
#   source     = "../modules/azurerm_virtual_machine"

#   resource_group_name = "rg-sid2"
#   location            = "northeurope"
#   vm_name             = "sidVM${count.index + 1}"
#   vm_size             = "Standard_B1s"
#   admin_username      = "sidVM${count.index + 1}"
#   admin_password      = "Sid@12345678"
#   image_publisher     = "Canonical"
#   image_offer         = "0001-com-ubuntu-server-focal"
#   image_sku           = "20_04-lts"
#   image_version       = "latest"
#   nic_name            = "nic-vm${count.index + 1}"  
#   subnet_name         = "subnet1"
#   vnet_name           = "sid-vnet"
#   nsg_name            = "nsg-vm${count.index + 1}"
#   page_content        = "Hello from VM${count.index + 1}"
# }

# # module "bation" {
# #   depends_on = [ module.public_ip2, module.resource_group ,module.subnet2 ]
# #   source     = "../modules/azurerm_bation"

# #   bation_name         = "bation-sid"
# #   location            = "northeurope"
# #   resource_group_name = "rg-sid2"
# #   public_ip_name     = "pip-bation"
# #   subnet_name        = "AzureBastionSubnet"
# #   vnet_name          = "sid-vnet"
# # }

# module "lb" {
#   depends_on = [ module.public_ip1, module.resource_group ,module.vm ]
#   source     = "../modules/azurerm_lb"

#   lb_name              = "lb-sid"
#   location             = "northeurope"
#   resource_group_name  = "rg-sid2"
#   public_ip_name      = "pip-lb"
#   ip_configuration_name = "LoadBalancerFrontEnd"

# }


