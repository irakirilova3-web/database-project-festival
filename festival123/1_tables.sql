-- Snowboxx festival (Avoriaz) BD - Création des tableaux

CREATE TABLE Type_Billet (
    id_type_billet NUMBER(5) PRIMARY KEY,
    libelle_type_billet VARCHAR2(30) NOT NULL,
    prix NUMBER(10,2) NOT NULL,
    duree_validite NUMBER(10) NOT NULL,
    heure_debut TIMESTAMP DEFAULT TO_TIMESTAMP('12:00:00', 'HH24:MI:SS'),
    heure_fin TIMESTAMP DEFAULT TO_TIMESTAMP('23:59:59', 'HH24:MI:SS'),
    condition_acces VARCHAR2(60)
);

CREATE TABLE Scene (
    id_scene NUMBER(5) PRIMARY KEY,
    nom_scene VARCHAR2(50),
    capacite NUMBER(10)
);

CREATE TABLE Bracelet (
    id_bracelet NUMBER(15) PRIMARY KEY,
    numero_rfid VARCHAR2(50) UNIQUE NOT NULL,
    statut VARCHAR2(15) DEFAULT 'inactif'
);

CREATE TABLE Bracelet_Status_Audit (
    audit_id NUMBER(10) PRIMARY KEY,
    id_bracelet NUMBER(15),
    anc_statut VARCHAR2(15),
    nv_statut VARCHAR2(15),
    changer_datetime TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE TABLE Spectateur (
    id_spectateur NUMBER(15) PRIMARY KEY,
    nom VARCHAR2(30),
    prenom VARCHAR2(30),
    age NUMBER(3)
);

CREATE TABLE Billet (
    id_billet NUMBER(15) PRIMARY KEY,
    id_type_billet NUMBER(5) NOT NULL REFERENCES Type_Billet(id_type_billet),
    date_debut DATE,
    id_bracelet NUMBER(15) NOT NULL REFERENCES Bracelet(id_bracelet),
    id_spectateur NUMBER(15) NOT NULL REFERENCES Spectateur(id_spectateur)
);

CREATE TABLE Concert (
    id_concert NUMBER(10) PRIMARY KEY,
    nom_artiste VARCHAR2(50),
    genre VARCHAR2(30),
    date_concert DATE,
    heure_concert TIMESTAMP,
    id_scene NUMBER(5) NOT NULL REFERENCES Scene(id_scene)
);

CREATE TABLE Passage (
    id_passage NUMBER(15) PRIMARY KEY,
    id_billet NUMBER(15) NOT NULL REFERENCES Billet(id_billet),
    id_bracelet NUMBER(15) NOT NULL REFERENCES Bracelet(id_bracelet),
    id_scene NUMBER(5) NOT NULL REFERENCES Scene(id_scene),
    datetime_passage TIMESTAMP,
    passage_type VARCHAR2(10) DEFAULT 'entry' CHECK (passage_type IN ('entry','exit'))
);