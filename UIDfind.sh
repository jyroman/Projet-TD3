#!/bin/bash

#Trouver le UID du process apache2

# recherche de apache2 dans les processus et séparation des colonnes
pida=$(ps -ef | grep apache2 | cut -d ' ' -f 1 | sed "/$USER/d" | uniq)
# test de la variable si le processus a été trouvé
if [ -z $pida ];
then
	echo "erreur le processus apache2 n'a pas été trouvé"
else 
	echo http_user_pid : $pida
fi

# recherche de mysqld dans les processus et séparation des colonnes
pidm=$(ps -ef | grep mysqld | cut -d ' ' -f 1 | sed "/$USER/d")
# test de la variable si le processus a été trouvé
if [ -z $pidm ];
then
	echo "erreur le processus mysqld n'as pas été trouvé"
else
	echo mysql_user_pid : $pidm
fi
