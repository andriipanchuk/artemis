resource "helm_release" "artemis_services_ingress" {

  name = "artemis-services-ingress-${var.deployment_environment}"
  namespace = "${var.deployment_environment}"
  chart = "./helm-deployment"

  set {
    name = "dns_endpoint"
    value = "${lookup(var.dns_endpoint_artemis, "${var.deployment_environment}")}"
  }

  set {
    name = "artemis_service"
    value = "${kubernetes_service.artemis_service.metadata.0.name}"
  }

  set {
    name = "artemis_port"
    value = "${kubernetes_service.artemis_service.spec.0.port.0.port}"
  }


  set {
    name = "email"
    value = "${var.lets_encrypt_email}"
  }

}
