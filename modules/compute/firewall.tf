resource "google_compute_firewall" "secure_http" {
  name    = "secure-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = [var.my_ip + "/32"]
  target_tags   = ["web"]
}
