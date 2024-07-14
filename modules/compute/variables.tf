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
