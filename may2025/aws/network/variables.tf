variable "region" {
  type        = string
  description = "region for the current template"
  default     = "ap-south-1" # if the user does not pass the value this is default
}

variable "network_info" {
  description = "this is network info"
  type = object({
    name = string
    cidr = string
  })
  default = {
    name = "nop"
    cidr = "10.0.0.0/16"
  }

}

variable "subnet1_info" {
  description = "this is subnet1 info"
  type = object({
    name = string
    cidr = string
    az   = string
  })
  default = {
    name = "app1"
    cidr = "10.0.0.0/24"
    az   = "ap-south-1a"
  }

}

variable "subnet2_info" {
  description = "this is subnet1 info"
  type = object({
    name = string
    cidr = string
    az   = string
  })
  default = {
    name = "app2"
    cidr = "10.0.1.0/24"
    az   = "ap-south-1b"
  }

}

variable "subnet3_info" {
  description = "this is subnet1 info"
  type = object({
    name = string
    cidr = string
    az   = string
  })
  default = {
    name = "db1"
    cidr = "10.0.2.0/24"
    az   = "ap-south-1a"
  }

}

variable "subnet4_info" {
  description = "this is subnet1 info"
  type = object({
    name = string
    cidr = string
    az   = string
  })
  default = {
    name = "db2"
    cidr = "10.0.3.0/24"
    az   = "ap-south-1b"
  }

}
