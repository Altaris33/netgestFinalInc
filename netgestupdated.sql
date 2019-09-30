-- Suppression de la BDD pour retravailler les noms de 
-- colonnes en snale_case pour SPRING Data
drop database if exists netgest;

CREATE DATABASE netgest;
USE netgest;


CREATE TABLE ville(
    id INT NOT NULL PRIMARY KEY auto_increment,
    code_postal CHAR(5) NOT NULL,
    ville VARCHAR(100) NOT NULL
)Engine=InnoDB;

INSERT INTO ville(id, code_postal, ville)
VALUES
    (1, '33600', 'PESSAC'),
    (2, '33700', 'MERIGNAC'),
    (3, '33000', 'BORDEAUX'),
    (4, '06100', 'NICE'),
    (5, '64510', 'PAU'),
    (6, '33115', 'PYLA / MER'),
    (7, '47210', 'SAINT CIER / GIRONDE'),
    (8, '69001', 'LYON CEDEX 1'),
    (9, '84110', 'VAISON LA ROMAINE'),
    (10, '17154', 'LA ROCHELLE'),
    (11, '84140', 'AVIGNON'),
    (12, '84100', 'ORANGE'),
    (13, '13104', 'ARLES'),
    (14, '67100', 'STRASBOURG'),
    (15, '51515', 'PORTOWN'),
    (16, '16161', 'MUTECITY'),
    (17, '99999', 'KOKIRI FOREST');

CREATE TABLE client(
    id INT NOT NULL PRIMARY KEY auto_increment,
    nom VARCHAR(50) NOT NULL,
    adresse1 VARCHAR(250) DEFAULT NULL,
    adresse2 VARCHAR(250) DEFAULT NULL,
    id_cp_ville INT DEFAULT NULL,
    CONSTRAINT FK_CLI_VILLE FOREIGN KEY (id_cp_ville) REFERENCES ville(id)
)Engine=InnoDB;

INSERT INTO client(id, nom, adresse1, adresse2, id_cp_ville)
VALUES (1, 'AVALONE', '152 Avenue Jean-Jaurès', null, 1),
       (2, 'CGI', null, null, null),
       (3, 'EPSI', null, null, null),
       (4, 'CAP GEMINI', null, null, null),
       (5, 'EDF', null, null, null),
       (6, 'ORANGE', null, null, null),
       (7, 'SFR', null, null, null);

CREATE TABLE fonction(
    id INT NOT NULL PRIMARY KEY auto_increment,
    libelle VARCHAR(50) NOT NULL
)Engine=InnoDB;

INSERT INTO fonction(id, libelle) 
VALUES (1, 'Gérant'),
       (2, 'Directeur'),
       (3, 'Technicien'),
       (4, 'Commercial'),
       (5, 'Intervenant'),
       (6, 'Consultant');

CREATE TABLE personne(
    id INT NOT NULL PRIMARY KEY auto_increment,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    telephone VARCHAR(14) DEFAULT NULL,
    email VARCHAR(100) NOT NULL
)Engine=InnoDB;

INSERT INTO personne(id, nom, prenom, telephone, email)
VALUES (1, 'GILLET', 'Michel', '06.03.45.71.18', 'michel@avalone-fr.com'),
       (2, 'SOUMAILLES', 'Lucas', null, 'lucas33@cgi-group.com'),
       (3, 'LEMONNIER', 'Marius', null, 'marius.lemonnier@campus-cd.com'),
       (4, 'CHESNEAU', 'Sébastien', null, 'sebkeyoc@cap-gemini.fr'),
       (5, 'GONZALES', 'Benjamin', null, 'benapparte@edf-for-fun.fr');

CREATE TABLE appartient(
    id INT NOT NULL PRIMARY KEY auto_increment,
    id_personne INT NOT NULL,
    id_fonction INT NOT NULL,
    id_client INT NOT NULL,
    CONSTRAINT FK_APP_CLI FOREIGN KEY (id_client) REFERENCES client(id),
    CONSTRAINT FK_APP_FCT FOREIGN KEY (id_fonction) REFERENCES fonction(id),
    CONSTRAINT FK_APP_PRS FOREIGN KEY (id_personne) REFERENCES personne(id)
)Engine=InnoDB;

INSERT INTO appartient(id_personne, id_fonction, id_client)
VALUES (1, 1, 1),
       (2, 3, 2),
       (3, 3, 2),
       (4, 4, 4),
       (5, 6, 6),
       (1, 5, 2);

CREATE TABLE type_materiel(
    id INT NOT NULL PRIMARY KEY auto_increment,
    libelle VARCHAR(50) NOT NULL
)Engine=InnoDB;

