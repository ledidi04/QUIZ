-- =============================================
-- Base de données : quiz_ayiti
-- Pour les exercices de 9ème et NS4
-- Conforme aux programmes haïtiens (MENFP)
-- Plus de 300 questions incluses
-- =============================================

CREATE DATABASE IF NOT EXISTS quiz_ayiti
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE quiz_ayiti;

-- -----------------------------------------
-- Table des classes
-- -----------------------------------------
CREATE TABLE classes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(10) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- -----------------------------------------
-- Table des matières par classe
-- -----------------------------------------
CREATE TABLE matieres (
  id INT AUTO_INCREMENT PRIMARY KEY,
  classe_id INT NOT NULL,
  nom VARCHAR(80) NOT NULL,
  description TEXT,
  FOREIGN KEY (classe_id) REFERENCES classes(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- -----------------------------------------
-- Types d'exercices supportés
-- -----------------------------------------
CREATE TABLE types_exercice (
  id INT AUTO_INCREMENT PRIMARY KEY,
  code VARCHAR(20) NOT NULL UNIQUE,
  nom VARCHAR(60) NOT NULL
) ENGINE=InnoDB;

-- -----------------------------------------
-- Questions (tous types)
-- -----------------------------------------
CREATE TABLE questions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  matiere_id INT NOT NULL,
  type_id INT NOT NULL,
  enonce TEXT NOT NULL,
  explication TEXT,
  source VARCHAR(120),
  difficulte TINYINT DEFAULT 1,
  reponse_attendue VARCHAR(255) DEFAULT NULL COMMENT 'Pour completion, mots-clés séparés par |',
  FOREIGN KEY (matiere_id) REFERENCES matieres(id) ON DELETE CASCADE,
  FOREIGN KEY (type_id) REFERENCES types_exercice(id)
) ENGINE=InnoDB;

-- -----------------------------------------
-- Réponses pour QCM, Vrai/Faux, Appariement
-- -----------------------------------------
CREATE TABLE reponses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  question_id INT NOT NULL,
  texte VARCHAR(500) NOT NULL,
  est_correcte BOOLEAN NOT NULL DEFAULT FALSE,
  ordre INT NOT NULL DEFAULT 0,
  FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- -----------------------------------------
-- Utilisateurs (élèves)
-- -----------------------------------------
CREATE TABLE utilisateurs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pseudo VARCHAR(50) NOT NULL,
  classe_id INT,
  date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (classe_id) REFERENCES classes(id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- -----------------------------------------
-- Historique des sessions de quiz
-- -----------------------------------------
CREATE TABLE sessions_quiz (
  id INT AUTO_INCREMENT PRIMARY KEY,
  utilisateur_id INT NOT NULL,
  classe_id INT,
  matiere_id INT,
  mode ENUM('entrainement','examen') DEFAULT 'entrainement',
  score INT DEFAULT 0,
  total INT DEFAULT 0,
  date_debut TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  date_fin TIMESTAMP NULL,
  FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(id) ON DELETE CASCADE,
  FOREIGN KEY (classe_id) REFERENCES classes(id) ON DELETE SET NULL,
  FOREIGN KEY (matiere_id) REFERENCES matieres(id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- -----------------------------------------
-- Détail des réponses par session
-- -----------------------------------------
CREATE TABLE reponses_utilisateur (
  id INT AUTO_INCREMENT PRIMARY KEY,
  session_id INT NOT NULL,
  question_id INT NOT NULL,
  reponse_donnee TEXT,
  est_correcte BOOLEAN,
  FOREIGN KEY (session_id) REFERENCES sessions_quiz(id) ON DELETE CASCADE,
  FOREIGN KEY (question_id) REFERENCES questions(id)
) ENGINE=InnoDB;

-- =============================================
-- DONNÉES INITIALES
-- =============================================

INSERT INTO types_exercice (code, nom) VALUES
  ('vf', 'Vrai / Faux'),
  ('completion', 'Texte à trous'),
  ('qcm', 'QCM'),
  ('appariement', 'Glisser-déposer (appariement)'),
  ('ordonnancement', 'Remise en ordre');

INSERT INTO classes (nom) VALUES ('9e'), ('ns4');

-- Matières 9ème
INSERT INTO matieres (classe_id, nom) VALUES
  (1, 'creole'),
  (1, 'francais'),
  (1, 'maths'),
  (1, 'sciences_exp'),
  (1, 'sciences_soc'),
  (1, 'anglais'),
  (1, 'espagnol');

-- Matières NS4
INSERT INTO matieres (classe_id, nom) VALUES
  (2, 'francais'),
  (2, 'maths'),
  (2, 'physique'),
  (2, 'chimie'),
  (2, 'svt'),
  (2, 'histoire_geo'),
  (2, 'anglais');

-- =============================================
-- 1. CRÉOLE (20 questions)
-- =============================================
-- QCM Créole - Grammaire
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 3, 'Ki nan fraz sa yo ki ekri nan tan prezan ?', 'Verbe au présent.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mwen te manje diri a', 0, 1),
(@qid, 'Mwen ap manje diri a', 1, 2),
(@qid, 'Mwen ta manje diri a', 0, 3),
(@qid, 'Mwen te fin manje diri a', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 3, 'Ki sinonim mo "bèl" nan kreyòl ?', 'Synonyme de bèl = joli.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lèd', 0, 1),
(@qid, 'Joli', 1, 2),
(@qid, 'Gwo', 0, 3),
(@qid, 'Piti', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 3, 'Ki nan mo sa yo se yon non ?', 'Lekòl = nom commun.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mache', 0, 1),
(@qid, 'Lekòl', 1, 2),
(@qid, 'Bèl', 0, 3),
(@qid, 'Vit', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Mwen renmen ________ (manje/aprann) nan lekòl la.', NULL, 'Programme 9e AF', 1, 'aprann');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 1, 'Nan kreyòl, vèb pa janm konjige.', 'Vrai : les verbes en créole ne se conjuguent pas.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vre', 1, 1),
(@qid, 'Fo', 0, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 3, 'Kilès ki yon ekriven ayisyen ?', 'Frankétienne est un écrivain haïtien célèbre.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Victor Hugo', 0, 1),
(@qid, 'Frankétienne', 1, 2),
(@qid, 'Shakespeare', 0, 3),
(@qid, 'Cervantes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 3, 'Ki prenon "ou" vle di nan fraz "ou bèl" ?', 'Ou = tu/vous en créole.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mwen', 0, 1),
(@qid, 'Li', 0, 2),
(@qid, 'Ou', 1, 3),
(@qid, 'Nou', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ayiti se yon peyi ki sitiye nan ________ (Karayib/Ewòp).', NULL, 'Programme 9e AF', 1, 'Karayib');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 3, 'Ki tradiksyon mo "liv" an kreyòl ?', 'Liv = book en anglais, même mot en créole.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Book', 0, 1),
(@qid, 'Liv', 1, 2),
(@qid, 'Plume', 0, 3),
(@qid, 'Cahier', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 1, 'Lang kreyòl la gen plis pase 200 an.', 'Faux : le créole a bien plus de 200 ans.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vre', 0, 1),
(@qid, 'Fo', 1, 2);

-- Créole 11-20
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 3, 'Kijan ou di "bonjour" an kreyòl ?', 'Bonjou = bonjour en créole haïtien.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bonsoir', 0, 1),
(@qid, 'Bonjou', 1, 2),
(@qid, 'Bonswa', 0, 3),
(@qid, 'Adieu', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 3, 'Ki otè ki ekri "Dezafi" ?', 'Frankétienne a écrit Dezafi.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jacques Roumain', 0, 1),
(@qid, 'Frankétienne', 1, 2),
(@qid, 'Dany Laferrière', 0, 3),
(@qid, 'René Depestre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Pòtoprens se ________ (kapital/vilaj) peyi Ayiti.', NULL, 'Programme 9e AF', 1, 'kapital');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 3, 'Nan fraz "li ap kouri", ki tan vèb la ye ?', 'Ap + verbe = présent progressif.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pase', 0, 1),
(@qid, 'Prezan', 1, 2),
(@qid, 'Fiti', 0, 3),
(@qid, 'Kondisyonèl', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 1, 'Kreyòl ayisyen se lang ofisyèl peyi a depi 1987.', 'Vrai : reconnu langue officielle dans la Constitution de 1987.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vre', 1, 1),
(@qid, 'Fo', 0, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 3, 'Mo "manman" se yon mo ki deziyen ?', 'Manman = mère, lien familial.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Yon zanmi', 0, 1),
(@qid, 'Yon fanmi', 1, 2),
(@qid, 'Yon pwofesè', 0, 3),
(@qid, 'Yon bèt', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, '________ (Dimanch/Lendi) se premye jou semèn nan.', NULL, 'Programme 9e AF', 1, 'Lendi');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 3, 'Ki koulè drapo Ayiti ?', 'Drapo Ayiti gen ble ak wouj.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vèt ak jòn', 0, 1),
(@qid, 'Ble ak wouj', 1, 2),
(@qid, 'Blan ak nwa', 0, 3),
(@qid, 'Wouj ak blan', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 1, 'Kreyòl ayisyen soti nan lang franse sèlman.', 'Faux : il vient du français, mais aussi de langues africaines, espagnol, anglais.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vre', 0, 1),
(@qid, 'Fo', 1, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 3, 'Kilès ki ekri "Gouverneurs de la rosée" ?', 'Jacques Roumain, traduit en créole.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dany Laferrière', 0, 1),
(@qid, 'Jacques Roumain', 1, 2),
(@qid, 'Frankétienne', 0, 3),
(@qid, 'Lyonel Trouillot', 0, 4);

-- =============================================
-- 2. FRANÇAIS (40 questions)
-- =============================================
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quel est le complément d''objet direct dans la phrase : "Le chat mange la souris" ?',
    'Le COD répond à la question "quoi ?" après le verbe.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le chat', 0, 1),
(@qid, 'Mange', 0, 2),
(@qid, 'La souris', 1, 3),
(@qid, 'Dans le jardin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quel est le temps du verbe dans : "Je finirai mes devoirs demain" ?',
    'Finirai = futur simple (terminaison -ai).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Présent', 0, 1),
(@qid, 'Imparfait', 0, 2),
(@qid, 'Futur simple', 1, 3),
(@qid, 'Passé composé', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quelle est la nature du mot "rapidement" ?',
    'Les mots en -ment sont des adverbes.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adjectif', 0, 1),
(@qid, 'Adverbe', 1, 2),
(@qid, 'Nom', 0, 3),
(@qid, 'Verbe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Les enfants jouent dans ________ (le/la) cour.', NULL, 'Programme 9e AF', 1, 'la');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quel est l''antonyme du mot "grand" ?',
    'Petit est le contraire de grand.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haut', 0, 1),
(@qid, 'Large', 0, 2),
(@qid, 'Petit', 1, 3),
(@qid, 'Immense', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Dans la phrase "Il est venu hier", "hier" est un :',
    'Hier = complément circonstanciel de temps.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'COD', 0, 1),
(@qid, 'CC de temps', 1, 2),
(@qid, 'Attribut', 0, 3),
(@qid, 'Sujet', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Le mot "chanteuse" est du genre :',
    'Chanteuse = féminin (terminaison -euse).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Masculin', 0, 1),
(@qid, 'Féminin', 1, 2),
(@qid, 'Neutre', 0, 3),
(@qid, 'Épicène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quel est le mode du verbe dans "Il faut que tu viennes" ?',
    'Après "il faut que", on utilise le subjonctif.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Indicatif', 0, 1),
(@qid, 'Subjonctif', 1, 2),
(@qid, 'Conditionnel', 0, 3),
(@qid, 'Impératif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Comment s''accorde le participe passé avec l''auxiliaire être ?',
    'Avec être, le participe passé s''accorde avec le sujet.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il ne s''accorde pas', 0, 1),
(@qid, 'Il s''accorde avec le sujet', 1, 2),
(@qid, 'Il s''accorde avec le COD', 0, 3),
(@qid, 'Il reste invariable', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quelle est la figure de style dans "La terre est une orange bleue" ?',
    'Métaphore : comparaison sans outil de comparaison.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Comparaison', 0, 1),
(@qid, 'Métaphore', 1, 2),
(@qid, 'Personnification', 0, 3),
(@qid, 'Hyperbole', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Lequel de ces mots est un déterminant possessif ?',
    'Mon = déterminant possessif 1ère personne.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le', 0, 1),
(@qid, 'Mon', 1, 2),
(@qid, 'Ce', 0, 3),
(@qid, 'Un', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Elle ________ (aller/ira) au marché demain matin.', NULL, 'Programme 9e AF', 1, 'ira');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Dans "Le livre que j''ai lu est intéressant", "que" est un :',
    'Que = pronom relatif COD.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pronom personnel', 0, 1),
(@qid, 'Pronom relatif', 1, 2),
(@qid, 'Conjonction', 0, 3),
(@qid, 'Préposition', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quel est le synonyme de "courageux" ?',
    'Brave = synonyme de courageux.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lâche', 0, 1),
(@qid, 'Brave', 1, 2),
(@qid, 'Timide', 0, 3),
(@qid, 'Faible', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Identifiez le sujet dans : "Les oiseaux chantent dans les arbres".',
    '"Les oiseaux" est le sujet (qui fait l''action).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Chantent', 0, 1),
(@qid, 'Les arbres', 0, 2),
(@qid, 'Les oiseaux', 1, 3),
(@qid, 'Dans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quel est le pluriel de "cheval" ?',
    'Cheval → chevaux (pluriel irrégulier).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Chevals', 0, 1),
(@qid, 'Chevaux', 1, 2),
(@qid, 'Cheval', 0, 3),
(@qid, 'Chevaus', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Conjuguez le verbe "avoir" à la 3ème personne du pluriel au présent.',
    'Ils/Elles ont.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ils a', 0, 1),
(@qid, 'Ils ont', 1, 2),
(@qid, 'Ils sommes', 0, 3),
(@qid, 'Ils avez', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Le participe passé de "finir" est ________.', NULL, 'Programme 9e AF', 1, 'fini');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 1, 'Dans une phrase négative, on utilise "ne... pas".', 'Vrai : forme de base de la négation.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vrai', 1, 1),
(@qid, 'Faux', 0, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Qu''est-ce qu''un champ lexical ?',
    'Ensemble de mots se rapportant à un même thème.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un synonyme', 0, 1),
(@qid, 'Des mots sur un même thème', 1, 2),
(@qid, 'Une conjugaison', 0, 3),
(@qid, 'Une règle de grammaire', 0, 4);

-- Français 21-40 (suite)
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Dans "nous mangeons", quelle est la terminaison ?',
    '-ons est la terminaison de la 1ère personne du pluriel.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-ez', 0, 1),
(@qid, '-ent', 0, 2),
(@qid, '-ons', 1, 3),
(@qid, '-ais', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quel est le féminin de "acteur" ?',
    'Acteur → actrice.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Acteuse', 0, 1),
(@qid, 'Actrice', 1, 2),
(@qid, 'Acteure', 0, 3),
(@qid, 'Actoresse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quel est le mode de "Viens ici !" ?',
    'Viens = impératif présent.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Indicatif', 0, 1),
(@qid, 'Subjonctif', 0, 2),
(@qid, 'Impératif', 1, 3),
(@qid, 'Conditionnel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'La phrase "Quel beau temps !" est de type :',
    'Point d''exclamation = phrase exclamative.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Déclarative', 0, 1),
(@qid, 'Interrogative', 0, 2),
(@qid, 'Exclamative', 1, 3),
(@qid, 'Injonctive', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Le contraire de "triste" est ________.', NULL, 'Programme 9e AF', 1, 'joyeux|content|heureux|gai');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 1, '"Hier" est un adverbe de temps.', 'Vrai : hier indique le moment.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vrai', 1, 1),
(@qid, 'Faux', 0, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quel est l''infinitif de "je fis" ?',
    'Fis = passé simple de faire.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Faire', 1, 1),
(@qid, 'Fuir', 0, 2),
(@qid, 'Frire', 0, 3),
(@qid, 'Filer', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Dans "La voiture de mon père est rouge", quelle est la fonction de "de mon père" ?',
    'Complément du nom "voiture".', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'COD', 0, 1),
(@qid, 'Complément du nom', 1, 2),
(@qid, 'Attribut', 0, 3),
(@qid, 'Épithète', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Lequel est un article défini ?',
    'Le = article défini masculin singulier.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un', 0, 1),
(@qid, 'Le', 1, 2),
(@qid, 'Des', 0, 3),
(@qid, 'Une', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Conjuguez "pouvoir" au futur simple, 1ère personne du singulier.',
    'Je pourrai.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Je peux', 0, 1),
(@qid, 'Je pourrai', 1, 2),
(@qid, 'Je pouvais', 0, 3),
(@qid, 'Je pus', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'L''imparfait du verbe "chanter" à la 3e personne du singulier est "il ________".', NULL, 'Programme 9e AF', 1, 'chantait');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quel est le radical du verbe "dormir" ?',
    'Dor- est le radical (dormir, je dors...).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dorm-', 0, 1),
(@qid, 'Dor-', 1, 2),
(@qid, 'Dormi-', 0, 3),
(@qid, 'Dormir-', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Qu''est-ce qu''un homonyme ?',
    'Même prononciation, sens différent.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mot de même sens', 0, 1),
(@qid, 'Mot de même prononciation, sens différent', 1, 2),
(@qid, 'Mot de sens contraire', 0, 3),
(@qid, 'Mot de même famille', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 1, 'Le mot "doucement" est un adjectif.', 'Faux : c''est un adverbe.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vrai', 0, 1),
(@qid, 'Faux', 1, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, '________ (Et/Dont) toi, que penses-tu de cette histoire ?', NULL, 'Programme 9e AF', 1, 'Et');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Dans "Je l''ai vue hier", "l''" remplace :',
    'L'' = pronom COD pour une femme/chose féminine.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une personne ou chose féminine', 1, 1),
(@qid, 'Un lieu', 0, 2),
(@qid, 'Un homme', 0, 3),
(@qid, 'Un verbe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quelle est la forme correcte ?',
    'Bien + participe passé = invariable si placé avant.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les fleurs que j''ai cueilli', 0, 1),
(@qid, 'Les fleurs que j''ai cueillies', 1, 2),
(@qid, 'Les fleurs que j''ai cueillis', 0, 3),
(@qid, 'Les fleurs que j''ai cueillie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Quel est le nom correspondant au verbe "courir" ?',
    'Course = nom dérivé de courir.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Courant', 0, 1),
(@qid, 'Course', 1, 2),
(@qid, 'Coureur', 0, 3),
(@qid, 'Couru', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Le passé composé du verbe "partir" avec "elle" est "elle ________".', NULL, 'Programme 9e AF', 1, 'est partie');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 3, 'Une phrase complexe contient :',
    'Plusieurs verbes conjugués = plusieurs propositions.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un seul verbe', 0, 1),
(@qid, 'Plusieurs verbes conjugués', 1, 2),
(@qid, 'Aucun verbe', 0, 3),
(@qid, 'Uniquement un sujet', 0, 4);

-- =============================================
-- 3. MATHÉMATIQUES (55 questions)
-- =============================================
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Le centre de gravité d''un triangle est le point de rencontre de ses :',
    'Intersection des trois médianes.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hauteurs', 0, 1), (@qid, 'Médianes', 1, 2), (@qid, 'Bissectrices', 0, 3), (@qid, 'Médiatrices', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Un angle obtus mesure :', 'Entre 90° et 180°.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Moins de 90°', 0, 1), (@qid, 'Entre 90° et 180°', 1, 2), (@qid, '180° exactement', 0, 3), (@qid, 'Plus de 180°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, '(2²)³ = ?', '2⁶ = 64.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '12', 0, 1), (@qid, '36', 0, 2), (@qid, '64', 1, 3), (@qid, '32', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Si x > 4, alors :', 'x+3 > 7, donc x+3 > 7 ≥ 12 ? Non. Vérification : x+3 ≥ 12 si x ≥ 9.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x+3 = 7', 0, 1), (@qid, 'x+3 > 12', 0, 2), (@qid, 'x+3 ≥ 12', 0, 3), (@qid, 'x+3 > 7', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Le volume d''un cône de révolution de hauteur 5 cm et rayon 3 cm est :',
    'V = (πR²h)/3 ≈ 47,1 cm³.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '41,3 cm³', 0, 1), (@qid, '94,2 cm³', 0, 2), (@qid, '47,1 cm³', 1, 3), (@qid, '45 cm³', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'La racine carrée de 144 est :', '12 × 12 = 144.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '11', 0, 1), (@qid, '12', 1, 2), (@qid, '14', 0, 3), (@qid, '10', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Une médiane dans un triangle est une droite qui passe par :',
    'Un sommet et le milieu du côté opposé.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un sommet et le milieu du côté opposé', 1, 1),
