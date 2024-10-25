#!/bin/bash

apt-get update
apt-get install -y mysql-server
mysql -e "CREATE USER 'webAdmin'@'%' IDENTIFIED BY 'password';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'webAdmin'@'%' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"
# Modifica il file di configurazione per permettere connessioni da altre macchine
sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql
