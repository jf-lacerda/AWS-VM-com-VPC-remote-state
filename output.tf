terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.55.0"
    }
  }
  
  backend "s3" {
    bucket = "my-backet01"
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-1"
    assume_role = {
      role_arn = "arn:aws:iam::PRODUCTION-ACCOUNT-ID:role/Terraform"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner = "joaolacerda"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "my-backet01"
    key = "valaws-vm/terraform.tfstateue"
    region = "us-east-1"
  }
}