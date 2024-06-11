output "vpc-id" {
  value = aws_vpc.main.id
}

output "vpc-cidr-block" {
  value = aws_vpc.main.cidr_block
}

output "public-subnet-id" {
  value = aws_subnet.public.id
}

output "public2-subnet-id" {
  value = aws_subnet.public2.id
}



output "private-subnet-id" {
  value = aws_subnet.private.id
}
