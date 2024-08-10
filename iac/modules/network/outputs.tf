output "security_group_id" {
    value = aws_security_group.security_group.id
}

output "subnet_az" {
    value = aws_subnet.subnet.availability_zone
}

output "subnet_id" {
    value = aws_subnet.subnet.id
}
