module "label_zone" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "${var.zone_name}"
  stage   = "${var.stage}"
}

resource "aws_route53_zone" "internal" {
  count   = "${var.zone_name != "" ? 1 : 0}"
  name    = "${var.zone_name}"
  comment = "Managed by Terraform. Workspace: \"${var.stage}\"."
  vpc_id  = "${aws_vpc.main.id}"
  tags    = "${module.label_zone.tags}"
}
