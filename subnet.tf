resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = "us-east-1b"
}
