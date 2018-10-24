resource "aws_iam_instance_profile" "bastion_host_role_instance_profile" {
  name = "${var.stage}-bastion_instance_profile"
  role = "${aws_iam_role.bastion_host_role.name}"
}

resource "aws_iam_role" "bastion_host_role" {
  path = "/"
  name = "${var.stage}-bastion"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Action": [
        "sts:AssumeRole"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "bastion_host_role_policy" {
  name = "${var.stage}-bastion-s3"
  role = "${aws_iam_role.bastion_host_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:PutObjectAcl"
      ],
      "Resource": "arn:aws:s3:::${var.bucket_name}/logs/*"
    },
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.bucket_name}/public-keys/*"
    },
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::${var.bucket_name}",
      "Condition": {
        "StringEquals": {
          "s3:prefix": "public-keys/"
        }
      }
    }
  ]
}
EOF
}
