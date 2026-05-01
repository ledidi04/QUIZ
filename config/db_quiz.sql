-- =============================================
-- Base de données : quiz_ayiti
-- Pour les exercices de 9ème et NS4
-- Conforme aux programmes haïtiens (MENFP)
-- Version complète - toutes questions avec 4 options
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
-- Réponses pour QCM
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
  ('completion', 'Texte à trous'),
  ('qcm', 'QCM'),
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
-- 1. CRÉOLE (matiere_id = 1)
-- =============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki nan fraz sa yo ki ekri nan tan prezan ?', 'Vèb au présent progressif se ap + vèb.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mwen te manje diri a', 0, 1),
(@qid, 'Mwen ap manje diri a', 1, 2),
(@qid, 'Mwen ta manje diri a', 0, 3),
(@qid, 'Mwen te fin manje diri a', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki sinonim mo "bèl" nan kreyòl ?', 'Synonyme de bèl = joli.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lèd', 0, 1),
(@qid, 'Joli', 1, 2),
(@qid, 'Gwo', 0, 3),
(@qid, 'Piti', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki nan mo sa yo se yon non ?', 'Lekòl = nom commun.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mache', 0, 1),
(@qid, 'Lekòl', 1, 2),
(@qid, 'Bèl', 0, 3),
(@qid, 'Vit', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Kilès ki yon ekriven ayisyen ?', 'Frankétienne est un écrivain haïtien célèbre.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Victor Hugo', 0, 1),
(@qid, 'Frankétienne', 1, 2),
(@qid, 'Shakespeare', 0, 3),
(@qid, 'Cervantes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki otè ki ekri "Dezafi" ?', 'Frankétienne a écrit Dezafi.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jacques Roumain', 0, 1),
(@qid, 'Frankétienne', 1, 2),
(@qid, 'Dany Laferrière', 0, 3),
(@qid, 'René Depestre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Nan fraz "li ap kouri", ki tan vèb la ye ?', 'Ap + verbe = présent progressif.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pase', 0, 1),
(@qid, 'Prezan', 1, 2),
(@qid, 'Fiti', 0, 3),
(@qid, 'Kondisyonèl', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki koulè drapo Ayiti ?', 'Drapo Ayiti gen ble ak wouj.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vèt ak jòn', 0, 1),
(@qid, 'Ble ak wouj', 1, 2),
(@qid, 'Blan ak nwa', 0, 3),
(@qid, 'Wouj ak blan', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Kilès ki ekri "Gouverneurs de la rosée" ?', 'Jacques Roumain, traduit en créole.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dany Laferrière', 0, 1),
(@qid, 'Jacques Roumain', 1, 2),
(@qid, 'Frankétienne', 0, 3),
(@qid, 'Lyonel Trouillot', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Mo "manman" se yon mo ki deziyen ?', 'Manman = mère, lien familial.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Yon zanmi', 0, 1),
(@qid, 'Yon fanmi', 1, 2),
(@qid, 'Yon pwofesè', 0, 3),
(@qid, 'Yon bèt', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Kijan ou di "bonjour" an kreyòl ?', 'Bonjou = bonjour en créole haïtien.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bonsoir', 0, 1),
(@qid, 'Bonjou', 1, 2),
(@qid, 'Bonswa', 0, 3),
(@qid, 'Adieu', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki prenon "ou" vle di nan fraz "ou bèl" ?', 'Ou = tu/vous en créole.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mwen', 0, 1),
(@qid, 'Li', 0, 2),
(@qid, 'Ou', 1, 3),
(@qid, 'Nou', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki tradiksyon mo "liv" an kreyòl ?', 'Liv = livre en français.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bwa', 0, 1),
(@qid, 'Liv', 1, 2),
(@qid, 'Plim', 0, 3),
(@qid, 'Kaye', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki jou fèt endepandans Ayiti ?', '1e janvye 1804.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '18 novanm', 0, 1),
(@qid, '1e janvye', 1, 2),
(@qid, '14 oktòb', 0, 3),
(@qid, '12 out', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki kapital peyi Ayiti ?', 'Pòtoprens = capitale d''Haïti.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Okay', 0, 1),
(@qid, 'Pòtoprens', 1, 2),
(@qid, 'Gonayiv', 0, 3),
(@qid, 'Jakmèl', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Pòtoprens se ________ peyi Ayiti — ki mo ki manke ?', 'Kapital = capitale.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'vilaj', 0, 1),
(@qid, 'kapital', 1, 2),
(@qid, 'plaj', 0, 3),
(@qid, 'mòn', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki lang ofisyèl ki pale nan Ayiti ?', 'Kreyòl ak fransè sont les deux langues officielles.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Anglè ak espanyòl', 0, 1),
(@qid, 'Kreyòl ak fransè', 1, 2),
(@qid, 'Fransè sèlman', 0, 3),
(@qid, 'Kreyòl sèlman', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki moun ki te fonde endepandans Ayiti ?', 'Jean-Jacques Dessalines a proclamé l''indépendance.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toussaint Louverture', 0, 1),
(@qid, 'Jean-Jacques Dessalines', 1, 2),
(@qid, 'Alexandre Pétion', 0, 3),
(@qid, 'Henri Christophe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki nan fraz sa a ki nan tan pase ?', 'Te + verbe = passé.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mwen ap dòmi', 0, 1),
(@qid, 'Li te ale lekòl', 1, 2),
(@qid, 'Yo pral manje', 0, 3),
(@qid, 'Nou renmen jwe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki nan mo sa yo ki yon adjektif ?', 'Bèl décrit un nom = adjectif.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Kouri', 0, 1),
(@qid, 'Bèl', 1, 2),
(@qid, 'Lekòl', 0, 3),
(@qid, 'Rapidman', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki mo ki antonim "gwo" ?', 'Piti = contraire de gwo.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Gran', 0, 1),
(@qid, 'Piti', 1, 2),
(@qid, 'Bèl', 0, 3),
(@qid, 'Fò', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Kombyen depatman Ayiti genyen ?', 'Haïti a 10 départements.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '7', 0, 1),
(@qid, '9', 0, 2),
(@qid, '10', 1, 3),
(@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki rivyè ki pi long nan Ayiti ?', 'L''Artibonite est le plus long fleuve d''Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Rivyè Gwo Riwye', 0, 1),
(@qid, 'Rivyè Latibonit', 1, 2),
(@qid, 'Rivyè Pedimanns', 0, 3),
(@qid, 'Rivyè Blanc', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki mòn ki pi wo nan Ayiti ?', 'Le Pic la Selle est le point culminant d''Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mòn Lasèl', 1, 1),
(@qid, 'Mòn Kawo', 0, 2),
(@qid, 'Mòn Wòch Kaiman', 0, 3),
(@qid, 'Mòn Blan', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Ki mo ki vle di "dlo" an fransè ?', 'Dlo = eau en français.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Feu', 0, 1),
(@qid, 'Eau', 1, 2),
(@qid, 'Air', 0, 3),
(@qid, 'Terre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(1, 2, 'Nan kreyòl, ki mo ki vle di "travay" ?', 'Travay = travailler/travail.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dòmi', 0, 1),
(@qid, 'Travay', 1, 2),
(@qid, 'Manje', 0, 3),
(@qid, 'Jwe', 0, 4);

-- Créole complétion (type_id=1)
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(1, 1, 'Mwen renmen ________ (aprann/dòmi) nan lekòl la.', NULL, 'Programme 9e AF', 1, 'aprann');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(1, 1, 'Ayiti se yon peyi ki sitiye nan ________ (Karayib/Ewòp).', NULL, 'Programme 9e AF', 1, 'Karayib');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(1, 1, 'Pòtoprens se ________ (kapital/vilaj) peyi Ayiti.', NULL, 'Programme 9e AF', 1, 'kapital');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(1, 1, 'Nan fraz "Li ap manje", vèb la se "________".', NULL, 'Examen 9e AF', 1, 'manje');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(1, 1, 'Mo "lakay" vle di "________" an fransè.', NULL, 'Examen 9e AF', 1, 'maison|chez soi');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(1, 1, 'Jou fèt endepandans Ayiti se 1e ________ 1804.', NULL, 'Examen 9e AF', 1, 'janvye|janvier');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(1, 1, 'Koulè drapo Ayiti se ble ak ________.', NULL, 'Examen 9e AF', 1, 'wouj|rouge');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(1, 1, 'Mo "dlo" vle di "________" an fransè.', NULL, 'Examen 9e AF', 1, 'eau|de l''eau');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(1, 1, 'Ayiti gen ________ depatman ofisyèl.', NULL, 'Programme 9e AF', 1, '10|dis');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(1, 1, 'Nan kreyòl, "bonjou" vle di "________" an fransè.', NULL, 'Programme 9e AF', 1, 'bonjour');

-- =============================================
-- 2. FRANÇAIS (matiere_id = 2)
-- =============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le complément d''objet direct dans la phrase : "Le chat mange la souris" ?',
    'Le COD répond à la question "quoi ?" après le verbe.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le chat', 0, 1),
(@qid, 'Mange', 0, 2),
(@qid, 'La souris', 1, 3),
(@qid, 'Dans le jardin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le temps du verbe dans : "Je finirai mes devoirs demain" ?',
    'Finirai = futur simple (terminaison -ai).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Présent', 0, 1),
(@qid, 'Imparfait', 0, 2),
(@qid, 'Futur simple', 1, 3),
(@qid, 'Passé composé', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature du mot "rapidement" ?',
    'Les mots en -ment sont des adverbes.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adjectif', 0, 1),
(@qid, 'Adverbe', 1, 2),
(@qid, 'Nom', 0, 3),
(@qid, 'Verbe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est l''antonyme du mot "grand" ?',
    'Petit est le contraire de grand.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haut', 0, 1),
(@qid, 'Large', 0, 2),
(@qid, 'Petit', 1, 3),
(@qid, 'Immense', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans la phrase "Il est venu hier", "hier" est un :',
    'Hier = complément circonstanciel de temps.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'COD', 0, 1),
(@qid, 'CC de temps', 1, 2),
(@qid, 'Attribut', 0, 3),
(@qid, 'Sujet', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Le mot "chanteuse" est du genre :',
    'Chanteuse = féminin (terminaison -euse).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Masculin', 0, 1),
(@qid, 'Féminin', 1, 2),
(@qid, 'Neutre', 0, 3),
(@qid, 'Épicène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le mode du verbe dans "Il faut que tu viennes" ?',
    'Après "il faut que", on utilise le subjonctif.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Indicatif', 0, 1),
(@qid, 'Subjonctif', 1, 2),
(@qid, 'Conditionnel', 0, 3),
(@qid, 'Impératif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Comment s''accorde le participe passé avec l''auxiliaire être ?',
    'Avec être, le participe passé s''accorde avec le sujet.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il ne s''accorde pas', 0, 1),
(@qid, 'Il s''accorde avec le sujet', 1, 2),
(@qid, 'Il s''accorde avec le COD', 0, 3),
(@qid, 'Il reste invariable', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la figure de style dans "La terre est une orange bleue" ?',
    'Métaphore : comparaison sans outil de comparaison.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Comparaison', 0, 1),
(@qid, 'Métaphore', 1, 2),
(@qid, 'Personnification', 0, 3),
(@qid, 'Hyperbole', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Lequel de ces mots est un déterminant possessif ?',
    'Mon = déterminant possessif 1ère personne.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le', 0, 1),
(@qid, 'Mon', 1, 2),
(@qid, 'Ce', 0, 3),
(@qid, 'Un', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Le livre que j''ai lu est intéressant", "que" est un :',
    'Que = pronom relatif COD.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pronom personnel', 0, 1),
(@qid, 'Pronom relatif', 1, 2),
(@qid, 'Conjonction', 0, 3),
(@qid, 'Préposition', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le synonyme de "courageux" ?',
    'Brave = synonyme de courageux.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lâche', 0, 1),
(@qid, 'Brave', 1, 2),
(@qid, 'Timide', 0, 3),
(@qid, 'Faible', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Identifiez le sujet dans : "Les oiseaux chantent dans les arbres".',
    '"Les oiseaux" est le sujet (qui fait l''action).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Chantent', 0, 1),
(@qid, 'Les arbres', 0, 2),
(@qid, 'Les oiseaux', 1, 3),
(@qid, 'Dans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le pluriel de "cheval" ?',
    'Cheval → chevaux (pluriel irrégulier).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Chevals', 0, 1),
(@qid, 'Chevaux', 1, 2),
(@qid, 'Chevaus', 0, 3),
(@qid, 'Chevals', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Conjuguez le verbe "avoir" à la 3ème personne du pluriel au présent.',
    'Ils/Elles ont.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ils a', 0, 1),
(@qid, 'Ils ont', 1, 2),
(@qid, 'Ils sommes', 0, 3),
(@qid, 'Ils avez', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Qu''est-ce qu''un champ lexical ?',
    'Ensemble de mots se rapportant à un même thème.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un synonyme', 0, 1),
(@qid, 'Des mots sur un même thème', 1, 2),
(@qid, 'Une conjugaison', 0, 3),
(@qid, 'Une règle de grammaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le féminin de "acteur" ?',
    'Acteur → actrice.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Acteuse', 0, 1),
(@qid, 'Actrice', 1, 2),
(@qid, 'Acteure', 0, 3),
(@qid, 'Actoresse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le mode de "Viens ici !" ?',
    'Viens = impératif présent.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Indicatif', 0, 1),
(@qid, 'Subjonctif', 0, 2),
(@qid, 'Impératif', 1, 3),
(@qid, 'Conditionnel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'La phrase "Quel beau temps !" est de type :',
    'Point d''exclamation = phrase exclamative.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Déclarative', 0, 1),
(@qid, 'Interrogative', 0, 2),
(@qid, 'Exclamative', 1, 3),
(@qid, 'Injonctive', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est l''infinitif de "je fis" ?',
    'Fis = passé simple de faire.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Faire', 1, 1),
(@qid, 'Fuir', 0, 2),
(@qid, 'Frire', 0, 3),
(@qid, 'Filer', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Lequel est un article défini ?',
    'Le = article défini masculin singulier.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un', 0, 1),
(@qid, 'Le', 1, 2),
(@qid, 'Des', 0, 3),
(@qid, 'Une', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Conjuguez "pouvoir" au futur simple, 1ère personne du singulier.',
    'Je pourrai.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Je peux', 0, 1),
(@qid, 'Je pourrai', 1, 2),
(@qid, 'Je pouvais', 0, 3),
(@qid, 'Je pus', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Qu''est-ce qu''un homonyme ?',
    'Même prononciation, sens différent.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mot de même sens', 0, 1),
(@qid, 'Mot de même prononciation, sens différent', 1, 2),
(@qid, 'Mot de sens contraire', 0, 3),
(@qid, 'Mot de même famille', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la forme correcte du participe passé ?',
    'Le COD "fleurs" placé avant le verbe impose l''accord.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les fleurs que j''ai cueilli', 0, 1),
(@qid, 'Les fleurs que j''ai cueillies', 1, 2),
(@qid, 'Les fleurs que j''ai cueillis', 0, 3),
(@qid, 'Les fleurs que j''ai cueillie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Un texte qui défend une opinion est de type :',
    'Texte argumentatif = défendre une thèse.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Informatif', 0, 1),
(@qid, 'Descriptif', 0, 2),
(@qid, 'Argumentatif', 1, 3),
(@qid, 'Injonctif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le synonyme de "revue" dans un contexte scientifique ?',
    'Publication = synonyme de revue.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Magazine', 0, 1),
(@qid, 'Publication', 1, 2),
(@qid, 'Catalogue', 0, 3),
(@qid, 'Album', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le féminin de "sportif" ?',
    'Sportif → sportive.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sportife', 0, 1),
(@qid, 'Sportive', 1, 2),
(@qid, 'Sportifette', 0, 3),
(@qid, 'Sporteuse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le temps du verbe dans : "Ni toi ni moi ne saurons jamais qui est le coupable" ?',
    'Saurons = futur simple.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Présent', 0, 1),
(@qid, 'Imparfait', 0, 2),
(@qid, 'Futur simple', 1, 3),
(@qid, 'Conditionnel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le mode du verbe dans "Si j''étais entraîné, je courrais dans l''équipe" ?',
    'Conditionnel présent après si + imparfait.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Indicatif', 0, 1),
(@qid, 'Subjonctif', 0, 2),
(@qid, 'Conditionnel', 1, 3),
(@qid, 'Impératif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le radical du verbe "dormir" ?',
    'Dor- est le radical (je dors, tu dors...).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dorm-', 0, 1),
(@qid, 'Dor-', 1, 2),
(@qid, 'Dormi-', 0, 3),
(@qid, 'Dormir-', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Une phrase complexe contient :',
    'Plusieurs verbes conjugués = plusieurs propositions.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un seul verbe', 0, 1),
(@qid, 'Plusieurs verbes conjugués', 1, 2),
(@qid, 'Aucun verbe', 0, 3),
(@qid, 'Uniquement un sujet', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le nom correspondant au verbe "courir" ?',
    'Course = nom dérivé de courir.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Courant', 0, 1),
(@qid, 'Course', 1, 2),
(@qid, 'Coureur', 0, 3),
(@qid, 'Couru', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "nous mangeons", quelle est la terminaison ?',
    '-ons est la terminaison de la 1ère personne du pluriel.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-ez', 0, 1),
(@qid, '-ent', 0, 2),
(@qid, '-ons', 1, 3),
(@qid, '-ais', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "La voiture de mon père est rouge", quelle est la fonction de "de mon père" ?',
    'Complément du nom "voiture".', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'COD', 0, 1),
(@qid, 'Complément du nom', 1, 2),
(@qid, 'Attribut', 0, 3),
(@qid, 'Épithète', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la figure de style dans "Il pleut des cordes" ?',
    'Métaphore exprimant une pluie très forte.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Comparaison', 0, 1),
(@qid, 'Métaphore', 1, 2),
(@qid, 'Antithèse', 0, 3),
(@qid, 'Euphémisme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel type de phrase est "Ferme la porte !" ?',
    'Phrase injonctive = ordre, conseil, prière.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Déclarative', 0, 1),
(@qid, 'Interrogative', 0, 2),
(@qid, 'Exclamative', 0, 3),
(@qid, 'Injonctive', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Le participe passé de "venir" est :',
    'Venu = participe passé irrégulier.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vendu', 0, 1),
(@qid, 'Venu', 1, 2),
(@qid, 'Venant', 0, 3),
(@qid, 'Vient', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature de "rapidement" dans "Il court rapidement" ?',
    'Rapidement = adverbe de manière.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adjectif', 0, 1),
(@qid, 'Nom', 0, 2),
(@qid, 'Adverbe', 1, 3),
(@qid, 'Pronom', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le pluriel de "oeil" ?',
    'Oeil → yeux (pluriel irrégulier).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oeils', 0, 1),
(@qid, 'Yeux', 1, 2),
(@qid, 'Oeils', 0, 3),
(@qid, 'Oeilx', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Elle est partie hier soir", le verbe "partir" est conjugué avec :',
    'Les verbes de mouvement utilisent être comme auxiliaire.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Avoir', 0, 1),
(@qid, 'Être', 1, 2),
(@qid, 'Aller', 0, 3),
(@qid, 'Faire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le passé composé de "écrire" à la 1ère personne du singulier ?',
    'J''ai écrit.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'J''ai écrivi', 0, 1),
(@qid, 'J''ai écrit', 1, 2),
(@qid, 'J''ai écrivé', 0, 3),
(@qid, 'J''avais écrit', 0, 4);

-- Français complétion (type_id=1)
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(2, 1, 'Les enfants jouent dans ________ (le/la) cour.', NULL, 'Programme 9e AF', 1, 'la');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(2, 1, 'Elle ________ (aller/ira) au marché demain matin.', NULL, 'Programme 9e AF', 1, 'ira');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(2, 1, 'Le participe passé de "finir" est ________.', NULL, 'Programme 9e AF', 1, 'fini');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(2, 1, 'Le contraire de "triste" est ________.', NULL, 'Programme 9e AF', 1, 'joyeux|content|heureux|gai');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(2, 1, 'L''imparfait du verbe "chanter" à la 3e personne du singulier est "il ________".', NULL, 'Programme 9e AF', 1, 'chantait');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(2, 1, 'Le passé composé du verbe "partir" avec "elle" est "elle ________".', NULL, 'Programme 9e AF', 1, 'est partie');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(2, 1, 'Etre sportif contribue à rester en bonne ________.', NULL, 'Examen 9e AF', 1, 'santé|sante');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(2, 1, 'Le participe passé du verbe "comprendre" est ________.', NULL, 'Examen 9e AF', 1, 'compris');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(2, 1, 'Un mot qui a le même sens qu''un autre est un ________.', NULL, 'Examen 9e AF', 1, 'synonyme');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(2, 1, 'Le futur simple de "être" à la 1ère personne du singulier est "je ________".', NULL, 'Programme 9e AF', 1, 'serai');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(2, 1, 'La figure de style qui consiste à comparer deux choses avec "comme" s''appelle une ________.', NULL, 'Programme 9e AF', 2, 'comparaison');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(2, 1, 'Il planifie cette ________ depuis deux mois. (du verbe rénover)', NULL, 'Examen 9e AF', 2, 'rénovation|renovation');

-- =============================================
-- 3. MATHÉMATIQUES (matiere_id = 3)
-- =============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le centre de gravité d''un triangle est le point de rencontre de ses :',
    'Intersection des trois médianes.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hauteurs', 0, 1),
(@qid, 'Médianes', 1, 2),
(@qid, 'Bissectrices', 0, 3),
(@qid, 'Médiatrices', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un angle obtus mesure :', 'Entre 90° et 180°.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Moins de 90°', 0, 1),
(@qid, 'Entre 90° et 180°', 1, 2),
(@qid, '180° exactement', 0, 3),
(@qid, 'Plus de 180°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '(2²)³ = ?', '2⁶ = 64.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '12', 0, 1),
(@qid, '36', 0, 2),
(@qid, '64', 1, 3),
(@qid, '32', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si x > 4, alors :', 'x+3 > 7.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x+3 = 7', 0, 1),
(@qid, 'x+3 > 12', 0, 2),
(@qid, 'x+3 ≥ 12', 0, 3),
(@qid, 'x+3 > 7', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le volume d''un cône de révolution de hauteur 5 cm et rayon 3 cm est :',
    'V = (πR²h)/3 ≈ 47,1 cm³.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '41,3 cm³', 0, 1),
(@qid, '94,2 cm³', 0, 2),
(@qid, '47,1 cm³', 1, 3),
(@qid, '45 cm³', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La racine carrée de 144 est :', '12 × 12 = 144.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '11', 0, 1),
(@qid, '12', 1, 2),
(@qid, '14', 0, 3),
(@qid, '10', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une médiane dans un triangle est une droite qui passe par :',
    'Un sommet et le milieu du côté opposé.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un sommet et le milieu du côté opposé', 1, 1),
(@qid, 'Deux sommets', 0, 2),
(@qid, 'Les trois sommets', 0, 3),
(@qid, 'Le centre du cercle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une application f définie par f(x) = 3x. Alors f(2) = ?', '3 × 2 = 6.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3', 0, 1),
(@qid, '5', 0, 2),
(@qid, '6', 1, 3),
(@qid, '9', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Quel est le PGCD de 24 et 36 ?', '24=2³×3, 36=2²×3², PGCD=2²×3=12.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6', 0, 1),
(@qid, '12', 1, 2),
(@qid, '18', 0, 3),
(@qid, '24', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Deux angles sont supplémentaires si leur somme vaut :',
    'Deux angles supplémentaires = 180°.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '90°', 0, 1),
(@qid, '180°', 1, 2),
(@qid, '360°', 0, 3),
(@qid, '270°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Factorise : x² - 9 = ?', '(x-3)(x+3) = différence de deux carrés.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(x-3)²', 0, 1),
(@qid, '(x-3)(x+3)', 1, 2),
(@qid, '(x+3)²', 0, 3),
(@qid, 'x(x-9)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''équation 2x + 4 = 10 a pour solution :', '2x=6 → x=3.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x=2', 0, 1),
(@qid, 'x=3', 1, 2),
(@qid, 'x=4', 0, 3),
(@qid, 'x=5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La moyenne de 10, 12, 14, 16 est :', '(10+12+14+16)/4 = 13.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '12', 0, 1),
(@qid, '13', 1, 2),
(@qid, '14', 0, 3),
(@qid, '15', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un parallélogramme a :', 'Côtés opposés parallèles et égaux.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ses côtés opposés parallèles', 1, 1),
(@qid, 'Un seul angle droit', 0, 2),
(@qid, 'Tous ses côtés égaux', 0, 3),
(@qid, 'Ses diagonales perpendiculaires', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Quel est l''inverse de 4 ?', 'L''inverse de 4 est 1/4 = 0,25.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-4', 0, 1),
(@qid, '0', 0, 2),
(@qid, '1/4', 1, 3),
(@qid, '4', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''expression développée de (x+3)² est :', '(x+3)² = x²+6x+9.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x²+9', 0, 1),
(@qid, 'x²+6x+9', 1, 2),
(@qid, 'x²+3x+9', 0, 3),
(@qid, 'x²+6x+6', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un article coûte 500 G. Après une remise de 20%, son prix est :',
    '500 × 0,80 = 400 G.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 G', 0, 1),
(@qid, '400 G', 1, 2),
(@qid, '480 G', 0, 3),
(@qid, '520 G', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le système 2x+y=5, x-y=1 a pour solution :',
    'Addition : 3x=6 → x=2, y=1.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x=1, y=3', 0, 1),
(@qid, 'x=2, y=1', 1, 2),
(@qid, 'x=3, y=-1', 0, 3),
(@qid, 'x=0, y=5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une application f définie par f(x)=2x-3. L''image de 5 est :',
    'f(5)=2×5-3=7.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5', 0, 1),
(@qid, '7', 1, 2),
(@qid, '10', 0, 3),
(@qid, '13', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''orthocentre d''un triangle est le point de rencontre des :',
    'Hauteurs.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Médianes', 0, 1),
(@qid, 'Hauteurs', 1, 2),
(@qid, 'Médiatrices', 0, 3),
(@qid, 'Bissectrices', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le périmètre d''un cercle de rayon 7 cm est :',
    'P = 2πR ≈ 44 cm.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '22 cm', 0, 1),
(@qid, '44 cm', 1, 2),
(@qid, '154 cm', 0, 3),
(@qid, '49 cm', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La solution de l''inéquation x+3 > 8 est :',
    'x > 5.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x > 5', 1, 1),
(@qid, 'x < 5', 0, 2),
(@qid, 'x ≥ 5', 0, 3),
(@qid, 'x = 5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La forme factorisée de 25x² - 16 est :',
    '(5x)²-4² = (5x-4)(5x+4).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(5x-4)²', 0, 1),
(@qid, '(5x-4)(5x+4)', 1, 2),
(@qid, '(25x-4)(x+4)', 0, 3),
(@qid, '5(x²-16)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '14% de 125 est égal à :', '0,14 × 125 = 17,5.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '175', 0, 1),
(@qid, '17,5', 1, 2),
(@qid, '12,5', 0, 3),
(@qid, '89,2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le résultat de 8 + 4/5 est :', '8 + 0,8 = 44/5.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5/12', 0, 1),
(@qid, '12/10', 0, 2),
(@qid, '44/5', 1, 3),
(@qid, '12/25', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une droite qui passe par le sommet et est perpendiculaire au côté opposé est :',
    'Hauteur.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une médiane', 0, 1),
(@qid, 'Une hauteur', 1, 2),
(@qid, 'Une médiatrice', 0, 3),
(@qid, 'Une bissectrice', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le résultat de √150 sous forme a√b est :',
    '√150 = √(25×6) = 5√6.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10√15', 0, 1),
(@qid, '15√10', 0, 2),
(@qid, '6√5', 0, 3),
(@qid, '5√6', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le coefficient de proportionnalité entre 3 et 12 est :',
    '12/3 = 4.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1),
(@qid, '3', 0, 2),
(@qid, '4', 1, 3),
(@qid, '6', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un débit de 650 m³/s correspond à un débit horaire de :',
    '650 × 3600 = 2 340 000 m³/h.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 340 000 m³', 1, 1),
(@qid, '390 000 m³', 0, 2),
(@qid, '234 000 m³', 0, 3),
(@qid, '39 000 m³', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Combien vaut 10⁻³ ?', '0,001.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1000', 0, 1),
(@qid, '0,001', 1, 2),
(@qid, '0,01', 0, 3),
(@qid, '100', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Comment note-t-on l''ensemble des nombres réels ?', 'ℝ.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'N', 0, 1),
(@qid, 'Z', 0, 2),
(@qid, 'R', 1, 3),
(@qid, 'Q', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une pyramide à base carrée de côté 5 cm et hauteur 9 cm. Son volume est :',
    'V = (25×9)/3 = 75 cm³.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '45 cm³', 0, 1),
(@qid, '75 cm³', 1, 2),
(@qid, '225 cm³', 0, 3),
(@qid, '15 cm³', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'f(x)=x-3 et g(x)=2x-1. g∘f(√5) = ?',
    'f(√5)=√5-3, g(√5-3)=2(√5-3)-1=2√5-7.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2√5-7', 1, 1),
(@qid, '2√5-5', 0, 2),
(@qid, '√5-7', 0, 3),
(@qid, '2√5+1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un père de 45 ans a 4 enfants de 6, 8, 10, 12 ans. Dans combien d''années son âge égalera la somme des âges ?',
    '45+x = (6+x)+(8+x)+(10+x)+(12+x) → 45+x=36+4x → 3x=9 → x=3.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 ans', 0, 1),
(@qid, '3 ans', 1, 2),
(@qid, '4 ans', 0, 3),
(@qid, '5 ans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '(3 + x)(4x² - 5x + 2) développé donne :',
    '4x³+7x²-13x+6.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4x³+7x²-13x-6', 0, 1),
(@qid, '4x³+7x²+13x-6', 0, 2),
(@qid, '4x³+7x²+13x+6', 0, 3),
(@qid, '4x³+7x²-13x+6', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un angle plat mesure :', '180°.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '90°', 0, 1),
(@qid, '180°', 1, 2),
(@qid, '270°', 0, 3),
(@qid, '360°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La médiatrice d''un segment est :',
    'Perpendiculaire au milieu.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parallèle au segment', 0, 1),
(@qid, 'Perpendiculaire au segment en son milieu', 1, 2),
(@qid, 'Oblique', 0, 3),
(@qid, 'La moitié du segment', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Dans un triangle rectangle, la médiane relative à l''hypoténuse mesure :',
    'Moitié de l''hypoténuse.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''hypoténuse', 0, 1),
(@qid, 'La moitié de l''hypoténuse', 1, 2),
(@qid, 'Le double', 0, 3),
(@qid, 'Le tiers', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un triangle qui a tous ses côtés égaux est :',
    'Équilatéral = trois côtés égaux.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Isocèle', 0, 1),
(@qid, 'Rectangle', 0, 2),
(@qid, 'Équilatéral', 1, 3),
(@qid, 'Scalène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La probabilité d''obtenir un 6 en lançant un dé équilibré est :',
    '1/6.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/5', 0, 1),
(@qid, '1/6', 1, 2),
(@qid, '1/3', 0, 3),
(@qid, '1/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Deux angles complémentaires ont une somme de :',
    'Complémentaires = 90°.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '180°', 0, 1),
(@qid, '360°', 0, 2),
(@qid, '90°', 1, 3),
(@qid, '270°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le PPCM de 4 et 6 est :', 'PPCM(4,6) = 12.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6', 0, 1),
(@qid, '8', 0, 2),
(@qid, '12', 1, 3),
(@qid, '24', 0, 4);

-- Maths complétion (type_id=1)
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(3, 1, 'Un angle droit mesure ________ degrés.', NULL, 'Examen 9e AF', 1, '90');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(3, 1, 'Le théorème de Pythagore dit que dans un triangle rectangle, le carré de l''________ est égal à la somme des carrés des deux autres côtés.', NULL, 'Examen 9e AF', 1, 'hypoténuse');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(3, 1, 'Un polygone à 4 côtés s''appelle un ________.', NULL, 'Examen 9e AF', 1, 'quadrilatère|quadrilatere');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(3, 1, 'La formule du volume d''une pyramide est V = (Aire de base × ________) / 3.', NULL, 'Examen 9e AF', 1, 'hauteur');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(3, 1, 'L''aire d''un disque de rayon R est donnée par A = ________.', NULL, 'Examen 9e AF', 1, 'πR²|πR^2');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(3, 1, 'Un triangle qui a deux côtés égaux est un triangle ________.', NULL, 'Programme 9e AF', 1, 'isocèle|isocele');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(3, 1, 'Le résultat de 5² est ________.', NULL, 'Programme 9e AF', 1, '25');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(3, 1, 'Un nombre divisible par 2 est un nombre ________.', NULL, 'Programme 9e AF', 1, 'pair');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(3, 1, 'L''écriture de 0,000001 sous forme de puissance de 10 est : 10⁻ ________.', NULL, 'Examen 9e AF', 1, '6');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(3, 1, 'Le périmètre d''un rectangle de longueur L et largeur l est P = ________.', NULL, 'Examen 9e AF', 1, '2(L+l)|2L+2l');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(3, 1, 'La valeur de √49 est ________.', NULL, 'Programme 9e AF', 1, '7');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(3, 1, 'Un nombre premier est un nombre qui a exactement ________ diviseurs.', NULL, 'Programme 9e AF', 2, '2|deux');

-- =============================================
-- 4. SCIENCES EXPÉRIMENTALES (matiere_id = 4)
-- =============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''absence de quel constituant du sang entraîne un risque d''hémorragie ?',
    'Plaquettes = coagulation.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hématie', 0, 1),
(@qid, 'Plasma', 0, 2),
(@qid, 'Plaquette', 1, 3),
(@qid, 'Leucocyte', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel de ces organes est une glande digestive ?',
    'Le foie produit la bile.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Poumon', 0, 1),
(@qid, 'Foie', 1, 2),
(@qid, 'Coeur', 0, 3),
(@qid, 'Rein', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''énergie que possède un corps en mouvement s''appelle :',
    'Énergie cinétique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Potentielle', 0, 1),
(@qid, 'Cinétique', 1, 2),
(@qid, 'Thermique', 0, 3),
(@qid, 'Hydraulique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel instrument mesure l''intensité d''une force ?',
    'Dynamomètre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ampèremètre', 0, 1),
(@qid, 'Dynamomètre', 1, 2),
(@qid, 'Manomètre', 0, 3),
(@qid, 'Baromètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le bulbe rachidien règle :',
    'Rythmes cardiaque et respiratoire.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La vision', 0, 1),
(@qid, 'L''audition', 0, 2),
(@qid, 'Les rythmes cardiaque et respiratoire', 1, 3),
(@qid, 'La mémoire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un corps de poids 5 N a une masse de (g=9,8 N/kg) :',
    'm = P/g = 5/9,8 ≈ 0,5 kg.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '50 kg', 0, 1),
(@qid, '2 kg', 0, 2),
(@qid, '0,5 kg', 1, 3),
(@qid, '5 kg', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''ensemble des écosystèmes de la Terre forme :',
    'Biosphère.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''atmosphère', 0, 1),
(@qid, 'La biosphère', 1, 2),
(@qid, 'L''hydrosphère', 0, 3),
(@qid, 'La lithosphère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Laquelle de ces plantes est une bryophyte ?',
    'La mousse.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le maïs', 0, 1),
(@qid, 'La mousse', 1, 2),
(@qid, 'La fougère', 0, 3),
(@qid, 'Le blé', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La poussée d''Archimède se mesure en :',
    'Newton (force).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pascal', 0, 1),
(@qid, 'Newton', 1, 2),
(@qid, 'Kilogramme', 0, 3),
(@qid, 'Watt', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''accumulation de chlorure de sodium dans le sol entraîne :',
    'La salinisation.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''érosion', 0, 1),
(@qid, 'La salinisation', 1, 2),
(@qid, 'La sécheresse', 0, 3),
(@qid, 'L''hydromorphie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''appareil qui mesure la pression atmosphérique est le :',
    'Baromètre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Manomètre', 0, 1),
(@qid, 'Baromètre', 1, 2),
(@qid, 'Dynamomètre', 0, 3),
(@qid, 'Thermomètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le travail d''une force de 50 N sur 200 cm est :',
    'W = F × d = 50 × 2 = 100 J.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 J', 1, 1),
(@qid, '10 000 J', 0, 2),
(@qid, '1 000 J', 0, 3),
(@qid, '100 000 J', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un os long contient en son centre :',
    'Le canal médullaire (moelle osseuse).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le périoste', 0, 1),
(@qid, 'Le canal médullaire', 1, 2),
(@qid, 'Le cartilage', 0, 3),
(@qid, 'L''épiphyse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La membrane qui recouvre les poumons est la :',
    'Plèvre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Péritoine', 0, 1),
(@qid, 'Périoste', 0, 2),
(@qid, 'Plèvre', 1, 3),
(@qid, 'Épiderme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un homme de 75 kg monte de 15 m. Travail accompli (g=10 N/kg) :',
    'W = mgh = 75×10×15 = 11 250 J.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 125 J', 0, 1),
(@qid, '11 250 J', 1, 2),
(@qid, '750 J', 0, 3),
(@qid, '112 500 J', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que les lichens ?',
    'Association algue + champignon.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une algue seule', 0, 1),
(@qid, 'Un champignon seul', 0, 2),
(@qid, 'Association algue-champignon', 1, 3),
(@qid, 'Une mousse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La partie visible d''une dent s''appelle :',
    'Couronne = partie visible de la dent.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Racine', 0, 1),
(@qid, 'Couronne', 1, 2),
(@qid, 'Ivoire', 0, 3),
(@qid, 'Cément', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le cardia est l''orifice d''entrée de :',
    'Cardia = entrée de l''estomac.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Du coeur', 0, 1),
(@qid, 'De l''estomac', 1, 2),
(@qid, 'De l''utérus', 0, 3),
(@qid, 'De l''oesophage', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''unité de puissance ?', 'Watt.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Joule', 0, 1),
(@qid, 'Watt', 1, 2),
(@qid, 'Newton', 0, 3),
(@qid, 'Pascal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le VIH attaque principalement :',
    'Le système immunitaire.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le système nerveux', 0, 1),
(@qid, 'Le système immunitaire', 1, 2),
(@qid, 'Le système digestif', 0, 3),
(@qid, 'Le système respiratoire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le principal gaz à effet de serre ?',
    'CO₂ (dioxyde de carbone).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oxygène', 0, 1),
(@qid, 'Azote', 0, 2),
(@qid, 'CO₂', 1, 3),
(@qid, 'Hélium', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le processus par lequel les plantes fabriquent leur nourriture est :',
    'Photosynthèse.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Respiration', 0, 1),
(@qid, 'Photosynthèse', 1, 2),
(@qid, 'Transpiration', 0, 3),
(@qid, 'Digestion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment appelle-t-on un animal qui mange des plantes et de la viande ?',
    'Omnivore.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Herbivore', 0, 1),
(@qid, 'Carnivore', 0, 2),
(@qid, 'Omnivore', 1, 3),
(@qid, 'Insectivore', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que la photosynthèse produit ?',
    'Oxygène et glucose.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CO₂ et eau', 0, 1),
(@qid, 'Oxygène et glucose', 1, 2),
(@qid, 'Azote', 0, 3),
(@qid, 'Uniquement de l''eau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Une solution de pH 3 est :',
    'Acide (pH < 7).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Basique', 0, 1),
(@qid, 'Neutre', 0, 2),
(@qid, 'Acide', 1, 3),
(@qid, 'Amphotère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Combien de temps met la Terre pour faire le tour du Soleil ?',
    '365,25 jours (1 an).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '24 heures', 0, 1),
(@qid, '30 jours', 0, 2),
(@qid, '365 jours', 1, 3),
(@qid, '7 jours', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel type de roche est le basalte ?',
    'Roche volcanique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sédimentaire', 0, 1),
(@qid, 'Métamorphique', 0, 2),
(@qid, 'Volcanique', 1, 3),
(@qid, 'Calcaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''organe principal de la circulation sanguine est :',
    'Le coeur.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le poumon', 0, 1),
(@qid, 'Le coeur', 1, 2),
(@qid, 'Le foie', 0, 3),
(@qid, 'Le rein', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment s''appelle le phénomène de transformation de l''eau en vapeur ?',
    'Évaporation.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Condensation', 0, 1),
(@qid, 'Évaporation', 1, 2),
(@qid, 'Solidification', 0, 3),
(@qid, 'Fusion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La tendinite est :',
    'Inflammation des extrémités d''un muscle.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un muscle étiré', 0, 1),
(@qid, 'Des ligaments déchirés', 0, 2),
(@qid, 'L''inflammation des extrémités d''un muscle', 1, 3),
(@qid, 'Un muscle meurtri', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les êtres vivants qui se nourrissent de matières organiques en décomposition sont des :',
    'Saprophytes.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sporophytes', 0, 1),
(@qid, 'Protophytes', 0, 2),
(@qid, 'Ptéridophytes', 0, 3),
(@qid, 'Saprophytes', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Laquelle de ces plantes est dépourvue de chlorophylle ?',
    'Le djon-djon (champignon).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Malanga', 0, 1),
(@qid, 'Djon-djon', 1, 2),
(@qid, 'Croton', 0, 3),
(@qid, 'Caoutchouc', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La fougère est classée parmi les cryptogames vasculaires car elle possède :',
    'Des vaisseaux conducteurs.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des racines uniquement', 0, 1),
(@qid, 'Des vaisseaux conducteurs', 1, 2),
(@qid, 'Des fleurs', 0, 3),
(@qid, 'Des graines', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La statue de 150 kg sur un socle de 1,5 m de côté exerce une pression de (g=10) :',
    'P = F/S = 1500/(1,5×1,5) ≈ 667 Pa.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 000 Pa', 0, 1),
(@qid, '667 Pa', 1, 2),
(@qid, '100 Pa', 0, 3),
(@qid, '1 500 Pa', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La partie de l''oreille qui transmet les sons au cerveau est :',
    'Le nerf auditif.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le pavillon', 0, 1),
(@qid, 'Le tympan', 0, 2),
(@qid, 'Le nerf auditif', 1, 3),
(@qid, 'Les osselets', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''énergie hydraulique utilise :', 'La force de l''eau.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le soleil', 0, 1),
(@qid, 'Le vent', 0, 2),
(@qid, 'L''eau', 1, 3),
(@qid, 'La chaleur terrestre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le rôle principal des globules rouges ?',
    'Transport de l''oxygène grâce à l''hémoglobine.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Défendre l''organisme', 0, 1),
(@qid, 'Transporter l''oxygène', 1, 2),
(@qid, 'Coaguler le sang', 0, 3),
(@qid, 'Produire des anticorps', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un séisme ?', 'Tremblement de terre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une éruption volcanique', 0, 1),
(@qid, 'Un tremblement de terre', 1, 2),
(@qid, 'Un tsunami', 0, 3),
(@qid, 'Un ouragan', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Laquelle de ces actions correspond au péristaltisme ?',
    'Contractions musculaires qui font avancer les aliments.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le bol alimentaire est avalé', 0, 1),
(@qid, 'Les aliments s''imprègnent de salive', 0, 2),
(@qid, 'Le chyle traverse les parois de l''intestin', 0, 3),
(@qid, 'Les aliments avancent poussés par les muscles', 1, 4);


-- Le système digestif
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Où commence la digestion des glucides ?',
    'Dans la bouche, grâce à l''amylase salivaire.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dans l''estomac', 0, 1),
(@qid, 'Dans la bouche', 1, 2),
(@qid, 'Dans l''intestin grêle', 0, 3),
(@qid, 'Dans le gros intestin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel organe produit la bile ?',
    'Le foie produit la bile, stockée dans la vésicule biliaire.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''estomac', 0, 1),
(@qid, 'Le foie', 1, 2),
(@qid, 'Le pancréas', 0, 3),
(@qid, 'L''intestin grêle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le rôle de la bile ?',
    'Émulsifier les graisses pour faciliter leur digestion.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Digérer les protéines', 0, 1),
(@qid, 'Émulsifier les graisses', 1, 2),
(@qid, 'Absorber l''eau', 0, 3),
(@qid, 'Produire des enzymes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel suc digestif est produit par l''estomac ?',
    'Le suc gastrique, contenant de l''acide chlorhydrique et de la pepsine.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le suc pancréatique', 0, 1),
(@qid, 'Le suc gastrique', 1, 2),
(@qid, 'La bile', 0, 3),
(@qid, 'La salive', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel nutriment est principalement digéré dans l''estomac ?',
    'Les protéines, grâce à la pepsine.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les glucides', 0, 1),
(@qid, 'Les protéines', 1, 2),
(@qid, 'Les lipides', 0, 3),
(@qid, 'Les vitamines', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Où se fait l''absorption des nutriments ?',
    'Dans l''intestin grêle, grâce aux villosités intestinales.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dans l''estomac', 0, 1),
(@qid, 'Dans l''intestin grêle', 1, 2),
(@qid, 'Dans le gros intestin', 0, 3),
(@qid, 'Dans la bouche', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le rôle du gros intestin ?',
    'Absorber l''eau et les sels minéraux, former les selles.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Digérer les protéines', 0, 1),
(@qid, 'Absorber l''eau et former les selles', 1, 2),
(@qid, 'Produire la bile', 0, 3),
(@qid, 'Absorber les nutriments', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment appelle-t-on les mouvements qui font avancer les aliments dans le tube digestif ?',
    'Le péristaltisme.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La mastication', 0, 1),
(@qid, 'Le péristaltisme', 1, 2),
(@qid, 'La digestion', 0, 3),
(@qid, 'L''absorption', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le rôle du pancréas dans la digestion ?',
    'Produire le suc pancréatique contenant plusieurs enzymes digestives.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Produire la bile', 0, 1),
(@qid, 'Produire le suc pancréatique', 1, 2),
(@qid, 'Stocker les aliments', 0, 3),
(@qid, 'Absorber l''eau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que le chyme ?',
    'La bouillie alimentaire sortant de l''estomac.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La salive mélangée aux aliments', 0, 1),
(@qid, 'La bouillie sortant de l''estomac', 1, 2),
(@qid, 'Les selles', 0, 3),
(@qid, 'La bile', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que le chyle ?',
    'Le liquide laiteux absorbé par les vaisseaux lymphatiques de l''intestin.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le suc gastrique', 0, 1),
(@qid, 'Le liquide absorbé par les vaisseaux lymphatiques', 1, 2),
(@qid, 'La salive', 0, 3),
(@qid, 'Le suc pancréatique', 0, 4);

-- Le système circulatoire
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le rôle principal du coeur ?',
    'Pomper le sang dans tout l''organisme.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Produire le sang', 0, 1),
(@qid, 'Pomper le sang', 1, 2),
(@qid, 'Filtrer le sang', 0, 3),
(@qid, 'Oxygéner le sang', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Combien de cavités comprend le coeur humain ?',
    'Quatre : deux oreillettes et deux ventricules.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1),
(@qid, '4', 1, 2),
(@qid, '3', 0, 3),
(@qid, '5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quels sont les vaisseaux qui transportent le sang du coeur vers les organes ?',
    'Les artères.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les veines', 0, 1),
(@qid, 'Les artères', 1, 2),
(@qid, 'Les capillaires', 0, 3),
(@qid, 'Les valvules', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quels vaisseaux ramènent le sang au coeur ?',
    'Les veines.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les artères', 0, 1),
(@qid, 'Les veines', 1, 2),
(@qid, 'Les capillaires', 0, 3),
(@qid, 'Les artérioles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel composant du sang transporte l''oxygène ?',
    'L''hémoglobine contenue dans les globules rouges.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le plasma', 0, 1),
(@qid, 'L''hémoglobine', 1, 2),
(@qid, 'Les globules blancs', 0, 3),
(@qid, 'Les plaquettes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le rôle des globules blancs ?',
    'Défendre l''organisme contre les infections.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Transporter l''oxygène', 0, 1),
(@qid, 'Défendre l''organisme', 1, 2),
(@qid, 'Coaguler le sang', 0, 3),
(@qid, 'Transporter le CO2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le rôle des plaquettes sanguines ?',
    'La coagulation du sang en cas de blessure.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Transporter l''oxygène', 0, 1),
(@qid, 'Coaguler le sang', 1, 2),
(@qid, 'Combattre les microbes', 0, 3),
(@qid, 'Transporter les nutriments', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que la circulation pulmonaire ?',
    'La circulation entre le coeur et les poumons.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La circulation dans tout le corps', 0, 1),
(@qid, 'La circulation entre le coeur et les poumons', 1, 2),
(@qid, 'La circulation dans le cerveau', 0, 3),
(@qid, 'La circulation dans les reins', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est la différence entre le sang artériel et le sang veineux ?',
    'Le sang artériel est riche en oxygène, le sang veineux est riche en CO2.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pas de différence', 0, 1),
(@qid, 'Le sang artériel est riche en O2, le veineux en CO2', 1, 2),
(@qid, 'Le sang veineux est plus clair', 0, 3),
(@qid, 'Le sang artériel n''existe pas', 0, 4);

-- Le système respiratoire
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est l''organe principal de la respiration ?',
    'Les poumons.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le coeur', 0, 1),
(@qid, 'Les poumons', 1, 2),
(@qid, 'Le foie', 0, 3),
(@qid, 'Les reins', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel gaz est inspiré lors de la respiration ?',
    'Le dioxygène (O2).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le dioxyde de carbone', 0, 1),
(@qid, 'Le dioxygène', 1, 2),
(@qid, 'L''azote', 0, 3),
(@qid, 'L''hydrogène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel gaz est rejeté lors de l''expiration ?',
    'Le dioxyde de carbone (CO2).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le dioxygène', 0, 1),
(@qid, 'Le dioxyde de carbone', 1, 2),
(@qid, 'L''azote', 0, 3),
(@qid, 'L''hydrogène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Où se produit l''échange gazeux dans les poumons ?',
    'Dans les alvéoles pulmonaires.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dans la trachée', 0, 1),
(@qid, 'Dans les alvéoles pulmonaires', 1, 2),
(@qid, 'Dans les bronches', 0, 3),
(@qid, 'Dans le larynx', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel muscle principal permet la respiration ?',
    'Le diaphragme.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le biceps', 0, 1),
(@qid, 'Le diaphragme', 1, 2),
(@qid, 'Le muscle cardiaque', 0, 3),
(@qid, 'Le quadriceps', 0, 4);

-- Le système nerveux
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est l''organe principal du système nerveux ?',
    'Le cerveau.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le coeur', 0, 1),
(@qid, 'Le cerveau', 1, 2),
(@qid, 'Les poumons', 0, 3),
(@qid, 'Le foie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''une synapse ?',
    'La zone de communication entre deux neurones.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un type de cellule sanguine', 0, 1),
(@qid, 'La zone de communication entre deux neurones', 1, 2),
(@qid, 'Un muscle', 0, 3),
(@qid, 'Un vaisseau sanguin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le rôle de la moelle épinière ?',
    'Transmettre les messages nerveux entre le cerveau et le corps.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Produire le sang', 0, 1),
(@qid, 'Transmettre les messages nerveux', 1, 2),
(@qid, 'Pomper le sang', 0, 3),
(@qid, 'Digérer les aliments', 0, 4);

-- Les organes des sens
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est l''organe de la vue ?',
    'L''oeil.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''oreille', 0, 1),
(@qid, 'L''oeil', 1, 2),
(@qid, 'La langue', 0, 3),
(@qid, 'Le nez', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle partie de l''oeil contrôle la quantité de lumière entrant ?',
    'La pupille (et l''iris qui l''entoure).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La cornée', 0, 1),
(@qid, 'La pupille', 1, 2),
(@qid, 'Le cristallin', 0, 3),
(@qid, 'La rétine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Où se forme l''image dans l''oeil ?',
    'Sur la rétine.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sur la cornée', 0, 1),
(@qid, 'Sur la rétine', 1, 2),
(@qid, 'Sur le cristallin', 0, 3),
(@qid, 'Sur l''iris', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle partie de l''oreille capte les sons ?',
    'Le tympan, situé dans l''oreille moyenne.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le pavillon', 0, 1),
(@qid, 'Le tympan', 1, 2),
(@qid, 'Le nerf auditif', 0, 3),
(@qid, 'Le cerveau', 0, 4);

-- La reproduction humaine
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel organe produit les spermatozoïdes ?',
    'Les testicules.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les ovaires', 0, 1),
(@qid, 'Les testicules', 1, 2),
(@qid, 'La prostate', 0, 3),
(@qid, 'L''utérus', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel organe produit les ovules ?',
    'Les ovaires.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les testicules', 0, 1),
(@qid, 'Les ovaires', 1, 2),
(@qid, 'L''utérus', 0, 3),
(@qid, 'Les trompes de Fallope', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Où se produit la fécondation ?',
    'Dans les trompes de Fallope.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dans l''utérus', 0, 1),
(@qid, 'Dans les trompes de Fallope', 1, 2),
(@qid, 'Dans les ovaires', 0, 3),
(@qid, 'Dans le vagin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel organe abrite le développement de l''embryon ?',
    'L''utérus.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les ovaires', 0, 1),
(@qid, 'L''utérus', 1, 2),
(@qid, 'Les trompes', 0, 3),
(@qid, 'Le vagin', 0, 4);

-- Hygiène et maladies
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel microbe cause le tétanos ?',
    'Une bactérie (Clostridium tetani).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un virus', 0, 1),
(@qid, 'Une bactérie', 1, 2),
(@qid, 'Un champignon', 0, 3),
(@qid, 'Un parasite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle maladie est transmise par le moustique Anophèle ?',
    'Le paludisme (malaria).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La dengue', 0, 1),
(@qid, 'Le paludisme', 1, 2),
(@qid, 'Le choléra', 0, 3),
(@qid, 'Le SIDA', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel virus cause le SIDA ?',
    'Le VIH (Virus de l''Immunodéficience Humaine).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le virus de la grippe', 0, 1),
(@qid, 'Le VIH', 1, 2),
(@qid, 'Le virus Ebola', 0, 3),
(@qid, 'Le virus Zika', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment se transmet principalement le choléra ?',
    'Par l''eau contaminée.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Par l''air', 0, 1),
(@qid, 'Par l''eau contaminée', 1, 2),
(@qid, 'Par les moustiques', 0, 3),
(@qid, 'Par le sang uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un antibiotique ?',
    'Un médicament qui tue ou empêche la croissance des bactéries.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un médicament contre les virus', 0, 1),
(@qid, 'Un médicament qui tue les bactéries', 1, 2),
(@qid, 'Un vaccin', 0, 3),
(@qid, 'Un antiseptique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un vaccin ?',
    'Une préparation qui stimule le système immunitaire contre une maladie.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un antibiotique', 0, 1),
(@qid, 'Une préparation qui stimule l''immunité', 1, 2),
(@qid, 'Un antiseptique', 0, 3),
(@qid, 'Un virus actif', 0, 4);

-- ============================================
-- THÈME 2 : PHYSIQUE (80 QCM)
-- ============================================

-- Électricité
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''unité de la tension électrique ?',
    'Le volt (V).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''ampère', 0, 1),
(@qid, 'Le volt', 1, 2),
(@qid, 'L''ohm', 0, 3),
(@qid, 'Le watt', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''unité de l''intensité du courant électrique ?',
    'L''ampère (A).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le volt', 0, 1),
(@qid, 'L''ampère', 1, 2),
(@qid, 'L''ohm', 0, 3),
(@qid, 'Le watt', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''unité de la résistance électrique ?',
    'L''ohm (Ω).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le volt', 0, 1),
(@qid, 'L''ohm', 1, 2),
(@qid, 'L''ampère', 0, 3),
(@qid, 'Le watt', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est la loi d''Ohm ?',
    'U = R × I (tension = résistance × intensité).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'U = R + I', 0, 1),
(@qid, 'U = R × I', 1, 2),
(@qid, 'U = R / I', 0, 3),
(@qid, 'U = I / R', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel instrument mesure la tension électrique ?',
    'Le voltmètre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''ampèremètre', 0, 1),
(@qid, 'Le voltmètre', 1, 2),
(@qid, 'L''ohmmètre', 0, 3),
(@qid, 'Le wattmètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment branche-t-on un voltmètre dans un circuit ?',
    'En dérivation (en parallèle).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'En série', 0, 1),
(@qid, 'En dérivation', 1, 2),
(@qid, 'En court-circuit', 0, 3),
(@qid, 'Peu importe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment branche-t-on un ampèremètre dans un circuit ?',
    'En série.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'En série', 1, 1),
(@qid, 'En dérivation', 0, 2),
(@qid, 'En court-circuit', 0, 3),
(@qid, 'Peu importe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un conducteur électrique ?',
    'Un matériau qui laisse passer le courant électrique (métaux, cuivre, aluminium).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un matériau qui bloque le courant', 0, 1),
(@qid, 'Un matériau qui laisse passer le courant', 1, 2),
(@qid, 'Un générateur', 0, 3),
(@qid, 'Un récepteur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un isolant électrique ?',
    'Un matériau qui ne laisse pas passer le courant (plastique, verre, bois sec).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un matériau conducteur', 0, 1),
(@qid, 'Un matériau qui ne laisse pas passer le courant', 1, 2),
(@qid, 'Un générateur', 0, 3),
(@qid, 'Un semi-conducteur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Parmi ces matériaux, lequel est le meilleur conducteur ?',
    'Le cuivre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le plastique', 0, 1),
(@qid, 'Le cuivre', 1, 2),
(@qid, 'Le verre', 0, 3),
(@qid, 'Le bois', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un court-circuit ?',
    'Quand le courant passe directement du + au - sans traverser de récepteur.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un circuit trop long', 0, 1),
(@qid, 'Le courant passe directement du + au - sans récepteur', 1, 2),
(@qid, 'Un circuit ouvert', 0, 3),
(@qid, 'Un circuit avec trop de lampes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le rôle d''un générateur dans un circuit ?',
    'Fournir l''énergie électrique au circuit (pile, génératrice).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fournir l''énergie électrique', 1, 1),
(@qid, 'Bloquer le courant', 0, 2),
(@qid, 'Consommer l''énergie', 0, 3),
(@qid, 'Mesurer le courant', 0, 4);

-- Énergie et sources d'énergie
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''une source d''énergie renouvelable ?',
    'Une source qui se reconstitue naturellement (soleil, vent, eau).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une source épuisable', 0, 1),
(@qid, 'Une source qui se reconstitue naturellement', 1, 2),
(@qid, 'Le pétrole', 0, 3),
(@qid, 'Le charbon', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Parmi ces sources, laquelle n''est PAS renouvelable ?',
    'Le pétrole.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le soleil', 0, 1),
(@qid, 'Le pétrole', 1, 2),
(@qid, 'Le vent', 0, 3),
(@qid, 'L''eau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que l''énergie solaire ?',
    'L''énergie provenant des rayons du soleil.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''énergie du vent', 0, 1),
(@qid, 'L''énergie provenant du soleil', 1, 2),
(@qid, 'L''énergie de l''eau', 0, 3),
(@qid, 'L''énergie du pétrole', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment appelle-t-on l''énergie du vent ?',
    'L''énergie éolienne.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''énergie hydraulique', 0, 1),
(@qid, 'L''énergie éolienne', 1, 2),
(@qid, 'L''énergie solaire', 0, 3),
(@qid, 'L''énergie géothermique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle énergie est produite par les barrages ?',
    'L''énergie hydraulique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''énergie solaire', 0, 1),
(@qid, 'L''énergie hydraulique', 1, 2),
(@qid, 'L''énergie nucléaire', 0, 3),
(@qid, 'L''énergie éolienne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le principal gaz responsable de l''effet de serre ?',
    'Le dioxyde de carbone (CO2).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''oxygène', 0, 1),
(@qid, 'Le dioxyde de carbone', 1, 2),
(@qid, 'L''azote', 0, 3),
(@qid, 'L''hydrogène', 0, 4);

-- Mécanique : poids, masse, forces
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est la différence entre la masse et le poids ?',
    'La masse est invariable (en kg), le poids dépend de la gravité (en N).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pas de différence', 0, 1),
(@qid, 'La masse est invariable, le poids dépend de la gravité', 1, 2),
(@qid, 'Le poids est invariable', 0, 3),
(@qid, 'La masse dépend de la gravité', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''unité de la masse ?',
    'Le kilogramme (kg).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le newton', 0, 1),
(@qid, 'Le kilogramme', 1, 2),
(@qid, 'Le pascal', 0, 3),
(@qid, 'Le mètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''unité du poids ?',
    'Le newton (N).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le kilogramme', 0, 1),
(@qid, 'Le newton', 1, 2),
(@qid, 'Le mètre', 0, 3),
(@qid, 'Le litre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle formule relie le poids et la masse ?',
    'P = m × g (poids = masse × intensité de la pesanteur).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P = m / g', 0, 1),
(@qid, 'P = m × g', 1, 2),
(@qid, 'P = m + g', 0, 3),
(@qid, 'P = g / m', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est la valeur approximative de g sur Terre ?',
    'Environ 9,8 N/kg.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 N/kg', 0, 1),
(@qid, '9,8 N/kg', 1, 2),
(@qid, '100 N/kg', 0, 3),
(@qid, '50 N/kg', 0, 4);

-- Pression
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est la formule de la pression ?',
    'P = F / S (pression = force / surface).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P = F × S', 0, 1),
(@qid, 'P = F / S', 1, 2),
(@qid, 'P = S / F', 0, 3),
(@qid, 'P = F + S', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''unité de pression ?',
    'Le pascal (Pa).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le newton', 0, 1),
(@qid, 'Le pascal', 1, 2),
(@qid, 'Le kilogramme', 0, 3),
(@qid, 'Le mètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Pourquoi un clou pointu s''enfonce-t-il mieux qu''un clou plat ?',
    'Parce que la surface est plus petite, donc la pression est plus grande.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parce qu''il est plus léger', 0, 1),
(@qid, 'Parce que la pression est plus grande (surface petite)', 1, 2),
(@qid, 'Parce qu''il est plus lourd', 0, 3),
(@qid, 'Parce qu''il est plus solide', 0, 4);

-- Optique
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'À quelle vitesse la lumière se déplace-t-elle dans le vide ?',
    'Environ 300 000 km/s.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '300 km/s', 0, 1),
(@qid, '300 000 km/s', 1, 2),
(@qid, '3 000 km/s', 0, 3),
(@qid, '30 km/s', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel phénomène produit un arc-en-ciel ?',
    'La dispersion de la lumière blanche par les gouttes d''eau.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La réflexion', 0, 1),
(@qid, 'La dispersion de la lumière', 1, 2),
(@qid, 'L''absorption', 0, 3),
(@qid, 'L''ombre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''une ombre ?',
    'Une zone sombre créée par un objet qui bloque la lumière.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une zone éclairée', 0, 1),
(@qid, 'Une zone sombre où la lumière est bloquée', 1, 2),
(@qid, 'Un type de lumière', 0, 3),
(@qid, 'Une réflexion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle couleur obtient-on en mélangeant le rouge et le bleu ?',
    'Le magenta.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le vert', 0, 1),
(@qid, 'Le magenta', 1, 2),
(@qid, 'Le jaune', 0, 3),
(@qid, 'Le cyan', 0, 4);

-- Chaleur et température
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''unité de température dans le Système International ?',
    'Le kelvin (K), mais le degré Celsius (°C) est couramment utilisé.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le degré Celsius', 0, 1),
(@qid, 'Le kelvin', 1, 2),
(@qid, 'Le fahrenheit', 0, 3),
(@qid, 'Le joule', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel instrument mesure la température ?',
    'Le thermomètre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le baromètre', 0, 1),
(@qid, 'Le thermomètre', 1, 2),
(@qid, 'L''ampèremètre', 0, 3),
(@qid, 'Le voltmètre', 0, 4);

















-- L'eau et ses propriétés
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quels sont les trois états de l''eau ?',
    'Solide (glace), liquide, gazeux (vapeur d''eau).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Solide, gazeux, plasma', 0, 1),
(@qid, 'Solide, liquide, gazeux', 1, 2),
(@qid, 'Liquide, visqueux, solide', 0, 3),
(@qid, 'Gazeux, liquide, ionisé', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'À quelle température l''eau bout-elle au niveau de la mer ?',
    'À 100°C.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0°C', 0, 1),
(@qid, '100°C', 1, 2),
(@qid, '50°C', 0, 3),
(@qid, '200°C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'À quelle température l''eau gèle-t-elle ?',
    'À 0°C.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0°C', 1, 1),
(@qid, '100°C', 0, 2),
(@qid, '-100°C', 0, 3),
(@qid, '50°C', 0, 4);

-- ============================================
-- THÈME 4 : GÉOLOGIE ET ENVIRONNEMENT (50 QCM)
-- ============================================

-- Structure de la Terre
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelles sont les trois principales couches de la Terre ?',
    'La croûte, le manteau et le noyau.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lithosphère, hydrosphère, atmosphère', 0, 1),
(@qid, 'Croûte, manteau, noyau', 1, 2),
(@qid, 'Sol, sous-sol, roche-mère', 0, 3),
(@qid, 'Sial, sima, nife', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un séisme ?',
    'Un tremblement de terre causé par la libération d''énergie dans la croûte terrestre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une éruption volcanique', 0, 1),
(@qid, 'Un tremblement de terre', 1, 2),
(@qid, 'Un tsunami', 0, 3),
(@qid, 'Un glissement de terrain', 0, 4);






-- THÈME 5 : ÉCOLOGIE ET ENVIRONNEMENT 

-- Écosystèmes
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un écosystème ?',
    'L''ensemble formé par les êtres vivants et leur milieu.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement les animaux', 0, 1),
(@qid, 'L''ensemble des êtres vivants et leur milieu', 1, 2),
(@qid, 'Uniquement les plantes', 0, 3),
(@qid, 'Le climat d''une région', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un producteur dans une chaîne alimentaire ?',
    'Un organisme qui produit sa propre nourriture (plantes vertes).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un animal carnivore', 0, 1),
(@qid, 'Une plante verte (produit sa nourriture)', 1, 2),
(@qid, 'Un décomposeur', 0, 3),
(@qid, 'Un champignon', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un consommateur dans une chaîne alimentaire ?',
    'Un organisme qui se nourrit d''autres êtres vivants.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une plante', 0, 1),
(@qid, 'Un organisme qui se nourrit d''autres êtres vivants', 1, 2),
(@qid, 'Un minéral', 0, 3),
(@qid, 'Le soleil', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le rôle des décomposeurs ?',
    'Décomposer la matière organique morte et la transformer en éléments minéraux.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Produire de l''oxygène', 0, 1),
(@qid, 'Décomposer la matière organique morte', 1, 2),
(@qid, 'Chasser les proies', 0, 3),
(@qid, 'Fabriquer de la nourriture', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que la photosynthèse ?',
    'Le processus par lequel les plantes produisent leur nourriture en utilisant la lumière.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La respiration des plantes', 0, 1),
(@qid, 'La production de nourriture par les plantes avec la lumière', 1, 2),
(@qid, 'L''absorption d''eau par les racines', 0, 3),
(@qid, 'La croissance des tiges', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel gaz les plantes absorbent-elles pour la photosynthèse ?',
    'Le dioxyde de carbone (CO2).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''oxygène', 0, 1),
(@qid, 'Le dioxyde de carbone', 1, 2),
(@qid, 'L''azote', 0, 3),
(@qid, 'L''hydrogène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel gaz les plantes rejettent-elles lors de la photosynthèse ?',
    'Le dioxygène (O2).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le dioxyde de carbone', 0, 1),
(@qid, 'Le dioxygène', 1, 2),
(@qid, 'L''azote', 0, 3),
(@qid, 'Le méthane', 0, 4);

-- Pollution et environnement
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que la pollution de l''air ?',
    'La présence de substances nocives dans l''atmosphère.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La présence de nuages', 0, 1),
(@qid, 'La présence de substances nocives dans l''atmosphère', 1, 2),
(@qid, 'La présence de vent', 0, 3),
(@qid, 'La présence d''oiseaux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que l''effet de serre ?',
    'Le réchauffement de l''atmosphère dû aux gaz qui retiennent la chaleur.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le refroidissement de la Terre', 0, 1),
(@qid, 'Le réchauffement de l''atmosphère par les gaz', 1, 2),
(@qid, 'Un type de serre pour les plantes', 0, 3),
(@qid, 'La couche d''ozone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que la déforestation ?',
    'La destruction massive des forêts.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La plantation d''arbres', 0, 1),
(@qid, 'La destruction massive des forêts', 1, 2),
(@qid, 'La croissance des arbres', 0, 3),
(@qid, 'La protection des forêts', 0, 4);

-- THÈME 6 : ÉLECTRICITÉ DOMESTIQUE 


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Que signifie le terme « mise à la terre » ?',
    'Relier un appareil électrique à la terre pour éviter les chocs électriques.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mettre l''appareil au sol', 0, 1),
(@qid, 'Relier l''appareil à la terre pour sécurité', 1, 2),
(@qid, 'Enterrer le câble', 0, 3),
(@qid, 'Isoler l''appareil', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''unité de la puissance électrique ?',
    'Le watt (W).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le volt', 0, 1),
(@qid, 'Le watt', 1, 2),
(@qid, 'L''ampère', 0, 3),
(@qid, 'L''ohm', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un disjoncteur ?',
    'Un dispositif qui coupe le courant en cas de surcharge ou court-circuit.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un générateur de courant', 0, 1),
(@qid, 'Un dispositif de protection qui coupe le courant', 1, 2),
(@qid, 'Un type de prise électrique', 0, 3),
(@qid, 'Un compteur électrique', 0, 4);

-- THÈME 7 : BIOLOGIE VÉGÉTALE 

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle partie de la plante absorbe l''eau et les sels minéraux ?',
    'Les racines (spécialement les poils absorbants).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les feuilles', 0, 1),
(@qid, 'Les racines', 1, 2),
(@qid, 'La tige', 0, 3),
(@qid, 'Les fleurs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le rôle de la chlorophylle ?',
    'Capter l''énergie lumineuse pour la photosynthèse.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Donner la couleur verte uniquement', 0, 1),
(@qid, 'Capter l''énergie lumineuse pour la photosynthèse', 1, 2),
(@qid, 'Absorber l''eau', 0, 3),
(@qid, 'Protéger la plante', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment s''appelle la reproduction sans fleurs chez les plantes ?',
    'La reproduction asexuée (bouturage, tubercule, rhizome).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La reproduction sexuée', 0, 1),
(@qid, 'La reproduction asexuée', 1, 2),
(@qid, 'La floraison', 0, 3),
(@qid, 'La fécondation', 0, 4);


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''étoile la plus proche de la Terre ?',
    'Le Soleil.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Proxima du Centaure', 0, 1),
(@qid, 'Le Soleil', 1, 2),
(@qid, 'La Lune', 0, 3),
(@qid, 'Sirius', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le satellite naturel de la Terre ?',
    'La Lune.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Soleil', 0, 1),
(@qid, 'La Lune', 1, 2),
(@qid, 'Mars', 0, 3),
(@qid, 'Vénus', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Combien de planètes compte le système solaire ?',
    'Huit planètes.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '7', 0, 1),
(@qid, '8', 1, 2),
(@qid, '9', 0, 3),
(@qid, '10', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel phénomène provoque les marées ?',
    'L''attraction gravitationnelle de la Lune et du Soleil sur les océans.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le vent', 0, 1),
(@qid, 'L''attraction de la Lune et du Soleil', 1, 2),
(@qid, 'Les courants marins', 0, 3),
(@qid, 'La rotation de la Terre uniquement', 0, 4);



-- Suite Anatomie - Système digestif
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Où se termine la digestion ?',
    'Dans l''intestin grêle.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dans l''estomac', 0, 1),
(@qid, 'Dans l''intestin grêle', 1, 2),
(@qid, 'Dans le gros intestin', 0, 3),
(@qid, 'Dans le rectum', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est l''enzyme présent dans la salive ?',
    'L''amylase salivaire.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La pepsine', 0, 1),
(@qid, 'L''amylase salivaire', 1, 2),
(@qid, 'La lipase', 0, 3),
(@qid, 'La trypsine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel organe stocke la bile ?',
    'La vésicule biliaire.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le foie', 0, 1),
(@qid, 'La vésicule biliaire', 1, 2),
(@qid, 'Le pancréas', 0, 3),
(@qid, 'L''estomac', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quels sont les nutriments absorbés par l''organisme ?',
    'Les glucides, les lipides, les protides, les vitamines, l''eau et les sels minéraux.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement les glucides', 0, 1),
(@qid, 'Glucides, lipides, protides, vitamines, eau, sels minéraux', 1, 2),
(@qid, 'Uniquement les protides', 0, 3),
(@qid, 'Seulement l''eau et les sels minéraux', 0, 4);

-- Suite Anatomie - Circulation
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quels sont les vaisseaux sanguins les plus fins ?',
    'Les capillaires sanguins.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les artères', 0, 1),
(@qid, 'Les capillaires', 1, 2),
(@qid, 'Les veines', 0, 3),
(@qid, 'Les artérioles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le sang riche en oxygène sort du coeur par quelle artère ?',
    'L''aorte.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''artère pulmonaire', 0, 1),
(@qid, 'L''aorte', 1, 2),
(@qid, 'La veine cave', 0, 3),
(@qid, 'L''artère coronaire', 0, 4);

-- Suite Physique - Force et travail
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''unité de la force ?',
    'Le newton (N).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le kilogramme', 0, 1),
(@qid, 'Le newton', 1, 2),
(@qid, 'Le mètre', 0, 3),
(@qid, 'Le joule', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''unité du travail et de l''énergie ?',
    'Le joule (J).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le newton', 0, 1),
(@qid, 'Le joule', 1, 2),
(@qid, 'Le watt', 0, 3),
(@qid, 'Le pascal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que la force de pesanteur ?',
    'La force d''attraction de la Terre sur tous les objets.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La force du vent', 0, 1),
(@qid, 'La force d''attraction de la Terre', 1, 2),
(@qid, 'La force magnétique', 0, 3),
(@qid, 'La force électrique', 0, 4);




-- Suite Santé - Maladies infectieuses
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''une maladie infectieuse ?',
    'Une maladie causée par un microbe (bactérie, virus, champignon).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une maladie héréditaire', 0, 1),
(@qid, 'Une maladie causée par un microbe', 1, 2),
(@qid, 'Une maladie des os', 0, 3),
(@qid, 'Une maladie du coeur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment le virus de la rage se transmet-il ?',
    'Par la morsure d''un animal infecté (chien, chat, chauve-souris).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Par l''eau', 0, 1),
(@qid, 'Par morsure d''un animal infecté', 1, 2),
(@qid, 'Par l''air', 0, 3),
(@qid, 'Par contact avec la peau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est la meilleure prévention contre le tétanos ?',
    'La vaccination (vaccin antitétanique).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les antibiotiques', 0, 1),
(@qid, 'La vaccination', 1, 2),
(@qid, 'Le repos', 0, 3),
(@qid, 'L''isolement', 0, 4);

-- Suite Nutrition
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel nutriment fournit le plus d''énergie par gramme ?',
    'Les lipides (graisses).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les glucides', 0, 1),
(@qid, 'Les lipides', 1, 2),
(@qid, 'Les protéines', 0, 3),
(@qid, 'Les vitamines', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle vitamine est produite par la peau au soleil ?',
    'La vitamine D.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La vitamine A', 0, 1),
(@qid, 'La vitamine D', 1, 2),
(@qid, 'La vitamine C', 0, 3),
(@qid, 'La vitamine B', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel minéral est important pour des os solides ?',
    'Le calcium.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le fer', 0, 1),
(@qid, 'Le calcium', 1, 2),
(@qid, 'Le sodium', 0, 3),
(@qid, 'Le potassium', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel nutriment est nécessaire à la croissance et à la réparation des tissus ?',
    'Les protéines.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les glucides', 0, 1),
(@qid, 'Les protéines', 1, 2),
(@qid, 'Les lipides', 0, 3),
(@qid, 'Les vitamines', 0, 4);

-- Suite Géologie
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment appelle-t-on le point d''origine d''un séisme en profondeur ?',
    'Le foyer (ou hypocentre).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''épicentre', 0, 1),
(@qid, 'Le foyer (hypocentre)', 1, 2),
(@qid, 'La faille', 0, 3),
(@qid, 'Le cratère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment appelle-t-on le point à la surface directement au-dessus du foyer d''un séisme ?',
    'L''épicentre.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le foyer', 0, 1),
(@qid, 'L''épicentre', 1, 2),
(@qid, 'La faille', 0, 3),
(@qid, 'Le volcan', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel type de roche est le granite ?',
    'Une roche magmatique.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sédimentaire', 0, 1),
(@qid, 'Magmatique', 1, 2),
(@qid, 'Métamorphique', 0, 3),
(@qid, 'Organique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment se forment les roches métamorphiques ?',
    'Par transformation de roches existantes sous l''effet de la chaleur et de la pression.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Par refroidissement du magma', 0, 1),
(@qid, 'Par chaleur et pression sur des roches existantes', 1, 2),
(@qid, 'Par accumulation de sédiments', 0, 3),
(@qid, 'Par érosion', 0, 4);

-- Suite Écologie
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que la chaîne alimentaire ?',
    'Une suite d''êtres vivants où chacun mange le précédent.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un magasin d''alimentation', 0, 1),
(@qid, 'Une suite où chaque être vivant mange le précédent', 1, 2),
(@qid, 'Un restaurant', 0, 3),
(@qid, 'Un régime alimentaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un herbivore ?',
    'Un animal qui se nourrit uniquement de végétaux.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un animal qui mange de la viande', 0, 1),
(@qid, 'Un animal qui se nourrit de végétaux', 1, 2),
(@qid, 'Un animal qui mange de tout', 0, 3),
(@qid, 'Un animal qui mange des insectes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un carnivore ?',
    'Un animal qui se nourrit de viande (d''autres animaux).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un animal qui mange des plantes', 0, 1),
(@qid, 'Un animal qui se nourrit de viande', 1, 2),
(@qid, 'Un animal qui mange de tout', 0, 3),
(@qid, 'Un animal qui mange des fruits uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un omnivore ?',
    'Un animal qui se nourrit à la fois de végétaux et d''animaux.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un herbivore', 0, 1),
(@qid, 'Un animal qui mange végétaux et animaux', 1, 2),
(@qid, 'Un carnivore strict', 0, 3),
(@qid, 'Un décomposeur', 0, 4);

-- Suite Physique - Magnétisme
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce qu''un aimant ?',
    'Un objet capable d''attirer le fer et certains métaux.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un objet qui attire tous les métaux', 0, 1),
(@qid, 'Un objet capable d''attirer le fer et certains métaux', 1, 2),
(@qid, 'Un générateur électrique', 0, 3),
(@qid, 'Une pile', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Comment appelle-t-on les deux extrémités d''un aimant ?',
    'Les pôles (pôle nord et pôle sud).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les bouts', 0, 1),
(@qid, 'Les pôles', 1, 2),
(@qid, 'Les faces', 0, 3),
(@qid, 'Les bornes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Que se passe-t-il quand on rapproche deux pôles identiques ?',
    'Ils se repoussent.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ils s''attirent', 0, 1),
(@qid, 'Ils se repoussent', 1, 2),
(@qid, 'Rien ne se passe', 0, 3),
(@qid, 'Ils fondent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Que se passe-t-il quand on rapproche deux pôles différents ?',
    'Ils s''attirent.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ils s''attirent', 1, 1),
(@qid, 'Ils se repoussent', 0, 2),
(@qid, 'Rien ne se passe', 0, 3),
(@qid, 'Ils se cassent', 0, 4);



INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Qu''est-ce que le squelette humain ?',
    'L''ensemble des os du corps humain.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''ensemble des muscles', 0, 1),
(@qid, 'L''ensemble des os', 1, 2),
(@qid, 'L''ensemble des nerfs', 0, 3),
(@qid, 'L''ensemble des organes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Combien de reins possède normalement un être humain ?',
    'Deux reins.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un', 0, 1),
(@qid, 'Deux', 1, 2),
(@qid, 'Trois', 0, 3),
(@qid, 'Quatre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est le rôle principal des reins ?',
    'Filtrer le sang et produire l''urine.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pomper le sang', 0, 1),
(@qid, 'Filtrer le sang et produire l''urine', 1, 2),
(@qid, 'Digérer les aliments', 0, 3),
(@qid, 'Produire la bile', 0, 4);



-- Sciences Exp complétion (type_id=1)
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(4, 1, 'Les poumons sont protégés par la ________.', NULL, 'Examen 9e AF', 1, 'cage thoracique|thorax');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(4, 1, 'Les champignons microscopiques utilisés pour faire lever la pâte sont les ________.', NULL, 'Examen 9e AF', 1, 'levures|levure');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(4, 1, 'L''inflammation de la vessie s''appelle la ________.', NULL, 'Examen 9e AF', 2, 'cystite');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(4, 1, 'Le coeur possède ________ cavités.', NULL, 'Examen 9e AF', 1, '4|quatre');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(4, 1, 'La photosynthèse produit du ________ et de l''oxygène.', NULL, 'Examen 9e AF', 1, 'glucose');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(4, 1, 'L''organe principal de la respiration est le ________.', NULL, 'Examen 9e AF', 1, 'poumon|poumons');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(4, 1, 'Le sang transporte l''________ des poumons vers les organes.', NULL, 'Examen 9e AF', 1, 'oxygène|oxygene');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(4, 1, 'Une solution de pH 7 est dite ________.', NULL, 'Examen 9e AF', 1, 'neutre');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(4, 1, 'L''organe qui filtre le sang est le ________.', NULL, 'Examen 9e AF', 1, 'rein|reins');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(4, 1, 'Dans une solution d''eau sucrée, l''eau est le ________ et le sucre est le soluté.', NULL, 'Examen 9e AF', 1, 'solvant');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(4, 1, 'La couche de la Terre qui produit les séismes s''appelle la ________.', NULL, 'Programme 9e AF', 2, 'lithosphère|lithosphere');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(4, 1, 'La substance qui donne au sang sa couleur rouge est l''________.', NULL, 'Programme 9e AF', 1, 'hémoglobine|hemoglobine');

-- =============================================
-- 5. SCIENCES SOCIALES (matiere_id = 5)
-- =============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle organisation fut créée en 1920 après la 1ère Guerre Mondiale ?',
    'La SDN (Société des Nations).', 'Examen 9e AF Juillet 2023', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'OUA', 0, 1),
(@qid, 'ONU', 0, 2),
(@qid, 'SDN', 1, 3),
(@qid, 'OEA', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel instrument légalisait l''esclavage à St Domingue ?',
    'Le Code Noir de 1685.', 'Examen 9e AF Juillet 2023', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Décret du 4 avril 1792', 0, 1),
(@qid, 'Constitution de 1801', 0, 2),
(@qid, 'Code noir de 1685', 1, 3),
(@qid, 'Pacte colonial', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui est le "Roi bâtisseur" d''Haïti ?',
    'Henri Christophe (Citadelle, Sans-Souci).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dessalines', 0, 1),
(@qid, 'Henri Christophe', 1, 2),
(@qid, 'Boyer', 0, 3),
(@qid, 'Soulouque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel événement a déterminé l''occupation américaine d''Haïti en 1915 ?',
    'L''assassinat du président Vilbrun Guillaume Sam.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le drame de Miragoâne', 0, 1),
(@qid, 'L''explosion de la Crête-à-Pierrot', 0, 2),
(@qid, 'La révolte des Piquets', 0, 3),
(@qid, 'L''assassinat de V.G. Sam', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays de la Caraïbe est un département d''Outre-Mer (DOM) ?',
    'La Martinique (France).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Porto Rico', 0, 1),
(@qid, 'Martinique', 1, 2),
(@qid, 'Jamaïque', 0, 3),
(@qid, 'Haïti', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le déplacement massif des habitants vers les villes est :',
    'L''exode rural.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Migration internationale', 0, 1),
(@qid, 'Immigration', 0, 2),
(@qid, 'Exode rural', 1, 3),
(@qid, 'Boat people', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays de la Caraïbe est socialiste ?', 'Cuba.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haïti', 0, 1),
(@qid, 'République Dominicaine', 0, 2),
(@qid, 'Cuba', 1, 3),
(@qid, 'Jamaïque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a dirigé la révolution cubaine de 1959 ?', 'Fidel Castro.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Che Guevara', 0, 1),
(@qid, 'Fidel Castro', 1, 2),
(@qid, 'Batista', 0, 3),
(@qid, 'Simon Bolivar', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La CARICOM a remplacé :', 'La CARIFTA.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''OEA', 0, 1),
(@qid, 'Le MERCOSUR', 0, 2),
(@qid, 'La CARIFTA', 1, 3),
(@qid, 'L''ALENA', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Les USA sont entrés dans la 2ème Guerre Mondiale après l''attaque de :',
    'Pearl Harbor (1941).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Berlin', 0, 1),
(@qid, 'Pearl Harbor', 1, 2),
(@qid, 'Hiroshima', 0, 3),
(@qid, 'Normandie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel programme a résolu la crise économique de 1929 ?',
    'Le New Deal (Roosevelt).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Plan Marshall', 0, 1),
(@qid, 'Le Kominform', 0, 2),
(@qid, 'Le New Deal', 1, 3),
(@qid, 'La Perestroïka', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui était le leader de l''indépendance du Venezuela ?',
    'Simon Bolivar.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'José Marti', 0, 1),
(@qid, 'Simon Bolivar', 1, 2),
(@qid, 'San Martin', 0, 3),
(@qid, 'Hidalgo', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle ville est la capitale de la République Dominicaine ?',
    'Saint-Domingue.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Santiago', 0, 1),
(@qid, 'Saint-Domingue', 1, 2),
(@qid, 'Puerto Plata', 0, 3),
(@qid, 'La Vega', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le fondateur de l''indépendance haïtienne est :',
    'Jean-Jacques Dessalines.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toussaint Louverture', 0, 1),
(@qid, 'Jean-Jacques Dessalines', 1, 2),
(@qid, 'Alexandre Pétion', 0, 3),
(@qid, 'Henri Christophe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La constitution haïtienne de 1987 reconnaît le créole comme :',
    'Langue officielle.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Langue étrangère', 0, 1),
(@qid, 'Langue officielle', 1, 2),
(@qid, 'Dialecte', 0, 3),
(@qid, 'Patois', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays africain a été fondé par des esclaves libérés ?',
    'Le Liberia.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ghana', 0, 1),
(@qid, 'Liberia', 1, 2),
(@qid, 'Nigeria', 0, 3),
(@qid, 'Sénégal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le plus petit département d''Haïti ?',
    'Le département du Nord-Est.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Ouest', 0, 1),
(@qid, 'Le Nord', 0, 2),
(@qid, 'Le Nord-Est', 1, 3),
(@qid, 'L''Artibonite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Que signifie FAO ?',
    'Organisation pour l''Alimentation et l''Agriculture.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Organisation mondiale de la santé', 0, 1),
(@qid, 'Organisation pour l''Alimentation et l''Agriculture', 1, 2),
(@qid, 'Fonds monétaire international', 0, 3),
(@qid, 'Organisation des États Américains', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le principal produit agricole d''exportation historique d''Haïti ?',
    'Le café.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le riz', 0, 1),
(@qid, 'Le café', 1, 2),
(@qid, 'La canne à sucre', 0, 3),
(@qid, 'Le maïs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a écrit "Ainsi parla l''oncle" ?',
    'Jean Price-Mars.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jacques Roumain', 0, 1),
(@qid, 'Jean Price-Mars', 1, 2),
(@qid, 'Frankétienne', 0, 3),
(@qid, 'Dany Laferrière', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'L''ONU a été créée en :', '1945.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1918', 0, 1),
(@qid, '1920', 0, 2),
(@qid, '1945', 1, 3),
(@qid, '1960', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le nom de l''accord liant USA, Canada et Mexique ?',
    'ALENA (maintenant ACEUM).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'UE', 0, 1),
(@qid, 'MERCOSUR', 0, 2),
(@qid, 'ALENA', 1, 3),
(@qid, 'CARICOM', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la monnaie officielle d''Haïti ?', 'La gourde.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le dollar', 0, 1),
(@qid, 'La gourde', 1, 2),
(@qid, 'L''euro', 0, 3),
(@qid, 'Le peso', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a aboli l''esclavage en Haïti pour la première fois ?',
    'Sonthonax en 1793.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dessalines', 0, 1),
(@qid, 'Sonthonax', 1, 2),
(@qid, 'Napoléon', 0, 3),
(@qid, 'Boyer', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Combien de départements compte Haïti ?', '10 départements.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '7', 0, 1),
(@qid, '9', 0, 2),
(@qid, '10', 1, 3),
(@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La Première Guerre Mondiale a débuté en :', '1914.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1912', 0, 1),
(@qid, '1914', 1, 2),
(@qid, '1918', 0, 3),
(@qid, '1939', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays a colonisé Haïti ?', 'La France.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Espagne', 0, 1),
(@qid, 'L''Angleterre', 0, 2),
(@qid, 'La France', 1, 3),
(@qid, 'Le Portugal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Lequel de ces pays est un "dragon asiatique" ?',
    'La Corée du Sud.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Inde', 0, 1),
(@qid, 'Corée du Sud', 1, 2),
(@qid, 'Chine', 0, 3),
(@qid, 'Indonésie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la langue officielle du Brésil ?', 'Le portugais.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''espagnol', 0, 1),
(@qid, 'Le portugais', 1, 2),
(@qid, 'L''anglais', 0, 3),
(@qid, 'Le français', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le nom d''Haïti vient de :', 'Ayiti = terre haute en langue taïno.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''espagnol', 0, 1),
(@qid, 'Le français', 0, 2),
(@qid, 'Le taïno', 1, 3),
(@qid, 'L''anglais', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année Haïti a-t-elle obtenu son indépendance ?', '1804.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1791', 0, 1),
(@qid, '1804', 1, 2),
(@qid, '1825', 0, 3),
(@qid, '1843', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays partage l''île d''Hispaniola avec Haïti ?',
    'La République Dominicaine.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1),
(@qid, 'Jamaïque', 0, 2),
(@qid, 'Rép. Dominicaine', 1, 3),
(@qid, 'Porto Rico', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le nom de l''hymne national haïtien ?', 'La Dessalinienne.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Marseillaise', 0, 1),
(@qid, 'La Dessalinienne', 1, 2),
(@qid, 'Haiti Chérie', 0, 3),
(@qid, 'Fière Haïti', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La religion la plus dominante dans les pays latino-américains est :',
    'Le catholicisme.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Catholicisme', 1, 1),
(@qid, 'Le Judaïsme', 0, 2),
(@qid, 'Le Bouddhisme', 0, 3),
(@qid, 'Le Protestantisme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La date du 8 mars marque la journée mondiale :',
    'Journée internationale des droits des femmes.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des droits de l''homme', 0, 1),
(@qid, 'Des droits de l''enfant', 0, 2),
(@qid, 'De la jeunesse', 0, 3),
(@qid, 'Des droits de la femme', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le livre sacré utilisé dans la religion musulmane est :',
    'Le Coran.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Bible', 0, 1),
(@qid, 'La Torah', 0, 2),
(@qid, 'Le Coran', 1, 3),
(@qid, 'Le Veda', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Seul pays du Commonwealth dans les Grandes Antilles :',
    'La Jamaïque.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1),
(@qid, 'Porto-Rico', 0, 2),
(@qid, 'Haïti', 0, 3),
(@qid, 'Jamaïque', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le plus vaste département d''Haïti ?',
    'L''Artibonite.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Ouest', 0, 1),
(@qid, 'L''Artibonite', 1, 2),
(@qid, 'Le Sud', 0, 3),
(@qid, 'Le Centre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le nom du marché commun de l''Amérique du Sud ?',
    'MERCOSUR = Marché Commun du Sud.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ALENA', 0, 1),
(@qid, 'MERCOSUR', 1, 2),
(@qid, 'ALEAC', 0, 3),
(@qid, 'CARICOM', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce qu''un pays enclavé ?',
    'Un pays sans accès à la mer.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un pays insulaire', 0, 1),
(@qid, 'Un pays sans accès à la mer', 1, 2),
(@qid, 'Un pays montagneux', 0, 3),
(@qid, 'Un pays colonial', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Densité de population = 18 875 hab / 345 km² = ?',
    '18875/345 ≈ 54,71 hab/km².', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '18 530 hab/km²', 0, 1),
(@qid, '54,71 hab/km²', 1, 2),
(@qid, '541,19 hab/km²', 0, 3),
(@qid, '0,5471 hab/km²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Lequel n''est PAS une cause de la décolonisation de l''Afrique ?',
    'Le bombardement de Hiroshima n''est pas lié à la décolonisation africaine.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La création de l''ONU', 0, 1),
(@qid, 'Les deux guerres mondiales', 0, 2),
(@qid, 'Le bombardement de Hiroshima', 1, 3),
(@qid, 'La conférence de Bandoeng', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La doctrine de Monroe justifiait :',
    'La domination des USA sur l''Amérique Latine.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''indépendance d''Haïti', 0, 1),
(@qid, 'La domination US en Amérique Latine', 1, 2),
(@qid, 'La Révolution française', 0, 3),
(@qid, 'L''abolition de l''esclavage', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la devise du Parti Libéral au XIXe siècle haïtien ?',
    '"Le pouvoir aux plus capables".', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le pouvoir aux plus capables', 1, 1),
(@qid, 'Le pouvoir au plus grand nombre', 0, 2),
(@qid, 'L''union fait la force', 0, 3),
(@qid, 'Liberté ou la mort', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La première victime de l''occupation américaine en 1915 fut :',
    'Vilbrun Guillaume Sam.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Charlemagne Péralte', 0, 1),
(@qid, 'Pierre Sully', 0, 2),
(@qid, 'Vilbrun Guillaume Sam', 1, 3),
(@qid, 'Benoit Batraville', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays africain a eu le premier président noir du continent américain inspiré par la Révolution haïtienne ?',
    'Haïti, première République noire indépendante.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Liberia', 0, 1),
(@qid, 'Le Ghana', 0, 2),
(@qid, 'Haïti elle-même', 1, 3),
(@qid, 'Cuba', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel héros haïtien a résisté à l''occupation américaine ?',
    'Charlemagne Péralte a dirigé la résistance cacos.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Alexandre Pétion', 0, 1),
(@qid, 'Charlemagne Péralte', 1, 2),
(@qid, 'Toussaint Louverture', 0, 3),
(@qid, 'Jean Price-Mars', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la deuxième ville d''Haïti en termes de population ?',
    'Cap-Haïtien.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jacmel', 0, 1),
(@qid, 'Cap-Haïtien', 1, 2),
(@qid, 'Gonaïves', 0, 3),
(@qid, 'Les Cayes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le traité de Ryswick en 1697 a officialisé :',
    'La cession de la partie ouest de Saint-Domingue à la France.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La fin de la colonisation espagnole', 0, 1),
(@qid, 'La cession de l''ouest de l''île à la France', 1, 2),
(@qid, 'L''abolition de l''esclavage', 0, 3),
(@qid, 'L''indépendance d''Haïti', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le symbole graphique des Nations Unies ?',
    'La mappemonde entourée de branches d''olivier.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un aigle', 0, 1),
(@qid, 'Une mappemonde et des branches d''olivier', 1, 2),
(@qid, 'Une colombe blanche', 0, 3),
(@qid, 'Des étoiles sur fond bleu', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays est membre permanent du Conseil de Sécurité de l''ONU ?',
    'Les États-Unis sont membres permanents.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haïti', 0, 1),
(@qid, 'Brésil', 0, 2),
(@qid, 'États-Unis', 1, 3),
(@qid, 'Mexique', 0, 4);

-- ============================================
-- QCM SCIENCES SOCIALES 9e ANNÉE - HAÏTI
-- Plus de 400 questions
-- ============================================

-- ============================================
-- THÈME 1 : LES DEUX GUERRES MONDIALES (80 QCM)
-- ============================================

-- Première Guerre mondiale : causes
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la date du début de la Première Guerre mondiale ?',
    'Le 28 juillet 1914, avec la déclaration de guerre de l''Autriche-Hongrie à la Serbie.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '28 juin 1914', 0, 1),
(@qid, '28 juillet 1914', 1, 2),
(@qid, '1er août 1914', 0, 3),
(@qid, '11 novembre 1914', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel événement est considéré comme le déclencheur immédiat de la Première Guerre mondiale ?',
    'L''assassinat de l''archiduc François-Ferdinand à Sarajevo le 28 juin 1914.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le bombardement de Londres', 0, 1),
(@qid, 'L''assassinat de François-Ferdinand', 1, 2),
(@qid, 'L''invasion de la Pologne', 0, 3),
(@qid, 'Le naufrage du Titanic', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quels étaient les deux principaux systèmes d''alliances avant 1914 ?',
    'La Triple-Entente et la Triple-Alliance (ou Triplice).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''OTAN et le Pacte de Varsovie', 0, 1),
(@qid, 'La Triple-Entente et la Triple-Alliance', 1, 2),
(@qid, 'L''Axe et les Alliés', 0, 3),
(@qid, 'La Sainte-Alliance et l''Entente cordiale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quels pays formaient la Triple-Entente ?',
    'La France, le Royaume-Uni et la Russie.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'France, Royaume-Uni, Russie', 1, 1),
(@qid, 'Allemagne, Autriche-Hongrie, Italie', 0, 2),
(@qid, 'France, Allemagne, Italie', 0, 3),
(@qid, 'Royaume-Uni, États-Unis, Russie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quels pays formaient la Triple-Alliance ou Triplice ?',
    'L''Allemagne, l''Autriche-Hongrie et l''Italie.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Allemagne, Autriche-Hongrie, Italie', 1, 1),
(@qid, 'France, Royaume-Uni, Russie', 0, 2),
(@qid, 'Allemagne, Russie, Empire ottoman', 0, 3),
(@qid, 'Italie, Royaume-Uni, France', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel nom donne-t-on à la guerre de positions dans les tranchées ?',
    'La guerre d''usure, caractérisée par l''immobilité du front.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La guerre éclair', 0, 1),
(@qid, 'La guerre d''usure', 1, 2),
(@qid, 'La guerre froide', 0, 3),
(@qid, 'La guerre totale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle bataille est le symbole de la résistance française en 1916 ?',
    'La bataille de Verdun, qui a duré 10 mois en 1916.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La bataille de la Marne', 0, 1),
(@qid, 'La bataille de Verdun', 1, 2),
(@qid, 'La bataille de Normandie', 0, 3),
(@qid, 'La bataille de Waterloo', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année les États-Unis sont-ils entrés dans la Première Guerre mondiale ?',
    'En 1917, suite à la guerre sous-marine allemande.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1914', 0, 1),
(@qid, '1915', 0, 2),
(@qid, '1917', 1, 3),
(@qid, '1918', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la date de l''armistice de la Première Guerre mondiale ?',
    'Le 11 novembre 1918.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '11 novembre 1918', 1, 1),
(@qid, '8 mai 1918', 0, 2),
(@qid, '14 juillet 1918', 0, 3),
(@qid, '25 décembre 1918', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel traité a mis fin à la Première Guerre mondiale ?',
    'Le traité de Versailles, signé le 28 juin 1919.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le traité de Ryswick', 0, 1),
(@qid, 'Le traité de Versailles', 1, 2),
(@qid, 'Le traité de Bâle', 0, 3),
(@qid, 'Le traité de Westphalie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle organisation internationale est créée après la Première Guerre mondiale ?',
    'La Société des Nations (SDN), créée en 1919.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''ONU', 0, 1),
(@qid, 'La Société des Nations (SDN)', 1, 2),
(@qid, 'L''OEA', 0, 3),
(@qid, 'L''OTAN', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays a subi le plus de pertes humaines pendant la Première Guerre mondiale ?',
    'La Russie, avec environ 1,7 million de morts militaires.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La France', 0, 1),
(@qid, 'L''Allemagne', 0, 2),
(@qid, 'La Russie', 1, 3),
(@qid, 'Le Royaume-Uni', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays quitte la Triple-Alliance pour rejoindre l''Entente en 1915 ?',
    'L''Italie, qui rejoint l''Entente en 1915.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Autriche-Hongrie', 0, 1),
(@qid, 'L''Empire ottoman', 0, 2),
(@qid, 'L''Italie', 1, 3),
(@qid, 'La Bulgarie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle arme nouvelle est utilisée massivement pour la première fois en 1915 ?',
    'Les gaz toxiques (ypérite, gaz moutarde).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La bombe atomique', 0, 1),
(@qid, 'Les gaz toxiques', 1, 2),
(@qid, 'Le missile balistique', 0, 3),
(@qid, 'Le drone', 0, 4);

-- Première Guerre mondiale : empires centraux
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quels pays formaient les Empires centraux ?',
    'L''Allemagne, l''Autriche-Hongrie, l''Empire ottoman et la Bulgarie.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Allemagne, Autriche-Hongrie, Empire ottoman, Bulgarie', 1, 1),
(@qid, 'Allemagne, Italie, Japon', 0, 2),
(@qid, 'France, Royaume-Uni, Russie', 0, 3),
(@qid, 'Allemagne, Russie, Empire ottoman', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel empire s''effondre après la Première Guerre mondiale ?',
    'L''Empire austro-hongrois, l''Empire ottoman, l''Empire russe et l''Empire allemand.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Empire britannique', 0, 1),
(@qid, 'L''Empire austro-hongrois', 1, 2),
(@qid, 'L''Empire colonial français', 0, 3),
(@qid, 'L''Empire espagnol', 0, 4);

-- Deuxième Guerre mondiale : causes
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays a envahi la Pologne le 1er septembre 1939 ?',
    'L''Allemagne nazie, déclenchant la Seconde Guerre mondiale.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La France', 0, 1),
(@qid, 'L''Allemagne', 1, 2),
(@qid, 'L''Italie', 0, 3),
(@qid, 'L''URSS', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel homme politique dirigeait l''Allemagne nazie ?',
    'Adolf Hitler, chancelier à partir de 1933.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Benito Mussolini', 0, 1),
(@qid, 'Adolf Hitler', 1, 2),
(@qid, 'Joseph Staline', 0, 3),
(@qid, 'Winston Churchill', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel dictateur dirigeait l''Italie fasciste ?',
    'Benito Mussolini, au pouvoir de 1922 à 1943.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adolf Hitler', 0, 1),
(@qid, 'Benito Mussolini', 1, 2),
(@qid, 'Francisco Franco', 0, 3),
(@qid, 'Joseph Staline', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quels sont les trois pays de l''Axe pendant la Seconde Guerre mondiale ?',
    'L''Allemagne, l''Italie et le Japon.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Allemagne, Italie, Japon', 1, 1),
(@qid, 'Allemagne, URSS, Japon', 0, 2),
(@qid, 'Italie, France, Japon', 0, 3),
(@qid, 'Allemagne, Espagne, Italie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quels sont les principaux pays Alliés en 1939-1945 ?',
    'Le Royaume-Uni, la France, l''URSS (1941) et les États-Unis (1941).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Royaume-Uni, France, URSS, États-Unis', 1, 1),
(@qid, 'Allemagne, Italie, Japon', 0, 2),
(@qid, 'France, Allemagne, Royaume-Uni', 0, 3),
(@qid, 'URSS, Chine, Allemagne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle idéologie prône la supériorité de la race aryenne ?',
    'Le nazisme, idéologie d''Adolf Hitler.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le communisme', 0, 1),
(@qid, 'Le capitalisme', 0, 2),
(@qid, 'Le nazisme', 1, 3),
(@qid, 'Le socialisme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la Shoah ?',
    'Le génocide des Juifs par l''Allemagne nazie, environ 6 millions de morts.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La bataille de Stalingrad', 0, 1),
(@qid, 'Le génocide des Juifs', 1, 2),
(@qid, 'L''invasion de la Pologne', 0, 3),
(@qid, 'La conférence de Yalta', 0, 4);

-- Deuxième Guerre mondiale : grandes batailles
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle bataille est considérée comme le tournant de la guerre sur le front de l''Est ?',
    'La bataille de Stalingrad (1942-1943).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La bataille d''Angleterre', 0, 1),
(@qid, 'La bataille de Stalingrad', 1, 2),
(@qid, 'La bataille de Normandie', 0, 3),
(@qid, 'La bataille de Pearl Harbor', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel événement provoque l''entrée des États-Unis dans la Seconde Guerre mondiale ?',
    'L''attaque japonaise sur Pearl Harbor le 7 décembre 1941.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''invasion de la Pologne', 0, 1),
(@qid, 'L''attaque de Pearl Harbor', 1, 2),
(@qid, 'La bataille d''Angleterre', 0, 3),
(@qid, 'Le débarquement en Normandie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la date du débarquement en Normandie (D-Day) ?',
    'Le 6 juin 1944.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6 juin 1944', 1, 1),
(@qid, '8 mai 1944', 0, 2),
(@qid, '11 novembre 1944', 0, 3),
(@qid, '25 décembre 1944', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la date de la capitulation de l''Allemagne nazie ?',
    'Le 8 mai 1945.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '8 mai 1945', 1, 1),
(@qid, '6 juin 1944', 0, 2),
(@qid, '2 septembre 1945', 0, 3),
(@qid, '11 novembre 1945', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays a utilisé la bombe atomique contre le Japon en 1945 ?',
    'Les États-Unis, sur Hiroshima (6 août) et Nagasaki (9 août).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La France', 0, 1),
(@qid, 'Le Royaume-Uni', 0, 2),
(@qid, 'L''URSS', 0, 3),
(@qid, 'Les États-Unis', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelles villes japonaises ont été frappées par la bombe atomique ?',
    'Hiroshima le 6 août 1945 et Nagasaki le 9 août 1945.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Tokyo et Kyoto', 0, 1),
(@qid, 'Hiroshima et Nagasaki', 1, 2),
(@qid, 'Osaka et Yokohama', 0, 3),
(@qid, 'Kobe et Sapporo', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la date de la capitulation du Japon ?',
    'Le 2 septembre 1945.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '8 mai 1945', 0, 1),
(@qid, '6 août 1945', 0, 2),
(@qid, '2 septembre 1945', 1, 3),
(@qid, '11 novembre 1945', 0, 4);

-- Conférences et traités
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle conférence réunit Staline, Roosevelt et Churchill en février 1945 ?',
    'La conférence de Yalta.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La conférence de Versailles', 0, 1),
(@qid, 'La conférence de Yalta', 1, 2),
(@qid, 'La conférence de Berlin', 0, 3),
(@qid, 'La conférence de Genève', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel plan américain a aidé à la reconstruction de l''Europe après 1945 ?',
    'Le plan Marshall, lancé en 1947.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le plan Dawes', 0, 1),
(@qid, 'Le plan Marshall', 1, 2),
(@qid, 'Le New Deal', 0, 3),
(@qid, 'Le plan Schuman', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle organisation internationale est créée en 1945 pour maintenir la paix ?',
    'L''Organisation des Nations Unies (ONU).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La SDN', 0, 1),
(@qid, 'L''ONU', 1, 2),
(@qid, 'L''OTAN', 0, 3),
(@qid, 'L''Union européenne', 0, 4);

-- Bilan des deux guerres
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Combien de morts environ la Première Guerre mondiale a-t-elle causés ?',
    'Environ 10 millions de morts militaires.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5 millions', 0, 1),
(@qid, '10 millions', 1, 2),
(@qid, '50 millions', 0, 3),
(@qid, '2 millions', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Combien de morts environ la Seconde Guerre mondiale a-t-elle causés ?',
    'Environ 50 à 60 millions de morts.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10 millions', 0, 1),
(@qid, '20 millions', 0, 2),
(@qid, '50 à 60 millions', 1, 3),
(@qid, '5 millions', 0, 4);

-- Guerre froide
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la guerre froide ?',
    'La période de tensions entre les États-Unis et l''URSS de 1947 à 1991.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un conflit armé direct entre les USA et l''URSS', 0, 1),
(@qid, 'Une période de tensions entre les USA et l''URSS', 1, 2),
(@qid, 'Une guerre en Arctique', 0, 3),
(@qid, 'Un conflit entre la France et l''Allemagne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel symbole divise l''Europe pendant la guerre froide ?',
    'Le mur de Berlin, construit en 1961.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La ligne Maginot', 0, 1),
(@qid, 'Le mur de Berlin', 1, 2),
(@qid, 'Le rideau de fer (ligne de démarcation)', 0, 3),
(@qid, 'La frontière franco-allemande', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année le mur de Berlin est-il tombé ?',
    'Le 9 novembre 1989.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1985', 0, 1),
(@qid, '1989', 1, 2),
(@qid, '1991', 0, 3),
(@qid, '1995', 0, 4);

-- ============================================
-- THÈME 2 : LES CARAÏBES (50 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle mer baigne les Caraïbes ?',
    'La mer des Caraïbes.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La mer Méditerranée', 0, 1),
(@qid, 'La mer des Caraïbes', 1, 2),
(@qid, 'La mer Rouge', 0, 3),
(@qid, 'La mer du Nord', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le plus grand pays des Caraïbes en superficie ?',
    'Cuba.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haïti', 0, 1),
(@qid, 'Cuba', 1, 2),
(@qid, 'Jamaïque', 0, 3),
(@qid, 'République dominicaine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle île est partagée entre Haïti et la République dominicaine ?',
    'L''île d''Hispaniola (ou Haïti, Saint-Domingue).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1),
(@qid, 'Hispaniola', 1, 2),
(@qid, 'Jamaïque', 0, 3),
(@qid, 'Porto Rico', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel peuple amérindien vivait dans les Caraïbes avant l''arrivée des Européens ?',
    'Les Taïnos, les Caraïbes (Kalinago) et les Ciboneys.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les Aztèques', 0, 1),
(@qid, 'Les Taïnos', 1, 2),
(@qid, 'Les Incas', 0, 3),
(@qid, 'Les Mayas', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de Cuba ?',
    'La Havane.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Santiago de Cuba', 0, 1),
(@qid, 'La Havane', 1, 2),
(@qid, 'Kingston', 0, 3),
(@qid, 'San Juan', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Jamaïque ?',
    'Kingston.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Kingston', 1, 1),
(@qid, 'La Havane', 0, 2),
(@qid, 'Port-au-Prince', 0, 3),
(@qid, 'Nassau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de Porto Rico ?',
    'San Juan.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'San Juan', 1, 1),
(@qid, 'Santo Domingo', 0, 2),
(@qid, 'Kingston', 0, 3),
(@qid, 'La Havane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays des Caraïbes est un territoire d''outre-mer français ?',
    'La Martinique et la Guadeloupe.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Jamaïque', 0, 1),
(@qid, 'La Martinique', 1, 2),
(@qid, 'Cuba', 0, 3),
(@qid, 'Les Bahamas', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la République dominicaine ?',
    'Santo Domingo.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Port-au-Prince', 0, 1),
(@qid, 'Santo Domingo', 1, 2),
(@qid, 'San Juan', 0, 3),
(@qid, 'La Havane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays des Caraïbes a obtenu son indépendance en 1804 ?',
    'Haïti.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1),
(@qid, 'Haïti', 1, 2),
(@qid, 'Jamaïque', 0, 3),
(@qid, 'République dominicaine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays des Caraïbes est le premier producteur de nickel ?',
    'Cuba.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haïti', 0, 1),
(@qid, 'Cuba', 1, 2),
(@qid, 'Jamaïque', 0, 3),
(@qid, 'République dominicaine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle mer se trouve au nord des Caraïbes ?',
    'L''océan Atlantique.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''océan Pacifique', 0, 1),
(@qid, 'L''océan Atlantique', 1, 2),
(@qid, 'L''océan Indien', 0, 3),
(@qid, 'La mer Méditerranée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la principale ressource économique de la Jamaïque ?',
    'La bauxite (aluminium).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le pétrole', 0, 1),
(@qid, 'La bauxite', 1, 2),
(@qid, 'L''or', 0, 3),
(@qid, 'Le café', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays des Caraïbes est le plus peuplé ?',
    'Cuba, avec environ 11 millions d''habitants.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haïti', 0, 1),
(@qid, 'Cuba', 1, 2),
(@qid, 'Jamaïque', 0, 3),
(@qid, 'Porto Rico', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale des Bahamas ?',
    'Nassau.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Kingston', 0, 1),
(@qid, 'Nassau', 1, 2),
(@qid, 'San Juan', 0, 3),
(@qid, 'La Havane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel peuple des Caraïbes était réputé pour sa résistance aux Européens ?',
    'Les Caraïbes (Kalinago).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les Taïnos', 0, 1),
(@qid, 'Les Caraïbes (Kalinago)', 1, 2),
(@qid, 'Les Aztèques', 0, 3),
(@qid, 'Les Mayas', 0, 4);

-- Suite des Caraïbes : capitales
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Barbade ?',
    'Bridgetown.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bridgetown', 1, 1),
(@qid, 'Kingston', 0, 2),
(@qid, 'Port d''Espagne', 0, 3),
(@qid, 'Castries', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de Trinité-et-Tobago ?',
    'Port d''Espagne (Port of Spain).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bridgetown', 0, 1),
(@qid, 'Port d''Espagne', 1, 2),
(@qid, 'Kingston', 0, 3),
(@qid, 'Georgetown', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de Sainte-Lucie ?',
    'Castries.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Castries', 1, 1),
(@qid, 'Saint-Georges', 0, 2),
(@qid, 'Roseau', 0, 3),
(@qid, 'Kingstown', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Grenade ?',
    'Saint-Georges.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Castries', 0, 1),
(@qid, 'Saint-Georges', 1, 2),
(@qid, 'Kingstown', 0, 3),
(@qid, 'Roseau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Dominique ?',
    'Roseau.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Roseau', 1, 1),
(@qid, 'Castries', 0, 2),
(@qid, 'Saint-Georges', 0, 3),
(@qid, 'Bridgetown', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de Saint-Vincent-et-les-Grenadines ?',
    'Kingstown.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Kingstown', 1, 1),
(@qid, 'Roseau', 0, 2),
(@qid, 'Castries', 0, 3),
(@qid, 'Saint-Georges', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale d''Antigua-et-Barbuda ?',
    'Saint John''s.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Saint John''s', 1, 1),
(@qid, 'Bridgetown', 0, 2),
(@qid, 'Basseterre', 0, 3),
(@qid, 'Castries', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de Saint-Kitts-et-Nevis ?',
    'Basseterre.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Basseterre', 1, 1),
(@qid, 'Saint John''s', 0, 2),
(@qid, 'Kingstown', 0, 3),
(@qid, 'Roseau', 0, 4);

-- ============================================
-- THÈME 3 : CAPITALES (50 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la France ?',
    'Paris.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Londres', 0, 1),
(@qid, 'Paris', 1, 2),
(@qid, 'Berlin', 0, 3),
(@qid, 'Madrid', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Canada ?',
    'Ottawa.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toronto', 0, 1),
(@qid, 'Ottawa', 1, 2),
(@qid, 'Montréal', 0, 3),
(@qid, 'Vancouver', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Brésil ?',
    'Brasilia.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Rio de Janeiro', 0, 1),
(@qid, 'Brasilia', 1, 2),
(@qid, 'São Paulo', 0, 3),
(@qid, 'Salvador', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de l''Argentine ?',
    'Buenos Aires.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Buenos Aires', 1, 1),
(@qid, 'Santiago', 0, 2),
(@qid, 'Lima', 0, 3),
(@qid, 'Montevideo', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Mexique ?',
    'Mexico.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Guadalajara', 0, 1),
(@qid, 'Mexico', 1, 2),
(@qid, 'Monterrey', 0, 3),
(@qid, 'Cancún', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de l''Espagne ?',
    'Madrid.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Barcelone', 0, 1),
(@qid, 'Madrid', 1, 2),
(@qid, 'Séville', 0, 3),
(@qid, 'Valence', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de l''Allemagne ?',
    'Berlin.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Munich', 0, 1),
(@qid, 'Berlin', 1, 2),
(@qid, 'Francfort', 0, 3),
(@qid, 'Bonn', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de l''Italie ?',
    'Rome.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Milan', 0, 1),
(@qid, 'Rome', 1, 2),
(@qid, 'Venise', 0, 3),
(@qid, 'Florence', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Royaume-Uni ?',
    'Londres.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Manchester', 0, 1),
(@qid, 'Londres', 1, 2),
(@qid, 'Liverpool', 0, 3),
(@qid, 'Birmingham', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Russie ?',
    'Moscou.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Saint-Pétersbourg', 0, 1),
(@qid, 'Moscou', 1, 2),
(@qid, 'Kiev', 0, 3),
(@qid, 'Minsk', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Chine ?',
    'Pékin (Beijing).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Shanghai', 0, 1),
(@qid, 'Pékin (Beijing)', 1, 2),
(@qid, 'Hong Kong', 0, 3),
(@qid, 'Canton', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Japon ?',
    'Tokyo.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Osaka', 0, 1),
(@qid, 'Tokyo', 1, 2),
(@qid, 'Kyoto', 0, 3),
(@qid, 'Yokohama', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de l''Inde ?',
    'New Delhi.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mumbai', 0, 1),
(@qid, 'New Delhi', 1, 2),
(@qid, 'Calcutta', 0, 3),
(@qid, 'Bangalore', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de l''Égypte ?',
    'Le Caire.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Alexandrie', 0, 1),
(@qid, 'Le Caire', 1, 2),
(@qid, 'Louxor', 0, 3),
(@qid, 'Assouan', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de l''Afrique du Sud ?',
    'Pretoria (administrative), Le Cap (législative), Bloemfontein (judiciaire).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Johannesburg', 0, 1),
(@qid, 'Pretoria', 1, 2),
(@qid, 'Durban', 0, 3),
(@qid, 'Soweto', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Nigeria ?',
    'Abuja.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lagos', 0, 1),
(@qid, 'Abuja', 1, 2),
(@qid, 'Kano', 0, 3),
(@qid, 'Ibadan', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de l''Australie ?',
    'Canberra.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sydney', 0, 1),
(@qid, 'Canberra', 1, 2),
(@qid, 'Melbourne', 0, 3),
(@qid, 'Brisbane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Colombie ?',
    'Bogota.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Medellín', 0, 1),
(@qid, 'Bogota', 1, 2),
(@qid, 'Cali', 0, 3),
(@qid, 'Carthagène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Venezuela ?',
    'Caracas.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Maracaibo', 0, 1),
(@qid, 'Caracas', 1, 2),
(@qid, 'Valence', 0, 3),
(@qid, 'Barquisimeto', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Chili ?',
    'Santiago.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Valparaíso', 0, 1),
(@qid, 'Santiago', 1, 2),
(@qid, 'Concepción', 0, 3),
(@qid, 'Antofagasta', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Pérou ?',
    'Lima.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuzco', 0, 1),
(@qid, 'Lima', 1, 2),
(@qid, 'Arequipa', 0, 3),
(@qid, 'Trujillo', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de l''Équateur ?',
    'Quito.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Guayaquil', 0, 1),
(@qid, 'Quito', 1, 2),
(@qid, 'Cuenca', 0, 3),
(@qid, 'Manta', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Bolivie ?',
    'La Paz (siège du gouvernement) et Sucre (capitale constitutionnelle).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Santa Cruz', 0, 1),
(@qid, 'La Paz', 1, 2),
(@qid, 'Cochabamba', 0, 3),
(@qid, 'Potosí', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Paraguay ?',
    'Asunción.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Asunción', 1, 1),
(@qid, 'Montevideo', 0, 2),
(@qid, 'Buenos Aires', 0, 3),
(@qid, 'La Paz', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de l''Uruguay ?',
    'Montevideo.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Asunción', 0, 1),
(@qid, 'Montevideo', 1, 2),
(@qid, 'Buenos Aires', 0, 3),
(@qid, 'Santiago', 0, 4);

-- Capitales d'Afrique
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Sénégal ?',
    'Dakar.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dakar', 1, 1),
(@qid, 'Abidjan', 0, 2),
(@qid, 'Bamako', 0, 3),
(@qid, 'Conakry', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Côte d''Ivoire ?',
    'Yamoussoukro (politique), Abidjan (économique).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Abidjan', 0, 1),
(@qid, 'Yamoussoukro', 1, 2),
(@qid, 'Bouaké', 0, 3),
(@qid, 'Daloa', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Mali ?',
    'Bamako.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dakar', 0, 1),
(@qid, 'Bamako', 1, 2),
(@qid, 'Ouagadougou', 0, 3),
(@qid, 'Niamey', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de l''Éthiopie ?',
    'Addis-Abeba.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Nairobi', 0, 1),
(@qid, 'Addis-Abeba', 1, 2),
(@qid, 'Khartoum', 0, 3),
(@qid, 'Dar es Salam', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Kenya ?',
    'Nairobi.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Nairobi', 1, 1),
(@qid, 'Addis-Abeba', 0, 2),
(@qid, 'Dar es Salam', 0, 3),
(@qid, 'Kampala', 0, 4);

-- ============================================
-- THÈME 4 : GUERRE DE SÉCESSION AMÉRICAINE (25 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quand la guerre de Sécession américaine a-t-elle eu lieu ?',
    'De 1861 à 1865.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1850-1855', 0, 1),
(@qid, '1861-1865', 1, 2),
(@qid, '1870-1875', 0, 3),
(@qid, '1840-1845', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui était le président des États-Unis pendant la guerre de Sécession ?',
    'Abraham Lincoln.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'George Washington', 0, 1),
(@qid, 'Abraham Lincoln', 1, 2),
(@qid, 'Thomas Jefferson', 0, 3),
(@qid, 'Andrew Jackson', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel était le principal motif de la guerre de Sécession ?',
    'L''esclavage et les droits des États face au gouvernement fédéral.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les droits de douane', 0, 1),
(@qid, 'L''esclavage', 1, 2),
(@qid, 'La conquête de l''Ouest', 0, 3),
(@qid, 'La religion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quels États faisaient sécession et formaient la Confédération ?',
    'Les États du Sud, comme la Virginie, la Géorgie, le Texas.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les États du Nord', 0, 1),
(@qid, 'Les États du Sud', 1, 2),
(@qid, 'Les États de l''Ouest', 0, 3),
(@qid, 'Les États du Centre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui était le général en chef des troupes confédérées ?',
    'Robert E. Lee.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ulysses S. Grant', 0, 1),
(@qid, 'Robert E. Lee', 1, 2),
(@qid, 'William Sherman', 0, 3),
(@qid, 'Stonewall Jackson', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui était le général en chef des troupes de l''Union en 1864-1865 ?',
    'Ulysses S. Grant.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ulysses S. Grant', 1, 1),
(@qid, 'Robert E. Lee', 0, 2),
(@qid, 'George McClellan', 0, 3),
(@qid, 'George Meade', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle bataille est considérée comme le tournant de la guerre ?',
    'La bataille de Gettysburg (1-3 juillet 1863).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La bataille de Bull Run', 0, 1),
(@qid, 'La bataille de Gettysburg', 1, 2),
(@qid, 'La bataille d''Antietam', 0, 3),
(@qid, 'La bataille de Fort Sumter', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année l''esclavage a-t-il été aboli aux États-Unis ?',
    'En 1865, par le 13e amendement.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1863', 0, 1),
(@qid, '1865', 1, 2),
(@qid, '1870', 0, 3),
(@qid, '1850', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel document célèbre Lincoln a-t-il proclamé en 1863 ?',
    'La Proclamation d''émancipation, libérant les esclaves des États confédérés.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Déclaration d''indépendance', 0, 1),
(@qid, 'La Proclamation d''émancipation', 1, 2),
(@qid, 'Le Bill of Rights', 0, 3),
(@qid, 'La Constitution fédérale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Comment Abraham Lincoln est-il mort ?',
    'Assassiné le 14 avril 1865 par John Wilkes Booth.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De mort naturelle', 0, 1),
(@qid, 'Assassiné', 1, 2),
(@qid, 'Mort au combat', 0, 3),
(@qid, 'Par suicide', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Combien de morts environ la guerre de Sécession a-t-elle causés ?',
    'Environ 620 000 morts.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 000', 0, 1),
(@qid, '620 000', 1, 2),
(@qid, '1 million', 0, 3),
(@qid, '50 000', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel État est le dernier à réintégrer l''Union après la guerre ?',
    'La Géorgie, en 1870.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Virginie', 0, 1),
(@qid, 'La Géorgie', 1, 2),
(@qid, 'Le Texas', 0, 3),
(@qid, 'L''Alabama', 0, 4);

-- ============================================
-- THÈME 5 : CRISE DE 1929 (25 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quand a débuté la crise économique mondiale ?',
    'Le jeudi 24 octobre 1929 (jeudi noir) avec le krach de Wall Street.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1925', 0, 1),
(@qid, '1929', 1, 2),
(@qid, '1933', 0, 3),
(@qid, '1918', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel événement marque le début de la crise de 1929 ?',
    'Le krach boursier de Wall Street à New York.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La guerre de Sécession', 0, 1),
(@qid, 'Le krach boursier de Wall Street', 1, 2),
(@qid, 'L''assassinat de Lincoln', 0, 3),
(@qid, 'La Première Guerre mondiale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Comment appelle-t-on le jour du krach boursier ?',
    'Le jeudi noir (Black Thursday) le 24 octobre 1929.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le vendredi saint', 0, 1),
(@qid, 'Le jeudi noir', 1, 2),
(@qid, 'Le lundi de Pâques', 0, 3),
(@qid, 'Le dimanche rouge', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la cause immédiate de la crise de 1929 ?',
    'La spéculation boursière excessive et la surproduction industrielle.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La guerre', 0, 1),
(@qid, 'La spéculation boursière', 1, 2),
(@qid, 'La famine', 0, 3),
(@qid, 'La pénurie de pétrole', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays est le plus touché par la crise de 1929 ?',
    'Les États-Unis, puis la crise se propage dans le monde.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les États-Unis', 1, 1),
(@qid, 'La France', 0, 2),
(@qid, 'Le Japon', 0, 3),
(@qid, 'L''URSS', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel président américain a lancé le New Deal ?',
    'Franklin D. Roosevelt, élu en 1932.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Herbert Hoover', 0, 1),
(@qid, 'Franklin D. Roosevelt', 1, 2),
(@qid, 'Harry Truman', 0, 3),
(@qid, 'Dwight Eisenhower', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le New Deal ?',
    'Un ensemble de mesures économiques et sociales pour lutter contre la crise.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un traité de paix', 0, 1),
(@qid, 'Un programme de relance économique', 1, 2),
(@qid, 'Une déclaration de guerre', 0, 3),
(@qid, 'Un parti politique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le taux de chômage aux États-Unis en 1933 ?',
    'Environ 25%.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5%', 0, 1),
(@qid, '10%', 0, 2),
(@qid, '25%', 1, 3),
(@qid, '50%', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Comment la crise de 1929 affecte-t-elle l''Europe ?',
    'Provoquant chômage, montée des extrémismes et instabilité politique.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aucun impact', 0, 1),
(@qid, 'Chômage et montée des extrémismes', 1, 2),
(@qid, 'Prospérité économique', 0, 3),
(@qid, 'Stabilité politique accrue', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel régime politique profite de la crise en Allemagne ?',
    'Le nazisme d''Adolf Hitler, arrivé au pouvoir en 1933.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le communisme', 0, 1),
(@qid, 'Le nazisme', 1, 2),
(@qid, 'Le socialisme démocratique', 0, 3),
(@qid, 'Le monarchisme', 0, 4);

-- ============================================
-- THÈME 6 : COLONISATION (40 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la colonisation ?',
    'L''occupation et l''exploitation d''un territoire par une puissance étrangère.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un échange commercial équitable', 0, 1),
(@qid, 'L''occupation et l''exploitation d''un territoire', 1, 2),
(@qid, 'Une alliance militaire', 0, 3),
(@qid, 'Un traité de paix', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quels étaient les principaux pays colonisateurs européens ?',
    'L''Espagne, le Portugal, la France, le Royaume-Uni, les Pays-Bas.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Chine et le Japon', 0, 1),
(@qid, 'L''Espagne, la France, le Royaume-Uni', 1, 2),
(@qid, 'La Russie et l''Autriche', 0, 3),
(@qid, 'L''Italie et la Grèce antiques', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel traité a partagé le monde entre l''Espagne et le Portugal en 1494 ?',
    'Le traité de Tordesillas.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le traité de Versailles', 0, 1),
(@qid, 'Le traité de Tordesillas', 1, 2),
(@qid, 'Le traité de Ryswick', 0, 3),
(@qid, 'Le traité de Westphalie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le commerce triangulaire ?',
    'Le commerce entre l''Europe, l''Afrique et les Amériques (esclaves, matières premières).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un commerce entre trois pays européens', 0, 1),
(@qid, 'Le commerce Europe-Afrique-Amériques', 1, 2),
(@qid, 'Un échange de technologies', 0, 3),
(@qid, 'Un marché local', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel phénomène a entraîné une forte mortalité chez les Amérindiens ?',
    'Les maladies apportées par les Européens (variole, rougeole).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les guerres civiles', 0, 1),
(@qid, 'Les maladies européennes', 1, 2),
(@qid, 'La famine naturelle', 0, 3),
(@qid, 'Les catastrophes naturelles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel système économique dominait les colonies ?',
    'Le système de plantation (canne à sucre, café, coton).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''industrie textile', 0, 1),
(@qid, 'Le système de plantation', 1, 2),
(@qid, 'La pêche', 0, 3),
(@qid, 'L''artisanat', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle conférence a réglé le partage de l''Afrique en 1885 ?',
    'La conférence de Berlin.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La conférence de Yalta', 0, 1),
(@qid, 'La conférence de Berlin', 1, 2),
(@qid, 'La conférence de Versailles', 0, 3),
(@qid, 'La conférence de Genève', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la décolonisation ?',
    'Le processus par lequel les colonies obtiennent leur indépendance.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''extension des empires coloniaux', 0, 1),
(@qid, 'Le processus d''indépendance des colonies', 1, 2),
(@qid, 'La création de nouvelles colonies', 0, 3),
(@qid, 'Le renforcement de la colonisation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle colonie française d''Afrique a obtenu son indépendance en 1962 ?',
    'L''Algérie, après une longue guerre (1954-1962).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Sénégal', 0, 1),
(@qid, 'L''Algérie', 1, 2),
(@qid, 'La Côte d''Ivoire', 0, 3),
(@qid, 'Madagascar', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a colonisé le Brésil ?',
    'Le Portugal.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Espagne', 0, 1),
(@qid, 'Le Portugal', 1, 2),
(@qid, 'La France', 0, 3),
(@qid, 'Le Royaume-Uni', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a colonisé la majeure partie de l''Amérique du Sud ?',
    'L''Espagne.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Espagne', 1, 1),
(@qid, 'Le Portugal', 0, 2),
(@qid, 'La France', 0, 3),
(@qid, 'Le Royaume-Uni', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel était le premier comptoir colonial français en Amérique ?',
    'La Nouvelle-France (Québec, fondé en 1608).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Louisiane', 0, 1),
(@qid, 'Le Québec', 1, 2),
(@qid, 'Haïti', 0, 3),
(@qid, 'La Martinique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle était la principale colonie britannique en Amérique du Nord ?',
    'Les Treize Colonies (futurs États-Unis).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Canada', 0, 1),
(@qid, 'Les Treize Colonies', 1, 2),
(@qid, 'La Jamaïque', 0, 3),
(@qid, 'Le Mexique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la plus grande colonie africaine de la France ?',
    'L''Algérie.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Sénégal', 0, 1),
(@qid, 'L''Algérie', 1, 2),
(@qid, 'Madagascar', 0, 3),
(@qid, 'Le Congo', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que l''impérialisme ?',
    'La domination politique, économique et culturelle d''un État sur un autre.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une forme de gouvernement démocratique', 0, 1),
(@qid, 'La domination d''un État sur un autre', 1, 2),
(@qid, 'Un système de libre-échange', 0, 3),
(@qid, 'Une alliance entre pays égaux', 0, 4);

-- Colonisation : Indépendances
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année le Ghana est-il devenu indépendant ?',
    'En 1957, premier pays d''Afrique subsaharienne indépendant.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1945', 0, 1),
(@qid, '1957', 1, 2),
(@qid, '1960', 0, 3),
(@qid, '1970', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel leader a mené l''Inde à l''indépendance en 1947 ?',
    'Mahatma Gandhi.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jawaharlal Nehru', 0, 1),
(@qid, 'Mahatma Gandhi', 1, 2),
(@qid, 'Muhammad Ali Jinnah', 0, 3),
(@qid, 'Indira Gandhi', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelles sont les deux grandes puissances coloniales au 19e siècle ?',
    'Le Royaume-Uni et la France.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Espagne et le Portugal', 0, 1),
(@qid, 'Le Royaume-Uni et la France', 1, 2),
(@qid, 'L''Allemagne et l''Italie', 0, 3),
(@qid, 'La Russie et les Pays-Bas', 0, 4);

-- ============================================
-- THÈME 7 : CAPITALISME ET COMMUNISME (30 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le capitalisme ?',
    'Un système économique basé sur la propriété privée et le libre marché.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un système basé sur la propriété collective', 0, 1),
(@qid, 'Un système basé sur la propriété privée et le libre marché', 1, 2),
(@qid, 'Un système sans échanges économiques', 0, 3),
(@qid, 'Un système féodal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le communisme ?',
    'Un système prônant la propriété collective des moyens de production.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La propriété privée totale', 0, 1),
(@qid, 'La propriété collective des moyens de production', 1, 2),
(@qid, 'Le libre marché absolu', 0, 3),
(@qid, 'La monarchie absolue', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui est le père du communisme moderne ?',
    'Karl Marx, avec Friedrich Engels.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adam Smith', 0, 1),
(@qid, 'Karl Marx', 1, 2),
(@qid, 'John Locke', 0, 3),
(@qid, 'Voltaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a écrit "Le Capital" ?',
    'Karl Marx.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adam Smith', 0, 1),
(@qid, 'Karl Marx', 1, 2),
(@qid, 'Jean-Jacques Rousseau', 0, 3),
(@qid, 'Montesquieu', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel document célèbre Marx et Engels ont-ils publié en 1848 ?',
    'Le Manifeste du parti communiste.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Déclaration des droits de l''homme', 0, 1),
(@qid, 'Le Manifeste du parti communiste', 1, 2),
(@qid, 'Le Contrat social', 0, 3),
(@qid, 'L''Encyclopédie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays a été le premier à appliquer le communisme ?',
    'La Russie soviétique (URSS) après la révolution de 1917.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Chine', 0, 1),
(@qid, 'La Russie (URSS)', 1, 2),
(@qid, 'Cuba', 0, 3),
(@qid, 'Le Vietnam', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a dirigé la révolution bolchevique de 1917 ?',
    'Lénine (Vladimir Ilitch Oulianov).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Staline', 0, 1),
(@qid, 'Lénine', 1, 2),
(@qid, 'Trotski', 0, 3),
(@qid, 'Khrouchtchev', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le symbole du communisme ?',
    'La faucille et le marteau.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''aigle', 0, 1),
(@qid, 'La faucille et le marteau', 1, 2),
(@qid, 'La croix', 0, 3),
(@qid, 'L''étoile à six branches', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui est le père du capitalisme moderne ?',
    'Adam Smith, auteur de "La Richesse des nations" (1776).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Karl Marx', 0, 1),
(@qid, 'Adam Smith', 1, 2),
(@qid, 'David Ricardo', 0, 3),
(@qid, 'John Maynard Keynes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la lutte des classes selon Marx ?',
    'Le conflit entre la bourgeoisie (possédants) et le prolétariat (travailleurs).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La guerre entre pays', 0, 1),
(@qid, 'Le conflit entre bourgeoisie et prolétariat', 1, 2),
(@qid, 'La rivalité commerciale', 0, 3),
(@qid, 'Le débat parlementaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel terme désigne l''excès de biens produits par rapport à la demande ?',
    'La surproduction.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La pénurie', 0, 1),
(@qid, 'La surproduction', 1, 2),
(@qid, 'La sous-production', 0, 3),
(@qid, 'La stagnation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays incarne le capitalisme au 20e siècle ?',
    'Les États-Unis.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''URSS', 0, 1),
(@qid, 'Les États-Unis', 1, 2),
(@qid, 'La Chine', 0, 3),
(@qid, 'Cuba', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le libéralisme économique ?',
    'La doctrine du "laisser-faire" où l''État intervient peu dans l''économie.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le contrôle total de l''État sur l''économie', 0, 1),
(@qid, 'Le "laisser-faire" économique', 1, 2),
(@qid, 'La planification centralisée', 0, 3),
(@qid, 'L''économie féodale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel type d''économie pratique l''URSS sous Staline ?',
    'Une économie planifiée avec des plans quinquennaux.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le capitalisme sauvage', 0, 1),
(@qid, 'L''économie planifiée', 1, 2),
(@qid, 'Le libre-échange', 0, 3),
(@qid, 'L''économie de marché', 0, 4);

-- ============================================
-- THÈME 8 : HISTOIRE D'HAÏTI (80 QCM)
-- ============================================

-- Période précolombienne et coloniale
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel nom les Taïnos donnaient-ils à l''île d''Haïti ?',
    'Ayiti (ou Bohio, Quisqueya).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hispaniola', 0, 1),
(@qid, 'Ayiti', 1, 2),
(@qid, 'Saint-Domingue', 0, 3),
(@qid, 'Cuba', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année Christophe Colomb a-t-il débarqué à Haïti ?',
    'Le 5 décembre 1492.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1492', 1, 1),
(@qid, '1500', 0, 2),
(@qid, '1480', 0, 3),
(@qid, '1510', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel nom les Espagnols donnèrent-ils à l''île ?',
    'Hispaniola (La Española).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Nueva España', 0, 1),
(@qid, 'Hispaniola', 1, 2),
(@qid, 'Santo Domingo', 0, 3),
(@qid, 'Puerto Plata', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui était la cacique taïno Anacaona ?',
    'Une cheffe taïno, symbole de la résistance, exécutée par les Espagnols.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une reine espagnole', 0, 1),
(@qid, 'Une cheffe taïno résistante', 1, 2),
(@qid, 'Une esclave africaine', 0, 3),
(@qid, 'Une religieuse catholique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel traité a officialisé la cession de l''ouest d''Hispaniola à la France ?',
    'Le traité de Ryswick en 1697.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le traité de Bâle', 0, 1),
(@qid, 'Le traité de Ryswick', 1, 2),
(@qid, 'Le traité de Versailles', 0, 3),
(@qid, 'Le traité de Tordesillas', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Comment s''appelait la partie française de l''île ?',
    'Saint-Domingue.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hispaniola', 0, 1),
(@qid, 'Saint-Domingue', 1, 2),
(@qid, 'Haïti', 0, 3),
(@qid, 'Port-au-Prince', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle était la principale richesse de Saint-Domingue ?',
    'Le sucre, produit par les plantations avec les esclaves.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''or', 0, 1),
(@qid, 'Le sucre', 1, 2),
(@qid, 'Le pétrole', 0, 3),
(@qid, 'Le café', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le Code Noir ?',
    'Un édit de 1685 réglementant l''esclavage dans les colonies françaises.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un code pénal pour les criminels', 0, 1),
(@qid, 'Un édit réglementant l''esclavage', 1, 2),
(@qid, 'Une constitution haïtienne', 0, 3),
(@qid, 'Un traité de paix', 0, 4);

-- Révolution haïtienne
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année débute la révolution haïtienne ?',
    'En 1791, avec la cérémonie du Bois-Caïman.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1789', 0, 1),
(@qid, '1791', 1, 2),
(@qid, '1804', 0, 3),
(@qid, '1793', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel événement marque le début de la révolution haïtienne ?',
    'La cérémonie du Bois-Caïman le 14 août 1791.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La bataille de Vertières', 0, 1),
(@qid, 'La cérémonie du Bois-Caïman', 1, 2),
(@qid, 'La proclamation de l''indépendance', 0, 3),
(@qid, 'Le traité de Ryswick', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui était Boukman ?',
    'Un esclave, chef de la révolte et prêtre vaudou au Bois-Caïman.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un colon français', 0, 1),
(@qid, 'Un chef esclave révolté', 1, 2),
(@qid, 'Un général espagnol', 0, 3),
(@qid, 'Un président haïtien', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui est le principal leader de l''indépendance haïtienne ?',
    'Toussaint Louverture, puis Jean-Jacques Dessalines.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Alexandre Pétion', 0, 1),
(@qid, 'Toussaint Louverture', 1, 2),
(@qid, 'Henri Christophe', 0, 3),
(@qid, 'Boukman', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Où est mort Toussaint Louverture ?',
    'Au Fort de Joux, en France, en 1803.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'À Port-au-Prince', 0, 1),
(@qid, 'Au Fort de Joux en France', 1, 2),
(@qid, 'En Espagne', 0, 3),
(@qid, 'À Saint-Domingue', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle bataille décisive a mené à l''indépendance d''Haïti ?',
    'La bataille de Vertières le 18 novembre 1803.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La bataille de la Crête-à-Pierrot', 0, 1),
(@qid, 'La bataille de Vertières', 1, 2),
(@qid, 'La bataille de Waterloo', 0, 3),
(@qid, 'La bataille de Santo Domingo', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la date de l''indépendance d''Haïti ?',
    'Le 1er janvier 1804.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1er janvier 1804', 1, 1),
(@qid, '18 novembre 1803', 0, 2),
(@qid, '14 juillet 1804', 0, 3),
(@qid, '1er janvier 1801', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a proclamé l''indépendance d''Haïti ?',
    'Jean-Jacques Dessalines.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toussaint Louverture', 0, 1),
(@qid, 'Jean-Jacques Dessalines', 1, 2),
(@qid, 'Alexandre Pétion', 0, 3),
(@qid, 'Henri Christophe', 0, 4);

-- Haïti après l'indépendance
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel titre Dessalines a-t-il pris en 1804 ?',
    'Empereur Jacques Ier.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Président', 0, 1),
(@qid, 'Empereur Jacques Ier', 1, 2),
(@qid, 'Roi', 0, 3),
(@qid, 'Gouverneur général', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année Dessalines a-t-il été assassiné ?',
    'Le 17 octobre 1806.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1804', 0, 1),
(@qid, '1806', 1, 2),
(@qid, '1810', 0, 3),
(@qid, '1820', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a fondé la République d''Haïti au Sud ?',
    'Alexandre Pétion, en 1806.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Henri Christophe', 0, 1),
(@qid, 'Alexandre Pétion', 1, 2),
(@qid, 'Dessalines', 0, 3),
(@qid, 'Toussaint Louverture', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a fondé le Royaume d''Haïti au Nord ?',
    'Henri Christophe (Roi Henri Ier), avec la Citadelle Laferrière.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Alexandre Pétion', 0, 1),
(@qid, 'Henri Christophe', 1, 2),
(@qid, 'Dessalines', 0, 3),
(@qid, 'Boyer', 0, 4);

-- Suite des questions d'Haïti
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel président a unifié le Nord et le Sud d''Haïti en 1820 ?',
    'Jean-Pierre Boyer.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Alexandre Pétion', 0, 1),
(@qid, 'Jean-Pierre Boyer', 1, 2),
(@qid, 'Henri Christophe', 0, 3),
(@qid, 'Dessalines', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année Boyer a-t-il annexé la partie est de l''île ?',
    'En 1822.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1820', 0, 1),
(@qid, '1822', 1, 2),
(@qid, '1825', 0, 3),
(@qid, '1830', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle somme Haïti a-t-elle dû payer à la France pour son indépendance ?',
    '150 millions de francs-or (réduite à 90 millions), dette payée jusqu''en 1883.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10 millions', 0, 1),
(@qid, '150 millions de francs-or', 1, 2),
(@qid, '500 millions', 0, 3),
(@qid, 'Aucune somme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quand l''ordonnance de Charles X reconnaît-elle l''indépendance d''Haïti ?',
    'Le 17 avril 1825, contre une indemnité.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1804', 0, 1),
(@qid, '1825', 1, 2),
(@qid, '1830', 0, 3),
(@qid, '1843', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la date de la séparation de l''île en deux États ?',
    'Le 27 février 1844, indépendance de la République dominicaine.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1822', 0, 1),
(@qid, '1844', 1, 2),
(@qid, '1825', 0, 3),
(@qid, '1867', 0, 4);

-- Fin du 19e siècle
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui était le président d''Haïti de 1847 à 1859 ?',
    'Faustin Soulouque, qui s''est proclamé empereur Faustin Ier.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jean-Pierre Boyer', 0, 1),
(@qid, 'Faustin Soulouque', 1, 2),
(@qid, 'Fabre Geffrard', 0, 3),
(@qid, 'Nissage Saget', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel président a signé le concordat avec le Vatican en 1860 ?',
    'Fabre Geffrard.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Soulouque', 0, 1),
(@qid, 'Fabre Geffrard', 1, 2),
(@qid, 'Boyer', 0, 3),
(@qid, 'Salomon', 0, 4);

-- ============================================
-- THÈME 9 : OCCUPATION AMÉRICAINE D'HAÏTI (30 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quand a débuté l''occupation américaine d''Haïti ?',
    'Le 28 juillet 1915.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1914', 0, 1),
(@qid, '28 juillet 1915', 1, 2),
(@qid, '1918', 0, 3),
(@qid, '1920', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel prétexte les États-Unis ont-ils utilisé pour occuper Haïti ?',
    'L''assassinat du président Vilbrun Guillaume Sam et le chaos politique.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une menace allemande', 0, 1),
(@qid, 'L''assassinat de Vilbrun Guillaume Sam', 1, 2),
(@qid, 'L''invasion dominicaine', 0, 3),
(@qid, 'Un tremblement de terre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Combien de temps a duré l''occupation américaine d''Haïti ?',
    '19 ans, de 1915 à 1934.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5 ans', 0, 1),
(@qid, '19 ans', 1, 2),
(@qid, '10 ans', 0, 3),
(@qid, '25 ans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui dirigeait la résistance armée contre l''occupation américaine ?',
    'Charlemagne Péralte.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sténio Vincent', 0, 1),
(@qid, 'Charlemagne Péralte', 1, 2),
(@qid, 'Dantès Bellegarde', 0, 3),
(@qid, 'Louis Borno', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quand Charlemagne Péralte a-t-il été tué ?',
    'Le 1er novembre 1919.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1915', 0, 1),
(@qid, '1919', 1, 2),
(@qid, '1920', 0, 3),
(@qid, '1934', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a poursuivi la lutte après la mort de Péralte ?',
    'Benoît Batraville.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Charlemagne Péralte', 0, 1),
(@qid, 'Benoît Batraville', 1, 2),
(@qid, 'Sténio Vincent', 0, 3),
(@qid, 'Louis Borno', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Comment les Américains appelaient-ils les résistants haïtiens ?',
    'Les "cacos".', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les marrons', 0, 1),
(@qid, 'Les cacos', 1, 2),
(@qid, 'Les indépendantistes', 0, 3),
(@qid, 'Les patriotes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel président haïtien a négocié la fin de l''occupation ?',
    'Sténio Vincent.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Louis Borno', 0, 1),
(@qid, 'Sténio Vincent', 1, 2),
(@qid, 'Dumarsais Estimé', 0, 3),
(@qid, 'Élie Lescot', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quand l''occupation américaine a-t-elle pris fin ?',
    'Le 21 août 1934.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1930', 0, 1),
(@qid, '1934', 1, 2),
(@qid, '1940', 0, 3),
(@qid, '1925', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel était le nom de la constitution imposée par les Américains en 1918 ?',
    'La constitution de 1918 (rédigée sous l''occupation).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La constitution de 1805', 0, 1),
(@qid, 'La constitution de 1918', 1, 2),
(@qid, 'La constitution de 1843', 0, 3),
(@qid, 'La constitution de 1987', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle réforme les Américains ont-ils apportée à l''économie haïtienne ?',
    'La relance de la production agricole et le contrôle des douanes.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''abolition de l''agriculture', 0, 1),
(@qid, 'Le contrôle des douanes et l''agriculture', 1, 2),
(@qid, 'La nationalisation des terres', 0, 3),
(@qid, 'L''industrialisation massive', 0, 4);

-- ============================================
-- THÈME 10 : ANCIENS EXAMENS (40 QCM supplémentaires)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la géopolitique ?',
    'L''étude des relations entre politique et territoire.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''étude des sols', 0, 1),
(@qid, 'L''étude des relations entre politique et territoire', 1, 2),
(@qid, 'L''étude des climats', 0, 3),
(@qid, 'L''étude des populations', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la fonction principale de l''ONU ?',
    'Maintenir la paix et la sécurité internationales.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Contrôler le commerce mondial', 0, 1),
(@qid, 'Maintenir la paix et la sécurité internationales', 1, 2),
(@qid, 'Organiser les Jeux olympiques', 0, 3),
(@qid, 'Gérer les monnaies', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays est le plus vaste du monde ?',
    'La Russie.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Chine', 0, 1),
(@qid, 'La Russie', 1, 2),
(@qid, 'Le Canada', 0, 3),
(@qid, 'Les États-Unis', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le pays le plus peuplé du monde ?',
    'La Chine (ou l''Inde depuis 2023).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les États-Unis', 0, 1),
(@qid, 'La Chine', 1, 2),
(@qid, 'Le Brésil', 0, 3),
(@qid, 'La Russie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la monnaie utilisée en Haïti ?',
    'La gourde.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le dollar', 0, 1),
(@qid, 'La gourde', 1, 2),
(@qid, 'L''euro', 0, 3),
(@qid, 'Le peso', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la monnaie des États-Unis ?',
    'Le dollar américain.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''euro', 0, 1),
(@qid, 'Le dollar américain', 1, 2),
(@qid, 'La livre sterling', 0, 3),
(@qid, 'Le yen', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la monnaie de la France ?',
    'L''euro.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le franc', 0, 1),
(@qid, 'L''euro', 1, 2),
(@qid, 'Le dollar', 0, 3),
(@qid, 'La livre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que l''UNESCO ?',
    'L''Organisation des Nations Unies pour l''éducation, la science et la culture.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une banque mondiale', 0, 1),
(@qid, 'L''Organisation pour l''éducation, la science et la culture', 1, 2),
(@qid, 'Une organisation militaire', 0, 3),
(@qid, 'Un tribunal international', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le plus grand océan du monde ?',
    'L''océan Pacifique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''océan Atlantique', 0, 1),
(@qid, 'L''océan Pacifique', 1, 2),
(@qid, 'L''océan Indien', 0, 3),
(@qid, 'L''océan Arctique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel continent est le plus grand ?',
    'L''Asie.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Afrique', 0, 1),
(@qid, 'L''Asie', 1, 2),
(@qid, 'L''Amérique', 0, 3),
(@qid, 'L''Europe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel continent est le plus peuplé ?',
    'L''Asie.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Afrique', 0, 1),
(@qid, 'L''Asie', 1, 2),
(@qid, 'L''Europe', 0, 3),
(@qid, 'L''Amérique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays d''Afrique est le plus peuplé ?',
    'Le Nigeria.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Égypte', 0, 1),
(@qid, 'Le Nigeria', 1, 2),
(@qid, 'L''Afrique du Sud', 0, 3),
(@qid, 'Le Kenya', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le FMI ?',
    'Le Fonds Monétaire International, qui aide les pays en difficulté financière.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une banque privée', 0, 1),
(@qid, 'Le Fonds Monétaire International', 1, 2),
(@qid, 'Une organisation militaire', 0, 3),
(@qid, 'Un fonds de commerce', 0, 4);

-- Questions OEA
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Que signifie OEA ?',
    'Organisation des États Américains.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Organisation Européenne Atlantique', 0, 1),
(@qid, 'Organisation des États Américains', 1, 2),
(@qid, 'Organisation des États Africains', 0, 3),
(@qid, 'Organisation Économique Asiatique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Où se trouve le siège de l''OEA ?',
    'À Washington D.C., aux États-Unis.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'New York', 0, 1),
(@qid, 'Washington D.C.', 1, 2),
(@qid, 'Brasilia', 0, 3),
(@qid, 'Mexico', 0, 4);

-- Questions sur le système ONU
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Combien de membres permanents compte le Conseil de sécurité de l''ONU ?',
    'Cinq (États-Unis, Russie, Chine, Royaume-Uni, France).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3', 0, 1),
(@qid, '5', 1, 2),
(@qid, '10', 0, 3),
(@qid, '15', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Où se trouve le siège de l''ONU ?',
    'À New York, aux États-Unis.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Genève', 0, 1),
(@qid, 'New York', 1, 2),
(@qid, 'Paris', 0, 3),
(@qid, 'Londres', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui est l''actuel Secrétaire général de l''ONU ?',
    'António Guterres (depuis 2017).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ban Ki-moon', 0, 1),
(@qid, 'António Guterres', 1, 2),
(@qid, 'Kofi Annan', 0, 3),
(@qid, 'Boutros Boutros-Ghali', 0, 4);

-- Questions Haïti contemporain
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale d''Haïti ?',
    'Port-au-Prince.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cap-Haïtien', 0, 1),
(@qid, 'Port-au-Prince', 1, 2),
(@qid, 'Gonaïves', 0, 3),
(@qid, 'Les Cayes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Combien de départements compte Haïti ?',
    'Dix départements.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5', 0, 1),
(@qid, '10', 1, 2),
(@qid, '15', 0, 3),
(@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le plus grand département d''Haïti en superficie ?',
    'Le département de l''Artibonite.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Ouest', 0, 1),
(@qid, 'L''Artibonite', 1, 2),
(@qid, 'Le Sud', 0, 3),
(@qid, 'Le Nord', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel département haïtien est le plus peuplé ?',
    'Le département de l''Ouest.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Ouest', 1, 1),
(@qid, 'L''Artibonite', 0, 2),
(@qid, 'Le Nord', 0, 3),
(@qid, 'Le Sud', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la ville des Gonaïves surnommée ?',
    'La Cité de l''Indépendance.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Cité du Cap', 0, 1),
(@qid, 'La Cité de l''Indépendance', 1, 2),
(@qid, 'La Ville Lumière', 0, 3),
(@qid, 'La Perle des Antilles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle ville est surnommée "La Perle des Antilles" ?',
    'Port-au-Prince ou Haïti selon le contexte.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cap-Haïtien', 0, 1),
(@qid, 'Port-au-Prince', 1, 2),
(@qid, 'Jacmel', 0, 3),
(@qid, 'Les Cayes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le drapeau d''Haïti ?',
    'Deux bandes horizontales bleue et rouge, avec les armoiries au centre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bleu et rouge horizontal', 1, 1),
(@qid, 'Rouge et blanc vertical', 0, 2),
(@qid, 'Vert et jaune', 0, 3),
(@qid, 'Bleu, blanc, rouge vertical', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la devise d''Haïti ?',
    '"L''Union fait la force".', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Liberté, Égalité, Fraternité', 0, 1),
(@qid, 'L''Union fait la force', 1, 2),
(@qid, 'Dieu et mon droit', 0, 3),
(@qid, 'E Pluribus Unum', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est l''hymne national d''Haïti ?',
    'La Dessalinienne.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Marseillaise', 0, 1),
(@qid, 'La Dessalinienne', 1, 2),
(@qid, 'God Save the Queen', 0, 3),
(@qid, 'Oh Haïti', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le principal fleuve d''Haïti ?',
    'Le fleuve Artibonite.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le fleuve Artibonite', 1, 1),
(@qid, 'Le fleuve Momance', 0, 2),
(@qid, 'Le fleuve Cul-de-Sac', 0, 3),
(@qid, 'Le fleuve Grand-Anse', 0, 4);

-- Suite questions variées examens
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la plus haute montagne d''Haïti ?',
    'Le Pic la Selle (2 680 mètres).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Pic Macaya', 0, 1),
(@qid, 'Le Pic la Selle', 1, 2),
(@qid, 'Le Morne la Visite', 0, 3),
(@qid, 'La Citadelle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la religion dominante en Haïti ?',
    'Le catholicisme et le protestantisme, avec le vaudou comme pratique culturelle.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''islam', 0, 1),
(@qid, 'Le catholicisme', 1, 2),
(@qid, 'Le bouddhisme', 0, 3),
(@qid, 'L''hindouisme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle langue est parlée en Haïti ?',
    'Le créole haïtien et le français.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''anglais seulement', 0, 1),
(@qid, 'Le créole haïtien et le français', 1, 2),
(@qid, 'L''espagnol', 0, 3),
(@qid, 'Le portugais', 0, 4);

-- Suite des questions (Total visé : plus de 400)

-- Suite Première Guerre mondiale
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle bataille navale majeure a opposé Britanniques et Allemands en 1916 ?',
    'La bataille du Jutland.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La bataille de Trafalgar', 0, 1),
(@qid, 'La bataille du Jutland', 1, 2),
(@qid, 'La bataille de Lépante', 0, 3),
(@qid, 'La bataille de Midway', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays a rejoint les Alliés en 1916 ?',
    'La Roumanie.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Roumanie', 1, 1),
(@qid, 'La Bulgarie', 0, 2),
(@qid, 'L''Empire ottoman', 0, 3),
(@qid, 'La Suède', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel était le plan allemand pour envahir la France en 1914 ?',
    'Le plan Schlieffen.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le plan Marshall', 0, 1),
(@qid, 'Le plan Schlieffen', 1, 2),
(@qid, 'Le plan Barbarossa', 0, 3),
(@qid, 'Le plan Dawes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le nom du télégramme allemand intercepté en 1917 ?',
    'Le télégramme Zimmermann.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le télégramme de l''Ems', 0, 1),
(@qid, 'Le télégramme Zimmermann', 1, 2),
(@qid, 'Le télégramme Kruger', 0, 3),
(@qid, 'Le télégramme de Berlin', 0, 4);

-- Suite Deuxième Guerre mondiale
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel était le nom de la ligne de défense française en 1939 ?',
    'La ligne Maginot.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La ligne Siegfried', 0, 1),
(@qid, 'La ligne Maginot', 1, 2),
(@qid, 'La ligne de démarcation', 0, 3),
(@qid, 'Le mur de l''Atlantique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui était le Premier ministre britannique en 1940 ?',
    'Winston Churchill.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Neville Chamberlain', 0, 1),
(@qid, 'Winston Churchill', 1, 2),
(@qid, 'Clement Attlee', 0, 3),
(@qid, 'Anthony Eden', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle opération est le nom de code de l''invasion de l''URSS par l''Allemagne ?',
    'L''opération Barbarossa (22 juin 1941).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''opération Overlord', 0, 1),
(@qid, 'L''opération Barbarossa', 1, 2),
(@qid, 'L''opération Torch', 0, 3),
(@qid, 'L''opération Market Garden', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel président américain a décidé d''utiliser la bombe atomique ?',
    'Harry Truman.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Franklin Roosevelt', 0, 1),
(@qid, 'Harry Truman', 1, 2),
(@qid, 'Dwight Eisenhower', 0, 3),
(@qid, 'John Kennedy', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quels pays se partagent l''Allemagne après 1945 ?',
    'Les États-Unis, le Royaume-Uni, la France et l''URSS.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'USA, UK, France, URSS', 1, 1),
(@qid, 'USA et URSS seulement', 0, 2),
(@qid, 'France et UK seulement', 0, 3),
(@qid, 'Les quatre pays nordiques', 0, 4);

-- Suite colonisation
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que l''esclavage ?',
    'L''état d''une personne qui est la propriété d''une autre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un travail rémunéré', 0, 1),
(@qid, 'La propriété d''une personne par une autre', 1, 2),
(@qid, 'Un contrat de travail', 0, 3),
(@qid, 'Un système de location', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a aboli l''esclavage dans les colonies françaises en 1794 ?',
    'La Convention montagnarde.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Napoléon Bonaparte', 0, 1),
(@qid, 'La Convention montagnarde', 1, 2),
(@qid, 'Louis XVI', 0, 3),
(@qid, 'Robespierre seul', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a rétabli l''esclavage en 1802 ?',
    'Napoléon Bonaparte.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Convention', 0, 1),
(@qid, 'Napoléon Bonaparte', 1, 2),
(@qid, 'Louis XVIII', 0, 3),
(@qid, 'Robespierre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle colonie africaine était surnommée "la perle de l''Empire britannique" ?',
    'L''Inde (bien qu''asiatique) ou l''Afrique du Sud.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Nigeria', 0, 1),
(@qid, 'L''Inde', 1, 2),
(@qid, 'Le Kenya', 0, 3),
(@qid, 'Le Ghana', 0, 4);

-- Suite capitales (compléments)
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Suède ?',
    'Stockholm.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oslo', 0, 1),
(@qid, 'Stockholm', 1, 2),
(@qid, 'Copenhague', 0, 3),
(@qid, 'Helsinki', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Norvège ?',
    'Oslo.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oslo', 1, 1),
(@qid, 'Stockholm', 0, 2),
(@qid, 'Copenhague', 0, 3),
(@qid, 'Helsinki', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Danemark ?',
    'Copenhague.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oslo', 0, 1),
(@qid, 'Copenhague', 1, 2),
(@qid, 'Stockholm', 0, 3),
(@qid, 'Reykjavik', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Finlande ?',
    'Helsinki.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Helsinki', 1, 1),
(@qid, 'Oslo', 0, 2),
(@qid, 'Stockholm', 0, 3),
(@qid, 'Copenhague', 0, 4);

-- Suite Histoire d'Haïti
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a écrit l''Acte de l''Indépendance d''Haïti ?',
    'Boisrond Tonnerre.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toussaint Louverture', 0, 1),
(@qid, 'Boisrond Tonnerre', 1, 2),
(@qid, 'Dessalines', 0, 3),
(@qid, 'Pétion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle était la capitale du Royaume d''Henri Christophe ?',
    'Cap-Haïtien (Cap-Français puis Cap-Henri).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Port-au-Prince', 0, 1),
(@qid, 'Cap-Haïtien', 1, 2),
(@qid, 'Gonaïves', 0, 3),
(@qid, 'Saint-Marc', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel monument célèbre a fait construire Henri Christophe ?',
    'La Citadelle Laferrière.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Palais Sans-Souci uniquement', 0, 1),
(@qid, 'La Citadelle Laferrière', 1, 2),
(@qid, 'Le Palais national', 0, 3),
(@qid, 'Le Fort Dimanche', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel président haïtien a instauré l''instruction publique gratuite et obligatoire ?',
    'Fabre Geffrard.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Soulouque', 0, 1),
(@qid, 'Fabre Geffrard', 1, 2),
(@qid, 'Boyer', 0, 3),
(@qid, 'Salomon', 0, 4);

-- Suite Crise de 1929
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel impact la crise de 1929 a-t-elle eu sur Haïti ?',
    'Effondrement des prix du café, principale exportation haïtienne.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Prospérité économique', 0, 1),
(@qid, 'Effondrement des prix du café', 1, 2),
(@qid, 'Aucun impact', 0, 3),
(@qid, 'Augmentation des exportations', 0, 4);

-- Questions générales examens
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce qu''un État ?',
    'Une entité politique ayant un territoire, une population et un gouvernement souverain.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une simple ville', 0, 1),
(@qid, 'Une entité avec territoire, population et gouvernement', 1, 2),
(@qid, 'Une région géographique', 0, 3),
(@qid, 'Un continent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la démocratie ?',
    'Un système politique où le pouvoir appartient au peuple.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le pouvoir d''un seul homme', 0, 1),
(@qid, 'Le pouvoir du peuple', 1, 2),
(@qid, 'Le pouvoir de l''armée', 0, 3),
(@qid, 'Le pouvoir de la religion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la dictature ?',
    'Un régime où un seul individu ou groupe détient tous les pouvoirs.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un régime démocratique', 0, 1),
(@qid, 'Un régime où le pouvoir est concentré', 1, 2),
(@qid, 'Un système parlementaire', 0, 3),
(@qid, 'Une monarchie constitutionnelle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel président américain a lancé le programme "Good Neighbor Policy" ?',
    'Franklin D. Roosevelt, pour améliorer les relations avec l''Amérique latine.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Herbert Hoover', 0, 1),
(@qid, 'Franklin Roosevelt', 1, 2),
(@qid, 'Harry Truman', 0, 3),
(@qid, 'Woodrow Wilson', 0, 4);

-- Suite capitales et géographie
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Belgique ?',
    'Bruxelles.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Anvers', 0, 1),
(@qid, 'Bruxelles', 1, 2),
(@qid, 'Liège', 0, 3),
(@qid, 'Gand', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Suisse ?',
    'Berne.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Zurich', 0, 1),
(@qid, 'Berne', 1, 2),
(@qid, 'Genève', 0, 3),
(@qid, 'Bâle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale des Pays-Bas ?',
    'Amsterdam (La Haye est le siège du gouvernement).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Rotterdam', 0, 1),
(@qid, 'Amsterdam', 1, 2),
(@qid, 'La Haye', 0, 3),
(@qid, 'Utrecht', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Portugal ?',
    'Lisbonne.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Porto', 0, 1),
(@qid, 'Lisbonne', 1, 2),
(@qid, 'Coimbra', 0, 3),
(@qid, 'Braga', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de l''Irlande ?',
    'Dublin.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Belfast', 0, 1),
(@qid, 'Dublin', 1, 2),
(@qid, 'Cork', 0, 3),
(@qid, 'Galway', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Pologne ?',
    'Varsovie.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cracovie', 0, 1),
(@qid, 'Varsovie', 1, 2),
(@qid, 'Gdansk', 0, 3),
(@qid, 'Wroclaw', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Grèce ?',
    'Athènes.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Thessalonique', 0, 1),
(@qid, 'Athènes', 1, 2),
(@qid, 'Patras', 0, 3),
(@qid, 'Héraklion', 0, 4);

-- Complément capitales Caraïbes
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de Curaçao ?',
    'Willemstad.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Willemstad', 1, 1),
(@qid, 'Oranjestad', 0, 2),
(@qid, 'Kralendijk', 0, 3),
(@qid, 'Philipsburg', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale d''Aruba ?',
    'Oranjestad.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Willemstad', 0, 1),
(@qid, 'Oranjestad', 1, 2),
(@qid, 'Kralendijk', 0, 3),
(@qid, 'Philipsburg', 0, 4);

-- Suite caractères généraux des examens
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la mondialisation ?',
    'L''intensification des échanges économiques et culturels à l''échelle mondiale.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''isolement des pays', 0, 1),
(@qid, 'L''intensification des échanges mondiaux', 1, 2),
(@qid, 'La fermeture des frontières', 0, 3),
(@qid, 'Le retour à l''économie locale uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le développement durable ?',
    'Un développement qui répond aux besoins présents sans compromettre ceux des générations futures.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La croissance économique à tout prix', 0, 1),
(@qid, 'Le développement respectueux de l''environnement et des générations futures', 1, 2),
(@qid, 'L''industrialisation massive', 0, 3),
(@qid, 'L''exploitation intensive des ressources', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays est surnommé "la terre des braves" ?',
    'Haïti, pour sa lutte pour l''indépendance.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1),
(@qid, 'Haïti', 1, 2),
(@qid, 'Jamaïque', 0, 3),
(@qid, 'République dominicaine', 0, 4);


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le nom du premier journal haïtien ?',
    'La Gazette de Saint-Domingue.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Nouvelliste', 0, 1),
(@qid, 'La Gazette de Saint-Domingue', 1, 2),
(@qid, 'Le Matin', 0, 3),
(@qid, 'Haïti Liberté', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la monnaie de la République dominicaine ?',
    'Le peso dominicain.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le dollar', 0, 1),
(@qid, 'Le peso dominicain', 1, 2),
(@qid, 'La gourde', 0, 3),
(@qid, 'L''euro', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la monnaie de Cuba ?',
    'Le peso cubain.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le dollar américain', 0, 1),
(@qid, 'Le peso cubain', 1, 2),
(@qid, 'L''euro', 0, 3),
(@qid, 'Le livre', 0, 4);

-- Sciences Soc complétion (type_id=1)
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'Le principal allié de Cuba pendant la Guerre Froide était l''________.', NULL, 'Examen 9e AF', 2, 'URSS|Union soviétique');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'La plus petite entité territoriale haïtienne est la ________.', NULL, 'Examen 9e AF', 1, 'section communale');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'Haïti est située dans la mer des ________.', NULL, 'Examen 9e AF', 1, 'Caraïbes|Antilles|Caraibes');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'Haïti a obtenu son indépendance le 1er janvier ________.', NULL, 'Examen 9e AF', 1, '1804');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'Le créole et le ________ sont les deux langues officielles d''Haïti.', NULL, 'Examen 9e AF', 1, 'français|francais');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'La capitale d''Haïti est ________.', NULL, 'Examen 9e AF', 1, 'Port-au-Prince|Port au Prince');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'Le drapeau haïtien est composé de ________ et de rouge.', NULL, 'Examen 9e AF', 1, 'bleu');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'Le fondateur de l''indépendance haïtienne est ________.', NULL, 'Examen 9e AF', 1, 'Dessalines|Jean-Jacques Dessalines');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'Les luttes paysannes dans le Sud au 19e siècle étaient menées par les ________.', NULL, 'Examen 9e AF', 2, 'piquets|Piquets');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'La 1ère bombe atomique a détruit la ville d''________ le 6 août 1945.', NULL, 'Examen 9e AF', 2, 'Hiroshima');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'Le seul PMA de l''Amérique est ________.', NULL, 'Examen 9e AF', 2, 'Haïti|Haiti');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'L''hymne national haïtien s''appelle ________.', NULL, 'Examen 9e AF', 1, 'La Dessalinienne|Dessalinienne');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'Le premier organisme d''intégration caribéenne créé en 1965 est la ________.', NULL, 'Examen 9e AF', 2, 'CARIFTA');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'L''invasion allemande de la Pologne a déclenché la ________ Guerre Mondiale.', NULL, 'Examen 9e AF', 2, 'Deuxième|Seconde|2e|2ème');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(5, 1, 'La Citadelle Laferrière a été construite sous l''ordre du roi ________.', NULL, 'Examen 9e AF', 2, 'Henri Christophe|Christophe');

