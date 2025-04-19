variable "pass" {
  type = string
  default = "superpassword"
  sensitive = true
}

resource "local_file" "sample" {
  content = var.pass
  filename = "pass.txt"
}

output "pass" {
  value = local_file.sample.content
  sensitive = true
}