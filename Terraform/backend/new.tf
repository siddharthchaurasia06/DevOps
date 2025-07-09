terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }
  backend "azurerm" {     
     resource_group_name = "sid1-rg"                            
     storage_account_name = "siddharthsa11"                              
     container_name       = "sid"                               
     key                  = "sid.tfstate"                
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "e2b21bd3-23b3-43c2-a854-a8c3e3fad269"

}



resource "azurerm_resource_group" "Siddharth2-rg"{
  name     = "sid2-rg"
  location = "West Europe"

}
resource "azurerm_storage_account" "Siddharth2"{
  depends_on = [ azurerm_resource_group.Siddharth2-rg ]
  name                     = "siddharthsa2"
  resource_group_name      = "sid2-rg"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

resource "azurerm_resource_group" "Siddharth3-rg"{
  name     = "sid3-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "Siddharth3"{
  depends_on = [ azurerm_resource_group.Siddharth3-rg ]
  name                     = "siddharthsa3"
  resource_group_name      = "sid3-rg"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

