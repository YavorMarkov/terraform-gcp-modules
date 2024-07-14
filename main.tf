provider "google" {
  credentials = var.GOOGLE_CREDENTIALS
  project     = var.project_id
  region      = var.region
}

module "compute_instance" {
  source              = "./modules/compute"
  project_id          = var.project_id
  region              = var.region
  zone                = var.zone
  image               = var.image
  startup_script_url  = var.startup_script_url
  my_ip               = var.my_ip
  GOOGLE_CREDENTIALS  = var.GOOGLE_CREDENTIALS
}
