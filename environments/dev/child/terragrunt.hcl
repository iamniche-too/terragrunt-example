# ideally, variables would be *inherited* from (multiple) parent terragrunt files
# but unfortunately only _one_ level of inheritance is currently supported
# (Error - "Only one level of includes is allowed")
# see https://github.com/gruntwork-io/terragrunt/issues/303

# For more detail, see import RFC, here https://github.com/gruntwork-io/terragrunt/issues/1566

# Options:

# a) Workaround using extra_arguments in root file
#  terraform {
#    extra_arguments "common_vars" {
#      commands = ["${get_terraform_commands_that_need_vars()}"]
#
#      optional_var_files = [
#        "${get_tfvars_dir()}/${find_in_parent_folders("account.tfvars", "skip-account-if-does-not-exist")}",
#        "${get_tfvars_dir()}/${find_in_parent_folders("region.tfvars", "skip-region-if-does-not-exist")}",
#        "${get_tfvars_dir()}/${find_in_parent_folders("env.tfvars", "skip-env-if-does-not-exist")}",
#        "${get_tfvars_dir()}/terraform.tfvars"
#      ]
#    }
#  }
# NOT SHOWN AS TOO CLUNKY! ;)

# b) Use multiple include blocks

# Note - v0.32.0+ allows multiple (labelled) include blocks
# You can have more than one include block, but each one must have a unique label ...

include "env_vars" {
  path = find_in_parent_folders("env.hcl")
  expose = true
}

include "app_vars" {
  path = find_in_parent_folders("app.hcl")
  expose = true
}

# From the documentation:
# NOTE: At this time, Terragrunt only supports a single level of include blocks.
# That is, Terragrunt will error out if an included config also has an include block defined.
# If you are interested in this feature, please follow https://github.com/gruntwork-io/terragrunt/issues/1566 to be notified when nested include blocks are supported.

# c) Use multiple files in locals block i.e.
locals {
  env_vars = yamldecode(
    file("${find_in_parent_folders("env.yaml")}")
  )
  app_vars = yamldecode(
    file("${find_in_parent_folders("app.yaml")}")
  )

  # example of using variables referenced in the labelled include blocks
  # note - if expose = false then it will not work ...
  environment_uuid = "${include.env_vars.inputs.environment}-${include.env_vars.inputs.project_uuid}"
}

# d) Reference yaml files using merge inputs i.e.
# inputs = merge(
#  yamldecode(file("${find_in_parent_folders("env.yaml")}"))
#)

inputs = {
  service_account_name = "${local.app_vars.app_name}@${local.env_vars.environment}-${local.env_vars.project_uuid}.iam.gcloudservice.com"
  #service_account_name2 = "${include.app_vars.inputs.app_name}@${include.env_vars.inputs.environment}-${include.env_vars.inputs.project_uuid}.iam.gcloudservice.com"
  service_account_name2 = "${include.app_vars.inputs.app_name}@${local.environment_uuid}.iam.gcloudservice.com"
}