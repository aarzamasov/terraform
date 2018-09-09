terraform {
  backend "s3" {
    bucket         = "f50-terraform-state"
    key            = "lamda-backup.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform"
    profile        = "f50"
  }
}
