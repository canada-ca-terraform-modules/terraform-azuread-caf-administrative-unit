terraform {
  required_version = ">= 1.9"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }

  backend "local" {}
}

provider "azuread" {}

module "administrative_unit" {
  source = "../../"

  env                 = var.env
  group               = var.group
  project             = var.project
  administrative_unit = var.administrative_unit
}
