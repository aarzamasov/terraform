output "workspace" {
  value = "${terraform.workspace}"
}
output "bastion_id" {
  value       = "${aws_security_group.bastion.id}"
  description = "Bastion security group id"
}

output "rds_id" {
  value       = "${aws_security_group.rds.id}"
  description = "RDS security group id"
}
output "app_id" {
  value       = "${aws_security_group.app.id}"
  description = "Applicaiton security group id"
}