INSERT INTO type_materiel(id, libelle)
VALUES (1, 'Imprimante'),
       (2, 'Switch'),
       (3, 'Routeur'),
       (4, 'Serveur'),
       (5, 'Ordinateur');


CREATE TABLE materiel(
    id INT NOT NULL PRIMARY KEY auto_increment,
    libelle VARCHAR(100) NOT NULL,
    id_client INT NOT NULL,
    id_type INT NOT NULL,
    CONSTRAINT FK_MAT_CLI FOREIGN KEY (id_client) REFERENCES client(id),
    CONSTRAINT FK_MAT_TYPE FOREIGN KEY (id_type) REFERENCES type_materiel(id)
)Engine=InnoDB;

INSERT INTO materiel(id, libelle, id_client, id_type)
VALUES (1, 'Dell 1520', 1, 1),
       (2, 'NETGEAR DS1008', 1, 2),
       (3, 'NETGEAR DS1005', 1, 2),
       (4, 'TP-LINK GS108', 1, 3),
       (5, 'PASSERELLE LINUX', 1, 4),
       (6, 'DEV NICOLAS', 1, 4);

CREATE TABLE type_if(
    id INT NOT NULL PRIMARY KEY auto_increment,
    libelle VARCHAR(10) NOT NULL
)Engine=InnoDB;

INSERT INTO type_if(id, libelle)
VALUES (1, 'LAN'),
       (2, 'WAN'),
       (3, 'BLUETOOTH'),
       (4, 'WLAN');

CREATE TABLE type_affectation(
    id INT NOT NULL PRIMARY KEY auto_increment,
    libelle VARCHAR(10) NOT NULL
)Engine=InnoDB;

INSERT INTO type_affectation(id, libelle)
VALUES (1, 'DHCP'),
       (2, 'STATIC');

CREATE TABLE interface(
    id INT NOT NULL PRIMARY KEY auto_increment,
    nom VARCHAR(10) NOT NULL,
    mac VARCHAR(14) DEFAULT '00:00:00:00:00',
    id_type INT NOT NULL,
    id_materiel INT NOT NULL,
    CONSTRAINT FK_TYPEIF FOREIGN KEY (id_type) REFERENCES type_if(id),
    CONSTRAINT FK_IFMATOS FOREIGN KEY (id_materiel) REFERENCES materiel(id)
)Engine=InnoDB;

INSERT INTO interface(id, nom, mac, id_type, id_materiel)
VALUES (1, 'eth0', '01:02:02:02:02', 1, 5),
       (2, 'eth1', '01:02:02:02:03', 1, 5),
       (3, 'wl0', '18:1F:01:01:01', 4, 4),
       (4, 'eth0', '18:1F:01:01:02', 2, 4),
       (5, 'eth0', 'E6:1F:01:01:01', 1, 3),
       (6, 'eth1', 'E6:1F:01:01:02', 1, 3),
       (7, 'eth2', 'E6:1F:01:01:03', 1, 3),
       (8, 'eth3', 'E6:1F:01:01:04', 1, 3);

CREATE TABLE adresse_ip(
    id INT NOT NULL PRIMARY KEY auto_increment,
    ipV4 VARCHAR(15) NOT NULL,
    ipV6 VARCHAR(100) DEFAULT NULL,
    masque VARCHAR(15) NOT NULL DEFAULT '255.255.255.0',
    id_interface INT NOT NULL,
    id_type_aff INT NOT NULL,
    CONSTRAINT FK_AD_IF FOREIGN KEY (id_interface) REFERENCES interface(id),
    CONSTRAINT FK_AD_TYPAF FOREIGN KEY (id_type_aff) REFERENCES type_affectation(id)
)Engine=InnoDB;

INSERT INTO adresse_ip(id, ipV4, ipV6, masque, id_interface, id_type_aff)
VALUES (1, '192.168.254.250', null, '255.255.255.0', 1, 1),
       (2, '17.10.0.1', null, '255.255.255.240', 2, 1),
       (3, '192.168.251.254', null, '255.255.255.0', 3, 1),
       (4, '192.168.254.251', null, '255.255.255.240', 4, 1),
       (5, '192.168.254.10', null, '255.255.255.0', 5, 2),
       (6, '192.168.254.11', null, '255.255.255.0', 6, 2),
       (7, '192.168.254.12', null, '255.255.255.0', 7, 2),
       (8, '192.168.254.13', null, '255.255.255.0', 8, 2);
       
-- ajout table incident pour permettre aux techs et adm de signaler des incidents      
create table incident(
	id int not null primary key auto_increment;
	libelle varchar(32) not null;
	date_envoi datetime not null;
    constraint FK_INCI foreign key (id_client) references client(id),
)Engine=InnoDB;  

insert into incident(id, libelle, date_envoi, id_client)
values (1, "Panne Serveur Client", 20190608, 2)