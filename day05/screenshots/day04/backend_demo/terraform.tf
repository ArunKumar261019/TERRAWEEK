terraform {
  required_version = ">= 1.11" # use_lockfile is GA from 1.11

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }
  backend "s3" {
    bucket       = "terraweek-state-arun-2026"
    key          = "day04/backend_demo/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # ✅ S3-native state locking (Terraform 1.11+)
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project   = "terraweek-2026"
      ManagedBy = "terraform"
      Day       = "04"
    }
  }
}
