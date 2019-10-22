data "template_file" "artemis_values" {
  template = "${file("./artemis-deployment/template_values.yaml")}"
  vars = {
    deployment_endpoint = "${lookup(var.dns_endpoint_artemis, "${var.deployment_environment}")}"
    deployment_image = "${var.deployment_image}"
  }
}

resource "local_file" "artemis_values_local_file" {
  content  = "${trimspace(data.template_file.artemis_values.rendered)}"
  filename = "./artemis-deployment/.cache/values.yaml"
}

resource "helm_release" "artemis" {
  name      = "${var.deployment_environment}-artemis-deployment"
  namespace = "${var.deployment_environment}"
  chart = "./artemis-deployment"
  version    = "${var.version}"
   values = [
    "${data.template_file.artemis_values.rendered}"
  ]
}