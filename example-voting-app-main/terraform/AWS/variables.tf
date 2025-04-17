variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "bucket_name" {
  description = "Unique S3 bucket name"
  type        = string
}

variable "environment" {
  description = "Environment (e.g. dev, staging, prod)"
  type        = string
  default     = "dev"
}
