terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68.0"
    }
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "polar_cli"
}

module "chisel-server" {
  source             = "../../module/ec2"
  system             = "chisel-server"
  env                = "prd"
  cidr_vpc           = "10.255.0.0/16"
  cidr_public_subnet = "10.255.1.0/24"
  az1                = "ap-northeast-1a"
  ami                = "ami-036d0684fc96830ca"
  instance_type      = "t2.micro"
  key_name           = "id_aws"
}
