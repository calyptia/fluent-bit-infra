terraform {
  required_providers {
    metal = {
      source  = "equinix/metal"
      version = "3.3.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.18.0"
    }
    github = {
      source  = "integrations/github"
      version = "4.27.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.28.0"
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
  email     = var.cloudflare_email
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
