# Variables
variable "stage" {
  type        = "string"
  description = "Stage name for tags. This is be represented in tags"
}

variable "vpc_cidr" {
  type        = "string"
  description = "CIDR VPC"
}

variable "a_az" {
  type        = "string"
  description = "Availability zone A for environment "
}

variable "b_az" {
  type        = "string"
  description = "Availability zone B for environment "
}

variable "public_a_cidr" {
  type        = "string"
  description = "Public CIDR for 'A' zone"
}

variable "public_b_cidr" {
  type        = "string"
  description = "Public CIDR for 'B' zone"
}

variable "private_a_cidr" {
  type        = "string"
  description = "Private CIDR for 'A' zone"
}

variable "private_b_cidr" {
  type        = "string"
  description = "Private CIDR for 'B' zone"
}

variable "vpc_name" {
  type        = "string"
  description = "Name of VPC"
}

variable "igw_name" {
  type        = "string"
  description = "Name of internet gateway"
}

variable "natgw_a_name" {
  type        = "string"
  description = "Name of nat geteway 'A' zone"
}

variable "natgw_b_name" {
  type        = "string"
  description = "Name of nat geteway 'B' zone"
}

variable "vpngw_name" {
  type        = "string"
  description = "Name of vpn gateway"
}

variable "zone_name" {
  type        = "string"
  description = "Name of new zone in Route53"
  default     = ""
}

variable "public_rt_name" {
  type        = "string"
  description = "Name of public route"
}

variable "private_rt_a_name" {
  type        = "string"
  description = "Name of private route 'A' zone"
}

variable "private_rt_b_name" {
  type        = "string"
  description = "Name of private route 'B' zone"
}
