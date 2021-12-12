variable "system" {
  description = "the name of the system including the instance"
  type        = string
}
variable "env" {
  description = "what environment it is (prd, dev, ...)"
  type        = string
}

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