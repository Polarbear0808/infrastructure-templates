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

variable "ns_records" {
  description = "NSレコードに設定するDNS一覧"
  type        = list(string)
  default     = []
}