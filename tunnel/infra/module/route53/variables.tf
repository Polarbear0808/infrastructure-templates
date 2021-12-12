variable "zone_name" {
  description = "ゾーンのドメイン名"
  type        = string
}

variable "route53_records" {
  description = "route53のレコード一覧"
  type = list(object({
    name    = string
    type    = string
    ttl     = string
    records = list(string)
  }))
  default = null
}