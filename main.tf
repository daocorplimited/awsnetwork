provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "cshlp-state-initial"
    key    = "cshlp-state-initial"
    region = "us-east-1"
  }
}