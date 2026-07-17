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
The above two read information from AWS.

Resources create, update and manage infrastructure. Data sources only retrieve information from existing infrastructure without creating anything.


## Task 3: Provision the Cloud Stack
terraform init -- downloads providers.
![](screenshots/terraform-init.png)
terraform validate -- checks configuration syntax.
terraform plan -- shows the proposed changes.
![](screenshots/terraform-plan.png)
terraform apply -- creates the infrastructure.
![](screenshots/terraform-apply.png)
![](screenshots/aws-console.png)
terraform state list -- displays the resources managed by Terraform.
![](screenshots/terraform-state-list
.png)

## Task 4: Meta-Arguments in Action

### count

Used `count = 2` to launch two EC2 instances with identical configurations.

**Screenshot**

![](screenshots/task4-count.png)

---

### for_each

Created multiple security groups using a map and `for_each`.

```hcl
for_each = local.security_groups
```

Unlike `count`, every resource has a stable key (`web`, `ssh`) instead of an index.

**Screenshot**

![](screenshots/task4-foreach-apply.png)
![](screenshots/task4-foreach-apply2.png)
![](screenshots/task4-foreach-apply3.png)

---

### depends_on

Explicitly made the EC2 instance wait for the Internet Gateway and Route Table Association before launching.

```hcl
depends_on = [
  aws_internet_gateway.igw,
  aws_route_table_association.public
]
```

**Screenshot**

![](screenshots/task4-depends-on.png)

---

### lifecycle

Implemented several lifecycle rules:

- `create_before_destroy`
- `ignore_changes`
- `prevent_destroy`

```hcl
lifecycle {
  create_before_destroy = true

  ignore_changes = [
    tags["LastModified"]
  ]
}
```

`prevent_destroy` was tested on the VPC to verify Terraform blocks accidental deletion.

**Screenshots**

![](screenshots/terraform-destroy.png)

![](screenshots/aws-ec2-destroy.png)

