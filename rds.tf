# creating RDS instance
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.Database-subnet-1.id, aws_subnet.Database-subnet-2.id]
  tags = {
    Name = "My-db-subnet-group"
  }
}
resource "aws_db_instance" "my-rds" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.default.name
  engine                 = "mysql"
  engine_version         = "8.0.34"
  instance_class         = "db.t3.micro"
  multi_az               = "true"
  identifier             = "my-rds-db"
  username               = "Hema"
  password               = "Hema0608#"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}

