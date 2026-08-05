mock_provider "azuread" {}

variables {
  env     = "Dev"
  group   = "OPS"
  project = "CORE"
}

# Purpose: catch breaking resource changes before dev tests on real infra.
# Step 1: simulate the currently-deployed resource (pre-upgrade inputs).
run "baseline_apply" {
  command = apply

  variables {
    administrative_unit = {
      description = "baseline AU"
    }
  }

  assert {
    condition     = azuread_administrative_unit.au.display_name == "Dev-AU-OPS-CORE"
    error_message = "Baseline apply: unexpected AU display_name"
  }
}

# Step 2: plan upgraded code against that state.
run "upgrade_plan_no_replacement" {
  command = plan

  variables {
    administrative_unit = {
      description               = "baseline AU"
      hidden_membership_enabled = true
    }
  }

  assert {
    condition     = azuread_administrative_unit.au.display_name == "Dev-AU-OPS-CORE"
    error_message = "AU display_name must be unchanged after upgrade (no destroy/recreate)"
  }
  assert {
    condition     = azuread_administrative_unit.au.hidden_membership_enabled == true
    error_message = "hidden_membership_enabled must update in-place"
  }
}
