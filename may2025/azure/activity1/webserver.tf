# public ip address
resource "azurerm_public_ip" "web" {
  name                = "${var.web_server.name}-ip"
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  allocation_method   = "Static"
  sku_tier            = "Regional"
  depends_on          = [azurerm_resource_group.base]
}

data "azurerm_subnet" "web" {
  name                 = var.web_server.subnet_name
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  depends_on           = [azurerm_subnet.subnets]
}


# network interface

resource "azurerm_network_interface" "web" {
  name                = "${var.web_server.name}-nic"
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  ip_configuration {
    name                          = var.web_server.name
    subnet_id                     = data.azurerm_subnet.web.id
    public_ip_address_id          = azurerm_public_ip.web.id
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [azurerm_subnet.subnets, azurerm_public_ip.web]

}

resource "azurerm_network_interface_security_group_association" "web" {
  network_interface_id      = azurerm_network_interface.web.id
  network_security_group_id = azurerm_network_security_group.web.id
  depends_on                = [azurerm_network_interface.web, azurerm_network_security_group.web]
}