(@qid, 'Deux sommets', 0, 2),
(@qid, 'Les trois sommets', 0, 3),
(@qid, 'Le centre du cercle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Une application linéaire f est définie par f(x) = 3x. Alors f(2) = ?', '3 × 2 = 6.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3', 0, 1), (@qid, '5', 0, 2), (@qid, '6', 1, 3), (@qid, '9', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Quel est le PGCD de 24 et 36 ?', '24=2³×3, 36=2²×3², PGCD=2²×3=12.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6', 0, 1), (@qid, '12', 1, 2), (@qid, '18', 0, 3), (@qid, '24', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Deux angles sont supplémentaires si leur somme vaut :',
    'Deux angles supplémentaires = 180°.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '90°', 0, 1), (@qid, '180°', 1, 2), (@qid, '360°', 0, 3), (@qid, '270°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un angle droit mesure ________ degrés.', NULL, 'Examen 9e AF', 1, '90');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Factorise : x² - 9 = ?', '(x-3)(x+3) = différence de deux carrés.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(x-3)²', 0, 1), (@qid, '(x-3)(x+3)', 1, 2), (@qid, '(x+3)²', 0, 3), (@qid, 'x(x-9)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'L''équation 2x + 4 = 10 a pour solution :', '2x=6 → x=3.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x=2', 0, 1), (@qid, 'x=3', 1, 2), (@qid, 'x=4', 0, 3), (@qid, 'x=5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Un triangle rectangle a un angle de 90°. Les deux autres angles sont :',
    'Complémentaires (somme = 90°).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Supplémentaires', 0, 1), (@qid, 'Complémentaires', 1, 2), (@qid, 'Opposés', 0, 3), (@qid, 'Égaux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'La moyenne de 10, 12, 14, 16 est :', '(10+12+14+16)/4 = 13.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '12', 0, 1), (@qid, '13', 1, 2), (@qid, '14', 0, 3), (@qid, '15', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Un parallélogramme a :', 'Côtés opposés parallèles et égaux.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ses côtés opposés parallèles', 1, 1),
(@qid, 'Un seul angle droit', 0, 2),
(@qid, 'Tous ses côtés égaux', 0, 3),
(@qid, 'Ses diagonales perpendiculaires', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Quel est l''inverse de 4 ?', 'L''inverse de 4 est 1/4 = 0,25.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-4', 0, 1), (@qid, '0', 0, 2), (@qid, '1/4', 1, 3), (@qid, '4', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Dans un cercle, un rayon est :', 'Moitié du diamètre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Égal au diamètre', 0, 1), (@qid, 'La moitié du diamètre', 1, 2), (@qid, 'Le double du diamètre', 0, 3), (@qid, 'Le triple du diamètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le théorème de Pythagore dit que dans un triangle rectangle, le carré de l''________ est égal à la somme des carrés des deux autres côtés.', NULL, 'Examen 9e AF', 1, 'hypoténuse');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, '100 grades équivalent à :', '100 grades = 90 degrés.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100°', 0, 1), (@qid, '90°', 1, 2), (@qid, '180°', 0, 3), (@qid, '360°', 0, 4);

