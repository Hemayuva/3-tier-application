# creating 1st web subnet 
 resource "aws_subnet" "public-subnet-1" {
 vpc_id = "${aws_vpc.myvpc.id}
 cidr_block = "${var.subnet_cidr}"
 map_public_ip_on_launch = true
 availability zone = "ap-south-1a"
 tags = {
   Name = "web subnet1"
   }
 }  
 
# creating 2nd web subnet 
 resource "aws_subnet" "public-subnet-2" {
 vpc_id = "${aws_vpc.myvpc.id}
 cidr_block = "${var.subnet1_cidr}"
 map_public_ip_on_launch = true
 availability zone = "ap-south-1b"
 tags = {
   Name = "web subnet2"
   }
 }  
# creating 1st application subnet 
 resource "aws_subnet" "application-subnet-1" {
 vpc_id = "${aws_vpc.myvpc.id}
 cidr_block = "${var.subnet2_cidr}"
 map_public_ip_on_launch = false
 availability zone = "ap-south-1a"
 tags = {
   Name = "Application subnet1"
   }
 }  
 # creating 2nd Application subnet 
 resource "aws_subnet" "application-subnet-2" {
 vpc_id = "${aws_vpc.myvpc.id}
 cidr_block = "${var.subnet3_cidr}"
 map_public_ip_on_launch = true
 availability zone = "ap-south-1b"
 tags = {
   Name = "Application subnet2"
   }
 }  

# creating Database private subnet
resource "aws_subnet" "Database-subnet-1"
vpc_id = aws_vpc.myvpc.id
cidr_block =var.subnet4_cidr
 availability zone = "ap-south-1a"
 tags = {
   Name = " database subnet1"
   }
 }  
 
# creating Database private subnet
resource "aws_subnet" "Database-subnet-2"
vpc_id = aws_vpc.myvpc.id
cidr_block =var.subnet5_cidr
 availability zone = "ap-south-1a"
 tags = {
   Name = " database subnet2"
   }
 }  

 
