output "workspace" {
  value = "${terraform.workspace}"
}

output "openvpn_public_ip" {
  description = "OpenVPN AS public ip"
  value       = "${aws_eip.openvpn.public_ip}"
}
