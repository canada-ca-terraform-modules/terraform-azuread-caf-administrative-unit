# AzureAD Administrative Unit

## Terraform variables for this module

[./ESLZ/administrative_units.tfvars](./ESLZ/administrative_units.tfvars)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |

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
| <a name="input_env"></a> [env](#input\_env) | (Required) 4 character string defining the environment name prefix for the VM | `string` | n/a | yes |
| <a name="input_group"></a> [group](#input\_group) | (Required) Character string defining the group for the target subscription | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location for the VM | `string` | `"canadacentral"` | no |
| <a name="input_project"></a> [project](#input\_project) | (Required) Character string defining the project for the target subscription | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azuread_administrative_unit_object"></a> [azuread\_administrative\_unit\_object](#output\_azuread\_administrative\_unit\_object) | The AzureAD Administrative Unit object |
<!-- END_TF_DOCS -->