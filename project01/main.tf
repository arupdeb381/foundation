terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket       = "aruptflab"
    key          = "envs/dev/terraform.tfstate"   # path within bucket, unique per project/env
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true   # native S3 locking (Terraform >= 1.10, no DynamoDB needed)
  }
}

provider "aws" {
  region = "us-east-1" # Update to your preferred AWS region
}