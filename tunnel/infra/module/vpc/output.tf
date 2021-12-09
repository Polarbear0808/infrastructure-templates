output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "main_sg_id" {
  value = aws_security_group.main-sg.id
}