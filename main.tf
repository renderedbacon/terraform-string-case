locals {
  defaults = {
    alpha_num = {
      replacement_regex  = "/[^a-zA-Z0-9]/"
      replacement_string = ""
    }
  }

  raw     = var.raw
  lower   = lower(local.raw)
  upper   = upper(local.raw)
  snake   = replace(replace(local.lower, " ", "_"), "-", "_")
  kebab   = replace(local.snake, "_", "-")
  pascal  = replace(title(replace(replace(local.raw, "-", " "), "_", " ")), " ", "")
  camel   = "${lower(substr(local.pascal, 0, 1))}${substr(local.pascal, 1, -1)}"
  title   = title(local.raw)
  env_var = upper(local.snake)
  alpha_num = replace(
    local.raw,
    local.defaults.alpha_num.replacement_regex,
    local.defaults.alpha_num.replacement_string
  )
}
