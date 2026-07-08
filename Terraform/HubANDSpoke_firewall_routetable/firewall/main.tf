
resource "azurerm_firewall_policy" "fw_policy" {
  name                = "fw-policy"
  resource_group_name = var.resource_group_name
  location            = var.location
}



resource "azurerm_public_ip" "example" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}



resource "azurerm_firewall" "example" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  firewall_policy_id = azurerm_firewall_policy.fw_policy.id

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.example.id
    public_ip_address_id = azurerm_public_ip.example.id
  }
}



resource "azurerm_firewall_policy_rule_collection_group" "example" {
  name               = "network-rule-group"
  firewall_policy_id = azurerm_firewall_policy.fw_policy.id
  priority           = 100

  network_rule_collection {
    name     = "allow-rdp-http"
    priority = 100
    action   = "Allow"

    rule {
      name                  = "spoke1tospoke2"
      protocols             = ["Any"]
      source_addresses      = ["10.2.0.0/27"]
      destination_addresses = ["10.3.0.0/27"]
      destination_ports     = ["*"]
    }


    rule {
      name                  = "spoke2tospoke1"
      protocols             = ["Any"]
      source_addresses      = ["10.3.0.0/27"]
      destination_addresses = ["10.2.0.0/27"]
      destination_ports     = ["*"]
    }
  }
}