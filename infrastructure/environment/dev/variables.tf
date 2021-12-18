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
  default = "tunnel-server"
}
variable "env" {
  type    = string
  default = "dev"
}
variable "cidr_blocks_local" {
  type    = list(string)
  default = ["0.0.0.0/0"]
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
  default = "../../init/aws_ubuntu_amd64_init.sh"
}
variable "volume_size" {
  type    = number
  default = 8
}

# route53
variable "zone_name" {
  description = "ゾーンのドメイン名"
  type        = string
}
# variable "ns_records" {
#   description = "NSレコードに設定するDNS一覧"
#   type        = list(string)
#   default     = []
# }
# variable "www_host_name" {
#   description = "ゾーン内のwebサーバのホスト名"
#   type        = string
#   default     = "www"
# }