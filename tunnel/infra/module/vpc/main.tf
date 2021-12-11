data "aws_availability_zones" "available" {
  state = "available"
}

# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_vpc
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.system}-${var.env}-vpc"
  }
}

# Subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr_public_subnet
  availability_zone = var.az1
  tags = {
    Name = "${var.system}-${var.env}-public-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.system}-${var.env}-igw"
  }
}

# Route table and association
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = var.cidr_any
  }
  tags = {
    Name = "${var.system}-${var.env}-public-rt"
  }
}
resource "aws_route_table_association" "public" {
  count          = length(var.cidr_public_subnet)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

# Security Group and Rules
resource "aws_security_group" "main-sg" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.system}-${var.env}-sg"
  }
}
resource "aws_security_group_rule" "main-sg-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["${var.cidr_any}"]
  security_group_id = aws_security_group.main-sg.id
}
resource "aws_security_group_rule" "main-sg-ingress-warabi-ssh" {
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"
  cidr_blocks = [
    "${var.cidr_warabi}"
  ]
  security_group_id = aws_security_group.main-sg.id
}
resource "aws_security_group_rule" "main-sg-ingress-http" {
  type      = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"
  cidr_blocks = [
    "${var.cidr_warabi}"
  ]
  security_group_id = aws_security_group.main-sg.id
}
resource "aws_security_group_rule" "main-sg-ingress-https" {
  type      = "ingress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"
  cidr_blocks = [
    "${var.cidr_warabi}"
  ]
  security_group_id = aws_security_group.main-sg.id
}

