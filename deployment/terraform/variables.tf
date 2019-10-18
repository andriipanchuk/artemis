variable "deployment_environment" {
  default = "dev"
}

variable "dns_endpoint_artemis" {
  type = "map"

  default = {
    dev  = "dev.artemis.fuchicorp.com"
    qa   = "qa.artemis.fuchicorp.com"
    prod = "artemis.fuchicorp.com"
  }
}

variable "deployment_image" {
  default = "docker.fuchicorp.com/artemis-dev:0.2"
}


variable "version" {
  default = "0.1"
}


