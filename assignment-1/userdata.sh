#!/bin/bash

# Update system
apt update -y
apt upgrade -y

# Install Apache
apt install -y apache2

# Install PHP
apt install -y php php-mysql libapache2-mod-php

# Install MariaDB
apt install -y mariadb-server mariadb-client

# Enable services
systemctl enable apache2
systemctl start apache2
systemctl enable mariadb
systemctl start mariadb

# Secure MariaDB (basic setup)
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'wppassword';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Install WordPress
cd /var/www/html
rm -rf *

wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* .
rm -rf wordpress latest.tar.gz

# Set permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Restart Apache
systemctl restart apache2
