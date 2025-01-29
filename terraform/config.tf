terraform {
  required_providers {
    metal = {
      source  = "equinix/metal"
      version = "~> 3.3"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
    github = {
      source = "integrations/github"
      # We need lock_branch fixes from 5.12
      version = ">= 5.12.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
  backend "remote" {
    organization = "calyptia"
    hostname     = "app.terraform.io"

    workspaces {
      name = "fluent-bit-infra"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_token
}

provider "metal" {
  auth_token = var.metal_token
}

# Configure the GitHub Provider
provider "github" {
  token = var.github_token
  owner = var.github_owner
}
