# ===================================================
# Component: Infra Only (provider.tf)
#
# Virsion: 1.0 (2025-03-31)
# ---------------------------------------------------
# HISTORY
# V0.1: Initial version 
#
#
# ===================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.90.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.infrastructure.region
  access_key = var.infrastructure.access_key
  secret_key = var.infrastructure.secret_key
}
