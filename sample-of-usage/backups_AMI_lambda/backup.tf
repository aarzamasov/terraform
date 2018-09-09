module "backup-lambda-ami" {
  source              = "../../../tf-modules/backups_AMI_lambda"
  aws_region          = "us-east-1"
}
