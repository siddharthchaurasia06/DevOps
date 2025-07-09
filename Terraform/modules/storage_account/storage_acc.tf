resource "azurerm_storage_account" "Siddharth4"{
  //depends_on = [ azurerm_resource_group.Siddharth2-rg ]
  name                     = "siddharthsa4"
  resource_group_name      = "sid4-rg"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

resource "azurerm_storage_account" "Siddharth5"{
  //depends_on = [ azurerm_resource_group.Siddharth3-rg ]
  name                     = "siddharthsa5"
  resource_group_name      = "sid5-rg"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}
