module "rds" {
  source          = "../../../../myrepo/terraform/modules/rds"
  vpc_id          = "${data.terraform_remote_state.vpc.vpc_id}"
  subnets         = ["${data.terraform_remote_state.vpc.private_subnet_a}", "${data.terraform_remote_state.vpc.private_subnet_b}"]
  stage           = "dev"
  size            = "db.t2.small"
  security_groups = ["${data.terraform_remote_state.sg.rds_id}"]
  rds_password    = "supersecurepassword1"
  multi_az        = "false"
}