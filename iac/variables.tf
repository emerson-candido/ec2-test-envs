variable "compute" {
    description = "Compute settings"
    type = map(any)
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

variable "routes" {
    description = "Route settings"
    type = map(any)
}

variable "security_group_rules" {
    description = "Security Group rules"
    type = map(any)
}

variable "subnet" {
    description = "Subnet settings"
    type = map(any)
}

variable "vpc" {
    description = "VPC settings"
    type = map(any)
}
