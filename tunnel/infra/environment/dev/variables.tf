variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "aws_profile" {
  type    = string
  default = "polar_cli"
}
variable "system" {
  type    = string
  default = "chisel-server"
}
variable "env" {
  type    = string
  default = "dev"
}
variable "cidr_vpc" {
  type    = string
  default = "10.255.0.0/16"
}
variable "cidr_public_subnet" {
  type    = string
  default = "10.255.1.0/24"
}
variable "az1" {
  type    = string
  default = "a"
}
variable "ami" {
  type    = string
  default = "ami-083654bd07b5da81d" # ubuntu20.04
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  type    = string
  default = "id_aws"
}
variable "user_data" {
  type    = string
  default = "../../../server/init/aws_ubuntu_init.sh"
}
variable "volume_size" {
  type    = number
  default = 8
}
