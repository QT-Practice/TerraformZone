# vpc
resource "aws_vpc" "base" {
  cidr_block = var.network_cidr
  tags = {
    Name = var.network_name
  }
}

# app-1 subnet
resource "aws_subnet" "app1" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1a"
  cidr_block        = var.subnet1_cidr
  tags = {
    Name = var.subnet1_name
  }

  depends_on = [aws_vpc.base]

}

# app-2 subnet
resource "aws_subnet" "app2" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1b"
  cidr_block        = var.subnet2_cidr
  tags = {
    Name = var.subnet2_name
  }
  depends_on = [aws_vpc.base]
}


# db-1 subnet
resource "aws_subnet" "db1" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1a"
  cidr_block        = var.subnet3_cidr
  tags = {
    Name = var.subnet3_name
  }
  depends_on = [aws_vpc.base]
}

# db-2 subnet
resource "aws_subnet" "db2" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1b"
  cidr_block        = var.subnet4_cidr
  tags = {
    Name = var.subnet4_name
  }
  depends_on = [aws_vpc.base]
}
