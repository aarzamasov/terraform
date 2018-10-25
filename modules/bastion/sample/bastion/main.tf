module "bastion" {
  source        = "../../../../myrepo/terraform/modules/bastion"
  bucket_name   = "bastion-bucket"
  ssh_key       = "cs-keypair"
  instance_type = "t2.micro"
  disk_size     = "16"
  region        = "us-east-2"
  bastion_sg    = "${data.terraform_remote_state.sg.bastion_id}"
  subnet_id     = "${data.terraform_remote_state.vpc.public_subnet_a}"
  stage         = "dev"
}
