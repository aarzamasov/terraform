module "label_public_subnet_a" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "pub-sb-${var.a_az}"
  stage   = "${var.stage}"
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id                          = "${aws_vpc.main.id}"
  cidr_block                      = "${var.public_a_cidr}"
  availability_zone               = "${var.a_az}"
  map_public_ip_on_launch         = true
  assign_ipv6_address_on_creation = false
  tags                            = "${module.label_public_subnet_a.tags}"
}

module "label_public_subnet_b" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "pub-sb-${var.b_az}"
  stage   = "${var.stage}"
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id                          = "${aws_vpc.main.id}"
  cidr_block                      = "${var.public_b_cidr}"
  availability_zone               = "${var.b_az}"
  map_public_ip_on_launch         = true
  assign_ipv6_address_on_creation = false
  tags                            = "${module.label_public_subnet_b.tags}"
}

module "label_private_subnet_a" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "priv-sb-${var.a_az}"
  stage   = "${var.stage}"
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id                          = "${aws_vpc.main.id}"
  cidr_block                      = "${var.private_a_cidr}"
  availability_zone               = "${var.a_az}"
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false
  tags                            = "${module.label_private_subnet_a.tags}"
}

module "label_private_subnet_b" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "priv-sb-${var.b_az}"
  stage   = "${var.stage}"
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id                          = "${aws_vpc.main.id}"
  cidr_block                      = "${var.private_b_cidr}"
  availability_zone               = "${var.b_az}"
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false
  tags                            = "${module.label_private_subnet_b.tags}"
}
