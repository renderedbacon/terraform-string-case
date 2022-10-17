variable "kebab" {
  description = "Kebab input string.  Conversion assumes all lower case and that all hyphens are spaces."
  type        = string

  validation {
    condition     = length(replace(var.kebab, "/[a-z0-9-]/", "")) > 0
    error_message = "Invalid character(s) for kebab case string.  Please use only lowercase, numbers, and hyphens."
  }
}
