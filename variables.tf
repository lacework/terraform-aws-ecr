variable "registry_domain" {
  type        = string
  default     = ""
  description = "The registry domain to configure"
}

variable "use_existing_iam_role" {
  type        = bool
  default     = false
  description = "Set this to true to use an existing IAM role"
}

variable "iam_role_arn" {
  type        = string
  default     = ""
  description = "The IAM role ARN. required when setting use_existing_iam_role to true"
}

variable "iam_role_external_id" {
  type        = string
  default     = ""
  description = "The external ID configured inside the IAM role. required when setting use_existing_iam_role to true"
}

variable "iam_role_name" {
  type        = string
  default     = ""
  description = "The IAM role name. Required to match with iam_role_arn if use_existing_iam_role is set to true"
}

variable "external_id_length" {
  type        = number
  default     = 16
  description = "The length of the external ID to generate. Max length is 1224. Ignored when use_existing_iam_role is set to true"
}

variable "lacework_aws_account_id" {
  type        = string
  default     = "434813966438"
  description = "The Lacework AWS account that the IAM role will grant access"
}

variable "tags" {
  type        = map(string)
  description = "A map/dictionary of Tags to be assigned to created resources"
  default     = {}
}

variable "wait_time" {
  type        = string
  default     = "15s"
  description = "Amount of time to wait before the next resource is provisioned"
}

variable "lacework_integration_name" {
  type        = string
  default     = "TF ECR IAM Role"
  description = "The name of the external ECR integration"
}
