variable "deployment_environment" {
    default = "dev"
}

variable "deployment_endpoint" {
  type = "map"

  default = {
    dev  = "dev.artemis.fuchicorp.com"
    qa   = "qa.artemis.fuchicorp.com"
    prod = "prod.artemis.fuchicorp.com"
  }
}


variable "deployment_image" {
  
}