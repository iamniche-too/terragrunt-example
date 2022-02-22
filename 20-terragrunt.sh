#!/bin/bash
terragrunt plan -var-file ./dev.tfvars --terragrunt-working-dir ./20_terragrunt --terragrunt-source ..//module