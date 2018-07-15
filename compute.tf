# Create a new instance
resource "google_compute_instance" "srv1" {
  name         = "srv1"
  machine_type = "f1-micro"
  zone         = "us-east1-d"

  boot_disk {
    initialize_params {
      image = "centos-7"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
