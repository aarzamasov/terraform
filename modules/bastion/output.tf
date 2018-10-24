output "bucket_name" {
  value = "${aws_s3_bucket.bucket.bucket}"
}

output "public_ip" {
    value = "${aws_instance.bastion.public_ip}"
}