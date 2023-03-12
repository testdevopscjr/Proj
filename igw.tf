resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "IGW"
  }
  depends_on = [
    aws_vpc.vpc
  ]
}