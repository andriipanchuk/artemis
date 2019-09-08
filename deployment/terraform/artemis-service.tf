resource "kubernetes_service" "artemis_service" {

  metadata {
    name = "artemis-service"
    namespace = "${var.deployment_environment}"
  }

  spec {
    selector { run = "artemis"  }

    port {
      port = 7105
      target_port = 5000
    }

    type = "ClusterIP"
  }
}
