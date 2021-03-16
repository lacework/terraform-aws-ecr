output "external_id" {
  value       = local.iam_role_external_id
  description = "The External ID configured into the IAM role"
}

output "iam_role_name" {
  value       = var.iam_role_name
  description = "The IAM Role name"
}

output "iam_role_arn" {
  value       = local.iam_role_arn
  description = "The IAM Role ARN"
}

output "registry_domain" {
  value       = local.registry_domain
  description = "The registry domain configured"
}

variable "lacework_integration_name" {
  type        = string
  default     = "TF ECR IAM Role"
  description = "The name of the external ECR integration"
}
