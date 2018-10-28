module "security_groups" {
  source            = "../../modules/sg"
  vpc_id            = "${data.terraform_remote_state.vpc.vpc_id}"
  stage             = "dev"
  cidr_blocks_allow = ["188.146.102.142/32"]
}
