resource "azurerm_public_ip" "appgw_pip" {
  name                = "appgw-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
}


resource "azurerm_application_gateway" "appgw" {
  name                = var.application_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = data.azurerm_subnet.appgw_subnet.id
  }

  frontend_port {
    name = "http-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = azurerm_public_ip.appgw_pip.id
  }

  backend_address_pool {
    name         = var.backend_address_pool_name1
    ip_addresses = var.backend_ip_addresses1 # Spoke1 VM Private IP
  }

  backend_address_pool {
    name         = var.backend_address_pool_name2
    ip_addresses = var.backend_ip_addresses2 # Spoke2 VM Private IP
  }

  backend_http_settings {
    name                  = "http-setting1"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  backend_http_settings {
    name                  = "http-setting2"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "listener1"
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name             = "http-port"
    protocol                       = "Http"
  }

  http_listener {
    name                           = "listener2"
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name             = "http-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "rule1"
    rule_type                  = "Basic"
    http_listener_name         = "listener1"
    backend_address_pool_name  = var.backend_address_pool_name1
    backend_http_settings_name = "http-setting1"
    priority                   = var.rule_priority1  
  }

  request_routing_rule {
    name                       = "rule2"
    rule_type                  = "Basic"
    http_listener_name         = "listener2"
    backend_address_pool_name  = var.backend_address_pool_name2
    backend_http_settings_name = "http-setting2"
    priority                   = var.rule_priority2 
  }
}