output "instance_ip_addr" {
  value = aws_s3_bucket.buckets[*].bucket
}