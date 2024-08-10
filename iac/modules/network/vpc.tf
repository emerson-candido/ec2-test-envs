resource "aws_vpc" "vpc" {
    assign_generated_ipv6_cidr_block = var.vpc.assign_generated_ipv6_cidr_block
    cidr_block = var.vpc.cidr_block
    enable_dns_hostnames = var.vpc.enable_dns_hostname
    enable_dns_support = var.vpc.enable_dns_support

    tags = {
        environment = var.env
        product = var.product
        Name = local.default_name
    }
}
