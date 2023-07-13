resource "aws_route_table" "route_table_nginx" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  tags = {
    Name = "rt-nginx"
    Environment = "dev"
  }
}

resource "aws_route_table" "route-table-apache" {
  vpc_id = var.vpc_id
  tags = {
    Name = "rt-apache"
    Environment = "dev"
  }
}

resource "aws_route_table_association" "nginx1-rt-association" {
  subnet_id      = var.nginx1_subnet_id
  route_table_id = aws_route_table.route_table_nginx.id
}

resource "aws_route_table_association" "nginx2-rt-association" {
  subnet_id      = var.nginx2_subnet_id
  route_table_id = aws_route_table.route_table_nginx.id
}

resource "aws_route_table_association" "apache1-rt-association" {
  subnet_id      = var.apache1_subnet_id
  route_table_id = aws_route_table.route-table-apache.id
}

resource "aws_route_table_association" "apache2-rt-association" {
  subnet_id      = var.apache2_subnet_id
  route_table_id = aws_route_table.route-table-apache.id
}