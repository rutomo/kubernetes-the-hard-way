variable "project_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}

provider "google" {
  credentials = "${file("account.json")}"
  project     = var.project_id
  region      = "us-central1"
}
