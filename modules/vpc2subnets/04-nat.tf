module "label_eip_nat_a" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "eip-nat-a"
  stage   = "${var.stage}"
}

resource "aws_eip" "eip_nat_a" {
  vpc  = true
  tags = "${module.label_eip_nat_a.tags}"
}

module "label_nat_gateway_a" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "nat-usw2a"
  stage   = "${var.stage}"
}

resource "aws_nat_gateway" "nat_a" {
  allocation_id = "${aws_eip.eip_nat_a.id}"
  subnet_id     = "${aws_subnet.public_subnet_a.id}"
  tags          = "${module.label_nat_gateway_a.tags}"
}

module "label_eip_nat_b" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "eip-nat-b"
  stage   = "${var.stage}"
}

resource "aws_eip" "eip_nat_b" {
  vpc  = true
  tags = "${module.label_eip_nat_b.tags}"
}

module "label_nat_gateway_b" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "${var.natgw_a_name}"
  stage   = "${var.stage}"
}

resource "aws_nat_gateway" "nat_b" {
  allocation_id = "${aws_eip.eip_nat_b.id}"
  subnet_id     = "${aws_subnet.public_subnet_b.id}"
  tags          = "${module.label_nat_gateway_b.tags}"
}
