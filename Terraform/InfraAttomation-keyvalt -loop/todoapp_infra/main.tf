# module "resource_group" {
#   source                  = "../modules/azurerm_resource_group"
#   resource_group_name     = var.rg_name
#   resource_group_location = var.location
# }

# module "virtual_network" {
#   depends_on = [module.resource_group]
#   source     = "../modules/azurerm_virtual_network"

#   virtual_network_name     = "sid-vnet"
#   virtual_network_location = var.location
#   resource_group_name      = var.rg_name
#   address_space            = ["10.0.0.0/16"]
# }

# module "subnet" {
#   depends_on = [module.virtual_network]
#   source     = "../modules/azurerm_subnet"

#   resource_group_name  = var.rg_name
#   virtual_network_name = "sid-vnet"
#   subnet = {
#     frontend = {
#       subnet_name          = "frontend-subnet"
#       address_prefixes     = ["10.0.1.0/24"]
#     }
#     backend = {
#       subnet_name          = "backend-subnet"
#       address_prefixes     = ["10.0.2.0/24"]
#     }
#   } 
# }



# module "public_ip" {
#   depends_on = [ module.subnet ]

#   source              = "../modules/azurerm_public_ip"
#   public_ip_name      = {
#     frontend = "pip-todoapp1"
#     backend  = "pip-todoapp2"
#   }
#   resource_group_name = var.rg_name
#   location            = var.location
#   allocation_method   = "Static"
# }




# module "nic" {
#   depends_on = [module.subnet, module.public_ip]
#   source     = "../modules/azurerm_nic"

#   resource_group_name  = var.rg_name
#   location             = var.location
#   virtual_network_name = "sid-vnet"
#   nic = {
#     frontend = {
#       nic_name             = "nic-vm-frontend"
#       subnet_name          = "frontend-subnet"
#       public_ip_name       = "pip-todoapp1"
#     }
#     backend = {
#       nic_name             = "nic-vm-backend"
#       subnet_name          = "backend-subnet"
#       public_ip_name       = "pip-todoapp2"
#     }
#   }
# }



# # # # #HomeWork - Ye upr wala public IP ko frontend VM ke sath attach karna hai

# module "vm" {
#   depends_on = [module.subnet, module.nic]
#   source     = "../modules/azurerm_virtual_machine"

#   resource_group_name = var.rg_name
#   location            = var.location
#   vm_size             = "Standard_B1s"
#   image_publisher     = "Canonical"
#   image_offer         = "0001-com-ubuntu-server-focal"
#   image_sku           = "20_04-lts"
#   image_version       = "latest"
#   vm= {
#     frontend = {
#       vm_name             = "sidVM1"
#       admin_username      = "sidVM1"
#       admin_password      = "Sid@12345678"
#       nic_name            = "nic-vm-frontend"
#     }
#     backend = {
#       vm_name             = "sidVM2"
#       admin_username      = "sidVM2"
#       admin_password      = "Sid@12345678"
#       nic_name            = "nic-vm-backend"
#     }
#   }
  
# }



# module "secret" {
#   source = "../modules/azurerm_key_vault_secret"

# #   key_vault_name = "lpa"
# #   secret_name
  
# }

# module "sql_server" {
# # module "sql_server" {
#   depends_on = [module.resource_group, module.secret]
#   source = "../modules/azurerm_sql_server"

#   rg_name   = var.rg_name
#   location  = var.location   
# }

