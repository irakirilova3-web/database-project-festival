CREATE OR REPLACE VIEW V_Billet AS
SELECT *
FROM Billet;

SELECT COUNT(*) FROM Type_Billet;
SELECT COUNT(*) FROM Billet;
SELECT COUNT(*) FROM Concert;
SELECT COUNT(*) FROM Passage;
SELECT COUNT(*) FROM Spectateur;
SELECT COUNT(*) FROM Bracelet;

-- verification
DESC Type_Billet;
DESC Billet;
SELECT table_name FROM user_tables WHERE table_name LIKE 'TYPE_BILLET' OR table_name LIKE 'BILLET';

-- compter
SELECT 'Type_Billet' name, COUNT(*) FROM Type_Billet;
SELECT 'Billet' name, COUNT(*) FROM Billet;

-- Exemple d'insertion (ajustez les ID en fonction de votre stratégie de clé primaire)
INSERT INTO Type_Billet (id_type_billet, libelle_type_billet, prix, duree_validite)
VALUES (999, 'test', 1, 1);
COMMIT;
SELECT * FROM Type_Billet WHERE id_type_billet = 999;