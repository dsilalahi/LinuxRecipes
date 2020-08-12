#!/bin/bash

sudo yum update
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<p>hello from terraform</p>" | sudo tee /var/www/html/index.html