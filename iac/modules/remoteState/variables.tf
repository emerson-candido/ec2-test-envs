locals {
    bucket = "remotestate-${var.product}-${var.env}"
}

variable "acl" {
    description = "Name of the ACL to associate the S3 bucket"
    type = string
    default = "private"
}

variable "dynamo_hash_key" {
    description = "Hash key name of Dynamo table"
    type = string
    default = "LockID"
}

variable "dynamo_read_capacity" {
    description = "Read capacity of Dynamo table"
    type = string
    default = "5"
}

variable "dynamo_type" {
    description = "Type of Dynamo table"
    type = string
    default = "S"
}

variable "dynamo_write_capacity" {
    description = "Write capacity of Dynamo table"
    type = string
    default = "5"
}

variable "encrypt" {
    description = "Define if encryption will be enable or not in S3 bucket"
    type = bool
    default = true
}

variable "encryptionAlgorithm" {
    description = "Algorithm of the encryption to apply in the bucket"
    type = string
    default = "AES256"
}

variable "env" {
    description = "Environment name to deploy resources"
    type = string
}

variable "objectLockState" {
    description = "Enable or disable object lock in S3 buckets"
    type = bool
    default = true
}

variable "product" {
    description = "Name of the product to associate resources"
}

variable "region" {
    description = "Name of the region to deploy bucket"
}

variable "terraform_backend_config_file_name" {
    description = "Name of backend file to be created"
    type        = string
    default     = "backend.tf"
}

variable "terraform_backend_config_file_path" {
    description = "Directory to host backend file"
    type        = string
    default     = "."
}

variable "terraform_backend_config_file_permission" {
    description = "Set permissions on backend file"
    type        = string
    default     = "0644"
}

variable "terraform_backend_config_key" {
    description = "Key name of remote state"
    type = string
    default = "terraform.tfstate"
}

variable "terraform_backend_config_profile" {
    description = "Define the profile of the backend"
    type        = string
    default     = ""
}

variable "terraform_backend_config_template_directory" {
    description = "Set the directory to host template of backend file"
    type        = string
    default     = "templates"
}

variable "terraform_backend_config_template_file" {
    description = "Name of template file for backend"
    type        = string
    default     = "terraform.tf.tpl"
}

variable "versioning_status" {
    description = "Enable or disable the versioning in S3 bucket"
    type = string
    default = "Enabled"
}
