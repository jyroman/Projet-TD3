#!/bin/bash

usrapa="carl"
usrmsql="beth"

useradd ${usrapa} -u 500
useradd ${usrmsql} -u 501

service apache2 stop
service mysql stop

usrsql="= ${usrsql}"
sed -i "s/www-data/${usrapa}/" /etc/apache2/envvars
sed -i "s/= mysql/${usrsql}/" /etc/mysql/my.cnf

chown -R ${usrapa} /var/lock/apache2
chown -R ${usrmsql} /var/lib/mysql
chown -R ${usrmsql} /var/run/mysqld

service apache2 start
service mysql start
