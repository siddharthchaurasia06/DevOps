variable "rgs" {
    description = "Map of resource groups to create"
    type = map(object(
        {
            rg_name  = string
            location = string
            managed_by = optional(string)
            tags     = optional(map(string))
        }
    ))
}

module "rgs" {
    source = "./modules"
    rgs    = var.rgs
  
}