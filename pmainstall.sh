#!/bin/bash

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
