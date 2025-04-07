provider "aws" {
  region = "us-east-1"
}

variable "sg_ports" {
  description = "list of ports for security group"
  type        = list(number)
  default     = [22, 80, 443, 5432]
}

resource "aws_security_group" "dynamic_sg" {
  name = "dynamic_sg"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
