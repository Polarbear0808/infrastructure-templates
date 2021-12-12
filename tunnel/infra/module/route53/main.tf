resource "aws_route53_zone" "zone-name" {
  lifecycle {
    create_before_destroy = false
  }
  name = var.zone_name
}

resource "aws_route53_record" "record" {
  count = length(var.route53_records)

  zone_id = aws_route53_zone.zone-name.id
  name    = var.route53_records[count.index].name
  type    = var.route53_records[count.index].type
  ttl     = var.route53_records[count.index].ttl
  records = var.route53_records[count.index].records
}