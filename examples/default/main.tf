provider "lacework" {}
provider "aws" {
  region = "us-west-2"
}

module "lacework_ecr" {
  source = "../.."
}
