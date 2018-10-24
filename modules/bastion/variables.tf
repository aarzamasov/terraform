variable "bucket_name" {
  description = "Bucket name were the bastion will store the logs"
}

variable "bucket_versioning" {
  default = true
  description = "Enable bucket versioning or not"
}

variable "tags" {
  description = "A mapping of tags to assign"
  default     = {}
  type        = "map"
}

variable "ssh_key" {
  description = "Select the key pair to use to launch the bastion host"
}

variable "instance_type" {
  description = "Instance type for the bastion"
}

variable "disk_size" {
  description = "Size of the root volume"
}

variable "region" {
  description = "Region for the instance"
}

variable "bastion_amis" {
  type = "map"

  default = {
    "us-east-1"      = "ami-0ff8a91507f77f867"
    "us-east-2"      = "ami-0b59bfac6be064b78"
    "us-west-2"      = "ami-d0f506b0"
    "us-west-1"      = "ami-6e84fa0e"
    "eu-west-1"      = "ami-b0ac25c3"
    "eu-central-1"   = "ami-d3c022bc"
    "ap-southeast-1" = "ami-1ddc0b7e"
    "ap-northeast-2" = "ami-cf32faa1"
    "ap-northeast-1" = "ami-29160d47"
    "ap-southeast-2" = "ami-0c95b86f"
    "sa-east-1"      = "ami-fb890097"
  }
}

variable "associate_public_ip_address" {
  default = true
}

variable "log_auto_clean" {
  description = "Enable or not the lifecycle"
  default     = false
}

variable "log_standard_ia_days" {
  description = "Number of days before moving logs to IA Storage"
  default     = 30
}

variable "log_glacier_days" {
  description = "Number of days before moving logs to Glacier"
  default     = 60
}

variable "log_expiry_days" {
  description = "Number of days before logs expiration"
  default     = 90
}

variable "bastion_sg" {
  description = "security groups to attach to the instance"
  default     = ""
}


variable "subnet_id" {
  description = "subnet id for the instance"
  default     = ""
}

variable "stage" {
  type = "string"
  description = "Stage name for tags. This is be represented in tags"
}
