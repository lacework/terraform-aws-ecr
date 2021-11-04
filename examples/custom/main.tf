provider "lacework" {}

provider "aws" {}

module "lacework_ecr" {
  source = "../.."

  lacework_integration_name = "custom integration name"
  non_os_package_support    = true
  tags = {
    env = "dev"
  }
}
