metadata {
  path = "console"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:p4zJe8cIZRRKTm10vpda/Z9T4TK9OwZc++LuEMhCyB8="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:p4zJe8cIZRRKTm10vpda/Z9T4TK9OwZc++LuEMhCyB8="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "console"
  target  = "console/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "console",
  ]

  sha     = "h1:p4zJe8cIZRRKTm10vpda/Z9T4TK9OwZc++LuEMhCyB8="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "console"
  target  = "console"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "h1:aNL0T3+rONF+GCGofDv6+/lcN6/NyCRU/HNXeu54JDo="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "console"
  target  = "console/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "console",
  ]

  sha     = "h1:22y07XH81f16VPDU3hBatnEzui0KJG2HMY+uEqPX3MU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "console"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "console",
  ]

  sha     = "h1:p8ejAHPI1H10KLGIjV/s1ppUKl8EvsYQz6Srz576UcU="
  retries = 2
  verbose = false
}
