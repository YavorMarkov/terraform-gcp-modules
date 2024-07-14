variable "project_id" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "GOOGLE_CREDENTIALS" {
  description = "The JSON credentials for Google Cloud"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "The region to deploy resources in"
  type        = string
}
