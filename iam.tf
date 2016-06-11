# Users
resource "aws_iam_user" "fubar" {
    name = "fubar"
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
resource "aws_iam_account_password_policy" "strict" {
    minimum_password_length = 16
    require_lowercase_characters = true
    require_numbers = true
    require_uppercase_characters = true
    require_symbols = true
    allow_users_to_change_password = true
}

# Create a policy that requires multifactor authentication
resource "aws_iam_policy" "require_mfa-policy" {
    name = "require_mfa-policy"
    description = "Require use of Multifactor Authentication"
    policy = "${file("files/require_mfa.json")}"
}

# Attach MFA policy to admin group
#resource "aws_iam_policy_attachment" "require_mfa-attach" {
#    name = "require_mfa-attach"
#    groups = ["${aws_iam_group.admin-group.name}"]
#    policy_arn = "${aws_iam_policy.require_mfa-policy.arn}"
#}

# Attach AWS::AdministratorAccess policy to admin group
resource "aws_iam_policy_attachment" "admin-attach" {
    name = "admin-attach"
    groups = ["${aws_iam_group.admin.name}"]
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
