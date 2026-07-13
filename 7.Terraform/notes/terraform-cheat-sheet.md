# Terraform Cheat Sheet (Learning Notes)

Plain English to keep it simple for learning and revision!
------------------------------------------------------------------------

# What is Terraform?

Terraform is an **Infrastructure as Code (IaC)** tool created by HashiCorp.

Instead of manually clicking around AWS, Azure or Google Cloud, you describe your infrastructure in code (`.tf` files), and Terraform builds it for you.

Think of it like this:

-   Traditional way:
    -   Click buttons in AWS Console
    -   Easy to forget what you changed
    -   Difficult to repeat
-   Terraform way:
    -   Write code once
    -   Run Terraform
    -   Terraform creates everything exactly the same every time

Terraform is **declarative**.

That means you tell Terraform **what you want**, not **how to build it**.

Example:

``` hcl
resource "aws_instance" "web" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
}
```

You're saying:

> "I want an EC2 instance that looks like this."

Terraform figures out the steps.

------------------------------------------------------------------------

# Infrastructure as Code (IaC)

Infrastructure as Code means your servers, networks, databases and cloud resources all live in code.

Benefits:

-   Repeatable
-   Version controlled
-   Easy to review
-   Easy to recover
-   Less human error

------------------------------------------------------------------------

# Terraform is Cloud Agnostic

Cloud agnostic means Terraform is **not locked to one cloud provider**.

The same workflow works with:

-   AWS
-   Azure
-   Google Cloud
-   Kubernetes
-   GitHub
-   Cloudflare
-   Hundreds more providers

The workflow never changes:

    init
    plan
    apply

Only the provider changes.

------------------------------------------------------------------------

# The Terraform Workflow

Always remember this order:

## 1. terraform init

Initialises the project.

Downloads:

-   providers
-   modules
-   backend configuration

Always run first.

------------------------------------------------------------------------

## 2. terraform validate

Checks syntax.

Does NOT create anything.

Use it before planning.

------------------------------------------------------------------------

## 3. terraform plan

Shows what Terraform wants to do.

Nothing changes yet.

You'll see symbols:

  Symbol   Meaning
  -------- ---------
  \+       Create
  \~       Modify
  \-       Destroy

------------------------------------------------------------------------

## 4. terraform apply

Actually makes the changes.

Creates, updates or deletes infrastructure.

------------------------------------------------------------------------

## 5. terraform destroy

Deletes everything Terraform manages.

------------------------------------------------------------------------

# Providers

A provider is a plugin that lets Terraform talk to APIs.

Example:

``` hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

Without a provider Terraform has no idea how to talk to AWS.

------------------------------------------------------------------------

# Resources

Resources are the building blocks.

Every resource creates something.

Example:

``` hcl
resource "aws_instance" "web" {
}
```

Examples:

-   EC2
-   VPC
-   Security Groups
-   S3
-   Databases

------------------------------------------------------------------------

# Terraform State

The state file is probably the most important concept.

Default file:

    terraform.tfstate

It stores:

-   what Terraform created
-   IDs
-   relationships
-   current infrastructure

Terraform compares:

Desired state (.tf files)

vs

Current state (terraform.tfstate)

Then works out what must change.

------------------------------------------------------------------------

# Idempotency

A fancy word with a simple meaning.

Running Terraform 10 times should give the same result as running it
once.

If nothing changed you'll normally see:

    No changes.

------------------------------------------------------------------------

# Local vs Remote State

## Local

Stored on your own computer.

Good for:

-   learning
-   personal projects

Bad for teams.

------------------------------------------------------------------------

## Remote

Stored somewhere shared.

Examples:

-   S3
-   Terraform Cloud

Benefits:

-   collaboration
-   backups
-   encryption
-   locking

------------------------------------------------------------------------

# State Locking

Imagine two engineers pressing Apply together.

Without locking:

Both edit the state file.

Result:

Chaos.

State locking prevents more than one person modifying the state simultaneously.

------------------------------------------------------------------------

# Backend

Backends decide where Terraform stores state.

Example:

``` hcl
terraform {
  backend "s3" {
    bucket = "my-bucket"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}
```

------------------------------------------------------------------------

# Variables

Variables stop you hardcoding values.

Instead of:

``` hcl
instance_type = "t2.micro"
```

Use:

``` hcl
instance_type = var.instance_type
```

Now the same code can create different environments.

------------------------------------------------------------------------

## Input Variables

``` hcl
variable "instance_type" {
  type = string
}
```

Referenced using:

``` hcl
var.instance_type
```

------------------------------------------------------------------------

## Local Variables

Locals store values you calculate once and reuse.

``` hcl
locals {
  instance_ami = "ami-123"
}
```

Access:

    local.instance_ami

------------------------------------------------------------------------

## Output Variables

Outputs display useful information after Apply.

Example:

``` hcl
output "instance_id" {
  value = aws_instance.web.id
}
```

Useful for:

-   IDs
-   IP addresses
-   URLs
-   Passing values into other modules

------------------------------------------------------------------------

# Variable Types

Primitive:

-   string
-   number
-   bool

Complex:

-   list
-   map
-   object

------------------------------------------------------------------------

# Variable Precedence (Highest → Lowest)

1.  Command line (`-var`)
2.  Environment variables (`TF_VAR_`)
3.  terraform.tfvars
4.  Default values

Easy way to remember:

> The closer the value is to the command you're running, the more
> important it is.

------------------------------------------------------------------------

# terraform.tfvars

Common place to store actual values.

Example:

``` hcl
instance_type = "t2.micro"
```

------------------------------------------------------------------------

# Environment Variables

AWS commonly uses:

    AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY
    AWS_DEFAULT_REGION

------------------------------------------------------------------------

# Importing Existing Infrastructure

Terraform can manage resources that already exist.

Command:

``` bash
terraform import aws_instance.web i-123456789
```

Workflow:

1.  Write matching resource block
2.  Import resource
3.  Compare
4.  Adjust configuration

------------------------------------------------------------------------

# Modules

Modules are reusable Terraform code.

Think:

> Functions for infrastructure.

Instead of copying EC2 code five times...

Write it once, call it five times.

Example:

``` hcl
module "ec2" {
  source = "./modules/ec2"
}
```

Typical structure:

    modules/
        ec2/
            main.tf
            variables.tf
            outputs.tf

Good modules are:

-   simple
-   reusable
-   documented
-   focused

------------------------------------------------------------------------

# DRY

DRY means:

**Don't Repeat Yourself**

If you're copying Terraform code repeatedly...

...it should probably become a module.

------------------------------------------------------------------------

# Terraform Registry

https://registry.terraform.io

Use it for:

-   providers
-   modules
-   documentation
-   required arguments
-   examples

------------------------------------------------------------------------

# Required vs Optional Arguments

Always check provider docs.

Example:

    ami

may be required.

Other settings may be optional.

------------------------------------------------------------------------

# Configuration Management vs Orchestration

Terraform = Infrastructure orchestration

Creates:

-   VMs
-   Networks
-   Storage

Configuration management tools (Ansible, Puppet, Chef):

Configure software AFTER servers exist.

Example:

Terraform creates server.

Ansible installs Nginx.

------------------------------------------------------------------------

# Useful State Commands

    terraform state list

Lists resources in state.

    terraform state show RESOURCE

Shows details.

    terraform state mv

Moves resources inside state.

Very important when moving resources into modules.

Without it:

Terraform thinks the resource disappeared.

It plans:

-   destroy old
-   create new

------------------------------------------------------------------------

# Best Practices

-   Always run `terraform plan`
-   Commit code to Git
-   Use remote state for teams
-   Use state locking
-   Keep modules small
-   Don't hardcode values
-   Use variables
-   Reuse modules
-   Read provider documentation
-   Review plans before applying

------------------------------------------------------------------------

# Quiz Memory Tricks

-   IaC = Infrastructure as Code
-   First command = `terraform init`
-   Syntax = `terraform validate`
-   Preview = `terraform plan`
-   Execute = `terraform apply`
-   Delete = `terraform destroy`
-   Resource keyword = `resource`
-   State file = `terraform.tfstate`
-   Variables file = `variables.tf`
-   Values file = `terraform.tfvars`
-   Import = `terraform import`
-   Module = reusable Terraform code
-   DRY = Don't Repeat Yourself
-   Local state = your machine
-   Remote state = shared backend
-   `+` create
-   `~` modify
-   `-` destroy
-   Primitive types = string, number, bool
-   Complex types = list, map, object
-   Highest variable priority = command line flags
-   Cloud agnostic = works across many cloud providers

------------------------------------------------------------------------

# One-Line Summary

Terraform lets you describe the infrastructure you want in code. It compares your desired configuration with its stored state, works out the difference, and safely creates, updates or removes resources so reality matches your code.
