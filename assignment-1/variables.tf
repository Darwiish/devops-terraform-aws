# AWS region for resource deployment
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}