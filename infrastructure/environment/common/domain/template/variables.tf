variable "aws_region" {
  type    = string
}
variable "aws_profile" {
  type    = string
}
variable "system" {
  description = "the name of the system including the instance"
  type        = string
}
variable "env" {
  description = "what environment it is (prd, dev, ...)"
  type        = string
}
variable "zone_name" {
  description = "domain name of the zone"
  type        = string
}