variable "aws_access_key" {
  type = string
  description = "AWS access key"
  sensitive = true
}
variable "aws_secret_key" {
  type = string
  description = "AWS secret key"
    sensitive = true
}
variable "aws_region" {
  type = string
  description = "AWS region"
}

variable "cluster_name"{
    type = string
    description = "Name of the EKS cluster"
}
variable "desired_capacity"{
    type = number
    description = "Desired count of the node"
    default = 5
}

variable "node_role_arn"{
    type = string
    description = "ARN of EKS role"
}