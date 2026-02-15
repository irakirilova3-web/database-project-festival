-- Snowboxx Festival (Avoriaz) BD - Alimentation des tableaux

-- Type_Billet
INSERT ALL
  INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite, heure_debut, heure_fin, condition_acces) VALUES (101, 'Ticket & Accommodation', 425, 6, TO_TIMESTAMP('12:00:00','HH24:MI:SS'), TO_TIMESTAMP('23:00:00','HH24:MI:SS'), 'regular accommodation for 3 and 6 people de 18+')
  INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite, heure_debut, heure_fin, condition_acces) VALUES (102, 'Ticket & Accommodation', 440, 6, TO_TIMESTAMP('12:00:00','HH24:MI:SS'), TO_TIMESTAMP('23:00:00','HH24:MI:SS'), 'regular accommodation for 5 people de 18+')
  INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite, heure_debut, heure_fin, condition_acces) VALUES (103, 'Ticket & Accommodation', 475, 6, TO_TIMESTAMP('12:00:00','HH24:MI:SS'), TO_TIMESTAMP('23:00:00','HH24:MI:SS'), 'luxe accommodation for 5 people de 18+')
  INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite, heure_debut, heure_fin, condition_acces) VALUES (104, 'Ticket & Accommodation', 490, 6, TO_TIMESTAMP('12:00:00','HH24:MI:SS'), TO_TIMESTAMP('23:00:00','HH24:MI:SS'), 'luxe accommodation for 5 people de 18+')
  INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite, heure_debut, heure_fin, condition_acces) VALUES (105, 'Ticket & Accommodation', 510, 6, TO_TIMESTAMP('12:00:00','HH24:MI:SS'), TO_TIMESTAMP('23:00:00','HH24:MI:SS'), 'luxe accommodation for 4 people de 18+')
  INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite, heure_debut, heure_fin, condition_acces) VALUES (106, 'Ticket & Accommodation', 815, 6, TO_TIMESTAMP('12:00:00','HH24:MI:SS'), TO_TIMESTAMP('23:00:00','HH24:MI:SS'), 'super luxe accommodation for 5 people de 18+')
  INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite, heure_debut, heure_fin, condition_acces) VALUES (107, 'Ticket & Accommodation', 855, 6, TO_TIMESTAMP('12:00:00','HH24:MI:SS'), TO_TIMESTAMP('23:00:00','HH24:MI:SS'), 'super luxe accommodation for 6 people de 18+')
  INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite, heure_debut, heure_fin, condition_acces) VALUES (108, 'Ticket & Accommodation', 935, 6, TO_TIMESTAMP('12:00:00','HH24:MI:SS'), TO_TIMESTAMP('23:00:00','HH24:MI:SS'), 'super luxe accommodation for 4 people de 18+')
  INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite, heure_debut, heure_fin, condition_acces) VALUES (109, 'Ticket & Accommodation', 875, 6, TO_TIMESTAMP('12:00:00','HH24:MI:SS'), TO_TIMESTAMP('23:00:00','HH24:MI:SS'), 'châlet accommodation for 12 people de 18+')
  INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite, heure_debut, heure_fin, condition_acces) VALUES (110, 'Ticket & Accommodation', 950, 6, TO_TIMESTAMP('12:00:00','HH24:MI:SS'), TO_TIMESTAMP('23:00:00','HH24:MI:SS'), 'châlet accommodation for 10 people de 18+')
  INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite, heure_debut, heure_fin, condition_acces) VALUES (111, 'Ticket & Accommodation', 1125, 6, TO_TIMESTAMP('12:00:00','HH24:MI:SS'), TO_TIMESTAMP('23:00:00','HH24:MI:SS'), 'châlet accommodation for 11 people de 18+')
  INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite, heure_debut, heure_fin, condition_acces) VALUES (112, 'Ticket & Lift Pass', 379, 6, TO_TIMESTAMP('12:00:00','HH24:MI:SS'), TO_TIMESTAMP('23:00:00','HH24:MI:SS'), '18+')
SELECT * FROM DUAL;

