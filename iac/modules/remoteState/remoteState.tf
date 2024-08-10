resource "aws_s3_bucket" "remoteState" {
    bucket = local.bucket
    force_destroy = true
    object_lock_enabled = var.objectLockState

    tags = {
        environment = var.env
        product = var.product
    }
}

resource "aws_s3_bucket_ownership_controls" "remoteStateOwnershipControls" {
    bucket = local.bucket
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
    depends_on = [ aws_s3_bucket.remoteState ]
}

resource "aws_s3_bucket_acl" "remoteStateAcl" {
    depends_on = [
        aws_s3_bucket.remoteState,
        aws_s3_bucket_ownership_controls.remoteStateOwnershipControls
    ]
    acl    = var.acl
    bucket = aws_s3_bucket.remoteState.id
}

resource "aws_s3_bucket_versioning" "remoteStateVersioning" {
    bucket = aws_s3_bucket.remoteState.id

    versioning_configuration {
        status = var.versioning_status
    }

    depends_on = [ aws_s3_bucket.remoteState ]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "remoteStateEncryption" {
    bucket = aws_s3_bucket.remoteState.id

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm     = var.encryptionAlgorithm
        }
    }

    depends_on = [ aws_s3_bucket.remoteState ]
}
