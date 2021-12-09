terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "polar_cli"
}

# module "network" {
#   source   = "../../module/vpc"
#   system   = "test"
#   env      = "dev"
#   cidr_vpc = "10.255.0.0/16"
#   cidr_public_subnet = [
#     "10.255.1.0/24"
#   ]
#   az1 = "us-east-1a"
# }

module "chisel-server" {
  source             = "../../module/ec2"
  system             = "chisel-server"
  env                = "dev"
  cidr_vpc           = "10.255.0.0/16"
  cidr_public_subnet = "10.255.1.0/24"
  az1                = "us-east-1a"
  ami                = "ami-083654bd07b5da81d"
  instance_type      = "t2.micro"
  key_name           = "id_aws"
}
