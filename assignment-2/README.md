# Assignment 2 – EC2 Deployment with Cloud-Init (Terraform)

## Project Overview

This project demonstrates how to automate the deployment of an AWS EC2 instance using Terraform and configure it using cloud-init to install and run a web server automatically on first boot.

The goal is to achieve a fully automated EC2 deployment with zero manual configuration.

---

## Objectives

- Deploy EC2 instance using Terraform
- Configure instance using cloud-init (user-data)
- Automatically install and run NGINX
- Fix AWS networking using custom VPC setup
- Access web server via public IP

---

## Architecture

- Custom VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group (HTTP + SSH)
- EC2 Instance (Ubuntu)
- Cloud-init (NGINX auto-install)

---

## Tools Used

- Terraform (Infrastructure as Code tool)
- Amazon Web Services (AWS Cloud Provider)
- NGINX Web Server
- Ubuntu 22.04 EC2 Instance
- Cloud-init

---

## Deployment Steps

### 1. Initialize Terraform
terraform init

### 2. Validate Configuration
terraform validate

### 3. Plan Infrastructure
terraform plan

### 4. Deploy Infrastructure
terraform apply

### 5. Get Public IP
terraform output public_ip

---

## Screenshots

### 1. Terraform Apply Success
screenshots/terraform-apply-success.png

### 2. EC2 Running in AWS Console
screenshots/ec2-running.png

### 3. Security Group Configuration
screenshots/security-group.png

### 4. Cloud-init Logs
ssh into instance:
cat /var/log/cloud-init-output.log

screenshots/cloud-init-logs.png

### 5. NGINX Web Page
http://51.21.167.51

screenshots/nginx-webpage.png

---

##  Key Learnings

- Terraform infrastructure provisioning on AWS
- Cloud-init automation on EC2 boot
- VPC networking (subnets, IGW, route tables)
- Security groups and inbound/outbound rules
- End-to-end Infrastructure as Code workflow

---

## Security Notes

- SSH (22) enabled for debugging only
- HTTP (80) enabled for web access
- terraform.tfstate and terraform.tfvars excluded via .gitignore

---

## Future Improvements

- Add Load Balancer (ALB)
- Add Auto Scaling Group
- Use Docker instead of NGINX
- Add CI/CD pipeline with GitHub Actions
- Add HTTPS with ACM + Route53

---

## Result

✔ EC2 deployed successfully  
✔ Cloud-init executed automatically  
✔ NGINX installed and running  
✔ Public web server accessible  

---

## Developer

DevOps Learning Project – Assignment 2  
Built using Terraform + AWS + Cloud-init