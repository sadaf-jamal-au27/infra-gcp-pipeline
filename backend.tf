terraform {
  backend "gcs" {
    bucket  = "terraform-state-host-project-486317"
    prefix  = "shared-vpc/prod"
  }
}
