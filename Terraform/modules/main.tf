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

module "siddharth_rg" {
  source = "./resource_group"
}

module "storage_account" {
  depends_on = [module.siddharth_rg]
  source     = "./storage_account"
}