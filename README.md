# Terraform Custom Module: S3 Thumbnail Creation

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://registry.terraform.io/modules/chiukapoor/thumbgen/csociety/latest)

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)


This Terraform custom module helps you create an AWS Lambda function to generate thumbnails for images stored in an S3 bucket. The module consists of several sub-modules for creating the S3 bucket, IAM policy and role, and Lambda function, enabling you to easily deploy the thumbnail generation workflow in your AWS environment.

## Prerequisites

Before using this module, ensure you have the following prerequisites:

1. Terraform installed on your local machine.
2. Appropriate AWS credentials set up in your local AWS configuration file (`$HOME/.aws/config`).
3. Familiarity with Terraform and AWS concepts.

## Usage

1. Include the custom module in your Terraform configuration:

```hcl
provider "aws" {
    shared_config_files = var.shared_config_files
    profile             = var.profile
    region              = var.region
}

module "create_s3_thumbnail" {
  source              = "./modules/bucket"
  source_bucket_name  = var.source_bucket_name
  acl                 = var.acl
  # Output not used
}

module "lambda_s3_policy" {
  source              = "./modules/iam-policy-role"
  policy_name         = var.policy_name
  role_name           = var.role_name
  source_bucket_name  = var.source_bucket_name
}

module "create_lambda_thumbnail" {
  source                  = "./modules/lambda-function"
  lambda_function_name    = var.lambda_function_name
  source_bucket_name      = var.source_bucket_name
  aws_iam_role_arn        = module.lambda_s3_policy.aws_iam_role_arn
  depends_on              = [module.lambda_s3_policy]
}

module "test_lambda_s3" {
  source                  = "./examples/test-lambda-s3"
  source_bucket_name      = var.source_bucket_name
  depends_on              = [module.create_lambda_thumbnail]
}
```

2. Set the required variables in your `variables.tf` file:

```hcl
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

variable "lambda_function_name" {
    default = "ThumbnailLambdaFunction"
}
```

## License

This Terraform custom module is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for more details.

Feel free to modify and extend this module according to your specific needs. For any issues or contributions, please create a pull request on the repository.

Happy Terraforming!
