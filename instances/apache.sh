#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2

IP=$(hostname -I | awk '{print $1}')

sudo bash -c "echo 'Welcome to my server!' > /var/www/html/index.html"
sudo bash -c "echo 'Instance IP: $IP' >> /var/www/html/index.html"

sudo systemctl restart apache2