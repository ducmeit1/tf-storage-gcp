output "storage_name" {
    description = "The name of created bucket."
    value = google_storage_bucket.bucket.name
}

output "storage_url" {
    description = "The url of created bucket."
    value = google_storage_bucket.bucket.url
}

output "service_account" {
    description = "The email for the service account of created bucket."
    value = google_service_account.bucket.email
}