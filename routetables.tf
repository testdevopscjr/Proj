#publicroute
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }



  tags = {
    Name = "pub-route"
  }
}

#privateroute
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }



  tags = {
    Name = "private-route"
  }
}

#routetable association
resource "aws_route_table_association" "public" {
  count=length(aws_subnet.public[*].id)
  subnet_id      =element(aws_subnet.public[*].id,count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count=length(aws_subnet.Private[*].id)
  subnet_id      =element(aws_subnet.Private[*].id,count.index)
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "data" {
  count=length(aws_subnet.data[*].id)
  subnet_id      =element(aws_subnet.data[*].id,count.index)
  route_table_id = aws_route_table.private.id
}