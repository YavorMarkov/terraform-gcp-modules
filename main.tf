 provider "google" {
  credentials = file(var.GOOGLE_CREDENTIALS)
  project     = var.project_id
  region      = var.region
}

module "compute_instance" {
  source              = "./modules/compute"
  zone                = var.zone
  image               = var.image
  startup_script_url  = var.startup_script_url
  my_ip               = var.my_ip
}
  




  startup_script_url  = "https://raw.githubusercontent.com/YavorMarkov/terraform-gcp-modules/main/scripts/setup_nginx.sh"
  
