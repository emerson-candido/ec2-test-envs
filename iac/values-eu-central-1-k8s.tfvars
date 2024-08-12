compute = {
    ami = "ami-0e872aee57663ae2d" #Ubuntu Server 24.04 LTS (HVM), SSD Volume Type
    instance_type = "t2.medium"
    ipv6_address_count = 1
    second_disk_name = "/dev/xvdh"
    second_disk_size = 50
    ssh_private_key_path = "~/.ssh/personal_id_ed25519"
    ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKf1KDEi7BKLR/aabiG/lkJHA/eP+dznDMKmbTD7kwSX emerson.candido@live.com"
    user = "ubuntu"
}

env = "deepc-slo"
product = "k8s"
region = "eu-central-1"

security_group_rules = {
    "ingress_ssh_ipv4" = {
        type = "ingress"
        protocol = "ipv4"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 22
        ip_protocol = "tcp"
    },
    "ingress_kube_ipv4" = {
        type = "ingress"
        protocol = "ipv4"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 6443
        ip_protocol = "tcp"
    },
    "ingress_http_ipv4" = {
        type = "ingress"
        protocol = "ipv4"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 30080
        ip_protocol = "tcp"
    },
    "ingress_https_ipv4" = {
        type = "ingress"
        protocol = "ipv4"
        cidr_block = "0.0.0.0/0"
        from_port = 0
        to_port = 30443
        ip_protocol = "tcp"
    },
    "ingress_ssh_ipv6" = {
        type = "ingress"
        protocol = "ipv6"
        cidr_block = "::/0"
        from_port = 0
        to_port = 22
        ip_protocol = "tcp"
    },
    "egress_all_ipv6" = {
        type = "egress"
        protocol = "ipv6"
        cidr_block = "::/0"
        from_port = -1
        to_port = -1
        ip_protocol = "-1"
    },
    "egress_all_ipv4" = {
        type = "egress"
        protocol = "ipv4"
        cidr_block = "0.0.0.0/0"
        from_port = -1
        to_port = -1
        ip_protocol = "-1"
    }
}

vpc = {
    assign_generated_ipv6_cidr_block = true
    cidr_block = "10.0.0.0/16"
    enable_dns_hostname = true
    enable_dns_support = true
}
