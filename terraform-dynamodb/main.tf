terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

module "dynamodb_test" {
  source      = "./dynamodb"
  table_name  = "test_table"
  read_capacity  = 5
  write_capacity = 5
}

module "dynamodb_prod" {
  source      = "./dynamodb"
  table_name  = "production_table"
  read_capacity  = 10
  write_capacity = 10
}