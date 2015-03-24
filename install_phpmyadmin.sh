#!/bin/bash

conf=$1

#vérification de l'utilisation d'arguments
if [ $# -eq 0 ]
then
	conf=install.conf
fi

#vérification de la présence du fichier spécififé
if [ ! -f ${conf} ]
then
	echo "erreur : Fichier spécifié introuvable"
	exit 1
fi 

#vérification que le fichier n'est pas un dossier
if [ -d ${conf} ]
then
        echo "erreur : le fichier spécifié est un dossier"
        exit 1
fi

#récupération des différents paramètres du fichier
mysqlp=$(cat ${conf} | grep MYSQL_PASSWD | cut -d = -f2)
pmasrv=$(cat ${conf} | grep PMA_WEBSERVER | cut -d = -f2)
pmaappusr=$(cat ${conf} | grep PMA_APP_USER | cut -d = -f2)
pmasqlmet=$(cat ${conf} | grep PMA_MYSQL_METHOD | cut -d = -f2)
pmasqladminusr=$(cat ${conf} | grep PMA_MYSQL_ADMIN_USER | cut -d = -f2)

#lancement de l'installation des paquets
apt-get update
#installation de apache2
apt-get install -y apache2
echo "fin de l'installation de apache2"

#installation de mysql
echo installation de mysql-server
echo "mysql-server mysql-server/root_password password ${mysqlp}" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password ${mysqlp}" | debconf-set-selections
apt-get install -y mysql-server
echo "fin de l'installation de mysql"

#installation de phpmyadmin
echo instllation de phpmyadmin
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect ${pmasrv}" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/method select ${pmasqlmet}"| debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-user string ${pmasqladminusr}" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password ${pmaappusr}" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password ${mysqlp}" | debconf-set-selections
echo "phpmyadmin phpmyadmin/password-confirm password ${pmaappusr}" | debconf-set-selections
echo "phpmyadmin phpmyadmin/setup-password password ${pmaappusr}" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password ${mysqlp}" | debconf-set-selections
apt-get install -y phpmyadmin
echo "Fin de l'installation de phpmyadmin"
