provider "lacework" {}

provider "aws" {
  alias  = "west2"
  region = "us-west-2"
}

module "lacework_ecr_west" {
  source = "../.."
  providers = {
    aws = aws.west2
  }
  non_os_package_support = true
}

provider "aws" {
  alias  = "east1"
  region = "us-east-1"
}

module "lacework_ecr_east" {
  source = "../.."
  providers = {
    aws = aws.west2
  }
  non_os_package_support = true
  use_existing_iam_role = true
  iam_role_name         = module.lacework_ecr_west.iam_role_name
  iam_role_arn          = module.lacework_ecr_west.iam_role_arn
  iam_role_external_id  = module.lacework_ecr_west.external_id
}
