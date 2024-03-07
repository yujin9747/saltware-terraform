resource "aws_iam_instance_profile" "admin_role" {
  name = "admin_role"
  role = aws_iam_role.role.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role" {
  name               = "admin_role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}