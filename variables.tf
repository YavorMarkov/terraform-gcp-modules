
variable "region" {
  description = "The region where the resources will be created"
  type        = string
}

variable "project_id" {
  description = "The Google Cloud project ID"
  type        = string
}



variable "zone" {
  description = "The zone to deploy resources in"
  type        = string
  default     = "us-central1-a"  // Example default value
}

variable "image" {
  description = "The image to use for the boot disk"
  type        = string
  default     = "projects/debian-cloud/global/images/family/debian-11"
}

variable "startup_script_url" {
  description = "URL to the startup script"
  type        = string
  default     = "https://raw.githubusercontent.com/YavorMarkov/terraform-gcp-modules/main/scripts/setup_nginx.sh"
}

