# module "rg" {
#   source = "../../Resource_Group"
#   name = "rg-hub"
#   location = "westus2"
# }
# module "rg1" {
#   source = "../../Resource_Group"
#   name = "rg-spoke1"
#   location = "westus2"
# }
# module "rg2" {
#   source = "../../Resource_Group"
#   name = "rg-spoke2"
#   location = "westus2"
# }

# module "vnet" {
#   depends_on = [ module.rg ]
#   source = "../../Virtual_Network"
#   name = "vnet-hub"
#   location = "westus2"
#   rg="rg-hub"
#   address_space = ["10.1.0.0/24"]
# }

# module "vnet1" {
#   depends_on = [ module.rg1 ]
#   source = "../../Virtual_Network"
#   name = "vnet-spoke1"
#   location = "westus2"
#   rg="rg-spoke1"
#   address_space = ["10.2.0.0/24"]
# }
# module "vnet2" {
#   depends_on = [ module.rg2 ]
#   source = "../../Virtual_Network"
#   name = "vnet-spoke2"
#   location = "westus2"
#   rg="rg-spoke2"
#   address_space = ["10.3.0.0/24"]
# }

# module "vnetpeering" {
#   depends_on = [ module.vnet , module.vnet1 ]
#   source = "../../vnetpeering"
#   peering_name1 = "hub-to-spoke1"
#   peering_name2 = "spoke1-to-hub"
#   resource_group_name_hub = "rg-hub"
#   resource_group_name_spoke = "rg-spoke1"
#   hubvnet = "vnet-hub"
#   spokevnet = "vnet-spoke1"
# }

# module "vnetpeering1" {
#   depends_on = [ module.vnet , module.vnet2 ]
#   source = "../../vnetpeering"
#   peering_name1 = "hub-to-spoke2"
#   peering_name2 = "spoke2-to-hub"
#   resource_group_name_hub = "rg-hub"
#   resource_group_name_spoke = "rg-spoke2"
#   hubvnet = "vnet-hub"
#   spokevnet = "vnet-spoke2"
# }

# module "applicationgateway_subnet" {
#   depends_on = [ module.vnet ]
#   source = "../../subnet"
#   name = "appgw-subnet"
#   address_prefixes = ["10.1.0.64/27"]
#   vnet = "vnet-hub"
#   rg="rg-hub"
# }

# module "subnet" {
#   depends_on = [ module.vnet ]
#   source = "../../subnet"
#   name = "AzureFirewallSubnet"
#   address_prefixes = [ "10.1.0.0/26" ]
#   vnet = "vnet-hub"
#   rg="rg-hub"
# }
# module "subnet1" {
#   depends_on = [ module.vnet1 ]
#   source = "../../subnet"
#   name = "spoke1sbnet"
#   address_prefixes = [ "10.2.0.0/27" ]
#   vnet = "vnet-spoke1"
#   rg="rg-spoke1"
# }
# module "subnet2" {
#   depends_on = [ module.vnet2 ]
#   source = "../../subnet"
#   name = "spoke2subnet"
#   address_prefixes = [ "10.3.0.0/27" ]
#   vnet = "vnet-spoke2"
#   rg="rg-spoke2"
# }

# module "routetable1" {
#     depends_on = [ module.subnet ,module.firewall]
#   source = "../../routetable"
#   route_table_name = "rt-spoke1"
#   route_name = "spoke2-route"
#   location = "westus2"
#   resource_group_name = "rg-spoke1"
#   subnet_name = "spoke1sbnet"
#   Virtual_Network = "vnet-spoke1"
#   address_prefixes = "10.3.0.0/24"
#   next_hop_ip_address = "10.1.0.4"
# }

# module "routetable2" {
#     depends_on = [ module.subnet1 ,module.firewall]
#   source = "../../routetable"
#   route_table_name = "rt-spoke2"
#   route_name = "spoke1-route"
#   location = "westus2"
#   resource_group_name = "rg-spoke2"
#   subnet_name = "spoke2subnet"
#   Virtual_Network = "vnet-spoke2"
#   address_prefixes = "10.2.0.0/24"
#   next_hop_ip_address = "10.1.0.4"
# }


# module "nic" {
#     depends_on = [ module.subnet ,module.nsg]

#   source = "../../nic"
#   location ="westus2"
#   resource_group_name = "rg-spoke1"
#   # nicname = "my-nic${count.index}"
#   nicname = "nic-spoke1"
#   nsgname = "nsg-spoke1"
#   Virtual_Network="vnet-spoke1"
#   subnet_name="spoke1sbnet"

# }

# module "nic1" {
#     depends_on = [ module.subnet1 ,module.nsg1]

#   source = "../../nic"
#   location ="westus2"
#   resource_group_name = "rg-spoke2"
#   # nicname = "my-nic${count.index}"
#   nicname = "nic-spoke2"
#   nsgname = "nsg-spoke2"
#   Virtual_Network="vnet-spoke2"
#   subnet_name="spoke2subnet"

# }


# module "nsg" {
#     depends_on = [ module.rg1 ]
#   source = "../../nsg"
#   name = "nsg-spoke1"
#   rg="rg-spoke1"
#   location = "westus2"
# }

# module "nsg1" {
#     depends_on = [ module.rg2 ]
#   source = "../../nsg"
#   name = "nsg-spoke2"
#   rg="rg-spoke2"
#   location = "westus2"
# }


# module "vm1" {
#     depends_on = [ module.subnet1,module.nic ]

#   source = "../../virtual_machine"
#   nicname = "nic-spoke1"
#   virtual_machine_name= "vm-spoke1"
#   location = "westus2"
#   rg = "rg-spoke1"
#   osdiscname = "myosdisk1"
#   custom_message = "sidharth ji"
# }

# module "vm2" {
#     depends_on = [ module.subnet2,module.nic1 ]

#   source = "../../virtual_machine"
#   nicname = "nic-spoke2"
#   virtual_machine_name= "vm-spoke2"
#   location = "westus2"
#   rg = "rg-spoke2"
#   osdiscname = "myosdisk2"
#   custom_message = "Ashvani Pandey ji"
# }
# # module "lb" {
# #     depends_on = [ module.vm ]
# #   source = "../../loadbalancer"
# #   rg="rg121"
# #   nsgname = "nsg001"
# # }


# module "firewall" {

#   depends_on = [ module.subnet,module.vnetpeering,module.vnetpeering1 ]
#   source = "../../firewall"
#   subnet_name = "AzureFirewallSubnet"
#   Virtual_Network = "vnet-hub"
#   resource_group_name = "rg-hub"
#   firewall_name = "testfirewall"
#   public_ip_name = "testpublicip"
#   location = "westus2"
  
# }


# # module "applicationgateway" {
# #   depends_on = [ module.applicationgateway_subnet,module.vm1,module.vm2 ]
# #   source = "../../applicationGateWay"
# #   subnet_name = "appgw-subnet"
# #   Virtual_Network = "vnet-hub"
# #   resource_group_name = "rg-hub"
# #   application_gateway_name = "testappgw"
# #   public_ip_name = "testpublicip1"
# #   location = "westus2"
# #   backend_address_pool_name1 = "backendpool1"
# #   backend_address_pool_name2 = "backendpool2"
# #   backend_ip_addresses1 = ["10.2.0.4"]
# #   backend_ip_addresses2 = ["10.3.0.4"]
# #   rule_priority1 = 100
# #   rule_priority2 = 200
# # }