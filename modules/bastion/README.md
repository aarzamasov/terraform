# Bastion Instance
# Overview

Terraforn templates creates Bastion EC2 instance. Bastion allow to connect to private instance over VPN.  You should deploy VPC, SG.

Terraform configs are stored in code commit repository:
- [tf-env](https://console.aws.amazon.com/codecommit/home?region=us-east-1#/repository/tf-env/browse/HEAD/--/)
- [tf-modules](https://console.aws.amazon.com/codecommit/home?region=us-east-1#/repository/tf-modules/browse/HEAD/--/)

# Project structure
```
.
├── FILES.md
├── INOUT.md
├── README.md
├── backend.tf
├── main.tf
└── variables.tf
```

# Files descriptions


| File           | Description                    |
| -------------- | ------------------------------ |
| ./FILES.md     |                                |
| ./INOUT.md     | Describe in and out parameters |
| ./README.md    | read me file                   |
| ./backend.tf   | S3 state for terraform         |
| ./main.tf      | creating ec2 instance          |
| ./variables.tf | module variables               |

# Variables
## Inputs

| Name             | Description              | Type   | Default | Required |
| ---------------- | ------------------------ | :----: | :-----: | :------: |
| bastion_ami      | Instance ami for bastion | string | -       | yes      |
| bastion_key_pair | SSH key pair for bastion | string | -       | yes      |


# Resources

| Logical Name | Type | Description                     |
| ------------ | ---- | :-----------------------------: |
| bastion      | EC2  | EC2 instance for network access |

# Sample Usage
Include the module into a terraform layer like this:

```
module "bastion" {
  source           = "../../../tf-modules/bastion"
  bastion_ami      = "ami-1474be69"
  bastion_key_pair = "common-ec2"
}

```