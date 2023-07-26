# Terraform Custom Module - AWS S3 Buckets

## Overview

This Terraform custom module allows you to create AWS S3 buckets with ownership controls and access control lists (ACLs) on them. The module uses the provided `source_bucket_name` variable to create two S3 buckets - one with the given name and another with the prefix "thumbnail-" followed by the given name.

## Prerequisites

- Terraform version 0.12.x or higher
- Appropriate AWS credentials with the necessary permissions to create S3 buckets

## Usage

To use this custom module, follow these steps:

1. Include the module in your Terraform configuration by specifying the module source and required variables:

```hcl
module "s3_buckets" {
  source = "github.com/your-organization/terraform-aws-s3-buckets"

  source_bucket_name = "your-source-bucket-name"
}
```

2. Optionally, set values for the input variables in your root configuration, if needed.

3. Run `terraform init` to initialize the module.

4. Run `terraform apply` to create the S3 buckets.

## Inputs

| Variable               | Description                                     | Type         | Default          |
|------------------------|-------------------------------------------------|--------------|------------------|
| `source_bucket_name`   | Name of the source S3 bucket.                   | `string`     | - (Required)     |
| `acl`                  | Access control list for the S3 buckets.         | `string`     | `"private"`      |

## Outputs

| Output                  | Description                                           |
|-------------------------|-------------------------------------------------------|
| `bucket_names`          | List of created S3 bucket names (including thumbnail).|

## License

This Terraform custom module is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for more details.

## Note

Before applying the Terraform configuration, ensure that you have the appropriate permissions and privileges to create IAM policies and roles in your AWS account. Also, make sure to review and adjust the policy's permissions according to your specific security requirements.

## Authors

[Chirayu Kapoor](https://github.com/chiukapoor/)