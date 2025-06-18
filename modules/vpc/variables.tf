variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}
