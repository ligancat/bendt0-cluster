metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:0d1TVu4RNzlKce9b7rg7qjbdsVicgVMrwmL80wqEXNo="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airbyte",
  ]

  sha     = "h1:0d1TVu4RNzlKce9b7rg7qjbdsVicgVMrwmL80wqEXNo="
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "airbyte/helm"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airbyte",
  ]

  sha     = "h1:Z02ZrvOtLg9JAluqRopWlwEFP/cq22ypP+DcA5w+ixI="
  retries = 0
  verbose = false
}
