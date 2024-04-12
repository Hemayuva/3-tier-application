resource "aws_lb" "my-elb" {
  name               = "my-elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demosg.id]
  subnets = [
    aws_subnet.public-subnet-1.id,
    aws_subnet.public-subnet-2.id
  ]
}
resource "aws_lb_target_group" "mytg" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
}
# creation of target group
resource "aws_lb_target_group_attachment" "attachment" {
   count            = length(aws_instance.terra1instance)
  target_group_arn = aws_lb_target_group.mytg.arn
  target_id        = aws_instance.terra1instance[count.index].id
  port             = 80
  depends_on = [aws_instance.terra1instance]

}
resource "aws_lb_target_group_attachment" "attachment1" {
  count            = length(aws_instance.terra2instance)
  target_group_arn = aws_lb_target_group.mytg.arn
  target_id        = aws_instance.terra2instance[count.index].id
  port             = 80
  depends_on = [aws_instance.terra2instance]

}
resource "aws_lb_listener" "my-elb" {
  load_balancer_arn = aws_lb.my-elb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mytg.arn
  }
}
