resource "aws_dynamodb_table" "remoteStateLock" {
    name           = local.bucket
    read_capacity  = var.dynamo_read_capacity
    write_capacity = var.dynamo_write_capacity
    hash_key       = var.dynamo_hash_key
    attribute {
        name = var.dynamo_hash_key
        type = var.dynamo_type
    }
    tags = {
        environment = var.env
        product = var.product
    }
}
