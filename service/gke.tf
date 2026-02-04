resource "google_container_cluster" "gke" {
  name     = "prod-gke"
  location = var.region
  project  = var.service_project_id

  network    = "projects/${var.host_project_id}/global/networks/${var.network_name}"
  subnetwork = "projects/${var.host_project_id}/regions/${var.region}/subnetworks/app-subnet"

  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.10.0.0/16"
      display_name = "shared-vpc-subnet"
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods-range"
    services_secondary_range_name = "services-range"
  }
}
