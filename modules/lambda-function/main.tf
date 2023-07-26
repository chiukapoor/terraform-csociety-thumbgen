resource "aws_lambda_function" "thumbnail_lambda_function" {
  function_name = "${var.lambda_function_name}"
  description   = "Lambda function to create thumbnail of images stored in s3 bucket with triggered configured and store the thumbnail into another bucket"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  timeout = 10
  memory_size = 1024
  role = "${var.aws_iam_role_arn}"
  filename = ".terraform/modules/thumbgen/modules/lambda-function/code/lambda_function.zip"
}

resource "aws_lambda_permission" "s3_trigger_permission" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.thumbnail_lambda_function.function_name
  principal     = "s3.amazonaws.com"

  source_arn = "arn:aws:s3:::${var.source_bucket_name}"
  depends_on = [aws_lambda_function.thumbnail_lambda_function]
}

resource "aws_s3_bucket_notification" "lambda_trigger" {
  bucket = "${var.source_bucket_name}"

  lambda_function {
    lambda_function_arn = aws_lambda_function.thumbnail_lambda_function.arn
    events              = ["s3:ObjectCreated:*"]
  }
  depends_on = [aws_lambda_permission.s3_trigger_permission]
}