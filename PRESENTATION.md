# Zero to Hero: Terraform & Terragrunt

## What problem is Terraform trying to solve?

Terraform is ... Configuration Management, Infra provisioning, IAC

Infrastructure provision used not to be idempotent (repeatable), persisted (in repo)

Infra provision used to be ad hoc (and error prone).

Then along came IAC (Infrastructure As Code), which effectively means an "API for Infra".

i.e. declarative
i.e. held in repos (like code)
i.e. a desired target state

Terraform is (one) API for infra. Others exist e.g.
* CloudFormation (AWS) - https://aws.amazon.com/cloudformation/
* Pulumi - https://www.pulumi.com/ 
* Ansible - https://github.com/ansible/ansible

## Simple Example
```
./10-terraform.sh
```
Validate the Terraform config and output the plan (i.e. what it intends to do).

{dev|qa|prod}.tfvars file VERSUS Terragrunt - why do we need TG?

Has been asked before, obvs! https://blog.boltops.com/2020/09/28/terraform-vs-terragrunt-vs-terraspace/

## What problem is Terragrunt trying to solve?

DRY

Terragrunt is a wrapper on top of Terraform promoting the DRY principle (Don't Repeat Yourself).

## Follow-on exercises

a) Add a new environment (qa) based on dev

b) Explore how Terraspace solves the issue of mutiple .hcl files ...