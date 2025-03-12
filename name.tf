locals {
    au_name = try(var.administrative_unit.custom_name, "") == "" ? "${env}-${group}-${project}-AU" : var.administrative_unit.custom_name
}
