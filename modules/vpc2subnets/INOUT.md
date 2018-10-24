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