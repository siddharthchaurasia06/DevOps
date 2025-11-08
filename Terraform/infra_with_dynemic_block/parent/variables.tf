variable "vnets" {
  type = map(object({
        name=string
        location=string
        resource_group_name=string
        address_space       = list(string)
    dns_servers         = list(string)
    subnets = list(object({
      name              = string
      address_prefixes  = list(string)
    }))
  }))
  
}

variable "vms" {
    type = map(object({
        subnet_name=string
        vnet_name=string
        resource_group_name=string
        nic_name=string
        location=string
        ip_configurations=list(object({
            name=string
            private_ip_address_allocation=string
        }))
        
        vm_name=string
        vm_size =string
        publisher = string
        offer     = string
        sku       = string
        version   = string

        os_disk_name      = string
        caching           = string
        create_option     = string
        managed_disk_type = string
        
        computer_name  = string
        admin_username = string
        admin_password = string
  
  }))
}