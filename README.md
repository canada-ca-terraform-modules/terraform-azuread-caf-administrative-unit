# AzureAD Administrative Unit

## Terraform variables for this module

[./ESLZ/administrative_units.tfvars](./ESLZ/administrative_units.tfvars)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 3.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_administrative_unit.au](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/administrative_unit) | resource |
| [azuread_administrative_unit_member.member](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/administrative_unit_member) | resource |
| [azuread_administrative_unit_role_member.rm](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/administrative_unit_role_member) | resource |
| [azuread_directory_roles.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/directory_roles) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrative_unit"></a> [administrative\_unit](#input\_administrative\_unit) | Administrative Unit configuration object | `any` | `{}` | no |
| <a name="input_env"></a> [env](#input\_env) | (Required) 4 character string defining the environment name prefix used to build the default Administrative Unit display name | `string` | n/a | yes |
| <a name="input_group"></a> [group](#input\_group) | (Required) Character string defining the group used to build the default Administrative Unit display name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Optional) Azure location — retained for backward compatibility, not used by this module (Administrative Units are a global Azure AD resource with no location) | `string` | `"canadacentral"` | no |
| <a name="input_project"></a> [project](#input\_project) | (Required) Character string defining the project used to build the default Administrative Unit display name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azuread_administrative_unit_object"></a> [azuread\_administrative\_unit\_object](#output\_azuread\_administrative\_unit\_object) | The AzureAD Administrative Unit object |
<!-- END_TF_DOCS -->
