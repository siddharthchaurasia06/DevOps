variable "vms" {
  type = map(object({
    location            = string
    resource_group_name = string
    enable_public_ip    = bool
  }))
}
