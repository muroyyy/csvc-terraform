variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-1"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "github_repo_url" {
  type        = string
  default     = "https://github.com/muroyyy/csvc-assignment-php-files.git"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
  sensitive = true
}

variable "db_name" {
  type    = string
  default = "csvcdb"
}

variable "s3_bucket_name" {
  type = string
}
