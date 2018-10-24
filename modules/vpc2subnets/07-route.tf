module "label_public_rt" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "${var.public_rt_name}"
  stage   = "${var.stage}"
}

resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = "${module.label_public_rt.tags}"
}

resource "aws_main_route_table_association" "public" {
  vpc_id         = "${aws_vpc.main.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = "${aws_subnet.public_subnet_a.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = "${aws_subnet.public_subnet_b.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

module "label_private_a_rt" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "${var.private_rt_a_name}"
  stage   = "${var.stage}"
}

resource "aws_route_table" "private_a_rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_a.id}"
  }

  tags = "${module.label_private_a_rt.tags}"
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = "${aws_subnet.private_subnet_a.id}"
  route_table_id = "${aws_route_table.private_a_rt.id}"
}

module "label_private_b_rt" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "${var.private_rt_b_name}"
  stage   = "${var.stage}"
}

resource "aws_route_table" "private_b_rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_b.id}"
  }

  tags = "${module.label_private_b_rt.tags}"
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = "${aws_subnet.private_subnet_b.id}"
  route_table_id = "${aws_route_table.private_b_rt.id}"
}
