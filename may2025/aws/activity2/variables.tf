variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "default_tags" {
  type = map(string)
  default = {
    "Env"       = "Dev"
    "CreatedBy" = "Terrform"
  }

}

variable "network_info" {
  type = object({
    name                 = string
    cidr_block           = string
    enable_dns_hostnames = bool
  })
  default = {
    cidr_block           = "10.113.0.0/16"
    name                 = "ntier"
    enable_dns_hostnames = true
  }

}

variable "subnets_info" {
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
  default = [{
    name              = "web1"
    cidr_block        = "10.113.0.0/24"
    availability_zone = "ap-south-1a"
    }, {
    name              = "web2"
    cidr_block        = "10.113.1.0/24"
    availability_zone = "ap-south-1b"
  }]

}