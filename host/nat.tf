resource "google_compute_router" "router" {
  name    = "corp-router"
  network = google_compute_network.shared_vpc.id
  region  = var.region
  project = var.host_project_id
}

resource "google_compute_router_nat" "nat" {
  name                               = "corp-nat"
  router                            = google_compute_router.router.name
  region                            = var.region
  project                           = var.host_project_id
  nat_ip_allocate_option            = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
