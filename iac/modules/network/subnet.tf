resource "aws_subnet" "subnet" {
    assign_ipv6_address_on_creation = var.subnet.assign_ipv6_address_on_creation
    availability_zone = "${var.region}${var.subnet.availability_zone}"
    cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, 1)
    ipv6_cidr_block = cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 1)
    map_public_ip_on_launch = var.subnet.map_public_ip_on_launch
    vpc_id = aws_vpc.vpc.id

    tags = {
        environment = var.env
        product = var.product
        Name = local.default_name
    }
}
