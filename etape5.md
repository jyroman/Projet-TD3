#notes pour étape 5

Changment de l'utilisateur apache 2 dans _/etc/apache2/envvars_ : 
dans la ligne APACHE_RUN_USER remplacer _www-data_ par carl meme chose pour APACHE_RUN_GROUP 

Il faut aussi modifier les droits sur le dossier _/var/lock/apache2_ recursivement pour donner les droits à carl avec la commande _chown_ et _chgrp_
