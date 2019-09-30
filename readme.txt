Application Web:

Front D�marr� avec Vue JS
Il est capable d'avoir une page d'accueil, une page de liste des clients qui offre une liste de mat�riels par client.
Il est capable de cr��r un client.

Evolution: l'Application devra �tre capable de g�rer les suppressions et modifications de clients et de mat�riel.
L'application devra permettre aux clients de d�clarer des incidents.

Un syst�me d'administration � apporter (superAdmin), (admin), les admins �tant les directeurs ou pr�sidents d'entreprises.
Ils seront repr�sent�s par un identifiant unique.

Il tourne sur le port 8083 pour �viter d'entrer en conflit avec le port 8080 de Tomcat.
Le fichier package.json declare une commande automatis�e � lancer afin d'ex�cuter l'application sur le port 8083: 
serve-local.
Cette commande peut �tre adapt�e en fonction de l'environnement de d�veloppement.

URL � lancer: ajouter #/ apr�s le localhost8083 afin de suivre la convention de Vue JS, et enfin voir le fichier router.js 
pour lancer des URLs. (Cf capture d'�cran vue url # � noter.png)


Application API:

Cr�� et refaite avec Spring Boot et Spring Data pour �viter le code SQL. 
Le framework permet de s�parer les r�les des couches plus ais�ment.
Il effectue le CRUD sauf pour l'Update qui sera apport� lors de la prochaine �volution.

L'API tourne sur le port Tomcat 8080. L'adresse de base � valoriser est /clients.


Application Android:
L'application Android est capable d'afficher les pages Client et Mat�riel en communiquant avec le fichier JSON.

Evolution � venir: Communiquer avec l'API pour effectuer des transactions. Communiquer par API avec le FRONT WEB 
et g�rer les cas d'utilisations demand�s.

Couche Donn�es:

La table Incident a �t� �crite mais pas encore ajout�e.

Joints: 
Le sch�ma pr�-fourni de la BDD sans la table Incident, qui se trouve dans le script.

Le sch�ma UML du diagramme de s�quence.

Les requ�tes utilis�es via Curl et Postman.

Capture d'�crans des processus d'installations et manipulations techniques.