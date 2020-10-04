# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
# ---------------------------------------------------------------------------------------------------------------------

variable "gcp_project" {
    description = "The name of the GCP Project where all resources will be launched."
    type = string
}

variable "name" {
    description = "The name of GCS bucket will be launched."
    type = string
}

variable "bucket_location" {
    description = "The name of Location where the bucket will be launched."
    type = string
}

variable "bucket_force_destroy" {
    description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run."
    type = bool
    default = false
}

variable "bucket_roles" {
    description = "The roles will be apply for created service account of bucket."
    type = list(string)
    default = [
        "roles/storage.legacyObjectReader",
        "roles/storage.legacyBucketWriter"
    ]
}