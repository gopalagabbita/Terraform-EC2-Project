resource "aws_security_group" "vpc_standard-sg" {
  vpc_id      = aws_vpc.vpc_standard.id
  name        = "vpc_standard-sg"
  description = "Allow inbound and outbound rules"
  tags = {
    "Name" = "vpc_standard-sg"
  }
  ingress {
    description = "allow inbound rules"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "allow outbound rules"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
