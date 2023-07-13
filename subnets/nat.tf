resource "aws_eip" "nat_eip" {
  vpc        = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.nginx1_subnet_id
  tags = {
    Name = "tf-nat"
    Environment = "dev"
  }
}

resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.route-table-apache.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}