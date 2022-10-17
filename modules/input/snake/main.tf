locals {
  snake = var.snake
  raw   = replace(local.snake, "_", " ")
}

module "case" {
  source = "../../../"
  raw    = local.raw
}
