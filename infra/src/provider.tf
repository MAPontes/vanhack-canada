provider "aws" {
  shared_credentials_file = "/home/mapontes/.aws/credentials"
  region = "${var.aws_region}"
}
