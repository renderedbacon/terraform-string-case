locals {
  pascal = var.pascal
  raw    = title(join(" ", regexall("(?:[A-Z]+[a-z0-9]+)", local.pascal)))
}

module "case" {
  source = "../../../"
  raw    = local.raw
}
