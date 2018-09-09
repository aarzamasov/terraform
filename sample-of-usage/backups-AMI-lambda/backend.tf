terraform {
  backend "s3" {
    bucket         = "tf-state"
    key            = "lamda-backup.tfstate"
    region         = "us-west-2"
    dynamodb_table = "tf-table-2"
  }
}

