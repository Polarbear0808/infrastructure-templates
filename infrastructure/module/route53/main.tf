resource "aws_route53_zone" "zone" {
  lifecycle {
    create_before_destroy = false
  }
  name = var.zone_name
  tags = {
    Name = "${var.system}-${var.env}-zone"
  }
}

locals {
  ns_records = (length(var.ns_records) > 0 ?
    var.ns_records :
    [
      aws_route53_zone.zone.name_servers[0],
      aws_route53_zone.zone.name_servers[1],
      aws_route53_zone.zone.name_servers[2],
      aws_route53_zone.zone.name_servers[3],
    ]
  )
}

resource "aws_route53_record" "ns" {
  allow_overwrite = true
  name            = var.zone_name
  ttl             = 60
  type            = "NS"
  zone_id         = aws_route53_zone.zone.zone_id
  records         = local.ns_records
}
resource "aws_route53_record" "soa" {
  allow_overwrite = true
  name            = var.zone_name
  ttl             = 60
  type            = "SOA"
  zone_id         = aws_route53_zone.zone.zone_id
  records = [format("%s. %s. %d %d %d %d %d",
    local.ns_records[0],
    "awsdns-hostmaster.amazon.com",
    1,
    30 * 60,
    5 * 60,
    7 * 24 * 60 * 60,
    24 * 60 * 60
  )]
}