-- Maths 21-55 (questions supplémentaires)
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'L''expression développée de (x+3)² est :', '(x+3)² = x²+6x+9.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x²+9', 0, 1), (@qid, 'x²+6x+9', 1, 2), (@qid, 'x²+3x+9', 0, 3), (@qid, 'x²+6x+6', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Un article coûte 500 G. Après une remise de 20%, son prix est :',
    '500 × 0,80 = 400 G.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 G', 0, 1), (@qid, '400 G', 1, 2), (@qid, '480 G', 0, 3), (@qid, '520 G', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Le système 2x+y=5, x-y=1 a pour solution :',
    'Addition : 3x=6 → x=2, y=1.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x=1, y=3', 0, 1), (@qid, 'x=2, y=1', 1, 2), (@qid, 'x=3, y=-1', 0, 3), (@qid, 'x=0, y=5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'La forme factorisée de 25x² - 16 est :',
    '(5x)²-4² = (5x-4)(5x+4).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(5x-4)²', 0, 1), (@qid, '(5x-4)(5x+4)', 1, 2), (@qid, '(25x-4)(x+4)', 0, 3), (@qid, '5(x²-16)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Une application f est définie par f(x)=2x-3. L''image de 5 est :',
    'f(5)=2×5-3=7.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5', 0, 1), (@qid, '7', 1, 2), (@qid, '10', 0, 3), (@qid, '13', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'L''orthocentre d''un triangle est le point de rencontre des :',
    'Hauteurs.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Médianes', 0, 1), (@qid, 'Hauteurs', 1, 2), (@qid, 'Médiatrices', 0, 3), (@qid, 'Bissectrices', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Le périmètre d''un cercle de rayon 7 cm est :',
    'P = 2πR ≈ 44 cm.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '22 cm', 0, 1), (@qid, '44 cm', 1, 2), (@qid, '154 cm', 0, 3), (@qid, '49 cm', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'L''équation x/3 = 6 a pour solution :',
    'x = 18.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '9', 0, 2), (@qid, '18', 1, 3), (@qid, '3', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Un angle plat mesure :', '180°.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '90°', 0, 1), (@qid, '180°', 1, 2), (@qid, '270°', 0, 3), (@qid, '360°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un polygone à 4 côtés s''appelle un ________.', NULL, 'Examen 9e AF', 1, 'quadrilatère');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'La médiatrice d''un segment est :',
    'Perpendiculaire au milieu.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parallèle au segment', 0, 1),
