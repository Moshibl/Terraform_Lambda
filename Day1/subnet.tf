resource "aws_subnet" "PubSub1" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PubSub1"
  }
}

resource "aws_subnet" "PubSub2" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "PubSub2"
  }
}

resource "aws_subnet" "PrivSub1" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "PrivSub1"
  }
}

resource "aws_subnet" "PrivSub2" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "PrivSub2"
  }
}