output "id" {
  value = aws_vpc.base.id
}

output "subnet_ids" {
  value = aws_subnet.subnets[*].id
}