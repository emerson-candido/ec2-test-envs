compute = {}

env = ""
product = ""
region = ""

routes = {
    default_route_ipv4_cidr = "0.0.0.0/0"
    default_route_ipv6_cidr = "::/0"
}

security_group_rules = {}

subnet = {
    assign_ipv6_address_on_creation = true
    availability_zone = "a"
    map_public_ip_on_launch = true
}

vpc = {
    assign_generated_ipv6_cidr_block = true
    cidr_block = "10.0.0.0/16"
    enable_dns_hostname = true
    enable_dns_support = true
}
