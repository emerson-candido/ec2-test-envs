resource "aws_instance" "ec2" {
    ami = var.compute.ami
    availability_zone = var.az
    instance_type = var.compute.instance_type
    ipv6_address_count = var.compute.ipv6_address_count
    key_name = aws_key_pair.ssh_key.key_name
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.security_group_ids

    tags = {
        environment = var.env
        product = var.product
        Name = local.default_name
    }

    depends_on = [ aws_key_pair.ssh_key ]
}
