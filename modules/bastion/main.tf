module "label_bastion" {
  source      = "../null-label"
  name        = "bastion-${var.stage}"
  stage       = "${var.stage}"
  label_order = ["name", "stage", "namespace"]
  tags = {
    "tf-workspace"  = "${terraform.workspace}"
  }
}

data "template_file" "user_data" {
  template = "${file("${path.module}/user_data.sh.j2")}"

  vars {
    aws_region  = "${var.region}"
    bucket_name = "${var.bucket_name}"
  }
}

resource "aws_instance" "bastion" {
  ami                         = "${lookup(var.bastion_amis, var.region)}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.ssh_key}"
  iam_instance_profile        = "${aws_iam_instance_profile.bastion_host_role_instance_profile.name}"
  vpc_security_group_ids      = ["${var.bastion_sg}"]
  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = "${var.associate_public_ip_address}"

  root_block_device {
    volume_size           = "${var.disk_size}"
    delete_on_termination = true
  }
  tags   = "${module.label_bastion.tags}"
  user_data = "${data.template_file.user_data.rendered}"
}
