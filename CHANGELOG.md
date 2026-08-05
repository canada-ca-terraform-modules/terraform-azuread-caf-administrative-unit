# Changelog

All notable changes to this module are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Added

- `providers.tf` pinning `azuread ~> 3.0` (`required_version >= 1.9`) — module previously had no provider version constraint at all.
- `.tflint.hcl` using `call_module_type = "local"`.
- `.gitignore` and `.gitattributes` (LF enforcement) — neither existed previously.
- `tests/administrative_unit.tftest.hcl` — 8 `mock_provider` runs covering naming convention, `custom_name` override, defaults, description/hidden_membership_enabled, single/multiple members, and role member assignment (via `override_data` on `data.azuread_directory_roles`).
- `tests/upgrade_compat.tftest.hcl` — state-chaining safety test (baseline apply + upgrade plan, no replacement).
- `.github/workflows/terraform-ci.yml` — fmt, init, validate, test, tflint on every PR.
- `.github/workflows/release.yml` — creates a GitHub release on merge, tag sourced from `ESLZ/administrative_units.tf`'s own `?ref=vX.Y.Z`.
- `output.tf`: `azuread_administrative_unit_object` marked `sensitive = true` (exposes the full resource object).

### Changed

- Gap-analyzed `azuread_administrative_unit`, `azuread_administrative_unit_member`, `azuread_administrative_unit_role_member`, and `data.azuread_directory_roles` against azuread provider `v3.9.0` — no argument/schema changes required; existing implementation was already compatible.
- Bumped `ESLZ/administrative_units.tf` module ref from `v1.0.1` to `v1.0.2`.
- Fixed copy-paste variable descriptions in `variables.tf` (`location`, `env`, `group`, `project` previously described a VM module, not an Administrative Unit).

### Known blockers

- None.

## [v1.0.1] - prior release

- Pre-dates this upgrade; see git history.
