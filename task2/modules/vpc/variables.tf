variable "vpc_name" {
  description = "Name of the vpc"
}
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for subnets"
}

variable "availability_zones" {
  description = "List of availability zones for subnets"
}

variable "route_table_name" {
  description = "Name of the route table"
}

variable "internet_gateway_name" {
  description = "Name of the Internet Gateway"
}