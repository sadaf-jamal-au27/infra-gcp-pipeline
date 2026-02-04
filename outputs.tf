output "shared_vpc_network" {
  value = var.network_name
}

output "gke_cluster" {
  value = module.service.gke_cluster_name
}