-- Scene
INSERT ALL
  INTO Scene (id_scene, nom_scene, capacite) VALUES (201,'Main Stage', 5000)
  INTO Scene (id_scene, nom_scene, capacite) VALUES (202,'APRÉS AT FOLIE DOUCE', 3000)
  INTO Scene (id_scene, nom_scene, capacite) VALUES (203,'THE BOXX', 1500)
  INTO Scene (id_scene, nom_scene, capacite) VALUES (204,'STAG', 2500)
  INTO Scene (id_scene, nom_scene, capacite) VALUES (205,'DOWNTOWN', 1000)
  INTO Scene (id_scene, nom_scene, capacite) VALUES (206,'SECRET SETS', 500)
SELECT * FROM DUAL;

-- Bracelet
INSERT ALL
  INTO Bracelet (id_bracelet, numero_rfid, statut) VALUES (30000001, 'RFID_A001', 'actif')
  INTO Bracelet (id_bracelet, numero_rfid, statut) VALUES (30000002, 'RFID_A002', 'actif')
  INTO Bracelet (id_bracelet, numero_rfid, statut) VALUES (30000003, 'RFID_A003', 'actif')
  INTO Bracelet (id_bracelet, numero_rfid, statut) VALUES (30000004, 'RFID_A004', 'actif')
  INTO Bracelet (id_bracelet, numero_rfid, statut) VALUES (30000005, 'RFID_A005', 'actif')
  INTO Bracelet (id_bracelet, numero_rfid, statut) VALUES (30000006, 'RFID_A006', 'actif')
  INTO Bracelet (id_bracelet, numero_rfid, statut) VALUES (30000007, 'RFID_A007', 'actif')
  INTO Bracelet (id_bracelet, numero_rfid, statut) VALUES (30000008, 'RFID_A008', 'actif')
  INTO Bracelet (id_bracelet, numero_rfid, statut) VALUES (30000009, 'RFID_A009', 'actif')
  INTO Bracelet (id_bracelet, numero_rfid, statut) VALUES (30000010, 'RFID_A010', 'actif')
SELECT * FROM DUAL;

-- Spectateur
INSERT ALL
  INTO Spectateur (id_spectateur, nom, prenom, age) VALUES (1,'Dupont', 'Claire', 28)
  INTO Spectateur (id_spectateur, nom, prenom, age) VALUES (2,'Martin', 'Lucas', 33)
  INTO Spectateur (id_spectateur, nom, prenom, age) VALUES (3,'Nguyen', 'Sophie', 22)
  INTO Spectateur (id_spectateur, nom, prenom, age) VALUES (4,'Rossi', 'Marco', 25)
  INTO Spectateur (id_spectateur, nom, prenom, age) VALUES (5,'Smith', 'Emily', 19)
  INTO Spectateur (id_spectateur, nom, prenom, age) VALUES (6,'Petrovna', 'Anna', 23)
  INTO Spectateur (id_spectateur, nom, prenom, age) VALUES (7,'Ivanov', 'Viktor', 24)
  INTO Spectateur (id_spectateur, nom, prenom, age) VALUES (8,'Stevens', 'Damian', 30)
  INTO Spectateur (id_spectateur, nom, prenom, age) VALUES (9,'Mayers', 'Tina', 20)
  INTO Spectateur (id_spectateur, nom, prenom, age) VALUES (10,'Da Silva', 'Maria', 26)
SELECT * FROM DUAL;

