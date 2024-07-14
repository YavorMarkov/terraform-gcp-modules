provider "google" {
  credentials = var.GOOGLE_CREDENTIALS
  project     = var.project_id
  region      = var.region
}

data "http" "startup_script" {
  url = var.startup_script_url
}


module "compute_instance" {
  source              = "./modules/compute"
  project_id          = var.project_id
  region              = var.region
  zone                = var.zone
  image               = var.image
  startup_script      = data.http.startup_script.body
  my_ip               = var.my_ip
  GOOGLE_CREDENTIALS  = var.GOOGLE_CREDENTIALS
}
