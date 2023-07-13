#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

load_balancer_url="http://${proxy_pass_url}"

config_content="user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        # multi_accept on;
}

http {
    server {
        listen 80;
        location / {
            proxy_pass $load_balancer_url;
        }
    }
}"

config_file="/etc/nginx/nginx.conf"

echo "$config_content" | sudo tee "$config_file"

sudo service nginx restart
