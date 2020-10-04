# Provision Google Cloud Storage on GCP with Terraform

This is terraform module that will help you deploy a Google Cloud Storage on GCP.

This module will:

- Create a bucket with NEARLINE Storage Class with **Private** ACL, with 2 conditions. Read more about NEARLINE Storage Class at [here](https://cloud.google.com/storage/docs/storage-classes)
- Create a service account for created bucket.

## Usages

```hcl
module "bucket" {
    source = "git::git@github.com:ducmeit1/tf-storage-gcp.git/?ref=v0.0.1"
    gcp_project = "driven-stage-269911"
    name = "nearline-class-bucket"
    bucket_location = "ASIA"
    bucket_force_destroy = false
}
```
