resource "random_string" "password_rds" {
  length  = 16
  upper   = true
  lower   = true
  number  = true
  special = true
}


resource "aws_ssm_parameter" "rds" {
  name  = "/${var.stage}/rds/password"
  value = "${random_string.password_rds.result}"
  type  = "String"
}

resource "random_string" "openvpn_pass" {
  length  = 16
  upper   = true
  lower   = true
  number  = true
  special = true
}

resource "aws_ssm_parameter" "openvpn" {
  name  = "/${var.stage}/openvpn/password"
  value = "${random_string.password_rds.result}"
  type  = "String"
}