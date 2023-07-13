output "load_balancer_url" {
  value = module.alb.pub_load_balancer_url
}

output "pvt_apache1_ip" {
  value = module.instances.apache1_ip
}

output "pvt_apache2_ip" {
  value = module.instances.apache2_ip
}