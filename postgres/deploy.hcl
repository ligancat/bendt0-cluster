metadata {
  path = "postgres"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:y2tS9anx0KVk0lbJBVX3XQrnEKu71Z+Jyr8BrWYItlA="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:y2tS9anx0KVk0lbJBVX3XQrnEKu71Z+Jyr8BrWYItlA="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "postgres"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "postgres",
  ]

  sha     = "h1:y2tS9anx0KVk0lbJBVX3XQrnEKu71Z+Jyr8BrWYItlA="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "h1:M99G+4fHDjhKm0xxnkPEMfYYTplMDRPucRWjfvCEYCA="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "postgres"
  target  = "postgres/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "postgres",
  ]

  sha     = "h1:+yLsp3xyJDd0FY8Z+NRMrFzplLhv0IoKkPdynOfpk2E="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "postgres"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "postgres",
  ]

  sha     = "h1:XcNTi8VFvFSNK6oZpylavsk/mro7FZ26bmKCVJmdi/k="
  retries = 2
  verbose = false
}
