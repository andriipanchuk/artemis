resource "kubernetes_deployment" "artemis-deployment" {

  metadata {
    namespace = "${var.deployment_environment}"
    name = "artemis-deployment"
    labels { run = "artemis" }
  }

  spec {
    replicas = 1
    selector {
      match_labels { run = "artemis" } }

    template {
      metadata {
        labels { run = "artemis" }
      }

      spec {
        image_pull_secrets = [ { name = "nexus-creds" } ]

        container {
          image             = "${var.artemis_image}"
          name              = "artemis-container"
          command           = [ "python", "/app/artemis.py" ]
          image_pull_policy = "Always"
        }
      }
    }
  }
}
