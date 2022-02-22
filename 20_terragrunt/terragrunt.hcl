# generate the provider file
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "google" {
  region = "europe-west1"
}
EOF
}