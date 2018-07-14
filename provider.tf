# Specify the provider (GCP, AWS, Azure)
provider "google" {
  credentials = "${file("terraform-account.json")}"
  project     = "system-automation-184009"
  region      = "us-central1"
}
