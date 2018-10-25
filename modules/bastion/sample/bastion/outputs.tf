# Bucket Name for open keys
output "bucket_name" {
  value = "${module.bastion.bucket_name}"
}

# Public IP for bastion
output "public_ip" {
  value = "${module.bastion.public_ip}"
}
