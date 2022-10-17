locals {
  kebab = var.kebab
  raw   = replace(lower(local.kebab), "_", " ")
}

module "case" {
  source = "../../../"
  raw    = local.raw
}
