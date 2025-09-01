# Terraform AWS EC2 Project
This is a simple project where I used **Terraform** to deploy an **EC2 instance on AWS** that runs a basic web server.

---
## Goal
- Practice writing Terraform configs.
- Learn how to deploy resources on AWS automatically.
---

## Prerequisites

Before running this project, make sure you have:

- **Terraform** installed → [Install Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- An **AWS account** with Access Key for CLI
- **AWS CLI** installed and configured → [Install Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
---

## How to Run
1. Clone the repo
   ```bash
   git clone git@github.com:AhmedElMansi/terraform-aws.git
   cd terraform-aws
   ```
2. Add your region in providers.tf
   ```
   provider "aws" {
     region  = "<add_your_preferred_region>"
   }
   ```
3. add your ssh key pair name to access the machine using SSH
   ```
   resource "aws_instance" "webServer" {
   ....
   ....
     key_name  = "<add_your_access_key_name>"
   ....
   }
   ```
4. Initialize Terraform
   ```
   terraform init
   ```
5. Validate the configuration
   ```
   terraform validate
   ```
6. Review the execution plan
   ```
   terraform plan
   ```
7. Deploy resources
   ```
   terraform apply -auto-approve
   ```
8. Destroy resources when done if not needed
   ```
   terraform destroy -auto-approve
   ```
---
## Result
<img width="985" height="423" alt="Screenshot From 2025-09-01 02-17-56" src="https://github.com/user-attachments/assets/0232850e-79b8-4882-8304-d38ee3f1dd0a" />
