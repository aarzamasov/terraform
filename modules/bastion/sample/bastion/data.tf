data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "terraform-state"
    key    = "env:/${terraform.workspace}/vpc.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"

  config {
    bucket = "terraform-state"
    key    = "env:/${terraform.workspace}/sg.tfstate"
    region = "us-east-2"
  }
}
