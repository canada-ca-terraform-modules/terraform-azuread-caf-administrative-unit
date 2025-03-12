resource "azuread_administrative_unit" "au" {
  display_name              = local.au_name
  description               = try(var.administrative_unit.description, "")
  hidden_membership_enabled = try(var.administrative_unit.hidden_membership_enabled, true)
}

resource "azuread_administrative_unit_member" "member" {
  for_each = toset(try(var.administrative_unit.members, []))

  administrative_unit_object_id = azuread_administrative_unit.au.object_id
  member_object_id              = each.value
}

# Define the data source to fetch all activated directory roles
data "azuread_directory_roles" "current" {}

# output "azuread_directory_roles" {
#   value = data.azuread_directory_roles.current
# }

# Use locals to process the data
locals {
  # Create a map where keys are template_ids and values are object_ids
  role_map = { for role in data.azuread_directory_roles.current.roles : role.display_name => role.object_id }

  # Flatten role_members into a map of role-member assignments
  role_member_list = flatten([
    for role_name, role_data in try(var.administrative_unit.role_members, {}) : [
      for member_id in role_data.member_object_ids : {
        key   = "${role_name}-${member_id}"
        role_name = role_name
        member_id = member_id
      }
    ]
  ])

  role_member_assignments = {
    for assignment in local.role_member_list : assignment.key => {
      role_name = assignment.role_name
      member_id = assignment.member_id
    }
  }
}

resource "azuread_administrative_unit_role_member" "rm" {
  for_each = local.role_member_assignments

  role_object_id                = local.role_map[each.value.role_name]
  administrative_unit_object_id = azuread_administrative_unit.au.object_id
  member_object_id              = each.value.member_id
}
