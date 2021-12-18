variable "system" {
  description = "the name of the system including the instance"
  type        = string
}
variable "env" {
  description = "what environment it is (prd, dev, ...)"
  type        = string
}
variable "cidr_blocks_local" {
  type = list(string)
}
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
variable "iam_instance_profile_name" {
  description = "attached IAM role name for the instance"
  type        = string
}