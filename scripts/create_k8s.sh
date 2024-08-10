#!/bin/bash
terraform init

terraform apply \
  --var-file=values.tfvars \
  --var-file=values-eu-central-1-k8s.tfvars

 terraform init -migrate-state
