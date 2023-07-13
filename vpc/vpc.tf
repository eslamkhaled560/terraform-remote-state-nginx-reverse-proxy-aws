resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = "tf-vpc"
    Environment = "dev"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "tf-igw"
    Environment = "dev"
  }
}