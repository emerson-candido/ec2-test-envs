resource "aws_security_group" "security_group" {
    name     = local.default_name
    vpc_id   = aws_vpc.vpc.id

    tags = {
        environment = var.env
        product = var.product
        Name = local.default_name
    }
}

resource "aws_vpc_security_group_ingress_rule" "security_group_ingress_ipv4" {
    for_each = {
        for k, v in var.security_group_rules : k => v
        if v.type == "ingress" && v.protocol == "ipv4"
    }

    cidr_ipv4 = each.value.cidr_block
    from_port = each.value.from_port
    to_port = each.value.to_port
    ip_protocol = each.value.ip_protocol
    security_group_id = aws_security_group.security_group.id

    tags = {
        environment = var.env
        product = var.product
        sg = aws_security_group.security_group.name
        Name = each.key
    }
}

resource "aws_vpc_security_group_ingress_rule" "security_group_ingress_ipv6" {
    for_each = {
        for k, v in var.security_group_rules : k => v
        if v.type == "ingress" && v.protocol == "ipv6"
    }

    cidr_ipv6 = each.value.cidr_block
    from_port = each.value.from_port
    to_port = each.value.to_port
    ip_protocol = each.value.ip_protocol
    security_group_id = aws_security_group.security_group.id

    tags = {
        environment = var.env
        product = var.product
        sg = aws_security_group.security_group.name
        Name = each.key
    }
}

resource "aws_vpc_security_group_egress_rule" "security_group_egress_ipv4" {
    for_each = {
        for k, v in var.security_group_rules : k => v
        if v.type == "egress" && v.protocol == "ipv4"
    }

    cidr_ipv4 = each.value.cidr_block
    from_port = each.value.from_port
    to_port = each.value.to_port
    ip_protocol = each.value.ip_protocol
    security_group_id = aws_security_group.security_group.id

    tags = {
        environment = var.env
        product = var.product
        sg = aws_security_group.security_group.name
        Name = each.key
    }
}

resource "aws_vpc_security_group_egress_rule" "security_group_egress_ipv6" {
    for_each = {
        for k, v in var.security_group_rules : k => v
        if v.type == "egress" && v.protocol == "ipv6"
    }

    cidr_ipv6 = each.value.cidr_block
    from_port = each.value.from_port
    to_port = each.value.to_port
    ip_protocol = each.value.ip_protocol
    security_group_id = aws_security_group.security_group.id

    tags = {
        environment = var.env
        product = var.product
        sg = aws_security_group.security_group.name
        Name = each.key
    }
}
