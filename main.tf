################################
# HOST PROJECT MODULE
################################
module "host" {
  source = "./host"

  org_id          = var.org_id
  region          = var.region
  host_project_id = var.host_project_id
  network_name    = var.network_name
}

################################
# SERVICE PROJECT MODULE
################################
module "service" {
  source = "./service"

  org_id              = var.org_id
  region              = var.region
  host_project_id     = var.host_project_id
  service_project_id  = var.service_project_id
  network_name        = var.network_name

  depends_on = [module.host]
}
