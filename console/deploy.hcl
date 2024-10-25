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

  sha     = "h1:tpDTuaPw0dSVRTYVPd5cQuLpUiYZcjYUg6EAs9ySV6c="
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

  sha     = "h1:yxJkPWPAOJdotBhbnfY2Y+26rk9QWvV3JXUCC4jU+nk="
  retries = 2
  verbose = false
}
