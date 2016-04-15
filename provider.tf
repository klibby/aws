provider "aws" {
  allowed_account_ids = ["${var.account_id}"]
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.aws_region}"
}