-- Billet
INSERT ALL
  INTO Billet (id_billet, id_type_billet, date_debut, id_bracelet, id_spectateur) VALUES (40000001, 112, TO_DATE('2026-03-14', 'YYYY-MM-DD'), 30000001, 1)
  INTO Billet (id_billet, id_type_billet, date_debut, id_bracelet, id_spectateur) VALUES (40000002, 103, TO_DATE('2026-03-15', 'YYYY-MM-DD'), 30000002, 2)
  INTO Billet (id_billet, id_type_billet, date_debut, id_bracelet, id_spectateur) VALUES (40000003, 101, TO_DATE('2026-03-17', 'YYYY-MM-DD'), 30000003, 3)
  INTO Billet (id_billet, id_type_billet, date_debut, id_bracelet, id_spectateur) VALUES (40000004, 105, TO_DATE('2026-03-14', 'YYYY-MM-DD'), 30000004, 4)
  INTO Billet (id_billet, id_type_billet, date_debut, id_bracelet, id_spectateur) VALUES (40000005, 111, TO_DATE('2026-03-19', 'YYYY-MM-DD'), 30000005, 5)
  INTO Billet (id_billet, id_type_billet, date_debut, id_bracelet, id_spectateur) VALUES (40000006, 104, TO_DATE('2026-03-14', 'YYYY-MM-DD'), 30000006, 6)
  INTO Billet (id_billet, id_type_billet, date_debut, id_bracelet, id_spectateur) VALUES (40000007, 108, TO_DATE('2026-03-15', 'YYYY-MM-DD'), 30000007, 7)
  INTO Billet (id_billet, id_type_billet, date_debut, id_bracelet, id_spectateur) VALUES (40000008, 102, TO_DATE('2026-03-17', 'YYYY-MM-DD'), 30000008, 8)
  INTO Billet (id_billet, id_type_billet, date_debut, id_bracelet, id_spectateur) VALUES (40000009, 106, TO_DATE('2026-03-14', 'YYYY-MM-DD'), 30000009, 9)
  INTO Billet (id_billet, id_type_billet, date_debut, id_bracelet, id_spectateur) VALUES (40000010, 109, TO_DATE('2026-03-19', 'YYYY-MM-DD'), 30000010, 10)
SELECT * FROM DUAL;

-- Concert
INSERT ALL
  INTO Concert (id_concert, nom_artiste, genre, date_concert, heure_concert, id_scene) VALUES (50000001, 'Fatboy Slim', 'Big Beat', TO_DATE('2026-03-14','YYYY-MM-DD'), TO_TIMESTAMP('2026-03-14 21:00:00','YYYY-MM-DD HH24:MI:SS'), 201)
  INTO Concert (id_concert, nom_artiste, genre, date_concert, heure_concert, id_scene) VALUES (50000002,'Wilkinson', 'Drum & Bass', TO_DATE('2026-03-15','YYYY-MM-DD'), TO_TIMESTAMP('2026-03-15 20:30:00','YYYY-MM-DD HH24:MI:SS'), 202)
  INTO Concert (id_concert, nom_artiste, genre, date_concert, heure_concert, id_scene) VALUES (50000003,'Arielle Free', 'House', TO_DATE('2026-03-17','YYYY-MM-DD'), TO_TIMESTAMP('2026-03-17 22:00:00','YYYY-MM-DD HH24:MI:SS'), 204)
  INTO Concert (id_concert, nom_artiste, genre, date_concert, heure_concert, id_scene) VALUES (50000004,'Badger', 'House', TO_DATE('2026-03-19','YYYY-MM-DD'), TO_TIMESTAMP('2026-03-19 21:00:00','YYYY-MM-DD HH24:MI:SS'), 204)
  INTO Concert (id_concert, nom_artiste, genre, date_concert, heure_concert, id_scene) VALUES (50000005,'Charlie Boon', 'Electronic', TO_DATE('2026-03-20','YYYY-MM-DD'), TO_TIMESTAMP('2026-03-20 22:30:00','YYYY-MM-DD HH24:MI:SS'), 203)
  INTO Concert (id_concert, nom_artiste, genre, date_concert, heure_concert, id_scene) VALUES (50000006,'Charlie Tee', 'House & Techno', TO_DATE('2026-03-15','YYYY-MM-DD'), TO_TIMESTAMP('2026-03-15 20:30:00','YYYY-MM-DD HH24:MI:SS'), 202)
  INTO Concert (id_concert, nom_artiste, genre, date_concert, heure_concert, id_scene) VALUES (50000007,'Danny Howard', 'Club/Dance', TO_DATE('2026-03-17','YYYY-MM-DD'), TO_TIMESTAMP('2026-03-17 22:00:00','YYYY-MM-DD HH24:MI:SS'), 205)
  INTO Concert (id_concert, nom_artiste, genre, date_concert, heure_concert, id_scene) VALUES (50000008,'Dubtendo', 'Dance/Electronic', TO_DATE('2026-03-19','YYYY-MM-DD'), TO_TIMESTAMP('2026-03-19 21:00:00','YYYY-MM-DD HH24:MI:SS'), 206)
  INTO Concert (id_concert, nom_artiste, genre, date_concert, heure_concert, id_scene) VALUES (50000009,'Emily Makis', 'Dance/Electronic', TO_DATE('2026-03-15','YYYY-MM-DD'), TO_TIMESTAMP('2026-03-15 20:30:00','YYYY-MM-DD HH24:MI:SS'), 203)
  INTO Concert (id_concert, nom_artiste, genre, date_concert, heure_concert, id_scene) VALUES (50000010,'Ewan McVicar', 'Dance/Electronic', TO_DATE('2026-03-17','YYYY-MM-DD'), TO_TIMESTAMP('2026-03-17 22:00:00','YYYY-MM-DD HH24:MI:SS'), 206)
  INTO Concert (id_concert, nom_artiste, genre, date_concert, heure_concert, id_scene) VALUES (50000011,'TSHA', 'Dance/Electronic', TO_DATE('2026-03-19','YYYY-MM-DD'), TO_TIMESTAMP('2026-03-19 21:00:00','YYYY-MM-DD HH24:MI:SS'), 205)
