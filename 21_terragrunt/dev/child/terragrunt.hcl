include {
  path = find_in_parent_folders("env.hcl")
}

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