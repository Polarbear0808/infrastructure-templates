terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "chisel-server" {
  source             = "../../module/ec2"
  system             = var.system
  env                = var.env
  cidr_vpc           = var.cidr_vpc
  cidr_public_subnet = var.cidr_public_subnet
  az1                = "${var.aws_region}${var.az1}"
  ami                = var.ami
  instance_type      = var.instance_type
  key_name           = var.key_name
  user_data          = var.user_data
  volume_size        = var.volume_size
}
