#Base de connaissances

## Etape 3

###Apache2
La commade _curl_ permet de transférer des données depuis un protocole, tel que HTTP ou FTP, ici on l'utilise pour télécharger une page web depuis le serveur http local, _apache_ pour vérifier si celui ci fonctionne bien.
La syntaxe est la suivante :
>if [ "$(curl -s http://127.0.0.1/ping_me)" = "michonne" ]; then echo OK; else echo KO; fi

Cette syntaxe télécharge la page _ping\_me_ situé dans le dossier local de _apache_ avec en option le mode silencieux, on utilise _if_ pour vérifier si la page contient le texte "michonne", si celle ci ne contiens rien ou autre chose c'est qu'il y a un problème avec le serveur loca http _apache_.  
Cette ligne permet donc de tester le fonctionnement du serveur _apache_

###MySQL

La commade suivante permet de tester le fonctionnement du serveur mysql
> echo "show databases;" | mysql -u root --password=glenn

Dans un premier temps cette commande va se connecter à _MySQL_ en tant que root avec le mot de passe donnée en paramètres, puis affichera les bases de données présentes sur le serveur _MySQL_.  
Si la commande ne routrne rien ou une erreur c'est que le serveur _MySQl_ a été mal configuré ou n'est pas installé en fonction de l'erreur.

###phpMyAdmin

Pour pouvoir vérifier si _phpMyAdmin_ est fonctionnel il faut se connecter à l'aide d'un navigateur web à l'adresse suivante :
> http//[Adresse IP du serveur]/phpmyadmin

Si la page qui s'affiche est vierge alors le paquet n'a pas été installé ou est mal installé, si celle ci demande un login alors phpMyAdmin est opérationnel.

###Nom des utilisateurs apache et MySQL

Pour pouvoir récupérer les nom des utilisateurs dans les fichier de configurations _/etc/apache2/envvars_ et _/etc/mysql/my.cnf_ on utlisera la commande suivante :
>cat /etc/apache2/envvars | grep USER | cut -d = -f2  
>et  
>cat /etc/mysql/my.cnf | grep -E ^user | cut -d ' ' -f2

Les commandes _grep_ et _cut_ permettent de rechercher la ligne qui contient l'information recherchée et ensuite de séparer de cette ligne toutes les informations non essentielles :  
Syntaxe de la commande cut :  
>cut -d [caractère délimiteur] -f [numéro de champs]

### UID des utilisateurs apache et MySQL

On utilisera la commande suivante pour afficher les processus en cours avec leur UID en premier champs :
> ps -ef

La commance _grep_ va permettre de rechercher les processus _apache_ et _MySQL_ parmis les autres.  
La commande sed va nous permettre avec les bons arguements de séparer les processus lancé par l'utilisateur :
> sed "/$USER/d"

Cet argument permet de supprimer le contenu de la variable _$USER_
Et la commande _uniq_ permet d'éliminer tout les lignes en doubles qui peuvent apparaitre comme c'est le cas pour le processus apache.

##Etape 4
Pour installer un paquet sans confirmation on utilisera l'argument _-y_  
La commande qui permet de répondre aux questions d'installation pour le mot de passe root de _MySQL_ et la configuration de _phpMyAdmin_ est la suivante :
>echo "[nom du paquet] [question] [type de la question] [réponse à la question]" | debconf-set-selections

On peut avoir les questions et leur types grâce à la commande suivante :
> debconf-get-selections [nom du paquet]

On pourra par la suite mettre en forme pour le script les commandes _debconf-set-selections_ pour automatiser l'installation

##Etape 5

On utilisera la commande suivante pour créer des utilisateurs :
>useradd [nom] -u [UID]

Changment de l'utilisateur apache 2 dans _/etc/apache2/envvars_ : 
dans la ligne APACHE\_RUN\_USER remplacer _www-data_ par carl même chose pour APACHE\_RUN\_GROUP  
Pour mysql à la ligne _user = mysql_ remplacer mysql par beth

Il faut aussi modifier les droits sur le dossier _/var/lock/apache2_ recursivement pour donner les droits à carl, pareil pour les dossiers _/var/lib/mysql_ et _/var/run/mysqld_ pour beth avec les commandes _chown_ et _chgrp_

##Etape 6

Pour pouvoir modifier un fichier dans un script on utilisera la commande suivante :
>sed -i 's/[chaine à remplacer]/[chaine de remplacment]/' [nom du fichier]

Cette commande cherche les lignes ou ce trouvent la chaine à remplacer (on peut utiliser les regexp) et remplace les chaines trouvées par la chaine de remplacment.  
Grâce à cette commande on va pouvoir changer l'utilisateur dans les fichiers de configurations dans le script.

## Etape 7

Pour réaliser un script qui, à partir de l'état inconnu de l'image va installer tout ce qu'il faut et changer les utilisateurs il faut faire des tests grâce au script de vérification d'installation de l'étape 3, si un ou plusieurs paquets sont manquants alors on lancera leur installation avec nos paramètres grâce au script de l'étape 4.
Pour la suite si les paquets sont déja installés mais que les utilisateurs ne sont pas ce que l'on désire, on ira récupérer leur nom grâce au script de l'étape 3 puis on les modifiera et on donnera les bons droits grâce au script de l'étape 6.