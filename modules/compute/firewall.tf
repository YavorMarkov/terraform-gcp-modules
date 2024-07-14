resource "google_compute_firewall" "secure_http" {
  name    = "secure-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = [format("%s", var.my_ip)]
  target_tags   = ["web"]
}
