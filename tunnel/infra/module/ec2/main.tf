module "network" {
  source             = "../vpc"
  system             = var.system
  env                = var.env
  cidr_blocks_local  = var.cidr_blocks_local
  cidr_vpc           = var.cidr_vpc
  cidr_public_subnet = var.cidr_public_subnet
  az1                = var.az1
}

resource "aws_key_pair" "aws" {
  key_name   = var.key_name
  public_key = file("~/.ssh/${var.key_name}.pub")
}

# network interface
resource "aws_network_interface" "eni" {
  subnet_id = module.network.public_subnet_id
  security_groups = [
    module.network.main_sg_id
  ]
}

# Elastic IP
resource "aws_eip" "eip" {
  instance = aws_instance.ec2.id
  vpc      = true
  tags = {
    Name = "${var.system}-${var.env}-eip"
  }
}

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.aws.key_name
  user_data     = file(var.user_data)
  network_interface {
    network_interface_id = aws_network_interface.eni.id
    device_index         = 0
  }
  root_block_device {
    delete_on_termination = true
    volume_size           = var.volume_size
    tags = {
      Name = "${var.system}-${var.env}-root-ebs"
    }
  }
  tags = {
    Name = "${var.system}-${var.env}-ec2"
  }
}

