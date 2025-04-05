resource "aws_security_group" "terraform_sg" {
    name = "terraform-sg"
    description = "Allow inbound traffic on port 22 and 80"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.terraform_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  ip_protocol = "tcp"
  to_port = 100
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.terraform_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}