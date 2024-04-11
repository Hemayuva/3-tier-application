resource "aws_instance" "demo-instance" {
  ami                         = "ami-0451f2687182e0411"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "hema-key"
  security_groups             = [aws_security_group.demosg.id]
  subnet_id                   = aws_subnet.public-subnet-1.id
  associate_public_ip_address = true
  user_data                   = "data.sh"
  tags = {
    Name = " my instance 1"
  }
}
resource "aws_key_pair" "hema" {
  key_name   = "hema-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}
#creation of 2nd instance
resource "aws_instance" "demo2instance" {
  ami                         = "ami-0451f2687182e0411"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "hema-key"
  security_groups             = [aws_security_group.demosg.id]
  subnet_id                   = aws_subnet.public-subnet-2.id
  associate_public_ip_address = true
  user_data                   = "data.sh"
  tags = {
    Name = " my instance2 "
  }
}
