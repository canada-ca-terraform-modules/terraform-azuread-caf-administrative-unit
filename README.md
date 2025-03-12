# AzureAD Administrative Unit

## Terraform variables for this module

[./ESLZ/administrative_units.tfvars](./ESLZ/administrative_unit.tfvars)

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrative_unit"></a> [administrative\_unit](#input\_administrative\_unit) | Administrative Unit configuration object | `any` | `{}` | no |
| <a name="input_env"></a> [env](#input\_env) | (Required) 4 character string defining the environment name prefix for the VM | `string` | n/a | yes |
| <a name="input_group"></a> [group](#input\_group) | (Required) Character string defining the group for the target subscription | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location for the VM | `string` | `"canadacentral"` | no |
| <a name="input_project"></a> [project](#input\_project) | (Required) Character string defining the project for the target subscription | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags that will be applied to every associated VM resource | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->