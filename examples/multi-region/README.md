# Multi-region ECR Integration

This example show how to integrate multiple Amazon Container Registries (ECR) from multple regions with the same IAM Role
and integrate them with Lacework.

```hcl
terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
    }
  }
}

provider "lacework" {}

provider "aws" {
  alias  = "west2"
  region = "us-west-2"
}

module "lacework_ecr_west" {
  source = "../.."
  non_os_package_support = true
  providers = {
    aws = aws.west2
  }
}

provider "aws" {
  alias  = "east1"
  region = "us-east-1"
}

module "lacework_ecr_east" {
  source = "../.."
  non_os_package_support = true
  providers = {
    aws = aws.west2
  }
  use_existing_iam_role = true
  iam_role_name         = module.lacework_ecr_west.iam_role_name
  iam_role_arn          = module.lacework_ecr_west.iam_role_arn
  iam_role_external_id  = module.lacework_ecr_west.external_id
}
```

## Verifying Integrations with the Lacework CLI

To verify that the integrations were created successfully you can use the Lacework CLI with the command:
```
$ lacework int list --type CONT_VULN_CFG
                      INTEGRATION GUID                               NAME               TYPE        STATUS    STATE
-----------------------------------------------------------+----------------------+---------------+---------+--------
  MINIALLY_3884B70BF5F60803A1EB9A7B5238F78FFFD8DE746C2D6DC   TF ECR IAM Role        CONT_VULN_CFG   Enabled   Ok
  MINIALLY_9293C0545824CF31E4D29AA3D2BE425189ED2D56F45B0B0   TF ECR IAM Role        CONT_VULN_CFG   Enabled   Ok
``
