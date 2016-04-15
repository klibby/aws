# Users
resource "aws_iam_user" "fubar" {
    name = "fubar"
}
resource "aws_iam_access_key" "fubar-key" {
    user = "fubar"
    depends_on = ["aws_iam_user.fubar"]
}

# Groups
resource "aws_iam_group" "admin" {
    name = "admin"
}
resource "aws_iam_group_membership" "admin-groupmem" {
    name = "admin-groupmem"
    group = "${aws_iam_group.admin.name}"
    users = ["${aws_iam_user.fubar.name}"]
}

# Policies
resource "aws_iam_policy_attachment" "admin-attach" {
    name = "admin-attach"
    groups = ["${aws_iam_group.admin.name}"]
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
resource "aws_iam_account_password_policy" "strict" {
    minimum_password_length = 16
    require_lowercase_characters = true
    require_numbers = true
    require_uppercase_characters = true
    require_symbols = true
    allow_users_to_change_password = true
}
