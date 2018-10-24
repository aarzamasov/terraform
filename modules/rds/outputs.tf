output "rds_port" {
  value = "${local.port}"
}

output "rds_address" {
  value = "${aws_db_instance.rds.address}"
}

output "rds_id" {
  value = "${aws_db_instance.rds.id}"
}

output "rds_arn" {
  value = "${aws_db_instance.rds.arn}"
}

output "aws_db_subnet_group_id" {
  value = "${aws_db_subnet_group.rds.id}"
}