(@qid, 'Perpendiculaire au segment en son milieu', 1, 2),
(@qid, 'Oblique', 0, 3),
(@qid, 'La moitié du segment', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Combien vaut 10⁻³ ?', '0,001.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1000', 0, 1), (@qid, '0,001', 1, 2), (@qid, '0,01', 0, 3), (@qid, '100', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Comment note-t-on l''ensemble des nombres réels ?',
    'ℝ.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'N', 0, 1), (@qid, 'Z', 0, 2), (@qid, 'R', 1, 3), (@qid, 'Q', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 1, 'Un carré est un losange particulier.', 'Vrai : tous les côtés égaux + angles droits.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vrai', 1, 1), (@qid, 'Faux', 0, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'La solution de l''inéquation x+3 > 8 est :',
    'x > 5.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x > 5', 1, 1), (@qid, 'x < 5', 0, 2), (@qid, 'x ≥ 5', 0, 3), (@qid, 'x = 5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Une pyramide a une base carrée de côté 5 cm et une hauteur de 9 cm. Son volume est :',
    'V = (25×9)/3 = 75 cm³.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '45 cm³', 0, 1), (@qid, '75 cm³', 1, 2), (@qid, '225 cm³', 0, 3), (@qid, '15 cm³', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'f(x)=x-3 et g(x)=2x-1. g o f(√5) = ?',
    'f(√5)=√5-3, g(√5-3)=2(√5-3)-1=2√5-7.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2√5-7', 1, 1), (@qid, '2√5-5', 0, 2), (@qid, '√5-7', 0, 3), (@qid, '2√5+1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Dans un triangle rectangle, la médiane relative à l''hypoténuse mesure :',
    'Moitié de l''hypoténuse.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''hypoténuse', 0, 1), (@qid, 'La moitié de l''hypoténuse', 1, 2), (@qid, 'Le double', 0, 3), (@qid, 'Le tiers', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Le salaire médian est :', 'Valeur qui partage la série en deux parties égales.',
    'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La moyenne', 0, 1), (@qid, 'La valeur centrale', 1, 2), (@qid, 'Le maximum', 0, 3), (@qid, 'La somme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La formule du volume d''une pyramide est V = (Aire de base × ________) / 3.', NULL,
    'Examen 9e AF', 1, 'hauteur');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Un père de 45 ans a 4 enfants de 6,8,10,12 ans. Dans combien d''années son âge égalera la somme ?',
    '45+x = (6+x)+(8+x)+(10+x)+(12+x) → 45+x=36+4x → 3x=9 → x=3.',
    'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 ans', 0, 1), (@qid, '3 ans', 1, 2), (@qid, '4 ans', 0, 3), (@qid, '5 ans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 1, 'π est un nombre rationnel.', 'Faux : π est irrationnel.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vrai', 0, 1), (@qid, 'Faux', 1, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'La pente d''un plan incliné qui s''élève de 43 mm par mètre est :',
    '43/1000 = 0,043 = 4,3%.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '43%', 0, 1), (@qid, '0,043%', 1, 2), (@qid, '430%', 0, 3), (@qid, '0,43%', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, '14% de 125 est égal à :', '0,14 × 125 = 17,5.',
    'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '175', 0, 1), (@qid, '17,5', 1, 2), (@qid, '12,5', 0, 3), (@qid, '89,2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le périmètre d''un rectangle de longueur L et largeur l est P = ________.', NULL,
    'Examen 9e AF', 1, '2(L+l)|2L+2l');
SET @qid = LAST_INSERT_ID();

-- Maths questions restantes (45-55)
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Quel est le résultat de 8 + 4/5 ?', '8 + 0,8 = 44/5.',
    'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5/12', 0, 1), (@qid, '12/10', 0, 2), (@qid, '44/5', 1, 3), (@qid, '12/25', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Une droite qui passe par le sommet et est perpendiculaire au côté opposé est :',
    'Hauteur.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une médiane', 0, 1), (@qid, 'Une hauteur', 1, 2), (@qid, 'Une médiatrice', 0, 3), (@qid, 'Une bissectrice', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Le résultat de l''opération √150 sous forme a√b est :',
    '√150 = √(25×6) = 5√6.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10√15', 0, 1), (@qid, '15√10', 0, 2), (@qid, '6√5', 0, 3), (@qid, '5√6', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''aire d''un disque de rayon R est donnée par la formule A = ________.', NULL,
    'Examen 9e AF', 1, 'πR²|πR^2');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Le coefficient de proportionnalité entre 3 et 12 est :',
    '12/3 = 4.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '3', 0, 2), (@qid, '4', 1, 3), (@qid, '6', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 1, 'Deux droites perpendiculaires forment un angle de 90°.', 'Vrai.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vrai', 1, 1), (@qid, 'Faux', 0, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, '(3 + x)(4x² - 5x + 2) développé donne :',
    '12x²-15x+6+4x³-5x²+2x = 4x³+7x²-13x+6.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4x³+7x²-13x-6', 0, 1), (@qid, '4x³+7x²+13x-6', 0, 2),
(@qid, '4x³+7x²+13x+6', 0, 3), (@qid, '4x³+7x²-13x+6', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 3, 'Un débit de 650 m³/s correspond à un débit horaire de :',
    '650 × 3600 = 2 340 000 m³/h.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 340 000 m³', 1, 1), (@qid, '390 000 m³', 0, 2), (@qid, '234 000 m³', 0, 3), (@qid, '39 000 m³', 0, 4);

-- =============================================
-- 4. SCIENCES EXPÉRIMENTALES (55 questions)
-- =============================================
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'L''absence de quel constituant du sang entraîne un risque d''hémorragie ?',
    'Plaquettes = coagulation.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hématie', 0, 1), (@qid, 'Plasma', 0, 2), (@qid, 'Plaquette', 1, 3), (@qid, 'Leucocyte', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'La bauxite renferme des matières terreuses appelées :',
    'Gangue = impuretés du minerai.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Filon', 0, 1), (@qid, 'Gangue', 1, 2), (@qid, 'Gisement', 0, 3), (@qid, 'Mine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Lequel de ces organes est une glande digestive ?',
    'Le foie produit la bile.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Poumon', 0, 1), (@qid, 'Foie', 1, 2), (@qid, 'Cœur', 0, 3), (@qid, 'Rein', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'L''énergie que possède un corps en mouvement s''appelle :',
    'Énergie cinétique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Potentielle', 0, 1), (@qid, 'Cinétique', 1, 2), (@qid, 'Thermique', 0, 3), (@qid, 'Hydraulique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Quel instrument mesure l''intensité d''une force ?',
    'Dynamomètre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ampèremètre', 0, 1), (@qid, 'Dynamomètre', 1, 2), (@qid, 'Manomètre', 0, 3), (@qid, 'Baromètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Le sapin est une phanérogame car :',
    'Il produit des graines nues (gymnosperme).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il produit des fleurs', 0, 1), (@qid, 'Il produit des graines nues', 1, 2),
(@qid, 'Il possède des racines', 0, 3), (@qid, 'Il a de la chlorophylle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Le bulbe rachidien règle :',
    'Rythmes cardiaque et respiratoire.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La vision', 0, 1), (@qid, 'L''audition', 0, 2), (@qid, 'Les rythmes cardiaque et respiratoire', 1, 3), (@qid, 'La mémoire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Un corps de poids 5 N a une masse de (g=9,8 N/kg) :',
    'm = P/g = 5/9,8 ≈ 0,5 kg.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '50 kg', 0, 1), (@qid, '2 kg', 0, 2), (@qid, '0,5 kg', 1, 3), (@qid, '5 kg', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'L''ensemble des écosystèmes de la Terre forme :',
    'Biosphère.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''atmosphère', 0, 1), (@qid, 'La biosphère', 1, 2), (@qid, 'L''hydrosphère', 0, 3), (@qid, 'La lithosphère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'La tendinite est :',
    'Inflammation des extrémités d''un muscle.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un muscle étiré', 0, 1), (@qid, 'Des ligaments déchirés', 0, 2),
