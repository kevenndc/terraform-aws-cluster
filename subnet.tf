resource "aws_subnet" "subnet_default" {
  vpc_id      = aws_vpc.vpc_default.id
  cidr_block  = "10.0.1.0/24"

  tags = {
    Name = "subrede-default"
  }
}