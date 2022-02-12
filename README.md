# Terragrunt hierarchical variables example

See https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/

Note - all examples in HCL not HCL.JSON

## Run
Edit environment.sh to either be dev or prod

```
./run.sh
```

Expected output
Terraform v1.1.5 on linux_amd64
terragrunt version v0.35.18

Initializing the backend...

Initializing provider plugins...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

Changes to Outputs:
  + output1 = "myapp@dev-276.iam.gcloudservice.com"

You can apply this plan to save these new output values to the Terraform
state, without changing any real infrastructure.

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.