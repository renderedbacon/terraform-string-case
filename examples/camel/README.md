# Terraform String Case - Camel Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| case | ../../modules/input/camel | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| camel | Optional string to use as input. | `string` | `"simpleStringForTesting"` | no |

## Outputs

| Name | Description |
|------|-------------|
| alpha\_num | AlphaNumCase |
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
