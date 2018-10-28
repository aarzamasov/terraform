output "bastion_id" {
  value = "${module.security_groups.bastion_id}"
}

output "rds_id" {
  value = "${module.security_groups.rds_id}"
}

output "app_id" {
  description = "Applicaiton security group id"
  value       = "${module.security_groups.app_id}"
}
