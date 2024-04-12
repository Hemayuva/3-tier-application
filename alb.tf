resource "aws_lb" "my elb" {
name = "my elb"
internal = flase
load_balancer_type = "application"
security_groups=[aws_security_group.demosg.id]
subnet_id = aws_subnet.public-subnet-1.id , aws_subnet.public-subnet-2.id
}
resource "aws_lb_target_group" "target-elb" {
name = "ALB TG"
port= 80
protocol ="HTTP"
vpc_id= aws_vpc.my_vpc.id
}
# creation of target group
resource "aws_lb_target_group_attachment" "attachment" {
target_group_arn=aws_lb_target_group.my elb.arn
target_id= aws_instance.demo-instance.id
port=80
depends-on = [
 aws_instance.demo-instance
]
}
resource "aws_lb_target_group_attachment" "attachment1" {
target_group_arn=aws_lb_target_group.my elb.arn
target_id = aws_instance.demo2instance.id
port=80
depends-on = [
 aws_instance.demo2instance
]
}
resource "aws_lb_listener" "my elb" {
load_balancer_arn=aws_lb.my elb.arn
port=80
protocol = "http"
default_action {
type = "forward"
target_group_arn= aws_lb_target_group.my elb.arn
}
}
