output "rds_password" {
  value = "${module.ssm.rds_password}"
}
output "openvpn_pass" {
  value = "${module.ssm.openvpn_pass}"
}
