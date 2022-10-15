# Terraform String Case

Terraform module to allow for string case transformations.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| raw | Raw input string.  Raw formatted string must be space delimited and capitalization will be preserved if possible. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| camel | camelCase |
| env\_var | ENV\_VAR\_CASE |
| kebab | kebab-case |
| lower | lower case |
| pascal | PascalCase |
| raw | Raw case |
| snake | snake\_case |
| title | Title Case |
| upper | UPPER CASE |
<!-- END_TF_DOCS -->
