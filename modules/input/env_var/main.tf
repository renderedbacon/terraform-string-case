locals {
  env_var = var.env_var
  raw     = replace(lower(local.env_var), "_", " ")
}

module "case" {
  source = "../../../"
  raw    = local.raw
}
