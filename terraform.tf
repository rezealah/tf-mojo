provider "aws" {
  region     = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "tf-state-rezealah"
    key    = "fargate"
    region = "us-west-2"
  }
}