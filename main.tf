module "compute_instance" {
  source = "./modules/compute"


  region      = var.region       
  project_id  = var.project_id   
  zone                = "us-central1-f"
  image               = "debian-cloud/debian-11"
  startup_script_url  = "https://raw.githubusercontent.com/YavorMarkov/terraform-gcp-modules/main/scripts/setup_nginx.sh"
  my_ip               = "YOUR_PUBLIC_IP"
}
