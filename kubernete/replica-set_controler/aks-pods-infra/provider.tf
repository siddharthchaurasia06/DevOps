terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "712bfb2b-0ea5-4e2e-ae12-b849c506ebe4"
}