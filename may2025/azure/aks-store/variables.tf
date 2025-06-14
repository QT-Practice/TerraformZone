variable "aks_info" {
  type = object({
    name                = string
    resource_group_name = string
    default_node_count  = number
    dns_prefix          = string
    location            = string
    vm_size             = string
  })
  default = {
    name                = "myAksCluster"
    resource_group_name = "akstf"
    default_node_count  = 1
    vm_size             = "Standard_D2_v2"
    dns_prefix          = "myaks"
    location            = "eastus"

  }

}