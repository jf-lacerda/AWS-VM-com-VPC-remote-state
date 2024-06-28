terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.55.0"
    }
  }

  backend "s3" {
    bucket = "joaolacerda-terraform001"
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "joaolacerda"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "joaolacerda-terraform001"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
