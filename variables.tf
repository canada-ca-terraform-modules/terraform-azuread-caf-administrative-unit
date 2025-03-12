variable "location" {
  description = "Azure location for the VM"
  type        = string
  default     = "canadacentral"
}

variable "tags" {
  description = "Tags that will be applied to every associated VM resource"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "(Required) 4 character string defining the environment name prefix for the VM"
  type        = string
}

variable "group" {
  description = "(Required) Character string defining the group for the target subscription"
  type        = string
}

variable "project" {
  description = "(Required) Character string defining the project for the target subscription"
  type        = string
}

variable "administrative_unit" {
  description = "Administrative Unit configuration object"
  type        = any
  default     = {}
}