resource "aws_lb" "alb_nginx" {
  name               = "tf-alb-pub"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_alb_pub.id]
  subnets            = var.subnets_pub

  tags = {
    Name        = "alb-public"
    Environment = "dev"
  }
}

resource "aws_lb" "alb_apache" {
  name               = "tf-alb-pvt"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_alb_pvt.id]
  subnets            = var.subnets_pvt

  tags = {
    Name        = "alb-private"
    Environment = "dev"
  }
}