(@qid, 'L''inflammation des extrémités d''un muscle', 1, 3), (@qid, 'Un muscle meurtri', 0, 4);

-- Sciences Exp. 12-55
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Laquelle de ces plantes est une bryophyte ?',
    'La mousse.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le maïs', 0, 1), (@qid, 'La mousse', 1, 2), (@qid, 'La fougère', 0, 3), (@qid, 'Le blé', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Quel levier est du 3ème genre ?',
    'Pince électrique : force entre point d''appui et résistance.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ciseaux', 0, 1), (@qid, 'Brouette', 0, 2), (@qid, 'Pédale d''harmonium', 0, 3), (@qid, 'Pince électrique', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les poumons sont protégés par la ________.', NULL, 'Examen 9e AF', 1, 'cage thoracique|thorax');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Dans une solution d''eau sucrée, l''eau est le ________ et le sucre est le ________.', NULL,
    'Examen 9e AF', 1, 'solvant|soluté');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'La poussée d''Archimède se mesure en :',
    'Newton (force).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pascal', 0, 1), (@qid, 'Newton', 1, 2), (@qid, 'Kilogramme', 0, 3), (@qid, 'Watt', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Laquelle de ces actions correspond au péristaltisme ?',
    'Les aliments avancent poussés par les muscles de l''œsophage.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le bol alimentaire est avalé', 0, 1), (@qid, 'Les aliments s''imprègnent de salive', 0, 2),
(@qid, 'Le chyle traverse les parois de l''intestin', 0, 3),
(@qid, 'Les aliments avancent poussés par les muscles', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'La fougère est classée parmi les cryptogames vasculaires car elle possède :',
    'Des vaisseaux conducteurs.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des racines', 0, 1), (@qid, 'Des vaisseaux', 1, 2), (@qid, 'Des feuilles', 0, 3), (@qid, 'Une tige', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'L''accumulation de chlorure de sodium dans le sol entraîne :',
    'La salinisation.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''érosion', 0, 1), (@qid, 'La salinisation', 1, 2), (@qid, 'La sécheresse', 0, 3), (@qid, 'L''hydromorphie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'L''appareil qui mesure la pression atmosphérique est le :',
    'Baromètre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Manomètre', 0, 1), (@qid, 'Baromètre', 1, 2), (@qid, 'Dynamomètre', 0, 3), (@qid, 'Thermomètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Le travail d''une force de 50 N sur 200 cm est :',
    'W = F × d = 50 × 2 = 100 J.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 J', 1, 1), (@qid, '10 000 J', 0, 2), (@qid, '1 000 J', 0, 3), (@qid, '100 000 J', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Un os long contient en son centre :',
    'Le canal médullaire (moelle osseuse).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le périoste', 0, 1), (@qid, 'Le canal médullaire', 1, 2), (@qid, 'Le cartilage', 0, 3), (@qid, 'L''épiphyse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les champignons microscopiques utilisés pour faire lever la pâte sont les ________.',
    NULL, 'Examen 9e AF', 1, 'levures|levure');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'La membrane qui recouvre les poumons est la :',
    'Plèvre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Péritoine', 0, 1), (@qid, 'Périoste', 0, 2), (@qid, 'Plèvre', 1, 3), (@qid, 'Épiderme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 1, 'Le sang circule dans les artères du cœur vers les organes.',
    'Vrai.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vrai', 1, 1), (@qid, 'Faux', 0, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Laquelle de ces plantes est dépourvue de chlorophylle ?',
    'Le djon-djon (champignon).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Malanga', 0, 1), (@qid, 'Djon-djon', 1, 2), (@qid, 'Croton', 0, 3), (@qid, 'Caoutchouc', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Un homme de 75 kg monte de 15 m. Travail accompli (g=10 N/kg) :',
    'W = mgh = 75×10×15 = 11 250 J.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 125 J', 0, 1), (@qid, '11 250 J', 1, 2), (@qid, '750 J', 0, 3), (@qid, '112 500 J', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Qu''est-ce que les lichens ?',
    'Association algue + champignon.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une algue seule', 0, 1), (@qid, 'Un champignon seul', 0, 2),
(@qid, 'Association algue-champignon', 1, 3), (@qid, 'Une mousse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Quel gaz sert de carburant pour une combustion ?',
    'Le propane.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''hydrogène', 0, 1), (@qid, 'L''oxygène', 0, 2), (@qid, 'L''azote', 0, 3), (@qid, 'Le propane', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Une statue de 150 kg sur un socle de 1,5 m de côté exerce une pression de (g=10) :',
    'P = F/S = 1500/(1,5×1,5) = 666,7 Pa.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 000 Pa', 0, 1), (@qid, '667 Pa', 1, 2), (@qid, '100 Pa', 0, 3), (@qid, '1 500 Pa', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'La partie de l''oreille qui transmet les sons au cerveau est :',
    'Le nerf auditif.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le pavillon', 0, 1), (@qid, 'Le tympan', 0, 2), (@qid, 'Le nerf auditif', 1, 3), (@qid, 'Les osselets', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La poussée d''Archimède est une force de direction ________ et de sens vers ________.',
    NULL, 'Examen 9e AF', 2, 'verticale|le haut|haut');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Quelle est l''unité de puissance ?',
    'Watt.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Joule', 0, 1), (@qid, 'Watt', 1, 2), (@qid, 'Newton', 0, 3), (@qid, 'Pascal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Le VIH est le virus de l''immunodéficience humaine. Il attaque :',
    'Le système immunitaire.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le système nerveux', 0, 1), (@qid, 'Le système immunitaire', 1, 2),
(@qid, 'Le système digestif', 0, 3), (@qid, 'Le système respiratoire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 1, 'L''énergie éolienne utilise la force du vent.', 'Vrai.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vrai', 1, 1), (@qid, 'Faux', 0, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''organe qui filtre le sang est le ________.', NULL, 'Examen 9e AF', 1, 'rein|reins');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Quel est le principal gaz à effet de serre ?',
    'CO₂ (dioxyde de carbone).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oxygène', 0, 1), (@qid, 'Azote', 0, 2), (@qid, 'CO₂', 1, 3), (@qid, 'Hélium', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Le criquet est un insecte. Combien a-t-il de pattes ?',
    '6 pattes.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4', 0, 1), (@qid, '6', 1, 2), (@qid, '8', 0, 3), (@qid, '10', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Le processus par lequel les plantes fabriquent leur nourriture est :',
    'Photosynthèse.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Respiration', 0, 1), (@qid, 'Photosynthèse', 1, 2), (@qid, 'Transpiration', 0, 3), (@qid, 'Digestion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Comment appelle-t-on un animal qui mange des plantes et de la viande ?',
    'Omnivore.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Herbivore', 0, 1), (@qid, 'Carnivore', 0, 2), (@qid, 'Omnivore', 1, 3), (@qid, 'Insectivore', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''inflammation de la vessie s''appelle la ________.', NULL, 'Examen 9e AF', 2, 'cystite');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'L''énergie hydraulique utilise :',
    'La force de l''eau.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le soleil', 0, 1), (@qid, 'Le vent', 0, 2), (@qid, 'L''eau', 1, 3), (@qid, 'La chaleur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'De quoi est composé le système solaire ?',
    'Soleil + planètes + astéroïdes + comètes.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement le soleil', 0, 1), (@qid, 'Le soleil et les planètes', 1, 2),
(@qid, 'Uniquement les planètes', 0, 3), (@qid, 'La terre seulement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Qu''est-ce que la photosynthèse produit ?',
    'Oxygène et glucose.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CO₂ et eau', 0, 1), (@qid, 'Oxygène et glucose', 1, 2), (@qid, 'Azote', 0, 3), (@qid, 'Uniquement de l''eau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Une solution de pH 3 est :',
    'Acide (pH < 7).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Basique', 0, 1), (@qid, 'Neutre', 0, 2), (@qid, 'Acide', 1, 3), (@qid, 'Amphotère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Le fer est attiré par :',
    'Un aimant.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le bois', 0, 1), (@qid, 'Un aimant', 1, 2), (@qid, 'Le plastique', 0, 3), (@qid, 'Le verre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Combien de temps met la Terre pour faire le tour du Soleil ?',
    '365,25 jours (1 an).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '24 heures', 0, 1), (@qid, '30 jours', 0, 2), (@qid, '365 jours', 1, 3), (@qid, '7 jours', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Quel type de roche est le basalte ?',
    'Roche volcanique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sédimentaire', 0, 1), (@qid, 'Métamorphique', 0, 2), (@qid, 'Volcanique', 1, 3), (@qid, 'Calcaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Qu''est-ce qu''un séisme ?',
    'Tremblement de terre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une éruption volcanique', 0, 1), (@qid, 'Un tremblement de terre', 1, 2),
