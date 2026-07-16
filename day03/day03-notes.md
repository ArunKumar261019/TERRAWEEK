## Task 1: Providers & Version Pinning

required_version = ">= 1.10" Only use Terraform version 1.10 or higher.
required_providers tells Terraform which provider to download.
"~>"? This is called version pinning
When you write version = "~> 6.0" Terraform can install
6.0
6.1
6.2
6.8
But not 7.0 because version 7 may contain breaking changes.

Add another provider:
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}
aliases let you manage resources in multiple AWS regions.

## Task 2: Resources vs Data Sources

resource "aws_vpc" "main"
resource "aws_instance" "web"
The Above two will create infrastructure.

data "aws_ami" "al2023"
data "aws_availability_zones" "available"
These only read information from AWS.

Resources create, update and manage infrastructure. Data sources only retrieve information from existing infrastructure without creating anything.


## Task 3: Provision the Cloud Stack
terraform init -- downloads providers.
terraform validate -- checks configuration syntax.
terraform plan -- shows the proposed changes.
terraform apply -- creates the infrastructure.
terraform state list -- displays the resources managed by Terraform.

## Task 4: Meta-Arguments in Action