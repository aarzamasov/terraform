module "label_vpc" {
  source      = "../null-label"
  name        = "${var.vpc_name}"
  stage       = "${var.stage}"
  label_order = ["name", "stage", "namespace"]

  tags = {
    "tf-workspace" = "${terraform.workspace}"
  }
}

resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = "${module.label_vpc.tags}"
}
