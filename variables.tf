variable "project_id" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy resources in"
  type        = string
}

variable "zone" {
  description = "The zone to deploy resources in"
  type        = string
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

variable "my_ip" {
  description = "Your public IP address for restricted access"
  type        = string
}

variable "GOOGLE_CREDENTIALS" {
  description = "The JSON credentials file for Google Cloud"
  type        = string
  sensitive   = true
}

variable "startup_script" {
  description = "Content of the startup script"
  type        = string
}