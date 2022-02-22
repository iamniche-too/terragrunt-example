#!/bin/bash

cd module && terraform plan -var-file="prod.tfvars"
