#bastionec2
resource "aws_instance" "bastion" {
  ami           = "ami-064eb0bee0c5402c5"
  instance_type = "t2.micro"
  #vpc_id=aws_vpc.vpc.id
  subnet_id = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]

  tags = {
    Name = "bastion-ec2"
  }
}

#apacheec2
resource "aws_instance" "apache" {
  ami           = "ami-064eb0bee0c5402c5"
  instance_type = "t2.micro"
  #vpc_id=aws_vpc.vpc.id
  subnet_id = aws_subnet.Private[0].id
  vpc_security_group_ids = [aws_security_group.apache-sg.id]

  tags = {
    Name = "apache-ec2"
  }
}