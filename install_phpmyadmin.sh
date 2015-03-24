#!/bin/bash

#installation de apache2
apt-get update
apt-get install -y apache2
echo "fin de l'installation de apache2"

#installation de mysql
echo installation de mysql-server
echo "mysql-server mysql-server/root_password password glenn" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password glenn" | debconf-set-selections
apt-get updates
apt-get install -y mysql-server
echo "fin de l'installation de mysql"

#installation de phpmyadmin
echo instllation de phpmyadmin
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/method select "unix socket""| debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-user string root" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password maggie" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password glenn" | debconf-set-selections
echo "phpmyadmin phpmyadmin/password-confirm password maggie" | debconf-set-selections
echo "phpmyadmin phpmyadmin/setup-password password maggie" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password glenn" | debconf-set-selections
apt-get update
apt-get install -y phpmyadmin
echo "Fin de l'installation de phpmyadmin"
