# vpc
resource "aws_vpc" "base" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "nop"
  }
}

# app-1 subnet
resource "aws_subnet" "app1" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.0.0.0/24"
  tags = {
    Name = "app1"
  }

  depends_on = [aws_vpc.base]

}

# app-2 subnet
resource "aws_subnet" "app2" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1b"
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "app2"
  }
  depends_on = [aws_vpc.base]
}


# db-1 subnet
resource "aws_subnet" "db1" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.0.2.0/24"
  tags = {
    Name = "db1"
  }
  depends_on = [aws_vpc.base]
}

# db-2 subnet
resource "aws_subnet" "db2" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1b"
  cidr_block        = "10.0.3.0/24"
  tags = {
    Name = "db2"
  }
  depends_on = [aws_vpc.base]
}
