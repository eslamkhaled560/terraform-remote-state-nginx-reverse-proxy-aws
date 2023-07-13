resource "aws_lb_listener" "listener_alb_nginx" {
  load_balancer_arn = aws_lb.alb_nginx.arn
  port              = "80"
  protocol          = "HTTP"
/*  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-Res-2021-06"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"*/

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_nginx.arn
  }
}

/* aws acm get-certificate --region us-east-1 --profile dev --certificate-arn arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4 */

resource "aws_lb_listener" "listener_alb_apache" {
  load_balancer_arn = aws_lb.alb_apache.arn
  port              = "80"
  protocol          = "HTTP"
/*  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-Res-2021-06"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"*/

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_apache.arn
  }
}

/*
resource "aws_acm_certificate" "my-certificate" {
  domain_name       = "alb-listener.com"
  validation_method = "DNS"

  tags = {
    Name = "alb-listener.com SSL certificate"
  }
}

resource "aws_lb_listener_certificate" "apache-certificate" {
  listener_arn = aws_lb_listener.listener_alb_apache.arn
  certificate_arn = aws_acm_certificate.my-certificate.arn
}

resource "aws_lb_listener_certificate" "nginx-certificate" {
  listener_arn = aws_lb_listener.listener_alb_nginx.arn
  certificate_arn = aws_acm_certificate.my-certificate.arn
}
*/

