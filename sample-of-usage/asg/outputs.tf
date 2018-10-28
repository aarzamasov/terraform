output "this_launch_configuration_id" {
  description = "The ID of the launch configuration"
  value = "${module.launch_configuration.this_launch_configuration_id}"
}

output "this_launch_configuration_name" {
  description = "The name of the launch configuration"
  value = "${module.launch_configuration.this_launch_configuration_name}"
}

output "this_autoscaling_group_id" {
  description = "The autoscaling group id"
  value = "${module.launch_configuration.this_autoscaling_group_id}"
}

output "this_autoscaling_group_name" {
  description = "The autoscaling group name"
  value = "${module.launch_configuration.this_autoscaling_group_name}"
}

output "this_autoscaling_group_arn" {
  description = "The ARN for this AutoScaling Group"
  value = "${module.launch_configuration.this_autoscaling_group_arn}"
}

output "this_autoscaling_group_min_size" {
  description = "The minimum size of the autoscale group"
  value = "${module.launch_configuration.this_autoscaling_group_min_size}"
}

output "this_autoscaling_group_max_size" {
  description = "The maximum size of the autoscale group"
  value = "${module.launch_configuration.this_autoscaling_group_max_size}"
}

output "this_autoscaling_group_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value = "${module.launch_configuration.this_autoscaling_group_desired_capacity}"
}

output "this_autoscaling_group_default_cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity"
  value = "${module.launch_configuration.this_autoscaling_group_default_cooldown}"
}

output "this_autoscaling_group_health_check_grace_period" {
  description = "Time after instance comes into service before checking health"
  value = "${module.launch_configuration.this_autoscaling_group_health_check_grace_period}"
}

output "this_autoscaling_group_health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done"
  value = "${module.launch_configuration.this_autoscaling_group_health_check_type}"
}
### ELB
output "this_elb_id" {
  description = "The name of the ELB"
  value       = "${module.elb.this_elb_id}"
}

output "this_elb_arn" {
  description = "The ARN of the ELB"
  value       = "${module.elb.this_elb_arn}"
}

output "this_elb_name" {
  description = "The name of the ELB"
  value       = "${module.elb.this_elb_name}"
}

output "this_elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = "${module.elb.this_elb_dns_name}"
}

output "this_elb_instances" {
  description = "The list of instances in the ELB"
  value       = "${module.elb.this_elb_instances}"
}

output "this_elb_zone_id" {
  description = "The canonical hosted zone ID of the ELB (to be used in a Route 53 Alias record)"
  value       = "${module.elb.this_elb_zone_id}"
}