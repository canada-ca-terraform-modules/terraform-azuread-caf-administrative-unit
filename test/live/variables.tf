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

variable "pr_number" {
  description = <<-EOT
    Suffix applied to the Administrative Unit's custom_name so concurrent
    manual runs (or, if CI is ever re-enabled, concurrently open PRs) never
    collide on the same tenant-wide Administrative Unit display name.
    Defaults to "manual" for a maintainer-run session.
  EOT
  type        = string
  default     = "manual"
}

variable "administrative_unit" {
  description = "Administrative Unit configuration object, passed straight through to the module under test"
  type        = any
}
