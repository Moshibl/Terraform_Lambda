resource "aws_route_table" "PubRT" {
  vpc_id = aws_vpc.MyVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.MyIGW.id
  }

  tags = {
    Name = "PubRT"
  }
}

resource "aws_route_table_association" "PubAssoc1" {
  subnet_id      = aws_subnet.PubSub1.id
  route_table_id = aws_route_table.PubRT.id
}
resource "aws_route_table_association" "PubAssoc2" {
  subnet_id      = aws_subnet.PubSub2.id
  route_table_id = aws_route_table.PubRT.id
}

resource "aws_route_table" "PrivRT" {
  vpc_id = aws_vpc.MyVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NatGW.id
  }

  tags = {
    Name = "PrivRT"
  }
}

resource "aws_route_table_association" "PrivAssoc1" {
  subnet_id      = aws_subnet.PrivSub1.id
  route_table_id = aws_route_table.PrivRT.id
}
resource "aws_route_table_association" "PrivAssoc2" {
  subnet_id      = aws_subnet.PrivSub2.id
  route_table_id = aws_route_table.PrivRT.id
}
