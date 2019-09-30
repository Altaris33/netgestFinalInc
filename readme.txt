Application Web:

Front Démarré avec Vue JS
Il est capable d'avoir une page d'accueil, une page de liste des clients qui offre une liste de matériels par client.
Il est capable de créér un client.

Evolution: l'Application devra être capable de gérer les suppressions et modifications de clients et de matériel.
L'application devra permettre aux clients de déclarer des incidents.

Un système d'administration à apporter (superAdmin), (admin), les admins étant les directeurs ou présidents d'entreprises.
Ils seront représentés par un identifiant unique.

Il tourne sur le port 8083 pour éviter d'entrer en conflit avec le port 8080 de Tomcat.
Le fichier package.json declare une commande automatisée à lancer afin d'exécuter l'application sur le port 8083: 
serve-local.
Cette commande peut être adaptée en fonction de l'environnement de développement.

URL à lancer: ajouter #/ après le localhost8083 afin de suivre la convention de Vue JS, et enfin voir le fichier router.js 
pour lancer des URLs. (Cf capture d'écran vue url # à noter.png)


Application API:

Créé et refaite avec Spring Boot et Spring Data pour éviter le code SQL. 
Le framework permet de séparer les rôles des couches plus aisément.
Il effectue le CRUD sauf pour l'Update qui sera apporté lors de la prochaine évolution.

L'API tourne sur le port Tomcat 8080. L'adresse de base à valoriser est /clients.


Application Android:
L'application Android est capable d'afficher les pages Client et Matériel en communiquant avec le fichier JSON.

Evolution à venir: Communiquer avec l'API pour effectuer des transactions. Communiquer par API avec le FRONT WEB 
et gérer les cas d'utilisations demandés.

Couche Données:

La table Incident a été écrite mais pas encore ajoutée.

Joints: 
Le schéma pré-fourni de la BDD sans la table Incident, qui se trouve dans le script.

Le schéma UML du diagramme de séquence.

Les requêtes utilisées via Curl et Postman.

Capture d'écrans des processus d'installations et manipulations techniques.