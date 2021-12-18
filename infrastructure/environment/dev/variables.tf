variable "aws_profile" {
  description = "access profile name"
  type        = string
}
variable "cidr_blocks_local" {
  description = "access source"
  type        = list(string)
}
variable "zone_name" {
  description = "domain name"
  type        = string
}
