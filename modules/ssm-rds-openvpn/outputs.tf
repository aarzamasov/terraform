output "workspace" {
  value = "${terraform.workspace}"
}
output "rds_password" {
  value       = "${random_string.password_rds.result}"
  description = "RDS root password"
}
output "openvpn_pass" {
  value       = "${random_string.openvpn_pass.result}"
  description = "OpenVpn password"
}
