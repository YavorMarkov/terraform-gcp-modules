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
}

variable "image" {
  description = "The image to use for the boot disk"
  type        = string
}

variable "startup_script_url" {
  description = "URL to the startup script"
  type        = string
}

variable "my_ip" {
  description = "Your public IP address for restricted access"
  type        = string
}
