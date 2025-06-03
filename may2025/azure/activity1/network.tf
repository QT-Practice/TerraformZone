# virtual network
resource "azurerm_virtual_network" "base" {
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  address_space       = [var.network_info.address_space]
  name                = var.network_info.name
  tags = {
    Environment = "Dev"
  }

  depends_on = [azurerm_resource_group.base]
}

resource "azurerm_subnet" "subnets" {
  count                = length(var.network_info.subnets)
  name                 = var.network_info.subnets[count.index].name
  address_prefixes     = [var.network_info.subnets[count.index].address_space]
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  depends_on = [
    azurerm_virtual_network.base
  ]

}

