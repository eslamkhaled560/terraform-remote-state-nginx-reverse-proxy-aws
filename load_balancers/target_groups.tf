resource "aws_lb_target_group" "tg_nginx" {
  name     = "tf-pub-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  tags = {
    Name = "tf-tg-pub"
    Environment = "dev"
  }
}

resource "aws_lb_target_group" "tg_apache" {
  name     = "tf-pvt-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  tags = {
    Name = "tf-tg-pvt"
    Environment = "dev"
  }
}

resource "aws_lb_target_group_attachment" "tg_attach_nginx1" {
  target_group_arn = aws_lb_target_group.tg_nginx.arn
  target_id        = var.nginx1_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg_attach_nginx2" {
  target_group_arn = aws_lb_target_group.tg_nginx.arn
  target_id        = var.nginx2_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg_attach_apache1" {
  target_group_arn = aws_lb_target_group.tg_apache.arn
  target_id        = var.apache1_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg_attach_apache2" {
  target_group_arn = aws_lb_target_group.tg_apache.arn
  target_id        = var.apache2_id
  port             = 80
}