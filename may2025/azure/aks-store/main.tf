resource "azurerm_resource_group" "base" {
  name     = var.aks_info.resource_group_name
  location = var.aks_info.location
}

resource "azurerm_kubernetes_cluster" "base" {
  name = var.aks_info.name
  default_node_pool {
    name       = "default"
    node_count = var.aks_info.default_node_count
    vm_size    = var.aks_info.vm_size
  }
  dns_prefix          = var.aks_info.dns_prefix
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  identity {
    type = "SystemAssigned"
  }

}


resource "null_resource" "exec" {
  triggers = {
    build = "1"
  }

  provisioner "local-exec" {
    command = format("az aks get-credentials --resource-group %s --name %s --overwrite-existing", azurerm_resource_group.base.name, var.aks_info.name)
  }

  depends_on = [ azurerm_kubernetes_cluster.base ]

}