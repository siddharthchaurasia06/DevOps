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
  subscription_id = "712bfb2b-0ea5-4e2e-ae12-b849c506ebe4"

}

module "rg2" {
  source   = "../../module"
  rg_name  = "rg-prod-3367"
  location = "East US"
  
}