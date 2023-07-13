data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "apache1" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = var.apache1_subnet_id
  vpc_security_group_ids      = [aws_security_group.sg_apache1.id]
  associate_public_ip_address = false
  key_name = "win11-key"

/*  provisioner "remote-exec" {
    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.aws/win11-key.pem")
    host        = aws_instance.apache1.private_ip
    }
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2",
      "IP=$(hostname -I | awk '{print $1}')",
      "sudo bash -c \"echo 'Welcome to my server!' > /var/www/html/index.html\"",
      "sudo bash -c \"echo 'Instance IP: $IP' >> /var/www/html/index.html\"",
      "sudo systemctl restart apache2"
    ]
  }
  provisioner "local-exec" {
    command = "echo 'Apache1 Private IP: ${self.public_ip}' >> all-ips.txt"
  }*/

  user_data = file("./instances/apache.sh")
  tags = {
    Name        = "tf-ec2-apache1"
    Environment = "dev"
  }
}

resource "aws_instance" "apache2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = var.apache2_subnet_id
  vpc_security_group_ids      = [aws_security_group.sg_apache2.id]
  associate_public_ip_address = false
  user_data                   = file("./instances/apache.sh")
  key_name = "win11-key"


 /* provisioner "remote-exec" {
    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.aws/win11-key.pem")
    host        = aws_instance.apache2.private_ip
    }
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2",
      "IP=$(hostname -I | awk '{print $1}')",
      "sudo bash -c \"echo 'Welcome to my server!' > /var/www/html/index.html\"",
      "sudo bash -c \"echo 'Instance IP: $IP' >> /var/www/html/index.html\"",
      "sudo systemctl restart apache2"
    ]
  }
  provisioner "local-exec" {
    command = "echo 'Apache2 Private IP: ${self.public_ip}' >> all-ips.txt"
  }*/

  tags = {
    Name        = "tf-ec2-apache2"
    Environment = "dev"
  }
}

resource "aws_instance" "nginx1" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = var.nginx1_subnet_id
  vpc_security_group_ids      = [aws_security_group.sg_nginx1.id]
  associate_public_ip_address = true
#  user_data = file("./instances/nginx.sh")
  user_data = base64encode(templatefile("./instances/nginx.sh", {
        proxy_pass_url = local.proxy_pass_url
  }))
  tags = {
    Name        = "tf-ec2-nginx1"
    Environment = "dev"
  }
  }


resource "aws_instance" "nginx2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = var.nginx2_subnet_id
  vpc_security_group_ids      = [aws_security_group.sg_nginx2.id]
  associate_public_ip_address = true
#  user_data                   = file("./instances/nginx.sh")
  user_data = base64encode(templatefile("./instances/nginx.sh", {
        proxy_pass_url = local.proxy_pass_url
  }))

  tags = {
    Name        = "tf-ec2-nginx2"
    Environment = "dev"
  }
}

locals {
      proxy_pass_url = var.proxy_pass_url
    }
