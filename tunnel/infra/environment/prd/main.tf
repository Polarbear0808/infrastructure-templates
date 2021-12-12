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
  cidr_blocks_local  = var.cidr_blocks_local
  cidr_vpc           = var.cidr_vpc
  cidr_public_subnet = var.cidr_public_subnet
  az1                = "${var.aws_region}${var.az1}"
  ami                = var.ami
  instance_type      = var.instance_type
  key_name           = var.key_name
  user_data          = var.user_data
  volume_size        = var.volume_size
}

locals {
  route53_records = [
    {
      name    = "${var.www_host_name}.${var.zone_name}"
      type    = "A"
      ttl     = "300"
      records = [module.chisel-server.eip_public]
    }
  ]
}

module "route53-records" {
  source          = "../../module/route53"
  system          = var.system
  env             = var.env
  zone_name       = var.zone_name
  route53_records = local.route53_records
}