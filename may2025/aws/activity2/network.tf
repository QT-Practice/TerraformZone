module "public_vpc" {
  source       = "./modules/publicvpc"
  network_info = var.network_info
  subnets_info = var.subnets_info
}