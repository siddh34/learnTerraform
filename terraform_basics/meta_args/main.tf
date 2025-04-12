provider "aws" {
  region = "eu-west-1"
}

variable "user_names" {
  type    = set(string)
  default = ["alice", "bob", "john", "james"]
}

variable "my-map" {
  default = {
    key  = "value"
    key1 = "value1"
  }
}

resource "aws_iam_user" "this" {
  for_each = var.user_names
  name     = each.value
}

resource "aws_instance" "web" {
  for_each      = var.my-map
  ami           = each.value
  instance_type = "t3.micro"

  tags = {
    Name = each.key
  }
}