module "web_security_group" {
  source         = "./modules/securitygroup"
  vpc_id         = module.public_vpc.id
  security_group = var.web_security_group

}


module "app_security_group" {
  source         = "./modules/securitygroup"
  vpc_id         = module.public_vpc.id
  security_group = var.app_security_group

}

module "db_security_group" {
  source         = "./modules/securitygroup"
  vpc_id         = module.public_vpc.id
  security_group = var.db_security_group
}

