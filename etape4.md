#Fiche d'intervention Etape 4

Execution du script : ./install\_phpmyadmin.sh <nom du fichier de configuration\>, penser à verifier que le script est autorisé en execution. **(chmod +x install_phpmyadmin.sh)**

Le fichier de configuration doit etre spécifié en argument pour l'éxecution du script ou sinon le fichier du nom de *install.conf* sera utilisé.

Le fichier de configuration dois posséder la syntaxe suivante pour un bon fonctionnement du script :
>  MYSQL\_PASSWD=<votre mot de passe root mysql\>  
>  PMA\_WEBSERVER=<serveur web à configurer\>  
>  PMA\_APP\_USER=<nom d'utilisateur de phpmyadmin\>  
>  PMA\_MYSQL\_METHOD=<methode d'accès au mysql\>  
>  PMA\_MYSQL\_ADMIN\_USER=<nom de l'administrateur de mysql\>

