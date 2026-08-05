# tflint-ignore: terraform_unused_declarations
variable "location" {
  description = "(Optional) Azure location — retained for backward compatibility, not used by this module (Administrative Units are a global Azure AD resource with no location)"
  type        = string
  default     = "canadacentral"
}

variable "env" {
  description = "(Required) 4 character string defining the environment name prefix used to build the default Administrative Unit display name"
  type        = string
}

variable "group" {
  description = "(Required) Character string defining the group used to build the default Administrative Unit display name"
  type        = string
}

variable "project" {
  description = "(Required) Character string defining the project used to build the default Administrative Unit display name"
  type        = string
}

variable "administrative_unit" {
  description = "Administrative Unit configuration object"
  type        = any
  default     = {}
}
