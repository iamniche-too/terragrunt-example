#!/bin/bash
. ./environment.sh

terragrunt plan --terragrunt-working-dir ./environments/$ENV/child --terragrunt-debug --terragrunt-source ../../..//module