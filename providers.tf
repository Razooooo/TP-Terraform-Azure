terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.28.0"
    }
  }
}
provider "azurerm" {
  subscription_id = "95040177-1026-4e75-9b8a-668b80eed8ba"
  features {}
}
