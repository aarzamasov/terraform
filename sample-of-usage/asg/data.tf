data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "terraform-state-us-east-1"
    key    = "env:/${terraform.workspace}/vpc.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"

  config {
    bucket = "terraform-state-us-east-1"
    key    = "env:/${terraform.workspace}/sg.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

data "template_file" "user_data" {
  template = "${file("${path.module}/install_apache.tpl")}"
}
