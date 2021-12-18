terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68.0"
    }
  }
}

provider "aws" {
  region  = local.aws_region
  profile = var.aws_profile
}

# resource "aws_iam_role" "certbot-role" {
#   name = "test_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#       {
#         Action = [
#           "route53:ListHostedZones",
#           "route53:GetChange"
#         ],
#         Effect = "Allow",
#         Resource = [
#           "*"
#         ]
#       },
#       {
#         Action = [
#           "route53:ChangeResourceRecordSets"
#         ],
#         Effect = "Allow",
#         Resource = [
#           "arn:aws:route53:::hostedzone/${data.aws_route53_zone.zone.zone_id}"
#         ]
#       }
#     ]
#   })

#   tags = {
#     Name = "${local.system}-${local.env}-role"
#   }
# }

module "tunnel-server" {
  source               = "../../module/ec2"
  system               = local.system
  env                  = local.env
  cidr_blocks_local    = var.cidr_blocks_local
  cidr_vpc             = local.cidr_vpc
  cidr_public_subnet   = local.cidr_public_subnet
  az1                  = "${local.aws_region}${local.az}"
  ami                  = local.ami
  instance_type        = local.instance_type
  key_name             = local.key_name
  user_data            = local.user_data
  iam_instance_profile_name = data.aws_iam_instance_profile.cert-profile.name
  volume_size          = local.volume_size
}

resource "aws_route53_record" "a-host" {
  name    = var.zone_name
  ttl     = 60
  type    = "A"
  zone_id = data.aws_route53_zone.zone.zone_id
  records = [module.tunnel-server.eip_public]
}

resource "aws_route53_record" "a-www" {
  name    = "www.${var.zone_name}"
  ttl     = 60
  type    = "A"
  zone_id = data.aws_route53_zone.zone.zone_id
  records = [module.tunnel-server.eip_public]
}

