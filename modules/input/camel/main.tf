locals {
  camel = var.camel
  raw   = title(join(" ", regexall("^(?:[a-z0-9]+)|(?:[A-Z]*[a-z0-9]+)", local.camel)))
}

module "case" {
  source = "../../../"
  raw    = local.raw
}