(@qid, 'Un tsunami', 0, 3), (@qid, 'Un ouragan', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'L''organe principal de la circulation sanguine est :',
    'Le cœur.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le poumon', 0, 1), (@qid, 'Le cœur', 1, 2), (@qid, 'Le foie', 0, 3), (@qid, 'Le rein', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 3, 'Comment s''appelle le phénomène de transformation de l''eau en vapeur ?',
    'Évaporation.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Condensation', 0, 1), (@qid, 'Évaporation', 1, 2), (@qid, 'Solidification', 0, 3), (@qid, 'Fusion', 0, 4);

-- =============================================
-- 5. SCIENCES SOCIALES (55 questions)
-- =============================================
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quelle organisation fut créée en 1920 après la 1ère Guerre Mondiale ?',
    'La SDN (Société des Nations).', 'Examen 9e AF Juillet 2023', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'OUA', 0, 1), (@qid, 'ONU', 0, 2), (@qid, 'SDN', 1, 3), (@qid, 'OEA', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel instrument légalisait l''esclavage à St Domingue ?',
    'Le Code Noir de 1685.', 'Examen 9e AF Juillet 2023', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Décret du 4 avril 1792', 0, 1), (@qid, 'Constitution de 1801', 0, 2),
(@qid, 'Code noir de 1685', 1, 3), (@qid, 'Pacte colonial', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Qui est le "Roi bâtisseur" d''Haïti ?',
    'Henri Christophe (Citadelle, Sans-Souci).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dessalines', 0, 1), (@qid, 'Henri Christophe', 1, 2), (@qid, 'Boyer', 0, 3), (@qid, 'Soulouque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'La doctrine de Monroe justifiait :',
    'La domination des USA sur l''Amérique Latine.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''indépendance d''Haïti', 0, 1), (@qid, 'La domination US en Amérique Latine', 1, 2),
(@qid, 'La Révolution française', 0, 3), (@qid, 'L''abolition de l''esclavage', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quelle est la devise du Parti Libéral au XIXe siècle haïtien ?',
    '"Le pouvoir aux plus capables".', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le pouvoir aux plus capables', 1, 1), (@qid, 'Le pouvoir au plus grand nombre', 0, 2),
(@qid, 'L''union fait la force', 0, 3), (@qid, 'Liberté ou la mort', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel événement a déterminé l''occupation américaine d''Haïti en 1915 ?',
    'L''assassinat du président Vilbrun Guillaume Sam.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le drame de Miragoâne', 0, 1), (@qid, 'L''explosion de la Crête-à-Pierrot', 0, 2),
(@qid, 'La révolte des Piquets', 0, 3), (@qid, 'L''assassinat de V.G. Sam', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel pays de la Caraïbe est un département d''Outre-Mer (DOM) ?',
    'La Martinique (France).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Porto Rico', 0, 1), (@qid, 'Martinique', 1, 2), (@qid, 'Jamaïque', 0, 3), (@qid, 'Haïti', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Le déplacement massif des habitants vers les villes est :',
    'L''exode rural.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Migration internationale', 0, 1), (@qid, 'Immigration', 0, 2),
(@qid, 'Exode rural', 1, 3), (@qid, 'Boat people', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel pays de la Caraïbe est socialiste ?',
    'Cuba.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haïti', 0, 1), (@qid, 'République Dominicaine', 0, 2), (@qid, 'Cuba', 1, 3), (@qid, 'Jamaïque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Qui a dirigé la révolution cubaine de 1959 ?',
    'Fidel Castro.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Che Guevara', 0, 1), (@qid, 'Fidel Castro', 1, 2), (@qid, 'Batista', 0, 3), (@qid, 'Simon Bolivar', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le principal allié de Cuba pendant la Guerre Froide était l''________.', NULL,
    'Examen 9e AF', 2, 'URSS|Union soviétique');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'La CARICOM a remplacé :',
    'La CARIFTA.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''OEA', 0, 1), (@qid, 'Le MERCOSUR', 0, 2), (@qid, 'La CARIFTA', 1, 3), (@qid, 'L''ALENA', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Les USA sont entrés dans la 2ème Guerre Mondiale après l''attaque de :',
    'Pearl Harbor (1941).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Berlin', 0, 1), (@qid, 'Pearl Harbor', 1, 2), (@qid, 'Hiroshima', 0, 3), (@qid, 'Normandie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel programme a résolu la crise économique de 1929 ?',
    'Le New Deal (Roosevelt).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Plan Marshall', 0, 1), (@qid, 'Le Kominform', 0, 2),
(@qid, 'Le New Deal', 1, 3), (@qid, 'La Perestroïka', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Qui était le leader de l''indépendance du Venezuela ?',
    'Simon Bolivar.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'José Marti', 0, 1), (@qid, 'Simon Bolivar', 1, 2), (@qid, 'San Martin', 0, 3), (@qid, 'Hidalgo', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'La première victime de l''occupation américaine en 1915 fut :',
    'Vilbrun Guillaume Sam.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Charlemagne Péralte', 0, 1), (@qid, 'Pierre Sully', 0, 2),
(@qid, 'Vilbrun Guillaume Sam', 1, 3), (@qid, 'Benoit Batraville', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quelle ville est la capitale de la République Dominicaine ?',
    'Saint-Domingue.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Santiago', 0, 1), (@qid, 'Saint-Domingue', 1, 2), (@qid, 'Puerto Plata', 0, 3), (@qid, 'La Vega', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Le fondateur de l''indépendance haïtienne est :',
    'Jean-Jacques Dessalines.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toussaint Louverture', 0, 1), (@qid, 'Jean-Jacques Dessalines', 1, 2),
(@qid, 'Alexandre Pétion', 0, 3), (@qid, 'Henri Christophe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'La constitution haïtienne de 1987 reconnaît le créole comme :',
    'Langue officielle.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Langue étrangère', 0, 1), (@qid, 'Langue officielle', 1, 2), (@qid, 'Dialecte', 0, 3), (@qid, 'Patois', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel pays africain a été fondé par des esclaves libérés ?',
    'Le Liberia.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ghana', 0, 1), (@qid, 'Liberia', 1, 2), (@qid, 'Nigeria', 0, 3), (@qid, 'Sénégal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel est le plus petit département d''Haïti ?',
    'Le département du Nord-Est.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Ouest', 0, 1), (@qid, 'Le Nord', 0, 2), (@qid, 'Le Nord-Est', 1, 3), (@qid, 'L''Artibonite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La plus petite entité territoriale haïtienne est la ________.', NULL,
    'Examen 9e AF', 1, 'section communale');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Que signifie FAO ?',
    'Organisation pour l''Alimentation et l''Agriculture.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Organisation mondiale de la santé', 0, 1),
(@qid, 'Organisation pour l''Alimentation et l''Agriculture', 1, 2),
(@qid, 'Fonds monétaire international', 0, 3),
(@qid, 'Organisation des États Américains', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel est le principal produit agricole d''exportation d''Haïti ?',
    'Le café (historiquement).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le riz', 0, 1), (@qid, 'Le café', 1, 2), (@qid, 'La canne à sucre', 0, 3), (@qid, 'Le maïs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Qui a écrit "Ainsi parla l''oncle" ?',
    'Jean Price-Mars.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jacques Roumain', 0, 1), (@qid, 'Jean Price-Mars', 1, 2),
