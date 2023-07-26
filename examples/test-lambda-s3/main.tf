resource "aws_s3_object" "test_file" {
  bucket = "${var.source_bucket_name}"
  key    = "test.png"
  acl    = "private"
  source = ".terraform/modules/thumbgen/examples/test-lambda-s3/images/test.png"
  etag = filemd5(".terraform/modules/thumbgen/examples/test-lambda-s3/images/test.png")
}