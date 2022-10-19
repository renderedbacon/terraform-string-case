# Terraform String Case - Env-Var Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| case | ../../modules/input/env_var | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| env\_var | Optional string to use as input. | `string` | `"SIMPLE_STRING_FOR_TESTING"` | no |

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
