resource "aws_vpc" "nop" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "nop-vpc"
  }
}


resource "aws_subnet" "public1" {
  availability_zone = "ap-south-1a"
  cidr_block        = "10.0.0.0/20"
  tags = {
    "Name" = "nop-subnet-public1-ap-south-1a"
  }

  vpc_id = aws_vpc.nop.id
}

resource "aws_subnet" "public2" {
  availability_zone = "ap-south-1b"
  cidr_block        = "10.0.16.0/20"
  tags = {
    "Name" = "nop-subnet-public2-ap-south-1b"
  }

  vpc_id = aws_vpc.nop.id

}

resource "aws_subnet" "private1" {
  availability_zone = "ap-south-1a"
  cidr_block        = "10.0.128.0/20"
  tags = {
    "Name" = "nop-subnet-private1-ap-south-1a"
  }

  vpc_id = aws_vpc.nop.id

}

resource "aws_subnet" "private2" {
  availability_zone = "ap-south-1b"
  cidr_block        = "10.0.144.0/20"
  tags = {
    "Name" = "nop-subnet-private2-ap-south-1b"
  }

  vpc_id = aws_vpc.nop.id

}

resource "aws_internet_gateway" "nop" {
  tags = {
    "Name" = "nop-igw"
  }
  vpc_id = aws_vpc.nop.id

}

resource "aws_route_table" "public" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nop.id
  }

  tags = {
    "Name" = "nop-rtb-public"
  }
  vpc_id = aws_vpc.nop.id
}

resource "aws_route_table" "private1" {
  tags = {
    "Name" = "nop-rtb-private1-ap-south-1a"
  }
  vpc_id = aws_vpc.nop.id
}

resource "aws_route_table" "private2" {
  tags = {
    "Name" = "nop-rtb-private2-ap-south-1b"
  }
  vpc_id = aws_vpc.nop.id
}


resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}