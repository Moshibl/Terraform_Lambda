resource "aws_instance" "Bastion" {
  ami                         = "ami-084568db4383264d4"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.PubSub1.id
  vpc_security_group_ids      = [aws_security_group.PubSG.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.PubKey.key_name
  tags = {
    Name = "Bastion"
  }
}



resource "aws_instance" "Application" {
  ami                         = "ami-084568db4383264d4"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.PrivSub1.id
  vpc_security_group_ids      = [aws_security_group.PrivSG.id]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.PubKey.key_name
  tags = {
    Name = "Application"
  }
}
