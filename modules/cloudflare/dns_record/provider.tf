terraform {
  required_version = "~> 1.11.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.1.0"
    }
  }
}