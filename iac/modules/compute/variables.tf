locals {
    default_name = "${var.product}-${var.env}"
}

variable "compute" {
    description = "Compute settings"
    type = object({
        ami = string
        instance_type = string
        ipv6_address_count = number
        second_disk_name = string
        second_disk_size = number
        ssh_public_key = string
    })
}

variable "az" {
    description = "Availability zone to host EC2 instance"
    type = string
}

variable "env" {
    description = "Environment to deploy resources"
    type = string
}

variable "product" {
    description = "Name of the product to associate resources"
    type = string
}

variable "region" {
    description = "Region to deploy resources"
    type = string
}

variable "security_group_ids" {
    description = "List of security groups to associate in EC2 instance"
    type = list(string)
}

variable "subnet_id" {
    default = "Subnet to associate the instance"
    type = string
}
