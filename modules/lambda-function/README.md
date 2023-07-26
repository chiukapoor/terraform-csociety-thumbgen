# Terraform Custom Module - Lambda Function for Thumbnail Generation

## Overview

This Terraform custom module deploys an AWS Lambda function responsible for creating thumbnails of images stored in an S3 bucket. The Lambda function is triggered whenever new objects are created in the specified source S3 bucket. The thumbnail images are then stored in another designated S3 bucket.

## Prerequisites

- Terraform version 0.12.x or higher
- AWS credentials with the necessary permissions to create Lambda functions and access S3 buckets

## Usage

To use this custom module, follow these steps:

1. Include the module in your Terraform configuration by specifying the module source and required variables:

```hcl
module "thumbnail_lambda" {
  source = "./path/to/your/module"

  lambda_function_name = "ThumbnailLambdaFunction"
  source_bucket_name   = "your-source-bucket-name"
  aws_iam_role_arn     = "your-iam-role-arn"
}
```

Replace `"./path/to/your/module"` with the actual path to the directory containing the module.

2. Define your desired variables in the same directory by creating a `variables.tf` file:

```hcl
variable "lambda_function_name" {
  description = "The name of the Lambda function."
  default     = "ThumbnailLambdaFunction"
}

variable "source_bucket_name" {
  description = "The name of the source S3 bucket containing images."
  default     = "image-bucket-chirayu"
}

variable "aws_iam_role_arn" {
  description = "The ARN of the IAM role associated with the Lambda function."
}
```

Provide appropriate default values or update the variables.tf file with actual values during Terraform initialization.

3. Run `terraform init` to initialize the module.

4. Execute `terraform apply` to deploy the Lambda function and related resources.

## Inputs

| Variable               | Description                                     | Type         | Default          |
|------------------------|-------------------------------------------------|--------------|------------------|
| `lambda_function_name` | Name of the Lambda function.                   | `string`     | `"ThumbnailLambdaFunction"` |
| `source_bucket_name`   | Name of the source S3 bucket.                  | `string`     | `"image-bucket-chirayu"`    |
| `aws_iam_role_arn`     | ARN of the IAM role associated with the Lambda function. | `string`     | - (Required)     |

## Outputs

| Output                  | Description                                           |
|-------------------------|-------------------------------------------------------|
| `lambda_function_arn`   | ARN of the created Lambda function.                  |

## License

This Terraform custom module is licensed under the Apache License. See the [LICENSE](./LICENSE) file for more details.

## Note

Before applying the Terraform configuration, ensure that you have the appropriate permissions and privileges to create IAM policies and roles in your AWS account. Also, make sure to review and adjust the policy's permissions according to your specific security requirements.

## Authors

- dev.csociety@gmail.com