# DevOps Terraform AWS Project

This repository contains AWS infrastructure automation projects built using Terraform and cloud-init. The goal is to demonstrate Infrastructure as Code (IaC), cloud provisioning, and automated server configuration using AWS services.

---

## Project Structure

assignment-1/   WordPress deployment using Terraform  
assignment-2/   EC2 deployment with cloud-init automation  

---

## Assignment 1 – WordPress Deployment Using Terraform

### Objective
Deploy a WordPress application on AWS using Terraform.

### Implementation
- EC2 instance provisioning
- Security group configuration (SSH and HTTP access)
- Apache, PHP, and MySQL installation
- WordPress setup using user_data script

### Result
A functional WordPress website deployed on an EC2 instance accessible via public IP.

---

## Assignment 2 – EC2 Deployment with Cloud-Init

### Objective
Automate EC2 provisioning and configuration using Terraform and cloud-init.

### Implementation
- EC2 instance running Ubuntu 22.04
- Dynamic AMI selection using Terraform data source
- Cloud-init YAML configuration
- Automatic installation and configuration of NGINX on boot
- Fully automated instance setup with no manual intervention

### Evidence
- Cloud-init execution logs
- EC2 instance running status
- Security group configuration
- Terraform deployment output
- NGINX web server response

---

## Key Differences Between Assignment 1 and Assignment 2

| Feature | Assignment 1 | Assignment 2 |
|--------|-------------|--------------|
| Automation level | Partial automation | Fully automated |
| Configuration method | user_data script | cloud-init YAML |
| Application | WordPress stack | NGINX web server |
| Setup style | Manual + script-based | Fully automated boot process |
| DevOps maturity | Beginner level | Intermediate level |
| Best practice alignment | Basic provisioning | Cloud-native automation |

---

## DevOps Concepts Demonstrated

- Infrastructure as Code using Terraform
- AWS EC2 provisioning and management
- Security group configuration
- Cloud-init automation for instance bootstrapping
- Linux server configuration
- Web server deployment (Apache and NGINX)
- Git version control and project structuring

---

## Screenshots

Screenshots for Assignment 2 are stored in:

assignment-2/screenshots/

They include:
- Terraform apply output
- EC2 instance running
- Security group configuration
- Cloud-init logs
- NGINX web page verification

---

## Technologies Used

- Terraform
- AWS EC2
- Ubuntu 22.04 LTS
- Cloud-init
- NGINX
- Apache (Assignment 1)
- Git and GitHub

---

## Author

This project was built as part of a DevOps learning journey focusing on AWS infrastructure automation, Terraform, and cloud-native deployment practices.

---

## Notes

- All infrastructure is created using Terraform
- No manual server configuration is required in Assignment 2
- Sensitive files such as `.pem` and `terraform.tfstate` are excluded via `.gitignore`