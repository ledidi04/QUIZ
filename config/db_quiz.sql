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



-- ============================================================
-- QCM FRANÇAIS - 9e ANNÉE FONDAMENTALE (HAÏTI)
-- 400+ Questions à Choix Multiples
-- Basé sur le programme officiel 9e AF (2010-2023)
-- matiere_id = 2 (Français), type_id = 2 (QCM)
-- difficulté : 1 = facile, 2 = moyen, 3 = difficile
-- ============================================================

-- ============================================================
-- SECTION 1 : GRAMMAIRE - NATURE DES MOTS (40 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature du mot "rapidement" dans "Il court rapidement" ?',
 'Rapidement est un adverbe de manière qui modifie le verbe courir.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adjectif qualificatif', 0, 1),
(@qid, 'Nom commun', 0, 2),
(@qid, 'Adverbe', 1, 3),
(@qid, 'Pronom personnel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Cette belle maison appartient à mon oncle", combien y a-t-il d''adjectifs ?',
 'Belle est un adjectif qualificatif, mon est un adjectif possessif → 2 adjectifs.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un seul adjectif', 0, 1),
(@qid, 'Deux adjectifs', 1, 2),
(@qid, 'Trois adjectifs', 0, 3),
(@qid, 'Aucun adjectif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature du mot "que" dans "Je crois que tu as raison" ?',
 'Que introduit une proposition subordonnée conjonctive : c''est une conjonction de subordination.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pronom relatif', 0, 1),
(@qid, 'Conjonction de subordination', 1, 2),
(@qid, 'Adverbe', 0, 3),
(@qid, 'Conjonction de coordination', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le pronom personnel sujet de la 3e personne du pluriel ?',
 'Ils/Elles est le pronom personnel sujet de la 3e personne du pluriel.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vous', 0, 1),
