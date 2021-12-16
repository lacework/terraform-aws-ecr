provider "lacework" {}

provider "aws" {}

module "lacework_ecr" {
  source = "../.."
  non_os_package_support = true
}
