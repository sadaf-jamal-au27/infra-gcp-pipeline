

resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = google_compute_network.shared_vpc.name
  project = var.host_project_id

  source_ranges = ["10.0.0.0/8"]

  allow {
    protocol = "all"
  }
}