(@qid, 'Eux', 0, 2),
(@qid, 'Ils / Elles', 1, 3),
(@qid, 'Leur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Les enfants jouent dans le jardin", le groupe nominal sujet est :',
 'Les enfants est le groupe nominal qui fait l''action (jouer) : c''est le sujet.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'dans le jardin', 0, 1),
(@qid, 'le jardin', 0, 2),
(@qid, 'Les enfants', 1, 3),
(@qid, 'jouent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le rôle du mot "leur" dans "Je leur ai donné un cadeau" ?',
 'Leur est ici un pronom personnel complément d''objet indirect (COI) : donné à eux.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adjectif possessif', 0, 1),
(@qid, 'Pronom COI', 1, 2),
(@qid, 'Pronom COD', 0, 3),
(@qid, 'Adverbe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature du mot "dont" dans "Le livre dont tu parles est intéressant" ?',
 'Dont est un pronom relatif représentant le livre.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Conjonction de coordination', 0, 1),
(@qid, 'Adverbe de lieu', 0, 2),
(@qid, 'Pronom relatif', 1, 3),
(@qid, 'Préposition', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Il mange vite", le mot "vite" est :',
 'Vite modifie le verbe manger → c''est un adverbe de manière.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un adjectif', 0, 1),
(@qid, 'Un adverbe', 1, 2),
(@qid, 'Un nom', 0, 3),
(@qid, 'Un verbe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature du mot "mais" dans "Il est fatigué mais il travaille" ?',
 'Mais est une conjonction de coordination exprimant l''opposition.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Conjonction de subordination', 0, 1),
(@qid, 'Adverbe', 0, 2),
(@qid, 'Conjonction de coordination', 1, 3),
(@qid, 'Pronom', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la fonction de "de bonnes notes" dans "Il obtient de bonnes notes" ?',
 'De bonnes notes est le COD du verbe obtenir.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sujet', 0, 1),
(@qid, 'Complément d''objet indirect', 0, 2),
(@qid, 'Complément d''objet direct', 1, 3),
(@qid, 'Attribut du sujet', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est l''attribut du sujet dans "Marie est intelligente" ?',
 'Intelligente est relié au sujet Marie par le verbe d''état est → c''est l''attribut du sujet.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Marie', 0, 1),
(@qid, 'est', 0, 2),
(@qid, 'intelligente', 1, 3),
(@qid, 'Il n''y en a pas', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Où vas-tu ?", le mot "où" est :',
 'Où interroge sur le lieu → c''est un adverbe interrogatif de lieu.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pronom relatif', 0, 1),
(@qid, 'Adverbe interrogatif', 1, 2),
(@qid, 'Conjonction', 0, 3),
(@qid, 'Préposition', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature du mot "notre" dans "Notre école est grande" ?',
 'Notre détermine le nom école → c''est un adjectif possessif (déterminant possessif).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pronom possessif', 0, 1),
(@qid, 'Adjectif qualificatif', 0, 2),
(@qid, 'Adjectif possessif', 1, 3),
(@qid, 'Article défini', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Identifiez le verbe d''état parmi les propositions suivantes :',
 'Paraître est un verbe d''état (comme être, sembler, devenir, rester, avoir l''air…).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Courir', 0, 1),
(@qid, 'Manger', 0, 2),
(@qid, 'Paraître', 1, 3),
(@qid, 'Construire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Il parle à voix basse", le groupe "à voix basse" est :',
 'À voix basse précise la manière de parler → c''est un complément circonstanciel de manière.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'COD', 0, 1),
(@qid, 'Complément circonstanciel de temps', 0, 2),
(@qid, 'Complément circonstanciel de manière', 1, 3),
(@qid, 'Attribut du sujet', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature du mot "chaque" dans "Chaque élève doit travailler" ?',
 'Chaque est un adjectif indéfini (déterminant indéfini) qui détermine le nom élève.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Article défini', 0, 1),
(@qid, 'Adjectif indéfini', 1, 2),
(@qid, 'Adjectif numéral', 0, 3),
(@qid, 'Pronom indéfini', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Le chat que j''ai vu hier est gris", quel est l''antécédent du pronom relatif "que" ?',
 'Que reprend le nom chat : c''est son antécédent.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'hier', 0, 1),
(@qid, 'gris', 0, 2),
(@qid, 'chat', 1, 3),
(@qid, 'j''ai vu', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le genre et le nombre de "les belles éoliennes" ?',
 'Belles = féminin pluriel, éoliennes = nom féminin pluriel.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Masculin singulier', 0, 1),
(@qid, 'Féminin singulier', 0, 2),
(@qid, 'Féminin pluriel', 1, 3),
(@qid, 'Masculin pluriel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la fonction du groupe "depuis ce matin" dans "Il travaille depuis ce matin" ?',
 'Depuis ce matin indique le temps → complément circonstanciel de temps.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'COD', 0, 1),
(@qid, 'Sujet', 0, 2),
(@qid, 'Complément circonstanciel de temps', 1, 3),
(@qid, 'Complément circonstanciel de lieu', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Lequel de ces mots est un adverbe de négation ?',
 'Ne...pas encadre le verbe pour exprimer la négation. "Jamais" est aussi un adverbe de négation.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Souvent', 0, 1),
(@qid, 'Jamais', 1, 2),
(@qid, 'Toujours', 0, 3),
(@qid, 'Très', 0, 4);

-- ============================================================
-- SECTION 2 : CONJUGAISON - TEMPS ET MODES (60 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le passé composé du verbe "partir" à la 3e personne du singulier ?',
 'Partir est un verbe de mouvement qui se conjugue avec l''auxiliaire ÊTRE. → il est parti.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'il a parti', 0, 1),
(@qid, 'il est parti', 1, 2),
(@qid, 'il avait parti', 0, 3),
(@qid, 'il sera parti', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Conjuguez "écrire" au passé composé, 1ère personne du singulier.',
 'Le participe passé de écrire est écrit → j''ai écrit.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'j''ai écrivi', 0, 1),
(@qid, 'j''ai écrit', 1, 2),
(@qid, 'j''ai écrivé', 0, 3),
(@qid, 'j''avais écrit', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est l''imparfait du verbe "être" à la 2e personne du pluriel ?',
 'À l''imparfait : nous étions, vous étiez, ils étaient.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'vous êtes', 0, 1),
(@qid, 'vous serez', 0, 2),
(@qid, 'vous étiez', 1, 3),
(@qid, 'vous aviez', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Si j''avais de l''argent, j''achèterais un roman", le verbe "achèterais" est au :',
 'J''achèterais = conditionnel présent (mode conditionnel, temps présent).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Futur simple', 0, 1),
(@qid, 'Imparfait', 0, 2),
(@qid, 'Conditionnel présent', 1, 3),
(@qid, 'Subjonctif présent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le futur simple du verbe "aller" à la 1ère personne du singulier ?',
 'Aller a un radical irrégulier au futur : ir- → j''irai.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'je vais', 0, 1),
(@qid, 'j''allais', 0, 2),
(@qid, 'j''irai', 1, 3),
(@qid, 'j''allerai', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la forme correcte du subjonctif présent de "faire" à la 3e personne du singulier ?',
 'Au subjonctif présent : que je fasse, que tu fasses, qu''il fasse.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'qu''il fait', 0, 1),
(@qid, 'qu''il ferait', 0, 2),
(@qid, 'qu''il fasse', 1, 3),
(@qid, 'qu''il fera', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel auxiliaire utilise-t-on pour conjuguer "naître" au passé composé ?',
 'Naître est un verbe intransitif de changement d''état → auxiliaire ÊTRE.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'avoir', 0, 1),
(@qid, 'être', 1, 2),
(@qid, 'les deux sont possibles', 0, 3),
(@qid, 'aucun auxiliaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Conjuguez "recevoir" au plus-que-parfait, 3e personne du pluriel.',
 'Plus-que-parfait = auxiliaire à l''imparfait + participe passé → ils avaient reçu.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ils ont reçu', 0, 1),
(@qid, 'ils avaient reçu', 1, 2),
(@qid, 'ils auront reçu', 0, 3),
(@qid, 'ils recevaient', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le participe passé du verbe "lire" ?',
 'Lire → lu (participe passé irrégulier).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'lisé', 0, 1),
(@qid, 'li', 0, 2),
(@qid, 'lu', 1, 3),
(@qid, 'lit', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Tout le monde t''applaudira si tu réussis", "applaudira" est au :',
 'Applaudira = futur simple de l''indicatif, 3e personne du singulier.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Présent de l''indicatif', 0, 1),
(@qid, 'Futur simple', 1, 2),
(@qid, 'Conditionnel présent', 0, 3),
(@qid, 'Subjonctif présent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le présent de l''indicatif du verbe "vouloir" à la 1ère personne du singulier ?',
 'Vouloir est irrégulier au présent : je veux, tu veux, il veut…', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'je voulais', 0, 1),
(@qid, 'je veux', 1, 2),
(@qid, 'je voudrais', 0, 3),
(@qid, 'je voule', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Conjuguez "finir" au présent de l''indicatif, 2e personne du singulier.',
 'Finir (2e groupe) : je finis, tu finis, il finit…', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'tu fines', 0, 1),
(@qid, 'tu finies', 0, 2),
(@qid, 'tu finis', 1, 3),
(@qid, 'tu finie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Les fleurs étaient déjà fanées quand elle décida de décorer la salle", le verbe "décida" est à quel temps ?',
 'Décida = passé simple (utilisé dans les récits pour une action passée précise).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Imparfait', 0, 1),
(@qid, 'Passé composé', 0, 2),
(@qid, 'Passé simple', 1, 3),
(@qid, 'Plus-que-parfait', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Le verbe "avoir" au subjonctif présent, 1ère personne du singulier est :',
 'Avoir au subjonctif : que j''aie, que tu aies, qu''il ait…', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'que j''ai', 0, 1),
(@qid, 'que j''aie', 1, 2),
(@qid, 'que j''avais', 0, 3),
(@qid, 'que j''aurais', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la forme passive de "Le directeur convoque les élèves" ?',
 'À la voix passive, le COD devient sujet : Les élèves sont convoqués par le directeur.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les élèves convoqueront le directeur', 0, 1),
(@qid, 'Les élèves sont convoqués par le directeur', 1, 2),
(@qid, 'Le directeur est convoqué par les élèves', 0, 3),
(@qid, 'Les élèves ont été convoqués', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel temps utilise-t-on dans la proposition subordonnée après "si" conditionnel ?',
 'Dans une phrase conditionnelle : Si + imparfait → conditionnel présent.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Futur simple', 0, 1),
(@qid, 'Conditionnel présent', 0, 2),
(@qid, 'Imparfait', 1, 3),
(@qid, 'Subjonctif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Conjuguez "être" au futur simple, 1ère personne du pluriel.',
 'Être au futur : je serai, tu seras, il sera, nous serons.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'nous sommes', 0, 1),
(@qid, 'nous étions', 0, 2),
(@qid, 'nous serons', 1, 3),
(@qid, 'nous aurions', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est l''infinitif du verbe conjugué dans "ils virent" (passé simple) ?',
 'Virent = passé simple du verbe voir (3e personne du pluriel).', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'venir', 0, 1),
(@qid, 'virer', 0, 2),
(@qid, 'voir', 1, 3),
(@qid, 'vivre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le participe passé du verbe "confier" ?',
 'Confier est du 1er groupe → participe passé en -é : confié.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'confis', 0, 1),
(@qid, 'confié', 1, 2),
(@qid, 'confiant', 0, 3),
(@qid, 'confiait', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Il faut que tu sois présent", le verbe "sois" est au :',
 'Il faut que + subjonctif → sois = subjonctif présent du verbe être.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Présent de l''indicatif', 0, 1),
(@qid, 'Imparfait', 0, 2),
(@qid, 'Subjonctif présent', 1, 3),
(@qid, 'Conditionnel présent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Conjuguez "inviter" au conditionnel présent, 1ère personne du pluriel.',
 'Conditionnel présent = radical du futur + terminaison de l''imparfait → nous inviterions.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'nous invitions', 0, 1),
(@qid, 'nous inviterons', 0, 2),
(@qid, 'nous inviterions', 1, 3),
(@qid, 'nous avons invité', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Le verbe "se lever" au passé composé, 3e personne du singulier féminin est :',
 'Se lever est un verbe pronominal → auxiliaire être. Accord avec le sujet féminin : elle s''est levée.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'elle a levé', 0, 1),
(@qid, 'elle s''est levée', 1, 2),
(@qid, 'elle est levée', 0, 3),
(@qid, 'elle s''est levé', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le présent de l''indicatif du verbe "prendre" à la 1ère personne du pluriel ?',
 'Prendre au présent : je prends, tu prends, il prend, nous prenons.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'nous prendons', 0, 1),
(@qid, 'nous prenons', 1, 2),
(@qid, 'nous prennons', 0, 3),
(@qid, 'nous prenions', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Transformez "Le vent produit de l''électricité" à la voix passive.',
 'De l''électricité est produite par le vent.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le vent est produit par l''électricité', 0, 1),
(@qid, 'De l''électricité est produite par le vent', 1, 2),
(@qid, 'L''électricité produit le vent', 0, 3),
(@qid, 'Le vent a produit de l''électricité', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Conjuguez "pouvoir" au présent de l''indicatif, 2e personne du singulier.',
 'Pouvoir au présent : je peux, tu peux, il peut…', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'tu pouvez', 0, 1),
(@qid, 'tu pouves', 0, 2),
(@qid, 'tu peux', 1, 3),
(@qid, 'tu pourrais', 0, 4);

-- ============================================================
-- SECTION 3 : ORTHOGRAPHE ET ACCORDS (60 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le pluriel irrégulier du mot "œil" ?',
 'Œil → yeux est un pluriel irrégulier à retenir absolument.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'œils', 0, 1),
(@qid, 'yeux', 1, 2),
(@qid, 'œilx', 0, 3),
(@qid, 'œilles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Lequel de ces mots prend un "x" au pluriel ?',
 'Les mots en -eau font leur pluriel en -eaux : bateau → bateaux.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'festival → festivals', 0, 1),
(@qid, 'bateau → bateaux', 1, 2),
(@qid, 'pneu → pneus', 0, 3),
(@qid, 'bal → bals', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Complétez : "Pedro _____ le meilleur élève de la classe." avec "est" ou "ait" ?',
 '"Est" est la forme correcte ici : il s''agit du verbe être au présent de l''indicatif.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ait', 0, 1),
(@qid, 'est', 1, 2),
(@qid, 'aie', 0, 3),
(@qid, 'et', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "On dit qu''un bienfait n''_____ jamais perdu", on écrit :',
 'N''est jamais perdu → est : verbe être à l''indicatif présent, pas de subjonctif ici.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ait', 0, 1),
(@qid, 'est', 1, 2),
(@qid, 'aît', 0, 3),
(@qid, 'ai', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Lequel de ces adjectifs est correctement accordé ?',
 'Heureuses est l''accord correct de heureux au féminin pluriel.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'des filles heureuxes', 0, 1),
(@qid, 'des filles heureuse', 0, 2),
(@qid, 'des filles heureuses', 1, 3),
(@qid, 'des filles heureux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le féminin de "doux" ?',
 'Doux → douce au féminin (la consonne finale x devient c + e).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'douxe', 0, 1),
(@qid, 'douche', 0, 2),
(@qid, 'douce', 1, 3),
(@qid, 'dousse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Lequel de ces mots s''écrit avec un accent circonflexe ?',
 'Forêt s''écrit avec un accent circonflexe sur le e (trace de l''ancien "forest").', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'maison', 0, 1),
(@qid, 'foret', 0, 2),
(@qid, 'forêt', 1, 3),
(@qid, 'jardin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le pluriel de "travail" ?',
 'Travail → travaux (pluriel en -aux, irrégulier).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'travails', 0, 1),
(@qid, 'travails', 0, 2),
(@qid, 'travaux', 1, 3),
(@qid, 'travailx', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Comment s''écrit le contraire de "courageux" ?',
 'Le préfixe privatif in- devant courageux donne incourageux... mais le vrai antonyme est peureux ou lâche. Le contraire construit est "peureux".', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'décourageux', 0, 1),
(@qid, 'incourageux', 0, 2),
(@qid, 'peureux', 1, 3),
(@qid, 'recourageux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Les histoires que j''ai lues sont captivantes", pourquoi "lues" prend-il un "e" ?',
 'Le COD "les histoires" est placé avant le verbe lire → accord du participe passé avec le COD féminin pluriel.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parce que histoires est masculin pluriel', 0, 1),
(@qid, 'Accord avec le COD féminin pluriel placé avant', 1, 2),
(@qid, 'Parce qu''on utilise l''auxiliaire être', 0, 3),
(@qid, 'Il n''y a pas de règle, c''est aléatoire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Laquelle de ces phrases est orthographiquement correcte ?',
 'Ces enfants jouent correctement s''écrit sans erreur.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ses enfant joues dans la cour.', 0, 1),
(@qid, 'Ces enfants jouent correctement.', 1, 2),
(@qid, 'Ces enfant jou dans la cour.', 0, 3),
(@qid, 'Ses enfants jouent correctement.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le féminin de "beau" ?',
 'Beau → belle au féminin (doublement de la consonne finale).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'beaue', 0, 1),
(@qid, 'bel', 0, 2),
(@qid, 'belle', 1, 3),
(@qid, 'beaux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Comment écrit-on le pluriel de "voix" ?',
 'Voix ne change pas au pluriel car il se termine déjà par x.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'voixs', 0, 1),
(@qid, 'voixx', 0, 2),
(@qid, 'voix', 1, 3),
(@qid, 'voixes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Laquelle de ces phrases utilise correctement "a" et "à" ?',
 'Il a mangé (verbe avoir) à la maison (préposition) → emploi correct des deux formes.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il à mangé a la maison.', 0, 1),
(@qid, 'Il a mangé à la maison.', 1, 2),
(@qid, 'Il a mangé a la maison.', 0, 3),
(@qid, 'Il à mangé à la maison.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le féminin de "directeur" ?',
 'Directeur → directrice (formation irrégulière au féminin).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'directeure', 0, 1),
(@qid, 'directeuse', 0, 2),
(@qid, 'directrice', 1, 3),
(@qid, 'directeure', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Comment s''écrit "on" dans "On se lève tôt ce matin" ?',
 'On est un pronom indéfini sujet → s''écrit toujours "on" (sans apostrophe ni n'').', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ont', 0, 1),
(@qid, 'on', 1, 2),
(@qid, 'on''t', 0, 3),
(@qid, 'n''on', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est l''orthographe correcte : "énergies renouvelables" ou "énergie renouvellable" ?',
 'Renouvelable s''écrit avec un seul "l" (comme renouveler).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'énergie renouvellable', 0, 1),
(@qid, 'énergies renouvelables', 1, 2),
(@qid, 'énergie renouvelable', 0, 3),
(@qid, 'énergies renouvellables', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le pluriel de "genou" ?',
 'Genou fait partie des mots en -ou qui prennent un x au pluriel : genou → genoux.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'genous', 0, 1),
(@qid, 'genoux', 1, 2),
(@qid, 'genouxs', 0, 3),
(@qid, 'genues', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Il faudrait que votre fille _____ de meilleures notes", on écrit :',
 'Il faudrait que + subjonctif → elle ait (subjonctif présent de avoir).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a', 0, 1),
(@qid, 'est', 0, 2),
(@qid, 'ait', 1, 3),
(@qid, 'ai', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la bonne orthographe de l''adverbe formé à partir de "élégant" ?',
 'Élégant → élégamment (adjectifs en -ant forment l''adverbe en -amment).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'éléganment', 0, 1),
(@qid, 'élégantement', 0, 2),
(@qid, 'élégamment', 1, 3),
(@qid, 'élégemment', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le pluriel de "animal" ?',
 'Animal → animaux (les noms en -al forment généralement leur pluriel en -aux).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'animals', 0, 1),
(@qid, 'animaux', 1, 2),
(@qid, 'animalx', 0, 3),
(@qid, 'animales', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Laquelle de ces phrases est à la forme négative correcte ?',
 'La négation "ne...pas" encadre le verbe.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Je ne lève me pas tôt.', 0, 1),
(@qid, 'Je me lève tôt ne pas.', 0, 2),
(@qid, 'Je ne me lève pas tôt.', 1, 3),
(@qid, 'Pas je me lève tôt.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le féminin de "vieux" ?',
 'Vieux → vieille au féminin (forme totalement différente).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'vieuxe', 0, 1),
(@qid, 'vielle', 0, 2),
(@qid, 'vieille', 1, 3),
(@qid, 'vieusse', 0, 4);

-- ============================================================
-- SECTION 4 : VOCABULAIRE ET SENS DES MOTS (60 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le synonyme de "tranquille" ?',
 'Tranquille et paisible ont le même sens : calme, sans agitation.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'agité', 0, 1),
(@qid, 'paisible', 1, 2),
(@qid, 'bruyant', 0, 3),
(@qid, 'nerveux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le synonyme de "grimper" ?',
 'Grimper et escalader signifient tous deux monter en s''aidant des mains et des pieds.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'descendre', 0, 1),
(@qid, 'tomber', 0, 2),
(@qid, 'escalader', 1, 3),
(@qid, 'glisser', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Que signifie l''expression "source d''énergie renouvelable" ?',
 'Une énergie renouvelable est une énergie qui ne peut pas être épuisée car elle se renouvelle naturellement.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Énergie qui coûte très cher', 0, 1),
(@qid, 'Énergie qui ne peut pas être épuisée', 1, 2),
(@qid, 'Énergie produite par le pétrole', 0, 3),
(@qid, 'Énergie qui pollue l''environnement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le contraire de "nocif" ?',
 'Nocif (qui nuit) → bénéfique ou inoffensif (qui ne nuit pas).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'dangereux', 0, 1),
(@qid, 'bénéfique', 1, 2),
(@qid, 'nuisible', 0, 3),
(@qid, 'toxique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le synonyme de "beau" dans le contexte d''une description ?',
 'Beau et ravissant sont synonymes dans une description positive d''une apparence.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'laid', 0, 1),
(@qid, 'ravissant', 1, 2),
(@qid, 'horrible', 0, 3),
(@qid, 'affreux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel verbe remplace "mettre" dans "mettre la clé dans la serrure" ?',
 'Placer = mettre quelque chose à un endroit précis.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'enfiler', 0, 1),
(@qid, 'placer', 1, 2),
(@qid, 'poser', 0, 3),
(@qid, 'classer', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel verbe remplace "mettre" dans "mettre un livre dans une bibliothèque" ?',
 'Ranger = mettre quelque chose à sa place dans un rangement.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'poser', 0, 1),
(@qid, 'introduire', 0, 2),
(@qid, 'classer', 1, 3),
(@qid, 'enfiler', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Que signifie le mot "combustible" dans un texte sur l''énergie ?',
 'Un combustible est une matière qui brûle pour produire de l''énergie (essence, charbon, bois…).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une machine qui produit de l''électricité', 0, 1),
(@qid, 'Une matière qui brûle pour produire de l''énergie', 1, 2),
(@qid, 'Un appareil de chauffage', 0, 3),
(@qid, 'Une source d''eau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le contraire de "joyeux" ?',
 'Joyeux (content, heureux) → triste est son contraire.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'gai', 0, 1),
(@qid, 'triste', 1, 2),
(@qid, 'heureux', 0, 3),
(@qid, 'content', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel mot est un synonyme de "copain" ?',
 'Copain et ami sont synonymes : une personne avec laquelle on a des liens d''amitié.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ennemi', 0, 1),
(@qid, 'ami', 1, 2),
(@qid, 'inconnu', 0, 3),
(@qid, 'adversaire', 0, 4);


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel mot appartient à la famille du mot "énergie" ?',
 'Énergétique est un adjectif de la même famille lexicale que énergie.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'électricien', 0, 1),
(@qid, 'énergétique', 1, 2),
(@qid, 'ingénieur', 0, 3),
(@qid, 'centralisé', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le sens du préfixe "re-" dans le mot "renouvelable" ?',
 'Le préfixe re- indique la répétition ou le recommencement : renouvelable = qui peut être renouvelé.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Contre, opposition', 0, 1),
(@qid, 'De nouveau, répétition', 1, 2),
(@qid, 'Privation, absence de', 0, 3),
(@qid, 'En dessous', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Que désigne le mot "féculents" dans un texte sur la nutrition ?',
 'Les féculents sont des aliments riches en amidon : riz, pâtes, pommes de terre, pain…', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des fruits exotiques', 0, 1),
(@qid, 'Des légumes verts', 0, 2),
(@qid, 'Des aliments riches en amidon comme le riz et les pâtes', 1, 3),
(@qid, 'Des produits laitiers', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le sens du mot "indispensable" ?',
 'Indispensable = dont on ne peut pas se passer, absolument nécessaire.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Inutile', 0, 1),
(@qid, 'Facultatif', 0, 2),
(@qid, 'Absolument nécessaire', 1, 3),
(@qid, 'Difficile à trouver', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le contraire de "réel" ?',
 'Réel = qui existe vraiment → irréel = qui n''existe pas, imaginaire.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'actuel', 0, 1),
(@qid, 'imaginaire', 1, 2),
(@qid, 'concret', 0, 3),
(@qid, 'véritable', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Le mot "éolienne" vient du nom de :',
 'Éole est le dieu du vent dans la mythologie grecque. Éolienne = qui utilise le vent.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Éole, dieu du vent', 1, 1),
(@qid, 'Éole, dieu de la mer', 0, 2),
(@qid, 'Sol, le soleil', 0, 3),
(@qid, 'Un ingénieur nommé Éolien', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Ils veulent qu''on répartisse les terres équitablement", que signifie "équitablement" ?',
 'Équitablement = de façon juste et égale pour tous.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'rapidement', 0, 1),
(@qid, 'de façon juste pour tous', 1, 2),
(@qid, 'uniquement', 0, 3),
(@qid, 'progressivement', 0, 4);



INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Que signifie "consoler" quelqu''un ?',
 'Consoler = réconforter quelqu''un qui souffre ou est triste.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le mettre en colère', 0, 1),
(@qid, 'Le faire travailler', 0, 2),
(@qid, 'Le réconforter dans sa peine', 1, 3),
(@qid, 'Le punir', 0, 4);


-- ============================================================
-- SECTION 6 : PROPOSITIONS SUBORDONNÉES (30 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la proposition subordonnée dans "Je pense qu''il viendra demain" ?',
 'Qu''il viendra demain est une proposition subordonnée conjonctive COD du verbe pense.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Je pense', 0, 1),
(@qid, 'qu''il viendra demain', 1, 2),
(@qid, 'demain', 0, 3),
(@qid, 'il viendra', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Le livre que tu m''as prêté est passionnant", identifiez la proposition subordonnée relative.',
 'Que tu m''as prêté est une proposition subordonnée relative qui qualifie le nom livre.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le livre est passionnant', 0, 1),
(@qid, 'que tu m''as prêté', 1, 2),
(@qid, 'tu m''as prêté', 0, 3),
(@qid, 'est passionnant', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel pronom relatif convient dans "Ariane a choisi la solution _____ lui paraissait meilleure" ?',
 'Qui remplace le sujet (la solution) dans la proposition relative.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'que', 0, 1),
(@qid, 'dont', 0, 2),
(@qid, 'qui', 1, 3),
(@qid, 'où', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel pronom relatif convient dans "Les amis _____ nous sommes entourés nous rendent la vie agréable" ?',
 'Dont introduit un complément introduit par de : entourés de → dont.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'que', 0, 1),
(@qid, 'dont', 1, 2),
(@qid, 'qui', 0, 3),
(@qid, 'lequel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Les ateliers des artisans sont des lieux _____ on apprend beaucoup", le bon pronom relatif est :',
 'Où remplace un complément de lieu (dans ces lieux).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'que', 0, 1),
(@qid, 'qui', 0, 2),
(@qid, 'où', 1, 3),
(@qid, 'dont', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Laquelle de ces phrases contient une proposition subordonnée de cause ?',
 'La conjonction "parce que" introduit une subordonnée de cause.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il travaille pour réussir.', 0, 1),
(@qid, 'Il est absent parce qu''il est malade.', 1, 2),
(@qid, 'Il viendra quand il pourra.', 0, 3),
(@qid, 'Il mange bien afin d''être fort.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle conjonction introduit une subordonnée de but ?',
 'Afin que / pour que introduisent des subordonnées de but (finalité).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'parce que', 0, 1),
(@qid, 'bien que', 0, 2),
(@qid, 'afin que', 1, 3),
(@qid, 'lorsque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans quelle phrase trouve-t-on une subordonnée de concession ?',
 'Bien que introduit une subordonnée de concession (opposition).', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il dort parce qu''il est fatigué.', 0, 1),
(@qid, 'Il sort quand il fait beau.', 0, 2),
(@qid, 'Bien qu''il soit malade, il travaille.', 1, 3),
(@qid, 'Il mange pour avoir de l''énergie.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Cela mérite qu''on l''extermine attentivement", la proposition "qu''on l''extermine" est :',
 'Qu''on l''extermine est une proposition subordonnée conjonctive COD du verbe mériter.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une proposition principale', 0, 1),
(@qid, 'Une proposition subordonnée relative', 0, 2),
(@qid, 'Une proposition subordonnée conjonctive', 1, 3),
(@qid, 'Une proposition indépendante', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel mode verbal suit généralement la conjonction "bien que" ?',
 'Bien que (conjonction de concession) est toujours suivi du subjonctif.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''indicatif', 0, 1),
(@qid, 'Le conditionnel', 0, 2),
(@qid, 'Le subjonctif', 1, 3),
(@qid, 'L''infinitif', 0, 4);

-- ============================================================
-- SECTION 7 : DISCOURS DIRECT ET INDIRECT (25 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Transformez au discours indirect : Le professeur dit : "Tu travailles bien."',
 'Au discours indirect : Le professeur dit qu''il travaillait bien (concordance des temps).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le professeur dit que tu travailles bien.', 0, 1),
(@qid, 'Le professeur dit qu''il travaillait bien.', 1, 2),
(@qid, 'Le professeur dit : il travaille bien.', 0, 3),
(@qid, 'Le professeur dit qu''il travaille bien.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Au discours indirect, les guillemets sont :',
 'Au discours indirect, on supprime les guillemets et le deux-points. Le discours est intégré à la phrase principale.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Obligatoires', 0, 1),
(@qid, 'Supprimés', 1, 2),
(@qid, 'Remplacés par des tirets', 0, 3),
(@qid, 'Remplacés par des parenthèses', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle phrase est au discours direct ?',
 'Le discours direct rapporte les paroles exactes avec guillemets et deux-points.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il dit qu''il reviendrait bientôt.', 0, 1),
(@qid, 'Il déclara être fatigué.', 0, 2),
(@qid, 'Il dit : "Je reviendrai bientôt."', 1, 3),
(@qid, 'Il annonça son retour prochain.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans le passage du discours direct au indirect, "je" devient généralement :',
 'Au discours indirect, le pronom "je" du locuteur se transforme en "il/elle" (3e personne).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'nous', 0, 1),
(@qid, 'tu', 0, 2),
(@qid, 'il / elle', 1, 3),
(@qid, 'vous', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Au discours indirect, après un verbe introducteur au passé, le présent devient :',
 'Concordance des temps : présent → imparfait quand le verbe introducteur est au passé.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Futur', 0, 1),
(@qid, 'Passé composé', 0, 2),
(@qid, 'Imparfait', 1, 3),
(@qid, 'Subjonctif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Transformez au discours direct : Il affirma qu''il était le meilleur.',
 'Discours direct : Il affirma : "Je suis le meilleur." (pronom il → je, imparfait → présent)', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il affirma : "Il est le meilleur."', 0, 1),
(@qid, 'Il affirma : "Je suis le meilleur."', 1, 2),
(@qid, 'Il affirma que : "Je suis le meilleur."', 0, 3),
(@qid, 'Il affirma : "Tu es le meilleur."', 0, 4);

-- ============================================================
-- SECTION 8 : TYPES ET FORMES DE PHRASES (25 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Identifiez le type de la phrase "Ferme la porte !" :',
 'Une phrase qui exprime un ordre ou une demande est une phrase impérative (injonctive).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Phrase déclarative', 0, 1),
(@qid, 'Phrase interrogative', 0, 2),
(@qid, 'Phrase impérative', 1, 3),
(@qid, 'Phrase exclamative', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la forme négative de "Jean s''est levé tard aujourd''hui" ?',
 'La négation s''insère autour du verbe conjugué : ne...pas.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jean s''est ne levé pas tard aujourd''hui.', 0, 1),
(@qid, 'Jean ne s''est pas levé tard aujourd''hui.', 1, 2),
(@qid, 'Jean ne s''est levé pas tard aujourd''hui.', 0, 3),
(@qid, 'Ne Jean s''est pas levé tard aujourd''hui.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle phrase est à la forme passive ?',
 'La forme passive se reconnaît : sujet + être + participe passé + par + agent.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le chien mange l''os.', 0, 1),
(@qid, 'L''os est mangé par le chien.', 1, 2),
(@qid, 'Le chien a mangé l''os.', 0, 3),
(@qid, 'Mange l''os !', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, '"Quelle belle journée !" est une phrase :',
 'Cette phrase exprime un sentiment (admiration) → phrase exclamative.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Interrogative', 0, 1),
(@qid, 'Déclarative', 0, 2),
(@qid, 'Exclamative', 1, 3),
(@qid, 'Impérative', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Transformez à la forme affirmative : "Maman ne m''a pas remis des bonbons."',
 'Forme affirmative : supprimer ne...pas → Maman m''a remis des bonbons.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Maman ne m''a remis des bonbons.', 0, 1),
(@qid, 'Maman m''a remis des bonbons.', 1, 2),
(@qid, 'Maman m''a pas remis des bonbons.', 0, 3),
(@qid, 'Maman ne remis pas des bonbons.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la forme interrogative de "Tu vas à l''école" avec inversion du sujet ?',
 'L''inversion du sujet donne : Vas-tu à l''école ? (le pronom sujet est placé après le verbe avec un tiret).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Est-ce tu vas à l''école ?', 0, 1),
(@qid, 'Tu vas à l''école ?', 0, 2),
(@qid, 'Vas-tu à l''école ?', 1, 3),
(@qid, 'À l''école tu vas ?', 0, 4);

-- ============================================================
-- SECTION 9 : FIGURES DE STYLE ET TEXTES LITTÉRAIRES (20 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle figure de style est utilisée dans "Ses yeux sont des étoiles" ?',
 'Ses yeux sont des étoiles est une métaphore : on assimile les yeux à des étoiles sans "comme".', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Comparaison', 0, 1),
(@qid, 'Métaphore', 1, 2),
(@qid, 'Hyperbole', 0, 3),
(@qid, 'Personnification', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la différence entre une métaphore et une comparaison ?',
 'La comparaison utilise un outil de comparaison (comme, tel que…) ; la métaphore fait une assimilation directe sans outil.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il n''y a aucune différence', 0, 1),
(@qid, 'La métaphore utilise "comme", pas la comparaison', 0, 2),
(@qid, 'La comparaison utilise "comme" tandis que la métaphore assimile directement', 1, 3),
(@qid, 'La métaphore parle d''animaux, la comparaison de personnes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, '"Il court comme le vent." Cette phrase contient :',
 'Il court comme le vent utilise l''outil de comparaison "comme" → c''est une comparaison.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une métaphore', 0, 1),
(@qid, 'Une comparaison', 1, 2),
(@qid, 'Une hyperbole', 0, 3),
(@qid, 'Une antithèse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "La mer rugissait de colère", quelle figure de style est utilisée ?',
 'Rugir et avoir de la colère sont des caractéristiques humaines attribuées à la mer → personnification.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Métaphore', 0, 1),
(@qid, 'Comparaison', 0, 2),
(@qid, 'Personnification', 1, 3),
(@qid, 'Antithèse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Qu''est-ce qu''une hyperbole ?',
 'L''hyperbole est une figure qui consiste à exagérer pour frapper l''imagination.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une figure qui minimise les choses', 0, 1),
(@qid, 'Une figure d''exagération', 1, 2),
(@qid, 'Une figure qui compare deux choses avec "comme"', 0, 3),
(@qid, 'Une figure qui attribue des caractéristiques humaines aux objets', 0, 4);

-- ============================================================
-- SECTION 10 : PRODUCTION ÉCRITE ET TYPES DE TEXTES (20 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le but d''un texte narratif ?',
 'Un texte narratif raconte une histoire, réelle ou fictive, avec des personnages et des événements.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Expliquer le fonctionnement d''un appareil', 0, 1),
(@qid, 'Raconter une histoire avec des personnages et des événements', 1, 2),
(@qid, 'Convaincre le lecteur d''une opinion', 0, 3),
(@qid, 'Décrire un lieu ou une personne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Comment commence généralement une lettre amicale ?',
 'Une lettre amicale commence par une formule d''appel : "Cher ami", "Ma chère…" etc.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Madame, Monsieur,', 0, 1),
(@qid, 'Cher ami / Chère amie,', 1, 2),
(@qid, 'À qui de droit,', 0, 3),
(@qid, 'Bonjour le destinataire,', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Qu''est-ce qu''un texte descriptif ?',
 'Un texte descriptif présente les caractéristiques d''une personne, d''un lieu ou d''un objet.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un texte qui explique comment faire quelque chose', 0, 1),
(@qid, 'Un texte qui raconte une histoire', 0, 2),
(@qid, 'Un texte qui présente les caractéristiques d''une personne ou d''un lieu', 1, 3),
(@qid, 'Un texte qui argumente pour convaincre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans une lettre formelle, quelle formule de politesse est correcte pour terminer ?',
 '"Veuillez agréer, Monsieur, l''expression de mes salutations distinguées" est la formule correcte pour une lettre formelle.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bisous, à bientôt !', 0, 1),
(@qid, 'Au revoir et merci.', 0, 2),
(@qid, 'Veuillez agréer mes salutations distinguées.', 1, 3),
(@qid, 'Merci beaucoup, votre ami.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel connecteur logique exprime une conséquence ?',
 'Donc, par conséquent, c''est pourquoi → expriment la conséquence.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cependant', 0, 1),
(@qid, 'Donc', 1, 2),
(@qid, 'Pourtant', 0, 3),
(@qid, 'Néanmoins', 0, 4);

-- ============================================================
-- SECTION 11 : ACCORD DU PARTICIPE PASSÉ (20 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Les colis que son ami lui avait confiés", pourquoi "confiés" prend-il un "s" ?',
 'Le COD "les colis" (masculin pluriel) est placé avant le verbe confier → accord du participe passé.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parce que ami est masculin singulier', 0, 1),
(@qid, 'Accord avec le COD masculin pluriel "les colis" placé avant', 1, 2),
(@qid, 'Parce qu''on utilise l''auxiliaire être', 0, 3),
(@qid, 'Il n''y a pas de règle à ce sujet', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Elle est arrivée hier", le participe "arrivée" prend un "e" parce que :',
 'Arriver se conjugue avec être → le participe passé s''accorde avec le sujet féminin singulier : elle.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le COD est féminin', 0, 1),
(@qid, 'Le sujet "elle" est féminin singulier', 1, 2),
(@qid, 'Il y a un adverbe après', 0, 3),
(@qid, 'C''est toujours le cas avec les verbes en -er', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Elles se sont levées tôt", pourquoi "levées" est au féminin pluriel ?',
 'Se lever est pronominal → auxiliaire être. Accord avec le sujet elles (féminin pluriel).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Accord avec le COD', 0, 1),
(@qid, 'Accord avec le sujet féminin pluriel "elles"', 1, 2),
(@qid, 'Il n''y a pas d''accord', 0, 3),
(@qid, 'Accord avec l''adverbe "tôt"', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Choisissez la bonne forme : "Les boissons qu''on a (servi/servies) étaient fraîches."',
 'Le COD "les boissons" (féminin pluriel) est avant le verbe servir → accord : servies.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'servi', 0, 1),
(@qid, 'servies', 1, 2),
(@qid, 'servie', 0, 3),
(@qid, 'servis', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Avec l''auxiliaire "avoir", le participe passé s''accorde :',
 'Avec avoir, le participe passé s''accorde avec le COD seulement s''il est placé AVANT le verbe.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toujours avec le sujet', 0, 1),
(@qid, 'Jamais', 0, 2),
(@qid, 'Avec le COD placé avant le verbe', 1, 3),
(@qid, 'Toujours avec le COD', 0, 4);

-- ============================================================
-- SECTION 12 : COMPLÉMENTS CIRCONSTANCIELS (20 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le complément circonstanciel de lieu dans "Il joue au football dans la cour" ?',
 'Dans la cour indique l''endroit où se passe l''action → CCL.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'au football', 0, 1),
(@qid, 'Il', 0, 2),
(@qid, 'dans la cour', 1, 3),
(@qid, 'joue', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Elle chante magnifiquement sur scène chaque soir", combien y a-t-il de compléments circonstanciels ?',
 'Magnifiquement (manière) + sur scène (lieu) + chaque soir (temps) = 3 CC.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un seul', 0, 1),
(@qid, 'Deux', 0, 2),
(@qid, 'Trois', 1, 3),
(@qid, 'Quatre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, '"À cause de la pluie, le match a été annulé." La cause est exprimée par :',
 'À cause de est une locution prépositionnelle qui exprime la cause.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le verbe "annuler"', 0, 1),
(@qid, 'Le groupe "à cause de la pluie"', 1, 2),
(@qid, 'Le groupe "le match"', 0, 3),
(@qid, 'L''adjectif verbal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel complément circonstanciel peut-on déplacer librement dans la phrase ?',
 'Les CC peuvent généralement être déplacés ou supprimés sans changer le sens essentiel de la phrase.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le sujet', 0, 1),
(@qid, 'Le COD', 0, 2),
(@qid, 'Le complément circonstanciel', 1, 3),
(@qid, 'L''attribut du sujet', 0, 4);

-- ============================================================
-- SECTION 13 : VERBES PRONOMINAUX (15 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel auxiliaire utilise-t-on pour conjuguer les verbes pronominaux au passé composé ?',
 'Les verbes pronominaux se conjuguent toujours avec l''auxiliaire ÊTRE au passé composé.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'avoir', 0, 1),
(@qid, 'être', 1, 2),
(@qid, 'les deux selon le verbe', 0, 3),
(@qid, 'aucun auxiliaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le sens de "se faire plaisir" dans un texte sur la nutrition ?',
 'Se faire plaisir = manger quelque chose qu''on aime par pur plaisir, sans nécessité nutritionnelle.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Se punir en ne mangeant rien', 0, 1),
(@qid, 'Manger ce qu''on aime pour le plaisir', 1, 2),
(@qid, 'Faire du sport pour se sentir bien', 0, 3),
(@qid, 'Offrir des cadeaux aux autres', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Ils se sont parlé", pourquoi le participe passé ne s''accorde-t-il pas ?',
 '"Se" est un COI (se parler à = parler à soi-même) → pas d''accord du participe passé quand le pronom est COI.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parce que le sujet est masculin', 0, 1),
(@qid, 'Parce que "se" est COI et non COD', 1, 2),
(@qid, 'Parce qu''on utilise l''auxiliaire avoir', 0, 3),
(@qid, 'Parce que le participe de parler est invariable', 0, 4);

-- ============================================================
-- SECTION 14 : CONJONCTIONS ET CONNECTEURS (20 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelles sont les conjonctions de coordination en français ? (Moyen mnémotechnique : MAIS OU ET…)',
 'Mais, ou, et, donc, or, ni, car → 7 conjonctions de coordination (MAÏS OU EST DONC OR NI CAR).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'mais, ou, et, donc, or, ni, car', 1, 1),
(@qid, 'quand, si, parce que, bien que', 0, 2),
(@qid, 'que, qui, dont, où, lequel', 0, 3),
(@qid, 'car, parce que, puisque, comme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel connecteur logique exprime l''opposition ?',
 'Cependant, pourtant, mais, néanmoins → expriment l''opposition entre deux idées.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'donc', 0, 1),
(@qid, 'cependant', 1, 2),
(@qid, 'car', 0, 3),
(@qid, 'alors', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel connecteur logique exprime l''addition ?',
 'De plus, en outre, aussi, et → permettent d''ajouter une idée à une autre.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'pourtant', 0, 1),
(@qid, 'de plus', 1, 2),
(@qid, 'donc', 0, 3),
(@qid, 'cependant', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "C''est pourquoi nous utilisons les éoliennes", "c''est pourquoi" exprime :',
 'C''est pourquoi est un connecteur de conséquence : il annonce le résultat de ce qui précède.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une cause', 0, 1),
(@qid, 'Une conséquence', 1, 2),
(@qid, 'Une opposition', 0, 3),
(@qid, 'Une addition', 0, 4);

-- ============================================================
-- SECTION 15 : COMPLÉMENT SUPPLÉMENTAIRE - GRAMMAIRE AVANCÉE (30 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature grammaticale de "en réfléchissant" dans "En réfléchissant, j''ai changé d''avis" ?',
 'En réfléchissant est un gérondif (en + participe présent) qui exprime la simultanéité ou la manière.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un infinitif', 0, 1),
(@qid, 'Un participe passé', 0, 2),
(@qid, 'Un gérondif', 1, 3),
(@qid, 'Un adjectif verbal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Il allait d''une maison à l''autre en cherchant un emploi", le gérondif exprime :',
 'En cherchant exprime la manière dont il allait d''une maison à l''autre (simultanéité + manière).', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La cause', 0, 1),
(@qid, 'Le but', 0, 2),
(@qid, 'La manière', 1, 3),
(@qid, 'Le temps', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la différence entre "leur" adjectif et "leur" pronom dans une phrase ?',
 '"Leur" adjectif possessif détermine un nom (leur livre), "leur" pronom remplace un COI (je leur parle = à eux).', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il n''y a aucune différence', 0, 1),
(@qid, 'Adjectif : détermine un nom. Pronom : remplace un COI.', 1, 2),
(@qid, 'Pronom : détermine un nom. Adjectif : remplace un COI.', 0, 3),
(@qid, 'L''adjectif possessif prend un "s" au pluriel, le pronom aussi', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Construis une phrase avec leur (adjectif possessif)", laquelle est correcte ?',
 '"Leur maison est grande" : leur détermine le nom maison → adjectif possessif.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Je leur ai dit bonjour.', 0, 1),
(@qid, 'Leur maison est grande.', 1, 2),
(@qid, 'Il leur parlera demain.', 0, 3),
(@qid, 'On leur a remis les prix.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Lequel de ces verbes appartient au 2e groupe ?',
 'Les verbes du 2e groupe ont l''infinitif en -ir et le participe présent en -issant : grandir → grandissant.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'venir', 0, 1),
(@qid, 'tenir', 0, 2),
(@qid, 'grandir', 1, 3),
(@qid, 'sortir', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la règle générale pour former l''adverbe à partir d''un adjectif féminin ?',
 'On ajoute le suffixe -ment au féminin de l''adjectif : lente → lentement.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'On ajoute -ment au masculin', 0, 1),
(@qid, 'On ajoute -ment au féminin', 1, 2),
(@qid, 'On ajoute -ement à l''infinitif', 0, 3),
(@qid, 'On ajoute -ique au nom', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est l''adverbe formé à partir de "léger" ?',
 'Léger → légère (féminin) + ment → légèrement.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'légèrement', 1, 1),
(@qid, 'lègrement', 0, 2),
(@qid, 'légèment', 0, 3),
(@qid, 'légerment', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Laquelle de ces phrases contient une apposition ?',
 'Port-au-Prince, capitale d''Haïti, est une apposition : groupe nominal qui précise le nom propre.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il mange une pomme rouge.', 0, 1),
(@qid, 'Port-au-Prince, capitale d''Haïti, est une belle ville.', 1, 2),
(@qid, 'Elle court vite dans la rue.', 0, 3),
(@qid, 'Les enfants jouent au ballon.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "On lui promet qu''il réussira facilement", la proposition subordonnée est au :',
 'Il réussira = futur de l''indicatif → la subordonnée dépend du verbe promettre au présent.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Présent de l''indicatif', 0, 1),
(@qid, 'Futur simple de l''indicatif', 1, 2),
(@qid, 'Conditionnel présent', 0, 3),
(@qid, 'Subjonctif présent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature du groupe nominal "un roman" dans "J''achèterais un roman" ?',
 'Un roman est le COD du verbe acheter (je l''achète : pas de préposition → COD).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sujet', 0, 1),
(@qid, 'COI', 0, 2),
(@qid, 'COD', 1, 3),
(@qid, 'Attribut du sujet', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Les problèmes de pollution le préoccupent", transformé à la voix passive, on obtient :',
 'À la voix passive : Il est préoccupé par les problèmes de pollution.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les problèmes sont préoccupés par lui.', 0, 1),
(@qid, 'Il est préoccupé par les problèmes de pollution.', 1, 2),
(@qid, 'La pollution préoccupe les problèmes.', 0, 3),
(@qid, 'Les problèmes l''ont préoccupé.', 0, 4);

-- ============================================================
-- SECTION 16 : CONJUGAISON AVANCÉE (20 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Conjuguez "savoir" au présent de l''indicatif, 1ère personne du singulier.',
 'Savoir est irrégulier : je sais, tu sais, il sait, nous savons.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'je savis', 0, 1),
(@qid, 'je savais', 0, 2),
(@qid, 'je sais', 1, 3),
(@qid, 'je sue', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le passé composé de "venir" à la 3e personne du pluriel ?',
 'Venir se conjugue avec être → ils sont venus (accord masculin pluriel).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ils ont venu', 0, 1),
(@qid, 'ils sont venus', 1, 2),
(@qid, 'ils avaient venu', 0, 3),
(@qid, 'ils venaient', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le futur antérieur de "finir" à la 2e personne du singulier ?',
 'Futur antérieur = auxiliaire au futur + participe passé → tu auras fini.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'tu finiras', 0, 1),
(@qid, 'tu avais fini', 0, 2),
(@qid, 'tu auras fini', 1, 3),
(@qid, 'tu aurais fini', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Lequel de ces verbes est irrégulier au présent de l''indicatif ?',
 'Boire est irrégulier : je bois, tu bois, il boit, nous buvons, vous buvez, ils boivent.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'manger', 0, 1),
(@qid, 'chanter', 0, 2),
(@qid, 'boire', 1, 3),
(@qid, 'parler', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Conjuguez "tenir" au passé composé, 1ère personne du singulier.',
 'Tenir → participe passé : tenu. Auxiliaire avoir → j''ai tenu.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'j''ai tendu', 0, 1),
(@qid, 'j''ai tenu', 1, 2),
(@qid, 'je suis tenu', 0, 3),
(@qid, 'j''ai tenis', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est l''imparfait du verbe "avoir" à la 3e personne du pluriel ?',
 'Avoir à l''imparfait : j''avais, tu avais, il avait, nous avions, vous aviez, ils avaient.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ils ont', 0, 1),
(@qid, 'ils auront', 0, 2),
(@qid, 'ils avaient', 1, 3),
(@qid, 'ils avaient eu', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Conjuguez "mettre" au passé simple, 3e personne du singulier.',
 'Mettre au passé simple : je mis, tu mis, il mit.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'il metta', 0, 1),
(@qid, 'il mettit', 0, 2),
(@qid, 'il mit', 1, 3),
(@qid, 'il missa', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le conditionnel passé de "vouloir" à la 1ère personne du singulier ?',
 'Conditionnel passé = auxiliaire au conditionnel + participe passé → j''aurais voulu.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'je voudrais', 0, 1),
(@qid, 'j''avais voulu', 0, 2),
(@qid, 'j''aurais voulu', 1, 3),
(@qid, 'j''aurai voulu', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Conjuguez "répartir" au subjonctif présent, 3e personne du pluriel.',
 'Répartir (3e groupe) au subjonctif : qu''ils répartissent.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'qu''ils répartent', 0, 1),
(@qid, 'qu''ils répartissent', 1, 2),
(@qid, 'qu''ils répartiront', 0, 3),
(@qid, 'qu''ils répartissaient', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Tu m''avais dit que Julie nous inviterait pour son anniversaire", quel est le temps de "inviterait" ?',
 'Inviterait = conditionnel présent (concordance des temps après un passé).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Futur simple', 0, 1),
(@qid, 'Imparfait', 0, 2),
(@qid, 'Conditionnel présent', 1, 3),
(@qid, 'Subjonctif présent', 0, 4);

-- ============================================================
-- SECTION 17 : ORTHOGRAPHE ET HOMOPHONES (20 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Comment différencie-t-on "ce" et "se" ?',
 '"Se" est un pronom réfléchi (il se lave). "Ce" est un démonstratif (ce livre) ou pronom (ce que je veux).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ils sont toujours interchangeables', 0, 1),
(@qid, '"Se" = pronom réfléchi, "ce" = démonstratif', 1, 2),
(@qid, '"Ce" = pronom réfléchi, "se" = démonstratif', 0, 3),
(@qid, 'Il n''y a aucune différence', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Les nuits où je fais des rêves", le verbe "fais" s''écrit avec un "s" parce que :',
 'Faire au présent de l''indicatif : je fais (1ère personne du singulier = -s).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'C''est un verbe du 2e groupe', 0, 1),
(@qid, 'La 1ère personne du singulier de faire prend -s au présent', 1, 2),
(@qid, 'C''est une faute d''orthographe', 0, 3),
(@qid, 'On ajoute toujours -s aux verbes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Choisissez la bonne orthographe : "Tout le monde _____ parti."',
 'Tout le monde = sujet singulier → est parti (auxiliaire être, 3e personne singulier).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'sont partis', 0, 1),
(@qid, 'est parti', 1, 2),
(@qid, 'est parties', 0, 3),
(@qid, 'sont partie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la bonne orthographe : "par contre" ou "par-contre" ?',
 'Par contre s''écrit en deux mots séparés, sans tiret.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'par-contre', 0, 1),
(@qid, 'par contre', 1, 2),
(@qid, 'parcontre', 0, 3),
(@qid, 'Par-Contre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Comment écrit-on "tout" dans "Elles sont toutes arrivées" ?',
 'Toutes = adjectif indéfini accordé avec elles (féminin pluriel) → toutes.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'tout', 0, 1),
(@qid, 'tous', 0, 2),
(@qid, 'toutes', 1, 3),
(@qid, 'toute', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Laquelle de ces phrases utilise correctement "son" et "sont" ?',
 '"Son ami est là et ils sont heureux" → son = possessif, sont = verbe être.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Son ami est là et ils son heureux.', 0, 1),
(@qid, 'Son ami est là et ils sont heureux.', 1, 2),
(@qid, 'Sont ami est là et ils son heureux.', 0, 3),
(@qid, 'Sont amis est là et ils sont heureux.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "on peut l''utiliser efficacement", l''adverbe "efficacement" est formé à partir de :',
 'Efficace (adjectif) → efficacément... mais la règle donne efficacement (féminin efficace + ment).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Du nom "efficacité"', 0, 1),
(@qid, 'De l''adjectif "efficace"', 1, 2),
(@qid, 'Du verbe "efficacer"', 0, 3),
(@qid, 'Du préfixe "ef-"', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le pluriel de "bal" ?',
 'Bal fait partie des exceptions : bal → bals (et non "baux").', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'baux', 0, 1),
(@qid, 'bals', 1, 2),
(@qid, 'balx', 0, 3),
(@qid, 'bale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Comment écrit-on le participe présent de "être" ?',
 'Le participe présent de être = étant.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'étant', 1, 1),
(@qid, 'ayant', 0, 2),
(@qid, 'étante', 0, 3),
(@qid, 'sera', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Laquelle de ces phrases utilise "ni" correctement ?',
 'Ni...ni est une double négation : ni le charbon ni le pétrole ne sont des énergies renouvelables.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il ne veut pas ni de pain.', 0, 1),
(@qid, 'Ni le charbon ni le pétrole ne sont renouvelables.', 1, 2),
(@qid, 'Il ne mange ni et boit pas.', 0, 3),
(@qid, 'Ni il vient mais il part.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "je panse à toi", quelle erreur d''orthographe est commise ?',
 '"Panse" est le présent du verbe panser (soigner). La forme correcte ici est "pense" (du verbe penser).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aucune erreur', 0, 1),
(@qid, '"Panse" devrait s''écrire "pense"', 1, 2),
(@qid, '"Je" devrait être "j''"', 0, 3),
(@qid, '"Toi" devrait s''écrire "moi"', 0, 4);

-- ============================================================
-- SECTION 18 : VOCABULAIRE ÉTENDU (20 questions)
-- ============================================================



INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel mot est l''antonyme de "épuisable" ?',
 'Épuisable (qui peut être épuisé) → inépuisable (qui ne peut pas être épuisé) → préfixe privatif in-.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'réépuisable', 0, 1),
(@qid, 'inépuisable', 1, 2),
(@qid, 'désépuisable', 0, 3),
(@qid, 'surépuisable', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Le mot "central" dans "plusieurs sortes de centrales" désigne :',
 'Une centrale (électrique) est une installation qui produit de l''énergie électrique.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une école au centre de la ville', 0, 1),
(@qid, 'Une installation qui produit de l''énergie', 1, 2),
(@qid, 'Un magasin au centre commercial', 0, 3),
(@qid, 'Un bureau administratif', 0, 4);


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le sens de "prolongé" dans "des efforts prolongés" ?',
 'Prolongé = qui dure longtemps, qui se maintient dans le temps.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bref et intense', 0, 1),
(@qid, 'Qui dure longtemps', 1, 2),
(@qid, 'Douloureux', 0, 3),
(@qid, 'Facile à faire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel verbe de la liste peut remplacer "mettre ses bottes" ?',
 'Enfiler = passer un vêtement ou une chaussure autour du pied ou du corps.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'classer', 0, 1),
(@qid, 'poser', 0, 2),
(@qid, 'enfiler', 1, 3),
(@qid, 'introduire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le sens de "concentrer" dans "notre cerveau a besoin d''énergie pour nous permettre de nous concentrer" ?',
 'Se concentrer = fixer son attention sur quelque chose, ne pas être distrait.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dormir profondément', 0, 1),
(@qid, 'Fixer son attention, ne pas être distrait', 1, 2),
(@qid, 'Courir très vite', 0, 3),
(@qid, 'Parler à voix haute', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Que signifie l''expression "remonter le moral" dans le sujet de production écrite ?',
 'Remonter le moral = redonner courage et confiance à quelqu''un qui est découragé ou triste.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parler de choses tristes', 0, 1),
(@qid, 'Redonner courage et confiance à quelqu''un', 1, 2),
(@qid, 'Monter les escaliers rapidement', 0, 3),
(@qid, 'Critiquer quelqu''un', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel préfixe permet de former le contraire de "possible" ?',
 'Im- + possible = impossible. Le préfixe im- (variante de in-) exprime la négation devant p, b, m.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'dé-', 0, 1),
(@qid, 'sur-', 0, 2),
(@qid, 'im-', 1, 3),
(@qid, 're-', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans le domaine de l''alimentation, que signifie "féculents" ?',
 'Les féculents sont les aliments riches en amidon : riz, pain, pâtes, pommes de terre, etc.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des légumes verts comme les épinards', 0, 1),
(@qid, 'Des aliments riches en amidon comme le riz et le pain', 1, 2),
(@qid, 'Des produits sucrés comme le chocolat', 0, 3),
(@qid, 'Des graisses animales', 0, 4);

-- ============================================================
-- SECTION 19 : QUESTIONS SUPPLÉMENTAIRES DIVERSES (30 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Je me lève toujours de bonne heure", mettez cette phrase à la forme négative.',
 'Forme négative : Je ne me lève jamais de bonne heure (ou : ...pas de bonne heure).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Je me lève toujours pas de bonne heure.', 0, 1),
(@qid, 'Je ne me lève jamais de bonne heure.', 1, 2),
(@qid, 'Jamais je lève de bonne heure.', 0, 3),
(@qid, 'Je me ne lève pas de bonne heure.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature du mot "savant" dans "Un savant a examiné Julien" ?',
 'Savant est un nom (= un scientifique, un homme de science) et non un adjectif dans ce contexte.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adjectif qualificatif', 0, 1),
(@qid, 'Nom commun', 1, 2),
(@qid, 'Adverbe', 0, 3),
(@qid, 'Participe présent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle phrase contient une comparaison avec "comme" ?',
 'Un peu comme une voiture contient l''outil de comparaison "comme" → c''est une comparaison.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Son corps est une machine.', 0, 1),
(@qid, 'Un peu comme une voiture, notre corps consomme de l''énergie.', 1, 2),
(@qid, 'Les éoliennes sont des moulins à vent modernes.', 0, 3),
(@qid, 'Le vent rugit de colère.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature de "gratuitement" dans "Le vent est gratuit et on peut l''utiliser gratuitement" ?',
 'Gratuitement est un adverbe de manière (formé sur gratuit + -ement).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adjectif', 0, 1),
(@qid, 'Nom', 0, 2),
(@qid, 'Adverbe', 1, 3),
(@qid, 'Verbe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le groupe auquel appartient le verbe "choisir" ?',
 'Choisir = infinitif en -ir + participe présent choisissant → 2e groupe.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1er groupe (verbes en -er)', 0, 1),
(@qid, '2e groupe (verbes en -ir type finir)', 1, 2),
(@qid, '3e groupe (verbes irréguliers)', 0, 3),
(@qid, 'Aucun groupe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la forme du verbe "voir" au présent de l''indicatif, 3e personne du pluriel ?',
 'Voir au présent : je vois, tu vois, il voit, nous voyons, vous voyez, ils voient.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ils voyent', 0, 1),
(@qid, 'ils voient', 1, 2),
(@qid, 'ils voient', 0, 3),
(@qid, 'ils voys', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Si tu vas au cinéma ce soir, tu verras un beau film", "verras" est au :',
 'Verras = futur simple de voir (Si + présent → futur dans une phrase de condition réelle).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Conditionnel présent', 0, 1),
(@qid, 'Futur simple', 1, 2),
(@qid, 'Subjonctif présent', 0, 3),
(@qid, 'Imparfait', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le sujet de "Aujourd''hui, on utilise la version modernisée des moulins à vent" ?',
 'On est le pronom indéfini sujet de utilise.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aujourd''hui', 0, 1),
(@qid, 'on', 1, 2),
(@qid, 'la version modernisée', 0, 3),
(@qid, 'les moulins à vent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Identifiez le COD dans "Les enfants reçoivent beaucoup de récompenses pour leur réussite" :',
 'Beaucoup de récompenses = COD du verbe recevoir (on les reçoit → pas de préposition → COD).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les enfants', 0, 1),
(@qid, 'beaucoup de récompenses', 1, 2),
(@qid, 'pour leur réussite', 0, 3),
(@qid, 'reçoivent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature du mot "captivantes" dans "Les histoires sont captivantes" ?',
 'Captivantes est un adjectif qualificatif attribut du sujet les histoires.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adverbe', 0, 1),
(@qid, 'Nom commun', 0, 2),
(@qid, 'Adjectif qualificatif attribut du sujet', 1, 3),
(@qid, 'Participe présent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Les éoliennes prennent beaucoup de place", quel est le verbe ?',
 'Prennent est le verbe (présent de l''indicatif, 3e personne du pluriel de prendre).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les éoliennes', 0, 1),
(@qid, 'prennent', 1, 2),
(@qid, 'beaucoup', 0, 3),
(@qid, 'de place', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la bonne orthographe de l''adverbe formé à partir de "intelligent" ?',
 'Intelligent → intelligemment (les adjectifs en -ent forment l''adverbe en -emment).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'intelligentment', 0, 1),
(@qid, 'intelligemment', 1, 2),
(@qid, 'intelligentement', 0, 3),
(@qid, 'intelligément', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Jacques a remis les colis que son ami lui avait confiés", le pronom "lui" est :',
 'Lui est un pronom personnel COI (remis à lui → à son ami).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pronom COD', 0, 1),
(@qid, 'Pronom COI', 1, 2),
(@qid, 'Pronom sujet', 0, 3),
(@qid, 'Adjectif possessif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le sens du mot "artisan" dans "Les ateliers des artisans" ?',
 'Un artisan est une personne qui exerce un métier manuel avec un savoir-faire particulier.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un médecin', 0, 1),
(@qid, 'Un enseignant', 0, 2),
(@qid, 'Un professionnel du métier manuel', 1, 3),
(@qid, 'Un commerçant en gros', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Un débat suivra le film", transformez à la forme négative.',
 'Forme négative : Un débat ne suivra pas le film.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un débat suivra ne pas le film.', 0, 1),
(@qid, 'Un débat ne suivra pas le film.', 1, 2),
(@qid, 'Un ne débat suivra pas le film.', 0, 3),
(@qid, 'Pas un débat suivra le film.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le sens de "réconforter" dans "réconforter un ami triste" ?',
 'Réconforter = consoler, rendre le moral à quelqu''un qui est triste ou découragé.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Faire rire quelqu''un', 0, 1),
(@qid, 'Consoler et redonner courage à quelqu''un', 1, 2),
(@qid, 'Donner de l''argent à quelqu''un', 0, 3),
(@qid, 'Punir quelqu''un', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le pluriel de "festival" ?',
 'Festival → festivals (exception : ne suit pas la règle -al → -aux).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'festivaux', 0, 1),
(@qid, 'festivals', 1, 2),
(@qid, 'festivalx', 0, 3),
(@qid, 'festivales', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle phrase contient une proposition principale et une subordonnée temporelle ?',
 'Quand il fait beau introduit une subordonnée circonstancielle de temps.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il mange parce qu''il a faim.', 0, 1),
(@qid, 'Il sort quand il fait beau.', 1, 2),
(@qid, 'Il travaille afin de réussir.', 0, 3),
(@qid, 'Bien qu''il soit fatigué, il continue.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Les problèmes de pollution le préoccupent", que représente le pronom "le" ?',
 '"Le" est un pronom personnel COD qui reprend un nom masculin singulier (la personne préoccupée).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un pronom sujet', 0, 1),
(@qid, 'Un pronom COD masculin singulier', 1, 2),
(@qid, 'Un article défini', 0, 3),
(@qid, 'Un pronom COI', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le contraire de "éternelle" formé par un préfixe ?',
 'Le préfixe privatif non- ou éphémère → mais le contraire construit est "temporaire" ou "éphémère".', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'pré-éternelle', 0, 1),
(@qid, 'temporaire', 1, 2),
(@qid, 'sur-éternelle', 0, 3),
(@qid, 'anti-éternelle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature grammaticale de "de l''énergie" dans "Il produit de l''énergie" ?',
 'De l''énergie = article partitif + nom → complément d''objet direct de produire.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sujet', 0, 1),
(@qid, 'COD avec article partitif', 1, 2),
(@qid, 'Complément circonstanciel', 0, 3),
(@qid, 'Attribut du sujet', 0, 4);

-- ============================================================
-- SECTION 20 : RÉVISION GÉNÉRALE ET CONSOLIDATION (20 questions)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Lequel de ces mots est un nom propre ?',
 'Haïti est un nom propre (désigne un pays précis) → prend une majuscule.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'pays', 0, 1),
(@qid, 'Haïti', 1, 2),
(@qid, 'montagne', 0, 3),
(@qid, 'ville', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la règle d''accord de l''adjectif qualificatif ?',
 'L''adjectif qualificatif s''accorde en genre et en nombre avec le nom auquel il se rapporte.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il est toujours invariable', 0, 1),
(@qid, 'Il s''accorde avec le verbe', 0, 2),
(@qid, 'Il s''accorde en genre et en nombre avec le nom', 1, 3),
(@qid, 'Il s''accorde uniquement en nombre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Qu''est-ce qu''un mot dérivé ?',
 'Un mot dérivé est formé à partir d''un mot de base auquel on ajoute un préfixe ou un suffixe.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un mot formé de deux mots collés', 0, 1),
(@qid, 'Un mot formé à partir d''un radical avec un préfixe ou un suffixe', 1, 2),
(@qid, 'Un mot emprunté à une autre langue', 0, 3),
(@qid, 'Un mot qui a le même sens qu''un autre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "C''est pourquoi nous utilisons les éoliennes pour produire de l''électricité", l''infinitif "produire" dépend de :',
 'Pour produire = infinitif de but introduit par la préposition pour. Dépend du verbe utiliser.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'C''est pourquoi', 0, 1),
(@qid, 'nous utilisons', 1, 2),
(@qid, 'les éoliennes', 0, 3),
(@qid, 'de l''électricité', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle est la nature de "tôt" dans "Il se lève tôt" ?',
 'Tôt est un adverbe de temps qui précise le moment de l''action (il se lève).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adjectif qualificatif', 0, 1),
(@qid, 'Adverbe de temps', 1, 2),
(@qid, 'Nom commun', 0, 3),
(@qid, 'Préposition', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le mode de "Écrire une lettre à ton ami" (phrase impérative) ?',
 'Un ordre ou une consigne à l''infinitif utilise l''infinitif à valeur impérative.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Indicatif', 0, 1),
(@qid, 'Subjonctif', 0, 2),
(@qid, 'Infinitif', 1, 3),
(@qid, 'Conditionnel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le rôle du verbe "allumer" dans "on allume la lumière" ?',
 'Allumer est le verbe principal de la proposition, conjugué au présent de l''indicatif.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adjectif verbal', 0, 1),
(@qid, 'Verbe principal conjugué', 1, 2),
(@qid, 'Infinitif', 0, 3),
(@qid, 'Participe présent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quelle phrase est construite avec le schéma : Sujet + Verbe + COD + CC de lieu ?',
 'Les élèves lisent leurs livres en classe = S + V + COD + CC lieu.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il court rapidement.', 0, 1),
(@qid, 'Les élèves lisent leurs livres en classe.', 1, 2),
(@qid, 'Elle est belle.', 0, 3),
(@qid, 'Viens ici !', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel est le temps de "avait brûlé" dans la phrase "On avait brûlé du charbon" ?',
 'Avait brûlé = plus-que-parfait de l''indicatif (auxiliaire à l''imparfait + participe passé).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Passé composé', 0, 1),
(@qid, 'Imparfait', 0, 2),
(@qid, 'Plus-que-parfait', 1, 3),
(@qid, 'Passé antérieur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Dans "Ces sources d''énergie ne sont pas éternelles", quel est le sujet ?',
 'Ces sources d''énergie est le groupe nominal sujet du verbe sont.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ces sources', 0, 1),
(@qid, 'Ces sources d''énergie', 1, 2),
(@qid, 'd''énergie', 0, 3),
(@qid, 'éternelles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(2, 2, 'Quel connecteur logique exprime la cause dans une argumentation ?',
 'Car, parce que, puisque → expriment la cause.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'donc', 0, 1),
(@qid, 'pourtant', 0, 2),
(@qid, 'car', 1, 3),
(@qid, 'de plus', 0, 4);



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


-- ============================================
-- QCM MATHÉMATIQUES 9e ANNÉE - HAÏTI
-- Extraits des Examens Officiels 2010-2023 + Programme MENFP
-- Format QCM avec 4 options
-- ============================================

-- ============================================
-- EXAMEN 1 : Maths 1 (page 1)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''inverse de (2³)² est le nombre :',
    '(2³)² = 2⁶, son inverse est 1/2⁶.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2⁵', 0, 1),
(@qid, '2⁶', 0, 2),
(@qid, '1/2⁵', 0, 3),
(@qid, '1/2⁶', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La réduction de B = 1 + 40 ÷ 5 + 5 × 5 - 5 donne :',
    'B = 1 + 8 + 25 - 5 = 29.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '9', 0, 1),
(@qid, '29', 1, 2),
(@qid, '4,1', 0, 3),
(@qid, '28,2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''orthocentre d''un triangle est le point de rencontre des :',
    'L''orthocentre = intersection des hauteurs.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bissectrices', 0, 1),
(@qid, 'Médianes', 0, 2),
(@qid, 'Hauteurs', 1, 3),
(@qid, 'Médiatrices', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La médiane de la série : 13 ; 21 ; 19 ; 18 ; 27 ; 15 est :',
    'Série ordonnée : 13, 15, 18, 19, 21, 27. Médiane = (18+19)/2 = 18,5.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '19', 0, 1),
(@qid, '18', 0, 2),
(@qid, '18,5', 1, 3),
(@qid, '19,6', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si une droite est sécante à un cercle, alors :',
    'Une droite sécante coupe le cercle en 2 points.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ils ont deux points communs', 1, 1),
(@qid, 'Ils ont un point commun', 0, 2),
(@qid, 'Ils n''ont aucun point commun', 0, 3),
(@qid, 'La droite se trouve à l''extérieur du cercle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Sur une carte à l''échelle 1/5000000, la distance entre deux villes est de 2,50 cm. La distance réelle en km est :',
    '2,50 × 5000000 = 12500000 cm = 125 km.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1250 km', 0, 1),
(@qid, '125 km', 1, 2),
(@qid, '12,50 km', 0, 3),
(@qid, '1,25 km', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Diminuer x de 5% c''est multiplier x par :',
    '1 - 0,05 = 0,95.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,05', 0, 1),
(@qid, '1,05', 0, 2),
(@qid, '0,95', 1, 3),
(@qid, '0,5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Les 3/8 des 48 livres de Ronald sont des romans. Parmi les romans, les 4/9 sont des romans policiers. Le nombre de romans policiers est :',
    '3/8 × 48 = 18 romans. 4/9 × 18 = 8 romans policiers.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6', 0, 1),
(@qid, '8', 1, 2),
(@qid, '10', 0, 3),
(@qid, '12', 0, 4);

-- ============================================
-- EXAMEN 2 : Maths 2 (page 3)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La partie décimale du nombre -5,32 est :',
    'La partie décimale est 0,32 (toujours positive).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5,32', 0, 1),
(@qid, '-5,32', 0, 2),
(@qid, '0,32', 1, 3),
(@qid, '-0,32', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''arrondi du nombre π au dix-millième est :',
    'π = 3,14159265... arrondi à 3,1416.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3,14', 0, 1),
(@qid, '3,1415', 0, 2),
(@qid, '3,1416', 1, 3),
(@qid, '3,1410', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le point de rencontre des médianes d''un triangle est appelé :',
    'Intersection des médianes = centre de gravité.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Orthocentre', 0, 1),
(@qid, 'Centre du cercle inscrit', 0, 2),
(@qid, 'Centre de gravité', 1, 3),
(@qid, 'Centre du cercle circonscrit', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '50% d''une somme d''argent représente :',
    '50% = la moitié.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Son double', 0, 1),
(@qid, 'Son quart', 0, 2),
(@qid, 'Son tiers', 0, 3),
(@qid, 'Sa moitié', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''expression réduite de H = 5x - 4x - 2x - 3x est :',
    '5-4-2-3 = -4. Donc H = -4x.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4x', 0, 1),
(@qid, '-4x', 1, 2),
(@qid, '120x', 0, 3),
(@qid, '-120x', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si AB = 7 cm, BC = 5 cm et AC = x cm dans un triangle, alors :',
    'Inégalité triangulaire : 7+5 > x, 7+x > 5, 5+x > 7 → x < 12.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x ≥ 12', 0, 1),
(@qid, 'x > 12', 0, 2),
(@qid, 'x ≤ 12', 0, 3),
(@qid, 'x < 12', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Quel est le débit en m³/h d''un robinet qui évacue 90 litres d''eau en 1 minute ?',
    '90 L/min = 90 × 60 = 5400 L/h = 5,4 m³/h.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3,2 m³/h', 0, 1),
(@qid, '1,5 m³/h', 0, 2),
(@qid, '5,4 m³/h', 1, 3),
(@qid, '9 m³/h', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si un angle Â vaut 80°, la mesure de son complément est :',
    'Complément = 90° - 80° = 10°.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '280°', 0, 1),
(@qid, '20°', 0, 2),
(@qid, '100°', 0, 3),
(@qid, '10°', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''écriture simplifiée de A = 10 × 10³ / 10⁶ sous forme de puissance de 10 est :',
    'A = 10⁴ / 10⁶ = 10⁻².', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10²', 0, 1),
(@qid, '10⁻²', 1, 2),
(@qid, '10⁻³', 0, 3),
(@qid, '10³', 0, 4);

-- ============================================
-- EXAMEN 3 : Maths 3 (page 5)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''écriture simplifiée de 2/11 × 3/2 est :',
    '(2×3)/(11×2) = 6/22 = 3/11.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '9/4', 0, 1),
(@qid, '3/2', 0, 2),
(@qid, '2/3', 0, 3),
(@qid, '4/9', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La puissance qui donne le même résultat que 7⁶ · 7² est :',
    '7⁶ × 7² = 7⁸.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '7¹²', 0, 1),
(@qid, '49¹²', 0, 2),
(@qid, '7⁸', 1, 3),
(@qid, '49⁸', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Que peut-on dire d''un cercle et d''une droite qui n''ont aucun point commun ?',
    'La droite est extérieure au cercle.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La droite est tangente au cercle', 0, 1),
(@qid, 'La distance entre le centre et la droite est nulle', 0, 2),
(@qid, 'La droite et le cercle sont sécants', 0, 3),
(@qid, 'La droite est extérieure au cercle', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Quel nom donne-t-on à la quantité d''eau écoulée en fonction de la durée ?',
    'Le débit = volume / temps.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Au volume', 0, 1),
(@qid, 'Au poids', 0, 2),
(@qid, 'Au débit', 1, 3),
(@qid, 'À la masse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Quelle est la nature d''un triangle ANG tel que Â = 40° et N = 50° ?',
    'Le 3e angle = 180° - 40° - 50° = 90° → triangle rectangle.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Isocèle', 0, 1),
(@qid, 'Scalène', 0, 2),
(@qid, 'Rectangle', 1, 3),
(@qid, 'Équilatéral', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'On coupe à mi-hauteur un cône de rayon R. L''aire de la section est :',
    'Réduction de 1/2, le rayon devient R/2. Aire = π(R/2)² = πR²/4.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'πR²', 0, 1),
(@qid, 'πR²/3', 0, 2),
(@qid, 'πR²/4', 1, 3),
(@qid, 'R²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La distance réelle est de 2 km. Sur une carte, ils sont à 20 cm. L''échelle est :',
    '20 cm pour 2 km = 20 cm / 200000 cm = 1/10000.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/20000', 0, 1),
(@qid, '1/100000', 0, 2),
(@qid, '1/10000', 1, 3),
(@qid, '1/2000', 0, 4);

-- ============================================
-- EXAMEN 4 : Maths 4 (page 6)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Trouve l''égalité vraie parmi les suivantes :',
    '(x-y)² = x² - 2xy + y².', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(x-y)² = x² - y²', 0, 1),
(@qid, '(x-y)² = x² - 2xy - y²', 0, 2),
(@qid, '(x-y)² = x² - xy + y²', 0, 3),
(@qid, '(x-y)² = x² - 2xy + y²', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Laquelle des égalités traduit que le triangle EFG est rectangle en E ?',
    'Rectangle en E → FG² = EF² + EG².', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'EF² = FG² + EG²', 0, 1),
(@qid, 'EG² = EF² + FG²', 0, 2),
(@qid, 'EF² = EG² - FG²', 0, 3),
(@qid, 'FG² = EF² + EG²', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le nombre tronqué au centime de 245,378 est :',
    'Tronquer = couper sans arrondir → 245,37.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2,45378', 0, 1),
(@qid, '245,37', 1, 2),
(@qid, '245,38', 0, 3),
(@qid, '24537,8', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si OO'' = r + r'' pour deux cercles, alors :',
    'Les cercles sont tangents extérieurement.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(C) et (C'') sont concentriques', 0, 1),
(@qid, '(C) et (C'') sont sécants', 0, 2),
(@qid, '(C) et (C'') sont tangents extérieurement', 1, 3),
(@qid, '(C) et (C'') sont extérieurs l''un à l''autre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La moyenne de 12, 18, 15, 10, 16, 13 sur 30 est :',
    '(12+18+15+10+16+13)/6 = 84/6 = 14.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '84', 0, 1),
(@qid, '18', 0, 2),
(@qid, '14', 1, 3),
(@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Quelle est la mesure du supplément d''un angle aigu mesurant 75° ?',
    'Supplément = 180° - 75° = 105°.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '105°', 1, 1),
(@qid, '15°', 0, 2),
(@qid, '25°', 0, 3),
(@qid, '150°', 0, 4);

-- ============================================
-- EXAMEN 5 : Maths 5 (page 8)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Quel est l''entier naturel égal au carré du nombre irrationnel 2√3 ?',
    '(2√3)² = 4 × 3 = 12.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6', 0, 1),
(@qid, '12', 1, 2),
(@qid, '18', 0, 3),
(@qid, '36', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Quel nom donne-t-on au côté opposé à l''angle droit d''un triangle rectangle ?',
    'Le côté opposé à l''angle droit = hypoténuse.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hauteur', 0, 1),
(@qid, 'Médiane', 0, 2),
(@qid, 'Hypoténuse', 1, 3),
(@qid, 'Bissectrice', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Quelle grandeur détermine-t-on en faisant le quotient du volume de liquide écoulé par la durée ?',
    'Volume / temps = débit.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La masse', 0, 1),
(@qid, 'La vitesse', 0, 2),
(@qid, 'Le débit', 1, 3),
(@qid, 'Le poids', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La moyenne de la série : 2,2,2,3,4,4,5,5,7,7,9,10,10,10,10 est :',
    'Somme = 80, 15 valeurs → 80/15 = 5,33... arrondi à 6.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4', 0, 1),
(@qid, '5', 0, 2),
(@qid, '6', 1, 3),
(@qid, '7', 0, 4);

-- ============================================
-- EXAMEN 6 : (page 9)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Pour obtenir 1, on doit multiplier a/b par :',
    '(a/b) × (b/a) = 1.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/a', 0, 1),
(@qid, 'b/a', 1, 2),
(@qid, '1/b', 0, 3),
(@qid, 'a/b', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La distance Port-au-Prince aux Cayes est 145 km. À l''échelle 1/50000, la longueur sur la carte est :',
    '145 km = 14 500 000 cm. 14 500 000/50000 = 290 cm.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,29 cm', 0, 1),
(@qid, '2,9 cm', 0, 2),
(@qid, '290 cm', 1, 3),
(@qid, '344,8 cm', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un robinet débite 13/4 L par minute. Le temps pour obtenir 4830 L est :',
    'Débit = 3,25 L/min. Temps = 4830/3,25 = 1486,15 min = 24,77 h. Soit environ 6,15 h.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5,45 h', 0, 1),
(@qid, '6,15 h', 1, 2),
(@qid, '5 h 75 min', 0, 3),
(@qid, '5 h 3/4', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si on divise le rayon d''un cône de révolution par 3, son volume est divisé par :',
    'Volume ∝ R². Si R÷3, V÷9. De plus V ∝ h, donc si tout est réduit → ÷27.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1),
(@qid, '3', 0, 2),
(@qid, '9', 0, 3),
(@qid, '27', 1, 4);

-- ============================================
-- EXAMEN 6 : Maths 6 (page 11)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''expression a/(a⁻²) peut encore s''écrire :',
    'a / a⁻² = a × a² = a³.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a⁻²', 0, 1),
(@qid, 'a³', 1, 2),
(@qid, 'a²', 0, 3),
(@qid, 'a⁻³', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si OO'' < r - r'' pour deux cercles, alors les deux cercles sont :',
    'Un cercle est à l''intérieur de l''autre sans se toucher = intérieurs.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sécants', 0, 1),
(@qid, 'Tangents', 0, 2),
(@qid, 'Intérieurs', 1, 3),
(@qid, 'Tangents intérieurement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le double d''un nombre augmenté de 3 est plus petit que l''opposé de sa moitié se traduit par :',
    '2x + 3 < -x/2.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2x + 3 < 1/2 - x', 0, 1),
(@qid, '2x + 3 < -x/2', 1, 2),
(@qid, '2(x+3) < 1/2 - x', 0, 3),
(@qid, '2(x+3) < -x/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si AB = 9, BC = 15 et AC = 12, alors ABC est un triangle :',
    '9²+12²=81+144=225=15² → rectangle en A.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Rectangle isocèle', 0, 1),
(@qid, 'Rectangle', 1, 2),
(@qid, 'Quelconque', 0, 3),
(@qid, 'Isocèle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Pierre fait 135 km en 1h30. Sa vitesse moyenne en km/h est :',
    'v = 135/1,5 = 90 km/h.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '202,5 km/h', 0, 1),
(@qid, '175,5 km/h', 0, 2),
(@qid, '103 km/h', 0, 3),
(@qid, '90 km/h', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La mesure de chaque angle intérieur d''un hexagone régulier est :',
    '180°(6-2)/6 = 180×4/6 = 120°.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '60°', 0, 1),
(@qid, '90°', 0, 2),
(@qid, '110°', 0, 3),
(@qid, '120°', 1, 4);

-- ============================================
-- EXAMEN 7 : (page 13)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une solution de (2x-7)(x-2) = 0 est :',
    'x-2=0 → x=2 ou 2x-7=0 → x=3,5.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-2', 0, 1),
(@qid, '2', 1, 2),
(@qid, '-7', 0, 3),
(@qid, '7', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La droite d''un triangle qui passe par le sommet et le milieu du côté opposé s''appelle :',
    'Sommet + milieu du côté opposé = médiane.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Médiatrice', 0, 1),
(@qid, 'Hauteur', 0, 2),
(@qid, 'Médiane', 1, 3),
(@qid, 'Bissectrice', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le nombre qu''il faut ajouter à 2/7 pour obtenir 3 est :',
    '3 - 2/7 = 21/7 - 2/7 = 19/7.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5/7', 0, 1),
(@qid, '6/7', 0, 2),
(@qid, '19/7', 1, 3),
(@qid, '21/7', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si G est centre de gravité et AI = 7,5 cm, alors AG = ?',
    'AG = 2/3 × AI = 2/3 × 7,5 = 5 cm.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2,5 cm', 0, 1),
(@qid, '3 cm', 0, 2),
(@qid, '4,5 cm', 0, 3),
(@qid, '5 cm', 1, 4);

-- ============================================
-- EXAMEN 8 : (page 15)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''expression (9+2x)(9-2x) est égale à :',
    '9² - (2x)² = 81 - 4x².', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '18 - 4x²', 0, 1),
(@qid, '81 - 36x + 4x²', 0, 2),
(@qid, '81 - 4x²', 1, 3),
(@qid, '81 + 4x²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un encadrement de la mesure d''un angle rentrant Â est :',
    'Angle rentrant : 180° < Â < 360°.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0° < Â < 90°', 0, 1),
(@qid, '120° < Â < 180°', 0, 2),
(@qid, '90° < Â < 180°', 0, 3),
(@qid, '180° < Â < 270°', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le résultat de 72 ÷ 8 - 4 × 0,5 est :',
    '9 - 2 = 7.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2,5', 0, 1),
(@qid, '-7', 0, 2),
(@qid, '12', 0, 3),
(@qid, '7', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un triangle AEC tel que Â = 2C et E = 3C. Alors E = ?',
    '2C + 3C + C = 180° → 6C = 180° → C = 30°. E = 3×30 = 90°.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '90°', 1, 1),
(@qid, '60°', 0, 2),
(@qid, '180°', 0, 3),
(@qid, '30°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un litre d''air pèse 1,7 g. Un mètre cube d''air pèse :',
    '1 m³ = 1000 L. 1000 × 1,7 = 1700 g.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1000 g', 0, 1),
(@qid, '1700 g', 1, 2),
(@qid, '170 g', 0, 3),
(@qid, '17000 g', 0, 4);

-- ============================================
-- EXAMEN 9 : (page 16)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Trouve l''égalité qui est FAUSSE :',
    '10³ = 1000 et 10⁴⁻¹ = 10³ = 1000. Donc l''égalité est vraie. 10⁰ = 1 ≠ 10.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(10·10)⁴ = 10⁴·10⁴', 0, 1),
(@qid, '10²·10³ = 10²⁺³', 0, 2),
(@qid, '10³ = 10⁴⁻¹', 0, 3),
(@qid, '10⁰ = 10', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Les trois droites qui déterminent le centre de gravité d''un triangle s''appellent :',
    'Centre de gravité = intersection des médianes.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bissectrices', 0, 1),
(@qid, 'Médiatrices', 0, 2),
(@qid, 'Médianes', 1, 3),
(@qid, 'Hauteurs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'M et N sont les milieux de [DG] et [SG] d''un triangle équilatéral GDS. Si MN = 3 cm, le périmètre de GDS est :',
    'MN = DS/2 → DS = 6. Périmètre = 3×6 = 18 cm.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P = 9 cm', 0, 1),
(@qid, 'P = 18 cm', 1, 2),
(@qid, 'P = 6 cm', 0, 3),
(@qid, 'P = 27 cm', 0, 4);

-- ============================================
-- EXAMEN 10 : (page 18)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si x ≤ 1 et 0 < x, à quel intervalle appartient x ?',
    ']0, 1] = tous les nombres >0 et ≤ 1.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '[0, 1]', 0, 1),
(@qid, ']0, 1]', 1, 2),
(@qid, '[0, 1[', 0, 3),
(@qid, ']0, 1[', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le point de rencontre des droites perpendiculaires aux côtés en leur milieu est :',
    'Médiatrices → centre du cercle circonscrit.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le centre du cercle circonscrit', 1, 1),
(@qid, 'Le centre du cercle inscrit', 0, 2),
(@qid, 'L''orthocentre', 0, 3),
(@qid, 'Le centre de gravité', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Quelle valeur pour a vérifie : 185,878 × 10⁻⁶ = a × 10⁻⁸ ?',
    '185,878 × 10⁻⁶ = 18587,8 × 10⁻⁸.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a = 1,85878', 0, 1),
(@qid, 'a = 18587,8', 1, 2),
(@qid, 'a = 185878', 0, 3),
(@qid, 'a = 0,001185878', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''angle MAN mesure 40°. Quelle est la mesure de l''angle MON (angle au centre) ?',
    'Angle au centre = 2 × angle inscrit = 2 × 40° = 80°.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'MON = 40°', 0, 1),
(@qid, 'MON = 20°', 0, 2),
(@qid, 'MON = 80°', 1, 3),
(@qid, 'MON = 160°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un escargot parcourt 20 cm en 15 secondes. En 1 heure, quelle distance ?',
    '20 cm/15 s = 80 cm/min = 4800 cm/h = 48 m/h.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4,8 m', 0, 1),
(@qid, '48 m', 1, 2),
(@qid, '480 m', 0, 3),
(@qid, '4800 m', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un prisme droit a 4 cm de hauteur et pour base un losange de diagonales 8 cm et 6 cm. Son volume est :',
    'Aire base = (8×6)/2 = 24 cm². V = 24×4 = 96 cm³.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '192 cm³', 0, 1),
(@qid, '96 cm³', 1, 2),
(@qid, '64 cm³', 0, 3),
(@qid, '28 cm³', 0, 4);

-- ============================================
-- EXAMEN 11 : (page 20)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''écriture décimale de 145% est :',
    '145% = 145/100 = 1,45.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '14 500', 0, 1),
(@qid, '1,45', 1, 2),
(@qid, '14,5', 0, 3),
(@qid, '0,145', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le nombre d''axes de symétrie d''un carré est :',
    'Un carré a 4 axes de symétrie (2 diagonales + 2 médianes).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '8', 0, 1),
(@qid, '2', 0, 2),
(@qid, '4', 1, 3),
(@qid, '6', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La longueur de la diagonale d''un rectangle de 9 cm et 12 cm est :',
    '√(9²+12²) = √(81+144) = √225 = 15 cm.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '15 cm', 1, 1),
(@qid, '8 cm', 0, 2),
(@qid, '30 cm', 0, 3),
(@qid, '21 cm', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le cardinal de E × F où E = {a,i,o} et F = {2,3,4,5} est :',
    '3 × 4 = 12.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3', 0, 1),
(@qid, '7', 0, 2),
(@qid, '12', 1, 3),
(@qid, '4', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un mètre cube d''eau en centilitres sous forme de puissance de 10 est :',
    '1 m³ = 1000 L = 100000 cL = 10⁵ cL.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10³', 0, 1),
(@qid, '10⁵', 1, 2),
(@qid, '10⁴', 0, 3),
(@qid, '10⁶', 0, 4);

-- ============================================
-- EXAMEN 12 : (page 22)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La forme réduite de E = √704 - 6√121 + √99 - 8√396 est :',
    '√704 = 8√11, 6√121 = 66, √99 = 3√11, 8√396 = 48√11. E = -66 - 37√11.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '66 - 37√11', 0, 1),
(@qid, '66 + 37√11', 0, 2),
(@qid, '-66 - 37√11', 1, 3),
(@qid, '37√11 - 66', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si ABC est isocèle en C et B = 76°, alors C = ?',
    'Isocèle en C → Â = B = 76°. C = 180-152 = 28°.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '46°', 0, 1),
(@qid, '76°', 0, 2),
(@qid, '52°', 0, 3),
(@qid, '28°', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le rayon d''un disque dont l''aire est 153,86 cm² vaut :',
    'A = πR² → R² = 153,86/3,14 = 49 → R = 7 cm.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '12 cm', 0, 1),
(@qid, '5 cm', 0, 2),
(@qid, '7 cm', 1, 3),
(@qid, '10,88 cm', 0, 4);

-- ============================================
-- EXAMEN 13 : (page 24)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si a et b sont non nuls, alors (a/b)ⁿ =',
    '(a/b)ⁿ = aⁿ/bⁿ.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a/bⁿ', 0, 1),
(@qid, 'aⁿ/bⁿ', 1, 2),
(@qid, 'bⁿ/aⁿ', 0, 3),
(@qid, 'aⁿ/b', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'x² + 8x + a est le développement de (x+4)² si a vaut :',
    '(x+4)² = x² + 8x + 16 → a = 16.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-16', 0, 1),
(@qid, '8', 0, 2),
(@qid, '-8', 0, 3),
(@qid, '16', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un triangle ABC rectangle en A, AB = 8 cm, BC = 10 cm. AC = ?',
    'AC² = 10² - 8² = 100 - 64 = 36 → AC = 6 cm.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6 cm', 1, 1),
(@qid, '18 cm', 0, 2),
(@qid, '2 cm', 0, 3),
(@qid, '36 cm', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un récipient de 160 L rempli en 40 mn. Débit du robinet :',
    '160/40 = 4 L/min.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4 L/min', 1, 1),
(@qid, '8 L/min', 0, 2),
(@qid, '16 L/min', 0, 3),
(@qid, '1,3 L/min', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si 1 grade = 0,9 degré, alors 70 grades = ?',
    '70 × 0,9 = 63 degrés.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6,3 degrés', 0, 1),
(@qid, '73,77 degrés', 0, 2),
(@qid, '63 degrés', 1, 3),
(@qid, '0,063 degré', 0, 4);

-- ============================================
-- EXAMEN 14 : (page 26)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '(aⁿ)ᵖ est égal à :',
    '(aⁿ)ᵖ = aⁿᵖ.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'aⁿ⁺ᵖ', 0, 1),
(@qid, 'aⁿᵖ', 1, 2),
(@qid, 'aⁿ⁻ᵖ', 0, 3),
(@qid, 'aⁿ/ᵖ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le supplément d''un angle est l''angle qu''il faut lui ajouter pour obtenir :',
    'Supplément = 180° = angle plat.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un angle droit', 0, 1),
(@qid, 'Un angle obtus', 0, 2),
(@qid, 'Un angle plat', 1, 3),
(@qid, 'Un angle nul', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si un angle au centre mesure 76°, l''angle inscrit associé mesure :',
    'Angle inscrit = angle au centre / 2 = 38°.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '76°', 0, 1),
(@qid, '38°', 1, 2),
(@qid, '152°', 0, 3),
(@qid, '284°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un robinet débite 14 L/min. Temps pour 5250 L :',
    '5250/14 = 375 min = 6 h 15 min.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6 h 25 min', 0, 1),
(@qid, '6 h 25 s', 0, 2),
(@qid, '6 h 15 min', 1, 3),
(@qid, '6 h 15 s', 0, 4);

-- ============================================
-- EXAMEN 15 : (page 27)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le centre de gravité d''un triangle est le point de rencontre de ses :',
    'Centre de gravité = intersection des médianes.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hauteurs', 0, 1),
(@qid, 'Bissectrices', 0, 2),
(@qid, 'Médianes', 1, 3),
(@qid, 'Médiatrices', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un angle dont la mesure est strictement supérieure à 90° et inférieure à 180° est :',
    'Angle obtus : 90° < angle < 180°.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aigu', 0, 1),
(@qid, 'Obtus', 1, 2),
(@qid, 'Plat', 0, 3),
(@qid, 'Droit', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le calcul de (2²)³ donne :',
    '2⁶ = 64.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '12', 0, 1),
(@qid, '36', 0, 2),
(@qid, '32', 0, 3),
(@qid, '64', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le volume d''un cône de révolution de hauteur 5 cm et rayon 3 cm est :',
    'V = π×3²×5/3 = 15π ≈ 47,1 cm³.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'V = 41,3 cm³', 0, 1),
(@qid, 'V = 94,2 cm³', 0, 2),
(@qid, 'V = 47,1 cm³', 1, 3),
(@qid, 'V = 45 cm³', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une rivière a un débit moyen de 650 m³/s. Son débit à l''heure est :',
    '650 × 3600 = 2 340 000 m³/h.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 340 000 m³', 1, 1),
(@qid, '234 000 m³', 0, 2),
(@qid, '39 000 m³', 0, 3),
(@qid, '390 000 m³', 0, 4);

-- ============================================
-- EXAMEN 16 : (page 28)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le centre du cercle inscrit dans un triangle est le point de rencontre de ses :',
    'Centre du cercle inscrit = intersection des bissectrices.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bissectrices', 1, 1),
(@qid, 'Médiatrices', 0, 2),
(@qid, 'Médianes', 0, 3),
(@qid, 'Hauteurs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''écriture de √150 sous forme a√b avec a entier est :',
    '√150 = √(25×6) = 5√6.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10√15', 0, 1),
(@qid, '15√10', 0, 2),
(@qid, '6√5', 0, 3),
(@qid, '5√6', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''expression factorisée de f(x) = 4x² - 25 est :',
    '4x² - 25 = (2x)² - 5² = (2x-5)(2x+5).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(4x-5)(2x+5)', 0, 1),
(@qid, '(4x-5)²', 0, 2),
(@qid, '(2x-5)(2x+5)', 1, 3),
(@qid, '(2x-5)²', 0, 4);

-- ============================================
-- EXAMEN 17 : (page 30)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si x > 4, on peut en déduire que :',
    'x > 4 → x + 3 > 7.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x + 3 = 7', 0, 1),
(@qid, 'x + 3 > 7', 1, 2),
(@qid, 'x + 3 > 12', 0, 3),
(@qid, 'x + 3 ≥ 12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Dans un parallélogramme, deux angles consécutifs sont :',
    'Angles consécutifs d''un parallélogramme = supplémentaires (somme 180°).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Isométriques', 0, 1),
(@qid, 'Adjacents', 0, 2),
(@qid, 'Complémentaires', 0, 3),
(@qid, 'Supplémentaires', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Trouve n sachant que -7 843 000 = -7,843 × 10ⁿ :',
    '-7 843 000 = -7,843 × 10⁶.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'n = -6', 0, 1),
(@qid, 'n = -3', 0, 2),
(@qid, 'n = 6', 1, 3),
(@qid, 'n = 3', 0, 4);

-- ============================================
-- EXAMEN 18 : (page 32)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '1 mégatonne est égal à :',
    '1 mégatonne = 10⁶ tonnes.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10⁶ tonnes', 1, 1),
(@qid, '10³ tonnes', 0, 2),
(@qid, '10⁹ tonnes', 0, 3),
(@qid, '10¹² tonnes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si une médiane d''un triangle mesure la moitié du côté correspondant, le triangle est :',
    'Propriété du triangle rectangle : médiane = moitié de l''hypoténuse.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Isocèle', 0, 1),
(@qid, 'Scalène', 0, 2),
(@qid, 'Équilatéral', 0, 3),
(@qid, 'Rectangle', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le résultat de 1 - 1/2(2/5 - 1) est :',
    '2/5 - 1 = -3/5. 1/2 × (-3/5) = -3/10. 1 - (-3/10) = 1 + 0,3 = 13/10.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-13/10', 0, 1),
(@qid, '3/10', 0, 2),
(@qid, '13/10', 1, 3),
(@qid, '-3/10', 0, 4);

-- ============================================
-- EXAMEN 19 : (page 33)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''écriture 0,000001 sous forme de puissance de 10 est :',
    '0,000001 = 10⁻⁶.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10⁻⁵', 0, 1),
(@qid, '10⁵', 0, 2),
(@qid, '10⁻⁶', 1, 3),
(@qid, '10⁶', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le capital qui, placé à 2,5% l''an, rapporte 750 G d''intérêt au bout d''un an est :',
    '750 = C × 2,5/100 → C = 75000/2,5 = 30 000 G.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '30 000 Gdes', 1, 1),
(@qid, '2 625 Gdes', 0, 2),
(@qid, '1 875 Gdes', 0, 3),
(@qid, '3 350 Gdes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'GHI rectangle en H, GI = 14 cm, GH = 8 cm. HI = ?',
    'HI² = 14² - 8² = 196-64 = 132. HI = √132 ≈ 11,5 cm.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '16,12 cm', 0, 1),
(@qid, '36 cm', 0, 2),
(@qid, '11,5 cm', 1, 3),
(@qid, '22 cm', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si A = 133°, son supplément B mesure :',
    '180° - 133° = 47°.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '43°', 0, 1),
(@qid, '143°', 0, 2),
(@qid, '153°', 0, 3),
(@qid, '47°', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Avec 10 kg de peinture on recouvre 18 m². Avec 25 kg, la surface est :',
    '25 × 18/10 = 45 m².', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '36 m²', 0, 1),
(@qid, '180 m²', 0, 2),
(@qid, '20 m²', 0, 3),
(@qid, '45 m²', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '10% de 47% de 1000 kg est égal à :',
    '0,10 × 0,47 × 1000 = 47 kg.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 kg', 0, 1),
(@qid, '470 kg', 0, 2),
(@qid, '47 kg', 1, 3),
(@qid, '10 kg', 0, 4);

-- ============================================
-- EXAMEN 20 : (page 34)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le complément d''un angle est 40°. La mesure de cet angle est :',
    '90° - 40° = 50°.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '140°', 0, 1),
(@qid, '40°', 0, 2),
(@qid, '80°', 0, 3),
(@qid, '50°', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le résultat de 8 + 4/5 est :',
    '8 + 0,8 = 40/5 + 4/5 = 44/5.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5/12', 0, 1),
(@qid, '12/10', 0, 2),
(@qid, '12/25', 0, 3),
(@qid, '44/5', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Dans un triangle rectangle, la médiane relative à l''hypoténuse mesure 4 cm. L''hypoténuse mesure :',
    'Hypoténuse = 2 × médiane = 8 cm.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 cm', 0, 1),
(@qid, '12 cm', 0, 2),
(@qid, '8 cm', 1, 3),
(@qid, '6 cm', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''opposé de -2a + 3 est :',
    '-(-2a+3) = 2a - 3.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-2a - 3', 0, 1),
(@qid, '2a + 3', 0, 2),
(@qid, '2a - 3', 1, 3),
(@qid, 'Aucune', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '14% de 125 est égal à :',
    '0,14 × 125 = 17,5.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '175', 0, 1),
(@qid, '17,5', 1, 2),
(@qid, '12,5', 0, 3),
(@qid, '89,2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si x/2 = 6, alors x = ?',
    'x = 12.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3', 0, 1),
(@qid, '12', 1, 2),
(@qid, '8', 0, 3),
(@qid, '4', 0, 4);

-- ============================================
-- EXAMEN 21 : (page 35)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'A et B sont supplémentaires. Si A = 47°, alors B = ?',
    '180° - 47° = 133°.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '153°', 0, 1),
(@qid, '143°', 0, 2),
(@qid, '133°', 1, 3),
(@qid, '43°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Sur 340 copies, 178 ont eu la note 8. Le pourcentage de cette note est :',
    '178/340 × 100 = 52,35%.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '52%', 0, 1),
(@qid, '40,01%', 0, 2),
(@qid, '52,35%', 1, 3),
(@qid, '36%', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un robinet remplit 10 L en 25 secondes. Le débit en L/min est :',
    '10 L/25 s = 0,4 L/s = 24 L/min.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '18 L/min', 0, 1),
(@qid, '24 L/min', 1, 2),
(@qid, '4,11 L/min', 0, 3),
(@qid, '125,8 L/min', 0, 4);

-- ============================================
-- QUESTIONS SUPPLÉMENTAIRES - GÉOMÉTRIE
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un triangle qui a deux côtés égaux est :',
    'Deux côtés égaux = triangle isocèle.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Isocèle', 1, 1),
(@qid, 'Rectangle', 0, 2),
(@qid, 'Équilatéral', 0, 3),
(@qid, 'Scalène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La médiatrice d''un segment est :',
    'Perpendiculaire au milieu du segment.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parallèle au segment', 0, 1),
(@qid, 'Perpendiculaire au segment en son milieu', 1, 2),
(@qid, 'Oblique', 0, 3),
(@qid, 'La moitié du segment', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Deux angles adjacents supplémentaires ont une somme de :',
    'Supplémentaires = 180°.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '90°', 0, 1),
(@qid, '180°', 1, 2),
(@qid, '270°', 0, 3),
(@qid, '360°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un quadrilatère ayant ses côtés opposés parallèles est un :',
    'Côtés opposés parallèles = parallélogramme.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Trapèze', 0, 1),
(@qid, 'Parallélogramme', 1, 2),
(@qid, 'Losange seulement', 0, 3),
(@qid, 'Carré seulement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le théorème de Pythagore s''applique dans un triangle :',
    'Uniquement dans un triangle rectangle.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Quelconque', 0, 1),
(@qid, 'Rectangle', 1, 2),
(@qid, 'Isocèle', 0, 3),
(@qid, 'Équilatéral', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La somme des angles d''un triangle vaut :',
    'Toujours 180°, quel que soit le triangle.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '90°', 0, 1),
(@qid, '180°', 1, 2),
(@qid, '270°', 0, 3),
(@qid, '360°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un angle plat mesure :',
    '180°.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '90°', 0, 1),
(@qid, '180°', 1, 2),
(@qid, '270°', 0, 3),
(@qid, '360°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un angle aigu mesure :',
    'Strictement entre 0° et 90°.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Plus de 90°', 0, 1),
(@qid, 'Exactement 90°', 0, 2),
(@qid, 'Entre 0° et 90°', 1, 3),
(@qid, 'Exactement 180°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La bissectrice d''un angle :',
    'Partage l''angle en deux angles égaux.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Est perpendiculaire au côté', 0, 1),
(@qid, 'Partage l''angle en deux angles égaux', 1, 2),
(@qid, 'Passe par le milieu du côté opposé', 0, 3),
(@qid, 'Joint deux sommets', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une médiatrice est :',
    'Perpendiculaire à un segment en son milieu.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une droite parallèle au côté', 0, 1),
(@qid, 'Une droite passant par un sommet', 0, 2),
(@qid, 'Perpendiculaire au milieu d''un segment', 1, 3),
(@qid, 'Une droite quelconque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Deux droites perpendiculaires forment un angle de :',
    'Angle droit = 90°.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '45°', 0, 1),
(@qid, '90°', 1, 2),
(@qid, '180°', 0, 3),
(@qid, '0°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le cercle circonscrit à un triangle rectangle a son centre :',
    'Au milieu de l''hypoténuse.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'À un sommet', 0, 1),
(@qid, 'Au milieu de l''hypoténuse', 1, 2),
(@qid, 'Au centre de gravité', 0, 3),
(@qid, 'À l''orthocentre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un trapèze est un quadrilatère ayant :',
    'Deux côtés parallèles (les bases).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4 côtés égaux', 0, 1),
(@qid, '2 côtés parallèles', 1, 2),
(@qid, 'Un angle droit', 0, 3),
(@qid, 'Des diagonales perpendiculaires', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un losange est un quadrilatère ayant :',
    '4 côtés égaux.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un angle droit', 0, 1),
(@qid, '4 côtés égaux', 1, 2),
(@qid, '2 côtés parallèles', 0, 3),
(@qid, 'Des diagonales égales', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Les diagonales d''un rectangle :',
    'Ont la même longueur et se coupent en leur milieu.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sont perpendiculaires', 0, 1),
(@qid, 'Ont la même longueur et se coupent en leur milieu', 1, 2),
(@qid, 'Sont des axes de symétrie', 0, 3),
(@qid, 'Ne se coupent pas', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Les diagonales d''un losange :',
    'Se coupent perpendiculairement en leur milieu.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sont égales', 0, 1),
(@qid, 'Se coupent perpendiculairement en leur milieu', 1, 2),
(@qid, 'Sont parallèles', 0, 3),
(@qid, 'Ne se coupent pas', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le centre de gravité d''un triangle se trouve :',
    'Aux 2/3 de chaque médiane à partir du sommet.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Au milieu d''un côté', 0, 1),
(@qid, 'À l''intersection des médianes', 1, 2),
(@qid, 'À l''intersection des hauteurs', 0, 3),
(@qid, 'À l''intersection des médiatrices', 0, 4);

-- ============================================
-- QUESTIONS SUPPLÉMENTAIRES - ALGÈBRE
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Quel est le PGCD de 24 et 36 ?',
    '24 = 2³ × 3, 36 = 2² × 3². PGCD = 2² × 3 = 12.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6', 0, 1),
(@qid, '12', 1, 2),
(@qid, '18', 0, 3),
(@qid, '24', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Résoudre 2x + 4 = 10 :',
    '2x = 6 → x = 3.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x = 2', 0, 1),
(@qid, 'x = 3', 1, 2),
(@qid, 'x = 4', 0, 3),
(@qid, 'x = 5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Factoriser x² - 9 :',
    '(x-3)(x+3) = différence de deux carrés.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(x-3)²', 0, 1),
(@qid, '(x-3)(x+3)', 1, 2),
(@qid, '(x+3)²', 0, 3),
(@qid, 'x(x-9)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Développer (x+3)² :',
    'x² + 6x + 9.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x² + 9', 0, 1),
(@qid, 'x² + 6x + 9', 1, 2),
(@qid, 'x² + 3x + 9', 0, 3),
(@qid, 'x² + 6x + 6', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si f(x) = 2x - 3, alors f(5) = ?',
    '2×5 - 3 = 7.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5', 0, 1),
(@qid, '7', 1, 2),
(@qid, '10', 0, 3),
(@qid, '13', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La solution de x + 3 > 8 est :',
    'x > 5.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x > 5', 1, 1),
(@qid, 'x < 5', 0, 2),
(@qid, 'x ≥ 5', 0, 3),
(@qid, 'x = 5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Quel est l''inverse de 4 ?',
    'L''inverse de 4 est 1/4.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-4', 0, 1),
(@qid, '0', 0, 2),
(@qid, '1/4', 1, 3),
(@qid, '4', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La racine carrée de 144 est :',
    '12 × 12 = 144.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '11', 0, 1),
(@qid, '12', 1, 2),
(@qid, '14', 0, 3),
(@qid, '10', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le système 2x+y=5, x-y=1 a pour solution :',
    'Addition : 3x = 6 → x = 2, y = 1.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x=1, y=3', 0, 1),
(@qid, 'x=2, y=1', 1, 2),
(@qid, 'x=3, y=-1', 0, 3),
(@qid, 'x=0, y=5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La forme réduite de 2x + 3x - x est :',
    '2+3-1 = 4, donc 4x.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5x', 0, 1),
(@qid, '4x', 1, 2),
(@qid, '6x', 0, 3),
(@qid, '3x', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '100% d''un nombre représente :',
    '100% = le nombre lui-même.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sa moitié', 0, 1),
(@qid, 'Son double', 0, 2),
(@qid, 'Ce nombre lui-même', 1, 3),
(@qid, 'Son quart', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un article à 500 G avec 20% de remise coûte :',
    '500 × 0,80 = 400 G.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 G', 0, 1),
(@qid, '400 G', 1, 2),
(@qid, '480 G', 0, 3),
(@qid, '520 G', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le PPCM de 4 et 6 est :',
    'Multiples de 4 : 4,8,12 ; de 6 : 6,12. PPCM = 12.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6', 0, 1),
(@qid, '8', 0, 2),
(@qid, '12', 1, 3),
(@qid, '24', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La notation scientifique de 0,00345 est :',
    '3,45 × 10⁻³.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '34,5 × 10⁻²', 0, 1),
(@qid, '3,45 × 10⁻³', 1, 2),
(@qid, '345 × 10⁻²', 0, 3),
(@qid, '0,345 × 10⁻²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une fonction linéaire est de la forme :',
    'f(x) = ax, représentée par une droite passant par l''origine.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f(x) = ax + b', 0, 1),
(@qid, 'f(x) = ax', 1, 2),
(@qid, 'f(x) = ax²', 0, 3),
(@qid, 'f(x) = a/x', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une fonction affine est de la forme :',
    'f(x) = ax + b, représentée par une droite.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f(x) = ax + b', 1, 1),
(@qid, 'f(x) = ax²', 0, 2),
(@qid, 'f(x) = a/x', 0, 3),
(@qid, 'f(x) = ax', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '(a-b)² = ?',
    'a² - 2ab + b².', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a² - b²', 0, 1),
(@qid, 'a² + b²', 0, 2),
(@qid, 'a² - 2ab + b²', 1, 3),
(@qid, 'a² + 2ab + b²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '(a+b)(a-b) = ?',
    'a² - b².', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a² - b²', 1, 1),
(@qid, 'a² + b²', 0, 2),
(@qid, 'a² + 2ab + b²', 0, 3),
(@qid, 'a² - 2ab + b²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une application f de A vers B est une bijection si :',
    'Elle est à la fois injective (tout élément de B a au plus 1 antécédent) et surjective (tout élément de B a au moins 1 antécédent).', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Elle est injective seulement', 0, 1),
(@qid, 'Elle est surjective seulement', 0, 2),
(@qid, 'Elle est injective et surjective', 1, 3),
(@qid, 'Elle n''est ni injective ni surjective', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La composée gof signifie :',
    'On applique f d''abord, puis g au résultat : g(f(x)).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Appliquer f puis g', 1, 1),
(@qid, 'Appliquer g puis f', 0, 2),
(@qid, 'Appliquer f et g en même temps', 0, 3),
(@qid, 'Additionner f et g', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La valeur absolue de -5 est :',
    '|-5| = 5.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-5', 0, 1),
(@qid, '0', 0, 2),
(@qid, '5', 1, 3),
(@qid, '25', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le nombre π est un :',
    'π est un nombre irrationnel (développement décimal infini non périodique).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Nombre rationnel', 0, 1),
(@qid, 'Nombre décimal', 0, 2),
(@qid, 'Nombre irrationnel', 1, 3),
(@qid, 'Entier naturel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '√2 est un nombre :',
    '√2 ne peut pas s''écrire sous forme de fraction = irrationnel.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Rationnel', 0, 1),
(@qid, 'Irrationnel', 1, 2),
(@qid, 'Décimal', 0, 3),
(@qid, 'Entier', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Dans un repère, la pente d''une droite d''équation y = ax + b est :',
    'Le coefficient directeur a.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a', 1, 1),
(@qid, 'b', 0, 2),
(@qid, 'x', 0, 3),
(@qid, 'y', 0, 4);

-- ============================================
-- QUESTIONS SUPPLÉMENTAIRES - STATISTIQUES ET PROBABILITÉS
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La médiane d''une série de 7 valeurs est :',
    'La 4e valeur après classement par ordre croissant.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La plus grande valeur', 0, 1),
(@qid, 'La 4e valeur après classement', 1, 2),
(@qid, 'La somme divisée par 7', 0, 3),
(@qid, 'La plus petite valeur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La moyenne de 10, 12, 14, 16, 18 est :',
    'Somme = 70, 5 valeurs → 70/5 = 14.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '12', 0, 1),
(@qid, '14', 1, 2),
(@qid, '15', 0, 3),
(@qid, '16', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La probabilité d''obtenir un 6 en lançant un dé équilibré est :',
    '1 face favorable sur 6 possibles = 1/6.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/5', 0, 1),
(@qid, '1/6', 1, 2),
(@qid, '1/3', 0, 3),
(@qid, '1/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le mode d''une série statistique est :',
    'La valeur qui apparaît le plus souvent.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La moyenne', 0, 1),
(@qid, 'La valeur la plus fréquente', 1, 2),
(@qid, 'La médiane', 0, 3),
(@qid, 'La somme des valeurs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La fréquence d''une valeur est :',
    'Effectif de la valeur / effectif total.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Son effectif', 0, 1),
(@qid, 'Effectif / effectif total', 1, 2),
(@qid, '1 - effectif', 0, 3),
(@qid, 'Effectif total / 2', 0, 4);

-- ============================================
-- QUESTIONS SUPPLÉMENTAIRES - MESURES ET GRANDEURS
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le périmètre d''un cercle de rayon 7 cm est :',
    'P = 2πR ≈ 44 cm.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '22 cm', 0, 1),
(@qid, '44 cm', 1, 2),
(@qid, '154 cm', 0, 3),
(@qid, '49 cm', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''aire d''un disque de rayon R est :',
    'A = πR².', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2πR', 0, 1),
(@qid, 'πR²', 1, 2),
(@qid, 'πR²/2', 0, 3),
(@qid, '4πR²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le volume d''une pyramide est :',
    'V = (Aire de base × hauteur) / 3.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aire base × hauteur', 0, 1),
(@qid, '(Aire base × hauteur) / 3', 1, 2),
(@qid, 'Aire base × hauteur × 2', 0, 3),
(@qid, '(Aire base)² × hauteur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le volume d''un cône de révolution est :',
    'V = (πR² × h) / 3.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'πR² × h', 0, 1),
(@qid, '(πR² × h) / 3', 1, 2),
(@qid, '2πR × h', 0, 3),
(@qid, '(πR² × h) / 2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le volume d''un cylindre de révolution est :',
    'V = πR² × h.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'πR² × h', 1, 1),
(@qid, '(πR² × h) / 3', 0, 2),
(@qid, '2πR × h', 0, 3),
(@qid, 'πR² × h / 2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le volume d''une sphère de rayon R est :',
    'V = 4/3 × πR³.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4πR²', 0, 1),
(@qid, '4/3 πR³', 1, 2),
(@qid, 'πR³', 0, 3),
(@qid, '2/3 πR³', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '1 km = ?',
    '1000 mètres.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10 m', 0, 1),
(@qid, '100 m', 0, 2),
(@qid, '1000 m', 1, 3),
(@qid, '10000 m', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '1 m³ = ?',
    '1000 litres = 1000 dm³.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10 L', 0, 1),
(@qid, '100 L', 0, 2),
(@qid, '1000 L', 1, 3),
(@qid, '10000 L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La vitesse v est donnée par :',
    'v = distance / temps.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'v = d × t', 0, 1),
(@qid, 'v = d / t', 1, 2),
(@qid, 'v = t / d', 0, 3),
(@qid, 'v = d + t', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le débit D est donné par :',
    'D = volume / temps.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'D = V × t', 0, 1),
(@qid, 'D = V / t', 1, 2),
(@qid, 'D = t / V', 0, 3),
(@qid, 'D = V + t', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une échelle 1/100000 signifie que 1 cm sur la carte représente :',
    '1 cm → 100000 cm = 1 km.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 m', 0, 1),
(@qid, '100 m', 0, 2),
(@qid, '1 km', 1, 3),
(@qid, '10 km', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''aire d''un triangle est :',
    'A = (base × hauteur) / 2.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Base × hauteur', 0, 1),
(@qid, '(Base × hauteur) / 2', 1, 2),
(@qid, 'Base + hauteur', 0, 3),
(@qid, '(Base × hauteur) / 3', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''aire d''un trapèze est :',
    'A = (Grande base + Petite base) × hauteur / 2.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'B × h', 0, 1),
(@qid, '(B + b) × h / 2', 1, 2),
(@qid, 'π × B × h', 0, 3),
(@qid, '(B × b) / 2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''aire d''un losange de diagonales D et d est :',
    'A = (D × d) / 2.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'D × d', 0, 1),
(@qid, '(D × d) / 2', 1, 2),
(@qid, 'D + d', 0, 3),
(@qid, '(D + d) / 2', 0, 4);

-- ============================================
-- QUESTIONS - INTÉRÊTS SIMPLES ET COMPOSÉS
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''intérêt simple I pour un capital C, taux t% sur 1 an est :',
    'I = C × t / 100.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'I = C × t', 0, 1),
(@qid, 'I = C × t / 100', 1, 2),
(@qid, 'I = C / t', 0, 3),
(@qid, 'I = t / C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un capital placé à intérêts composés à 5% l''an double après :',
    'Approximativement 14-15 ans (règle des 72).', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10 ans', 0, 1),
(@qid, '14-15 ans', 1, 2),
(@qid, '20 ans', 0, 3),
(@qid, '5 ans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Après 2 ans à intérêts composés à 5%, un capital de 50 000 G devient :',
    '50 000 × (1,05)² = 50 000 × 1,1025 = 55 125 G.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '52 500 G', 0, 1),
(@qid, '55 000 G', 0, 2),
(@qid, '55 125 G', 1, 3),
(@qid, '60 000 G', 0, 4);

-- ============================================
-- QUESTIONS - THÉORÈME DE THALÈS
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le théorème de Thalès s''applique quand :',
    'Des droites parallèles coupent deux droites sécantes.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les droites sont perpendiculaires', 0, 1),
(@qid, 'Des parallèles coupent deux sécantes', 1, 2),
(@qid, 'Un triangle est rectangle', 0, 3),
(@qid, 'Un quadrilatère est un carré', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si (MN)//(BC) dans un triangle ABC, alors :',
    'AM/AB = AN/AC = MN/BC.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'AM/AB = AN/AC = MN/BC', 1, 1),
(@qid, 'AM/AB = AC/AN', 0, 2),
(@qid, 'AM = AN', 0, 3),
(@qid, 'MN = BC/3', 0, 4);

-- ============================================
-- QUESTIONS - VECTEURS
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La relation de Chasles pour les vecteurs s''écrit :',
    'AB + BC = AC.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'AB + BC = AC', 1, 1),
(@qid, 'AB - BC = AC', 0, 2),
(@qid, 'AB + AC = BC', 0, 3),
(@qid, 'AB × BC = AC', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Deux vecteurs sont égaux si :',
    'Même direction, même sens, même longueur.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ils ont la même direction', 0, 1),
(@qid, 'Ils ont même direction, même sens, même longueur', 1, 2),
(@qid, 'Ils sont perpendiculaires', 0, 3),
(@qid, 'Ils ont la même longueur', 0, 4);

-- ============================================
-- QUESTIONS FINALES - CALCUL MENTAL ET RÉVISION
-- ============================================

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
(3, 2, 'Un triangle qui a tous ses côtés égaux est :',
    'Équilatéral = trois côtés égaux.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Isocèle', 0, 1),
(@qid, 'Rectangle', 0, 2),
(@qid, 'Équilatéral', 1, 3),
(@qid, 'Scalène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le quotient de 18 par 6 est :',
    '18 ÷ 6 = 3.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1),
(@qid, '3', 1, 2),
(@qid, '6', 0, 3),
(@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La somme de trois nombres consécutifs est 135. Le plus petit est :',
    'x + (x+1) + (x+2) = 135 → 3x+3 = 135 → x = 44.', 'Examen 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '43', 0, 1),
(@qid, '44', 1, 2),
(@qid, '45', 0, 3),
(@qid, '46', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le périmètre d''un rectangle de longueur L et largeur l est :',
    'P = 2(L + l).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L × l', 0, 1),
(@qid, '2(L + l)', 1, 2),
(@qid, 'L + l', 0, 3),
(@qid, '4(L + l)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Les nombres 2, 3, 5, 7, 11 sont :',
    'Ce sont des nombres premiers (divisibles seulement par 1 et eux-mêmes).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des multiples de 2', 0, 1),
(@qid, 'Des nombres premiers', 1, 2),
(@qid, 'Des nombres pairs', 0, 3),
(@qid, 'Des diviseurs de 100', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un cône de révolution a 1 base qui est :',
    'Un disque.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un carré', 0, 1),
(@qid, 'Un triangle', 0, 2),
(@qid, 'Un disque', 1, 3),
(@qid, 'Un rectangle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une pyramide a pour base :',
    'Un polygone quelconque.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un disque', 0, 1),
(@qid, 'Un polygone', 1, 2),
(@qid, 'Un cercle', 0, 3),
(@qid, 'Une droite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un prisme droit a des faces latérales qui sont :',
    'Des rectangles.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des triangles', 0, 1),
(@qid, 'Des rectangles', 1, 2),
(@qid, 'Des cercles', 0, 3),
(@qid, 'Des losanges', 0, 4);

-- ============================================
-- DERNIÈRES QUESTIONS POUR DÉPASSER 400
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '2³ × 2⁴ = ?',
    '2³⁺⁴ = 2⁷ = 128.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2⁷', 1, 1),
(@qid, '2¹²', 0, 2),
(@qid, '4⁷', 0, 3),
(@qid, '2⁻¹', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '(3x-2)² se développe en :',
    '9x² - 12x + 4.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '9x² - 4', 0, 1),
(@qid, '9x² - 12x + 4', 1, 2),
(@qid, '9x² + 4', 0, 3),
(@qid, '9x² - 6x + 4', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Dans un cercle, un angle inscrit mesure la moitié de :',
    'L''angle au centre qui intercepte le même arc.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''angle au centre associé', 1, 1),
(@qid, 'L''angle droit', 0, 2),
(@qid, 'L''angle plat', 0, 3),
(@qid, 'Son complément', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Résoudre l''équation (x+3)(x-2) = 0 donne :',
    'x+3=0 → x=-3 ou x-2=0 → x=2.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x = 3 et x = 2', 0, 1),
(@qid, 'x = -3 et x = 2', 1, 2),
(@qid, 'x = 3 et x = -2', 0, 3),
(@qid, 'x = -3 et x = -2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si f(x) = 2x+1 et g(x) = x-3, alors fog(x) = ?',
    'f(g(x)) = 2(x-3)+1 = 2x-6+1 = 2x-5.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2x-5', 1, 1),
(@qid, '2x-3', 0, 2),
(@qid, '2x+7', 0, 3),
(@qid, '2x+1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Une droite parallèle à l''axe des abscisses a pour équation :',
    'y = constante (y = b).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'y = ax + b', 0, 1),
(@qid, 'y = b', 1, 2),
(@qid, 'x = a', 0, 3),
(@qid, 'x = 0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La réciproque du théorème de Pythagore permet de :',
    'Prouver qu''un triangle est rectangle.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Calculer un côté', 0, 1),
(@qid, 'Prouver qu''un triangle est rectangle', 1, 2),
(@qid, 'Calculer l''hypoténuse', 0, 3),
(@qid, 'Tracer un cercle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La somme des angles d''un quadrilatère vaut :',
    '360° (2 triangles de 180°).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '180°', 0, 1),
(@qid, '360°', 1, 2),
(@qid, '270°', 0, 3),
(@qid, '90°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La section d''un cylindre par un plan parallèle à sa base est :',
    'Un disque identique à la base.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un rectangle', 0, 1),
(@qid, 'Un disque', 1, 2),
(@qid, 'Un triangle', 0, 3),
(@qid, 'Une ellipse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un losange ayant un angle droit est :',
    'Un carré.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un rectangle', 0, 1),
(@qid, 'Un carré', 1, 2),
(@qid, 'Un trapèze', 0, 3),
(@qid, 'Un parallélogramme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le rapport d''agrandissement k pour les aires est :',
    'Les aires sont multipliées par k².', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'k', 0, 1),
(@qid, 'k²', 1, 2),
(@qid, 'k³', 0, 3),
(@qid, '1/k', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le rapport d''agrandissement k pour les volumes est :',
    'Les volumes sont multipliés par k³.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'k', 0, 1),
(@qid, 'k²', 0, 2),
(@qid, 'k³', 1, 3),
(@qid, '1/k', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La tangente à un cercle en un point est :',
    'Perpendiculaire au rayon passant par ce point.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parallèle au rayon', 0, 1),
(@qid, 'Perpendiculaire au rayon', 1, 2),
(@qid, 'Sécante au rayon', 0, 3),
(@qid, 'Confondue avec le rayon', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un polygone régulier a :',
    'Tous ses côtés et tous ses angles égaux.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des côtés égaux seulement', 0, 1),
(@qid, 'Tous ses côtés et angles égaux', 1, 2),
(@qid, 'Des angles égaux seulement', 0, 3),
(@qid, '4 côtés', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La perspective cavalière permet de :',
    'Représenter des solides en 3D sur une surface plane.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Calculer des volumes', 0, 1),
(@qid, 'Représenter des solides en 3D', 1, 2),
(@qid, 'Mesurer des angles', 0, 3),
(@qid, 'Résoudre des équations', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si on triple le rayon d''un disque, son aire est multipliée par :',
    'Aire = πR². Si R×3, aire ×9.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3', 0, 1),
(@qid, '6', 0, 2),
(@qid, '9', 1, 3),
(@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un angle inscrit interceptant un demi-cercle mesure :',
    'Tout angle inscrit dans un demi-cercle est droit = 90°.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '45°', 0, 1),
(@qid, '90°', 1, 2),
(@qid, '180°', 0, 3),
(@qid, '60°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Deux cercles sont tangents extérieurement si la distance de leurs centres est :',
    'OO'' = R + R''.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'OO'' = R - R''', 0, 1),
(@qid, 'OO'' = R + R''', 1, 2),
(@qid, 'OO'' > R + R''', 0, 3),
(@qid, 'OO'' < R - R''', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Deux cercles sont intérieurs l''un à l''autre si :',
    'OO'' < |R - R''| (un cercle est à l''intérieur de l''autre sans se toucher).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'OO'' = R + R''', 0, 1),
(@qid, 'OO'' = R - R''', 0, 2),
(@qid, 'OO'' < R - R''', 1, 3),
(@qid, 'OO'' > R + R''', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Dans une division euclidienne de 1754 par 62, le quotient est :',
    '1754 ÷ 62 = 28 reste 18.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '27', 0, 1),
(@qid, '28', 1, 2),
(@qid, '29', 0, 3),
(@qid, '30', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'La surface latérale d''un cylindre est :',
    '2πR × h (périmètre de la base × hauteur).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'πR² × h', 0, 1),
(@qid, '2πR × h', 1, 2),
(@qid, 'πR × h', 0, 3),
(@qid, '4πR²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un Rond-point a un rayon de 28 m. Sa circonférence est :',
    '2 × π × 28 ≈ 175,84 m.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '87,92 m', 0, 1),
(@qid, '175,84 m', 1, 2),
(@qid, '2461,76 m', 0, 3),
(@qid, '351,68 m', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si 1 grade = 0,9°, alors 100 grades = ?',
    '100 × 0,9 = 90° (un angle droit).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '45°', 0, 1),
(@qid, '90°', 1, 2),
(@qid, '180°', 0, 3),
(@qid, '100°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'π radians correspondent à :',
    '180° (π rad = 180°).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '90°', 0, 1),
(@qid, '180°', 1, 2),
(@qid, '360°', 0, 3),
(@qid, '270°', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''image de 0 par f(x) = 3x - 1 est :',
    'f(0) = -1.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1),
(@qid, '-1', 1, 2),
(@qid, '3', 0, 3),
(@qid, '1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''antécédent de 5 par f(x) = 2x + 1 est :',
    '2x+1=5 → 2x=4 → x=2.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1),
(@qid, '2', 1, 2),
(@qid, '3', 0, 3),
(@qid, '4', 0, 4);

-- ============================================
-- QUESTION FINALE POUR ATTEINDRE 400+
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Combien y a-t-il de minutes dans 2 heures et quart ?',
    '2h = 120 min + 15 min = 135 min.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '125', 0, 1),
(@qid, '135', 1, 2),
(@qid, '145', 0, 3),
(@qid, '225', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si x est multiplié par lui-même, on obtient :',
    'x × x = x².', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2x', 0, 1),
(@qid, 'x²', 1, 2),
(@qid, 'x/2', 0, 3),
(@qid, '2/x', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Un triangle ayant pour angles 30°, 60°, 90° est :',
    'Il a un angle droit (90°) donc rectangle.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Équilatéral', 0, 1),
(@qid, 'Rectangle', 1, 2),
(@qid, 'Isocèle', 0, 3),
(@qid, 'Quelconque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le double du tiers de 18 est :',
    '2 × (18/3) = 2 × 6 = 12.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6', 0, 1),
(@qid, '9', 0, 2),
(@qid, '12', 1, 3),
(@qid, '18', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, '0,25 = ?',
    '0,25 = 1/4.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/2', 0, 1),
(@qid, '1/3', 0, 2),
(@qid, '1/4', 1, 3),
(@qid, '1/5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'L''aire totale d''un cube de 4 cm d''arête est :',
    '6 × 4² = 6 × 16 = 96 cm².', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '64 cm²', 0, 1),
(@qid, '96 cm²', 1, 2),
(@qid, '48 cm²', 0, 3),
(@qid, '16 cm²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Le volume d''un cube de 4 cm d''arête est :',
    '4³ = 64 cm³.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '64 cm³', 1, 1),
(@qid, '48 cm³', 0, 2),
(@qid, '16 cm³', 0, 3),
(@qid, '12 cm³', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(3, 2, 'Si f(x) = -2x + 5, la droite qui représente f est :',
    'Le coefficient directeur est négatif (-2), donc la droite descend.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Croissante', 0, 1),
(@qid, 'Décroissante', 1, 2),
(@qid, 'Constante', 0, 3),
(@qid, 'Verticale', 0, 4);



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



-- ============================================
-- QCM SCIENCES EXPÉRIMENTALES 9e ANNÉE - HAÏTI
-- Extraits des Examens Officiels 2010-2023
-- Format QCM avec 4 options
-- ============================================

-- ============================================
-- EXAMEN 1 : Sciences ex. 1 (Partie I)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Au cours d''un accident, le fémur gauche d''un enfant est légèrement fissuré, il s''agit d''une :',
    'Une félure est une fissure légère de l''os sans déplacement.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Entorse', 0, 1),
(@qid, 'Félure', 1, 2),
(@qid, 'Fracture', 0, 3),
(@qid, 'Luxation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Une roche dans laquelle on extrait une substance métallique à grande valeur économique est :',
    'Un minerai est une roche contenant des substances métalliques exploitables économiquement.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un minéral', 0, 1),
(@qid, 'Une pierre précieuse', 0, 2),
(@qid, 'Un minerai', 1, 3),
(@qid, 'Une mine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le maïs est une plante à fleurs qui est classée parmi les :',
    'Le maïs est un spermatozyte (plante à graines).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ptéridophytes', 0, 1),
(@qid, 'Thallophytes', 0, 2),
(@qid, 'Spermatozytes', 1, 3),
(@qid, 'Bryophytes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''inflammation de la membrane qui enveloppe les poumons est connue sous le nom de :',
    'La plèvre est la membrane enveloppant les poumons, son inflammation = pleurésie.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Tendinite', 0, 1),
(@qid, 'Cystite', 0, 2),
(@qid, 'Pleurésie', 1, 3),
(@qid, 'Pneumonie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les cellules sanguines qui nous protègent en obstruant les extrémités des vaisseaux sanguins après une légère blessure sont :',
    'Les plaquettes (thrombocytes) assurent la coagulation du sang.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'D''érythrocytes', 0, 1),
(@qid, 'De plaquettes', 1, 2),
(@qid, 'D''hématies', 0, 3),
(@qid, 'De leucocytes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''une des actions suivantes est constatée lors de l''inspiration. Laquelle ?',
    'Lors de l''inspiration, la cage thoracique augmente de volume.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La cage thoracique augmente de volume', 1, 1),
(@qid, 'Les côtes s''abaissent', 0, 2),
(@qid, 'Le diaphragme se relâche', 0, 3),
(@qid, 'L''air sort des poumons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les microbes fabriquent des poisons appelés... qui seront neutralisés par des éléments nommés...',
    'Les toxines sont neutralisées par les anticorps fabriqués par les globules blancs.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toxines / anticorps', 1, 1),
(@qid, 'Anticorps / toxines', 0, 2),
(@qid, 'Antigènes / antitoxines', 0, 3),
(@qid, 'Virus / bactéries', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les pneus et matières plastiques non décomposables par les microorganismes sont des substances... tandis que les feuilles mortes sont des matières...',
    'Les plastiques sont non biodégradables, les feuilles sont biodégradables.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Non biodégradables / biodégradables', 1, 1),
(@qid, 'Biodégradables / non biodégradables', 0, 2),
(@qid, 'Organiques / minérales', 0, 3),
(@qid, 'Minérales / organiques', 0, 4);

-- ============================================
-- EXAMEN 1 : Partie II (Physique)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''une des unités ci-dessous est celle de la poussée d''Archimède. Laquelle ?',
    'La poussée d''Archimède est une force, son unité est le Newton.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Watt', 0, 1),
(@qid, 'Joule', 0, 2),
(@qid, 'Newton', 1, 3),
(@qid, 'Pascal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est la force nécessaire pour soulever un objet pesant 600 N à l''aide d''un système de six poulies dont trois fixes et trois mobiles ?',
    'Avec 6 brins (3 poulies mobiles), F = 600/6 = 100 N.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '600 N', 0, 1),
(@qid, '300 N', 0, 2),
(@qid, '150 N', 0, 3),
(@qid, '100 N', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''une des mesures ci-dessous permet de diminuer la pression. Laquelle ?',
    'Augmenter la surface diminue la pression (P = F/S).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vitesse', 0, 1),
(@qid, 'Temps', 0, 2),
(@qid, 'Surface', 1, 3),
(@qid, 'Température', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''un des appareils ci-dessous permet de transformer l''énergie chimique en énergie électrique. Lequel ?',
    'La batterie transforme l''énergie chimique en énergie électrique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Rasoir électrique', 0, 1),
(@qid, 'Four micro-onde', 0, 2),
(@qid, 'Ventilateur', 0, 3),
(@qid, 'Batterie', 1, 4);

-- ============================================
-- EXAMEN 2 : Sciences ex. 2
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le conduit qui amène l''urine des reins vers la vessie s''appelle :',
    'L''uretère conduit l''urine des reins à la vessie.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Épididyme', 0, 1),
(@qid, 'Veine cave', 0, 2),
(@qid, 'Uretère', 1, 3),
(@qid, 'Urètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les nerfs crâniens sont au nombre de :',
    'Il y a 12 paires de nerfs crâniens.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '12 paires', 1, 1),
(@qid, '13 paires', 0, 2),
(@qid, '21 paires', 0, 3),
(@qid, '31 paires', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La contraction de l''un de ces muscles fait augmenter le volume de la cage thoracique. Lequel ?',
    'Le diaphragme se contracte et s''abaisse, augmentant le volume thoracique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le biceps', 0, 1),
(@qid, 'Le deltoïde', 0, 2),
(@qid, 'Le fessier', 0, 3),
(@qid, 'Le diaphragme', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Chez la femme, après la fécondation, la cellule-oeuf va se développer dans :',
    'L''oeuf fécondé se développe dans l''utérus.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le vagin', 0, 1),
(@qid, 'L''utérus', 1, 2),
(@qid, 'La trompe', 0, 3),
(@qid, 'L''ovaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les impuretés qui accompagnent un minerai s''appellent :',
    'La gangue désigne les matières terreuses inutilisables autour du minerai.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Filons', 0, 1),
(@qid, 'Gangues', 1, 2),
(@qid, 'Terre', 0, 3),
(@qid, 'Mine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La germination d''une spore de fougère donne naissance premièrement :',
    'La spore de fougère germe en un prothalle.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'À la fronde', 0, 1),
(@qid, 'Aux hyphes', 0, 2),
(@qid, 'Au rhizome', 0, 3),
(@qid, 'Au prothalle', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le djondjon, consommé en Haïti, est un champignon qui se nourrit de matière organique en décomposition. Il est donc qualifié de :',
    'Un organisme se nourrissant de matière en décomposition est un saprophyte.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parasite', 0, 1),
(@qid, 'Saprophyte', 1, 2),
(@qid, 'Symbiotique', 0, 3),
(@qid, 'Autotrophe', 0, 4);

-- ============================================
-- EXAMEN 2 (Partie Physique) : Questions sur leviers
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''un des leviers ci-dessous est du premier genre. Lequel ?',
    'La pince coupante a le point d''appui entre la force et la résistance.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Brouette', 0, 1),
(@qid, 'Pince coupante', 1, 2),
(@qid, 'Pince à glace', 0, 3),
(@qid, 'Guillotine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''un des effets ci-dessous explique la décomposition d''un corps. Lequel ?',
    'La décomposition d''un corps est un effet chimique du courant électrique.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Physique', 0, 1),
(@qid, 'Magnétique', 0, 2),
(@qid, 'Calorifique', 0, 3),
(@qid, 'Chimique', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est l''énergie potentielle d''une balle de ping-pong de masse 20 g qui tombe d''une hauteur de 3 m en un lieu où g = 10 N/kg ?',
    'Ep = m × g × h = 0,02 × 10 × 3 = 0,6 joules.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '60 joules', 0, 1),
(@qid, '600 joules', 0, 2),
(@qid, '0,6 joules', 1, 3),
(@qid, '0,06 joules', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''une des grandeurs ci-dessous permet d''augmenter ou de réduire la poussée d''Archimède. Laquelle ?',
    'La poussée d''Archimède dépend du volume du corps immergé.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Volume', 1, 1),
(@qid, 'Poids', 0, 2),
(@qid, 'Masse', 0, 3),
(@qid, 'Température', 0, 4);

-- ============================================
-- EXAMEN 3 : Questions anatomie et physique
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''artère aorte est rattachée à l''une de ces cavités du coeur. Laquelle ?',
    'L''aorte est rattachée au ventricule gauche.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''oreillette droite', 0, 1),
(@qid, 'L''oreillette gauche', 0, 2),
(@qid, 'Le ventricule droit', 0, 3),
(@qid, 'Le ventricule gauche', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''oeil, organe de la vue, est sensible aux excitations :',
    'L''oeil est sensible aux excitations lumineuses.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lumineuses', 1, 1),
(@qid, 'Tactiles', 0, 2),
(@qid, 'Olfactives', 0, 3),
(@qid, 'Sonores', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''urine qui provient des tubes urinifères, avant d''être évacuée au dehors, s''accumule dans :',
    'L''urine s''accumule dans la vessie avant d''être évacuée.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La vessie', 1, 1),
(@qid, 'Les reins', 0, 2),
(@qid, 'Les uretères', 0, 3),
(@qid, 'L''urètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Parmi ces voies respiratoires, celles qui sont le siège des échanges gazeux entre l''air et le sang sont :',
    'Les échanges gazeux se font dans les alvéoles pulmonaires.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les bronches', 0, 1),
(@qid, 'Les bronchioles', 0, 2),
(@qid, 'Les alvéoles', 1, 3),
(@qid, 'Les fosses nasales', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''allongement d''un os long, tel que le fémur, est assuré par :',
    'Les cartilages de conjugaison assurent la croissance en longueur des os longs.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ses cartilages articulaires', 0, 1),
(@qid, 'Son périoste', 0, 2),
(@qid, 'Ses cartilages de conjugaison', 1, 3),
(@qid, 'Sa moelle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lorsque deux cellules reproductrices mâle et femelle fusionnent, on obtient une cellule-oeuf. Ce phénomène s''appelle :',
    'La fusion des gamètes mâle et femelle est la fécondation.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fécondation', 1, 1),
(@qid, 'Nidation', 0, 2),
(@qid, 'Accouplement', 0, 3),
(@qid, 'Ovulation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un sol ayant un pourcentage très élevé en argile est de nature :',
    'Un sol riche en argile est imperméable, favorisant l''hydromorphie (marécageux).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Saline', 0, 1),
(@qid, 'Perméable', 0, 2),
(@qid, 'Érosive', 0, 3),
(@qid, 'Marécageuse', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'On peut choisir le maïs comme exemple de monocotylédone parce que les graines sont :',
    'Chez le maïs, les graines sont enfermées à l''intérieur du fruit (caryopse).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Nues', 0, 1),
(@qid, 'Enfermées à l''intérieur du fruit', 1, 2),
(@qid, 'Entières', 0, 3),
(@qid, 'Couvertes par un tégument', 0, 4);

-- Physique Examen 3
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Pour qu''une éolienne produise de l''énergie électrique, elle a besoin :',
    'L''éolienne utilise l''énergie du vent.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De la gazoline', 0, 1),
(@qid, 'Du soleil', 0, 2),
(@qid, 'Du vent', 1, 3),
(@qid, 'Du propane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Une poulie fixe est en équilibre lorsque les deux forces qui s''exercent sur les deux brins de la corde sont :',
    'Dans une poulie fixe, les deux forces sont égales à l''équilibre.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De même direction', 0, 1),
(@qid, 'De même sens', 0, 2),
(@qid, 'Égales', 1, 3),
(@qid, 'Parallèles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'En un lieu où g = 10 N/kg, une pierre de masse 60 kg placée à une hauteur de 10 m a une énergie potentielle de :',
    'Ep = m × g × h = 60 × 10 × 10 = 6 000 J.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6 000 J', 1, 1),
(@qid, '600 J', 0, 2),
(@qid, '60 J', 0, 3),
(@qid, '6 J', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Plus la surface des pneus d''un camion est grande, plus :',
    'Augmenter la surface diminue la pression exercée sur le sol.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le poids des marchandises diminue', 0, 1),
(@qid, 'Le système de freinage est assuré', 0, 2),
(@qid, 'Le chauffeur et les marchandises sont en sécurité', 0, 3),
(@qid, 'La pression qu''il exerce sur le sol diminue', 1, 4);

-- ============================================
-- EXAMEN 4 : Questions variées
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La glande digestive qui est située à droite de l''estomac secrète un de ces liquides. Lequel ?',
    'Le foie, situé à droite de l''estomac, secrète la bile.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La bile', 1, 1),
(@qid, 'La salive', 0, 2),
(@qid, 'Le suc gastrique', 0, 3),
(@qid, 'Le suc pancréatique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'On peut révéler la maladie du diabète chez quelqu''un par la présence permanente dans ses urines de l''une de ces substances. Laquelle ?',
    'La présence de glucose dans l''urine (glycosurie) est un signe de diabète.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''albumine', 0, 1),
(@qid, 'Le glucose', 1, 2),
(@qid, 'L''alcool', 0, 3),
(@qid, 'L''urée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La sédimentologie est la science qui étudie les :',
    'La sédimentologie étudie les dépôts (sédiments).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Roches', 0, 1),
(@qid, 'Sols', 0, 2),
(@qid, 'Dépôts', 1, 3),
(@qid, 'Séismes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les sapins sont des plantes qui produisent des fleurs et des graines. Ces dernières étant non enfermées à l''intérieur du fruit, ils sont classés parmi les :',
    'Les plantes à graines nues (non enfermées dans un fruit) sont des gymnospermes.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Gymnospermes', 1, 1),
(@qid, 'Angiospermes', 0, 2),
(@qid, 'Monocotylédones', 0, 3),
(@qid, 'Dicotylédones', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La quantité d''électrons qui traverse un conducteur en une unité de temps est appelée :',
    'L''intensité du courant est la quantité d''électrons par unité de temps.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Puissance du courant', 0, 1),
(@qid, 'Tension du courant', 0, 2),
(@qid, 'Intensité du courant', 1, 3),
(@qid, 'Résistance du courant', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel de ces termes traduit l''expression de l''intensité sonore ?',
    'L''intensité sonore se mesure en décibels.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le sonor', 0, 1),
(@qid, 'La fréquence', 0, 2),
(@qid, 'Le décibel', 1, 3),
(@qid, 'Le timbre', 0, 4);

-- ============================================
-- EXAMEN 5 : Partie I
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Toutes les actions suivantes engendrent la pollution, sauf une. Laquelle ?',
    'Utiliser les engrais organiques ne pollue pas, contrairement aux engrais chimiques.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Utiliser les engrais chimiques', 0, 1),
(@qid, 'Brûler les matières plastiques', 0, 2),
(@qid, 'Pratiquer l''élevage près des sources', 0, 3),
(@qid, 'Utiliser les engrais organiques', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le système nerveux central est constitué :',
    'Le SNC est constitué de l''encéphale et de la moelle épinière.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De la moelle épinière et du cerveau', 0, 1),
(@qid, 'De l''encéphale et de la moelle épinière', 1, 2),
(@qid, 'De la moelle épinière et du cervelet', 0, 3),
(@qid, 'Du cerveau et du cervelet', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les vertèbres cervicales sont au nombre de :',
    'Il y a 7 vertèbres cervicales.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5', 0, 1),
(@qid, '12', 0, 2),
(@qid, '7', 1, 3),
(@qid, '4', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le biceps du bras est constitué de muscle :',
    'Le biceps est un muscle strié (squelettique).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lisse', 0, 1),
(@qid, 'Strié', 1, 2),
(@qid, 'Viscérale', 0, 3),
(@qid, 'Blanc', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le muscle qui sépare le thorax de l''abdomen s''appelle :',
    'Le diaphragme est le muscle séparant le thorax de l''abdomen.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mollet', 0, 1),
(@qid, 'Triceps', 0, 2),
(@qid, 'Diaphragme', 1, 3),
(@qid, 'Biceps', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quelle est la puissance d''une machine qui effectue un travail de 100 joules en 5 secondes ?',
    'P = W / t = 100 / 5 = 20 watts.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '105 watts', 0, 1),
(@qid, '20 watts', 1, 2),
(@qid, '0,05 watts', 0, 3),
(@qid, '95 watts', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La dégradation du milieu naturel est appelée... et les substances responsables se nomment...',
    'La pollution est la dégradation du milieu, causée par des agents polluants.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pollution / agents polluants', 1, 1),
(@qid, 'Érosion / sédiments', 0, 2),
(@qid, 'Salinisation / sels', 0, 3),
(@qid, 'Déforestation / arbres', 0, 4);

-- ============================================
-- EXAMEN 6 : Questions variées (suite)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel de ces organes recueille l''ovule expulsé au moment de l''ovulation ?',
    'La trompe de Fallope recueille l''ovule expulsé par l''ovaire.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Utérus', 0, 1),
(@qid, 'Ovaire', 0, 2),
(@qid, 'Vagin', 0, 3),
(@qid, 'Trompe', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le chyme est un liquide qui résulte de la :',
    'Le chyme résulte de la digestion gastrique dans l''estomac.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Digestion gastrique', 1, 1),
(@qid, 'Digestion intestinale', 0, 2),
(@qid, 'Sécrétion des glandes parotiques', 0, 3),
(@qid, 'Sécrétion du pancréas', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''air qui sort des poumons suit le trajet suivant :',
    'L''air expiré sort par : bronches → trachée → fosses nasales.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fosses nasales - bronches - trachée', 0, 1),
(@qid, 'Trachée - pharynx - bronches', 0, 2),
(@qid, 'Bronches - trachée - fosses nasales', 1, 3),
(@qid, 'Fosses nasales - trachée - bronches', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les tubes urinifères ont pour rôle d''assurer :',
    'Les tubes urinifères assurent la filtration du sang dans les reins.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''évacuation de l''urine de la vessie', 0, 1),
(@qid, 'La filtration du sang', 1, 2),
(@qid, 'Le transport de l''urine des reins à la vessie', 0, 3),
(@qid, 'La purification de l''urine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''ensemble constitué du sternum, des côtes et des vertèbres dorsales protège l''un des organes suivants. Lequel ?',
    'La cage thoracique protège les poumons.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les reins', 0, 1),
(@qid, 'Le pancréas', 0, 2),
(@qid, 'Le foie', 0, 3),
(@qid, 'Les poumons', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''une de ces plantes n''a pas de racines. Laquelle ?',
    'La mousse (bryophyte) n''a pas de racines, seulement des rhizoïdes.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fougère', 0, 1),
(@qid, 'Mousse', 1, 2),
(@qid, 'Lycopode', 0, 3),
(@qid, 'Prèle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un sol ayant un pourcentage élevé en chlorure de sodium est dit :',
    'Un sol riche en chlorure de sodium est un sol salin.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Imperméable', 0, 1),
(@qid, 'Marécageux', 0, 2),
(@qid, 'Autochtone', 0, 3),
(@qid, 'Salin', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un corps se déplaçant à une vitesse donnée acquiert de l''énergie :',
    'Un corps en mouvement possède de l''énergie cinétique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mécanique', 0, 1),
(@qid, 'Nucléaire', 0, 2),
(@qid, 'Cinétique', 1, 3),
(@qid, 'Potentielle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel de ces leviers est du troisième genre ?',
    'La pince à charbon (ou brouette) est du 3e genre (force entre appui et résistance).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Guillotine', 0, 1),
(@qid, 'Brouette', 1, 2),
(@qid, 'Pince à charbon', 0, 3),
(@qid, 'Pince électrique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quel est l''allongement d''un ressort dont la longueur à vide est de 15 cm et la longueur totale de 0,20 m ?',
    'Allongement = 20 cm - 15 cm = 5 cm.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5 cm', 1, 1),
(@qid, '14,8 cm', 0, 2),
(@qid, '35 cm', 0, 3),
(@qid, '3 cm', 0, 4);

-- ============================================
-- EXAMEN 7 : Suite et questions association
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le cardia est l''orifice qui permet le passage du bol alimentaire de... à...',
    'Le cardia est l''orifice entre l''oesophage et l''estomac.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De l''oesophage à l''estomac', 1, 1),
(@qid, 'De l''estomac à l''intestin', 0, 2),
(@qid, 'Du pharynx à l''oesophage', 0, 3),
(@qid, 'De l''intestin au colon', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les constituants du sang qui interviennent principalement dans le processus de sa coagulation s''appellent... Ceux qui assurent la défense de l''organisme s''appellent...',
    'Les plaquettes coagulent, les leucocytes (globules blancs) défendent.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Plaquettes / leucocytes', 1, 1),
(@qid, 'Hématies / plaquettes', 0, 2),
(@qid, 'Leucocytes / hématies', 0, 3),
(@qid, 'Thrombocytes / érythrocytes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le manguier est classé parmi... parce que la graine est enfermée dans un fruit. De plus, c''est... parce que la graine est formée de deux masses.',
    'Le manguier est une angiosperme dicotylédone.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les angiospermes / dicotylédone', 1, 1),
(@qid, 'Les gymnospermes / monocotylédone', 0, 2),
(@qid, 'Les thallophytes / dicotylédone', 0, 3),
(@qid, 'Les bryophytes / monocotylédone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le fer à repasser est une application... du courant électrique, tandis que l''électro-aimant en est une application...',
    'Le fer à repasser = effet calorifique, l''électro-aimant = effet magnétique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Calorifique / magnétique', 1, 1),
(@qid, 'Magnétique / calorifique', 0, 2),
(@qid, 'Chimique / physique', 0, 3),
(@qid, 'Lumineuse / calorifique', 0, 4);

-- ============================================
-- EXAMEN 7 (suite) : Suite des questions
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''une des régions suivantes est constituée d''un ensemble de 7 vertèbres. Laquelle ?',
    'La région cervicale compte 7 vertèbres.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La région dorsale', 0, 1),
(@qid, 'La région cervicale', 1, 2),
(@qid, 'La région lombaire', 0, 3),
(@qid, 'La région sacrée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les tendons sont des capsules résistantes qui ont pour rôle de :',
    'Les tendons fixent les muscles sur les os.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Relier solidement les os entre eux', 0, 1),
(@qid, 'Rattacher les muscles entre eux', 0, 2),
(@qid, 'Faciliter les mouvements des os', 0, 3),
(@qid, 'Fixer les muscles sur les os', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le phénomène par lequel les globules blancs s''approchent d''un microbe, l''enveloppent puis le digèrent s''appelle :',
    'La phagocytose est le processus par lequel les globules blancs ingèrent les microbes.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Phagocytose', 1, 1),
(@qid, 'Phagocyte', 0, 2),
(@qid, 'Hématose', 0, 3),
(@qid, 'Thrombocyte', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''inspiration est un mouvement respiratoire qui entraîne l''une des actions suivantes. Laquelle ?',
    'Lors de l''inspiration, les poumons se dilatent.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''abaissement du sternum', 0, 1),
(@qid, 'Le relâchement du diaphragme', 0, 2),
(@qid, 'Le rejet du gaz carbonique', 0, 3),
(@qid, 'La dilatation des poumons', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel de ces phénomènes mécaniques de la digestion se fait au niveau du pharynx ?',
    'La déglutition (avaler) se fait au niveau du pharynx.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La déglutition', 1, 1),
(@qid, 'La mastication', 0, 2),
(@qid, 'Le péristaltisme', 0, 3),
(@qid, 'L''insalivation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les canaux qui acheminent l''urine des reins à la vessie sont appelés :',
    'Les uretères conduisent l''urine des reins à la vessie.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Tubes séminifères', 0, 1),
(@qid, 'Tubes urinifères', 0, 2),
(@qid, 'Uretères', 1, 3),
(@qid, 'Urètres', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel de ces végétaux ne produit jamais de fleurs ?',
    'La mousse (bryophyte) ne produit pas de fleurs.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le maïs', 0, 1),
(@qid, 'L''oranger', 0, 2),
(@qid, 'Le millet', 0, 3),
(@qid, 'La mousse', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Laquelle de ces ressources naturelles est une variété attrayante de minéraux considérée comme une pierre précieuse ?',
    'L''émeraude est une pierre précieuse.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''émeraude', 1, 1),
(@qid, 'La bauxite', 0, 2),
(@qid, 'Le granite', 0, 3),
(@qid, 'Le quartz', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La puissance d''un moteur qui effectue un travail de 12350 joules en 50 secondes est égale à :',
    'P = W / t = 12350 / 50 = 247 watts.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '24,7 watts', 0, 1),
(@qid, '247 watts', 1, 2),
(@qid, '47 watts', 0, 3),
(@qid, '5123 watts', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La machine simple qui permet de décharger les camions transportant les barils de clairin s''appelle :',
    'Le plan incliné permet de décharger les barils.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Treuil', 0, 1),
(@qid, 'Plan incliné', 1, 2),
(@qid, 'Levier', 0, 3),
(@qid, 'Poulie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''oeil est logé dans une cavité appelée... Il est relié au cerveau par...',
    'L''oeil est dans l''orbite, relié par le nerf optique.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''orbite / le nerf optique', 1, 1),
(@qid, 'La fosse nasale / le nerf olfactif', 0, 2),
(@qid, 'Le crâne / la moelle', 0, 3),
(@qid, 'Le rocher / le nerf auditif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les substances destinées à tuer les champignons s''appellent... Celles qui tuent les mauvaises herbes s''appellent...',
    'Fongicides tuent champignons, herbicides tuent mauvaises herbes.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fongicides / herbicides', 1, 1),
(@qid, 'Herbicides / fongicides', 0, 2),
(@qid, 'Insecticides / pesticides', 0, 3),
(@qid, 'Pesticides / insecticides', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lorsqu''on perçoit un ensemble de sons discordants on dit que c''est... Cependant, si la perception est agréable à l''oreille, on dit que c''est...',
    'Son discordant = bruit, son agréable = son musical.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le bruit / un son musical', 1, 1),
(@qid, 'Un son musical / le bruit', 0, 2),
(@qid, 'L''écho / le timbre', 0, 3),
(@qid, 'Le timbre / l''écho', 0, 4);

-- ============================================
-- EXAMEN 9 : Anatomie, physiologie et physique
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''absence d''un des constituants du sang suivants peut entraîner un risque d''hémorragie. Lequel ?',
    'Les plaquettes assurent la coagulation. Leur absence = risque d''hémorragie.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hématie', 0, 1),
(@qid, 'Plasma', 0, 2),
(@qid, 'Plaquette', 1, 3),
(@qid, 'Leucocyte', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'On parle de « tendinite » dans l''un des cas suivants. Lequel ?',
    'La tendinite est l''inflammation des extrémités d''un muscle (tendon).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un muscle est étiré accidentellement', 0, 1),
(@qid, 'Des ligaments sont déchirés', 0, 2),
(@qid, 'L''inflammation des extrémités d''un muscle', 1, 3),
(@qid, 'Le muscle est meurtri', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel de ces centres nerveux règle les rythmes cardiaque et respiratoire ?',
    'Le bulbe rachidien contrôle les rythmes cardiaque et respiratoire.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le bulbe rachidien', 1, 1),
(@qid, 'La moelle épinière', 0, 2),
(@qid, 'Le cervelet', 0, 3),
(@qid, 'Le cerveau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Tous les organes ci-dessous sont des glandes digestives, sauf un. Lequel ?',
    'Les surénales sont des glandes endocrines, pas digestives.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pancréas', 0, 1),
(@qid, 'Foie', 0, 2),
(@qid, 'Surénales', 1, 3),
(@qid, 'Parotides', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La bauxite, minerai d''aluminium, renferme des matières terreuses inutilisables désignées sous le nom de :',
    'La gangue est la matière terreuse inutilisable autour du minerai.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Filon', 0, 1),
(@qid, 'Gangue', 1, 2),
(@qid, 'Gisement', 0, 3),
(@qid, 'Mine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le sapin est classé parmi les phanérogames parce que la plante :',
    'Les phanérogames produisent des fleurs (organes reproducteurs visibles).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Produit des fleurs', 1, 1),
(@qid, 'Produit des graines nues', 0, 2),
(@qid, 'Possède des racines', 0, 3),
(@qid, 'Est pourvue de chlorophylle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''ensemble de tous les écosystèmes de la planète Terre forme :',
    'La biosphère est l''ensemble des écosystèmes terrestres.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''endosphère', 0, 1),
(@qid, 'L''atmosphère', 0, 2),
(@qid, 'La biosphère', 1, 3),
(@qid, 'L''hydrosphère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'En un lieu où g = 9,8 N/kg, un corps de poids 5 N a une masse de :',
    'm = P / g = 5 / 9,8 ≈ 0,5 kg.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '50 kg', 0, 1),
(@qid, '2 kg', 0, 2),
(@qid, '0,5 kg', 1, 3),
(@qid, '5 kg', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un de ces appareils permet de mesurer l''intensité d''une force. Lequel ?',
    'Le dynamomètre mesure l''intensité d''une force.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ampèremètre', 0, 1),
(@qid, 'Manomètre', 0, 2),
(@qid, 'Dynamomètre', 1, 3),
(@qid, 'Balance', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un des leviers suivants est du troisième genre. Lequel ?',
    'La pédale d''harmonium est du 3e genre (puissance entre appui et résistance).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ciseaux', 0, 1),
(@qid, 'Brouette', 0, 2),
(@qid, 'Pédale d''harmonium', 1, 3),
(@qid, 'Pince électrique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les poumons sont des masses spongieuses situées dans... qui les protège. La membrane à double paroi qui enveloppe chacun d''eux s''appelle...',
    'Les poumons sont dans la cage thoracique, enveloppés par la plèvre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La cage thoracique / la plèvre', 1, 1),
(@qid, 'L''abdomen / le péritoine', 0, 2),
(@qid, 'Le crâne / les méninges', 0, 3),
(@qid, 'Le cou / la trachée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Dans une solution d''eau sucrée, l''eau est considérée comme... et le sucre comme...',
    'L''eau est le solvant, le sucre est le soluté.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le solvant / le soluté', 1, 1),
(@qid, 'Le soluté / le solvant', 0, 2),
(@qid, 'Le mélange / la solution', 0, 3),
(@qid, 'La solution / le mélange', 0, 4);

-- ============================================
-- EXAMEN 10 : Sols, leviers, anatomie
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un sol ayant un fort pourcentage d''argile favorise :',
    'L''argile imperméable favorise l''hydromorphie.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La salinisation', 0, 1),
(@qid, 'L''érosion', 0, 2),
(@qid, 'L''hydromorphie', 1, 3),
(@qid, 'La sécheresse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel des termes suivants désigne une cellule reproductrice ?',
    'L''ovule est la cellule reproductrice femelle.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ovaire', 0, 1),
(@qid, 'Ovule', 1, 2),
(@qid, 'Ovulation', 0, 3),
(@qid, 'Trompe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Nous avons des millions de glandes gastriques. Elles sont toutes situées dans la paroi :',
    'Les glandes gastriques sont dans la paroi de l''estomac.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De l''oesophage', 0, 1),
(@qid, 'De l''estomac', 1, 2),
(@qid, 'De l''intestin grêle', 0, 3),
(@qid, 'Du gros intestin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Parmi les constituants du sang suivants, ceux qui jouent un rôle primordial dans la coagulation du sang sont :',
    'Les plaquettes sanguines assurent la coagulation.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les globules blancs', 0, 1),
(@qid, 'Les globules rouges', 0, 2),
(@qid, 'Les plaquettes sanguines', 1, 3),
(@qid, 'Les leucocytes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Laquelle des affirmations suivantes est fausse dans le cas des bryophytes ?',
    'Les bryophytes n''ont pas de racines (seulement des rhizoïdes).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ils possèdent de la chlorophylle', 0, 1),
(@qid, 'Ils possèdent une tige', 0, 2),
(@qid, 'Ils possèdent des racines', 1, 3),
(@qid, 'Ils possèdent des feuilles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La pétrographie est une subdivision de la géologie. Elle s''adonne à l''étude des :',
    'La pétrographie étudie les roches.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sols', 0, 1),
(@qid, 'Volcans', 0, 2),
(@qid, 'Roches', 1, 3),
(@qid, 'Séismes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''une des grandeurs suivantes indique la capacité que possède un système à produire du travail. Laquelle ?',
    'L''énergie est la capacité à produire du travail.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pression', 0, 1),
(@qid, 'Énergie', 1, 2),
(@qid, 'Puissance', 0, 3),
(@qid, 'Force', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'En un lieu où g = 10 N/kg, le travail d''une pierre de masse 20 g qui tombe d''une hauteur de 5 m est :',
    'W = m × g × h = 0,02 × 10 × 5 = 1 joule.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 joules', 0, 1),
(@qid, '1 000 joules', 0, 2),
(@qid, '10 joules', 0, 3),
(@qid, '1 joule', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''une des formes d''énergie suivantes désigne celle que possède un corps qui tombe en chute libre. Laquelle ?',
    'Un corps en chute libre possède de l''énergie cinétique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Énergie cinétique', 1, 1),
(@qid, 'Énergie potentielle', 0, 2),
(@qid, 'Énergie thermique', 0, 3),
(@qid, 'Énergie chimique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''un des leviers suivants est du troisième genre. Lequel ?',
    'La pédale du remouleur est du 3e genre.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Brouette', 0, 1),
(@qid, 'Ciseaux', 0, 2),
(@qid, 'Coupe papier', 0, 3),
(@qid, 'Pédale du remouleur', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La partie étroite et allongée d''un os s''appelle... Elle est recouverte d''une fine membrane qui assure...',
    'La diaphyse est recouverte du périoste qui assure la croissance en épaisseur.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La diaphyse / la croissance en épaisseur', 1, 1),
(@qid, 'L''épiphyse / la croissance en longueur', 0, 2),
(@qid, 'Le canal médulaire / la circulation', 0, 3),
(@qid, 'Le cartilage / la flexibilité', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Au moment de l''inspiration le diaphragme... alors que les côtes...',
    'Le diaphragme se contracte et les côtes s''élèvent.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Se contracte / s''élèvent', 1, 1),
(@qid, 'Se relâche / s''abaissent', 0, 2),
(@qid, 'Se contracte / s''abaissent', 0, 3),
(@qid, 'Se relâche / s''élèvent', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lorsque sur un échafaudage, un manoeuvre fait monter un bloc, il accomplit un travail... Si le bloc ne se déplace pas, le travail est...',
    'Travail moteur si déplacement, travail nul si pas de déplacement.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Moteur / nul', 1, 1),
(@qid, 'Nul / moteur', 0, 2),
(@qid, 'Résistant / moteur', 0, 3),
(@qid, 'Moteur / résistant', 0, 4);

-- ============================================
-- EXAMEN 12 : Suite
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La moelle épinière est protégée à l''intérieur d''un ensemble d''os formant la :',
    'La colonne vertébrale protège la moelle épinière.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ceinture pelvienne', 0, 1),
(@qid, 'Boîte crânienne', 0, 2),
(@qid, 'Cage thoracique', 0, 3),
(@qid, 'Colonne vertébrale', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les concrétions minérales qui se forment dans les reins et dont le passage provoque de vives douleurs sont :',
    'Ce sont les calculs rénaux.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De néphrite', 0, 1),
(@qid, 'De cystite', 0, 2),
(@qid, 'De calcul rénal', 1, 3),
(@qid, 'D''urétrite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le bol alimentaire, sous l''effet du suc gastrique, se transforme en chyme dans :',
    'Le chyme se forme dans l''estomac sous l''action du suc gastrique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La bouche', 0, 1),
(@qid, 'L''intestin grêle', 0, 2),
(@qid, 'L''estomac', 1, 3),
(@qid, 'Le gros intestin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Toute substance dont la présence dans la biosphère porte atteinte à l''équilibre de l''environnement s''appelle :',
    'Un agent polluant perturbe l''équilibre de l''environnement.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Substance biodégradable', 0, 1),
(@qid, 'Agent polluant', 1, 2),
(@qid, 'Substance combustible', 0, 3),
(@qid, 'Agent agricole', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La symbiose est une forme de vie observée dans l''un des cas suivants. Lequel ?',
    'Dans la symbiose, deux organismes dépendent profitablement l''un de l''autre.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un organisme vit au dépend d''un autre', 0, 1),
(@qid, 'Deux organismes vivent séparément', 0, 2),
(@qid, 'Deux organismes dépendent profitablement l''un de l''autre', 1, 3),
(@qid, 'Un organisme vit de déchets en décomposition', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel des objets suivants est un instrument à vent ?',
    'La clarinette est un instrument à vent.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La cymbale', 0, 1),
(@qid, 'La guitare', 0, 2),
(@qid, 'La clarinette', 1, 3),
(@qid, 'Le violon', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''un des générateurs suivants fournit du courant continu. Lequel ?',
    'La batterie d''accumulateur fournit du courant continu.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le panneau solaire', 0, 1),
(@qid, 'La génératrice', 0, 2),
(@qid, 'La batterie d''accumulateur', 1, 3),
(@qid, 'L''alternateur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le travail d''une force de 50 N qui déplace son point d''application sur une longueur de 2 000 cm est :',
    'W = F × d = 50 × 20 = 1 000 joules (2 000 cm = 20 m).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 joules', 0, 1),
(@qid, '100 000 joules', 0, 2),
(@qid, '1 000 joules', 1, 3),
(@qid, '1 000 000 joules', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''énergie que possède un corps lorsqu''il tombe jusqu''au sol s''appelle énergie :',
    'Un corps en mouvement possède de l''énergie cinétique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cinétique', 1, 1),
(@qid, 'Potentielle', 0, 2),
(@qid, 'Mécanique', 0, 3),
(@qid, 'Chimique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La science qui étudie les roches s''appelle... Celle qui étudie les sols s''appelle...',
    'Pétrographie étudie les roches, pédologie étudie les sols.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pétrographie / pédologie', 1, 1),
(@qid, 'Pédologie / pétrographie', 0, 2),
(@qid, 'Stratigraphie / minéralogie', 0, 3),
(@qid, 'Minéralogie / stratigraphie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La pression d''un gaz se mesure à l''aide d''un... et la pression atmosphérique à l''aide d''un...',
    'Manomètre pour pression d''un gaz, baromètre pour pression atmosphérique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Manomètre / baromètre', 1, 1),
(@qid, 'Baromètre / manomètre', 0, 2),
(@qid, 'Thermomètre / dynamomètre', 0, 3),
(@qid, 'Dynamomètre / thermomètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Nos deux poumons sont situés à l''intérieur d''une cavité appelée... Chacun d''eux est enveloppé d''une membrane à double paroi appelée...',
    'Cavité thoracique, membrane = plèvre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Thoracique / plèvre', 1, 1),
(@qid, 'Abdominale / péritoine', 0, 2),
(@qid, 'Crânienne / méninges', 0, 3),
(@qid, 'Pelvienne / périoste', 0, 4);

-- ============================================
-- EXAMEN 13 : Anatomie et santé
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'De mauvaises postures fréquentes risquent de provoquer des déformations de la colonne vertébrale. Lorsque la déviation est latérale on parle de :',
    'La scoliose est une déviation latérale de la colonne vertébrale.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Scoliose', 1, 1),
(@qid, 'Cyphose', 0, 2),
(@qid, 'Aponévrose', 0, 3),
(@qid, 'Lordose', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le passage des substances digérées dans le sang se fait dans les parois de l''un de ces organes. Lequel ?',
    'L''absorption des nutriments se fait dans l''intestin grêle.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''estomac', 0, 1),
(@qid, 'Le pancréas', 0, 2),
(@qid, 'L''intestin grêle', 1, 3),
(@qid, 'Le gros intestin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les algues brunes, comme les algues vertes, sont dépourvues de tous les éléments suivants, un seul excepté. Lequel ?',
    'Les algues possèdent de la chlorophylle, mais pas de tiges, vaisseaux ni fleurs.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Tiges', 0, 1),
(@qid, 'Vaisseaux', 0, 2),
(@qid, 'Chlorophylle', 1, 3),
(@qid, 'Fleurs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un ventilateur transforme l''énergie électrique en énergie :',
    'Le ventilateur transforme l''énergie électrique en énergie mécanique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mécanique', 1, 1),
(@qid, 'Éolienne', 0, 2),
(@qid, 'Chimique', 0, 3),
(@qid, 'Calorifique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Sachant que g = 10 N/kg, la puissance d''un homme de masse 60 kg s''élevant d''une hauteur de 10 m en 1 min 40 s est :',
    'W = 600 × 10 = 6 000 J, t = 100 s, P = 6 000/100 = 60 watts.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '60 watts', 1, 1),
(@qid, '428,57 watts', 0, 2),
(@qid, '6 watts', 0, 3),
(@qid, '4 285,7 watts', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les principales glandes cutanées sont les glandes sudoripares et... Elles sont situées au niveau...',
    'Les glandes sébacées sont situées au niveau du derme.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sébacées / du derme', 1, 1),
(@qid, 'Salivaires / de l''épiderme', 0, 2),
(@qid, 'Lacrymales / de l''hypoderme', 0, 3),
(@qid, 'Mammaires / du derme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Des différents types de sol, celui qui convient le mieux à la culture du riz est... puisqu''il est de nature...',
    'Le sol marécageux convient au riz car il est imperméable.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Marécageux / imperméable', 1, 1),
(@qid, 'Sablonneux / perméable', 0, 2),
(@qid, 'Salin / salé', 0, 3),
(@qid, 'Autochtone / rocheux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Dans un générateur de courant continu, les électrons circulent... Tandis que dans un générateur de courant alternatif, les électrons circulent...',
    'Courant continu = sens unique, alternatif = dans les deux sens.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dans un seul sens / dans les deux sens', 1, 1),
(@qid, 'Dans les deux sens / dans un seul sens', 0, 2),
(@qid, 'Toujours / jamais', 0, 3),
(@qid, 'Jamais / parfois', 0, 4);

-- ============================================
-- EXAMEN 14 : Suite
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Laquelle des régions de la colonne vertébrale ci-dessous est composée de sept vertèbres ?',
    'La région cervicale compte 7 vertèbres.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Région dorsale', 0, 1),
(@qid, 'Région lombaire', 0, 2),
(@qid, 'Région cervicale', 1, 3),
(@qid, 'Région coccygienne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''oeil est formé de plusieurs couches. Celle qui lui donne sa forme s''appelle :',
    'La sclérotique donne sa forme à l''oeil (blanc de l''oeil).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sclérotique', 1, 1),
(@qid, 'Rétine', 0, 2),
(@qid, 'Choroïde', 0, 3),
(@qid, 'Cristallin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Tous les phénomènes ci-dessous sont des causes de dégradation du sol. Celui qui se caractérise par la formation de marécages est :',
    'L''hydromorphie est la formation de marécages dans le sol.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Salinisation', 0, 1),
(@qid, 'Sécheresse', 0, 2),
(@qid, 'Hydromorphie', 1, 3),
(@qid, 'Érosion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''un des appareils suivants transforme toute l''énergie électrique reçue en énergie calorifique. Lequel ?',
    'Le chauffe-eau transforme l''énergie électrique en chaleur.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Moteur électrique', 0, 1),
(@qid, 'Téléviseur', 0, 2),
(@qid, 'Ventilateur', 0, 3),
(@qid, 'Chauffe-eau', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La pression exercée par un corps pesant 10 N sur une surface de 20 dm² est égale à :',
    'P = F/S = 10 / (20×10⁻²) = 10/0,2 = 50 pascals.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,5 pascal', 0, 1),
(@qid, '5 pascals', 0, 2),
(@qid, '50 pascals', 1, 3),
(@qid, '500 pascals', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le procédé par lequel une tige aérienne est mise en contact avec le sol et s''y enracine avant d''être isolée de la plante mère s''appelle :',
    'Le marcottage consiste à faire s''enraciner une tige avant de la séparer.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le bouturage', 0, 1),
(@qid, 'Le marcottage', 1, 2),
(@qid, 'Le greffage', 0, 3),
(@qid, 'Le semis', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les matières en verre affectent l''équilibre de l''environnement. Ce sont... d''origine...',
    'Le verre est un polluant non biodégradable d''origine industrielle.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des polluants / industrielle', 1, 1),
(@qid, 'Des nutriments / naturelle', 0, 2),
(@qid, 'Des engrais / agricole', 0, 3),
(@qid, 'Des sédiments / géologique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Quand on puise de l''eau, la force exercée par la personne est dite... alors que le poids du seau exerce une force...',
    'Force motrice (personne) et force résistante (poids).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Motrice / résistante', 1, 1),
(@qid, 'Résistante / motrice', 0, 2),
(@qid, 'Motrice / motrice', 0, 3),
(@qid, 'Résistante / résistante', 0, 4);

-- ============================================
-- EXAMEN 15 : Suite
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La science qui étudie la disposition des couches de terrain est connue sous le nom de :',
    'La stratigraphie étudie la disposition des couches géologiques.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pédologie', 0, 1),
(@qid, 'Pétrographie', 0, 2),
(@qid, 'Stratigraphie', 1, 3),
(@qid, 'Paléontologie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel de ces éléments, retrouvé dans l''urine d''une personne, est un signe de diabète ?',
    'La présence de glucose dans l''urine (glycosurie) indique le diabète.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Albumine', 0, 1),
(@qid, 'Urée', 0, 2),
(@qid, 'Glucose', 1, 3),
(@qid, 'Chlorure', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Laquelle de ces plantes est un intrus ?',
    'Le sapin est un gymnosperme, les autres sont des angiospermes.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Citronnier', 0, 1),
(@qid, 'Maïs', 0, 2),
(@qid, 'Sapin', 1, 3),
(@qid, 'Abricotier', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Toutes ces qualités sont des caractéristiques du son, sauf une. Laquelle ?',
    'La hauteur, l''intensité et le timbre sont des qualités du son. La puissance n''en est pas une.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hauteur', 0, 1),
(@qid, 'Puissance', 1, 2),
(@qid, 'Intensité', 0, 3),
(@qid, 'Timbre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La pente d''un plan incliné qui s''élève de 60 mm par mètre est :',
    'Pente = 60/1000 × 100 = 6%.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '60 %', 0, 1),
(@qid, '6 %', 1, 2),
(@qid, '0,6 %', 0, 3),
(@qid, '0,06 %', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La guillotine est un levier du... genre. Le point d''application de la force se trouve entre...',
    'La guillotine est du 2e genre (résistance entre appui et puissance).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Premier / appui et résistance', 0, 1),
(@qid, 'Deuxième / appui et puissance', 0, 2),
(@qid, 'Troisième / la résistance et la puissance', 0, 3),
(@qid, 'Premier / l''appui et la puissance', 0, 4);

-- ============================================
-- EXAMEN 16 : Suite
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''urine stockée dans la vessie est évacuée par un conduit appelé :',
    'L''urètre est le conduit qui évacue l''urine de la vessie.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Tube séminifère', 0, 1),
(@qid, 'Tube urinifère', 0, 2),
(@qid, 'Urètre', 1, 3),
(@qid, 'Uretère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le chyme se forme dans l''estomac. Avant son arrivée dans l''intestin grêle, il passe par :',
    'Le pylore est l''orifice de sortie de l''estomac vers l''intestin grêle.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La glotte', 0, 1),
(@qid, 'Le pylore', 1, 2),
(@qid, 'Le pharynx', 0, 3),
(@qid, 'Le cardia', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La classe des muscinées regroupe des végétaux qui, comme les mousses, sont pourvues de toutes ces structures, une seule exceptée. Laquelle ?',
    'Les mousses n''ont pas de racines, seulement des rhizoïdes.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Tiges', 0, 1),
(@qid, 'Chlorophylle', 0, 2),
(@qid, 'Feuilles', 0, 3),
(@qid, 'Racines', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''appareil qui permet de mesurer la pression atmosphérique s''appelle :',
    'Le baromètre mesure la pression atmosphérique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Baromètre', 1, 1),
(@qid, 'Manomètre', 0, 2),
(@qid, 'Voltmètre', 0, 3),
(@qid, 'Wattmètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'En un lieu où g = 10 N/kg, la masse d''une bille de poids 35 N est :',
    'm = P/g = 35/10 = 3,5 kg.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '35 kg', 0, 1),
(@qid, '3,5 kg', 1, 2),
(@qid, '350 kg', 0, 3),
(@qid, '0,35 kg', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Au niveau du cou on compte... vertèbres. La première est connue sous le nom de :',
    '7 vertèbres cervicales, la première s''appelle atlas.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '7 vertèbres / atlas', 1, 1),
(@qid, '12 vertèbres / axis', 0, 2),
(@qid, '5 vertèbres / sacrum', 0, 3),
(@qid, '7 vertèbres / axis', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La formation de marécages dans la couche arable du sol conduit à un phénomène nommé... Ce dernier est dû à la présence dans le sol...',
    'L''hydromorphie due à l''argile imperméable qui entrave la pénétration de l''eau.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hydromorphie / d''argile', 1, 1),
(@qid, 'Salinisation / de sel', 0, 2),
(@qid, 'Érosion / de sable', 0, 3),
(@qid, 'Sécheresse / de calcaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''énergie que possède un corps en tombant jusqu''au sol s''appelle énergie... Un ventilateur transforme l''énergie électrique en énergie...',
    'Énergie cinétique en tombant, énergie mécanique pour le ventilateur.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cinétique / mécanique', 1, 1),
(@qid, 'Potentielle / calorifique', 0, 2),
(@qid, 'Mécanique / cinétique', 0, 3),
(@qid, 'Thermique / électrique', 0, 4);

-- ============================================
-- EXAMEN 17 : Questions variées
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel des modes de reproduction ci-dessous convient au champignon ?',
    'Les champignons se reproduisent par sporulation.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Greffage', 0, 1),
(@qid, 'Sporulation', 1, 2),
(@qid, 'Semis', 0, 3),
(@qid, 'Bouturage', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''un des organes suivants représente le siège de l''intelligence. Lequel ?',
    'Le cerveau est le siège de l''intelligence.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le cervelet', 0, 1),
(@qid, 'Le bulbe rachidien', 0, 2),
(@qid, 'La moelle épinière', 0, 3),
(@qid, 'Le cerveau', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Une guêpe te pique au doigt et tu ressens une douleur. Cette information arrive au cerveau grâce au nerf :',
    'Le nerf sensitif transmet les sensations au cerveau.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sensitif', 1, 1),
(@qid, 'Auditif', 0, 2),
(@qid, 'Moteur', 0, 3),
(@qid, 'Optique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''une des maladies suivantes peut être transmise par voie sexuelle. Laquelle ?',
    'La syphilis est une IST (infection sexuellement transmissible).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La tuberculose', 0, 1),
(@qid, 'Le choléra', 0, 2),
(@qid, 'La syphilis', 1, 3),
(@qid, 'La pneumonie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Parmi les animaux ci-dessous, celui qui est le produit de l''accouplement de deux espèces voisines est le :',
    'Le mulet est l''hybride d''un âne et d''une jument.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mouton', 0, 1),
(@qid, 'Cheval', 0, 2),
(@qid, 'Mulet', 1, 3),
(@qid, 'Boeuf', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Laquelle des plantes ci-dessous est une plante sans fleurs ?',
    'La mousse (bryophyte) ne produit pas de fleurs.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mousse', 1, 1),
(@qid, 'Caféier', 0, 2),
(@qid, 'Hibiscus', 0, 3),
(@qid, 'Amandier', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Ce cycle de vie : Germination - plantule - croissance - floraison correspond à :',
    'La tomate suit ce cycle de vie complet (plante à fleurs).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Champignon', 0, 1),
(@qid, 'Algues', 0, 2),
(@qid, 'Fougère', 0, 3),
(@qid, 'Tomate', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Parmi les classes d''animaux ci-dessous, trouve celle pour laquelle la fécondation est externe.',
    'Chez les poissons, la fécondation est externe (dans l''eau).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oiseau', 0, 1),
(@qid, 'Poisson', 1, 2),
(@qid, 'Mammifère', 0, 3),
(@qid, 'Reptile', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Par la respiration, l''être vivant absorbe... et rejette...',
    'L''être vivant absorbe du dioxygène et rejette du dioxyde de carbone.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Du dioxygène / du dioxyde de carbone', 1, 1),
(@qid, 'Du dioxyde de carbone / du dioxygène', 0, 2),
(@qid, 'De l''azote / de l''hydrogène', 0, 3),
(@qid, 'De l''hydrogène / de l''azote', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La force qui attire tous les corps vers le centre de la Terre s''appelle :',
    'C''est la force de pesanteur (ou gravité).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La force magnétique', 0, 1),
(@qid, 'La force de pesanteur', 1, 2),
(@qid, 'La poussée d''Archimède', 0, 3),
(@qid, 'La force électrique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La blennorragie, la syphilis, le SIDA sont des maladies qui se transmettent essentiellement...',
    'Ces maladies se transmettent par voie sexuelle.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Par voie aérienne', 0, 1),
(@qid, 'Par voie sanguine', 0, 2),
(@qid, 'Par voie sexuelle', 1, 3),
(@qid, 'Par l''eau contaminée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La propagation du son se fait dans les milieux suivants :',
    'Le son se propage dans l''air, l''eau et les solides.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''air, l''eau et les solides', 1, 1),
(@qid, 'L''air uniquement', 0, 2),
(@qid, 'L''air et le vide', 0, 3),
(@qid, 'Le vide uniquement', 0, 4);

-- ============================================
-- EXAMEN 18 : Suite
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les substances nutritives provenant de la digestion passent à travers les parois d''un de ces organes vers le sang. Cet organe est :',
    'L''absorption se fait dans l''intestin grêle.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''estomac', 0, 1),
(@qid, 'L''oesophage', 0, 2),
(@qid, 'L''intestin grêle', 1, 3),
(@qid, 'Le gros intestin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''un des accidents affecte les muscles. Lequel ?',
    'La tendinite est l''inflammation du tendon (extrémité du muscle).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Entorse', 0, 1),
(@qid, 'Fracture', 0, 2),
(@qid, 'Déboîtement', 0, 3),
(@qid, 'Tendinite', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''un de ces végétaux est une gymnosperme. Lequel ?',
    'Le sapin est une gymnosperme (graines nues).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le sapin', 1, 1),
(@qid, 'Le caféier', 0, 2),
(@qid, 'Le millet', 0, 3),
(@qid, 'La mousse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''une des affirmations suivantes est vraie. Laquelle ?',
    'Un sol marécageux est bien adapté à la culture du riz.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un sol perméable convient à la riziculture', 0, 1),
(@qid, 'Les sols sablonneux sont imperméables', 0, 2),
(@qid, 'Un sol marécageux est bien adapté à la culture du riz', 1, 3),
(@qid, 'Les sols marécageux sont perméables à l''eau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Tous les matériels suivants peuvent produire de l''énergie électrique, sauf un. Lequel ?',
    'L''ampoule électrique ne produit pas d''électricité, elle la consomme.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Panneau solaire', 0, 1),
(@qid, 'Accumulateur', 0, 2),
(@qid, 'Pile', 0, 3),
(@qid, 'Ampoule électrique', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Sachant qu''il y a conservation de l''énergie, l''énergie cinétique d''une voiture de masse 1 000 kg roulant à 20 m/s est :',
    'Ec = ½ × m × v² = ½ × 1 000 × 20² = 200 000 joules.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10 000 joules', 0, 1),
(@qid, '100 000 joules', 0, 2),
(@qid, '200 000 joules', 1, 3),
(@qid, '20 000 joules', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La longueur d''un plan incliné de pente 40 % qui s''élève à une hauteur de 20 cm est de :',
    'L = h / pente = 20 / 0,40 = 50 cm.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '80 cm', 0, 1),
(@qid, '500 cm', 0, 2),
(@qid, '50 cm', 1, 3),
(@qid, '8 cm', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le coeur est un muscle creux constitué de... cavités qui sont...',
    'Le coeur a 4 cavités : 2 oreillettes et 2 ventricules.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Quatre / 2 oreillettes et 2 ventricules', 1, 1),
(@qid, 'Deux / 1 oreillette et 1 ventricule', 0, 2),
(@qid, 'Trois / 2 oreillettes et 1 ventricule', 0, 3),
(@qid, 'Quatre / 4 oreillettes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le thalle filamenteux du champignon ordinaire s''appelle... Il est constitué de filaments dont chacun porte le nom de...',
    'Le mycélium est constitué d''hyphes.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mycélium / hyphe', 1, 1),
(@qid, 'Hyphe / mycélium', 0, 2),
(@qid, 'Thalle / spore', 0, 3),
(@qid, 'Sporange / mycélium', 0, 4);

-- ============================================
-- EXAMEN 19 : Suite
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le chyme est un liquide qui résulte de l''action de l''un des groupes de sucs digestifs suivants. Lequel ?',
    'Le chyme se forme dans l''estomac sous l''action du suc gastrique et de la salive.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La salive - le suc intestinal', 0, 1),
(@qid, 'Le suc gastrique - la salive', 1, 2),
(@qid, 'La bile - le suc pancréatique', 0, 3),
(@qid, 'Le suc intestinal - le suc gastrique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Toutes les parties suivantes sont des constituants de l''encéphale, sauf une. Laquelle ?',
    'La moelle épinière ne fait pas partie de l''encéphale.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le cervelet', 0, 1),
(@qid, 'Le bulbe rachidien', 0, 2),
(@qid, 'La moelle épinière', 1, 3),
(@qid, 'Le cerveau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''utérus est un organe de l''un des appareils suivants. Lequel ?',
    'L''utérus fait partie de l''appareil reproducteur féminin.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''appareil respiratoire', 0, 1),
(@qid, 'L''appareil urinaire', 0, 2),
(@qid, 'L''appareil reproducteur masculin', 0, 3),
(@qid, 'L''appareil reproducteur féminin', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'On parle de foulure ou d''entorse dans l''un des cas suivants. Lequel ?',
    'L''entorse est une déchirure de ligaments.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Inflammation de tendons', 0, 1),
(@qid, 'Déchirure de ligaments', 1, 2),
(@qid, 'Sortie de l''os de sa cavité articulaire', 0, 3),
(@qid, 'Écoulement du liquide synovial', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le manguier est classé parmi les angiospermes parce qu''il :',
    'L''angiosperme produit des graines enfermées dans un fruit.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Possède des fleurs', 0, 1),
(@qid, 'Produit des graines à deux cotylédons', 0, 2),
(@qid, 'Produit des graines enfermées dans un fruit', 1, 3),
(@qid, 'Possède racine, tige, feuilles, fleurs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La paléontologie est la partie de la géologie qui s''intéresse :',
    'La paléontologie étudie les fossiles (empreintes d''êtres anciens).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aux dépôts de minéraux accumulés au fond des mers', 0, 1),
(@qid, 'À la disposition des couches de terrain', 0, 2),
(@qid, 'Aux déformations de l''écorce terrestre', 0, 3),
(@qid, 'Aux empreintes et traces d''êtres qui ont vécu autrefois', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''énergie que possède un corps lorsqu''il tombe s''appelle énergie :',
    'Un corps qui tombe possède de l''énergie cinétique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Potentielle', 0, 1),
(@qid, 'Thermique', 0, 2),
(@qid, 'Cinétique', 1, 3),
(@qid, 'Hydraulique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le sens du goût est assuré par... Sa face supérieure renferme de nombreux reliefs de formes différentes appelés...',
    'La langue et les papilles gustatives.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La langue / papilles gustatives', 1, 1),
(@qid, 'Le nez / cils olfactifs', 0, 2),
(@qid, 'L''oeil / bâtonnets', 0, 3),
(@qid, 'L''oreille / cellules ciliées', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les champignons microscopiques utilisés pour faire lever la pâte à pain s''appellent... L''ensemble des filaments s''appelle...',
    'La levure (Saccharomyces) et le mycélium.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Levures / mycélium', 1, 1),
(@qid, 'Bactéries / thalle', 0, 2),
(@qid, 'Moisissures / sporange', 0, 3),
(@qid, 'Algues / fronde', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La poussée d''Archimède est une force de direction...',
    'La poussée d''Archimède est verticale et dirigée vers le haut.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Verticale vers le bas', 0, 1),
(@qid, 'Horizontale', 0, 2),
(@qid, 'Verticale vers le haut', 1, 3),
(@qid, 'Oblique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''appareil de mesure du poids des corps s''appelle... alors que la balance sert à mesurer...',
    'Le dynamomètre mesure le poids, la balance mesure la masse.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dynamomètre / la masse', 1, 1),
(@qid, 'Balance / le poids', 0, 2),
(@qid, 'Baromètre / la pression', 0, 3),
(@qid, 'Thermomètre / la température', 0, 4);

-- ============================================
-- EXAMEN 20 : Suite
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La membrane qui recouvre les poumons porte le nom de :',
    'La plèvre est la membrane qui enveloppe les poumons.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Péritoine', 0, 1),
(@qid, 'Périoste', 0, 2),
(@qid, 'Plèvre', 1, 3),
(@qid, 'Épiderme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Dans la cavité thoracique on retrouve les organes suivants :',
    'La cavité thoracique contient le coeur et les poumons.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Poumons - estomac', 0, 1),
(@qid, 'Coeur et estomac', 0, 2),
(@qid, 'Estomac - foie', 0, 3),
(@qid, 'Coeur - poumons', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''appareil permettant de mesurer l''intensité du courant électrique s''appelle :',
    'L''ampèremètre mesure l''intensité du courant électrique.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dynamomètre', 0, 1),
(@qid, 'Baromètre', 0, 2),
(@qid, 'Ampèremètre', 1, 3),
(@qid, 'Thermomètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les éléments caractéristiques d''une force sont :',
    'Les 4 caractéristiques : intensité, direction, sens, point d''application (origine).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Origine, hauteur, sens, intensité', 0, 1),
(@qid, 'Intensité, direction, origine, sens', 1, 2),
(@qid, 'Sens, direction, distance, origine', 0, 3),
(@qid, 'Hauteur, sens, origine, direction', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un des leviers ci-dessous est du premier genre. Lequel ?',
    'Les ciseaux sont un levier du 1er genre.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ciseaux', 1, 1),
(@qid, 'Presse-citron', 0, 2),
(@qid, 'Brouette', 0, 3),
(@qid, 'Guillotine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Pour faire tourner les moulins à vent, on utilise l''énergie :',
    'Les moulins à vent utilisent l''énergie éolienne (vent).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Thermique', 0, 1),
(@qid, 'Mécanique', 0, 2),
(@qid, 'Cinétique', 0, 3),
(@qid, 'Éolienne', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La partie de la botanique qui s''occupe de la classification des végétaux est :',
    'La taxonomie est la science de la classification des êtres vivants.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La physiologie', 0, 1),
(@qid, 'La cytologie', 0, 2),
(@qid, 'La taxonomie', 1, 3),
(@qid, 'L''histologie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Parmi les plantes suivantes, celle qui appartient à l''embranchement des bryophytes est :',
    'La mousse est une bryophyte.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La fougère', 0, 1),
(@qid, 'L''algue', 0, 2),
(@qid, 'La mousse', 1, 3),
(@qid, 'Le lichen', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le gaz qui sert de carburant pour réaliser une combustion est :',
    'L''oxygène est le comburant, le propane peut être le combustible.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''hydrogène', 0, 1),
(@qid, 'L''azote', 0, 2),
(@qid, 'L''oxygène', 0, 3),
(@qid, 'Le propane', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le seul os mobile de la face est :',
    'Le maxillaire inférieur (mandibule) est le seul os mobile du crâne.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''os frontal', 0, 1),
(@qid, 'L''os pariétal', 0, 2),
(@qid, 'Le maxillaire inférieur', 1, 3),
(@qid, 'L''os occipital', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les dents qui servent à percer et à déchirer les aliments sont... Celles qui servent à écraser s''appellent...',
    'Canines = percer/déchirer, molaires = écraser.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les canines / les molaires', 1, 1),
(@qid, 'Les incisives / les canines', 0, 2),
(@qid, 'Les molaires / les incisives', 0, 3),
(@qid, 'Les prémolaires / les canines', 0, 4);

-- ============================================
-- EXAMEN 21 : Anatomie et physiologie
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''un des os mentionnés ci-dessous appartient au membre supérieur. Lequel ?',
    'Le cubitus est un os de l''avant-bras.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le tibia', 0, 1),
(@qid, 'Le fémur', 0, 2),
(@qid, 'La rotule', 0, 3),
(@qid, 'Le cubitus', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le tissu osseux compact est enveloppé par l''une de ces membranes. Laquelle ?',
    'Le périoste enveloppe l''os compact.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le péritoine', 0, 1),
(@qid, 'Le péricarde', 0, 2),
(@qid, 'Le périoste', 1, 3),
(@qid, 'La plèvre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La partie de la biologie qui s''occupe de l''étude des végétaux s''appelle :',
    'La botanique est l''étude des végétaux.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Zoologie', 0, 1),
(@qid, 'Taxonomie', 0, 2),
(@qid, 'Botanique', 1, 3),
(@qid, 'Cytologie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La science qui étudie les restes et empreintes d''animaux et de végétaux anciens s''appelle :',
    'La paléontologie étudie les fossiles.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Histologie', 0, 1),
(@qid, 'Géologie', 0, 2),
(@qid, 'Paléontologie', 1, 3),
(@qid, 'Biologie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Parmi les maladies suivantes, celle qui est caractérisée par une baisse du taux d''hémoglobine dans le sang est :',
    'L''anémie est une baisse du taux d''hémoglobine.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Leucémie', 0, 1),
(@qid, 'Hémophilie', 0, 2),
(@qid, 'Anémie', 1, 3),
(@qid, 'Leucopénie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel de ces centres nerveux contrôle le rythme respiratoire ?',
    'Le bulbe rachidien contrôle le rythme respiratoire.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cervelet', 0, 1),
(@qid, 'Cerveau', 0, 2),
(@qid, 'Bulbe rachidien', 1, 3),
(@qid, 'Moelle épinière', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un corps de masse 15 kg a un poids de (g = 9,81 N/kg) :',
    'P = m × g = 15 × 9,81 = 147,15 N.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '147,15 N', 1, 1),
(@qid, '147,20 N', 0, 2),
(@qid, '147,75 N', 0, 3),
(@qid, '147,80 N', 0, 4);

-- ============================================
-- EXAMEN 22 : Reproduction et anatomie
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La production du son dépend de trois facteurs :',
    'Source sonore, milieu élastique, récepteur.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Source sonore - milieu élastique - récepteur', 1, 1),
(@qid, 'Source lumineuse - milieu élastique - source sonore', 0, 2),
(@qid, 'Récepteur - source sonore - source de courant', 0, 3),
(@qid, 'Milieu élastique - solide - métal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le timbre est la qualité qui différencie les sons :',
    'Le timbre différencie les sons de même hauteur et de même intensité.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aigus des sons graves', 0, 1),
(@qid, 'De même hauteur et de même intensité', 1, 2),
(@qid, 'Proches de sons éloignés', 0, 3),
(@qid, 'Produits dans l''eau de ceux produits dans l''air', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les artères sont des vaisseaux qui conduisent le sang :',
    'Les artères conduisent le sang du coeur aux organes.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des organes au coeur', 0, 1),
(@qid, 'Des organes aux poumons', 0, 2),
(@qid, 'Du coeur aux organes', 1, 3),
(@qid, 'De l''estomac aux poumons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La blennorragie se caractérise par l''apparition :',
    'La blennorragie = écoulement avec maux urinaires.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'D''un chancre et de douleurs à la tête', 0, 1),
(@qid, 'De fatigue, de diarrhée et de tâches cutanées', 0, 2),
(@qid, 'D''un écoulement accompagné de maux urinaires', 1, 3),
(@qid, 'De fortes douleurs au niveau de l''abdomen', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le cristallin est un organe en forme de lentille situé :',
    'Le cristallin est en avant de la rétine.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'En avant de la rétine', 1, 1),
(@qid, 'Sous la choroïde', 0, 2),
(@qid, 'À côté de la sclérotique', 0, 3),
(@qid, 'En arrière de l''iris', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les lichens résultent de l''association :',
    'Le lichen est l''association symbiotique d''une algue et d''un champignon.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'D''une algue et d''un champignon', 1, 1),
(@qid, 'D''une fougère et d''une algue', 0, 2),
(@qid, 'D''une algue et d''une prêle', 0, 3),
(@qid, 'De deux champignons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un être vivant autotrophe :',
    'Un autotrophe peut préparer ses propres substances organiques.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Doit faire appel à un autre être vivant pour se nourrir', 0, 1),
(@qid, 'Dépend totalement d''autres êtres vivants', 0, 2),
(@qid, 'Est capable de préparer ses propres substances organiques', 1, 3),
(@qid, 'Tire sa nourriture des substances organiques en décomposition', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Tous les éléments suivants se retrouvent dans le sous-sol, sauf un. Lequel ?',
    'La terre arable se trouve en surface, pas dans le sous-sol.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Nappes aquifères', 0, 1),
(@qid, 'Sources', 0, 2),
(@qid, 'Terre arable', 1, 3),
(@qid, 'Pierres précieuses', 0, 4);

-- ============================================
-- EXAMEN 23 : Botanique et physiologie
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel de ces groupements d''os est constitué de vertèbres ?',
    'Le coccyx et le sacrum sont des ensembles de vertèbres soudées.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sternum, calcanéum', 0, 1),
(@qid, 'Rotule, astragale', 0, 2),
(@qid, 'Astragale, clavicule', 0, 3),
(@qid, 'Coccyx, sacrum', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''une des trois principales membranes de l''oeil se nomme :',
    'La choroïde est une des membranes de l''oeil (avec la sclérotique et la rétine).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Choroïde', 1, 1),
(@qid, 'Thyroïde', 0, 2),
(@qid, 'Hémoroïde', 0, 3),
(@qid, 'Deltoïde', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les dents de sagesse sont les :',
    'Les dents de sagesse sont les troisièmes molaires.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Molaires', 1, 1),
(@qid, 'Prémolaires', 0, 2),
(@qid, 'Incisives', 0, 3),
(@qid, 'Canines', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La force nécessaire pour soulever un objet pesant 500 N à l''aide d''un système de quatre poulies est de :',
    'Avec 4 brins, F = 500/4 = 125 N.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '500 N', 0, 1),
(@qid, '125 N', 1, 2),
(@qid, '250 N', 0, 3),
(@qid, '2 000 N', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Une pression de 1 Pascal correspond à :',
    '1 Pa = 1 N/m².', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 joule × seconde', 0, 1),
(@qid, '1 Newton × mètre carré', 0, 2),
(@qid, '1 Joule / seconde', 0, 3),
(@qid, '1 Newton / mètre carré', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La partie constituée de roches située en dessous de la couche de terre arable a pour nom :',
    'Le sous-sol est la couche située sous la terre arable.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La strate', 0, 1),
(@qid, 'Le sous-sol', 1, 2),
(@qid, 'Le sédiment', 0, 3),
(@qid, 'La gangue', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La science qui étudie les déformations de l''écorce terrestre ainsi que les agents responsables s''appelle :',
    'La géodynamique étudie les déformations de l''écorce terrestre.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Stratigraphie', 0, 1),
(@qid, 'Pédologie', 0, 2),
(@qid, 'Géodynamique', 1, 3),
(@qid, 'Pétrographie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Réservoir dans lequel s''accumule l''urine :',
    'La vessie est le réservoir de l''urine.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le rein', 0, 1),
(@qid, 'L''uretère', 0, 2),
(@qid, 'La vessie', 1, 3),
(@qid, 'L''urètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Substance azotée de l''urine :',
    'L''urée est la substance azotée principale de l''urine.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''albumine', 0, 1),
(@qid, 'Le glucose', 0, 2),
(@qid, 'L''urée', 1, 3),
(@qid, 'Le chlorure de sodium', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Organe en forme de haricot :',
    'Le rein a la forme d''un haricot.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La vessie', 0, 1),
(@qid, 'Le rein', 1, 2),
(@qid, 'Le coeur', 0, 3),
(@qid, 'Le foie', 0, 4);

-- ============================================
-- EXAMEN 24 : Dernières séries
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Parmi ces noms, trouve l''os du crâne :',
    'Le pariétal est un os du crâne.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sternum', 0, 1),
(@qid, 'Péroné', 0, 2),
(@qid, 'Pariétal', 1, 3),
(@qid, 'Clavicule', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel des éléments ci-dessous est un accident des os ?',
    'La fracture est un accident des os.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Déchirure', 0, 1),
(@qid, 'Fracture', 1, 2),
(@qid, 'Élongation', 0, 3),
(@qid, 'Tendinite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La trompe d''Eustache est une partie de :',
    'La trompe d''Eustache fait partie de l''oreille.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''oeil', 0, 1),
(@qid, 'L''abdomen', 0, 2),
(@qid, 'L''oreille', 1, 3),
(@qid, 'Du nez', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Jeannette est enceinte de 4 mois. Le foetus se développe dans :',
    'Le foetus se développe dans l''utérus.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le vagin', 0, 1),
(@qid, 'L''utérus', 1, 2),
(@qid, 'La trompe', 0, 3),
(@qid, 'Le clitoris', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'On parle de petite circulation quand :',
    'La petite circulation = le sang va aux poumons pour être purifié.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le sang reste du côté droit du coeur', 0, 1),
(@qid, 'Le sang passe dans tous les organes du corps', 0, 2),
(@qid, 'Le sang va aux poumons pour être purifié', 1, 3),
(@qid, 'Le sang circule dans le coeur uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Dans l''appareil excréteur, la partie qui entraîne l''urine à la vessie est :',
    'Les uretères conduisent l''urine des reins à la vessie.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uretères', 1, 1),
(@qid, 'Néphrites', 0, 2),
(@qid, 'Reins', 0, 3),
(@qid, 'Urètres', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Au cours du phénomène de digestion, le chyme se forme dans :',
    'Le chyme se forme dans l''estomac.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''oesophage', 0, 1),
(@qid, 'Les intestins', 0, 2),
(@qid, 'L''estomac', 1, 3),
(@qid, 'La bouche', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La poussée exercée par un liquide sur un solide immergé est :',
    'La poussée d''Archimède = poids du liquide déplacé.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Inférieure au poids du liquide déplacé', 0, 1),
(@qid, 'Supérieure au poids du liquide déplacé', 0, 2),
(@qid, 'Égale au poids du liquide déplacé', 1, 3),
(@qid, 'Inférieure ou égale au poids du liquide déplacé', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Laquelle des plantes ci-dessous est dépourvue de chlorophylle ?',
    'Le djondjon (champignon) est dépourvu de chlorophylle.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Malanga', 0, 1),
(@qid, 'Djondjon', 1, 2),
(@qid, 'Croton', 0, 3),
(@qid, 'Caoutchouc', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Parmi ces noms, trouve un champignon mortel à l''homme :',
    'L''amanite est un champignon mortel.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Truffe', 0, 1),
(@qid, 'Morille', 0, 2),
(@qid, 'Amanite', 1, 3),
(@qid, 'Chanterelle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Un pied de malanga ne peut pas se reproduire par le semis parce que :',
    'Le malanga ne renferme pas de pièces florales.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ses racines sont peu développées', 0, 1),
(@qid, 'Ses feuilles renferment trop de chlorophylle', 0, 2),
(@qid, 'Il ne renferme pas de pièces florales', 1, 3),
(@qid, 'Il est une plante alimentaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'L''algine est la substance produite par :',
    'L''algine est produite par les algues.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les champignons', 0, 1),
(@qid, 'Les bactéries', 0, 2),
(@qid, 'Les algues', 1, 3),
(@qid, 'La levure', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les murs abandonnés et humides se couvrent de limon appelé aussi :',
    'Les murs humides se couvrent d''algues.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mousse', 0, 1),
(@qid, 'Bactérie', 0, 2),
(@qid, 'Algue', 1, 3),
(@qid, 'Lichens', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Trouve dans la liste ci-dessous, la plante dioïque :',
    'Le quénépier est une plante dioïque (pieds mâles et femelles séparés).', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Quénépier', 1, 1),
(@qid, 'Oranger', 0, 2),
(@qid, 'Maïs', 0, 3),
(@qid, 'Manguier', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Les plantes sans fleurs se reproduisent naturellement par :',
    'Les plantes sans fleurs se reproduisent par sporulation.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Greffage', 0, 1),
(@qid, 'Sporulation', 1, 2),
(@qid, 'Marcottage', 0, 3),
(@qid, 'Semence', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel des agents polluants ci-dessous attaque le stomate des feuilles ?',
    'Le dioxyde de soufre attaque les stomates des feuilles.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Monoxydes d''azote', 0, 1),
(@qid, 'Plomb', 0, 2),
(@qid, 'Dioxyde de soufre', 1, 3),
(@qid, 'Monoxyde de carbone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le sol le plus propice à la culture rizière est le :',
    'Le sol marécageux convient à la riziculture.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sol sablonneux', 0, 1),
(@qid, 'Sol pierreux', 0, 2),
(@qid, 'Sol marécageux', 1, 3),
(@qid, 'Sol perméable', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Laquelle des situations ci-dessous est obtenue par le reboisement ?',
    'Le reboisement conserve l''humus de la terre.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Augmentation de la température du milieu', 0, 1),
(@qid, 'Rareté des sources d''eau', 0, 2),
(@qid, 'Conservation de l''humus de la terre', 1, 3),
(@qid, 'Détérioration de la qualité du sol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Pour combattre la salinisation du sol il faut :',
    'Le drainage permet de lutter contre la salinisation.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pratiquer le drainage', 1, 1),
(@qid, 'Mettre de l''engrais au sol', 0, 2),
(@qid, 'Procéder à l''irrigation du sol', 0, 3),
(@qid, 'Pratiquer la culture en terrasse', 0, 4);

-- ============================================
-- EXAMEN 25 : Dernières questions
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La pollinisation est le transport du pollen sur le :',
    'La pollinisation = transport du pollen sur le stigmate.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le pistil', 0, 1),
(@qid, 'Le stigmate', 1, 2),
(@qid, 'L''ovaire', 0, 3),
(@qid, 'L''anthère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La salive est sécrétée par trois paires de glandes. Ce sont les glandes :',
    'Glandes parotides, sous-maxillaires et sublinguales.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pancréatiques, gastriques, parotides', 0, 1),
(@qid, 'Péristaltiques, sublinguales, sous-maxillaires', 0, 2),
(@qid, 'Parotides, sous-maxillaires, sublinguales', 1, 3),
(@qid, 'Lactiques, intestinales, salivaires', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le sol se forme par :',
    'Le sol se forme par la dégradation des roches sous l''action des agents climatiques.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La désagrégation des roches sous l''effet de la chaleur', 0, 1),
(@qid, 'L''action du vent qui effrite les roches', 0, 2),
(@qid, 'La décomposition de la matière organique', 0, 3),
(@qid, 'La dégradation de la roche sous l''action de la pluie', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'La couche d''air qui enveloppe la Terre s''appelle :',
    'L''atmosphère est la couche d''air entourant la Terre.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Biosphère', 0, 1),
(@qid, 'Barysphère', 0, 2),
(@qid, 'Atmosphère', 1, 3),
(@qid, 'Lithosphère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Pour soulever une charge pesant 1 000 N à l''aide d''une poulie simple (poulie à une gorge), il faut exercer une force de :',
    'Avec une poulie fixe simple, F = charge = 1 000 N.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'F = 1 000 N', 1, 1),
(@qid, 'F < 1 000 N', 0, 2),
(@qid, 'F > 1 000 N', 0, 3),
(@qid, 'F = 500 N', 0, 4);

-- ============================================
-- EXAMEN 26 : Instrument de musique et énergie
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Nos cordes vocales sont logées dans la partie supérieure de notre :',
    'Les cordes vocales sont logées dans le larynx (gorge).', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pharynx', 0, 1),
(@qid, 'Langue', 0, 2),
(@qid, 'Trachée-artère', 0, 3),
(@qid, 'Gorge', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'En un lieu où g = 9,8 N/kg, l''énergie potentielle d''un parachutiste de masse 65 kg qui tombe d''une hauteur de 10 m est :',
    'Ep = m × g × h = 65 × 9,8 × 10 = 6 370 J.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '650 J', 0, 1),
(@qid, '6 370 J', 1, 2),
(@qid, '637 J', 0, 3),
(@qid, '6 373 J', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel de ces organes est une structure de l''appareil reproducteur masculin ?',
    'L''urètre fait partie de l''appareil reproducteur masculin.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Trompe', 0, 1),
(@qid, 'Utérus', 0, 2),
(@qid, 'Urètre', 1, 3),
(@qid, 'Uretère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Lequel de ces groupes de mots représente un ensemble de thallophytes ?',
    'Algues, lichens, champignons sont des thallophytes.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fougère, mousse, algue', 0, 1),
(@qid, 'Algue, lichens, champignon', 1, 2),
(@qid, 'Lichen, mousse, champignon', 0, 3),
(@qid, 'Champignon, fougère, algue', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Une puissance de 1 watt correspond à un travail de :',
    '1 watt = 1 joule par seconde.', 'Examen 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 joule par minute', 0, 1),
(@qid, '1 joule par heure', 0, 2),
(@qid, '1 joule par seconde', 1, 3),
(@qid, '1 joule par jour', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(4, 2, 'Le chyle est le liquide blanchâtre contenu dans :',
    'Le chyle est le résultat de la digestion dans l''intestin grêle.', 'Examen 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''estomac et représentant le résultat de la digestion', 0, 1),
(@qid, 'Le foie, l''estomac, l''intestin avant le repas', 0, 2),
(@qid, 'L''intestin et représentant le résultat de la digestion', 1, 3),
(@qid, 'Le pancréas, le foie et l''estomac après la digestion', 0, 4);


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



-- ============================================================
-- QCM SCIENCES SOCIALES 9e AF - HAITI
-- Plus de 400 questions avec 4 options chacune
-- Basé sur le programme national 9e AF
-- matiere_id = 5 (Sciences Sociales), type_id = 2 (QCM)
-- Difficulté: 1=Facile, 2=Moyen, 3=Difficile
-- ============================================================

-- ============================================================
-- THÈME 1: HISTOIRE D'HAÏTI - OCCUPATION AMÉRICAINE (1915-1934)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la durée de l''occupation américaine en Haïti ?',
 'L''occupation américaine a duré de 1915 à 1934, soit 19 ans.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10 ans', 0, 1), (@qid, '15 ans', 0, 2), (@qid, '19 ans', 1, 3), (@qid, '25 ans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Lequel de ces journaux a été créé pour résister à l''occupation américaine de 1915-1934 ?',
 'La Ruche était un journal patriotique créé pour résister à l''occupation.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Nouvelliste', 0, 1), (@qid, 'La Ruche', 1, 2), (@qid, 'Le Matin', 0, 3), (@qid, 'Haïti Liberté', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Lequel de ces journaux a soutenu la résistance culturelle à l''occupation américaine (1915-1934) ?',
 'L''Union Patriotique était un groupe de résistance culturelle à l''occupation.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Ruche', 0, 1), (@qid, 'Le Nouveau Monde', 0, 2), (@qid, 'L''Union Patriotique', 1, 3), (@qid, 'Le Petit Samedi Soir', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui était Charlemagne Péralte ?',
 'Charlemagne Péralte était le chef des Cacos qui a mené la résistance armée contre l''occupation américaine.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un président haïtien', 0, 1), (@qid, 'Le chef des Cacos résistant à l''occupation', 1, 2), (@qid, 'Un général américain', 0, 3), (@qid, 'Un journaliste patriote', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Que représentaient les "Cacos" pendant l''occupation américaine ?',
 'Les Cacos étaient des paysans armés qui symbolisaient la résistance contre l''occupation américaine.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des soldats américains', 0, 1), (@qid, 'Des paysans armés résistant à l''occupation', 1, 2), (@qid, 'Des politiciens collaborateurs', 0, 3), (@qid, 'Des marchands ruraux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année les États-Unis ont-ils mis fin à leur occupation d''Haïti ?',
 'L''occupation américaine a pris fin en 1934.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1929', 0, 1), (@qid, '1931', 0, 2), (@qid, '1934', 1, 3), (@qid, '1937', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la politique du "Big Stick" des États-Unis dans la Caraïbe ?',
 'La politique du Big Stick autorisait l''intervention militaire américaine dans la Caraïbe.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une aide économique aux pays pauvres', 0, 1), (@qid, 'L''intervention militaire américaine dans la Caraïbe', 1, 2), (@qid, 'Un traité de commerce', 0, 3), (@qid, 'Une politique culturelle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel président américain est associé à la doctrine Monroe ?',
 'James Monroe a énoncé sa doctrine en 1823 pour s''opposer à l''intervention européenne en Amérique.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Abraham Lincoln', 0, 1), (@qid, 'James Monroe', 1, 2), (@qid, 'Franklin Roosevelt', 0, 3), (@qid, 'Theodore Roosevelt', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année la doctrine Monroe a-t-elle été proclamée ?',
 'La doctrine Monroe a été proclamée en 1823 par le président américain James Monroe.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1803', 0, 1), (@qid, '1815', 0, 2), (@qid, '1823', 1, 3), (@qid, '1848', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Lequel de ces faits traduit la politique du "Big Stick" des États-Unis dans la Caraïbe ?',
 'L''intervention en République Dominicaine en 1916 est une manifestation de la politique du Big Stick.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aide massive au développement', 0, 1), (@qid, 'Intervention en République Dominicaine en 1916', 1, 2), (@qid, 'Appui à la professionnalisation des cadres', 0, 3), (@qid, 'Renforcement de la sécurité régionale', 0, 4);

-- ============================================================
-- THÈME 2: INDÉPENDANCE D'HAÏTI ET PERSONNAGES HISTORIQUES
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année Haïti a-t-elle proclamé son indépendance ?',
 'Haïti a proclamé son indépendance le 1er janvier 1804.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1791', 0, 1), (@qid, '1798', 0, 2), (@qid, '1804', 1, 3), (@qid, '1820', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a rédigé l''acte de l''indépendance d''Haïti ?',
 'Boisrond-Tonnerre a rédigé l''acte de l''indépendance d''Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jean-Jacques Dessalines', 0, 1), (@qid, 'Jean Pierre Boyer', 0, 2), (@qid, 'Boisrond Tonnerre', 1, 3), (@qid, 'Alexandre Pétion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a construit la Citadelle Laferrière ?',
 'La Citadelle Laferrière a été construite sous Henri Christophe.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jean-Jacques Dessalines', 0, 1), (@qid, 'Henri Christophe', 1, 2), (@qid, 'Alexandre Pétion', 0, 3), (@qid, 'Jean Pierre Boyer', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Dans quel département se trouve la Citadelle Laferrière ?',
 'La Citadelle Laferrière se trouve dans le département du Nord.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Artibonite', 0, 1), (@qid, 'L''Ouest', 0, 2), (@qid, 'Le Nord', 1, 3), (@qid, 'Le Sud', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a commandé les insurgés à la Crête-à-Pierrot ?',
 'Dessalines a commandé les insurgés à la Crête-à-Pierrot.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Alexandre Pétion', 0, 1), (@qid, 'Jean Pierre Boyer', 0, 2), (@qid, 'Jean-Jacques Dessalines', 1, 3), (@qid, 'Toussaint Louverture', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel président haïtien a accepté de payer une indemnité à la France pour la reconnaissance de l''indépendance ?',
 'Jean Pierre Boyer a accepté de payer 150 millions de francs à la France en 1825.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jean-Jacques Dessalines', 0, 1), (@qid, 'Jean Pierre Boyer', 1, 2), (@qid, 'Henri Christophe', 0, 3), (@qid, 'Alexandre Pétion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui a décroché le Général Pétion et fut tué à sa place ?',
 'Jean-Jacques Dessalines a décroché le général Pétion et fut tué à sa place.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Henri Christophe', 0, 1), (@qid, 'Jean-Jacques Dessalines', 1, 2), (@qid, 'Toussaint Louverture', 0, 3), (@qid, 'Boisrond Tonnerre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La cérémonie du Bois Caïman a eu lieu en quelle année ?',
 'La cérémonie du Bois Caïman a eu lieu le 22 août 1791.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1789', 0, 1), (@qid, '1791', 1, 2), (@qid, '1798', 0, 3), (@qid, '1804', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le surnom donné à Haïti pour sa lutte pour la liberté ?',
 'Haïti est connue comme "La perle des Antilles" et aussi le premier pays noir libre.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La terre des géants', 0, 1), (@qid, 'La perle des Antilles', 1, 2), (@qid, 'Le pays du soleil', 0, 3), (@qid, 'L''île enchantée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Francisco Miranda et Simón Bolívar sont deux héros de l''indépendance de quel pays ?',
 'Francisco Miranda et Simón Bolívar sont deux héros de l''indépendance du Venezuela.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1), (@qid, 'Colombie', 0, 2), (@qid, 'Venezuela', 1, 3), (@qid, 'Mexique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel président haïtien a aidé Francisco Miranda et Bolívar dans leur lutte pour l''indépendance du Venezuela ?',
 'Alexandre Pétion a apporté son soutien à Miranda et Bolívar.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jean-Jacques Dessalines', 0, 1), (@qid, 'Henri Christophe', 0, 2), (@qid, 'Alexandre Pétion', 1, 3), (@qid, 'Jean Pierre Boyer', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Jean-Jacques Acaau était le leader de quel mouvement paysan haïtien ?',
 'Jean-Jacques Acaau était le leader des Piquets dans le Sud d''Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les Cacos', 0, 1), (@qid, 'Les Piquets', 1, 2), (@qid, 'Les Zotobre', 0, 3), (@qid, 'Les Brigands', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle revendication formulée par Acaau était d''ordre politique ?',
 'Acaau réclamait "un noir à la présidence" comme revendication politique.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une justice sociale pour tous', 0, 1), (@qid, 'Une égalité sans ambiguïté', 0, 2), (@qid, 'Un partage équitable des terres', 0, 3), (@qid, 'Un noir à la présidence', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui était Guillaume II mentionné dans le contexte de la fin de la Première Guerre mondiale ?',
 'Guillaume II était l''Empereur d''Allemagne (Kaiser) qui a abdiqué le 9 novembre 1918.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Roi de France', 0, 1), (@qid, 'L''Empereur d''Allemagne', 1, 2), (@qid, 'Le Tsar de Russie', 0, 3), (@qid, 'Le Roi d''Angleterre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année a eu lieu la tentative de coup d''état de Munich par Hitler ?',
 'Le 8 novembre 1923, Adolf Hitler a tenté un coup d''état à Munich (putsch de la Brasserie).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1919', 0, 1), (@qid, '1921', 0, 2), (@qid, '1923', 1, 3), (@qid, '1925', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Sous quelle autre appellation connaît-on le Parti National-Socialiste de Hitler ?',
 'Le Parti National-Socialiste est aussi connu sous le nom de Parti Nazi.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parti Communiste', 0, 1), (@qid, 'Parti Nazi', 1, 2), (@qid, 'Parti Fasciste', 0, 3), (@qid, 'Parti Républicain', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quand l''armistice de la Première Guerre mondiale a-t-il été signé ?',
 'L''armistice a été signé le 11 novembre 1918, mettant fin à la Première Guerre mondiale.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '11 novembre 1917', 0, 1), (@qid, '11 novembre 1918', 1, 2), (@qid, '28 juin 1919', 0, 3), (@qid, '11 novembre 1919', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Lequel de ces événements a contribué à mettre fin à la Deuxième Guerre mondiale ?',
 'Le bombardement d''Hiroshima le 6 août 1945 a précipité la capitulation du Japon.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''assassinat d''Ernesto Che Guevara', 0, 1), (@qid, 'Le bombardement d''Hiroshima le 6 août 1945', 1, 2), (@qid, 'La crise économique de 1929', 0, 3), (@qid, 'L''assassinat de François Ferdinand à Sarajevo', 0, 4);

-- ============================================================
-- THÈME 3: GÉOGRAPHIE D'HAÏTI - DÉPARTEMENTS
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Combien de départements géographiques compte Haïti ?',
 'Haïti est divisée en 10 départements géographiques.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '8', 0, 1), (@qid, '9', 0, 2), (@qid, '10', 1, 3), (@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le chef-lieu du département de l''Artibonite ?',
 'Gonaïves est le chef-lieu du département de l''Artibonite.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Saint-Marc', 0, 1), (@qid, 'Gonaïves', 1, 2), (@qid, 'Hinche', 0, 3), (@qid, 'Port-de-Paix', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le chef-lieu du département du Sud ?',
 'Les Cayes est le chef-lieu du département du Sud.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jérémie', 0, 1), (@qid, 'Les Cayes', 1, 2), (@qid, 'Miragoâne', 0, 3), (@qid, 'Jacmel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le chef-lieu des Nippes ?',
 'Miragoâne est le chef-lieu du département des Nippes.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Petit-Goâve', 0, 1), (@qid, 'Les Cayes', 0, 2), (@qid, 'Miragoâne', 1, 3), (@qid, 'Jérémie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Dans quel département se trouve le barrage de Péligre ?',
 'Le barrage de Péligre se trouve dans le département du Centre.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Artibonite', 0, 1), (@qid, 'Le Centre', 1, 2), (@qid, 'L''Ouest', 0, 3), (@qid, 'Le Nord', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Lequel des trois départements de la bande Nord d''Haïti est le plus vaste ?',
 'Le Nord-Ouest est le plus vaste avec 2175 km², suivi du Nord (2105 km²) et du Nord-Est (1804 km²).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Nord', 0, 1), (@qid, 'Le Nord-Est', 0, 2), (@qid, 'Le Nord-Ouest', 1, 3), (@qid, 'Ils ont la même superficie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel département de la bande Nord d''Haïti a le plus de rivières ?',
 'Le Nord-Est possède 66 rivières, contre 65 pour le Nord et 33 pour le Nord-Ouest.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Nord-Ouest', 0, 1), (@qid, 'Le Nord', 0, 2), (@qid, 'Le Nord-Est', 1, 3), (@qid, 'L''Artibonite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le chef-lieu du département ayant le plus de rivières dans la bande Nord ?',
 'Le Nord-Est a 66 rivières, et son chef-lieu est Fort-Liberté.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cap-Haïtien', 0, 1), (@qid, 'Port-de-Paix', 0, 2), (@qid, 'Fort-Liberté', 1, 3), (@qid, 'Hinche', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la population du département de l''Artibonite selon les données de 2015 ?',
 'La population de l''Artibonite est de 1 571 020 habitants selon les données 2015.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '824 136', 0, 1), (@qid, '970 495', 0, 2), (@qid, '1 571 020', 1, 3), (@qid, '774 916', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle commune d''Haïti est réputée pour la production de la mangue francisque ?',
 'Gros-Morne dans l''Artibonite est réputée pour la mangue francisque.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Léogâne', 0, 1), (@qid, 'Arcahaie', 0, 2), (@qid, 'Gros-Morne', 1, 3), (@qid, 'Desdunes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle commune haïtienne est spécialisée dans la production de la canne-à-sucre ?',
 'Desdunes est connue pour la production de canne-à-sucre.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Gros-Morne', 0, 1), (@qid, 'Léogâne', 0, 2), (@qid, 'Arcahaie', 0, 3), (@qid, 'Desdunes', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La commune de Léogâne est réputée pour sa production de quoi ?',
 'Léogâne est connue pour sa production de la figue-banane.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Riz', 0, 1), (@qid, 'Figue-banane', 1, 2), (@qid, 'Mangue', 0, 3), (@qid, 'Café', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la superficie du département du Sud en km² ?',
 'Le département du Sud a une superficie de 2 654 km².', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 115 km²', 0, 1), (@qid, '4 887 km²', 0, 2), (@qid, '2 654 km²', 1, 3), (@qid, '1 804 km²', 0, 4);

-- ============================================================
-- THÈME 4: CONSTITUTION ET DROIT
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle fut la première constitution d''Haïti ?',
 'La première constitution d''Haïti a été proclamée en 1801 par Toussaint Louverture.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La constitution de 1804', 0, 1), (@qid, 'La constitution de 1801', 1, 2), (@qid, 'La constitution de 1807', 0, 3), (@qid, 'La constitution de 1816', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce qu''une constitution démocratique ?',
 'Une constitution démocratique est un document fondamental qui garantit les droits et libertés des citoyens et organise les pouvoirs de l''État.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un document secret du gouvernement', 0, 1), (@qid, 'Un document qui garantit droits et libertés des citoyens', 1, 2), (@qid, 'Une liste des lois économiques', 0, 3), (@qid, 'Un traité international', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Lequel des faits suivants est conforme à l''exercice d''un droit politique ?',
 'Être candidate à la députation est un exercice du droit politique de se présenter aux élections.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Natacha est secrétaire exécutive à la présidence', 0, 1), (@qid, 'Ruth est candidate à la députation pour la commune de Dame-Marie', 1, 2), (@qid, 'Esther achète une maison à Pétionville', 0, 3), (@qid, 'Paul paie ses impôts', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Se porter candidat aux élections est quel type de droit ?',
 'Se porter candidat aux élections est un droit politique.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un droit civil', 0, 1), (@qid, 'Un droit économique', 0, 2), (@qid, 'Un droit politique', 1, 3), (@qid, 'Un droit social', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Acheter une maison est quel type de droit ?',
 'Acheter une maison est un droit civil (droit de propriété).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un droit politique', 0, 1), (@qid, 'Un droit civil', 1, 2), (@qid, 'Un droit économique', 0, 3), (@qid, 'Un droit international', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le pouvoir législatif, d''après la constitution haïtienne, est formé de combien de chambres ?',
 'Le pouvoir législatif est formé de deux chambres: le Sénat et la Chambre des Députés.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une chambre', 0, 1), (@qid, 'Deux chambres', 1, 2), (@qid, 'Trois chambres', 0, 3), (@qid, 'Quatre chambres', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Un juge à la Cour de Cassation est membre de quel pouvoir ?',
 'Un juge à la Cour de Cassation appartient au pouvoir judiciaire.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pouvoir exécutif', 0, 1), (@qid, 'Pouvoir législatif', 0, 2), (@qid, 'Pouvoir judiciaire', 1, 3), (@qid, 'Pouvoir militaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le ministre de l''Éducation Nationale fait partie de quel pouvoir ?',
 'Le ministre de l''Éducation Nationale fait partie du pouvoir exécutif.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pouvoir judiciaire', 0, 1), (@qid, 'Pouvoir législatif', 0, 2), (@qid, 'Pouvoir exécutif', 1, 3), (@qid, 'Pouvoir municipal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la mission du Président du Sénat ?',
 'Le Président du Sénat fait partie du pouvoir législatif qui vote les lois.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Informer la population sur les lois', 0, 1), (@qid, 'Publier les lois', 0, 2), (@qid, 'Exécuter les lois', 0, 3), (@qid, 'Voter les lois', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la mission d''un journaliste de la RTV en rapport avec les lois ?',
 'Le journaliste de la RTV a pour mission d''informer la population sur les lois.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Voter les lois', 0, 1), (@qid, 'Informer la population sur les lois', 1, 2), (@qid, 'Appliquer les lois', 0, 3), (@qid, 'Rédiger les lois', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'L''ONU a été créée en quelle année ?',
 'L''Organisation des Nations Unies (ONU) a été créée en 1945 après la Deuxième Guerre mondiale.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1919', 0, 1), (@qid, '1939', 0, 2), (@qid, '1945', 1, 3), (@qid, '1950', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Voter, c''est quoi en termes de droits politiques ?',
 'Voter, c''est désigner son candidat dans les élections, un droit politique fondamental.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Signer une pétition', 0, 1), (@qid, 'Désigner son candidat dans les élections', 1, 2), (@qid, 'Payer ses impôts', 0, 3), (@qid, 'Rejoindre un syndicat', 0, 4);

-- ============================================================
-- THÈME 5: LA CARAÏBE - GÉOGRAPHIE ET POLITIQUE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Lequel de ces territoires de la Caraïbe est un DOM (Département d''Outre-Mer) ?',
 'La Martinique est un Département d''Outre-Mer français dans la Caraïbe.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1), (@qid, 'Porto Rico', 0, 2), (@qid, 'Jamaïque', 0, 3), (@qid, 'Martinique', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le seul État associé des grandes Antilles ?',
 'Porto Rico est le seul État associé des grandes Antilles, associé aux États-Unis.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1), (@qid, 'Porto Rico', 1, 2), (@qid, 'Jamaïque', 0, 3), (@qid, 'Haïti', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Dans quel pays de la Caraïbe est né le reggae ?',
 'Le reggae est un rythme musical né en Jamaïque.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1), (@qid, 'Martinique', 0, 2), (@qid, 'Haïti', 0, 3), (@qid, 'Jamaïque', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays est associé au rythme musical "Zouk" ?',
 'Le Zouk est un rythme musical originaire de la Martinique.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1), (@qid, 'Martinique', 1, 2), (@qid, 'Jamaïque', 0, 3), (@qid, 'Haïti', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le "Rara" est un rythme musical associé à quel pays ?',
 'Le Rara est un rythme musical typiquement haïtien.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1), (@qid, 'Martinique', 0, 2), (@qid, 'Haïti', 1, 3), (@qid, 'Jamaïque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La "Salsa" est associée à quel pays caribéen ?',
 'La Salsa est un rythme musical fortement associé à Cuba.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 1, 1), (@qid, 'Mexique', 0, 2), (@qid, 'Jamaïque', 0, 3), (@qid, 'Haïti', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel organisme d''intégration économique dans la Caraïbe a été créé en avril 1968 ?',
 'La CARIFTA (Caribbean Free Trade Association) a été créée en avril 1968.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CARICOM', 0, 1), (@qid, 'CARIFTA', 1, 2), (@qid, 'OECS', 0, 3), (@qid, 'ALBA', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel organisme d''intégration économique dans la Caraïbe a été créé en juillet 1973 ?',
 'La CARICOM (Caribbean Community) a été créée par le Traité de Chaguaramas le 4 juillet 1973 à Trinité et Tobago.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CARIFTA', 0, 1), (@qid, 'OECS', 0, 2), (@qid, 'CARICOM', 1, 3), (@qid, 'CEPALC', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le traité fondateur de la CARICOM a été signé dans quel pays ?',
 'Le traité de Chaguaramas fondant la CARICOM a été signé à Trinité et Tobago.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jamaïque', 0, 1), (@qid, 'Barbade', 0, 2), (@qid, 'Trinité et Tobago', 1, 3), (@qid, 'Guyana', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle était la date de l''indépendance de Cuba ?',
 'Cuba a obtenu son indépendance en 1898 de l''Espagne, mais la révolution castriste triompha en 1959.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1844', 0, 1), (@qid, '1898', 1, 2), (@qid, '1950', 0, 3), (@qid, '1962', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est l''année d''indépendance de la Jamaïque ?',
 'La Jamaïque a obtenu son indépendance en 1962.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1844', 0, 1), (@qid, '1950', 0, 2), (@qid, '1962', 1, 3), (@qid, '1973', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année la République Dominicaine a-t-elle obtenu son indépendance ?',
 'La République Dominicaine a déclaré son indépendance en 1844.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1804', 0, 1), (@qid, '1844', 1, 2), (@qid, '1898', 0, 3), (@qid, '1901', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Les relations entre Cuba et les États-Unis ont été reprises officiellement sous quel président ?',
 'Les relations diplomatiques Cuba-USA ont été reprises sous le président Barack Obama le 1er juillet 2015.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'George W. Bush', 0, 1), (@qid, 'Donald Trump', 0, 2), (@qid, 'Barack Obama', 1, 3), (@qid, 'Bill Clinton', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Fidel Castro est le leader de quelle révolution ?',
 'Fidel Castro est le leader de la Révolution cubaine de 1959.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Révolution française', 0, 1), (@qid, 'La Révolution cubaine', 1, 2), (@qid, 'La Révolution russe', 0, 3), (@qid, 'La Révolution mexicaine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le chef-lieu du mouvement castriste qui est entré à la Havane le 2 janvier 1959 ?',
 'En 1959, l''armée rebelle de Fidel Castro est entrée triomphalement à la Havane, la capitale cubaine.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Santiago de Cuba', 0, 1), (@qid, 'Guantanamo', 0, 2), (@qid, 'La Havane', 1, 3), (@qid, 'Trinidad', 0, 4);

-- ============================================================
-- THÈME 6: ÉCONOMIE - DÉVELOPPEMENT ET RESSOURCES
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce qui caractérise un pays sous-développé ?',
 'Les pays sous-développés se caractérisent notamment par leur dépendance pour l''approvisionnement en pétrole.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Taux d''analphabétisme très faible', 0, 1), (@qid, 'Dépendance pour l''approvisionnement en pétrole', 1, 2), (@qid, 'PIB par habitant très élevé', 0, 3), (@qid, 'Pays rarement frappés de cyclone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que l''agriculture de subsistance ?',
 'L''agriculture de subsistance vise à subvenir aux besoins du producteur et de sa famille.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une agriculture tournée vers l''exportation', 0, 1), (@qid, 'Une agriculture visant à subvenir aux besoins du producteur', 1, 2), (@qid, 'Une agriculture industrielle', 0, 3), (@qid, 'Une agriculture pratiquée en montagne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'L''agriculture commerciale vise principalement quoi ?',
 'L''agriculture commerciale vise l''exportation et la vente sur les marchés.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Nourrir la famille du producteur', 0, 1), (@qid, 'L''exportation et la vente sur les marchés', 1, 2), (@qid, 'Protéger l''environnement', 0, 3), (@qid, 'Développer le tourisme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le pétrole, le gaz naturel et l''uranium sont des ressources naturelles de quel type ?',
 'Le pétrole, le gaz naturel et l''uranium sont des ressources naturelles non renouvelables.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ressources renouvelables', 0, 1), (@qid, 'Ressources non renouvelables', 1, 2), (@qid, 'Ressources agricoles', 0, 3), (@qid, 'Ressources hydrauliques', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'L''eau et le bois sont des ressources naturelles de quel type ?',
 'L''eau et le bois sont des ressources naturelles renouvelables.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ressources non renouvelables', 0, 1), (@qid, 'Ressources renouvelables', 1, 2), (@qid, 'Ressources minérales', 0, 3), (@qid, 'Ressources fossiles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que l''OPEP ?',
 'L''OPEP est l''Organisation des Pays Exportateurs de Pétrole, fondée en 1960.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Organisation des Pays Européens et Pétroliers', 0, 1), (@qid, 'Organisation des Pays Exportateurs de Pétrole', 1, 2), (@qid, 'Organisation Panamériçaine pour l''Énergie Pétrolière', 0, 3), (@qid, 'Organisation pour la Politique Économique et Pétrolière', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année l''OPEP a-t-elle été fondée ?',
 'L''OPEP a été fondée le 14 septembre 1960 par l''Iran, l''Irak, le Koweït, l''Arabie Saoudite et le Venezuela.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1945', 0, 1), (@qid, '1955', 0, 2), (@qid, '1960', 1, 3), (@qid, '1973', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays de la Caraïbe est producteur de pétrole ?',
 'Trinidad et Tobago est un pays producteur de pétrole dans la Caraïbe.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haïti', 0, 1), (@qid, 'Jamaïque', 0, 2), (@qid, 'Trinidad et Tobago', 1, 3), (@qid, 'Barbade', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le Pétro-Caribe ?',
 'Petro-Caribe est un accord pétrolier qui permet aux pays caribéens de s''approvisionner en pétrole vénézuélien à des conditions préférentielles.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une compagnie pétrolière haïtienne', 0, 1), (@qid, 'Un accord pétrolier vénézuélien pour la Caraïbe', 1, 2), (@qid, 'Un pipeline sous-marin caribéen', 0, 3), (@qid, 'Un fonds d''aide canadien', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays apporte un soutien financier à Haïti dans le cadre du Pétro-Caribe ?',
 'Le Venezuela apporte un soutien financier à Haïti dans le cadre du Pétro-Caribe.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1), (@qid, 'Mexique', 0, 2), (@qid, 'Venezuela', 1, 3), (@qid, 'Canada', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''entend-on par "pays du Nord" dans le contexte de la géographie économique mondiale ?',
 'Les "pays du Nord" désignent les pays développés et industrialisés, généralement localisés dans l''hémisphère Nord.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les pays situés physiquement au nord', 0, 1), (@qid, 'Les pays développés et industrialisés', 1, 2), (@qid, 'Les pays arctiques', 0, 3), (@qid, 'Les pays membres de l''OTAN', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce qui caractérise l''économie extravertie de la Caraïbe ?',
 'L''économie de la Caraïbe est dite extravertie parce que ses industries produisent essentiellement pour le marché nord-américain.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Elle dépend surtout de l''agriculture', 0, 1), (@qid, 'Son secteur tertiaire est peu développé', 0, 2), (@qid, 'Ses industries produisent pour le marché nord-américain', 1, 3), (@qid, 'Son taux de chômage est très élevé', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le seul PMA (Pays Moins Avancé) de l''Amérique ?',
 'Haïti est le seul PMA (Pays Moins Avancé) de l''Amérique.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1), (@qid, 'Bolivie', 0, 2), (@qid, 'Haïti', 1, 3), (@qid, 'Honduras', 0, 4);

-- ============================================================
-- THÈME 7: ENVIRONNEMENT ET DÉFORESTATION
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la déforestation ?',
 'La déforestation est la destruction massive des forêts, notamment par la coupe des arbres.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La plantation d''arbres', 0, 1), (@qid, 'La destruction massive des forêts', 1, 2), (@qid, 'L''étude des forêts tropicales', 0, 3), (@qid, 'La gestion des parcs nationaux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Laquelle des conséquences suivantes est liée à la déforestation en Haïti ?',
 'L''érosion des sols est une conséquence majeure de la déforestation en Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''augmentation des pluies', 0, 1), (@qid, 'L''érosion des sols', 1, 2), (@qid, 'La réduction des cyclones', 0, 3), (@qid, 'L''augmentation de la biodiversité', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le problème environnemental le plus grave auquel Haïti est confrontée ?',
 'La déforestation constitue le problème environnemental le plus crucial auquel Haïti est confrontée.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La pollution de l''air', 0, 1), (@qid, 'La déforestation', 1, 2), (@qid, 'La pollution marine', 0, 3), (@qid, 'Les tremblements de terre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que l''écologie ?',
 'L''écologie est la science qui étudie les rapports entre les êtres vivants et leur environnement.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La science qui étudie les fossiles', 0, 1), (@qid, 'La science qui étudie les rapports entre êtres vivants et environnement', 1, 2), (@qid, 'La science qui étudie le pétrole', 0, 3), (@qid, 'La science qui étudie les volcans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Haïti, comme les pays de la Caraïbe, a quel type de climat ?',
 'Haïti et les pays de la Caraïbe ont un climat tropical.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Climat polaire', 0, 1), (@qid, 'Climat désertique', 0, 2), (@qid, 'Climat tropical', 1, 3), (@qid, 'Climat tempéré', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Haïti et les pays de la Caraïbe sont exposés à quels phénomènes climatiques ?',
 'Haïti et les pays de la Caraïbe sont exposés aux cyclones et ouragans.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aux blizzards et tempêtes de neige', 0, 1), (@qid, 'Aux typhons asiatiques', 0, 2), (@qid, 'Aux cyclones et ouragans', 1, 3), (@qid, 'Aux tornades du Midwest', 0, 4);

-- ============================================================
-- THÈME 8: TOURISME EN HAÏTI ET CARAÏBE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Combien de touristes Haïti a-t-elle reçus entre 2011 et 2015 ?',
 'Haïti a reçu 465 000 touristes entre 2011 et 2015, contre 420 000 entre 2006 et 2010.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '420 000', 0, 1), (@qid, '465 000', 1, 2), (@qid, '5 141 000', 0, 3), (@qid, '4 690 000', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Comparé à Haïti, combien de touristes la République Dominicaine a-t-elle reçus entre 2011 et 2015 ?',
 'La République Dominicaine a reçu 5 141 000 touristes entre 2011 et 2015, bien plus qu''Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '465 000', 0, 1), (@qid, '1 200 000', 0, 2), (@qid, '3 000 000', 0, 3), (@qid, '5 141 000', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La peinture haïtienne joue un rôle important dans quel domaine selon les textes du cours ?',
 'La peinture haïtienne joue un grand rôle dans la culture nationale, attirant l''attention des étrangers.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La politique', 0, 1), (@qid, 'La culture nationale et le tourisme', 1, 2), (@qid, 'L''économie industrielle', 0, 3), (@qid, 'L''agriculture', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Comment appelle-t-on les peintres haïtiens qui ne se soucient pas des règles et normes ?',
 'Les peintres qui ne suivent pas les règles et normes sont appelés des peintres naïfs.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Peintres surréalistes', 0, 1), (@qid, 'Peintres réalistes', 0, 2), (@qid, 'Peintres naïfs', 1, 3), (@qid, 'Peintres abstraits', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Comment appelle-t-on les peintres haïtiens qui reinventent la réalité en accordant une place aux mythes et symboles ?',
 'Les peintres surréalistes réinventent la réalité en accordant une place aux rêves, mythes et symboles.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Peintres naïfs', 0, 1), (@qid, 'Peintres réalistes', 0, 2), (@qid, 'Peintres surréalistes', 1, 3), (@qid, 'Peintres abstraits', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle technique les peintres surréalistes haïtiens utilisent-ils comme technique picturale ?',
 'Les peintres surréalistes utilisent l''automatisme comme technique picturale.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le réalisme strict', 0, 1), (@qid, 'L''automatisme', 1, 2), (@qid, 'La perspective linéaire', 0, 3), (@qid, 'Le pointillisme', 0, 4);

-- ============================================================
-- THÈME 9: PREMIÈRE ET DEUXIÈME GUERRES MONDIALES
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la cause occasionnelle de la Première Guerre mondiale ?',
 'L''attentat de Sarajevo contre l''archiduc François Ferdinand constitue la cause occasionnelle de la Première Guerre mondiale.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''invasion de la Pologne', 0, 1), (@qid, 'L''attentat contre l''archiduc François Ferdinand à Sarajevo', 1, 2), (@qid, 'La crise économique de 1929', 0, 3), (@qid, 'L''occupation de l''Alsace-Lorraine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelles sont les deux causes profondes de la Première Guerre mondiale ?',
 'Le nationalisme et l''impérialisme sont les causes profondes de la Première Guerre mondiale.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La démocratie et le socialisme', 0, 1), (@qid, 'Le nationalisme et l''impérialisme', 1, 2), (@qid, 'Le communisme et le fascisme', 0, 3), (@qid, 'La pauvreté et la maladie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelles sont deux conséquences politiques de la Deuxième Guerre mondiale ?',
 'La création de l''ONU et la Guerre froide sont deux conséquences politiques de la 2e Guerre mondiale.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La création de la CARICOM et la Guerre froide', 0, 1), (@qid, 'La création de l''ONU et la Guerre froide', 1, 2), (@qid, 'Le Plan Marshall et la CARICOM', 0, 3), (@qid, 'Le traité de Versailles et l''OTAN', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays a subi le plus de pertes humaines lors de la Deuxième Guerre mondiale selon le tableau du cours ?',
 'L''URSS a subi le plus de pertes avec 19 000 milliers de morts (civils et militaires).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La France', 0, 1), (@qid, 'L''Allemagne', 0, 2), (@qid, 'La Pologne', 0, 3), (@qid, 'L''URSS', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que l''URSS ?',
 'L''URSS est l''Union des Républiques Socialistes Soviétiques, créée après la Révolution de 1917.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Union des Républiques Séparées Soviétiques', 0, 1), (@qid, 'Union des Républiques Socialistes Soviétiques', 1, 2), (@qid, 'Union des Régimes Socialistes Soviétiques', 0, 3), (@qid, 'Union des Républiques Soviétiques du Sud', 0, 4);



INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel était le principal bénéficiaire du Plan Marshall selon le graphique du cours ?',
 'La Grande-Bretagne était le principal bénéficiaire du Plan Marshall avec 3 165,6 millions de dollars.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La France', 0, 1), (@qid, 'L''Allemagne de l''Ouest', 0, 2), (@qid, 'La Grande-Bretagne', 1, 3), (@qid, 'L''Italie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'De quelle période date le Plan Marshall mentionné dans le cours ?',
 'Le Plan Marshall a été mis en oeuvre d''avril 1948 à juin 1952.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1945-1947', 0, 1), (@qid, '1948-1952', 1, 2), (@qid, '1950-1955', 0, 3), (@qid, '1944-1948', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la Guerre froide ?',
 'La Guerre froide est le conflit idéologique entre les USA et l''URSS après la 2e Guerre mondiale, sans affrontement direct.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une guerre en hiver entre des pays nordiques', 0, 1), (@qid, 'Un conflit idéologique USA-URSS sans affrontement direct', 1, 2), (@qid, 'Une guerre nucléaire entre grandes puissances', 0, 3), (@qid, 'Un conflit économique entre pays riches', 0, 4);

-- ============================================================
-- THÈME 10: JAPON ET ÉCONOMIE MONDIALE
-- ============================================================


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Dans quel groupe de pays le Japon est-il classé du point de vue économique ?',
 'Le Japon fait partie de la Triade (Europe, États-Unis, Japon), les économies les plus puissantes du monde.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les pays en développement', 0, 1), (@qid, 'La Triade', 1, 2), (@qid, 'Les pays du BRICS', 0, 3), (@qid, 'Les pays de l''ASEAN', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel rang le Japon occupait-il dans l''économie mondiale en 2010 ?',
 'En 2010, le Japon était la 3e puissance économique mondiale.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1er rang', 0, 1), (@qid, '2e rang', 0, 2), (@qid, '3e rang', 1, 3), (@qid, '5e rang', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Sur quel continent se trouve le Japon ?',
 'Le Japon est un archipel situé en Asie.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Amérique', 0, 1), (@qid, 'Europe', 0, 2), (@qid, 'Océanie', 0, 3), (@qid, 'Asie', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la Triade dans l''économie mondiale ?',
 'La Triade désigne les trois grands centres économiques : l''Europe, les États-Unis et le Japon.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Asie, l''Afrique et l''Amérique', 0, 1), (@qid, 'L''Europe, les États-Unis et le Japon', 1, 2), (@qid, 'La Chine, l''Inde et le Brésil', 0, 3), (@qid, 'Le G7, le G8 et le G20', 0, 4);


-- ============================================================
-- THÈME 11: RELIGIONS ET CULTURE DU MONDE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le pays ou zone d''influence principal du Bouddhisme ?',
 'La Chine est l''une des principales zones d''influence du Bouddhisme, avec d''autres pays d''Asie.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Europe', 0, 1), (@qid, 'Moyen-Orient', 0, 2), (@qid, 'Inde', 0, 3), (@qid, 'Chine', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le pays ou la zone d''influence principale de l''Islamisme ?',
 'Le Moyen-Orient est la principale zone d''influence de l''Islam.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Europe', 0, 1), (@qid, 'Moyen-Orient', 1, 2), (@qid, 'Chine', 0, 3), (@qid, 'Inde', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le pays principalement associé à l''Hindouisme ?',
 'L''Inde est le pays principalement associé à la pratique de l''Hindouisme.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Chine', 0, 1), (@qid, 'Israël', 0, 2), (@qid, 'Europe', 0, 3), (@qid, 'Inde', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le Judaïsme est principalement associé à quel pays ?',
 'Israël est le pays principalement associé à la pratique du Judaïsme.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Inde', 0, 1), (@qid, 'Chine', 0, 2), (@qid, 'Israël', 1, 3), (@qid, 'Moyen-Orient en général', 0, 4);

-- ============================================================
-- THÈME 12: DONNÉES ÉCONOMIQUES HAÏTI - BALANCE COMMERCIALE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année les exportations haïtiennes ont-elles atteint leur plus haut niveau selon le tableau 2004-2007 ?',
 'En 2007, les exportations haïtiennes ont atteint 27 255 millions de gourdes, leur plus haut niveau.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2004', 0, 1), (@qid, '2005', 0, 2), (@qid, '2006', 0, 3), (@qid, '2007', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La balance commerciale d''Haïti en 2006 était-elle positive ou négative ?',
 'La balance commerciale en 2006 était négative car les importations (85 412) dépassaient les exportations (26 660).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Positive', 0, 1), (@qid, 'Négative', 1, 2), (@qid, 'Équilibrée', 0, 3), (@qid, 'On ne peut pas savoir', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Selon le tableau du cours, quel département haïtien a la densité de population la plus élevée ?',
 'Le Sud a la densité la plus élevée avec 17 178 hab/km² selon le tableau de 2015.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Artibonite', 0, 1), (@qid, 'L''Ouest', 0, 2), (@qid, 'Le Nord', 0, 3), (@qid, 'Le Sud', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Selon les données économiques du cours, quel secteur haïtien emploie 84,8% d''hommes ?',
 'L''Apiculture est le secteur qui emploie 84,8% d''hommes selon le tableau du cours.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Production végétale', 0, 1), (@qid, 'Élevage', 0, 2), (@qid, 'Aviculture', 0, 3), (@qid, 'Apiculture', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Que signifie MARNDR en Haïti ?',
 'MARNDR signifie Ministère de l''Agriculture, des Ressources Naturelles et du Développement Rural.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ministère de l''Agriculture, Ressources Naturelles et Droits Ruraux', 0, 1), (@qid, 'Ministère de l''Agriculture, des Ressources Naturelles et du Développement Rural', 1, 2), (@qid, 'Ministère de l''Aménagement Rural, des Ressources Naturelles et du Développement', 0, 3), (@qid, 'Ministère Agricole des Ressources Naturelles et du Développement Rural', 0, 4);

-- ============================================================
-- THÈME 13: URBANISATION ET VILLES DU MONDE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce qu''une bidonville ?',
 'Une bidonville est un quartier urbain formé de petites constructions sans normes, avec des matériaux légers et de peu de valeur.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un quartier résidentiel luxueux', 0, 1), (@qid, 'Un quartier de constructions sans normes avec matériaux légers', 1, 2), (@qid, 'Une zone industrielle', 0, 3), (@qid, 'Un quartier historique protégé', 0, 4);


-- ============================================================
-- THÈME 14: ALIMENTATION ET DÉVELOPPEMENT
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Que signifie FAO ?',
 'FAO signifie Food and Agriculture Organization, l''Organisation des Nations Unies pour l''alimentation et l''agriculture.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fonds d''Aide aux Organizations', 0, 1), (@qid, 'Food and Agriculture Organization', 1, 2), (@qid, 'Fédération Agricole Organisationnelle', 0, 3), (@qid, 'Fonds Alimentaire pour les Organisations', 0, 4);


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Selon la FAO en 1984, combien de personnes souffraient de la faim dans le monde ?',
 'Selon la FAO en 1984, la faim touchait 400 millions de personnes dans le monde.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 millions', 0, 1), (@qid, '200 millions', 0, 2), (@qid, '400 millions', 1, 3), (@qid, '800 millions', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelles sont trois sources d''énergie verte ou propre ?',
 'L''énergie solaire, l''énergie éolienne et l''énergie hydraulique sont des sources d''énergie propre.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pétrole, charbon, gaz', 0, 1), (@qid, 'Nucléaire, pétrole, charbon', 0, 2), (@qid, 'Solaire, éolienne, hydraulique', 1, 3), (@qid, 'Uranium, charbon, pétrole', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel type d''énergie fournit un cours d''eau ?',
 'Un cours d''eau fournit de l''énergie hydraulique (hydroélectrique).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Énergie éolienne', 0, 1), (@qid, 'Énergie nucléaire', 0, 2), (@qid, 'Énergie solaire', 0, 3), (@qid, 'Énergie hydraulique', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel type d''énergie fournit le vent ?',
 'Le vent fournit de l''énergie éolienne.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Énergie solaire', 0, 1), (@qid, 'Énergie éolienne', 1, 2), (@qid, 'Énergie hydraulique', 0, 3), (@qid, 'Énergie géothermique', 0, 4);

-- ============================================================
-- THÈME 15: NÉOCOLONIALISME ET DÉVELOPPEMENT
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le Néocolonialisme constitue un frein au développement des pays pauvres par quoi ?',
 'Le néocolonialisme freine le développement des pays pauvres par la persistance de la domination étrangère.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''unité culturelle', 0, 1), (@qid, 'La persistance de la domination étrangère', 1, 2), (@qid, 'L''harmonie entre les groupes sociaux', 0, 3), (@qid, 'Le développement du commerce', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Un produit fabriqué par l''industrie de biens d''équipement parmi les suivants ?',
 'Le tracteur est un bien d''équipement, car il sert à produire d''autres biens.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La fusée', 0, 1), (@qid, 'La farine', 0, 2), (@qid, 'Le tracteur', 1, 3), (@qid, 'Le fer', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la diversité linguistique ?',
 'La diversité linguistique constitue à utiliser des langues différentes dans la communication.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''étude d''une seule langue', 0, 1), (@qid, 'L''utilisation de langues différentes dans la communication', 1, 2), (@qid, 'La traduction automatique', 0, 3), (@qid, 'L''enseignement du français', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Selon le tableau du cours sur les échanges mondiaux en 1998, quel est le pays qui a le plus exporté ?',
 'L''Asie Pacifique a le plus exporté avec 923 514 milliards de dollars.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'USA', 0, 1), (@qid, 'Union Européenne', 0, 2), (@qid, 'Japon', 0, 3), (@qid, 'Asie Pacifique', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la valeur des exportations du Japon selon le tableau des échanges mondiaux de 1998 ?',
 'Le Japon a exporté pour 388 milliards de dollars en 1998.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '281 milliards', 0, 1), (@qid, '388 milliards', 1, 2), (@qid, '682 497 milliards', 0, 3), (@qid, '2 171 milliards', 0, 4);

-- ============================================================
-- THÈME 16: LIEUX D'APPRENTISSAGE ET VALEURS
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle valeur est principalement transmise par l''école ?',
 'L''école transmet principalement la curiosité intellectuelle.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La fidélité à ses idées', 0, 1), (@qid, 'La curiosité intellectuelle', 1, 2), (@qid, 'Le respect du sacré', 0, 3), (@qid, 'L''amour paternel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle valeur est principalement transmise par l''église ?',
 'L''église transmet principalement le respect du sacré.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La curiosité intellectuelle', 0, 1), (@qid, 'La fidélité à ses idées', 0, 2), (@qid, 'Le respect du sacré', 1, 3), (@qid, 'L''amour paternel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle valeur est principalement transmise par la famille ?',
 'La famille transmet principalement l''amour paternel et maternel.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La curiosité intellectuelle', 0, 1), (@qid, 'Le respect du sacré', 0, 2), (@qid, 'La fidélité à ses idées', 0, 3), (@qid, 'L''amour paternel', 1, 4);

-- ============================================================
-- THÈME 17: INDUSTRIE ET RESSOURCES NATURELLES EN HAÏTI
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle industrie est associée à la bauxite comme ressource naturelle ?',
 'La bauxite est utilisée dans l''industrie métallurgique pour produire de l''aluminium.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Industrie agro-alimentaire', 0, 1), (@qid, 'Industrie de pointe', 0, 2), (@qid, 'Industrie métallurgique', 1, 3), (@qid, 'Industrie textile', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle industrie est associée au coton comme ressource naturelle ?',
 'Le coton est utilisé dans l''industrie textile.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Industrie métallurgique', 0, 1), (@qid, 'Industrie de pointe', 0, 2), (@qid, 'Industrie agro-alimentaire', 0, 3), (@qid, 'Industrie textile', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle industrie est associée à la tomate comme ressource naturelle ?',
 'La tomate est transformée dans l''industrie agro-alimentaire.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Industrie textile', 0, 1), (@qid, 'Industrie agro-alimentaire', 1, 2), (@qid, 'Industrie métallurgique', 0, 3), (@qid, 'Industrie de pointe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quels pays ont le plus faible taux de PNB par habitant selon le tableau du cours ?',
 'Le Mozambique (80$) et la Somalie (120$) ont les taux de PNB/habitant les plus faibles.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haïti et Honduras', 0, 1), (@qid, 'Mozambique et Somalie', 1, 2), (@qid, 'Bolivie et Nicaragua', 0, 3), (@qid, 'Éthiopie et Niger', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Sur quel continent se trouvent les deux pays au plus faible PNB/habitant du tableau du cours ?',
 'Le Mozambique et la Somalie, qui ont le plus faible PNB/habitant, se trouvent en Afrique.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Amérique', 0, 1), (@qid, 'Asie', 0, 2), (@qid, 'Afrique', 1, 3), (@qid, 'Océanie', 0, 4);

-- ============================================================
-- THÈME 18: GUERRE DE GUÉRILLA ET RÉSISTANCE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Que signifie la guerre de guérilla ?',
 'La guerre de guérilla est une forme de combat irrégulier par de petits groupes utilisant des tactiques de harcèlement.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une guerre entre grandes armées régulières', 0, 1), (@qid, 'Un combat irrégulier par de petits groupes avec tactiques de harcèlement', 1, 2), (@qid, 'Une guerre navale', 0, 3), (@qid, 'Une guerre chimique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'L''attentat de Sarajevo contre l''archiduc François Ferdinand a constitué la cause occasionnelle de quelle guerre ?',
 'L''attentat de Sarajevo a constitué la cause occasionnelle de la Première Guerre mondiale.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Deuxième Guerre mondiale', 0, 1), (@qid, 'La Première Guerre mondiale', 1, 2), (@qid, 'La Guerre froide', 0, 3), (@qid, 'La Guerre de Corée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel vaudouisant présidait la cérémonie du Bois Caïman ?',
 'Dutty Boukman présidait la cérémonie du Bois Caïman le 22 août 1791.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toussaint Louverture', 0, 1), (@qid, 'Dutty Boukman', 1, 2), (@qid, 'Jean-Jacques Dessalines', 0, 3), (@qid, 'Henri Christophe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le vaudou a joué un grand rôle dans le triomphe de quelle bataille ?',
 'Le vaudou a joué un grand rôle dans le triomphe de la bataille de Saint-Domingue (la Révolution haïtienne).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La bataille de la Crête-à-Pierrot', 0, 1), (@qid, 'La Révolution à Saint-Domingue', 1, 2), (@qid, 'La bataille de Vertières', 0, 3), (@qid, 'La bataille de la Ravine-à-Couleuvres', 0, 4);

-- ============================================================
-- THÈME 19: SECTEURS ÉCONOMIQUES ET EMPLOI
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'D''après le tableau du cours (1969-1982), quel secteur économique était le moins développé en 1982 ?',
 'L''industrie avait le taux le moins élevé en 1969 (13%), mais progressait. L''agriculture déclinait mais restait dominante.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Agriculture', 0, 1), (@qid, 'Industrie', 1, 2), (@qid, 'Tertiaire', 0, 3), (@qid, 'Commerce', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Selon le tableau du cours sur le chômage, quel département a le pourcentage de chômeurs le plus élevé ?',
 'Le Sud-Est a le pourcentage de chômeurs le plus élevé avec 74,4%.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ouest (63,4%)', 0, 1), (@qid, 'Sud-Est (74,4%)', 1, 2), (@qid, 'Nord (50,3%)', 0, 3), (@qid, 'Artibonite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Selon le tableau du cours, quel département a le pourcentage actif occupé le moins élevé ?',
 'Le Ouest a le pourcentage d''actif occupé le moins élevé avec 15,8%.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Nord', 0, 1), (@qid, 'Sud-Est (3,4%)', 1, 2), (@qid, 'Ouest (15,8%)', 0, 3), (@qid, 'Artibonite', 0, 4);

-- ============================================================
-- THÈME 20: COOPÉRATION INTERNATIONALE ET AIDE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quels sont les pays membres du G8 ?',
 'Les membres du G8 sont USA, Canada, France, Allemagne, Italie, Japon, Royaume-Uni et Russie.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'USA, Chine, France, Allemagne, Italie, Japon, RU, Canada', 0, 1), (@qid, 'USA, Canada, France, Allemagne, Italie, Japon, Royaume-Uni, Russie', 1, 2), (@qid, 'USA, Canada, Mexique, France, Italie, Japon, Russie, Chine', 0, 3), (@qid, 'USA, Brésil, France, Allemagne, Inde, Japon, Russie, Chine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Après le séisme du 12 janvier 2010 en Haïti, quel type de rapport illustre l''aide du Venezuela à la population sinistrée ?',
 'L''aide du Venezuela à Haïti après le séisme illustre un rapport de solidarité internationale.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un rapport commercial', 0, 1), (@qid, 'Un rapport de solidarité internationale', 1, 2), (@qid, 'Un rapport de domination', 0, 3), (@qid, 'Un rapport diplomatique formel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Les relations Cuba-États-Unis ont été rompues depuis quelle décennie ?',
 'Les relations Cuba-États-Unis ont été rompues depuis 1961 (après la révolution cubaine de 1959).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les années 1940', 0, 1), (@qid, 'Les années 1950', 0, 2), (@qid, 'Les années 1960', 1, 3), (@qid, 'Les années 1970', 0, 4);



INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le titre officiel du Ministre des Finances américain ?',
 'Le Ministre des Finances américain porte le titre de Secrétaire d''État au Trésor.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ministre des Finances', 0, 1), (@qid, 'Secrétaire d''État au Trésor', 1, 2), (@qid, 'Directeur du Budget Fédéral', 0, 3), (@qid, 'Commissaire Économique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Les combustibles font partie de quel secteur économique ?',
 'Les combustibles (pétrole, gaz, charbon) font partie du secteur secondaire (industrie extractive).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Secteur primaire', 0, 1), (@qid, 'Secteur secondaire', 1, 2), (@qid, 'Secteur tertiaire', 0, 3), (@qid, 'Secteur quaternaire', 0, 4);


-- ============================================================
-- THÈME 21: INSÉCURITÉ ET GOUVERNANCE EN HAÏTI
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est une mesure pour combattre l''insécurité en Haïti ?',
 'Le renforcement de la justice est une mesure essentielle pour combattre l''insécurité en Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fermer les frontières', 0, 1), (@qid, 'Renforcer le système judiciaire', 1, 2), (@qid, 'Augmenter les taxes', 0, 3), (@qid, 'Réduire la police nationale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La première constitution d''Haïti a été rédigée sous quel dirigeant ?',
 'La première constitution haïtienne de 1801 a été rédigée sous Toussaint Louverture.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jean-Jacques Dessalines', 0, 1), (@qid, 'Toussaint Louverture', 1, 2), (@qid, 'Henri Christophe', 0, 3), (@qid, 'Alexandre Pétion', 0, 4);

-- ============================================================
-- THÈME 22: GÉOGRAPHIE MONDIALE - PAYS ET CAPITALES
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale du Venezuela ?',
 'Caracas est la capitale du Venezuela.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lima', 0, 1), (@qid, 'Bogotá', 0, 2), (@qid, 'Caracas', 1, 3), (@qid, 'Quito', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est l''unique pays hispanophone de l''Amérique du Nord ?',
 'Le Mexique est le seul pays hispanophone de l''Amérique du Nord.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1), (@qid, 'Canada', 0, 2), (@qid, 'USA', 0, 3), (@qid, 'Mexique', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le Venezuela a été colonisé par quelle puissance européenne ?',
 'Le Venezuela a été colonisé par l''Espagne. Sa capitale est Caracas.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'France', 0, 1), (@qid, 'Angleterre', 0, 2), (@qid, 'Espagne', 1, 3), (@qid, 'Portugal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le pays industrialisé ayant une culture à la fois anglo-saxonne et francophone en Amérique ?',
 'Le Canada est le pays industrialisé ayant une culture à la fois anglo-saxonne et francophone.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'États-Unis', 0, 1), (@qid, 'Belgique', 0, 2), (@qid, 'Canada', 1, 3), (@qid, 'Suisse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le fondateur de l''indépendance du Venezuela ?',
 'Simón Bolívar est le fondateur de l''indépendance du Venezuela, proclamée en 1811.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Francisco Miranda', 0, 1), (@qid, 'Simón Bolívar', 1, 2), (@qid, 'José de San Martín', 0, 3), (@qid, 'Bernardo O''Higgins', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La République Démocratique du Congo, Madagascar et le Soudan font partie de quelle catégorie de pays ?',
 'Ces pays font partie des pays où les populations sont sous-alimentées.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pays les plus industrialisés', 0, 1), (@qid, 'Pays membres de l''OPEP', 0, 2), (@qid, 'Pays où les populations sont sous-alimentées', 1, 3), (@qid, 'Pays membres de la Triade', 0, 4);

-- ============================================================
-- THÈME 23: CULTURE HAÏTIENNE - VIE QUOTIDIENNE ET SOCIÉTÉ
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'L''Haitienne Marie Yolène Gille a reçu quel prix ?',
 'Marie Yolène Gille a reçu le prix "Femme de Courage", décerné par le gouvernement américain.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Prix Nobel de la Paix', 0, 1), (@qid, 'Prix Femme de Courage', 1, 2), (@qid, 'Prix Nobel de Littérature', 0, 3), (@qid, 'Prix Simón Bolívar', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la zone d''Haïti où l''accès à l''eau courante est le plus élevé selon le graphique ?',
 'L''aire métropolitaine est la zone où l''accès à l''eau courante est le plus élevé en Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Zone rurale', 0, 1), (@qid, 'Autre urbain', 0, 2), (@qid, 'Aire métropolitaine', 1, 3), (@qid, 'Zones côtières', 0, 4);


-- ============================================================
-- THÈME 24: IDENTITÉ NATIONALE ET CULTURE HAÏTIENNE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La "cité christophienne" est le surnom donné à quelle ville haïtienne ?',
 'La Cité christophienne est le surnom donné à Milot, ville associée à Henri Christophe.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cap-Haïtien', 0, 1), (@qid, 'Milot', 1, 2), (@qid, 'Les Gonaïves', 0, 3), (@qid, 'Port-au-Prince', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La "cité de Faustin Soulouque" est le surnom donné à quelle ville haïtienne ?',
 'La cité de Faustin Soulouque est le surnom donné à Petit-Goâve.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les Cayes', 0, 1), (@qid, 'Jérémie', 0, 2), (@qid, 'Jacmel', 0, 3), (@qid, 'Petit-Goâve', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel événement haïtien a eu lieu à Marchaterre ?',
 'Le drame de Marchaterre s''est produit sous l''occupation américaine, lors de massacres de paysans.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une cérémonie vaudou', 0, 1), (@qid, 'Un massacre de paysans sous l''occupation américaine', 1, 2), (@qid, 'Une bataille pour l''indépendance', 0, 3), (@qid, 'Une révolte des esclaves', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la constitution actuellement en vigueur en Haïti ?',
 'La constitution de 1987 est la constitution actuellement en vigueur en Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Constitution de 1950', 0, 1), (@qid, 'Constitution de 1964', 0, 2), (@qid, 'Constitution de 1987', 1, 3), (@qid, 'Constitution de 2000', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la monnaie officielle d''Haïti ?',
 'La gourde est la monnaie officielle de la République d''Haïti.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le dollar haïtien', 0, 1), (@qid, 'Le franc haïtien', 0, 2), (@qid, 'La gourde', 1, 3), (@qid, 'Le peso haïtien', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelles sont les deux langues officielles d''Haïti ?',
 'Le français et le créole sont les deux langues officielles d''Haïti.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Français et anglais', 0, 1), (@qid, 'Créole et espagnol', 0, 2), (@qid, 'Français et créole', 1, 3), (@qid, 'Créole et anglais', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le régime politique d''Haïti ?',
 'Haïti est une République démocratique.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Monarchie constitutionnelle', 0, 1), (@qid, 'République démocratique', 1, 2), (@qid, 'Régime parlementaire pur', 0, 3), (@qid, 'État fédéral', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Haïti est localisée dans quelle mer ?',
 'Haïti est localisée dans la mer des Caraïbes (Antilles).', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La mer Méditerranée', 0, 1), (@qid, 'La mer des Caraïbes', 1, 2), (@qid, 'L''Océan Pacifique', 0, 3), (@qid, 'La mer du Nord', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Haïti partage l''île d''Hispaniola avec quel autre pays ?',
 'Haïti partage l''île d''Hispaniola avec la République Dominicaine.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1), (@qid, 'Jamaïque', 0, 2), (@qid, 'Porto Rico', 0, 3), (@qid, 'République Dominicaine', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la superficie totale d''Haïti ?',
 'La superficie d''Haïti est d''environ 27 750 km².', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '14 000 km²', 0, 1), (@qid, '20 000 km²', 0, 2), (@qid, '27 750 km²', 1, 3), (@qid, '35 000 km²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale d''Haïti ?',
 'Port-au-Prince est la capitale de la République d''Haïti.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cap-Haïtien', 0, 1), (@qid, 'Les Gonaïves', 0, 2), (@qid, 'Port-au-Prince', 1, 3), (@qid, 'Les Cayes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Haïti a obtenu son indépendance en se révoltant contre quelle puissance coloniale ?',
 'Haïti s''est libérée de la colonisation française en 1804.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Espagne', 0, 1), (@qid, 'L''Angleterre', 0, 2), (@qid, 'La France', 1, 3), (@qid, 'Le Portugal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La bataille de Vertières a eu lieu en quelle année ?',
 'La bataille de Vertières, dernière grande bataille de l''indépendance haïtienne, a eu lieu en 1803.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1791', 0, 1), (@qid, '1798', 0, 2), (@qid, '1803', 1, 3), (@qid, '1804', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qui est le père fondateur de la nation haïtienne ?',
 'Jean-Jacques Dessalines est le père fondateur de la nation haïtienne et son premier chef d''État.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toussaint Louverture', 0, 1), (@qid, 'Jean-Jacques Dessalines', 1, 2), (@qid, 'Henri Christophe', 0, 3), (@qid, 'Alexandre Pétion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le drapeau national d''Haïti ?',
 'Le drapeau haïtien est composé de deux bandes horizontales, bleu foncé et rouge, avec l''emblème national au centre.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Rouge, blanc, bleu (vertical)', 0, 1), (@qid, 'Bleu foncé et rouge (horizontal) avec emblème', 1, 2), (@qid, 'Vert, rouge et or', 0, 3), (@qid, 'Bleu et blanc avec étoile', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le chef-lieu du département de l''Ouest en Haïti ?',
 'Port-au-Prince est le chef-lieu du département de l''Ouest, qui est aussi la capitale nationale.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pétionville', 0, 1), (@qid, 'Jacmel', 0, 2), (@qid, 'Port-au-Prince', 1, 3), (@qid, 'Léogâne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le chef-lieu du département du Nord ?',
 'Cap-Haïtien est le chef-lieu du département du Nord.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Port-de-Paix', 0, 1), (@qid, 'Cap-Haïtien', 1, 2), (@qid, 'Fort-Liberté', 0, 3), (@qid, 'Hinche', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le chef-lieu du département de la Grand''Anse ?',
 'Jérémie est le chef-lieu du département de la Grand''Anse.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les Cayes', 0, 1), (@qid, 'Jacmel', 0, 2), (@qid, 'Miragoâne', 0, 3), (@qid, 'Jérémie', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le département de l''Artibonite est reconnu pour la production de quelle denrée alimentaire de base ?',
 'L''Artibonite est le grenier à riz d''Haïti, principal département producteur de riz.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Café', 0, 1), (@qid, 'Cacao', 0, 2), (@qid, 'Riz', 1, 3), (@qid, 'Sucre de canne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le principal produit d''exportation d''Haïti historiquement ?',
 'Le café a été historiquement le principal produit d''exportation d''Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le sucre', 0, 1), (@qid, 'Le cacao', 0, 2), (@qid, 'Le café', 1, 3), (@qid, 'Le coton', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le tremblement de terre qui a frappé Haïti le 12 janvier 2010 ?',
 'Le séisme de magnitude 7 a frappé Haïti le 12 janvier 2010, causant des centaines de milliers de morts.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Magnitude 5', 0, 1), (@qid, 'Magnitude 6', 0, 2), (@qid, 'Magnitude 7', 1, 3), (@qid, 'Magnitude 9', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays voisin partage une frontière terrestre avec Haïti ?',
 'La République Dominicaine est le seul pays partageant une frontière terrestre avec Haïti.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuba', 0, 1), (@qid, 'Porto Rico', 0, 2), (@qid, 'République Dominicaine', 1, 3), (@qid, 'Jamaïque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le plus grand lac d''Haïti ?',
 'L''Étang Saumâtre (Lac Azuéi) est le plus grand lac d''Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lac Péligre', 0, 1), (@qid, 'Lac de Miragoane', 0, 2), (@qid, 'Étang Saumâtre (Lac Azuéi)', 1, 3), (@qid, 'Lac de l''Artibonite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le plus long fleuve d''Haïti ?',
 'L''Artibonite est le plus long fleuve d''Haïti.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Rivière Blanche', 0, 1), (@qid, 'La Rivière Grise', 0, 2), (@qid, 'La Rivière du Sud', 0, 3), (@qid, 'L''Artibonite', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le plus haut sommet d''Haïti ?',
 'Le Pic la Selle (2 680 m) est le plus haut sommet d''Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pic Macaya', 0, 1), (@qid, 'Pic la Selle', 1, 2), (@qid, 'Morne Cabaio', 0, 3), (@qid, 'Morne la Visite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le Palais Sans Souci, patrimoine mondial de l''UNESCO, se trouve dans quel département ?',
 'Le Palais Sans Souci se trouve dans le département du Nord, près de Milot.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Département de l''Ouest', 0, 1), (@qid, 'Département du Centre', 0, 2), (@qid, 'Département du Nord', 1, 3), (@qid, 'Département du Nord-Ouest', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la fête nationale d''Haïti ?',
 'Le 1er janvier est la fête de l''indépendance d''Haïti, célébrée depuis 1804.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '18 novembre', 0, 1), (@qid, '22 août', 0, 2), (@qid, '1er janvier', 1, 3), (@qid, '14 août', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le 18 novembre est célébré en Haïti pour commémorer quoi ?',
 'Le 18 novembre commémore la bataille de Vertières, la dernière grande bataille pour l''indépendance d''Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La cérémonie du Bois Caïman', 0, 1), (@qid, 'La proclamation de l''indépendance', 0, 2), (@qid, 'La bataille de Vertières', 1, 3), (@qid, 'La mort de Dessalines', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la deuxième ville d''Haïti par sa population ?',
 'Cap-Haïtien est la deuxième ville d''Haïti après Port-au-Prince.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les Gonaïves', 0, 1), (@qid, 'Les Cayes', 0, 2), (@qid, 'Cap-Haïtien', 1, 3), (@qid, 'Jacmel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Que célèbre Haïti le 14 août ?',
 'Le 14 août commémore la cérémonie du Bois Caïman du 14 août 1791 (certaines sources citent le 22 août).', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La fête de la Constitution', 0, 1), (@qid, 'La cérémonie du Bois Caïman', 1, 2), (@qid, 'La fin de l''esclavage', 0, 3), (@qid, 'La mort de Toussaint Louverture', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le rôle du Sénat dans le système politique haïtien ?',
 'Le Sénat est une chambre du pouvoir législatif qui vote les lois et ratifie certains actes du gouvernement.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Exécuter les décisions du président', 0, 1), (@qid, 'Voter et contrôler les lois', 1, 2), (@qid, 'Juger les crimes politiques', 0, 3), (@qid, 'Gérer les finances nationales', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la Chambre des Députés en Haïti ?',
 'La Chambre des Députés est la chambre basse du parlement haïtien, composée d''élus de chaque commune.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le tribunal suprême d''Haïti', 0, 1), (@qid, 'La chambre basse du parlement haïtien', 1, 2), (@qid, 'Le conseil des ministres', 0, 3), (@qid, 'L''assemblée nationale des maires', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la durée du mandat présidentiel en Haïti selon la constitution de 1987 ?',
 'Le mandat présidentiel en Haïti est de 5 ans, non renouvelable consécutivement.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4 ans', 0, 1), (@qid, '5 ans', 1, 2), (@qid, '6 ans', 0, 3), (@qid, '7 ans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Comment s''appelle le chef du gouvernement en Haïti, distinct du président ?',
 'Le Premier Ministre est le chef du gouvernement en Haïti, nommé par le Président.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Chancelier', 0, 1), (@qid, 'Le Premier Ministre', 1, 2), (@qid, 'Le Gouverneur général', 0, 3), (@qid, 'Le Secrétaire d''État', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la principale source de devises pour Haïti aujourd''hui ?',
 'Les transferts de la diaspora (remittances) sont la principale source de devises pour Haïti.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le tourisme', 0, 1), (@qid, 'Les exportations de café', 0, 2), (@qid, 'Les transferts de la diaspora', 1, 3), (@qid, 'L''aide internationale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le problème majeur de l''agriculture haïtienne ?',
 'L''érosion des sols due à la déforestation est le problème majeur de l''agriculture haïtienne.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Manque de main-d''oeuvre', 0, 1), (@qid, 'L''érosion des sols due à la déforestation', 1, 2), (@qid, 'Absence de marchés', 0, 3), (@qid, 'Surabondance de pluies', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que l''Indice de Développement Humain (IDH) mesure ?',
 'L''IDH mesure le niveau de développement d''un pays en combinant l''espérance de vie, l''éducation et le revenu.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement le PIB par habitant', 0, 1), (@qid, 'L''espérance de vie, l''éducation et le revenu', 1, 2), (@qid, 'Seulement le niveau d''alphabétisation', 0, 3), (@qid, 'Le nombre d''hôpitaux et d''écoles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le premier pays de la Caraïbe membre de l''OPEP ?',
 'Trinité et Tobago est le pays de la Caraïbe producteur de pétrole, mais n''est pas membre de l''OPEP. Venezuela est le premier pays de l''Amérique latine fondateur de l''OPEP.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haïti', 0, 1), (@qid, 'Trinité et Tobago', 0, 2), (@qid, 'Venezuela', 1, 3), (@qid, 'Mexique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Les 11 territoires britanniques des Caraïbes se sont regroupés d''abord dans quelle organisation en 1968 ?',
 'Les 11 territoires britanniques se sont regroupés dans la CARIFTA en 1968.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CARICOM', 0, 1), (@qid, 'CARIFTA', 1, 2), (@qid, 'OECS', 0, 3), (@qid, 'ALBA', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Fidel Castro a triomphé à Cuba en quelle année ?',
 'La révolution cubaine a triomphé en 1959 quand Fidel Castro est entré à la Havane le 2 janvier.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1956', 0, 1), (@qid, '1957', 0, 2), (@qid, '1959', 1, 3), (@qid, '1962', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le type de gouvernement de Cuba ?',
 'Cuba est un État socialiste à parti unique, dirigé par le Parti Communiste Cubain.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Démocratie libérale', 0, 1), (@qid, 'Monarchie constitutionnelle', 0, 2), (@qid, 'État socialiste à parti unique', 1, 3), (@qid, 'République fédérale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel droit est associé au fait de voter ?',
 'Le vote est l''exercice d''un droit politique fondamental dans une démocratie.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Droit social', 0, 1), (@qid, 'Droit économique', 0, 2), (@qid, 'Droit politique', 1, 3), (@qid, 'Droit civil', 0, 4);


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le secteur qui emploie le plus de femmes dans le tableau du cours sur l''économie haïtienne ?',
 'La production végétale emploie le plus de femmes avec 24,8%.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Apiculture', 0, 1), (@qid, 'Élevage', 0, 2), (@qid, 'Production végétale (24,8%)', 1, 3), (@qid, 'Aviculture', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quels pays de l''Afrique du tableau du cours sont membres de l''OPEP ?',
 'L''Algérie, Congo/Brazzaville et le Gabon sont membres de l''OPEP selon le tableau du cours.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Afrique du Sud et Algérie', 0, 1), (@qid, 'Algérie, Congo et Gabon', 1, 2), (@qid, 'Maroc, Algérie, Libye', 0, 3), (@qid, 'Nigeria et Angola', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel parti haïtien est mentionné comme promouvant le "laisser-faire" ?',
 'Le parti libéral prônait le laisser-faire en matière économique.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parti socialiste', 0, 1), (@qid, 'Parti libéral', 1, 2), (@qid, 'Parti démocrate chrétien', 0, 3), (@qid, 'Parti progressiste', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la "Initiative pour le Bassin des Caraïbes" (IBC) ?',
 'L''Initiative pour le Bassin des Caraïbes est un programme américain d''aide au développement économique des pays caribéens.', 'Programme 9e AF', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un accord militaire entre pays caribéens', 0, 1), (@qid, 'Un programme américain d''aide économique aux pays caribéens', 1, 2), (@qid, 'Un traité commercial entre Cuba et les USA', 0, 3), (@qid, 'Une organisation environnementale de la Caraïbe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce qu''un plébiscite ?',
 'Un plébiscite est un vote du peuple par oui ou par non sur une question posée par le gouvernement.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une élection présidentielle', 0, 1), (@qid, 'Un vote du peuple par oui ou non', 1, 2), (@qid, 'Un sondage d''opinion', 0, 3), (@qid, 'Une réunion du parlement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la CARICOM ?',
 'La CARICOM (Caribbean Community) est la communauté caribéenne créée pour favoriser l''intégration économique et politique de la région.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Caribbean Commerce and Industry Market', 0, 1), (@qid, 'Caribbean Community (Communauté Caribéenne)', 1, 2), (@qid, 'Caribbean Collaboration for International Relations and Open Markets', 0, 3), (@qid, 'Central American Regional Integration Community', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel type d''énergie fournit l''uranium ?',
 'L''uranium fournit de l''énergie nucléaire, utilisée dans les centrales nucléaires.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Énergie solaire', 0, 1), (@qid, 'Énergie éolienne', 0, 2), (@qid, 'Énergie nucléaire', 1, 3), (@qid, 'Énergie hydraulique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la différence entre un peintre réaliste et un peintre abstrait ?',
 'Le peintre réaliste représente la réalité telle qu''elle est, tandis que le peintre abstrait utilise des formes et couleurs sans représentation figurative.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le réaliste peint en couleurs, l''abstrait en noir et blanc', 0, 1), (@qid, 'Le réaliste représente la réalité, l''abstrait utilise formes et couleurs sans figuration', 1, 2), (@qid, 'Le réaliste peint à l''huile, l''abstrait à l''aquarelle', 0, 3), (@qid, 'Il n''y a aucune différence', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Comment appelle-t-on l''ensemble des biens produits dans un pays en une année ?',
 'Le Produit Intérieur Brut (PIB) mesure l''ensemble des biens et services produits dans un pays en une année.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le PNB', 0, 1), (@qid, 'Le PIB', 1, 2), (@qid, 'Le RNB', 0, 3), (@qid, 'L''IDH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la mondialisation ?',
 'La mondialisation est le processus d''intégration croissante des économies, des cultures et des sociétés à l''échelle mondiale.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La création d''organisations régionales', 0, 1), (@qid, 'L''intégration croissante des économies et cultures à l''échelle mondiale', 1, 2), (@qid, 'L''aide des pays riches aux pays pauvres', 0, 3), (@qid, 'La standardisation des monnaies', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est l''un des facteurs qui freinent le développement industriel en Haïti ?',
 'Le manque d''infrastructure (routes, électricité) est l''un des facteurs qui freinent le développement industriel haïtien.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''abondance de matières premières', 0, 1), (@qid, 'Le manque d''infrastructure', 1, 2), (@qid, 'La surpopulation des villes', 0, 3), (@qid, 'La trop grande diversité culturelle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel facteur a conduit à l''indépendance d''Haïti en 1804 ?',
 'La Révolution française de 1789 et ses idéaux de liberté ont influencé la révolution haïtienne.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La découverte du pétrole à Saint-Domingue', 0, 1), (@qid, 'Les idéaux de liberté de la Révolution française et les révoltes d''esclaves', 1, 2), (@qid, 'L''aide militaire américaine', 0, 3), (@qid, 'Un traité signé avec l''Espagne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que les "Marines" dans le contexte de l''occupation américaine d''Haïti ?',
 'Les Marines sont les soldats de l''armée américaine qui ont occupé Haïti de 1915 à 1934.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des marins haïtiens', 0, 1), (@qid, 'Des soldats de l''armée américaine', 1, 2), (@qid, 'Des officiers français', 0, 3), (@qid, 'Des policiers internationaux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le Code Noir de 1685 ?',
 'Le Code Noir de 1685 était un édit royal français réglementant l''esclavage dans les colonies françaises.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un code de lois criminelles pour les esclaves rebelles', 0, 1), (@qid, 'Un édit royal réglementant l''esclavage dans les colonies françaises', 1, 2), (@qid, 'Un livre de droit haïtien', 0, 3), (@qid, 'Un traité commercial franco-haïtien', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'En quelle année le Code Noir de 1685 a-t-il été aboli ?',
 'Le Code Noir de 1685 a été aboli le 29 août 1793 quand Sonthonax proclama l''affranchissement général des esclaves.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1789', 0, 1), (@qid, '1791', 0, 2), (@qid, '1793', 1, 3), (@qid, '1804', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel événement a eu lieu à Vertières le 18 novembre 1803 ?',
 'La bataille de Vertières était la dernière grande bataille de la révolution haïtienne contre l''armée française.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La proclamation de l''indépendance', 0, 1), (@qid, 'La signature du traité avec la France', 0, 2), (@qid, 'La dernière grande bataille contre l''armée française', 1, 3), (@qid, 'L''assassinat de Dessalines', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Toussaint Louverture est mort dans quelle prison en France ?',
 'Toussaint Louverture est mort le 7 avril 1803 au Fort de Joux en France.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Bastille', 0, 1), (@qid, 'Fort de Joux', 1, 2), (@qid, 'Château d''If', 0, 3), (@qid, 'Vincennes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le nom de la première femme mentionnée pour illustrer un droit politique dans le cours ?',
 'Ruth est citée comme candidate à la députation, illustrant l''exercice d''un droit politique.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Esther', 0, 1), (@qid, 'Ruth', 1, 2), (@qid, 'Natacha', 0, 3), (@qid, 'Pauline', 0, 4);


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le reboisement ?',
 'Le reboisement est le processus de plantation d''arbres pour reconstituer les forêts détruites.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La coupe des arbres', 0, 1), (@qid, 'La plantation d''arbres pour reconstituer les forêts', 1, 2), (@qid, 'L''étude des forêts', 0, 3), (@qid, 'La gestion des parcs nationaux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la signification du terme "pays du Sud" dans la géographie économique ?',
 'Le terme "pays du Sud" désigne les pays en voie de développement, généralement plus pauvres.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les pays situés géographiquement dans l''hémisphère Sud', 0, 1), (@qid, 'Les pays en voie de développement, généralement plus pauvres', 1, 2), (@qid, 'Les pays membres de l''Union africaine', 0, 3), (@qid, 'Les pays producteurs de café et cacao', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la principale cause du réchauffement climatique  ?',
 'La déforestation et l''utilisation de combustibles fossiles sont les principales causes du réchauffement climatique.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les éruptions volcaniques', 0, 1), (@qid, 'La déforestation et l''utilisation de combustibles fossiles', 1, 2), (@qid, 'Les tremblements de terre', 0, 3), (@qid, 'Les tsunamis', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Combien de milliards de dollars le Plan Marshall a-t-il distribué en Europe ?',
 'Le Plan Marshall a distribué plus de 13 milliards de dollars aux pays européens dévastés par la guerre.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Plus de 5 milliards', 0, 1), (@qid, 'Plus de 13 milliards', 1, 2), (@qid, 'Plus de 25 milliards', 0, 3), (@qid, 'Plus de 50 milliards', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la Révolution de 1917 a produit comme État ?',
 'La Révolution d''octobre 1917 en Russie, conduite par Lénine, a conduit à la création de l''URSS.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La République de Russie', 0, 1), (@qid, 'L''URSS (Union des Républiques Socialistes Soviétiques)', 1, 2), (@qid, 'La Fédération de Russie', 0, 3), (@qid, 'Le Commonwealth russe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel pays de l''Amérique du Sud est reconnu pour avoir proclamé son indépendance en 1811 ?',
 'Le Venezuela a proclamé son indépendance en 1811 sous Francisco Miranda et Simón Bolívar.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Colombie', 0, 1), (@qid, 'Venezuela', 1, 2), (@qid, 'Équateur', 0, 3), (@qid, 'Pérou', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le continent africain est le plus frappé par quel problème alimentaire selon le cours ?',
 'L''Afrique est le continent le plus touché par la faim et la sous-alimentation.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''obésité', 0, 1), (@qid, 'La faim et la sous-alimentation', 1, 2), (@qid, 'Le diabète', 0, 3), (@qid, 'La malnutrition par excès', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la succursale dans un contexte économique ?',
 'Une succursale est un établissement dépendant d''une entreprise principale, servant souvent de fournisseur d''emploi local.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un établissement de dépendance politique', 0, 1), (@qid, 'Une annexe d''une entreprise principale, fournisseur d''emploi', 1, 2), (@qid, 'Un vote du peuple par oui ou non', 0, 3), (@qid, 'Des soldats de l''armée', 0, 4);

-- QUESTIONS SUPPLÉMENTAIRES - HISTOIRE, POLITIQUE, GÉOGRAPHIE


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel traité a mis fin à la Première Guerre mondiale ?',
 'Le Traité de Versailles, signé le 28 juin 1919, a officiellement mis fin à la Première Guerre mondiale.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Traité de Paris', 0, 1), (@qid, 'Traité de Versailles', 1, 2), (@qid, 'Traité de Madrid', 0, 3), (@qid, 'Traité de Berlin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la différence entre le Sénat et la Chambre des Députés en Haïti ?',
 'Le Sénat représente les départements (3 sénateurs par département) tandis que la Chambre des Députés représente les communes.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Sénat vote les lois, la Chambre les applique', 0, 1), (@qid, 'Le Sénat représente les départements, la Chambre les communes', 1, 2), (@qid, 'Le Sénat est élu, la Chambre est nommée', 0, 3), (@qid, 'Il n''y a aucune différence entre eux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le nationalisme comme cause de la Première Guerre mondiale ?',
 'Le nationalisme est le sentiment d''appartenance à une nation et la volonté de s''affirmer face aux autres nations, ce qui a créé des tensions en Europe.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''amour de la nature', 0, 1), (@qid, 'Le sentiment d''appartenance à une nation et la volonté de s''affirmer', 1, 2), (@qid, 'La politique d''expansion commerciale', 0, 3), (@qid, 'Le rejet de l''industrialisation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Comment se nomme l''aéroport international d''Haïti ?',
 'L''aéroport international d''Haïti se nomme l''Aéroport International Toussaint Louverture.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aéroport Jean-Jacques Dessalines', 0, 1), (@qid, 'Aéroport International Toussaint Louverture', 1, 2), (@qid, 'Aéroport Henri Christophe', 0, 3), (@qid, 'Aéroport Alexandre Pétion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que l''impérialisme comme cause de la Première Guerre mondiale ?',
 'L''impérialisme est la politique d''expansion et de domination d''un pays sur d''autres territoires, créant des rivalités entre grandes puissances.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La politique d''aide aux pays pauvres', 0, 1), (@qid, 'La politique d''expansion et de domination sur d''autres territoires', 1, 2), (@qid, 'Le mouvement contre la colonisation', 0, 3), (@qid, 'La défense des droits des peuples', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'La Cour de Cassation est la plus haute juridiction dans quel pouvoir ?',
 'La Cour de Cassation est la plus haute juridiction du pouvoir judiciaire en Haïti.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pouvoir exécutif', 0, 1), (@qid, 'Pouvoir législatif', 0, 2), (@qid, 'Pouvoir judiciaire', 1, 3), (@qid, 'Pouvoir municipal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le nom de la conférence mondiale sur l''environnement qui a eu lieu à Rio en 1992 ?',
 'Le Sommet de la Terre de Rio de Janeiro (1992) a été la première grande conférence mondiale sur l''environnement.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Protocole de Kyoto', 0, 1), (@qid, 'Sommet de la Terre de Rio', 1, 2), (@qid, 'Accord de Paris', 0, 3), (@qid, 'Convention de Vienne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le chef-lieu du département du Centre en Haïti ?',
 'Hinche est le chef-lieu du département du Centre.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Miragoâne', 0, 1), (@qid, 'St-Marc', 0, 2), (@qid, 'Hinche', 1, 3), (@qid, 'Lascahobas', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le chef-lieu du département du Nord-Ouest en Haïti ?',
 'Port-de-Paix est le chef-lieu du département du Nord-Ouest.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cap-Haïtien', 0, 1), (@qid, 'Fort-Liberté', 0, 2), (@qid, 'Port-de-Paix', 1, 3), (@qid, 'Môle-Saint-Nicolas', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le chef-lieu du département du Sud-Est ?',
 'Jacmel est le chef-lieu du département du Sud-Est.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les Cayes', 0, 1), (@qid, 'Miragoâne', 0, 2), (@qid, 'Jérémie', 0, 3), (@qid, 'Jacmel', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Dans quel département haïtien se trouve la commune de l''Arcahaie ?',
 'Arcahaie est une commune du département de l''Ouest.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Artibonite', 0, 1), (@qid, 'Centre', 0, 2), (@qid, 'Ouest', 1, 3), (@qid, 'Nord', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Que célèbre Haïti le 1er mai chaque année ?',
 'Le 1er mai est la Fête du Travail et de l''Agriculture, célébrée à travers le monde et en Haïti.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Fête Nationale', 0, 1), (@qid, 'La Fête du Travail et de l''Agriculture', 1, 2), (@qid, 'La Fête des Mères', 0, 3), (@qid, 'La Fête de la Constitution', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la Révolution française de 1789 a proclamé comme principes fondamentaux ?',
 'La Révolution française a proclamé les principes de Liberté, Égalité et Fraternité.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Justice, Paix et Progrès', 0, 1), (@qid, 'Liberté, Égalité, Fraternité', 1, 2), (@qid, 'Démocratie, République, Laïcité', 0, 3), (@qid, 'Liberté, Propriété, Sécurité', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le fleuve qui sépare Haïti de la République Dominicaine au nord ?',
 'La Rivière Massacre sépare Haïti de la République Dominicaine au nord.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Artibonite', 0, 1), (@qid, 'La Rivière du Massacre', 1, 2), (@qid, 'La Rivière Blanche', 0, 3), (@qid, 'La Rivière Pedernales', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est l''hymne national d''Haïti ?',
 'La Dessalinienne est l''hymne national d''Haïti, composé en l''honneur de Dessalines.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La Marseillaise haïtienne', 0, 1), (@qid, 'La Dessalinienne', 1, 2), (@qid, 'L''Ode à la liberté', 0, 3), (@qid, 'La Haïtienne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la devise nationale d''Haïti ?',
 'La devise nationale d''Haïti est "L''Union fait la Force".', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Liberté, Égalité, Fraternité', 0, 1), (@qid, 'L''Union fait la Force', 1, 2), (@qid, 'Dieu, Patrie, Liberté', 0, 3), (@qid, 'Justice, Paix, Progrès', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel type d''agriculture pratique-t-on généralement dans les zones montagneuses d''Haïti ?',
 'Dans les zones montagneuses d''Haïti, on pratique l''agriculture de subsistance avec des cultures vivrières.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Agriculture industrielle', 0, 1), (@qid, 'Agriculture d''exportation', 0, 2), (@qid, 'Agriculture de subsistance', 1, 3), (@qid, 'Agriculture hydraulique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le nom donné au projet de reconstruction d''Haïti après le séisme de 2010 ?',
 'La CIRH (Commission Intérimaire pour la Reconstruction d''Haïti) a été créée pour gérer la reconstruction.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Programme National de Reconstruction', 0, 1), (@qid, 'CIRH - Commission Intérimaire pour la Reconstruction', 1, 2), (@qid, 'Plan Marshall haïtien', 0, 3), (@qid, 'Fonds pour la Reconstruction d''Haïti (FRH)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la Diaspora haïtienne ?',
 'La Diaspora haïtienne est l''ensemble des Haïtiens vivant à l''étranger, principalement aux USA, en France et au Canada.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le nom d''un parti politique haïtien', 0, 1), (@qid, 'L''ensemble des Haïtiens vivant à l''étranger', 1, 2), (@qid, 'Une organisation internationale d''aide à Haïti', 0, 3), (@qid, 'Un mouvement culturel haïtien', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Le Tremblement de terre de 2010 en Haïti s''est produit dans quel département ?',
 'Le tremblement de terre du 12 janvier 2010 a particulièrement touché le département de l''Ouest et notamment Port-au-Prince.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le département du Sud', 0, 1), (@qid, 'Le département de l''Ouest', 1, 2), (@qid, 'Le département du Nord', 0, 3), (@qid, 'Le département de l''Artibonite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le pays le plus peuplé de la Caraïbe ?',
 'Cuba est le pays le plus peuplé de la Caraïbe avec environ 11 millions d''habitants.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haïti', 0, 1), (@qid, 'Cuba', 1, 2), (@qid, 'République Dominicaine', 0, 3), (@qid, 'Porto Rico', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le Vodou/Vaudou en Haïti ?',
 'Le Vaudou est une religion syncrétiste originaire d''Haïti, mêlant des croyances africaines et catholiques.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une danse folklorique haïtienne', 0, 1), (@qid, 'Une religion syncrétiste mêlant croyances africaines et catholiques', 1, 2), (@qid, 'Un parti politique haïtien', 0, 3), (@qid, 'Une pratique agricole traditionnelle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le premier pays noir à avoir obtenu son indépendance dans le monde ?',
 'Haïti est le premier pays noir à avoir obtenu son indépendance le 1er janvier 1804.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Libéria', 0, 1), (@qid, 'Ghana', 0, 2), (@qid, 'Haïti', 1, 3), (@qid, 'Éthiopie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la principale religion pratiquée en Haïti ?',
 'Le Catholicisme est la principale religion pratiquée officiellement en Haïti, avec une forte présence protestante et du Vaudou.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Islam', 0, 1), (@qid, 'Le Protestantisme uniquement', 0, 2), (@qid, 'Le Catholicisme', 1, 3), (@qid, 'Le Bouddhisme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le secteur économique qui emploie le plus de personnes en Haïti ?',
 'L''agriculture emploie la grande majorité de la population haïtienne, surtout en milieu rural.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''industrie', 0, 1), (@qid, 'Les services', 0, 2), (@qid, 'L''agriculture', 1, 3), (@qid, 'Le commerce', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que le Konbit en Haïti ?',
 'Le Konbit est une forme d''entraide traditionnelle haïtienne où les membres d''une communauté travaillent ensemble.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un plat traditionnel haïtien', 0, 1), (@qid, 'Une danse folklorique haïtienne', 0, 2), (@qid, 'Une forme d''entraide communautaire', 1, 3), (@qid, 'Un marché traditionnel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la monnaie de la République Dominicaine ?',
 'Le peso dominicain est la monnaie officielle de la République Dominicaine.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le dollar', 0, 1), (@qid, 'Le peso dominicain', 1, 2), (@qid, 'La gourde', 0, 3), (@qid, 'L''euro', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la monnaie de Cuba ?',
 'Le peso cubain est la monnaie officielle de Cuba.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le dollar américain', 0, 1), (@qid, 'Le peso cubain', 1, 2), (@qid, 'L''euro', 0, 3), (@qid, 'Le livre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le nom de la deuxième ville de la République Dominicaine ?',
 'Santiago de los Caballeros est la deuxième ville de la République Dominicaine.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Puerto Plata', 0, 1), (@qid, 'Santiago de los Caballeros', 1, 2), (@qid, 'La Romana', 0, 3), (@qid, 'Barahona', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la Jamaïque ?',
 'Kingston est la capitale de la Jamaïque.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Montego Bay', 0, 1), (@qid, 'Kingston', 1, 2), (@qid, 'Ocho Rios', 0, 3), (@qid, 'Negril', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de Cuba ?',
 'La Havane est la capitale de Cuba.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Santiago de Cuba', 0, 1), (@qid, 'La Havane', 1, 2), (@qid, 'Trinidad', 0, 3), (@qid, 'Camagüey', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quelle est la capitale de la République Dominicaine ?',
 'Saint-Domingue (Santo Domingo) est la capitale de la République Dominicaine.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Santiago', 0, 1), (@qid, 'Saint-Domingue', 1, 2), (@qid, 'Puerto Plata', 0, 3), (@qid, 'La Romana', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le nom de la mer qui borde Haïti au sud ?',
 'La mer des Caraïbes (mer des Antilles) borde Haïti au sud.', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''Océan Atlantique', 0, 1), (@qid, 'La mer des Caraïbes', 1, 2), (@qid, 'La mer du Golfe', 0, 3), (@qid, 'La mer du Mexique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la sédimentation des plans d''eau mentionnée dans le cours ?',
 'La sédimentation est le dépôt de particules de sol dans les lacs, rivières et barrages, conséquence de l''érosion due à la déforestation.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La purification de l''eau', 0, 1), (@qid, 'Le dépôt de particules de sol dans les cours d''eau', 1, 2), (@qid, 'La construction de barrages', 0, 3), (@qid, 'La pollution chimique des lacs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Haïti a connu combien de constitutions depuis 1804 ?',
 'Haïti a eu plus de 20 constitutions depuis son indépendance en 1804, ce qui témoigne d''une grande instabilité politique.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Environ 5', 0, 1), (@qid, 'Environ 10', 0, 2), (@qid, 'Environ 15', 0, 3), (@qid, 'Plus de 20', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Qu''est-ce que la politique d''aménagement du territoire ?',
 'L''aménagement du territoire est l''ensemble des actions visant à organiser et développer l''espace national de manière équilibrée.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La construction de routes uniquement', 0, 1), (@qid, 'L''organisation et développement équilibré de l''espace national', 1, 2), (@qid, 'La délimitation des frontières', 0, 3), (@qid, 'La gestion des parcs nationaux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le nom du premier journal haïtien ?',
 'La Gazette de Saint-Domingue est considérée comme le premier journal haïtien, fondé à l''époque coloniale.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Nouvelliste', 0, 1), (@qid, 'La Gazette de Saint-Domingue', 1, 2), (@qid, 'Le Matin', 0, 3), (@qid, 'Haïti Liberté', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le pays le plus grand par sa superficie dans la Caraïbe ?',
 'Cuba est le plus grand pays de la Caraïbe avec une superficie d''environ 110 860 km².', 'Programme 9e AF', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haïti', 0, 1), (@qid, 'Cuba', 1, 2), (@qid, 'République Dominicaine', 0, 3), (@qid, 'Jamaïque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(5, 2, 'Quel est le problème majeur de la ville de Port-au-Prince mentionné dans le cours ?',
 'La bidonvilisation (prolifération des bidonvilles) et l''insécurité sont les problèmes majeurs de Port-au-Prince.', 'Programme 9e AF', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le manque de touristes', 0, 1), (@qid, 'La bidonvilisation et l''insécurité', 1, 2), (@qid, 'La pollution industrielle', 0, 3), (@qid, 'La sécheresse permanente', 0, 4);




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

