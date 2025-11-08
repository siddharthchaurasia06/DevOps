# module "resource_group" {
#   source = "../modules/azurerm_resource_group"

#     resource_group_name     = "rg-devops-001"
#     resource_group_location = "East US"

# }

# module "vnet" {
#   depends_on = [module.resource_group]
#   source     = "../modules/azurerm_virtual_network"
#   vnets      = var.vnets
# }

# module "vms" {
#   depends_on = [module.vnet, module.resource_group]
#   source     = "../modules/azurerm_vertual_machines"
#   vms        = var.vms
  
# }
