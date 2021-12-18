locals {
  aws_region            = "us-east-1"
  system                = "gateway"
  env                   = "dev"
  cidr_vpc              = "10.255.0.0/16"
  cidr_public_subnet    = "10.255.1.0/24"
  az                    = "a"
  ami                   = "ami-083654bd07b5da81d"
  instance_type         = "t2.micro"
  key_name              = "id_aws"
  user_data             = "../../init/aws_ubuntu_amd64_init.sh"
  volume_size           = 8
  instance_profile_name = "cert_profile"
}