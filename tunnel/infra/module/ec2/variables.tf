variable "system" {}
variable "env" {}
variable "cidr_vpc" {}
variable "cidr_public_subnet" {}
variable "az1" {
  type = string
}
variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "user_data" {
  type    = string
  default = "../../init/nop.sh"
}
variable "volume_size" {
  type = number
}
