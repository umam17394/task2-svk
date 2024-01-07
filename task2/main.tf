# main.tf
provider "aws" {
  region = "us-east-1"
  access_key = "AKIA2MRLZ6YAUM2CM7XK"
  secret_key = "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"
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = "my-vpc"
  vpc_cidr_block = ["10.0.0.0/16"]
  subnet_cidr_blocks  = ["10.0.1.0/24"]
  availability_zones  = ["us-east-1a"]
  route_table_name    = "my-route-table"
  internet_gateway_name = "my-igw"
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
  key_name      = "project"
  security_group_name = "my-security-group"
  instance_name = "my-instance"
}


