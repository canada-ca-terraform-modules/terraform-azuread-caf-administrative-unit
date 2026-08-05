mock_provider "azuread" {}

variables {
  env     = "Dev"
  group   = "OPS"
  project = "CORE"
}

run "naming_convention" {
  command = plan

  assert {
    condition     = azuread_administrative_unit.au.display_name == "Dev-AU-OPS-CORE"
    error_message = "Name must follow {env}-AU-{group}-{project} convention when custom_name is not set"
  }
}

run "custom_name_override" {
  command = plan

  variables {
    administrative_unit = {
      custom_name = "My-Custom-AU-Name"
    }
  }

  assert {
    condition     = azuread_administrative_unit.au.display_name == "My-Custom-AU-Name"
    error_message = "custom_name override must take priority over the generated naming convention"
  }
}

run "default_values" {
  command = plan

  assert {
    condition     = azuread_administrative_unit.au.description == ""
    error_message = "description must default to an empty string"
  }
  assert {
    condition     = azuread_administrative_unit.au.hidden_membership_enabled == false
    error_message = "hidden_membership_enabled must default to false"
  }
  assert {
    condition     = length(azuread_administrative_unit_member.member) == 0
    error_message = "no members must be created when administrative_unit.members is not set"
  }
  assert {
    condition     = length(azuread_administrative_unit_role_member.rm) == 0
    error_message = "no role members must be created when administrative_unit.role_members is not set"
  }
}

run "description_and_hidden_membership" {
  command = plan

  variables {
    administrative_unit = {
      description               = "Example administrative unit"
      hidden_membership_enabled = true
    }
  }

  assert {
    condition     = azuread_administrative_unit.au.description == "Example administrative unit"
    error_message = "description must be passed through"
  }
  assert {
    condition     = azuread_administrative_unit.au.hidden_membership_enabled == true
    error_message = "hidden_membership_enabled must be passed through"
  }
}

run "single_member" {
  command = plan

  variables {
    administrative_unit = {
      members = ["11111111-1111-1111-1111-111111111111"]
    }
  }

  assert {
    condition     = length(azuread_administrative_unit_member.member) == 1
    error_message = "exactly one administrative_unit_member must be created"
  }
  assert {
    condition     = azuread_administrative_unit_member.member["11111111-1111-1111-1111-111111111111"].member_object_id == "11111111-1111-1111-1111-111111111111"
    error_message = "member_object_id must match the supplied member"
  }
}

run "multiple_members" {
  command = plan

  variables {
    administrative_unit = {
      members = [
        "11111111-1111-1111-1111-111111111111",
        "22222222-2222-2222-2222-222222222222",
      ]
    }
  }

  assert {
    condition     = length(azuread_administrative_unit_member.member) == 2
    error_message = "exactly two administrative_unit_members must be created"
  }
}

run "role_member_assignment" {
  command = plan

  variables {
    administrative_unit = {
      role_members = {
        "Groups Administrator" = {
          member_object_ids = ["33333333-3333-3333-3333-333333333333"]
        }
      }
    }
  }

  override_data {
    target = data.azuread_directory_roles.current
    values = {
      roles = [
        {
          display_name = "Groups Administrator"
          object_id    = "44444444-4444-4444-4444-444444444444"
          template_id  = "fe930be7-5e62-47db-91af-98c3a49a38b1"
          description  = "Can manage all aspects of groups"
        }
      ]
      object_ids   = ["44444444-4444-4444-4444-444444444444"]
      template_ids = ["fe930be7-5e62-47db-91af-98c3a49a38b1"]
    }
  }

  assert {
    condition     = length(azuread_administrative_unit_role_member.rm) == 1
    error_message = "exactly one role member assignment must be created"
  }
  assert {
    condition     = azuread_administrative_unit_role_member.rm["Groups Administrator-33333333-3333-3333-3333-333333333333"].role_object_id == "44444444-4444-4444-4444-444444444444"
    error_message = "role_object_id must resolve from the directory_roles data source by display_name"
  }
}
