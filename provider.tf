# Specify the provider (GCP, AWS, Azure)
provider "google" {
  credentials = "${file("terraform-account.json")}"
  project     = "calvet-companies"
  region      = "us-east1-d"
}
