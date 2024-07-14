resource "google_compute_instance" "enhanced_vm" {
  name         = "enhanced-vm"
  machine_type = "n1-standard-1"
  zone         = var.zone

  tags = ["web", "dev"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    
    startup-script = file("${path.module}/../../scripts/setup_nginx.sh")
  }
}

resource "google_compute_disk" "my_disk" {
  name  = "persistent-disk"
  type  = "pd-ssd"
  zone  = var.zone
  size  = 50
}

resource "google_compute_attached_disk" "disk_attachment" {
  instance = google_compute_instance.enhanced_vm.name
  disk     = google_compute_disk.my_disk.name
  zone     = var.zone
}
