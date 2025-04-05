resource "aws_eip" "ep" {
  domain = "vpc"
}

resource "aws_security_group" "allow_tls" {
  name = "attribute-fw"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "${aws_eip.ep.public_ip}/32"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 100
}