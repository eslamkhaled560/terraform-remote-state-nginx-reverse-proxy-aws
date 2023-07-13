resource "aws_subnet" "subnet_apache1" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name        = "tf-subnet-apache1"
    Environment = "dev"
  }
}

resource "aws_subnet" "subnet_apache2" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name        = "tf-subnet-apache2"
    Environment = "dev"
  }
}

resource "aws_subnet" "subnet_nginx1" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name        = "tf-subnet-nginx1"
    Environment = "dev"
  }
}

resource "aws_subnet" "subnet_nginx2" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name        = "tf-subnet-nginx1"
    Environment = "dev"
  }
}