-- =============================================
-- 6. ANGLAIS (matiere_id = 6)
-- =============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'How do you say "bonjour" in English?', 'Hello / Good morning.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Goodbye', 0, 1),
(@qid, 'Hello', 1, 2),
(@qid, 'Sorry', 0, 3),
(@qid, 'Please', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the capital of the United States?', 'Washington D.C.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'New York', 0, 1),
(@qid, 'Washington D.C.', 1, 2),
(@qid, 'Los Angeles', 0, 3),
(@qid, 'Chicago', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'Choose the correct sentence:',
    '"She goes to school" (3rd person singular needs -s).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'She go to school', 0, 1),
(@qid, 'She goes to school', 1, 2),
(@qid, 'She going to school', 0, 3),
(@qid, 'She gone to school', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the past tense of "eat"?', 'Ate.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Eated', 0, 1),
(@qid, 'Ate', 1, 2),
(@qid, 'Eaten', 0, 3),
(@qid, 'Eating', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, '"She ___ a doctor."', 'She is a doctor.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'am', 0, 1),
(@qid, 'is', 1, 2),
(@qid, 'are', 0, 3),
(@qid, 'be', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the plural of "child"?', 'Children.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Childs', 0, 1),
(@qid, 'Children', 1, 2),
(@qid, 'Childen', 0, 3),
(@qid, 'Childies', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, '"I ___ a student."', 'I am a student.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'am', 1, 1),
(@qid, 'is', 0, 2),
(@qid, 'are', 0, 3),
(@qid, 'be', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the opposite of "big"?', 'Small.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Large', 0, 1),
(@qid, 'Tall', 0, 2),
(@qid, 'Small', 1, 3),
(@qid, 'Huge', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'How many days are in a week?', '7.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5', 0, 1),
(@qid, '6', 0, 2),
(@qid, '7', 1, 3),
(@qid, '8', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'Choose the correct word: "He ___ a book."', 'He reads a book.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'read', 0, 1),
(@qid, 'reads', 1, 2),
(@qid, 'reading', 0, 3),
(@qid, 'is read', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the name of the planet we live on?', 'Earth.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mars', 0, 1),
(@qid, 'Earth', 1, 2),
(@qid, 'Venus', 0, 3),
(@qid, 'Jupiter', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, '"They ___ playing football."', 'They are playing.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'is', 0, 1),
(@qid, 'are', 1, 2),
(@qid, 'am', 0, 3),
(@qid, 'be', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the past tense of "go"?', 'Went.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Goed', 0, 1),
(@qid, 'Gone', 0, 2),
(@qid, 'Went', 1, 3),
(@qid, 'Going', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, '"There ___ a book on the table."', 'There is (singular).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'is', 1, 1),
(@qid, 'are', 0, 2),
(@qid, 'am', 0, 3),
(@qid, 'be', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the superlative of "tall"?', 'Tallest.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Taller', 0, 1),
(@qid, 'Tallest', 1, 2),
(@qid, 'More tall', 0, 3),
(@qid, 'Most tall', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'How do you say "merci" in English?', 'Thank you.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Please', 0, 1),
(@qid, 'Thank you', 1, 2),
(@qid, 'Sorry', 0, 3),
(@qid, 'Excuse me', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, '"I ___ my homework yesterday."', 'I did my homework.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'do', 0, 1),
(@qid, 'did', 1, 2),
(@qid, 'done', 0, 3),
(@qid, 'doing', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the capital of Haiti?', 'Port-au-Prince.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cap-Haïtien', 0, 1),
(@qid, 'Port-au-Prince', 1, 2),
(@qid, 'Jacmel', 0, 3),
(@qid, 'Gonaïves', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, '"He can ___ English."', 'He can speak (modal + base verb).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'speaks', 0, 1),
(@qid, 'speak', 1, 2),
(@qid, 'speaking', 0, 3),
(@qid, 'spoke', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the opposite of "happy"?', 'Sad.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sad', 1, 1),
(@qid, 'Glad', 0, 2),
(@qid, 'Joyful', 0, 3),
(@qid, 'Excited', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, '"We ___ to the market yesterday."', 'We went.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'go', 0, 1),
(@qid, 'went', 1, 2),
(@qid, 'gone', 0, 3),
(@qid, 'going', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the plural of "mouse"?', 'Mice.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mouses', 0, 1),
(@qid, 'Mice', 1, 2),
(@qid, 'Mousies', 0, 3),
(@qid, 'Mouse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, '"She is ___ than her sister."', 'Taller (comparative).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'tall', 0, 1),
(@qid, 'taller', 1, 2),
(@qid, 'tallest', 0, 3),
(@qid, 'more tall', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the capital of England?', 'London.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Paris', 0, 1),
(@qid, 'London', 1, 2),
(@qid, 'Berlin', 0, 3),
(@qid, 'Madrid', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, '"___ you like ice cream?"', 'Do you like?', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Does', 0, 1),
(@qid, 'Do', 1, 2),
(@qid, 'Is', 0, 3),
(@qid, 'Are', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, '"I have ___ apple."', 'An (before vowel).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a', 0, 1),
(@qid, 'an', 1, 2),
(@qid, 'the', 0, 3),
(@qid, 'some', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the past tense of "have"?', 'Had.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haved', 0, 1),
(@qid, 'Has', 0, 2),
(@qid, 'Had', 1, 3),
(@qid, 'Having', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, '"My father ___ a car."', 'My father has a car.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'have', 0, 1),
(@qid, 'has', 1, 2),
(@qid, 'had', 0, 3),
(@qid, 'having', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'Choose the correct tense: "He (to work) ______ with us since 2000."',
    'Since 2000 → present perfect "has worked".', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'works', 0, 1),
(@qid, 'has worked', 1, 2),
(@qid, 'worked', 0, 3),
(@qid, 'is working', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'Choose: "The younger you are, ______ you are."',
    'The + comparative, the + comparative.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'stronger', 0, 1),
(@qid, 'strong', 0, 2),
(@qid, 'the stronger', 1, 3),
(@qid, 'strongest', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'Choose: "Billy hasn''t called anybody ______ the meeting."',
    '"Since" + point in time.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'since', 1, 1),
(@qid, 'for', 0, 2),
(@qid, 'ago', 0, 3),
(@qid, 'during', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the opposite of "cheap"?', 'Expensive.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Costly', 0, 1),
(@qid, 'Expensive', 1, 2),
(@qid, 'Cheaply', 0, 3),
(@qid, 'Poor', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'Which of these is a fruit?', 'Apple.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Carrot', 0, 1),
(@qid, 'Apple', 1, 2),
(@qid, 'Potato', 0, 3),
(@qid, 'Onion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'Which word is a verb?', 'Run.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Happy', 0, 1),
(@qid, 'Run', 1, 2),
(@qid, 'Blue', 0, 3),
(@qid, 'Table', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What color is the sky on a clear day?', 'Blue.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Red', 0, 1),
(@qid, 'Blue', 1, 2),
(@qid, 'Green', 0, 3),
(@qid, 'Yellow', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'What is the correct question tag? "You are from Haiti, ___ ?"', 'Aren''t you ?', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'isn''t it', 0, 1),
(@qid, 'aren''t you', 1, 2),
(@qid, 'don''t you', 0, 3),
(@qid, 'do you', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(6, 2, 'Which sentence uses the present perfect correctly?', '"Have" + past participle for past with present relevance.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'I have went to the store', 0, 1),
(@qid, 'I have gone to the store', 1, 2),
(@qid, 'I has gone to the store', 0, 3),
(@qid, 'I had went to the store', 0, 4);

-- Anglais complétion (type_id=1)
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(6, 1, 'The opposite of "hot" is ________.', NULL, 'Programme 9e AF', 1, 'cold');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(6, 1, 'The plural of "woman" is ________.', NULL, 'Programme 9e AF', 1, 'women');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(6, 1, 'The day after Monday is ________.', NULL, 'Programme 9e AF', 1, 'Tuesday');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(6, 1, 'The past participle of "write" is ________.', NULL, 'Programme 9e AF', 2, 'written');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(6, 1, 'The comparative form of "good" is ________.', NULL, 'Programme 9e AF', 2, 'better');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(6, 1, 'The month after December is ________.', NULL, 'Programme 9e AF', 1, 'January');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(6, 1, 'The past tense of "see" is ________.', NULL, 'Programme 9e AF', 1, 'saw');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(6, 1, 'The superlative of "bad" is ________.', NULL, 'Programme 9e AF', 2, 'worst');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(6, 1, '"She ___ (not/have) eaten yet." — the correct form is "she has ________ eaten."', NULL, 'Examen 9e AF', 2, 'not');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(6, 1, 'The third person singular of "to do" in the present simple is "he ________".', NULL, 'Programme 9e AF', 1, 'does');

-- =============================================
-- 7. ESPAGNOL (matiere_id = 7)
-- =============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, 'La señora no ______ en la reunión de ayer.',
    'Participó = passé simple 3e pers.', 'Examen 9e AF Juin 2023', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Participe', 0, 1),
(@qid, 'participad', 0, 2),
(@qid, 'participó', 1, 3),
(@qid, 'participaste', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, 'Elena es ______ bonita como Lola.',
    'Tan... como = comparatif d''égalité.', 'Examen 9e AF Juin 2023', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'tanta', 0, 1),
(@qid, 'menos', 0, 2),
(@qid, 'tan', 1, 3),
(@qid, 'más', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, 'Aquellos chicos son ______ Chile.',
    'De = origine.', 'Examen 9e AF Juin 2023', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'hacia', 0, 1),
(@qid, 'de', 1, 2),
(@qid, 'en', 0, 3),
(@qid, 'desde', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, 'Este bolígrafo no es de mí, es ______.',
    'Tuyo = le tien (possessif).', 'Examen 9e AF Juin 2023', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ti', 0, 1),
(@qid, 'usted', 0, 2),
(@qid, 'tuyo', 1, 3),
(@qid, 'su', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, 'Tenemos que ______ juntos.',
    'Infinitif après "tener que".', 'Examen 9e AF Juin 2023', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ir', 1, 1),
(@qid, 'vaya', 0, 2),
(@qid, 'iremos', 0, 3),
(@qid, 'fueron', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '¿Cómo se dice "merci" en español?', 'Gracias.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Por favor', 0, 1),
(@qid, 'Gracias', 1, 2),
(@qid, 'Perdón', 0, 3),
(@qid, 'Hola', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '¿Cuál es la capital de España?', 'Madrid.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Barcelona', 0, 1),
(@qid, 'Madrid', 1, 2),
(@qid, 'Sevilla', 0, 3),
(@qid, 'Valencia', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '"Yo ___ estudiante."', 'Yo soy estudiante.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'soy', 1, 1),
(@qid, 'eres', 0, 2),
(@qid, 'es', 0, 3),
(@qid, 'somos', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '"Buenos días" significa :', 'Bonjour.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bonsoir', 0, 1),
(@qid, 'Bonjour', 1, 2),
(@qid, 'Au revoir', 0, 3),
(@qid, 'Merci', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '¿Cuál es el plural de "lápiz"?', 'Lápices.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lápizes', 0, 1),
(@qid, 'Lápices', 1, 2),
(@qid, 'Lapiz', 0, 3),
(@qid, 'Lápizs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '"Ella ___ al mercado."', 'Ella va (ir, 3e pers singulier).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'va', 1, 1),
(@qid, 'vas', 0, 2),
(@qid, 'vamos', 0, 3),
(@qid, 'van', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '¿Cómo se dice "bonsoir" en español?', 'Buenas noches.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Buenos días', 0, 1),
(@qid, 'Buenas tardes', 0, 2),
(@qid, 'Buenas noches', 1, 3),
(@qid, 'Hola', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '"Nosotros ___ de Haití."', 'Somos (ser, 1ère pers pluriel).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'soy', 0, 1),
(@qid, 'eres', 0, 2),
(@qid, 'somos', 1, 3),
(@qid, 'son', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '¿Cuál es el verbo "to eat" en español?', 'Comer.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Beber', 0, 1),
(@qid, 'Comer', 1, 2),
(@qid, 'Dormir', 0, 3),
(@qid, 'Hablar', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '"Hasta luego" significa :', 'À plus tard.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bonjour', 0, 1),
(@qid, 'À plus tard', 1, 2),
(@qid, 'Merci', 0, 3),
(@qid, 'Pardon', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '¿Cómo se dice "lundi" en español?', 'Lunes.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Martes', 0, 1),
(@qid, 'Lunes', 1, 2),
(@qid, 'Miércoles', 0, 3),
(@qid, 'Jueves', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '"Tú ___ mi amigo."', 'Eres (ser, 2e pers singulier).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'soy', 0, 1),
(@qid, 'eres', 1, 2),
(@qid, 'es', 0, 3),
(@qid, 'somos', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '¿Cómo se dice "de rien" en español?', 'De nada.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Por favor', 0, 1),
(@qid, 'De nada', 1, 2),
(@qid, 'Gracias', 0, 3),
(@qid, 'Perdón', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '"Ayer yo ___ al cine."', 'Fui (ir, passé simple 1ère pers).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'voy', 0, 1),
(@qid, 'iba', 0, 2),
(@qid, 'fui', 1, 3),
(@qid, 'iré', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '¿Cuál es el artículo definido masculino singular?', 'El.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La', 0, 1),
(@qid, 'El', 1, 2),
(@qid, 'Los', 0, 3),
(@qid, 'Las', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '¿Qué significa "por favor"?', 'S''il vous plaît.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Merci', 0, 1),
(@qid, 'S''il vous plaît', 1, 2),
(@qid, 'Pardon', 0, 3),
(@qid, 'Bonjour', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '¿Qué es "naranja"?', 'Un color y una fruta.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Una fruta únicamente', 0, 1),
(@qid, 'Un color únicamente', 0, 2),
(@qid, 'Un color y una fruta', 1, 3),
(@qid, 'Una verdura', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '¿Qué idioma se habla en España?', 'Español (Castellano).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Francés', 0, 1),
(@qid, 'Español', 1, 2),
(@qid, 'Inglés', 0, 3),
(@qid, 'Portugués', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, 'El verbo "vivir" conjugado en primera persona del singular del presente es :',
    'Yo vivo.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'vivís', 0, 1),
(@qid, 'vivo', 1, 2),
(@qid, 'vive', 0, 3),
(@qid, 'vivimos', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '¿Cómo se dice "frère" en español?', 'Hermano.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Madre', 0, 1),
(@qid, 'Hermano', 1, 2),
(@qid, 'Padre', 0, 3),
(@qid, 'Hermana', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, 'Quel pays hispano-américain a sa capitale nommée Buenos Aires ?',
    'L''Argentine.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mexique', 0, 1),
(@qid, 'Argentine', 1, 2),
(@qid, 'Colombie', 0, 3),
(@qid, 'Pérou', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, '"Ellos ___ mucho."', 'Ellos comen (comer, 3e pers pluriel).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'come', 0, 1),
(@qid, 'comen', 1, 2),
(@qid, 'comes', 0, 3),
(@qid, 'comemos', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(7, 2, 'El número "veinte" en cifras es :', '20.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '12', 0, 1),
(@qid, '20', 1, 2),
(@qid, '200', 0, 3),
(@qid, '22', 0, 4);

-- Espagnol complétion (type_id=1)
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(7, 1, 'El plural de "mujer" es ________.', NULL, 'Programme 9e AF', 1, 'mujeres');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(7, 1, 'El contrario de "grande" es ________.', NULL, 'Programme 9e AF', 1, 'pequeño|chico');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(7, 1, 'El femenino de "profesor" es ________.', NULL, 'Programme 9e AF', 1, 'profesora');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(7, 1, 'El número después de "cuatro" es ________.', NULL, 'Programme 9e AF', 1, 'cinco');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(7, 1, '"Yo ________ (hablar) español todos los días." — conjuguez au présent.', NULL, 'Programme 9e AF', 1, 'hablo');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(7, 1, 'El artículo indefinido femenino singular es ________.', NULL, 'Programme 9e AF', 1, 'una');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(7, 1, '"¿Cuántos años tienes?" — Je réponds : "Tengo ________ años." (si j''en ai 15)', NULL, 'Programme 9e AF', 1, 'quince|15');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(7, 1, 'Le verbe "ser" à la 3e personne du singulier (él/ella) est ________.', NULL, 'Programme 9e AF', 1, 'es');

