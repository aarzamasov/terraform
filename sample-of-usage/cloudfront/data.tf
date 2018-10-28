data "terraform_remote_state" "asg" {
  backend = "s3"

  config {
    bucket = "terraform-state-us-east-1"
    key    = "env:/${terraform.workspace}/asg.tfstate"
    region = "us-east-1"
  }
}
