<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-aws-ecr

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-aws-ecr.svg)](https://github.com/lacework/terraform-aws-ecr/releases/)
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)]( https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

A Terraform Module to integrate Amazon Container Registries (ECR) with Lacework.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0, < 5.0.0 |
| <a name="requirement_lacework"></a> [lacework](#requirement\_lacework) | ~> 1.1 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0, < 5.0.0 |
| <a name="provider_lacework"></a> [lacework](#provider\_lacework) | ~> 1.0 |
| <a name="provider_time"></a> [time](#provider\_time) | ~> 0.6 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lacework_ecr_iam_role"></a> [lacework\_ecr\_iam\_role](#module\_lacework\_ecr\_iam\_role) | lacework/iam-role/aws | ~> 0.2 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role_policy_attachment.ecr_read_only_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [lacework_integration_ecr.iam_role](https://registry.terraform.io/providers/lacework/lacework/latest/docs/resources/integration_ecr) | resource |
| [time_sleep.wait_time](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_external_id_length"></a> [external\_id\_length](#input\_external\_id\_length) | The length of the external ID to generate. Max length is 1224. Ignored when use\_existing\_iam\_role is set to true | `number` | `16` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | The IAM role ARN. required when setting use\_existing\_iam\_role to true | `string` | `""` | no |
| <a name="input_iam_role_external_id"></a> [iam\_role\_external\_id](#input\_iam\_role\_external\_id) | The external ID configured inside the IAM role. required when setting use\_existing\_iam\_role to true | `string` | `""` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | The IAM role name. Required to match with iam\_role\_arn if use\_existing\_iam\_role is set to true | `string` | `""` | no |
| <a name="input_lacework_aws_account_id"></a> [lacework\_aws\_account\_id](#input\_lacework\_aws\_account\_id) | The Lacework AWS account that the IAM role will grant access | `string` | `"434813966438"` | no |
| <a name="input_lacework_integration_name"></a> [lacework\_integration\_name](#input\_lacework\_integration\_name) | The name of the external ECR integration | `string` | `"TF ECR IAM Role"` | no |
| <a name="input_limit_by_labels"></a> [limit\_by\_labels](#input\_limit\_by\_labels) | A list of objects with image labels to limit the assessment of images with matching labels. If you specify limit\_by\_tags and limit\_by\_label limits, they function as an AND. | <pre>list(object({<br>    key   = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_limit_by_repositories"></a> [limit\_by\_repositories](#input\_limit\_by\_repositories) | A list of repositories to assess | `list(string)` | `[]` | no |
| <a name="input_limit_by_tags"></a> [limit\_by\_tags](#input\_limit\_by\_tags) | A list of tags to limit the assessment of images with matching tags. If you specify limit\_by\_tags and limit\_by\_label limits, they function as an AND. | `list(string)` | `[]` | no |
| <a name="input_limit_num_imgs"></a> [limit\_num\_imgs](#input\_limit\_num\_imgs) | The maximum number of newest container images to assess per repository. Must be one of 5, 10, or 15. Defaults to 5. | `number` | `5` | no |
| <a name="input_non_os_package_support"></a> [non\_os\_package\_support](#input\_non\_os\_package\_support) | Whether or not the integration should check non-os packages in the container for vulnerabilities | `bool` | `true` | no |
| <a name="input_registry_domain"></a> [registry\_domain](#input\_registry\_domain) | The registry domain to configure | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map/dictionary of Tags to be assigned to created resources | `map(string)` | `{}` | no |
| <a name="input_use_existing_iam_role"></a> [use\_existing\_iam\_role](#input\_use\_existing\_iam\_role) | Set this to true to use an existing IAM role | `bool` | `false` | no |
| <a name="input_wait_time"></a> [wait\_time](#input\_wait\_time) | Amount of time to wait before the next resource is provisioned | `string` | `"15s"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_id"></a> [external\_id](#output\_external\_id) | The External ID configured into the IAM role |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | The IAM Role ARN |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | The IAM Role name |
| <a name="output_registry_domain"></a> [registry\_domain](#output\_registry\_domain) | The registry domain configured |
