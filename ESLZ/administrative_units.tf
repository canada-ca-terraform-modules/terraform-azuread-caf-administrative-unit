variable "administrative_units" {
  description = "List of Administrative Units to create"
  type        = any
  default     = {}
}

module "administrative_units" {
  for_each = var.administrative_units
  source   = "github.com/canada-ca-terraform-modules/terraform-azuread-caf-administrative-unit?ref=v1.0.1"

  env                 = var.env
  group               = var.group
  project             = var.project
  administrative_unit = each.value
}