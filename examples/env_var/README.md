# Terraform String Case - Env-Var Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- terraform (>= 1.1)

## Modules

The following Modules are called:

### case

Source: ../../modules/input/env_var

Version:

## Optional Inputs

The following input variables are optional (have default values):

### env\_var

Description: Optional string to use as input.

Type: `string`

Default: `"SIMPLE_STRING_FOR_TESTING"`

## Outputs

The following outputs are exported:

### alpha\_num

Description: AlphaNumCase

### camel

Description: camelCase

### env\_var

Description: ENV\_VAR\_CASE

### kebab

Description: kebab-case

### lower

Description: lower case

### pascal

Description: PascalCase

### raw

Description: Raw case

### snake

Description: snake\_case

### title

Description: Title Case

### upper

Description: UPPER CASE
<!-- END_TF_DOCS -->
