# `test/live/` - manual live-test harness

A live, real-Azure-AD-resource harness for `terraform-azuread-caf-administrative-unit`,
run manually by a maintainer against the real tenant. It is **not** a
substitute for the module's other test surface:

- **`tests/*.tftest.hcl`** - mock-based unit tests (`terraform test`, no
  provider credentials, no live Azure AD resources). Covers naming,
  defaults, and upgrade-compatibility logic. Run these first; they're fast
  and free.
- **`test/live/`** (this directory) - a single, real instance of the module
  applied against the real Azure AD tenant. Manual-run only - see below for
  why.

## Why this is manual-only (no CI automation)

This module's only resources (`azuread_administrative_unit`,
`azuread_administrative_unit_member`, `azuread_administrative_unit_role_member`)
are Azure AD / Entra Graph objects, not subscription-scoped Azure resources.
Applying them requires an Entra Graph RBAC role
(`AdministrativeUnit.ReadWrite.All` / `Directory.ReadWrite.All`) that the
shared live-test sandbox identity used by other modules' automated
per-PR `live-test` CI does not hold, and is not scoped to hold. There is no
per-PR workflow file under `.github/workflows/` for this harness, and none
should be added unless that RBAC gap is closed for the shared identity.

Run this harness yourself, using your own `az login` session against an
account that already holds the required Graph role.

## What's here

| File | Purpose |
|---|---|
| `main.tf` | Module block with `source = "../../"` (a relative path - this harness always tests the checked-out code), the `azuread` provider block, and an empty `backend "local" {}` block (no `-backend-config` needed for a single manual run - state stays wherever `terraform init` puts it by default, or pass your own `-backend-config="path=..."` if you want it elsewhere). |
| `variables.tf` | `env`, `group`, `project` (all default to a `livetest`-style value), `pr_number` (default `"manual"`, unused directly by this harness - see note below), and `administrative_unit` (typed `any`, passed straight through to the module). |
| `config/administrative_unit.tfvars` | One representative fixture, adapted from the `L2_test_administrative_unit` upgrade-probe harness: `custom_name`, `description`, `hidden_membership_enabled`. No `members`/`role_members` exercised - the mock test suite already covers that matrix. |

No Terragrunt anywhere under this directory - a single harness per repo has
no cross-harness DRY need.

## Running it manually

Requires your own `az login` session against an account with
`AdministrativeUnit.ReadWrite.All` or `Directory.ReadWrite.All` (or an
equivalent Entra role) on the tenant.

```bash
cd test/live
terraform init
terraform plan  -var-file=config/administrative_unit.tfvars
terraform apply -var-file=config/administrative_unit.tfvars
```

Confirm only `module.administrative_unit` is planned/applied, then tear it
down when done:

```bash
terraform destroy -var-file=config/administrative_unit.tfvars
```

No `.tfstate` file is committed under `test/live/` - keep each run
ephemeral, and destroy before starting a new one.

## Note on `pr_number` and concurrent runs

Unlike modules with a real Azure resource dependency (e.g. a resource group
whose name is suffixed per-PR), this harness's only collision surface is
the Administrative Unit's own tenant-wide `custom_name`. The tracked
fixture already uses a distinct `-livetest` suffix. If you need to run this
harness concurrently with someone else (or alongside a leftover run of your
own), edit `custom_name` in a local, uncommitted copy of the tfvars file
rather than relying on `var.pr_number` to disambiguate it for you.
