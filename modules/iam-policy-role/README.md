# Terraform Custom Module - Lambda S3 CloudWatch Policy

## Overview

This Terraform custom module facilitates the creation of an AWS Identity and Access Management (IAM) policy, role, and attachment for providing Lambda function access to CloudWatch Logs and S3 buckets. The policy allows the Lambda function to perform specified actions on the resources related to the source S3 bucket and its thumbnail counterpart.

## Prerequisites

- Terraform version 0.12.x or higher
- Appropriate AWS credentials with the necessary permissions to create IAM policies and roles

## Usage

To use this custom module, follow these steps:

1. Include the module in your Terraform configuration by specifying the module source and required variables:

```hcl
module "lambda_s3_cw_policy" {
  source = "path/to/this/custom/module"

  policy_name        = "LambdaS3CWpolicy"
  role_name          = "LambdaS3CWrole"
  source_bucket_name = "your-source-bucket-name"
}
```

2. Optionally, customize the variable values to match your desired policy and role names, as well as the source S3 bucket name.

3. Run `terraform init` to initialize the configuration and then `terraform apply` to create the IAM policy, role, and attachment.

## Module Components

### `main.tf`

This file contains the Terraform configuration to create an AWS IAM policy, role, and attachment. The policy allows the Lambda function to access CloudWatch Logs and perform actions on the specified source and thumbnail S3 buckets.

### `variables.tf`

The variable definitions are provided here with default values for `policy_name`, `role_name`, and `source_bucket_name`. You can override these defaults by specifying your desired values in your Terraform configuration.

## Outputs

| Output              | Description                                    |
|---------------------|------------------------------------------------|
| `aws_iam_role_arn`  | The ARN of the IAM role created by the module.|

## License

This Terraform custom module is licensed under the Apache License, Version 2.0. See the [LICENSE](LICENSE) file for more details.

## Note

Before applying the Terraform configuration, ensure that you have the appropriate permissions and privileges to create IAM policies and roles in your AWS account. Also, make sure to review and adjust the policy's permissions according to your specific security requirements.

## Authors

- dev.csociety@gmail.com