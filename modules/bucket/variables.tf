variable "source_bucket_name" {
  description = "Name of the source S3 bucket. This bucket will store the original images."
  type        = string
  default     = "image-bucket-chirayu"
}

variable "acl" {
  description = "Access control list for the S3 buckets."
  type        = string
  default     = "private"
}
