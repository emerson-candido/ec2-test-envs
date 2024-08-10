resource "aws_volume_attachment" "ebs_att" {
    count = var.compute.second_disk_size > 0 ? 1 : 0

    device_name = var.compute.second_disk_name
    volume_id   = aws_ebs_volume.ebs[count.index].id
    instance_id = aws_instance.ec2.id
}