(@qid, 'Frankétienne', 0, 3), (@qid, 'Dany Laferrière', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'L''ONU a été créée en :',
    '1945.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1918', 0, 1), (@qid, '1920', 0, 2), (@qid, '1945', 1, 3), (@qid, '1960', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel est le nom de l''accord liant USA, Canada et Mexique ?',
    'ALENA (maintenant ACEUM).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'UE', 0, 1), (@qid, 'MERCOSUR', 0, 2), (@qid, 'ALENA', 1, 3), (@qid, 'CARICOM', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quelle est la monnaie officielle d''Haïti ?',
    'La gourde.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le dollar', 0, 1), (@qid, 'La gourde', 1, 2), (@qid, 'L''euro', 0, 3), (@qid, 'Le peso', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Qui a aboli l''esclavage en Haïti pour la première fois ?',
    'Toussaint Louverture (proclamation locale), Sonthonax en 1793.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dessalines', 0, 1), (@qid, 'Sonthonax', 1, 2), (@qid, 'Napoléon', 0, 3), (@qid, 'Boyer', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Combien de départements compte Haïti ?',
    '10 départements.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '7', 0, 1), (@qid, '9', 0, 2), (@qid, '10', 1, 3), (@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Le drapeau haïtien actuel est :',
    'Bleu et rouge.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bleu et blanc', 0, 1), (@qid, 'Rouge et noir', 0, 2), (@qid, 'Bleu et rouge', 1, 3), (@qid, 'Vert et rouge', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'La Première Guerre Mondiale a débuté en :',
    '1914.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1912', 0, 1), (@qid, '1914', 1, 2), (@qid, '1918', 0, 3), (@qid, '1939', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel pays a colonisé Haïti ?',
    'La France.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Espagne', 0, 1), (@qid, 'L''Angleterre', 0, 2), (@qid, 'La France', 1, 3), (@qid, 'Le Portugal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Lequel de ces pays est un "dragon asiatique" ?',
    'La Corée du Sud.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Inde', 0, 1), (@qid, 'Corée du Sud', 1, 2), (@qid, 'Chine', 0, 3), (@qid, 'Indonésie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Le créole haïtien est parlé par :',
    'Toute la population.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une minorité', 0, 1), (@qid, 'Toute la population', 1, 2),
(@qid, 'Seulement les ruraux', 0, 3), (@qid, 'Les étrangers', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel est le nom du marché commun de l''Amérique du Sud ?',
    'MERCOSUR.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ALENA', 0, 1), (@qid, 'UE', 0, 2), (@qid, 'MERCOSUR', 1, 3), (@qid, 'CARICOM', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Qu''est-ce qu''un pays enclavé ?',
    'Un pays sans accès à la mer.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un pays insulaire', 0, 1), (@qid, 'Un pays sans accès à la mer', 1, 2),
(@qid, 'Un pays montagneux', 0, 3), (@qid, 'Un pays colonial', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quelle est la langue officielle du Brésil ?',
    'Le portugais.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''espagnol', 0, 1), (@qid, 'Le portugais', 1, 2), (@qid, 'L''anglais', 0, 3), (@qid, 'Le français', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Le nom d''Haïti vient de :',
    'Ayiti = terre haute en langue taïno.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''espagnol', 0, 1), (@qid, 'Le français', 0, 2), (@qid, 'Le taïno', 1, 3), (@qid, 'L''anglais', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'En quelle année Haïti a-t-elle obtenu son indépendance ?',
    '1804.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1791', 0, 1), (@qid, '1804', 1, 2), (@qid, '1825', 0, 3), (@qid, '1843', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Haïti est située dans la mer des ________.', NULL, 'Examen 9e AF', 1, 'Caraïbes|Antilles');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel pays partage l''île d''Hispaniola avec Haïti ?',
    'La République Dominicaine.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1), (@qid, 'Jamaïque', 0, 2), (@qid, 'Rép. Dominicaine', 1, 3), (@qid, 'Porto Rico', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 3, 'Quel est le nom de l''hymne national haïtien ?',
    'La Dessalinienne.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Marseillaise', 0, 1), (@qid, 'La Dessalinienne', 1, 2),
(@qid, 'Haiti Chérie', 0, 3), (@qid, 'Fière Haïti', 0, 4);

-- =============================================
-- 6. ANGLAIS (50 questions)
-- =============================================
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'How do you say "bonjour" in English?', 'Hello / Good morning.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Goodbye', 0, 1), (@qid, 'Hello', 1, 2), (@qid, 'Sorry', 0, 3), (@qid, 'Please', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the capital of the United States?', 'Washington D.C.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'New York', 0, 1), (@qid, 'Washington D.C.', 1, 2), (@qid, 'Los Angeles', 0, 3), (@qid, 'Chicago', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'Choose the correct sentence:',
    '"She goes to school" (3rd person singular needs -s).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'She go to school', 0, 1), (@qid, 'She goes to school', 1, 2),
(@qid, 'She going to school', 0, 3), (@qid, 'She gone to school', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the past tense of "eat"?', 'Ate.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Eated', 0, 1), (@qid, 'Ate', 1, 2), (@qid, 'Eaten', 0, 3), (@qid, 'Eating', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, '"She ___ a doctor."', 'She is a doctor.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'am', 0, 1), (@qid, 'is', 1, 2), (@qid, 'are', 0, 3), (@qid, 'be', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the plural of "child"?', 'Children.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Childs', 0, 1), (@qid, 'Children', 1, 2), (@qid, 'Childen', 0, 3), (@qid, 'Childies', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What color is the sky?', 'Blue.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Red', 0, 1), (@qid, 'Blue', 1, 2), (@qid, 'Green', 0, 3), (@qid, 'Yellow', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, '"I ___ a student."', 'I am a student.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'am', 1, 1), (@qid, 'is', 0, 2), (@qid, 'are', 0, 3), (@qid, 'be', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the opposite of "big"?', 'Small.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Large', 0, 1), (@qid, 'Tall', 0, 2), (@qid, 'Small', 1, 3), (@qid, 'Huge', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'How many days are in a week?', '7.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5', 0, 1), (@qid, '6', 0, 2), (@qid, '7', 1, 3), (@qid, '8', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'Choose the correct word: "He ___ a book."', 'He reads a book.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'read', 0, 1), (@qid, 'reads', 1, 2), (@qid, 'reading', 0, 3), (@qid, 'is read', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'The opposite of "hot" is ________.', NULL, 'Programme 9e AF', 1, 'cold');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the name of the planet we live on?', 'Earth.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mars', 0, 1), (@qid, 'Earth', 1, 2), (@qid, 'Venus', 0, 3), (@qid, 'Jupiter', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, '"They ___ playing football."', 'They are playing.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'is', 0, 1), (@qid, 'are', 1, 2), (@qid, 'am', 0, 3), (@qid, 'be', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the past tense of "go"?', 'Went.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Goed', 0, 1), (@qid, 'Gone', 0, 2), (@qid, 'Went', 1, 3), (@qid, 'Going', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, '"There ___ a book on the table."', 'There is (singular).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'is', 1, 1), (@qid, 'are', 0, 2), (@qid, 'am', 0, 3), (@qid, 'be', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the superlative of "tall"?', 'Tallest.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Taller', 0, 1), (@qid, 'Tallest', 1, 2), (@qid, 'More tall', 0, 3), (@qid, 'Most tall', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'How do you say "merci" in English?', 'Thank you.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Please', 0, 1), (@qid, 'Thank you', 1, 2), (@qid, 'Sorry', 0, 3), (@qid, 'Excuse me', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'The plural of "woman" is ________.', NULL, 'Programme 9e AF', 1, 'women');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, '"I ___ my homework yesterday."', 'I did my homework.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'do', 0, 1), (@qid, 'did', 1, 2), (@qid, 'done', 0, 3), (@qid, 'doing', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the capital of Haiti?', 'Port-au-Prince.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cap-Haïtien', 0, 1), (@qid, 'Port-au-Prince', 1, 2), (@qid, 'Jacmel', 0, 3), (@qid, 'Gonaïves', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'Which word is a color?', 'Red.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Table', 0, 1), (@qid, 'Red', 1, 2), (@qid, 'Run', 0, 3), (@qid, 'Happy', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, '"He can ___ English."', 'He can speak (modal + base verb).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'speaks', 0, 1), (@qid, 'speak', 1, 2), (@qid, 'speaking', 0, 3), (@qid, 'spoke', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the opposite of "happy"?', 'Sad.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sad', 1, 1), (@qid, 'Glad', 0, 2), (@qid, 'Joyful', 0, 3), (@qid, 'Excited', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'The day after Monday is ________.', NULL, 'Programme 9e AF', 1, 'Tuesday');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, '"We ___ to the market yesterday."', 'We went.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'go', 0, 1), (@qid, 'went', 1, 2), (@qid, 'gone', 0, 3), (@qid, 'going', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the plural of "mouse"?', 'Mice.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mouses', 0, 1), (@qid, 'Mice', 1, 2), (@qid, 'Mousies', 0, 3), (@qid, 'Mouse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, '"She is ___ than her sister."', 'Taller (comparative).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'tall', 0, 1), (@qid, 'taller', 1, 2), (@qid, 'tallest', 0, 3), (@qid, 'more tall', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'Which of these is a fruit?', 'Apple.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Carrot', 0, 1), (@qid, 'Apple', 1, 2), (@qid, 'Potato', 0, 3), (@qid, 'Onion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the capital of England?', 'London.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Paris', 0, 1), (@qid, 'London', 1, 2), (@qid, 'Berlin', 0, 3), (@qid, 'Madrid', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, '"___ you like ice cream?"', 'Do you like?', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Does', 0, 1), (@qid, 'Do', 1, 2), (@qid, 'Is', 0, 3), (@qid, 'Are', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'The past participle of "write" is ________.', NULL, 'Programme 9e AF', 2, 'written');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the opposite of "cheap"?', 'Expensive.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Costly', 0, 1), (@qid, 'Expensive', 1, 2), (@qid, 'Cheaply', 0, 3), (@qid, 'Poor', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, '"I have ___ apple."', 'An (before vowel).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a', 0, 1), (@qid, 'an', 1, 2), (@qid, 'the', 0, 3), (@qid, 'some', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 1, 'The sun rises in the east.', 'True.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'True', 1, 1), (@qid, 'False', 0, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'Which is a day of the week?', 'Monday.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'January', 0, 1), (@qid, 'Monday', 1, 2), (@qid, 'Summer', 0, 3), (@qid, 'Noon', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'The comparative form of "good" is ________.', NULL, 'Programme 9e AF', 2, 'better');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'How many legs does a dog have?', '4.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '3', 0, 2), (@qid, '4', 1, 3), (@qid, '6', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 1, '"Cat" and "Dog" are synonyms.', 'False.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'True', 0, 1), (@qid, 'False', 1, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'What is the past tense of "have"?', 'Had.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haved', 0, 1), (@qid, 'Has', 0, 2), (@qid, 'Had', 1, 3), (@qid, 'Having', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, 'Which word is a verb?', 'Run.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Happy', 0, 1), (@qid, 'Run', 1, 2), (@qid, 'Blue', 0, 3), (@qid, 'Table', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'The month after December is ________.', NULL, 'Programme 9e AF', 1, 'January');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 3, '"My father ___ a car."', 'My father has a car.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'have', 0, 1), (@qid, 'has', 1, 2), (@qid, 'had', 0, 3), (@qid, 'having', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 1, 'Water freezes at 0 degrees Celsius.', 'True.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'True', 1, 1), (@qid, 'False', 0, 2);

