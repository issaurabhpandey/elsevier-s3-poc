terraform {
  backend "s3" {
    bucket = "elsevier-backend"
    key    = "terraform/key"
    region = "us-east-1"
  }
}