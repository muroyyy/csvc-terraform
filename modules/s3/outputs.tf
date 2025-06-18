output "bucket_url" {
  value = "https://${aws_s3_bucket.this.bucket}.s3.amazonaws.com"
}
