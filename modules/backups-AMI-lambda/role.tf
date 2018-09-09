resource "aws_iam_role" "role_backup" {
  name               = "${var.name_tag}-${var.environment_tag}-slave-role"
  assume_role_policy = "${file("${path.module}/files/ec2-trust.json")}"
}

resource "aws_iam_policy" "role_backup" {
  name        = "${var.name_tag}-${var.environment_tag}-slave-cw-policy"
  description = "CloudWatch Policy for ${var.name_tag} slave"
  policy      = "${file("${path.module}/files/cw-policy-slave.json")}"
}

resource "aws_iam_role_policy_attachment" "policy_to_role" {
  role       = "${aws_iam_role.role_backup.name}"
  policy_arn = "${aws_iam_policy.role_backup.arn}"
}