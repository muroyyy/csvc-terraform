provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_name = "csvc-assignment-vpc"
  availability_zones = var.availability_zones
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  instance_type = var.ec2_instance_type
  github_repo_url = var.github_repo_url
}

module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  db_username = var.db_username
  db_password = var.db_password
}

module "secrets_manager" {
  source = "./modules/secrets_manager"
  db_username = var.db_username
  db_password = var.db_password
  db_name     = var.db_name
  db_endpoint = module.rds.db_endpoint
}

module "s3" {
  source = "./modules/s3"
  bucket_name = var.s3_bucket_name
}
