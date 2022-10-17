variable "env_var" {
  description = "Environment Variable input string.  Conversion assumes all underscores are spaces and all words are lower cased."
  type        = string

  validation {
    condition     = length(replace(var.env_var, "/[A-Z0-9_]/", "")) > 0
    error_message = "Invalid character(s) for env var case string.  Please use only uppercase, numbers, and underscores."
  }
}
