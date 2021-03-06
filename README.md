# Provision Google Cloud Storage on GCP with Terraform

This is terraform module that will help you deploy a Google Cloud Storage on GCP.

This module will:

- Create a bucket with NEARLINE Storage Class with **Private** ACL, with 2 conditions. Read more about NEARLINE Storage Class at [here](https://cloud.google.com/storage/docs/storage-classes)
- Create a service account for created bucket.

## Usages

```hcl
module "bucket" {
    source = "github.com/ducmeit1/tf-storage-gcp"
    gcp_project = "driven-stage-269911"
    name = "nearline-class-bucket"
    bucket_location = "ASIA"
    bucket_force_destroy = false
}
```

```shell
terraform plan
terraform apply --auto-approve
```
