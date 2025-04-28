resource "aws_subnet" "subnets" {
  vpc_id                  = aws_vpc.MyVPC.id
  for_each                = { for subnet in var.subnets : subnet.name => subnet }
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = each.value.type == "public" ? true : false
  tags = {
    Name = each.value.name
  }
}
