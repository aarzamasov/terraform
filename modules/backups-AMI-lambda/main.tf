data "template_file" "template_create_AMI" {
  template = "${file("${path.module}/files/lambda-create-AMI.js.tpl")}"

  vars {
    aws_region = "${var.aws_region}"
  }
}

data "template_file" "template_delete_AMI" {
  template = "${file("${path.module}/files/lambda-delete-AMI.js.tpl")}"

  vars {
    aws_region = "${var.aws_region}"
  }
}
data "archive_file" "file_lambda_create_AMI" {
  type        = "zip"
  output_path = "${path.module}/files/lambda_function_create_ami.zip"

  source {
    content  = "${data.template_file.template_create_AMI.rendered}"
    filename = "lambda_create_AMI.js"
  }
}
data "archive_file" "file_lambda_delete_AMI" {
  type        = "zip"
  output_path = "${path.module}/files/lambda_function_delete_ami.zip"

  source {
    content  = "${data.template_file.template_delete_AMI.rendered}"
    filename = "lambda_delete_AMI.js"
  }
}
resource "aws_lambda_function" "lambda_create_AMI" {
  filename         = "${path.module}/files/lambda_function_create_ami.zip"
  function_name    = "lambda_create_AMI"
  role             = "${aws_iam_role.role_backup.arn}"
  handler          = "index.handler"
  source_code_hash = "${data.archive_file.template_create_AMI.output_base64sha256}"
  runtime          = "nodejs6.10"
  memory_size      = 128
  timeout          = 300
}
resource "aws_lambda_function" "lambda_delete_AMI" {
  filename         = "${path.module}/files/lambda_function_delete_ami.zip"
  function_name    = "lambda_delete_AMI"
  role             = "${aws_iam_role.role_backup.arn}"
  handler          = "index.handler"
  source_code_hash = "${data.archive_file.template_delete_AMI.output_base64sha256}"
  runtime          = "nodejs6.10"
  memory_size      = 128
  timeout          = 300
}
resource "aws_cloudwatch_event_rule" "every_five_minutes" {
    name = "every-five-minutes"
    description = "Fires every five minutes"
    schedule_expression = "rate(5 minutes)"
}
resource "aws_cloudwatch_event_target" "check_foo_every_five_minutes_create_AMI_lambda" {
    rule = "${aws_cloudwatch_event_rule.every_five_minutes.name}"
    target_id = "check_foo"
    arn = "${aws_lambda_function.lambda_create_AMI.arn}"
}
resource "aws_lambda_permission" "allow_cloudwatch_to_call_create_AMI" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.lambda_create_AMI.function_name}"
    principal = "events.amazonaws.com"
    source_arn = "${aws_cloudwatch_event_rule.every_five_minutes.arn}"
}

resource "aws_cloudwatch_event_target" "check_foo_every_five_minutes_delete_AMI_lambda" {
    rule = "${aws_cloudwatch_event_rule.every_five_minutes.name}"
    target_id = "check_foo"
    arn = "${aws_lambda_function.lambda_delete_AMI.arn}"
}
resource "aws_lambda_permission" "allow_cloudwatch_to_call_delete_AMI" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.lambda_delete_AMI.function_name}"
    principal = "events.amazonaws.com"
    source_arn = "${aws_cloudwatch_event_rule.every_five_minutes.arn}"
}