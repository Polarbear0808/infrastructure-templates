variable "system" {}
variable "env" {}
variable "cidr_vpc" {}
variable "cidr_public_subnet" {}
variable "az1" {}
variable "cidr_any" {
  type    = string
  default = "0.0.0.0/0"
}
variable "cidr_warabi" {
  type      = string
  default   = "0.0.0.0/0"
  sensitive = true
}