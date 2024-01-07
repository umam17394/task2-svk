variable "ami" {
  description = "Amazon Machine Image ID for EC2 instance"
}

variable "instance_type" {
  description = "Instance type for EC2 instance"
}

variable "key_name" {
  description = "Key pair name for EC2 instance"
}

variable "instance_name" {
  description = "Name for EC2 instance"
}

variable "security_group_name" {
  description = "Name for EC2 Security Group"
}

/*variable "subnet_id" {
  description = "ID of the subnet"
}*/