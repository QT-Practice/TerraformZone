provider "azurerm" {
  features {   
  }
}

resource "azurerm_resource_group" "base" {
    name = "fromtf"
    location = "centralindia"
  
}

resource "azurerm_storage_account" "store" {
    name = "fromtfqtmay25"
    resource_group_name = "fromtf"
    location = "centralindia"
    account_tier = "Standard"
    account_replication_type = "RAGRS"
  
}