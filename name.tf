locals {
    au_name = try(var.administrative_unit.custom_name, "") == "" ? "${var.env}-AU-${var.group}-${var.project}" : var.administrative_unit.custom_name
}
