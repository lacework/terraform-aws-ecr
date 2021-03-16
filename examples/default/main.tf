provider "lacework" {}

provider "aws" {}

module "lacework_ecr" {
  source = "../.."
}
