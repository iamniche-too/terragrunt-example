#!/bin/bash

cd module && terraform plan -var-file="dev.tfvars"
