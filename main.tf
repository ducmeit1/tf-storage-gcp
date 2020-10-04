terraform {
    required_version = ">= 0.12"
}

resource "google_service_account" "bucket" {
    project = var.gcp_project
    account_id = var.name
    display_name = "Service account for bucket"
}

resource "google_storage_bucket_iam_member" "bucket_roles" {
    for_each = toset(var.bucket_roles)
    bucket = google_storage_bucket.bucket.name
    role = each.value
    member = format("serviceAccount:%s", google_service_account.bucket.email)
}

resource "google_storage_bucket" "bucket" {
    project = var.gcp_project
    name = var.name
    location = var.bucket_location
    force_destroy = var.bucket_force_destroy
    
    labels = {
        creator = "terraform"
    }

    versioning {
        enabled = "true"
    }

    lifecycle_rule {
        action {
            type = "SetStorageClass"
            storage_class = "NEARLINE"
        }

        condition {
            age = "7"
            with_state = "ANY"
        }
    }

    lifecycle_rule {
        action {
            type = "Delete"
        }

        condition {
            age = "31"
            matches_storage_class = ["NEARLINE"]
            num_newer_versions = "3"
        }
    }
}

resource "google_storage_bucket_acl" "iac-terraform-state-bucket-acl" {
    bucket = google_storage_bucket.bucket.name
    predefined_acl = "private"
}