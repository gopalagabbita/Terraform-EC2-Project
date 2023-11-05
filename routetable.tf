resource "aws_route_table" "vpc_standard_rt" {
  vpc_id = aws_vpc.vpc_standard.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.standard01.id
  }
  tags = {
    "Name" = "vpc_standard-rt"
  }
}
resource "aws_route_table_association" "standard1" {
  subnet_id      = aws_subnet.standard_subnet_01.id
  route_table_id = aws_route_table.vpc_standard_rt.id
}
resource "aws_route_table_association" "Public2" {
  subnet_id      = aws_subnet.standard_subnet_02.id
  route_table_id = aws_route_table.vpc_standard_rt.id

}
