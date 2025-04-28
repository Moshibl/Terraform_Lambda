resource "aws_subnet" "subnets" {
  vpc_id                  = aws_vpc.MyVPC.id
  for_each                = { for subnet in var.subnet-list : subnet.name => subnet }
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = each.value.type == "public" ? true : false
  tags = {
    Name = each.value.name
  }
}

resource "aws_db_subnet_group" "db_subnets" {
  name       = "db_subnets"
  subnet_ids = [aws_subnet.subnets["private_subnet1"].id, aws_subnet.subnets["private_subnet2"].id]
  tags = {
    Name = "RDS-Subnets"
  }
}