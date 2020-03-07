module "artemis_deploy" {
  source  = "fuchicorp/chart/helm"
  version = "0.0.2"
  deployment_name        = "artemis-deployment"
  deployment_environment = "${var.deployment_environment}"
  deployment_endpoint    = "artemis.fuchicorp.com"
  deployment_path        = "artemis"

  template_custom_vars = {
    deployment_image = "${var.deployment_image}"
  }
}