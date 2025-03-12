resource "azuread_administrative_unit" "au" {
  display_name              = local.au_name
  description               = try(var.administrative_unit.description, "")
  hidden_membership_enabled = try(var.administrative_unit.hidden_membership_enabled, true)
}

resource "azuread_administrative_unit_member" "member" {
  for_each = try(var.administrative_unit.members, {})

  administrative_unit_object_id = azuread_administrative_unit.au.id
  member_object_id              = each.value
}

resource "azuread_administrative_unit_role_member" "rm" {
  for_each = try(var.administrative_unit.role_members, {})

  role_object_id                = each.value.role_object_id
  administrative_unit_object_id = azuread_administrative_unit.au.id
  member_object_id              = each.value.member_object_id
}