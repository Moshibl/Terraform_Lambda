resource "aws_internet_gateway" "MyIGW" {
  vpc_id = aws_vpc.MyVPC.id

  tags = {
    Name = "MyIGW"
  }
}

resource "aws_eip" "NatEIP" {
  domain = "vpc"
  tags = {
    Name = "NatEIP"
  }
}

resource "aws_nat_gateway" "NatGW" {
  subnet_id     = aws_subnet.subnets["public_subnet1"].id
  allocation_id = aws_eip.NatEIP.id

  tags = {
    Name = "NatGW"
  }

  depends_on = [aws_internet_gateway.MyIGW]
}
