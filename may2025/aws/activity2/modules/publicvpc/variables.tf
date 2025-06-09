variable "network_info" {
  type = object({
    name                 = string
    cidr_block           = string
    enable_dns_hostnames = bool
  })
}

variable "subnets_info" {
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))

}