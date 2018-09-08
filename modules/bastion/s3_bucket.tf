resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}"
  acl    = "bucket-owner-full-control"

  versioning {
    enabled = "${var.bucket_versioning}"
  }

  lifecycle_rule {
    id      = "log"
    enabled = "${var.log_auto_clean}"

    prefix = "logs/"

    tags {
      "rule"      = "log"
      "autoclean" = "${var.log_auto_clean}"
    }

    transition {
      days          = "${var.log_standard_ia_days}"
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = "${var.log_glacier_days}"
      storage_class = "GLACIER"
    }

    expiration {
      days = "${var.log_expiry_days}"
    }
  }

  tags = "${merge(var.tags)}"
}