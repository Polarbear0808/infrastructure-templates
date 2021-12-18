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

resource "aws_route53_zone" "zone" {
  lifecycle {
    prevent_destroy = true
  }
  name = var.zone_name
  tags = {
    Name = "${var.system}-${var.env}-zone"
  }
}