locals {
  lower   = lower(var.raw)
  upper   = upper(var.raw)
  snake   = replace(replace(local.lower, " ", "_"), "-", "_")
  kebab   = replace(local.snake, "_", "-")
  pascal  = replace(title(replace(replace(var.raw, "-", " "), "_", " ")), " ", "")
  camel   = "${lower(substr(local.pascal, 0, 1))}${substr(local.pascal, 1, -1)}"
  title   = title(var.raw)
  env_var = upper(local.snake)
}

output "raw" {
  description = "Raw case"
  value       = var.raw
}

output "lower" {
  description = "lower case"
  value       = local.lower
}

output "upper" {
  description = "UPPER CASE"
  value       = local.upper
}

output "snake" {
  description = "snake_case"
  value       = local.snake
}

output "kebab" {
  description = "kebab-case"
  value       = local.kebab
}

output "pascal" {
  description = "PascalCase"
  value       = local.pascal
}

output "camel" {
  description = "camelCase"
  value       = local.camel
}

output "title" {
  description = "Title Case"
  value       = local.title
}

output "env_var" {
  description = "ENV_VAR_CASE"
  value       = local.env_var
}
