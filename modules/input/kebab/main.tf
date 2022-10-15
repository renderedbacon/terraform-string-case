locals {
  kebab = var.kebab
  raw   = replace(local.kebab, "-", " ")
}

module "case" {
  source = "../../../"
  raw    = local.raw
}
