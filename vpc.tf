resource "aws_vpc" "vpc_standard" {
  cidr_block           = "10.70.0.0/16"
  enable_dns_hostnames = true
  tags = {
    "Name" = "vpc_standard"
  }
}
resource "aws_internet_gateway" "standard01" {
  vpc_id = aws_vpc.vpc_standard.id
  tags = {
    "Name" = "vpc_standard_standard1"
  }
}
