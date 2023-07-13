output "sg_alb_pub_id" {
  value = aws_lb.alb_nginx.id
}

output "pvt_load_balancer_url" {
  value = aws_lb.alb_apache.dns_name
}

output "pub_load_balancer_url" {
  value = aws_lb.alb_nginx.dns_name
}