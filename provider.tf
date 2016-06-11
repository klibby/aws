provider "aws" {
    allowed_account_ids = ["${var.account_id}"]
    profile = "${var.profile}"
    region = "${var.aws_region}"
}
