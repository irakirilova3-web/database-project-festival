# database-project-festival
This is one of my projects made for my Databases course

Choix de la base de données et technologies 
Pour ce projet, j’ai choisi Oracle Database (PL/SQL) comme système de gestion de base 
de données relationnelle. Ce choix repose à la fois sur des aspects techniques et 
fonctionnels essentiels au projet, ainsi que sur certaines contraintes liées à mon 
environnement de travail. Mon ordinateur personnel ne permet pas d’utiliser PostgreSQL 
de manière optimale, certaines extensions Visual Studio Code posent aussi des problèmes 
et des conflits de ports rendent l’installation et l’utilisation difficiles. De plus, Oracle offre 
des fonctionnalités puissantes pour la gestion de bases complexes, ainsi que des 
compilateurs en ligne ce qui en fait un choix pertinent.
1. Gestion robuste des types de données et contraintes 
Oracle offre des types adaptés à nos besoins (NUMBER, VARCHAR2, TIMESTAMP) 
et permet la définition de contraintes complexes directement au niveau de la base 
(PRIMARY KEY, FOREIGN KEY, UNIQUE, DEFAULT, NOT NULL). Cela garantit 
l’intégrité et la cohérence des données pour les entités clés telles que les billets, 
concerts, passages et bracelets.
2. Automatisation via les triggers
L’utilisation des triggers Oracle permet de coder certaines règles métier 
directement dans la base. Ces triggers assurent une cohérence des données sans 
nécessiter de vérifications manuelles côté application. 
3. Gestion des identifiants avec les séquences
Les séquences Oracle permettent de générer automatiquement des identifiants 
uniques pour certaines tables, qui facilite la gestion des clés primaires et évite les 
doublons. 
4. Requêtes SQL avancées
Oracle offre une syntaxe puissante pour la manipulation de dates et la 
récupération de données précises (TO_DATE, TO_TIMESTAMP, FETCH FIRST 
ROWS ONLY). Cela permet de réaliser efficacement les besoins fonctionnels du 
projet.
Oracle est également reconnu pour sa robustesse et sa capacité à gérer des bases de 
données complexes, avec de nombreuses relations et contraintes. Pour un projet simulant 
un festival avec plusieurs entités interconnectées, il assure fiabilité, performance et 
sécurité des données.
4 de 7
Analyse des données et normalisation
Dans un premier temps, j’ai utilisé le fichier SQL fourni dans le cadre du projet “Gestion 
de festival” comme point de départ. Ce fichier contient une première version des tables, 
mais leur structure ne respectait pas totalement les principes de normalisation (3NF). En 
effet, certaines informations étaient regroupées dans une même table, certaines 
contraintes n'étaient pas définies, et aucune clé étrangère ne permettait de garantir 
l’intégrité référentielle entre les entités. J’ai donc entrepris une restructuration complète 
du modèle de données pour simplifier les tests et la compréhension du modèle. Je mets 
plus de détails dans les parties suivantes qui décrivent les tables, les requêtes et les 
triggers.
Tables
La base de données du festival Snowboxx a été conçue pour modéliser de manière 
cohérente les différentes entités. Elle se compose des tables Type_Billet, Scene, Bracelet, 
Bracelet_Status_Audit, Spectateur, Billet, Concert et Passage. Chaque table respecte les 
principes de normalisation relationnelle afin de minimiser la redondance et garantir 
l’intégrité des données.
- Type_Billet - contient les informations sur les différents types de billets 
disponibles. Chaque billet possède un identifiant unique (id_type_billet), un libellé, 
un prix, une durée de validité, un horaire de début et de fin, ainsi qu’une condition 
d’accès spécifique. 
- Scene - modélise les scènes du festival avec un identifiant unique (id_scene), un 
nom et une capacité d’accueil. 
- Bracelet - chaque spectateur reçoit un bracelet RFID unique (numero_rfid) pour 
contrôler l’accès. Le statut du bracelet peut être actif, inactif ou autre, avec un état 
par défaut inactif. 
- Spectateur - se compose des informations personnelles des festivaliers : 
identifiant (id_spectateur), nom, prénom et âge. 
- Billet - représente l’achat d’un billet par un spectateur pour un festival précis. 
Chaque billet est lié à un type de billet, un bracelet et un spectateur. La date de 
début peut être renseignée ou calculée automatiquement par un trigger si elle est 
vide. 
- Concert - englobe les informations des concerts : identifiant (id_concert), artiste, 
genre musical, date et heure, ainsi que la scène associée. 
- Passage - enregistre chaque passage d’un spectateur dans une scène via son 
bracelet et billet. La table contient le type de passage (entry par défaut) et l’heure 
exacte du passage (datetime_passage).
5 de 7
La table Bracelet_Status_Audit a été créée pour permettre le suivi des changements de 
statut des bracelets RFID utilisés au festival Snowboxx. Chaque bracelet peut avoir 
différents statuts tels qu'actif, inactif ou suspendu temporairement. Bien qu’aucun trigger 
ne soit actuellement mis en place pour automatiser l’enregistrement de ces changements, 
la table est conçue pour accueillir ces informations si un besoin de traçabilité venait à se 
présenter. Cette anticipation reflète la réalité des événements. Par exemple un bracelet 
peut être perdu, désactivé ou réactivé, et garder une historique de ces modifications peut 
être utile pour la sécurité et la gestion du festival.
Tables d’alimentation 
Les tables d’alimentation contiennent les instructions d’insertion des données initiales 
dans la base. Elles permettent l’insertion des types de billets avec leurs caractéristiques 
(prix, durée, horaires, conditions d’accès), l’ajout des scènes et concerts programmés 
pour le festival, la création des bracelets et l’enregistrement des spectateurs et la 
génération des billets et passages associés. Ces tables garantissent que la base contient 
des données réalistes dès la mise en place, qui permettent de tester les règles métiers, les 
triggers et les requêtes d’analyse. Elles respectent la normalisation en séparant les entités 
pour éviter la duplication de données et en utilisant des clés étrangères pour maintenir 
les relations (par exemple entre Billet, Spectateur, et Bracelet). Chaque table possède
d’entre 6 et 11 entités pour le moment.
Requêtes
Les scripts de requêtes servent à exploiter les données pour générer des informations 
utiles à la gestion du festival comme :
• Nombre de billets vendus par type
• Concert le plus fréquenté ou scène la moins fréquentée
• Concerts programmés sur une scène donnée
• Statistiques sur les passages par scène et par jour
• Identification des concerts vus ou non vus par un spectateur spécifique
• Calcul du chiffre d’affaires total et mensuel, etc.
Ou autrement dit les 14 requêtes obligatoires de la fiche du projet. Ces requêtes illustrent 
l’usage de fonctionnalités avancées d’Oracle, telles que JOIN, GROUP BY, FETCH FIRST 
ROWS ONLY, TO_DATE, et TO_TIMESTAMP, et permettent de vérifier la cohérence des 
données et la pertinence des règles métier implémentées par les triggers.
Triggers
Pour garantir la cohérence et la sécurité des données dans la base, plusieurs triggers ont 
été créés. 

