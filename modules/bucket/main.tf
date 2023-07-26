locals {
  buckets = ["${var.source_bucket_name}", "thumbnail-${var.source_bucket_name}"]
}

resource "aws_s3_bucket" "buckets" {
    count = length(local.buckets)
    bucket = local.buckets[count.index]
    force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
    count = length(local.buckets)
    bucket = aws_s3_bucket.buckets[count.index].id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
    depends_on = [aws_s3_bucket.buckets]
}

resource "aws_s3_bucket_acl" "acl" {
  count      = length(local.buckets)
  depends_on = [aws_s3_bucket_ownership_controls.ownership_controls]

  bucket = aws_s3_bucket.buckets[count.index].id
  acl    = "private"
}