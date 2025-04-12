data "aws_ami" "amz_linux_ami" {
    most_recent = true

    owners = ["amazon"]

    filter {
      name = "name"
      values = ["al2023-ami-ecs-hvm-2023.0.20241001-kernel-6.1-x86_64"]
    }
}