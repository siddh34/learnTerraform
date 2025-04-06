provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "latest_ubuntu_linux" {
    most_recent = true

    owners = ["amazon"]

    filter {
      name = "name"
      values = ["ubuntu-minimal/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-minimal-*"]
    }
}

resource "aws_instance" "ubuntu_instace" {
  ami = data.aws_ami.latest_ubuntu_linux.id
  instance_type = "t2.micro"

  tags = {
    Name = "ubuntu_instance"
  }
}