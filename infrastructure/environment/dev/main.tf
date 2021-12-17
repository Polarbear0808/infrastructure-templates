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

module "gateway-zone" {
  source     = "../../module/route53"
  system     = var.system
  env        = var.env
  zone_name  = var.zone_name
  ns_records = var.ns_records
}

module "tunnel-server" {
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

resource "aws_route53_record" "a-host" {
  name    = var.zone_name
  ttl     = 60
  type    = "A"
  zone_id = module.gateway-zone.zone_id
  records = [module.tunnel-server.eip_public]
}

resource "aws_route53_record" "a-www" {
  name    = "www.${var.zone_name}"
  ttl     = 60
  type    = "A"
  zone_id = module.gateway-zone.zone_id
  records = [module.tunnel-server.eip_public]
}

