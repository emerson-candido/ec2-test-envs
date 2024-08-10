# EC2 instance with K3s deployed via Terraform

This `Terraform` module is responsible to deploy the components:

- `S3 bucket`: Host the remote state of the Terraform components
- `ec2`: Deploy the instance to host the `K3s` cluster
- `ebs`: Additional disk to host data of `K3s` cluster on `ec2` instance
- `key_pair`: Host the `ssh` key to reach the `ec2` instance
- `vpc`: Network settings of the `ec2` instance
- `security_group`: Control network access settings of deployed `ec2` instance
