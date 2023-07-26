variable "source_bucket_name" {
    default = "image-bucket-chirayu"
}

variable "acl" {
    default = "private"
}

variable "shared_config_files" {
    default = ["$HOME/.aws/config"]
}

variable "profile" {
    default = "ck"
}

variable "region" {
    default = "ap-south-1"
}

variable "policy_name" {
    default = "LambdaS3CWpolicy"
}

variable "role_name" {
    default = "LambdaS3CWrole"
}

variable "lambda_function_name"{
    default = "ThumbnailLambdaFunction"
}