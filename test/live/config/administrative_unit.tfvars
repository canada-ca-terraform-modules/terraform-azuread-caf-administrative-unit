# config/administrative_unit.tfvars
# Tracked, ready-to-run fixture for the test/live harness - adapted from the
# already-validated L2_test_administrative_unit upgrade-probe fixture in the
# Modules-Testing-and-Validation repo.
#
# administrative_unit has no Azure resource dependency (no RG/vnet) and no
# per-PR collision risk beyond the Administrative Unit's own display name -
# this fixture's custom_name is suffixed "-livetest" to keep it distinct
# from any other AU in the tenant. If this harness is ever run concurrently
# by two people, give each run its own custom_name suffix by hand.
#
# No members/role_members are exercised here: proving the base resource
# (custom_name/description/hidden_membership_enabled) round-trips is
# sufficient for a live-test smoke check - the mock-provider test suite in
# tests/administrative_unit.tftest.hcl already exercises the full
# members/role_members matrix.

administrative_unit = {
  custom_name               = "GcDc-AU-CTO-ESLZ-livetest"
  description               = "Live-test harness Administrative Unit for terraform-azuread-caf-administrative-unit (manual run only)"
  hidden_membership_enabled = false
}
