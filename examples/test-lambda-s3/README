**Terraform Custom Module: aws_s3_object**

The `aws_s3_object` custom module is designed to upload a test file ("test.png") to an Amazon S3 bucket. The module allows you to specify the source file path, target S3 bucket, and other relevant configurations. This readme provides a quick overview of how to use this custom module in your Terraform projects.

### Prerequisites

- Terraform installed on your local machine (version 0.12 or higher)
- AWS CLI configured with the appropriate access credentials

### Module Usage

To use the `aws_s3_object` custom module, follow these steps:

1. **Module Configuration**

In your Terraform project, create a new directory named "modules" if it doesn't exist already. Inside the "modules" directory, create a subdirectory named "aws_s3_object" to hold the custom module's code.

Your directory structure should look like this:

```
.
├── main.tf
├── variables.tf
├── outputs.tf
└── modules
    └── aws_s3_object
        ├── main.tf
        └── variables.tf
```

2. **Module Code**

Inside the "modules/aws_s3_object" directory, create a `main.tf` file with the following code:

```hcl
# modules/aws_s3_object/main.tf

resource "aws_s3_object" "test_file" {
  bucket = var.source_bucket_name
  key    = "test.png"
  acl    = "private"
  source = "examples/test-lambda-s3/images/test.png"
  etag   = filemd5("examples/test-lambda-s3/images/test.png")
}
```

3. **Module Variables**

Create a `variables.tf` file inside the "modules/aws_s3_object" directory with the required variables:

```hcl
# modules/aws_s3_object/variables.tf

variable "source_bucket_name" {
  description = "The name of the target S3 bucket."
  type        = string
}
```

4. **Root Configuration**

In your root Terraform configuration (usually "main.tf" or "terraform.tf"), call the custom module by referencing its source path:

```hcl
# Root Configuration (e.g., main.tf)

provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

module "custom_s3_object" {
  source              = "./modules/aws_s3_object"
  source_bucket_name  = "your_source_bucket_name"
}
```

Replace `"your_source_bucket_name"` with the name of your target S3 bucket where you want to upload the "test.png" file.

5. **Apply Configuration**

Run the following Terraform commands to apply the configuration:

```bash
terraform init
terraform apply
```

Terraform will use the `aws_s3_object` module to upload the "test.png" file to the specified S3 bucket.

## Note

Before applying the Terraform configuration, ensure that you have the appropriate permissions and privileges to create IAM policies and roles in your AWS account. Also, make sure to review and adjust the policy's permissions according to your specific security requirements.

## Authors

- dev.csociety@gmail.com