SELECT * FROM DUAL;

-- Passage
INSERT ALL
  INTO Passage (id_passage, id_billet, id_bracelet, id_scene, datetime_passage, passage_type) VALUES (60000001, 40000001, 30000001, 201, TO_TIMESTAMP('2026-03-14 20:50:00','YYYY-MM-DD HH24:MI:SS'), 'entry')
  INTO Passage (id_passage, id_billet, id_bracelet, id_scene, datetime_passage, passage_type) VALUES (60000002, 40000002, 30000002, 202, TO_TIMESTAMP('2026-03-15 20:10:00','YYYY-MM-DD HH24:MI:SS'), 'entry')
  INTO Passage (id_passage, id_billet, id_bracelet, id_scene, datetime_passage, passage_type) VALUES (60000003, 40000003, 30000003, 204, TO_TIMESTAMP('2026-03-17 21:40:00','YYYY-MM-DD HH24:MI:SS'), 'entry')
  INTO Passage (id_passage, id_billet, id_bracelet, id_scene, datetime_passage, passage_type) VALUES (60000004, 40000004, 30000004, 204, TO_TIMESTAMP('2026-03-19 20:45:00','YYYY-MM-DD HH24:MI:SS'), 'entry')
  INTO Passage (id_passage, id_billet, id_bracelet, id_scene, datetime_passage, passage_type) VALUES (60000005, 40000005, 30000005, 203, TO_TIMESTAMP('2026-03-20 22:00:00','YYYY-MM-DD HH24:MI:SS'), 'entry')
  INTO Passage (id_passage, id_billet, id_bracelet, id_scene, datetime_passage, passage_type) VALUES (60000006, 40000006, 30000006, 202, TO_TIMESTAMP('2026-03-14 20:50:00','YYYY-MM-DD HH24:MI:SS'), 'entry')
  INTO Passage (id_passage, id_billet, id_bracelet, id_scene, datetime_passage, passage_type) VALUES (60000007, 40000007, 30000007, 205, TO_TIMESTAMP('2026-03-15 20:10:00','YYYY-MM-DD HH24:MI:SS'), 'entry')
  INTO Passage (id_passage, id_billet, id_bracelet, id_scene, datetime_passage, passage_type) VALUES (60000008, 40000008, 30000008, 206, TO_TIMESTAMP('2026-03-17 21:40:00','YYYY-MM-DD HH24:MI:SS'), 'entry')
  INTO Passage (id_passage, id_billet, id_bracelet, id_scene, datetime_passage, passage_type) VALUES (60000009, 40000009, 30000009, 203, TO_TIMESTAMP('2026-03-19 20:45:00','YYYY-MM-DD HH24:MI:SS'), 'entry')
  INTO Passage (id_passage, id_billet, id_bracelet, id_scene, datetime_passage, passage_type) VALUES (60000010, 40000010, 30000010, 206, TO_TIMESTAMP('2026-03-20 22:00:00','YYYY-MM-DD HH24:MI:SS'), 'entry')
SELECT * FROM DUAL;

COMMIT;