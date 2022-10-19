locals {
  chars = {
    lower      = "a-z"
    upper      = "A-Z"
    num        = "0-9"
    hyphen     = "-"
    underscore = "_"
    space      = " "
    empty      = ""
  }

  alpha_num_chars = [
    local.chars.lower,
    local.chars.upper,
    local.chars.num,
  ]

  alpha_num_regex = "/[^${join("", local.alpha_num_chars)}]/"
  kebab_regex     = "/[^${join("", concat(local.alpha_num_chars, [local.chars.hyphen]))}]/"
  snake_regex     = "/[^${join("", concat(local.alpha_num_chars, [local.chars.underscore]))}]/"


  raw = var.raw

  lower = lower(local.raw)

  upper = upper(local.raw)

  # snake case replaces hyphens and spaces with underscore
  # then remove all invalid characters
  snake = replace(
    replace(
      local.lower,
      "/[${join("", [local.chars.hyphen, local.chars.space])}]/",
      local.chars.underscore
    ),
    local.snake_regex,
    local.chars.empty
  )

  # kebab case is snake case with the underscores swapped out for hyphens
  kebab = replace(local.snake, local.chars.underscore, local.chars.hyphen)

  # pascal case is replacement of non-alphanum characters by spaces
  # the title case of all groups of chars followed by removal of spaces
  pascal = replace(
    title(
      replace(
        local.raw,
        local.alpha_num_regex,
        local.chars.space
      )
    ),
    local.chars.space,
    local.chars.empty
  )

  # camel case is pascal case with the first letter lower cased
  camel = "${lower(substr(local.pascal, 0, 1))}${substr(local.pascal, 1, -1)}"

  title = title(local.raw)

  # env var case is all upper snake case
  env_var = upper(local.snake)

  # alpha num case is no casing changes but all non-alpha-num chars removed
  alpha_num = replace(local.raw, local.alpha_num_regex, local.chars.empty)
}
