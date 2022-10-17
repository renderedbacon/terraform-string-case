variable "snake" {
  description = "Snake input string.  Conversion assumes all underscores are spaces and all words are lower cased."
  type        = string

  validation {
    condition     = length(replace(var.snake, "/[a-z0-9_]/", "")) > 0
    error_message = "Invalid character(s) for snake case string.  Please use only lowercase, numbers, and underscores."
  }
}
