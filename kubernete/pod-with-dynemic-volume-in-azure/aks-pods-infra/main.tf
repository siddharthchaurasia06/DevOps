# Create a resource group
# resource "azurerm_resource_group" "rg" {
#   name     = "sid-aks-rg2"
#   location = "West US"
# }

# # resource "azurerm_storage_account" "stg" {
# #   name                     = "sidaksstorageaccount"
# #   resource_group_name      = azurerm_resource_group.rg.name
# #   location                 = azurerm_resource_group.rg.location
# #   account_tier             = "Standard"
# #   account_replication_type = "GRS"

# #}
# # Create the Azure Kubernetes Service (AKS) cluster
# resource "azurerm_kubernetes_cluster" "aks" {
#   name                = "sid-aks-cluster"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   dns_prefix          = "freeaks"

#   default_node_pool {
#     name       = "default"
#     node_count = 1
#     vm_size    = "Standard_B2s"  # Smallest VM for cost control
#   }

#   identity {
#     type = "SystemAssigned"
#   }

  
#   network_profile {
#     network_plugin     = "azure"
#     network_policy     = "azure"
#     load_balancer_sku  = "standard"
#   }

#   depends_on = [azurerm_resource_group.rg]

#   tags = {
#     environment = "free"
#   }
# }

