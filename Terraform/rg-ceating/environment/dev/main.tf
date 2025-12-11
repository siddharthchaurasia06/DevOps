terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }
  
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "acd9510d-7e29-433d-8504-d10d34dba654"

}

module "rg1" {
  source   = "../../module"
  rg_name  = "rg-dev-336"
  location = "East US"
  
}