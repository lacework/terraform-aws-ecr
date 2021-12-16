provider "lacework" {}

provider "aws" {}

module "lacework_ecr" {
  source = "../.."
  non_os_package_support = true
  limit_by_tags         = ["example*"]
  limit_by_labels       = {example: "example"}
  limit_by_repositories = ["foo","bar"]
}
