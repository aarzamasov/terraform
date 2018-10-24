resource "aws_db_subnet_group" "rds" {
  name        = "${length(var.name) == 0 ? "${var.stage}-rds" : var.name}"
  description = "Our main group of subnets"
  subnet_ids  = ["${var.subnets}"]
}

resource "aws_db_parameter_group" "rds" {
  name_prefix = "${length(var.name) == 0 ? "${var.engine}-${var.stage}" : "${var.name}"}-"
  family      = "${var.default_parameter_group_family}"
  description = "RDS ${var.stage} parameter group for ${var.engine}"
  parameter   = "${var.default_db_parameters[var.engine]}"
}

module "label_db_instance" {
  source      = "../null-label"
  name        = "${length(var.name) == 0 ? "${var.stage}-rds${var.number}" : var.name}"
  stage       = "${var.stage}"
  label_order = ["name", "stage", "namespace"]
  tags = {
    "tf-workspace"  = "${terraform.workspace}"
  }
}


resource "aws_db_instance" "rds" {
  identifier                = "${length(var.name) == 0 ? "${var.stage}-rds${var.number}" : var.name}"
  allocated_storage         = "${var.storage}"
  engine                    = "${var.engine}"
  engine_version            = "${var.engine_version}"
  instance_class            = "${var.size}"
  storage_type              = "${var.storage_type}"
  username                  = "${var.rds_username}"
  password                  = "${var.rds_password}"
  vpc_security_group_ids    = ["${var.security_groups}"]
  db_subnet_group_name      = "${aws_db_subnet_group.rds.id}"
  parameter_group_name      = "${var.rds_custom_parameter_group_name == "" ? aws_db_parameter_group.rds.id : var.rds_custom_parameter_group_name}"
  multi_az                  = "${var.multi_az}"
  backup_retention_period   = "${var.backup_retention_period}"
  storage_encrypted         = "${var.storage_encrypted}"
  apply_immediately         = "${var.apply_immediately}"
  skip_final_snapshot       = "${var.skip_final_snapshot}"
  final_snapshot_identifier = "${length(var.name) == 0 ? "${var.stage}-rds${var.number}" : var.name}-final-${md5(timestamp())}"
  availability_zone         = "${var.availability_zone}"
  snapshot_identifier       = "${var.snapshot_identifier}"

  tags   = "${module.label_db_instance.tags}"

  lifecycle {
    ignore_changes = ["final_snapshot_identifier"]
  }
}


