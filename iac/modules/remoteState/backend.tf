locals {
    name = "backend-remote-storage"
    terraform_backend_config_file = format(
        "%s/%s",
        var.terraform_backend_config_file_path,
        var.terraform_backend_config_file_name
    )
    terraform_backend_config_template_file = "${path.module}/${var.terraform_backend_config_template_directory}/${var.terraform_backend_config_template_file}"
}

resource "local_file" "terraform_backend_config" {
    content = templatefile(local.terraform_backend_config_template_file, {
        bucket         = local.bucket
        dynamodb_table = local.bucket
        encrypt        = var.encrypt
        key            = var.terraform_backend_config_key
        region         = var.region
    })
    filename        = local.terraform_backend_config_file
    file_permission = var.terraform_backend_config_file_permission
}
