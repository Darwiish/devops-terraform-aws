# Assignment 1 – Deploy WordPress Using Terraform

## Project Overview

This project demonstrates how to use **Terraform** to provision a complete WordPress environment on AWS.

The infrastructure is fully automated using Terraform and includes:

* Custom VPC
* Public Subnet
* Internet Gateway
* Route Table and Route Table Association
* Security Group
* EC2 Instance
* Apache Web Server
* PHP
* MariaDB
* WordPress installation using a user data script

---

## Objective

Deploy a complete WordPress stack on AWS using Terraform.

The deployment includes:

* EC2 instance running WordPress
* Security Group
* User data script for automatic software installation
* Public endpoint
* Infrastructure managed entirely with Terraform

---

## Architecture

![Architecture](screenshots/Untitled Diagram.drawio.png)


---

## Prerequisites

Before deploying, install:

* Terraform
* AWS CLI
* AWS Account
* Configured AWS credentials

Verify installations:

```bash
terraform version
aws --version
```

---

## Deployment Steps

Initialize Terraform:

```bash
terraform init
```

Review the execution plan:

```bash
terraform plan
```

Deploy the infrastructure:

```bash
terraform apply
```

Destroy the infrastructure when finished:

```bash
terraform destroy
```

---

## Files

### main.tf

Defines all AWS resources including:

* VPC
* Subnet
* Internet Gateway
* Route Table
* Security Group
* EC2 Instance

### provider.tf

Configures the AWS provider.

### versions.tf

Defines the Terraform and provider versions.

### variables.tf

Contains input variables such as:

* AWS Region
* Instance Type
* Key Pair (optional)

### outputs.tf

Displays useful outputs including:

* EC2 Public IP
* WordPress URL

### userdata.sh

Automatically installs:

* Apache
* PHP
* MariaDB
* WordPress

during EC2 instance creation.

---

## Terraform Resources Created

* AWS VPC
* Internet Gateway
* Public Subnet
* Route Table
* Route Table Association
* Security Group
* Ubuntu EC2 Instance

---

## WordPress Configuration

Database Name:

```
wordpress
```

Username:

```
wpuser
```

Password:

```
wppassword
```

Database Host:

```
localhost
```

Table Prefix:

```
wp_
```

---

## Outputs

After a successful deployment Terraform displays:

```text
instance_public_ip = "<EC2 Public IP>"
wordpress_url = "http://<EC2 Public IP>"
```

Example:

```
instance_public_ip = "13.60.xx.xx"
wordpress_url = "http://13.60.xx.xx"
```

---

## Screenshots

### Terraform Apply

![Terraform Apply](screenshots/01-terraform-apply.png)

### EC2 Instance

![EC2 Instance](screenshots/02-aws-ec2-instance.png)

### VPC

![VPC](screenshots/03-aws-vpc.png)

### Security Group

![Security Group](screenshots/04-aws-security-group.png)

### WordPress Installation

![WordPress Install](screenshots/05-wordpress-install-page.png)

### WordPress Dashboard

![WordPress Dashboard](screenshots/06-wordpress-dashboard.png)

---

## Skills Demonstrated

* Infrastructure as Code (IaC)
* Terraform
* AWS EC2
* AWS VPC
* AWS Networking
* Security Groups
* Linux User Data
* Apache Web Server
* PHP
* MariaDB
* WordPress Deployment
* Infrastructure Automation

---

## Cleanup

To remove all resources:

```bash
terraform destroy
```
---

## Benefits of Using Terraform in This Project


Using Terraform in this project provides several important advantages for infrastructure deployment and management:

* Infrastructure as Code (IaC): All AWS resources are defined in code, making the infrastructure easy to manage, version, and reuse.
* Automation: Eliminates manual setup of AWS services and reduces human error by fully automating infrastructure provisioning.
* Consistency: Ensures identical environments are created every time the configuration is applied.
* Scalability: The infrastructure can easily be expanded (e.g., adding load balancers, RDS databases, or Auto Scaling Groups).
* Reusability: The same Terraform code can be reused across different environments such as development, testing, and production.
* Version Control: Infrastructure changes are tracked through Git, allowing better collaboration and rollback options.
* Faster Deployment: Entire AWS infrastructure can be deployed in minutes using a single command (terraform apply).
---

DevOps WordPress Using Terraform on AWS.
