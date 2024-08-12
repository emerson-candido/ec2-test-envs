output "ec2_public_ip" {
    value = module.compute.ec2_public_ip
}

output "ec2_ssh_private_key_path" {
    value = var.compute.ssh_private_key_path
}

output "ec2_user" {
    value = var.compute.user
}
