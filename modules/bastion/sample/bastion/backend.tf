terraform {
  backend "s3" {
    bucket         = "terraform-state"
    key            = "bastion.tfstate"
    region         = "us-east-2"
    dynamodb_table = "tf-lock"
  }
}
