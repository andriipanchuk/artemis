data "template_file" "artemis_values" {
  template = "${file("./artemis-deployment/template_values.yaml")}"
  vars = {
    domain_name = "${var.domain_name}"
    docker_image = "${var.docker_image}"
    docker_image_tag = "${var.docker_image_tag}"
  }
}

resource "local_file" "artemis_values_local_file" {
  content  = "${trimspace(data.template_file.artemis_values.rendered)}"
  filename = "./artemis-deployment/.cache/values.yaml"
}

resource "helm_release" "artemis" {
  name       = "${var.name}"
  namespace = "${var.namespace}"
  chart = "./artemis-deployment"
  version    = "${var.version}"
   values = [
    "${data.template_file.artemis_values.rendered}"
  ]
}