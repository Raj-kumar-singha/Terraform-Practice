variable "region" {
  default = "ap-south-1"
}
variable "project_name" { default = "wezo-docker-app" }
variable "instance_type" { default = "t3.micro" }
variable "key_name" { default = "wezo-key" }
variable "public_key_path" { default = "~/.ssh/wezo-key.pem.pub" } # adjust
variable "repo_url" { description = "Git repo URL containing frontend & backend" }
