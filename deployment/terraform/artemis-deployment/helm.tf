data "helm_repository" "stable" {
    name = "stable"
    url  = "https://github.com/fuchicorp/artemis"
}

resource "helm_release" "artemis" {
  name       = "artemis-release"
  repository = "${data.helm_repository.stable.metadata.0.name}"
  chart      = "artemis"
  version    = "0.1"

  values = [
    "${file("values.yaml")}"
  ]

  set {
    name  = "cluster.enabled"
    value = "true"
  }

  set {
    name  = "metrics.enabled"
    value = "true"
  }

  set_string {
    name  = "service.annotations.artemis\\.io/port"
    value = "5000"
  }
}