#!/bin/bash

#Vérification de la présence du fichier de configuration d'apache2
if [ -f /etc/apache2/envvars ]
then
#Dans le fichier de configuration d'apache trouver le user et le séparer
	userhttp=$(cat /etc/apache2/envvars | grep USER | cut -d ' ' -f2 | cut -d = -f2 )
	echo "http_user_conf : "$userhttp
else
#erreur le fichier n'existe pas
	echo "/!\ Attention /!\ le fichier de configuration d'apache n'a pas été trouvé, verifiez votre installation apache2"
fi

#vérification de la présence du fichier de configuration de mysql
if [ -f /etc/mysql/my.cnf ]
then
#Dans le fichier de configuration de mysql trouver le user et le séparer 
	usermysql=$(cat /etc/mysql/my.cnf | grep -E ^user | cut -d ' ' -f2 )
	echo "mysql_user_conf : "$usermysql
else
#erreur le fichier n'existe pas
	echo "/!\ Attention /!\ le fichier de configuration de mysql n'a pas été trouvé, verifiez votre installation mysql-server"
fi
