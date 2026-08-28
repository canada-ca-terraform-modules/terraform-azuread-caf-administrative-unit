variable "env" {
  description = "(Required) 4 character string defining the environment name prefix used to build the default Administrative Unit display name"
  type        = string
  default     = "ltst"
}

variable "group" {
  description = "(Required) Character string defining the group used to build the default Administrative Unit display name"
  type        = string
  default     = "CTO"
}

variable "project" {
  description = "(Required) Character string defining the project used to build the default Administrative Unit display name"
  type        = string
  default     = "ESLZ"
}

variable "administrative_unit" {
  description = "Administrative Unit configuration object, passed straight through to the module under test"
  type        = any
}
