#!/bin/bash

#Trouver le UID du process apache2

# recherche de apache2 dans les processus et séparation des colonnes
pida=$(ps -ef | grep apache2 | cut -d ' ' -f 1 | sed "/$USER/d" | uniq)
echo http_user_pid : $pida

# recherche de mysqld dans les processus et séparation des colonnes
pidm=$(ps -ef | grep mysqld | cut -d ' ' -f 1 | sed "/$USER/d")
echo mysql_user_pid : $pidm
