provider "lacework" {}

provider "aws" {}

module "lacework_ecr" {
  source = "../.."
  
  limit_by_tags         = ["example*"]
  limit_by_labels       = {example: "example"}
  limit_by_repositories = ["foo","bar"]
}
