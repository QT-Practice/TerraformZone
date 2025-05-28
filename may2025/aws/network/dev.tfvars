region = "ap-south-1"
network_info = {
  name = "spc"
  cidr = "192.168.0.0/16"
}
subnet1_info = {
  az   = "ap-south-1a"
  name = "web-1"
  cidr = "192.168.0.0/24"
}
subnet2_info = {
  az   = "ap-south-1b"
  name = "web-2"
  cidr = "192.168.1.0/24"
}

subnet3_info = {
  az   = "ap-south-1a"
  name = "db-1"
  cidr = "192.168.2.0/24"
}
subnet4_info = {
  az   = "ap-south-1b"
  name = "db-2"
  cidr = "192.168.3.0/24"
}