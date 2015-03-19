#!/bin/bash

echo installation de mysql-server
echo "mysql-server mysql-server/root_password password glenn" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password glenn" | debconf-set-selections
apt-get updates
apt-get install -y mysql-server
echo "fin de l'installation de mysql"
