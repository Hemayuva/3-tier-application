# creating Route table 
resource "aws_route_table" "route" {
vpc_id = aws_vpc.my_vpc.id
route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.My igw.id
  }
tags = {
  Name = " Route to internet "
  }
}

# Associated Route table
resource "aws_route_table_association" "rt1" {
subnet_id = aws_subnet.public_subnet_1
route_table_id = aws_route_table.route.id
}
# associating Route table
resource "aws_route_table_association" "rt2" {
subnet_id = aws_subnet.public_subnet_2
route_table_id = aws_route_table.route.id
}
