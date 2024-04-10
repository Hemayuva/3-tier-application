# Creating internet gateway 
    resource "aws_internet_gateway" "demogateway" {
    vpc_id= aws_vpc.my_vpc.id
tags = {
  Name = " My igw "
  }
}
