resource "aws_instance" "Bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ec2_type
  subnet_id                   = aws_subnet.subnets["public_subnet1"].id
  vpc_security_group_ids      = [aws_security_group.PubSG.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.PubKey.key_name
  tags = {
    Name = "Bastion"
  }
}



# resource "aws_instance" "Application" {
#   ami                         = data.aws_ami.ubuntu.id
#   instance_type               = var.ec2_type
#   subnet_id                   = aws_subnet.subnets["private_subnet1"].id
#   vpc_security_group_ids      = [aws_security_group.PrivSG.id]
#   associate_public_ip_address = false
#   key_name                    = aws_key_pair.PubKey.key_name
#   tags = {
#     Name = "Application"
#   }
# }


resource "null_resource" "runcommand" {
  provisioner "local-exec" {
    command = "echo Public IP of Bastion ${aws_instance.Bastion.public_ip}"
  }

  depends_on = [aws_instance.Bastion]
}