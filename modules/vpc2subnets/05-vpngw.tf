module "label_vpn_gateway" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "${var.vpngw_name}"
  stage   = "${var.stage}"
}

resource "aws_vpn_gateway" "vpn_gateway" {
  vpc_id = "${aws_vpc.main.id}"
  tags   = "${module.label_vpn_gateway.tags}"
}
