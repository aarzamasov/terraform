variable "vpc_id" {
  description = "Management VPC ID"
}

variable "tags" {
  description = "Additional tags. Tag Name will be added automatically"
  default     = {}
}

variable "stage" {
  description = "Stage name for tags"
}

variable "cidr_blocks_allow" {
  description = "CIDR blocks for allowing to pecific port"
  default     = []
}
