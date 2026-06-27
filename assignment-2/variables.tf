# EC2 instance type variable (default is small free-tier friendly size)
variable "instance_type" {
  default = "t3.micro"
}

# Key pair name used for SSH access into EC2 (important for debugging)
variable "key_name" {
  description = "EC2 Key Pair Name"
}

# Security group IDs to control inbound/outbound traffic
variable "security_group_ids" {
  description = "List of Security Group IDs"
  type        = list(string)
}