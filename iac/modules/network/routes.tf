resource "aws_default_route_table" "default_route_table" {
    default_route_table_id = aws_vpc.vpc.default_route_table_id

    route {
        cidr_block = var.routes.default_route_ipv4_cidr
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

    route {
        ipv6_cidr_block = var.routes.default_route_ipv6_cidr
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

    tags = {
        environment = var.env
        product = var.product
        Name = local.default_name
    }
}

resource "aws_route_table_association" "route_table_association" {
    subnet_id      = aws_subnet.subnet.id
    route_table_id = aws_default_route_table.default_route_table.id
}
