variable "region" {
  type        = string
  description = "region for the current template"
  default     = "ap-south-1" # if the user does not pass the value this is default
}

variable "network_name" {
    type = string
    description = "name of the network"
    default = "nop"
}

variable "network_cidr" {
    type = string
    description = "vpc cidr"
    default = "10.0.0.0/16"
  
}

variable "subnet1_name" {
    type = string
    description = "subnet 1 name"
    default = "app1"
}

variable "subnet1_cidr" {
    type = string
    description = "subnet 1 name"
    default = "10.0.0.0/24"
}

variable "subnet2_name" {
    type = string
    description = "subnet 2 name"
    default = "app2"
}

variable "subnet2_cidr" {
    type = string
    description = "subnet 2 name"
    default = "10.0.1.0/24"
}

variable "subnet3_name" {
    type = string
    description = "subnet 3 name"
    default = "app3"
}

variable "subnet3_cidr" {
    type = string
    description = "subnet 3 name"
    default = "10.0.2.0/24"
}

variable "subnet4_name" {
    type = string
    description = "subnet 4 name"
    default = "app4"
}

variable "subnet4_cidr" {
    type = string
    description = "subnet 4 name"
    default = "10.0.3.0/24"
}