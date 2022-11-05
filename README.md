# Terraform String Case - Raw

Terraform module to allow for string case transformations.

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- terraform (>= 1.1)

## Required Inputs

The following input variables are required:

### raw

Description: Raw input string.  Raw formatted string must be space delimited and capitalization will be preserved if possible.

Type: `string`

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
