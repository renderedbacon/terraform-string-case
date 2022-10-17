variable "camel" {
  description = "Camel input string.  Conversion assumes all case changes are separate words.  Will title case all words during conversion."
  type        = string

  validation {
    condition     = length(replace(var.camel, "/[A-Za-z0-9]/", "")) == 0
    error_message = "Invalid character(s) for camel case string.  Please use only uppercase, lowercase, and numbers."
  }
}
