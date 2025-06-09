resource "aws_security_group" "base" {
  name        = var.security_group.name
  vpc_id      = var.vpc_id
  description = var.security_group.description
  tags = {
    Name = var.security_group.name
  }

  depends_on = [aws_vpc.base]
}

resource "aws_vpc_security_group_ingress_rule" "base" {
  count             = length(var.security_group.ingress_rules)
  security_group_id = aws_security_group.base.id
  ip_protocol       = var.security_group.ingress_rules[count.index].ip_protocol
  from_port         = var.security_group.ingress_rules[count.index].from_port
  cidr_ipv4         = var.security_group.ingress_rules[count.index].cidr_ipv4
  to_port           = var.security_group.ingress_rules[count.index].to_port
  description       = var.security_group.ingress_rules[count.index].description
  depends_on        = [aws_security_group.base]

}

resource "aws_vpc_security_group_egress_rule" "base" {
  count             = length(var.security_group.egress_rules)
  security_group_id = aws_security_group.base.id
  ip_protocol       = var.security_group.egress_rules[count.index].ip_protocol
  from_port         = var.security_group.egress_rules[count.index].from_port
  cidr_ipv4         = var.security_group.egress_rules[count.index].cidr_ipv4
  to_port           = var.security_group.egress_rules[count.index].to_port
  description       = var.security_group.egress_rules[count.index].description
  depends_on        = [aws_security_group.base]

}

