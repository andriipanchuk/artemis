terraform {
  backend "gcs" {
    bucket  = "fuchicorp-bucket"
    prefix  = "dev/artemis"
    project = "fuchicorp-project-88"
  }
}
