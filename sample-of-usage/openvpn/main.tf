module "openvpn" {
  source             = "../../modules/openvpn"
  instance_type      = "t2.micro"
  ssh_key            = "cs-keypair"
  openvpn_admin_pw   = "aasdfa123123^sdfsdf"
  openvpn_admin_user = "adminopenvpn"
  openvpn_name       = "openvpn"
  ami                = "ami-1b9c4966"
  openvpn_sg         = ["${data.terraform_remote_state.sg.bastion_id}"]
  subnet_id          = "${data.terraform_remote_state.vpc.public_subnet_a}"
  stage              = "dev"
}
