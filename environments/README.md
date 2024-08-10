# Applications deployed via Ansible

This `Ansible` module is responsible to deploy the components below on the provisioned `ec2` instance:

- `disk`: Setup `ebs` volume partition by `lvm`
- `k3s`: Install `k3s` on `ec2` instance, and then download the `kubeconfig`
