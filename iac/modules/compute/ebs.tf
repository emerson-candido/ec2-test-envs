resource "aws_ebs_volume" "ebs" {
    count = var.compute.second_disk_size > 0 ? 1 : 0

    availability_zone = var.az
    size              = var.compute.second_disk_size

    tags = {
        environment = var.env
        product = var.product
        Name = local.default_name
    }
}