- Date par défaut pour un billet (trg_Avant_Inserer_Billet_DateDefault) attribue 
automatiquement la date du jour à un billet si aucune date n’est renseignée lors 
de l’insertion. Cela évite les billets sans date et simplifie la gestion des passages.
- Interdiction aux mineurs (trg_Interdire_Billet_Mineur) empêche l’insertion d’un 
billet pour un spectateur de moins de 18 ans. Il garantit que seuls les adultes 
peuvent acheter un billet pour le festival, en conformité avec la réglementation de 
l’événement.
- Vérification des horaires de passage (trg_Verif_Heures_Passage) vérifie que 
l’heure correspond à celle autorisée par le type de billet, avant d’enregistrer un 
passage dans une scène. Il assure que les spectateurs ne peuvent pas accéder aux 
concerts en dehors de leur créneau. 
- Prévention des conflits de concert (trg_Conflit_Concert_Scene) exclut la possibilité
de la programmation de deux concerts trop proches sur la même scène (moins 
d’une heure d’écart). Il garantit une organisation fluide et évite les 
chevauchements d’événements. 
- Mise à jour automatique de la date de début du billet 
(trg_Met_DateDebut_Du_Premier_Passage) garantit qu’après le premier passage 
d’un spectateur, si la date de début du billet n’était pas renseignée, elle serait mise 
à jour automatiquement avec la date du passage. 
- Génération automatique de l’identifiant des types de billets (trg_type_billet_id) 
assigne un identifiant unique à chaque nouveau type de billet, en utilisant une 
séquence. Cela assure l’unicité et simplifie l’insertion de nouveaux types de billets. 
Ces triggers contribuent à la robustesse de la base de données et à l’automatisation 
de certaines règles métier, tout en garantissant l’intégrité des informations liées 
aux billets, aux passages et à la programmation des concerts.
