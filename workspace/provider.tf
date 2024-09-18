terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  backend "s3" {
    bucket         = "gopi-81s-remote-state"
    key            = "remote-state-workspace"
    region         = "us-east-1"
    dynamodb_table = "gopi-81s-locking"

  }

}

#configue the aws provider
provider "aws" {
  region = "us-east-1"
}