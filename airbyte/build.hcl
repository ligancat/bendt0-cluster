metadata {
  name = "airbyte"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/airbyte"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "e8bad42ceac950c1afb0218d6c90b1a995df747daedaf84d30b0e274e8cfc077"
    retries = 0
    verbose = false
  }
}
