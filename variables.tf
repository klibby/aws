variable "account_id" {}
variable "profile" {}
variable "aws_region" {
    description = "The AWS region to create things in."
    default = "us-east-1"
}
variable "key_name" {
  description = "Name of the SSH keypair to use in AWS."
}
variable "aws_amis" {
  description = "Ubuntu Trusty 14.04.3 LTS (x64) AMI"
  default = {
    "us-east-1" = "ami-0f8bce65"
    "us-west-1" = "ami-f898f698"
    "us-west-2" = "ami-534d5d32"
  }
}
variable "tags" {
    default = {
        created_by = "terraform"
    }
}
