# TerraWeek Challenge – Day 1
---

## Task 1: Understand IaC & Terraform

# What is Infrastructure as Code (IaC)?
Infrastructure as Code (IaC) is the practice of managing and provisioning infrastructure using code instead of manually configuring resources through cloud consoles.

### Benefits
* Automation
* Repeatability
* Version Control
* Consistency
* Reduced Human Errors
* Faster Deployments

---

# What is Terraform?
Terraform is an open-source Infrastructure as Code tool developed by HashiCorp. It allows users to define infrastructure using a declarative language called HCL (HashiCorp Configuration Language) and provision resources across multiple cloud providers.

### Why Terraform?
* Declarative configuration
* Multi-cloud support
* Provider-agnostic
* Reusable modules
* State management
* Large community and ecosystem

---

# Terraform vs Other Tools

| Tool               | Comparison                                                                                                      |
| ------------------ | --------------------------------------------------------------------------------------------------------------- |
| OpenTofu           | Community-driven open-source fork of Terraform.                                                                 |
| Pulumi             | Uses programming languages like Python, TypeScript, and Go instead of HCL.                                      |
| AWS CloudFormation | AWS-only Infrastructure as Code solution.                                                                       |
| Ansible            | Primarily used for configuration management and application deployment rather than infrastructure provisioning. |

---
## Task 2: Install Terraform (latest version)
# Terraform Installation
Installed the latest version of Terraform using the official HashiCorp installation guide.

Verified installation using:
```bash
terraform version

terraform -help
```

Also installed:
* HashiCorp Terraform Extension for VS Code

---

## Task 3: Learn 6 Crucial Terraform Terminologies

# Provider
A provider is a plugin that allows Terraform to connect to a cloud or service like AWS, Azure, or Docker.
Example: provider "aws" { region = "us-east-1" }

# Resource
Explanation: A resource is any infrastructure object that Terraform creates and manages, such as a virtual machine or storage bucket.  Example: resource "aws_s3_bucket" "mybucket" {}

# State
Explanation: State is the file where Terraform stores information about the infrastructure it manages.  Example: terraform.tfstate keeps track of created resources.

# Plan
Explanation: A plan shows what Terraform will create, update, or delete before making any changes.  Example: Run terraform plan to preview changes.

# HCL (HashiCorp Configuration Language)
Explanation: HCL is the language used to write Terraform configuration files.  Example: resource "aws_instance" "web" {}

# Module
Explanation: A module is a reusable collection of Terraform code that helps avoid repeating the same configuration.  Example: module "network" { source = "./network" }

---
## Task 4: Your First Terraform Config (no cloud account needed!)

# Terraform Workflow

Completed the following Terraform workflow:

```bash
terraform init
```

Initializes the working directory and downloads required providers.

---

```bash
terraform fmt
```

Formats Terraform configuration files.

---

```bash
terraform validate
```

Validates Terraform syntax and configuration.

---

```bash
terraform plan
```

Displays the execution plan.

---

```bash
terraform apply
```

Creates the defined resources.

---

```bash
cat greeting.txt
```

Verified the generated file created by Terraform.

---

```bash
terraform destroy
```

Destroyed all managed resources.

---
