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

resource "azurerm_linux_virtual_machine" "web" {
  admin_username      = var.web_server.admin_username
  location            = azurerm_resource_group.base.location
  resource_group_name = azurerm_resource_group.base.name
  name                = var.web_server.name
  network_interface_ids = [
    azurerm_network_interface.web.id
  ]
  size                            = var.web_server.size
  disable_password_authentication = false
  admin_password                  = var.web_server.admin_password
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = var.web_server.publisher
    offer     = var.web_server.offer
    sku       = var.web_server.sku
    version   = var.web_server.version
  }
  user_data = filebase64("nginx.sh")



}


resource "null_resource" "web" {

  triggers = {
    BuildId = var.build_id
  }

  connection {
    type     = "ssh"
    user     = var.web_server.admin_username
    password = var.web_server.admin_password
    host     = azurerm_linux_virtual_machine.web.public_ip_address

  }

  provisioner "file" {
    source = "index.html"
    destination = "/tmp/index.html"
    
  }


  provisioner "remote-exec" {
    script = "nginx.sh"

  }
}