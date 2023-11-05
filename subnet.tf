resource "aws_subnet" "standard_subnet_01" {
  vpc_id                  = aws_vpc.vpc_standard.id
  cidr_block              = "10.70.10.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "standard_subnet_01"
  }
}
resource "aws_subnet" "standard_subnet_02" {
  vpc_id                  = aws_vpc.vpc_standard.id
  cidr_block              = "10.70.12.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "standard_subnet_02"
  }
}
