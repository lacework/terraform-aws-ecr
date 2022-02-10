<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-aws-ecr

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-aws-ecr.svg)](https://github.com/lacework/terraform-aws-ecr/releases/)
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)]( https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

A Terraform Module to integrate Amazon Container Registries (ECR) with Lacework.

## Inputs

| Name                      | Description                                                                                                      | Type          | Default             | Required |
|---------------------------|------------------------------------------------------------------------------------------------------------------|---------------|---------------------|----------|
| registry_domain           | The registry domain to configure                                                                                 | `string`      | `""`                | no       |
| use_existing_iam_role     | Set this to true to use an existing IAM role                                                                     | `bool`        | `false`             | no       |
| iam_role_arn              | The IAM role ARN. required when setting use_existing_iam_role to true                                            | `string`      | `""`                | no       |
| iam_role_external_id      | The external ID configured inside the IAM role. required when setting use_existing_iam_role to true              | `string`      | `""`                | no       |
| iam_role_name             | The IAM role name. Required to match with iam_role_arn if use_existing_iam_role is set to true                   | `string`      | `""`                | no       |
| external_id_length        | The length of the external ID to generate. Max length is 1224. Ignored when use_existing_iam_role is set to true | `number`      | `16`                | no       |
| lacework_aws_account_id   | The Lacework AWS account that the IAM role will grant access                                                     | `string`      | `"434813966438"`    | no       |
| tags                      | A map/dictionary of Tags to be assigned to created resources                                                     | `map(string)` | `{}`                | no       |
| wait_time                 | Amount of time to wait before the next resource is provisioned                                                   | `string`      | `"15s"`             | no       |
| lacework_integration_name | The name of the external ECR integration                                                                         | `string`      | `"TF ECR IAM ROLE"` | no       |
| non_os_package_support    | Whether or not the integration should check non-os packages in the container for vulnerabilities                 | `bool`        | `true`             | no       |
| `limit_by_tags` |A list of image tags to limit the assessment of images with matching tags. If you specify limit_by_tags and limit_by_labels limits, they function as an AND. Supported field input can be ["mytext\*mytext", "mytext", "mytext\*", "mytext". Only one * wildcard is supported.| `list(string)` | no |
| `limit_by_labels` |A list of image labels to limit the assessment of images with matching labels. If you specify limit_by_tags and limit_by_labels limits, they function as an AND. Supported field input can be ["mytext\*mytext", "mytext", "mytext*", "mytext"].Only one * wildcard is supported.| `list(string)` | no |
| `limit_by_repositories` |A list of repositories to assess.| `list(string)` | no |
| `limit_num_imgs` |The maximum number of newest container images to assess per repository. Must be one of 5, 10, or 15. Defaults to 5.| `number` | 5 | no |

## Outputs

| Name | Description |
|------|-------------|
| external_id | The external ID configured into the IAM role |
| iam_role_name | The IAM Role name |
| iam_role_arn | The IAM Role ARN |
| registry_domain | The registry domain configured |
