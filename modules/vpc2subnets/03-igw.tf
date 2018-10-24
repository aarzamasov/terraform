module "label_igw" {
  source  = "../null-label"
  context = "${module.label_vpc.context}"
  name    = "${var.igw_name}"
  stage   = "${var.stage}"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"
  tags   = "${module.label_igw.tags}"
}
