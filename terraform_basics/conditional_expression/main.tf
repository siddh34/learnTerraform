provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  default = "prod"
}

resource "aws_instance" "sampleec2" {
  ami           = "ami-00a929b66ed6e0de6"
  instance_type = var.environment == "prod" ? "t2.medium" : "t2.micro"
}