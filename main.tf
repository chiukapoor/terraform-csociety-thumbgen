provider "aws" {
    shared_config_files = "${var.shared_config_files}"
    profile = "${var.profile}"
    region = "${var.region}"
}

module "create-s3-thumbnail" {
  source = "./modules/bucket"
  source_bucket_name = var.source_bucket_name
  acl = var.acl
  # Output not used
}

module "lambda-s3-policy" {
  source = "./modules/iam-policy-role"
  policy_name = var.policy_name
  role_name = var.role_name
  source_bucket_name = var.source_bucket_name
}

module "create-lambda-thumbnail" {
  source = "./modules/lambda-function"
  lambda_function_name = var.lambda_function_name
  source_bucket_name = var.source_bucket_name
  aws_iam_role_arn = module.lambda-s3-policy.aws_iam_role_arn
  depends_on = [module.lambda-s3-policy]
}

module "test-lambda-s3" {
  source = "./examples/test-lambda-s3"
  source_bucket_name = var.source_bucket_name
  depends_on = [ module.create-lambda-thumbnail ]
}