terraform {
  backend "s3" {
    bucket = "remotestate-k8s-deepc-slo"
    key    = "terraform.tfstate"
    region = "eu-central-1"

    dynamodb_table = "remotestate-k8s-deepc-slo"
    encrypt        = "true"
  }
}
