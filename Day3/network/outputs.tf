output "subnets" {
  value = aws_subnet.subnets
}

output "pub_sg" {
  value = aws_security_group.PubSG
}

output "priv_sg" {
  value = aws_security_group.PrivSG
}