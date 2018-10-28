variable "ami" {
  default = "ami-ffd74b87"
}

resource "aws_eip" "openvpn" {
  instance = "${aws_instance.openvpn.id}"
  vpc      = true
}

module "label_ec2_openvpn" {
  source      = "../null-label"
  name        = "openvpn-${var.stage}"
  stage       = "${var.stage}"
  label_order = ["name", "stage", "namespace"]

  tags = {
    "tf-workspace" = "${terraform.workspace}"
  }
}

resource "aws_instance" "openvpn" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.ssh_key}"
  subnet_id     = "${var.subnet_id}"

  vpc_security_group_ids = ["${var.openvpn_sg}"]

  tags = "${module.label_ec2_openvpn.tags}"

  user_data = <<USERDATA
admin_user=${var.openvpn_admin_user}
admin_pw=${var.openvpn_admin_pw}
USERDATA
}

resource "aws_iam_instance_profile" "openvpn" {
  name = "${var.openvpn_name}-role"
  role = "${aws_iam_role.openvpn.name}"
}

resource "aws_iam_role" "openvpn" {
  name = "${var.openvpn_name}-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}
