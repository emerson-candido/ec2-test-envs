resource "aws_key_pair" "ssh_key" {
    public_key = var.compute.ssh_public_key
    key_name = local.default_name

    tags = {
        environment = var.env
        product = var.product
        Name = local.default_name
    }
}
