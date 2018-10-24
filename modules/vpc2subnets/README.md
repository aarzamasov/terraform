# VPC Management/Security Module in management account

- [VPC Management/Security Module in management account](#vpc-managementsecurity-module-in-management-account)
- [Overview](#overview)
- [Project structure](#project-structure)
  - [Directory structure](#directory-structure)
  - [Files table](#files-table)
- [Variables](#variables)
  - [Inputs](#inputs)
  - [Outputs](#outputs)
- [Sample Usage](#sample-usage)

# Overview
Terraforn template creates:
    -  VPC
    -  subnets
    -  Internet gateaway
    -  NAT
    -  VPN gateway
    -  Route53 zone
    -  Routes in VPC

Terraform configs are stored in code commit repository:
- [tf-env-security-vpc](https://console.aws.amazon.com/codecommit/home?region=us-east-1#/repository/tf-env/browse/HEAD/--/management/vpc)
- [tf-env-management-vpc](https://console.aws.amazon.com/codecommit/home?region=us-east-1#/repository/tf-env/browse/HEAD/--/management/vpc)
- [tf-module](https://us-west-2.console.aws.amazon.com/codecommit/home?region=us-west-2#/repository/terraform/browse/HEAD/--/modules/vpc-mgmt-sec)

# Project structure
## Directory structure
```
./
├── 01-vpc.tf
├── 02-subnets.tf
├── 03-igw.tf
├── 04-nat.tf
├── 05-vpngw.tf
├── 06-zone.tf
├── 07-route.tf
├── FILES.md
├── INOUT.md
├── README.md
├── outputs.tf
└── variables.tf
```

## Files table

| File                                                                             | Description                                                  |
| -------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| ./01-vpc.tf|Create a vpc|
| ./02-subnets.tf|Create subnets|
| ./03-igw.tf|Create Internet gateaway|
| ./04-nat.tf|Create NAT|
| ./05-vpngw.tf|Create a VPN gateway|
| ./06-zone.tf|Create zone for VPC|
| ./07-route.tf|Create routes in VPC|
| ./FILES.md|Files of the module|
| ./INOUT.md|IN/OUT variables |
| ./README.md|Readme file|
| ./outputs.tf|Outputs of the module|
| ./variables.tf| Variables fpr the modules.|

# Variables

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| a_az | Availability zone A for environment | string | - | yes |
| env | Environment name. This is be represented in tags | string | - | yes |
| private_a_cidr | Private CIDR for 'A' zone | string | - | yes |
| public_a_cidr | Public CIDR for 'A' zone | string | - | yes |
| region | The region for new VPC | string | - | yes |
| stage | Stage name for tags. This is be represented in tags | string | - | yes |
| vpc_cidr | CIDR VPC | string | - | yes |
| zone_name | Name of new zone in Route53 | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| internal_zone_id | Internal Route53 zone id |
| internal_zone_name | Internal Route53 zone name |
| nat_a_public_ip | Nat_A public ip |
| private_a_rt | Private_A RT identifier |
| private_subnet_a | Private_A subnet identifier |
| public_rt | Public RT identifier |
| public_subnet_a | Public_A subnet identifier |
| vpc_cidr | VPC CIDR |
| vpc_id | VPC Identifier |
| workspace | Workspace name |

# Sample Usage
Include the module into a terraform layer like this:

```
module "vpc" {
  source          = "../../../modules/vpc-mgmt-sec/"
  region          = "us-west-2"
  a_az            = "us-west-2a"
  private_a_cidr  = "10.88.2.0/24"
  public_a_cidr   = "10.88.1.0/24"
  vpc_cidr        = "10.88.0.0/16"
  zone_name       = "mgmt.wine.local"
  env             = "management"
  stage           = "management"
}
```