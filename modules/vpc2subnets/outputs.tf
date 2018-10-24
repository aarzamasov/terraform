# Workspace name
output "workspace" {
  value = "${terraform.workspace}"
}

# VPC Identifier
output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

# VPC CIDR
output "vpc_cidr" {
  value = "${aws_vpc.main.cidr_block}"
}

# Public A subnet identifier
output "public_subnet_a" {
  value = "${aws_subnet.public_subnet_a.id}"
}

# Public B subnet identifier
output "public_subnet_b" {
  value = "${aws_subnet.public_subnet_b.id}"
}

# Private A subnet identifier
output "private_subnet_a" {
  value = "${aws_subnet.private_subnet_a.id}"
}

# Private B subnet identifier
output "private_subnet_b" {
  value = "${aws_subnet.private_subnet_b.id}"
}

# Nat A public ip
output "nat_a_public_ip" {
  value = "${aws_nat_gateway.nat_a.public_ip}"
}

# Nat B public ip
output "nat_b_public_ip" {
  value = "${aws_nat_gateway.nat_b.public_ip}"
}

# Internal Route53 zone id
output "internal_zone_id" {
  value = "${ join("", aws_route53_zone.internal.*.zone_id) }"
}

# Internal Route53 zone name
output "internal_zone_name" {
  value = "${ join("", aws_route53_zone.internal.*.name) }"
}

# Public RT identifier
output "public_rt" {
  value = "${aws_route_table.public_rt.id}"
}

# Private A RT identifier
output "private_a_rt" {
  value = "${aws_route_table.private_a_rt.id}"
}

# Private B RT identifier
output "private_b_rt" {
  value = "${aws_route_table.private_b_rt.id}"
}
