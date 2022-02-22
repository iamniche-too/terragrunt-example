# see https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/

# +1 All the TG examples are in HCL, not HCL.JSON
# +1 HCL *allows* comments, HCL.JSON does *not*

locals {
  env_vars = yamldecode(
    file("${find_in_parent_folders("env.yaml")}")
  )
  app_vars = yamldecode(
    file("${find_in_parent_folders("app.yaml")}")
  )
}

inputs = {
  service_account_name = "${local.app_vars.app_name}@${local.env_vars.environment}-${local.env_vars.project_uuid}.iam.gcloudservice.com"
  service_account_name2 = "N/A"
}