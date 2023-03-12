#elasticip
resource "aws_eip" "EIP" {
  
  vpc      = true
    tags = {
    Name = "EIP"
  }
}

#natgw
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.EIP.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "NAT-GW"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_eip.EIP]
}