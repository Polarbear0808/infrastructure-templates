data "aws_route53_zone" "zone" {
  name = var.zone_name
}

data "aws_iam_instance_profile" "cert-profile" {
  name = local.instance_profile_name
}