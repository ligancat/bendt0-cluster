metadata {
  path = "console"
  name = "diff"
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

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:p4zJe8cIZRRKTm10vpda/Z9T4TK9OwZc++LuEMhCyB8="
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:7Qm9FeWQKBPto36HjQik5B1dzC46VSkl4oweGH7tPPk="
  retries = 0
  verbose = false
}
