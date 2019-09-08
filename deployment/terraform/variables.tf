variable "deployment_environment" {
  default = "prod"
}

variable "dns_endpoint_artemis" {
  type = "map"

  default = {
    dev  = "dev.artemis.fuchicorp.com"
    qa   = "qa.artemis.fuchicorp.com"
    prod = "artemis.fuchicorp.com"
  }
}

variable "artemis_image" {
  default = "docker.fuchicorp.com/artemis-dev:0.2"
}

variable "lets_encrypt_email" {
  default = "fuchicorpsolutions@gmail.com"
}
