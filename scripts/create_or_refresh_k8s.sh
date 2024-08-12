#!/bin/bash
set -e

clear

script_dir=$(dirname "$(realpath "$0")")
cd "$script_dir" || exit

./modules/terraform.sh apply values-eu-central-1-k8s.tfvars

INSTANCE_IP=$(./modules/get_terraform_output.sh ec2_public_ip)
INSTANCE_USER=$(./modules/get_terraform_output.sh ec2_user)
INSTANCE_SSH_PRIVATE_KEY=$(./modules/get_terraform_output.sh ec2_ssh_private_key_path)

cd ../environments || exit
ansible-playbook -i "host," --extra-vars "\
  ansible_host=${INSTANCE_IP} \
  ansible_user=${INSTANCE_USER} \
  ansible_ssh_private_key_file=${INSTANCE_SSH_PRIVATE_KEY}" \
  bootstrap_k8s.yaml

echo "You can connect via the command:"
echo "ssh -i ${INSTANCE_SSH_PRIVATE_KEY} ${INSTANCE_USER}@${INSTANCE_IP}"

HTTPS_PORT=$(cat ../environments/roles/packages/vars/ingress.yaml | yq '.ingress_node_port_https')
GRAFANA_ADMIN_PWD=$(cat ../environments/roles/packages/vars/monitoring.yaml | yq '.monitoring_grafana_admin_password')
echo "The Grafana instance is: https://${INSTANCE_IP}:${HTTPS_PORT}/grafana"
echo "User: admin"
echo "Password: ${GRAFANA_ADMIN_PWD}"
