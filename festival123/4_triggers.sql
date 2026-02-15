-- Snowboxx Festival (Avoriaz) BD - Création des triggers

-- 1. Default date_debut to sysdate if NULL
CREATE OR REPLACE TRIGGER trg_Avant_Inserer_Billet_DateDefault
BEFORE INSERT ON Billet
FOR EACH ROW
BEGIN
    IF :NEW.date_debut IS NULL THEN
        :NEW.date_debut := SYSDATE;
    END IF;
END;
/

-- 2. Block insert if spectator is under 18
CREATE OR REPLACE TRIGGER trg_Interdire_Billet_Mineur
BEFORE INSERT ON Billet
FOR EACH ROW
DECLARE
    v_age NUMBER;
BEGIN
    SELECT age INTO v_age FROM Spectateur WHERE id_spectateur = :NEW.id_spectateur;
    IF v_age < 18 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Spectators must be 18 or older.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20010, 'Spectator not found.');
END;
/

-- 3. Verify passage time is within ticket hours
CREATE OR REPLACE TRIGGER trg_Verif_Heures_Passage
BEFORE INSERT ON Passage
FOR EACH ROW
DECLARE
    v_heure_debut TIMESTAMP;
    v_heure_fin TIMESTAMP;
BEGIN
    SELECT t.heure_debut, t.heure_fin INTO v_heure_debut, v_heure_fin
    FROM Billet b
    JOIN Type_Billet t ON b.id_type_billet = t.id_type_billet
    WHERE b.id_billet = :NEW.id_billet;
    
    IF :NEW.datetime_passage NOT BETWEEN v_heure_debut AND v_heure_fin THEN
        RAISE_APPLICATION_ERROR(-20002, 'Passage time outside ticket valid hours.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20011, 'Ticket not found.');
END;
/

-- 4. Vérifie s’il y a un concert déjà prévu à la même scène et dans un créneau trop proche
-- UTILISATION D'UN COMPOUND TRIGGER pour éviter l'erreur "table is mutating"
CREATE OR REPLACE TRIGGER trg_Conflit_Concert_Scene
FOR INSERT OR UPDATE ON Concert
COMPOUND TRIGGER

  TYPE t_num_tab IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
  g_id_concert t_num_tab;
  g_id_scene   t_num_tab;
  g_date_concert t_num_tab;
  g_heure_concert t_num_tab;
  g_count PLS_INTEGER := 0;

  BEFORE EACH ROW IS
  BEGIN
    g_count := g_count + 1;
    g_id_concert(g_count) := NVL(:NEW.id_concert, -1);
    g_id_scene(g_count) := :NEW.id_scene;
    g_date_concert(g_count) := :NEW.date_concert;
    g_heure_concert(g_count) := :NEW.heure_concert;
  END BEFORE EACH ROW;

  AFTER STATEMENT IS
    v_conflicts NUMBER;
  BEGIN
    FOR i IN 1..g_count LOOP
      -- conversion TIMESTAMP -> DATE pour obtenir un nombre de jours lors de la soustraction
      SELECT COUNT(*) INTO v_conflicts
      FROM Concert c
      WHERE c.id_scene = g_id_scene(i)
        AND TRUNC(c.date_concert) = TRUNC(g_date_concert(i))
        AND ABS( (CAST(g_heure_concert(i) AS DATE) - CAST(c.heure_concert AS DATE)) * 24 * 60 ) < 60
        AND NVL(c.id_concert, -1) != NVL(g_id_concert(i), -1);

      IF v_conflicts > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Conflit : un concert est déjà prévu sur cette scène à une heure proche.');
      END IF;
    END LOOP;

    -- reset
    g_count := 0;
  END AFTER STATEMENT;

END trg_Conflit_Concert_Scene;
/

-- 5. Met à jour date_debut lors du premier passage si elle est NULL
CREATE OR REPLACE TRIGGER trg_Met_DateDebut_Du_Premier_Passage
AFTER INSERT ON Passage
FOR EACH ROW
BEGIN
    UPDATE Billet
    SET date_debut = TRUNC(CAST(:NEW.datetime_passage AS DATE))
    WHERE id_billet = :NEW.id_billet
      AND date_debut IS NULL;
END;
/

-- 6. Générer automatiquement l’identifiant dans le tableau Type_Billet (utilise la séquence en bas)
CREATE OR REPLACE TRIGGER trg_type_billet_id
BEFORE INSERT ON Type_Billet
FOR EACH ROW
BEGIN
    IF :NEW.id_type_billet IS NULL THEN
        :NEW.id_type_billet := seq_type_billet.NEXTVAL;
    END IF;
END;
/
CREATE SEQUENCE seq_type_billet
START WITH 200
INCREMENT BY 1
NOCACHE
NOCYCLE;
/