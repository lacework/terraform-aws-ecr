# Release Notes
Another day, another module. This is our first release of our ECR Module version `v0.1.0`.

## Usage
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
