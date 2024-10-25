metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:A5MmyBRw69MoshApEFNgqtjgMfc+aF4nZyTkqjRbdtA="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:A5MmyBRw69MoshApEFNgqtjgMfc+aF4nZyTkqjRbdtA="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:A5MmyBRw69MoshApEFNgqtjgMfc+aF4nZyTkqjRbdtA="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "h1:N7qpyooQHZNgZd6NbkA8TjZdKxFhfu5Fw/Z4g1Qv0HI="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:QJzNafRcIWRU2+sMuD3q9AEYu0g850LEi1jTrT1fjAM="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:Km/l8X2F1qrolfOwBrmkp2mnF4/u5zsbcyk49HphLk4="
  retries = 2
  verbose = false
}
