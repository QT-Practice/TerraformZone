terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.31.0"
    }
  }
  required_version = "> 1.11.0"
  backend "azurerm" {
    resource_group_name = "backups"
    storage_account_name = "lttfstatejune"
    container_name = "classroom"
    key = "activity1"
    
  }
}

provider "azurerm" {
  features {
  }
}