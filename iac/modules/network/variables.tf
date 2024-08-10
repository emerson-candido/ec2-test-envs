locals {
    default_name = "${var.product}-${var.env}-${var.region}"
}

variable "env" {
    description = "Environment name to deploy resources"
    type = string
}

variable "product" {
    description = "Name of the product to associate resources"
}

variable "region" {
    description = "Name of the region to deploy bucket"
}

variable "routes" {
    description = "Route settings"
    type = object({
        default_route_ipv4_cidr = string
        default_route_ipv6_cidr = string
    })
}

variable "security_group_rules" {
    type = map(any)
}

variable "subnet" {
    description = "Subnet settings"
    type = object({
        assign_ipv6_address_on_creation = bool
        availability_zone = string
        map_public_ip_on_launch = bool
    })
}

variable "vpc" {
    description = "VPC Settings"
    type = object({
        assign_generated_ipv6_cidr_block = bool
        cidr_block = string
        enable_dns_hostname = bool
        enable_dns_support = bool
    })
}
