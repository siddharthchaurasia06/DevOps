resource "azurerm_key_vault_secret" "secret-land-dev" {
    name= "adminPassword"
    value = "Sid@12345678"
    key_vault_id = data.azurerm_key_vault.land-dev.id
  
}