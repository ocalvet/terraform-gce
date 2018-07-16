# Create a new instance
resource "google_compute_instance" "srv1" {
  name         = "srv1"
  machine_type = "f1-micro"
  zone         = "us-east1-d"

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "centos-7"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  provisioner "remote-exec" {
    inline = [
      "echo \"hello from $HOST\" > ~/terraform_complete",
      "sudo yum install -y epel-release",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
    ]

    # connection {
    #   type        = "ssh"
    #   user        = "ubuntu"
    #   private_key = "${file("~/.ssh/google_compute_engine")}"
    # }
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

output "srv1ip" {
  value = "${google_compute_instance.srv1.network_interface.0.access_config.0.nat_ip}"
}
