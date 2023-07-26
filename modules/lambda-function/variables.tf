variable "lambda_function_name" {
  description = "The name of the Lambda function to be created."
  type        = string
  default     = "ThumbnailLambdaFunction"
}

variable "source_bucket_name" {
  description = "The name of the source S3 bucket where images are stored."
  type        = string
  default     = "image-bucket-chirayu"
}

variable "aws_iam_role_arn" {
  description = "The ARN (Amazon Resource Name) of the IAM role associated with the Lambda function."
  type        = string
}
