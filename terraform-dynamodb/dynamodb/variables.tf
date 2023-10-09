variable "table_name" {
    description = "Enter the table name"
    type = string
}

variable "read_capacity" {
    description = "read capacity units for the dynamodb table"
    type = number
    default = 5
}

variable "write_capacity" {
    description = "write capacity units for the dynamodb table"
    type = number
    default = 5
}