-- =============================================
-- 7. ESPAGNOL (40 questions)
-- =============================================
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, 'La señora no ______ en la reunión de ayer.',
    'Participó = passé simple 3e pers.', 'Examen 9e AF Juin 2023', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Participe', 0, 1), (@qid, 'participad', 0, 2), (@qid, 'participó', 1, 3), (@qid, 'participaste', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, 'Tenemos que ______ juntos.',
    'Infinitif après "tener que".', 'Examen 9e AF Juin 2023', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ir', 1, 1), (@qid, 'vaya', 0, 2), (@qid, 'iremos', 0, 3), (@qid, 'fueron', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, 'Este bolígrafo no es de mí, es ______.',
    'Tuyo = le tien (possessif).', 'Examen 9e AF Juin 2023', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ti', 0, 1), (@qid, 'usted', 0, 2), (@qid, 'tuyo', 1, 3), (@qid, 'su', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, 'Elena es ______ bonita como Lola.',
    'Tan... como = comparatif d''égalité.', 'Examen 9e AF Juin 2023', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'tanta', 0, 1), (@qid, 'menos', 0, 2), (@qid, 'tan', 1, 3), (@qid, 'más', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, 'Aquellos chicos son ______ Chile.',
    'De = origine.', 'Examen 9e AF Juin 2023', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'hacia', 0, 1), (@qid, 'de', 1, 2), (@qid, 'en', 0, 3), (@qid, 'desde', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '¿Cómo se dice "merci" en español?', 'Gracias.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Por favor', 0, 1), (@qid, 'Gracias', 1, 2), (@qid, 'Perdón', 0, 3), (@qid, 'Hola', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '¿Cuál es la capital de España?', 'Madrid.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Barcelona', 0, 1), (@qid, 'Madrid', 1, 2), (@qid, 'Sevilla', 0, 3), (@qid, 'Valencia', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, 'El plural de "mujer" es ________.', NULL, 'Programme 9e AF', 1, 'mujeres');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '"Yo ___ estudiante."', 'Yo soy estudiante.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'soy', 1, 1), (@qid, 'eres', 0, 2), (@qid, 'es', 0, 3), (@qid, 'somos', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, 'What color is "rojo" in English?', 'Red.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Blue', 0, 1), (@qid, 'Red', 1, 2), (@qid, 'Green', 0, 3), (@qid, 'Yellow', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '"Buenos días" significa :', 'Bonjour.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bonsoir', 0, 1), (@qid, 'Bonjour', 1, 2), (@qid, 'Au revoir', 0, 3), (@qid, 'Merci', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '¿Cuál es el plural de "lápiz"?', 'Lápices.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lápizes', 0, 1), (@qid, 'Lápices', 1, 2), (@qid, 'Lapiz', 0, 3), (@qid, 'Lápizs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '"Ella ___ al mercado."', 'Ella va (ir, 3e pers singulier).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'va', 1, 1), (@qid, 'vas', 0, 2), (@qid, 'vamos', 0, 3), (@qid, 'van', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, 'El contrario de "grande" es ________.', NULL, 'Programme 9e AF', 1, 'pequeño|chico');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '¿Cómo se dice "bonsoir" en español?', 'Buenas noches.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Buenos días', 0, 1), (@qid, 'Buenas tardes', 0, 2), (@qid, 'Buenas noches', 1, 3), (@qid, 'Hola', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '"Nosotros ___ de Haití."', 'Somos (ser, 1ère pers pluriel).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'soy', 0, 1), (@qid, 'eres', 0, 2), (@qid, 'somos', 1, 3), (@qid, 'son', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '¿Cuál es el verbo "to eat" en español?', 'Comer.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Beber', 0, 1), (@qid, 'Comer', 1, 2), (@qid, 'Dormir', 0, 3), (@qid, 'Hablar', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '"Hasta luego" significa :', 'À plus tard.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bonjour', 0, 1), (@qid, 'À plus tard', 1, 2), (@qid, 'Merci', 0, 3), (@qid, 'Pardon', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, 'El femenino de "profesor" es ________.', NULL, 'Programme 9e AF', 1, 'profesora');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 1, 'Madrid es la capital de España.', 'Verdadero.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Verdadero', 1, 1), (@qid, 'Falso', 0, 2);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '¿Cómo se dice "lundi" en español?', 'Lunes.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Martes', 0, 1), (@qid, 'Lunes', 1, 2), (@qid, 'Miércoles', 0, 3), (@qid, 'Jueves', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '¿Qué idioma se habla en España?', 'Español (Castellano).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Francés', 0, 1), (@qid, 'Español', 1, 2), (@qid, 'Inglés', 0, 3), (@qid, 'Portugués', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '"Tú ___ mi amigo."', 'Eres (ser, 2e pers singulier).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'soy', 0, 1), (@qid, 'eres', 1, 2), (@qid, 'es', 0, 3), (@qid, 'somos', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '¿Cómo se dice "de rien" en español?', 'De nada.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Por favor', 0, 1), (@qid, 'De nada', 1, 2), (@qid, 'Gracias', 0, 3), (@qid, 'Perdón', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '¿Qué es "naranja"?', 'Un color y una fruta.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Una fruta', 0, 1), (@qid, 'Un color', 0, 2),
(@qid, 'Un color y una fruta', 1, 3), (@qid, 'Una verdura', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, 'El número después de "cuatro" es ________.', NULL, 'Programme 9e AF', 1, 'cinco');
SET @qid = LAST_INSERT_ID();

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '"Ayer yo ___ al cine."', 'Fui (ir, passé simple 1ère pers).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'voy', 0, 1), (@qid, 'iba', 0, 2), (@qid, 'fui', 1, 3), (@qid, 'iré', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '¿Cuál es el artículo definido masculino singular?', 'El.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La', 0, 1), (@qid, 'El', 1, 2), (@qid, 'Los', 0, 3), (@qid, 'Las', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 3, '¿Qué significa "por favor"?', 'S''il vous plaît.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Merci', 0, 1), (@qid, 'S''il vous plaît', 1, 2), (@qid, 'Pardon', 0, 3), (@qid, 'Bonjour', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 1, 'El español y el francés son lenguas romances.',
    'Verdadero.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Verdadero', 1, 1), (@qid, 'Falso', 0, 2);

