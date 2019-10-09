data "helm_repository" "stable" {
    name = "stable"
    url  = "https://kubernetes-charts.storage.googleapis.com"
}

resource "helm_release" "artemis" {
  name       = "artemis-release"
  repository = "${file("./artemis-deployment/Chart.yaml")}"
  chart      = "artemis"
  version    = "1"

  values = [
    "${file("./artemis-deployment/values.yaml")}"
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