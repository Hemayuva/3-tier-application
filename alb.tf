# creating External Load balancer
resource "aws_lb" "LB_elb" {
  name               = "External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demosg.id]
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}
resource "aws_lb_target_group" "tg-elb" {
  name     = "ALB-TG1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
}
resource "aws_lb_target_group_attachment" "attachment" {
  count            = length(aws_instance.terra1instance)
  target_group_arn = aws_lb_target_group.tg-elb.arn
  target_id        = aws_instance.terra1instance[count.index].id
  port             = 80
  depends_on       = [aws_instance.terra1instance]
}
resource "aws_lb_target_group_attachment" "attachment1" {
  count            = length(aws_instance.terra2instance)
  target_group_arn = aws_lb_target_group.tg-elb.arn
  target_id        = aws_instance.terra2instance[count.index].id
  port             = 80
  depends_on       = [aws_instance.terra2instance]
}
resource "aws_lb_listener" "LB_elb" {
 load_balancer_arn = aws_lb.LB_elb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-elb.arn
  }
}
