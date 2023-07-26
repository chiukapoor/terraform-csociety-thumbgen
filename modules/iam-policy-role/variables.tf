variable "policy_name" {
    description = "The name of the IAM policy for providing Lambda function access to CloudWatch Logs and S3 buckets."
    type        = string
    default     = "LambdaS3CWpolicy"
}

variable "role_name" {
    description = "The name of the IAM role for granting permissions to the Lambda function."
    type        = string
    default     = "LambdaS3CWrole"
}

variable "source_bucket_name" {
    description = "The name of the source S3 bucket containing images for the Lambda function to process."
    type        = string
    default     = "image-bucket-chirayu"
}
