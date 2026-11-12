# GitHub Actions Hands-on: Terraform + Artifact Registry + Docker Push

This repo contains:

- Terraform code to provision a Google Artifact Registry Docker repository in `sada-seed-2025-sandbox`.
- A workflow that runs Terraform plan on PRs to `main` and Terraform apply on merge to `main`.
- A manual workflow to build and push a Docker image to the provisioned Artifact Registry.

## Files

- `terraform/` - Terraform code for Artifact Registry
- `.github/workflows/terraform-artifact-registry.yml` - plan/apply workflow
- `.github/workflows/docker-build-push.yml` - manual Docker build and push workflow

## Required GitHub Repository Secrets

Configure these in your repository settings:

- `GCP_WORKLOAD_IDENTITY_PROVIDER`
  - Example format:
    `projects/607748495856/locations/global/workloadIdentityPools/ga-identity/providers/zenitsu`
- `GCP_SERVICE_ACCOUNT`
  - Example:
    `abhiram-dev-sa@sada-seed-2025-sandbox.iam.gserviceaccount.com`

## Required Google IAM for Service Account

The service account used by GitHub Actions should have at least:

- `roles/artifactregistry.admin` (for Terraform creating repository)
- `roles/storage.admin` is not required for Artifact Registry itself
- `roles/artifactregistry.writer` (for Docker image push)

## How it works

1. Raise PR to `main` with Terraform changes.
2. `Terraform Artifact Registry` workflow runs `terraform plan`.
3. Merge PR to `main`.
4. Same workflow runs `terraform apply` and creates/updates the repository.
5. Run `Docker Build and Push to Artifact Registry` manually from Actions tab on `main`.

## Customization

You can edit defaults in:

- `terraform/variables.tf` for repository name/region
- `.github/workflows/docker-build-push.yml` for project/repository defaults
