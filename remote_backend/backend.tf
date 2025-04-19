terraform {
  backend "s3" {
    bucket = "terraform-remote-backup-123456789"
    key    = "network/terraform.tfstate"
    region = "eu-west-1"
  }
}