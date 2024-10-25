#!/bin/bash

apt-get update
apt-get install -y apache2 
apt-get install -y php php-fpm php-curl libapache2-mod-php php-cli php-mysql php-gd
#https://www.liquidweb.com/blog/install-adminer-mysql-ubuntu/
mkdir /var/www/html/adminer
wget https://www.adminer.org/latest.php -O /var/www/html/adminer/index.php --no-check-certificate
chown -R  www-data:www-data /var/www/html/adminer/
chmod -R 775 /var/www/html/adminer/
systemctl restart apache2
