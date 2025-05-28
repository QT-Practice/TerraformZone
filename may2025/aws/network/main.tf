# vpc
resource "aws_vpc" "base" {
  cidr_block = var.network_info.cidr
  tags = {
    Name = var.network_info.name
  }
}

# app-1 subnet
resource "aws_subnet" "app1" {
  vpc_id            = aws_vpc.base.id
  availability_zone = var.subnet1_info.az
  cidr_block        = var.subnet1_info.cidr
  tags = {
    Name = var.subnet1_info.name
  }

  depends_on = [aws_vpc.base]

}

# app-2 subnet
resource "aws_subnet" "app2" {
  vpc_id            = aws_vpc.base.id
  availability_zone = var.subnet2_info.az
  cidr_block        = var.subnet2_info.cidr
  tags = {
    Name = var.subnet2_info.name
  }
  depends_on = [aws_vpc.base]
}


# db-1 subnet
resource "aws_subnet" "db1" {
  vpc_id            = aws_vpc.base.id
  availability_zone = var.subnet3_info.az
  cidr_block        = var.subnet3_info.cidr
  tags = {
    Name = var.subnet3_info.name
  }
  depends_on = [aws_vpc.base]
}

# db-2 subnet
resource "aws_subnet" "db2" {
  vpc_id            = aws_vpc.base.id
  availability_zone = var.subnet4_info.az
  cidr_block        = var.subnet4_info.cidr
  tags = {
    Name = var.subnet4_info.name
  }
  depends_on = [aws_vpc.base]
}
