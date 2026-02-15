-- Snowboxx Festival (Avoriaz) BD - Création des requêtes

-- 1. Nombre de billets vendus par type
SELECT tb.libelle_type_billet, COUNT(*) AS nb_vendus
FROM Billet b
JOIN Type_Billet tb ON b.id_type_billet = tb.id_type_billet
GROUP BY tb.libelle_type_billet;

-- 2. Concerts vus par un spectateur donné
SELECT DISTINCT c.nom_artiste, c.date_concert, c.heure_concert, s.nom_scene
FROM Passage p
JOIN Billet b ON p.id_billet = b.id_billet
JOIN Concert c ON p.id_scene = c.id_scene
JOIN Scene s ON c.id_scene = s.id_scene
WHERE b.id_spectateur = 1;

-- 3. Nombre de passages par scène
SELECT s.nom_scene, COUNT(*) AS nb_passages
FROM Passage p
JOIN Scene s ON p.id_scene = s.id_scene
GROUP BY s.nom_scene
ORDER BY nb_passages DESC;

-- 4. Chiffre d'affaires total du festival
SELECT SUM(tb.prix) AS chiffre_affaires_total
FROM Billet b
JOIN Type_Billet tb ON b.id_type_billet = tb.id_type_billet;

-- 5. Concert le plus fréquenté
SELECT c.nom_artiste, COUNT(*) AS nb_passages
FROM Passage p
JOIN Concert c ON p.id_scene = c.id_scene
GROUP BY c.nom_artiste
ORDER BY nb_passages DESC
FETCH FIRST 1 ROWS ONLY;

-- 6. Nombre de spectateurs entrés dans toutes les scènes
SELECT COUNT(*) AS nb_spectateurs_toutes_scenes
FROM (
    SELECT b.id_spectateur
    FROM Passage p
    JOIN Billet b ON p.id_billet = b.id_billet
    GROUP BY b.id_spectateur
    HAVING COUNT(DISTINCT p.id_scene) = (SELECT COUNT(*) FROM Scene)
);

-- 7. Bracelets les plus réutilisés
SELECT id_bracelet, COUNT(*) AS nb_utilisations
FROM Passage
GROUP BY id_bracelet
ORDER BY nb_utilisations DESC;

-- 8. Nombre de passages pour chaque scène
SELECT id_scene, COUNT(*) AS nb_passages
FROM Passage
GROUP BY id_scene
ORDER BY nb_passages DESC;

-- 9. Nombre de passages par scène pour chaque jour
-- Si datetime_passage est TIMESTAMP, TRUNC(datetime_passage) suffit
SELECT TRUNC(datetime_passage) AS jour, id_scene, COUNT(*) AS nb_passages
FROM Passage
GROUP BY TRUNC(datetime_passage), id_scene
ORDER BY jour, id_scene;

-- 10. Concert le plus fréquenté
SELECT c.nom_artiste, COUNT(*) AS nb_passages
FROM Passage p
JOIN Concert c ON p.id_scene = c.id_scene
GROUP BY c.nom_artiste
ORDER BY nb_passages DESC
FETCH FIRST 1 ROWS ONLY;

-- 11. Scène la moins fréquentée
SELECT id_scene, COUNT(*) AS nb_passages
FROM Passage
GROUP BY id_scene
ORDER BY nb_passages ASC
FETCH FIRST 1 ROWS ONLY;

-- 12. Billet le plus utilisé en une journée
SELECT id_billet, TRUNC(datetime_passage) AS jour, COUNT(*) AS nb_utilisations
FROM Passage
GROUP BY id_billet, TRUNC(datetime_passage)
ORDER BY nb_utilisations DESC
FETCH FIRST 1 ROWS ONLY;

-- 13. Chiffre d'affaires total du festival
SELECT SUM(tb.prix) AS chiffre_affaires_total
FROM Billet b
JOIN Type_Billet tb ON b.id_type_billet = tb.id_type_billet;

-- 14. Chiffre d'affaires par mois
SELECT TO_CHAR(date_debut,'YYYY-MM') AS mois, SUM(tb.prix) AS chiffre_affaires
FROM Billet b
JOIN Type_Billet tb ON b.id_type_billet = tb.id_type_billet
GROUP BY TO_CHAR(date_debut,'YYYY-MM')
ORDER BY mois;