provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "staging" {
  name           = var.table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  attribute {
    name = "id"
    type = "N"
  }
}

resource "aws_dynamodb_table" "prod" {
  name           = "prod_${var.table_name}"
  billing_mode   = "PROVISIONED"
  read_capacity  = var.read_capacity * 2
  write_capacity = var.write_capacity * 2

  attribute {
    name = "id"
    type = "N"
  }

}


