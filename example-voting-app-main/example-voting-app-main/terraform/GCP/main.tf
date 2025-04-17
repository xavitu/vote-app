terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

resource "google_storage_bucket" "example" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true

  labels = {
    environment = var.environment
    owner       = "DevOps"
  }

  versioning {
    enabled = true
  }
}

output "gcs_bucket_url" {
  value = "gs://${google_storage_bucket.example.name}"
}
