output "ec2_public_ip" {
  value = module.ec2.instance_public_ip
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}

output "s3_bucket_url" {
  value = module.s3.bucket_url
}
