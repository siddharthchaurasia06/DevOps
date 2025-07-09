data "azurerm_key_vault" "land-dev" {
  name                = "lpa"
  resource_group_name = "rg31"
  
}

data "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "adminPassword"
  key_vault_id = data.azurerm_key_vault.land-dev.id
}

resource "azurerm_mssql_server" "mssqlserverlundev" {
  name                         = "siddharthkaserver2208"
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladminuser"
  administrator_login_password = data.azurerm_key_vault_secret.sql_admin_password.value
  #minimum_tls_version          = "1.2"
  #azuread_authentication_only  = false  # Explicitly use SQL Authentication (optional)
  
}

