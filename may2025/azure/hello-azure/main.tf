provider "azurerm" {
  features {   
  }
}

resource "azurerm_resource_group" "base" {
    name = "fromtf1"
    location = "centralindia"
  
}

resource "azurerm_storage_account" "store" {
    name = "fromtfltmay25"
    resource_group_name = "fromtf1"
    location = "centralindia"
    account_tier = "Standard"
    account_replication_type = "RAGRS"
    # explicit dependency
    depends_on = [ azurerm_resource_group.base ]
  
}