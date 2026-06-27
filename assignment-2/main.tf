# Fetch latest Ubuntu AMI dynamically (best practice, avoids AMI errors)
data "aws_ami" "ubuntu" {
  most_recent = true

  # Canonical Ubuntu owner
  owners = ["099720109477"]

  # Ubuntu 22.04 LTS filter
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-*"]
  }
}

# Create VPC (fixes "No default VPC" error)
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create Internet Gateway (gives internet access)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# Create public subnet (where EC2 will live)
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Create route table for internet access
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Attach route table to subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# Security group for EC2 (SSH + HTTP access)
resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.main.id

  # SSH access (for debugging)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access (web server)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance with cloud-init automation
resource "aws_instance" "cloudinit_ec2" {

  # Ubuntu AMI
  ami = data.aws_ami.ubuntu.id

  # Instance size
  instance_type = var.instance_type

  # Key pair for SSH access
  key_name = "assignment-2-key"

  # Place EC2 inside public subnet
  subnet_id = aws_subnet.public.id

  # Attach security group
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # Cloud-init script (runs automatically on boot)
  user_data = file("${path.module}/cloud-init.yaml")

  # Name tag
  tags = {
    Name = "Assignment-2-CloudInit"
  }
}