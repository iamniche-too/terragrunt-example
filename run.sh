#!/bin/bash
. ./environment.sh

echo "Environment is $ENV"

terragrunt plan --terragrunt-working-dir ./environments/$ENV/child --terragrunt-debug --terragrunt-source ../../..//module