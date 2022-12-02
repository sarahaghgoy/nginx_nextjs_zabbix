#!/bin/bash
#Database password request
echo -e "\nPlease Enter Database Password"
read PASS

#Installing zabbix
apt-get update -y
apt-get install wget -y
wget https://repo.zabbix.com/zabbix/6.2/debian/pool/main/z/zabbix-release/zabbix-release_6.2-4%2Bdebian11_all.deb
dpkg -i zabbix-release_6.2-4+debian11_all.deb
apt update -y
apt install zabbix-server-mysql zabbix-frontend-php zabbix-nginx-conf zabbix-sql-scripts zabbix-agent -y

#Install mariadb-server
apt-get install mariadb-server -y
echo -e "$PASS\nY\nY\n$PASS\n$PASS\nY\nY\nY\nY" | mysql_secure_installation


#Intial Zabbix database user
mysql -u root -p$PASS -Bse "create database zabbix character set utf8mb4 collate utf8mb4_bin;"
mysql -u root -p$PASS -Bse "create user zabbix@localhost identified by '$PASS';"
mysql -u root -p$PASS -Bse "grant all privileges on zabbix.* to zabbix@localhost;"
mysql -u root -p$PASS -Bse "set global log_bin_trust_function_creators = 1;"
 


#Installing tables for Zabbix database
zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix -p$PASS


#Config nginx
cp nginx.conf  /etc/nginx/nginx.conf
cp default /etc/nginx/sites-available/default
rm /etc/nginx/sites-enabled/*
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
rm /etc/nginx/conf.d/zabbix.conf

#Restart Services
systemctl restart zabbix-server zabbix-agent nginx php7.4-fpm
systemctl enable zabbix-server zabbix-agent nginx php7.4-fpm
rm zabbix-release_6.2-4+debian11_all.deb 
