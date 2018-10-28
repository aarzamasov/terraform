# Workspace name
output "workspace" {
    value = "${module.vpc.workspace}"
}
# VPC Identifier
output "vpc_id" {
    value = "${module.vpc.vpc_id}"
}
# VPC CIDR
output "vpc_cidr" {
    value = "${module.vpc.vpc_cidr}"
}


# Public A subnet identifier
output "public_subnet_a" {
    value = "${module.vpc.public_subnet_a}"
}

# Public B subnet identifier
output "public_subnet_b" {
    value = "${module.vpc.public_subnet_b}"
}

# Private A subnet identifier
output "private_subnet_a" {
    value = "${module.vpc.private_subnet_a}"
}

# Private B subnet identifier
output "private_subnet_b" {
    value = "${module.vpc.private_subnet_b}"
}

# NAT Public IP  A zone
output "nat_a_public_ip" {
    value = "${module.vpc.nat_a_public_ip}"
}

# NAT Public IP  B zone
output "nat_b_public_ip" {
    value = "${module.vpc.nat_b_public_ip}"
}

# Internal Zone ID
output "internal_zone_id" {
    value = "${module.vpc.internal_zone_id}"
}

# Public RT identifier
output "public_rt" {
    value = "${module.vpc.public_rt}"
}

# Private RT identifier zone A
output "private_a_rt" {
    value = "${module.vpc.private_a_rt}"
}

# Private RT identifier zone B
output "private_b_rt" {
    value = "${module.vpc.private_b_rt}"
}