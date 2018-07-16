resource "google_compute_firewall" "firewall" {
  name    = "firewall"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
}
