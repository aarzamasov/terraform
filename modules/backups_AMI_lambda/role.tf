resource "aws_iam_role" "role_backup" {
  name               = "role-backup-${terraform.workspace}"
  assume_role_policy = "${file("${path.module}/files/lambda-trust.json")}"
}

resource "aws_iam_policy" "role_backup" {
  name        = "policy-backup-${terraform.workspace}"
  description = "Policy for backup ec2"
  policy      = "${file("${path.module}/files/policy-lambda-function.json")}"
}

resource "aws_iam_role_policy_attachment" "policy_to_role" {
  role       = "${aws_iam_role.role_backup.name}"
  policy_arn = "${aws_iam_policy.role_backup.arn}"
}