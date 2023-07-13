output "nginx1_id" {
  value = aws_instance.nginx1.id
}

output "nginx2_id" {
  value = aws_instance.nginx2.id
}

output "apache1_id" {
  value = aws_instance.apache1.id
}

output "apache2_id" {
  value = aws_instance.apache2.id
}

output "apache1_ip" {
  value = aws_instance.apache1.private_ip
}

output "apache2_ip" {
  value = aws_instance.apache2.private_ip
}