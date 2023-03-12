#publicsubnet
resource "aws_subnet" "public" {
  count=length(data.aws_availability_zones.available.names)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.pub_cidr,count.index)
  map_public_ip_on_launch="true"
  availability_zone = element(data.aws_availability_zones.available.names,count.index)

  tags = {
    Name = "public-${count.index+1}-subnet"
  }
}


#PrivateSubnet
resource "aws_subnet" "Private" {
  count=length(data.aws_availability_zones.available.names)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.private_cidr,count.index)
  map_public_ip_on_launch="false"
  availability_zone = element(data.aws_availability_zones.available.names,count.index)

  tags = {
    Name = "Private-${count.index+1}-subnet"
  }
}

#datasubnet
resource "aws_subnet" "data" {
  count=length(data.aws_availability_zones.available.names)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.data_cidr,count.index)
  map_public_ip_on_launch="false"
  availability_zone = element(data.aws_availability_zones.available.names,count.index)

  tags = {
    Name = "data-${count.index+1}-subnet"
  }
}