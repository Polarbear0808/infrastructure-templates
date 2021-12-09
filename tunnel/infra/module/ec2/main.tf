module "network" {
  source             = "../vpc"
  system             = var.system
  env                = var.env
  cidr_vpc           = var.cidr_vpc
  cidr_public_subnet = var.cidr_public_subnet
  az1                = var.az1
}

resource "aws_key_pair" "aws" {
  key_name   = var.key_name
  public_key = file("~/.ssh/${var.key_name}.pub")
}

resource "aws_instance" "ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.aws.key_name
  subnet_id                   = module.network.public_subnet_id
  vpc_security_group_ids      = [module.network.main_sg_id]
  associate_public_ip_address = "true"
  tags = {
    Name = "${var.system}-${var.env}-ec2"
  }
}