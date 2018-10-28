# Variables

variable "instance_type" {}

variable "ssh_key" {}

variable "openvpn_admin_pw" {}

variable "openvpn_admin_user" {}

variable "openvpn_name" {}

variable "subnet_id" {}

variable "openvpn_sg" {
    default = []
}
variable "stage" {}
