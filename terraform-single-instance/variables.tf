variable "region" { default = "ap-south-1" }
variable "instance_type" { default = "t3.micro" } # free-tier eligible in many regions
variable "key_name" { description = "awskey.pem" }
variable "repo_url" { description = "https://github.com/Raj-kumar-singha/Terraform-Practice.git" }
