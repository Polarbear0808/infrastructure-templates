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

resource "aws_iam_role" "cert-role" {
  name               = "cert_role"
  assume_role_policy = file("./policy/assume_role.json")
}

resource "aws_iam_role_policy" "cert-policy" {
  name   = "cert_policy"
  role   = aws_iam_role.cert-role.id
  policy = file("./policy/certbot_route53_policy.json")
}

resource "aws_iam_instance_profile" "cert-profile" {
  name = "cert_profile"
  role = aws_iam_role.cert-role.name
}