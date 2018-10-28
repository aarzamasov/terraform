terraform {
  backend "s3" {
    bucket         = "terraform-state-us-east-1"
    key            = "ssm.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-lock"
  }
}
