# ideally, variables would be *inherited* from (multiple) parent terragrunt files
# but unfortunately only _one_ level of inheritance is currently supported
# (Error - "Only one level of includes is allowed")
# see https://github.com/gruntwork-io/terragrunt/issues/303

# Workaround options:

# Option A) (Terraform v0.32.0+) - Use multiple (labelled) include blocks

include "env_vars" {
  path = find_in_parent_folders("env.hcl")
  expose = true
}

include "app_vars" {
  path = find_in_parent_folders("app.hcl")
  expose = true
}

# Option B) Use multiple files in locals block i.e.

locals {
  env_vars = yamldecode(
    file("${find_in_parent_folders("env.yaml")}")
  )
  app_vars = yamldecode(
    file("${find_in_parent_folders("app.yaml")}")
  )

  # example of using variables referenced in the labelled include blocks
  environment_uuid = "${include.env_vars.inputs.environment}-${include.env_vars.inputs.project_uuid}"
}

inputs = {
  service_account_name = "${local.app_vars.app_name}@${local.env_vars.environment}-${local.env_vars.project_uuid}.iam.gcloudservice.com"
  service_account_name2 = "${include.app_vars.inputs.app_name}@${local.environment_uuid}.iam.gcloudservice.com"
}