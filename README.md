# Terragrunt hierarchical variables example

In short, we demonstrate two workarounds for "Only one level of includes is allowed"

a) Use locals block that loads multiple YAML files with variables
b) Use multiple (labelled) include blocks, each loading a different parent file (but with no grandparenting)

Note - all examples in HCL not HCL.JSON

## Run
Edit environment.sh to either be dev or prod
(default is dev)

```
./run.sh
```

### Expected output
Environment is dev
...
Changes to Outputs:
  + output1 = "myapp@dev1-1111.iam.gcloudservice.com"
  + output2 = "myapp@dev2-2222.iam.gcloudservice.com"
...

Where dev1 uses locals (with multiple files) and dev2 uses multiple include blocks
