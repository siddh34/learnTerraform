resource "aws_security_group" "ec2_sg" {
  name = "ec2_sg"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ec2_sg.id

  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  to_port =  22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.ec2_sg.id

  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port =  80
  ip_protocol = "tcp"
}

resource "aws_instance" "amz_linux_instance" {
  ami = data.aws_ami.amz_linux_ami.id

  instance_type = "t2.micro"
  key_name = "terraform-mac"
  vpc_security_group_ids = [ aws_security_group.ec2_sg.id ]

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("./terraform-mac.pem")
    host = self.public_ip
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> server_ip.txt"
  }

  provisioner "remote-exec" {
    inline = [
        "sudo yum -y install nginx",
        "sudo systemctl start nginx"
    ]
  }
}