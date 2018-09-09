module "backup_ami" {
  source              = "../../../modules/backups-AMI-lambda"
  aws_region          = "us-west-2"
}
