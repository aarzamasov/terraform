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


data "archive_file" "file-lambda_create_AMI" {
  type        = "zip"
  output_path = "${path.module}/files/lambda_function_create_ami.zip"

  source {
    content  = "${data.template_file.template_create_AMI.rendered}"
    filename = "lambda_create_AMI.js"
  }
}

data "archive_file" "file-lambda_delete_AMI" {
  type        = "zip"
  output_path = "${path.module}/files/lambda_function_create_ami.zip"

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
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
  runtime          = "nodejs6.10"
}
