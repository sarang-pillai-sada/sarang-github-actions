variable "project_id" {
  description = "GCP project ID where Artifact Registry will be created."
  type        = string
  default     = "sada-seed-2025-sandbox"
}

variable "region" {
  description = "Region for Artifact Registry repository."
  type        = string
  default     = "us-central1"
}

variable "repository_id" {
  description = "Artifact Registry repository ID (name)."
  type        = string
  default     = "sada-demo-docker-repo"
}

variable "repository_description" {
  description = "Description for Artifact Registry repository."
  type        = string
  default     = "Artifact Registry repository provisioned by Terraform via GitHub Actions"
}

# No-op change to trigger PR plan workflow
