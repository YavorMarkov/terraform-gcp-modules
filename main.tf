module "compute_instance" {
  source = "./modules/compute"

  zone                = "us-central1-f"
  image               = "debian-cloud/debian-11"
  startup_script_url  = "https://raw.githubusercontent.com/YavorMarkov/test-2/main/startup.sh"
  my_ip               = "YOUR_PUBLIC_IP"
}
