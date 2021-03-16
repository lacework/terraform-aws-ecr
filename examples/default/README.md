# Default Lacework ECR Integration

This example creates a new least privilege IAM Role to access the Amazon Container Registry of the account running the automation and integrates it with Lacework.

```hcl
terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
    }
  }
}

provider "lacework" {}

provider "aws" {}

module "lacework_ecr" {
  source  = "lacework/ecr/aws"
  version = "~> 0.1"
}
```
