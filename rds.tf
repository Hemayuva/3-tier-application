# creating RDS instance
resource "aws_db_subnet_group" "default" {
name="main"
subnet_ids = [aws_subnet.database-subnet-1.id,aws_subnet.database-subnet-2.id]
tags = {
  Name = "My db subnet group"
 }
}
resource "aws_db_instance" "default" {
allocated_storage = 10
db_subnet_group_name = aws_db_subnet_group.default.id
engine= "MYSQL"
engine_version ="8.0.20"
instance_class="db.t2.micro"
multi_az=true
name= "mydb"
username="username"
password="password"
skip_final_snapshot= true
security_group_ids=[aws_security_group.database-sg.id]
