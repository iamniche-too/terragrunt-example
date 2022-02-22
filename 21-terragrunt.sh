#!/bin/bash
. ./environment.sh

echo "Environment is $ENV"

# terragrunt plan --terragrunt-working-dir ./21_terragrunt/dev/child --terragrunt-source ../../..//module
terragrunt plan --terragrunt-working-dir ./21_terragrunt/prod/child --terragrunt-source ../../..//module