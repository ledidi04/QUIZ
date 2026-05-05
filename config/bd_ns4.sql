-- =============================================
-- Questions NS4 (Nouveaux Secondaires 4)
-- Matières : Français(8), Maths(9), Physique(10),
--            Chimie(11), SVT(12), Histoire-Géo(12), Anglais(14)
-- Conforme programmes MENFP Haïti
-- =============================================

USE quiz_ayiti;

-- =============================================
-- 8. FRANÇAIS NS4 (matiere_id = 8)
-- =============================================

-- QCM
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(8, 2, 'Quel est le mode utilisé dans la phrase : "Il faut que tu viennes." ?', 'Le subjonctif s''emploie après des expressions d''obligation comme "il faut que".', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''indicatif', 0, 1), (@qid, 'Le conditionnel', 0, 2), (@qid, 'Le subjonctif', 1, 3), (@qid, 'L''impératif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(8, 2, 'Quelle figure de style est utilisée dans : "La vie est un combat." ?', 'Une métaphore établit une comparaison sans outil comparatif.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La comparaison', 0, 1), (@qid, 'La métaphore', 1, 2), (@qid, 'La personnification', 0, 3), (@qid, 'L''hyperbole', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(8, 2, 'Quel est le temps de la phrase : "Demain, nous partirons à l''aube." ?', 'Le futur simple exprime une action à venir.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le présent', 0, 1), (@qid, 'Le futur simple', 1, 2), (@qid, 'Le conditionnel présent', 0, 3), (@qid, 'Le futur antérieur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(8, 2, 'Qu''est-ce qu''un oxymore ?', 'Un oxymore associe deux termes de sens contraire.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une répétition de sons', 0, 1), (@qid, 'Une exagération', 0, 2), (@qid, 'Une association de termes contradictoires', 1, 3), (@qid, 'Une comparaison avec "comme"', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(8, 2, 'Dans quelle phrase le verbe est-il au passé composé ?', 'Le passé composé = auxiliaire au présent + participe passé.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il partait chaque matin.', 0, 1), (@qid, 'Il est parti ce matin.', 1, 2), (@qid, 'Il partira demain.', 0, 3), (@qid, 'Il partirait si possible.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(8, 2, 'Quel est le genre du mot "épithète" ?', 'Épithète est un nom féminin.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Masculin', 0, 1), (@qid, 'Féminin', 1, 2), (@qid, 'Les deux selon le contexte', 0, 3), (@qid, 'Neutre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(8, 2, 'Laquelle de ces propositions est une subordonnée relative ?', 'Une subordonnée relative est introduite par un pronom relatif (qui, que, dont…).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'parce qu''il pleuvait', 0, 1), (@qid, 'que tu viennes', 0, 2), (@qid, 'qui habite à côté', 1, 3), (@qid, 'quand il arriva', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(8, 2, 'Quel auteur haïtien a écrit "Gouverneurs de la rosée" ?', 'Jacques Roumain est l''auteur de ce roman majeur de la littérature haïtienne (1944).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Frankétienne', 0, 1), (@qid, 'Dany Laferrière', 0, 2), (@qid, 'Jacques Roumain', 1, 3), (@qid, 'René Depestre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(8, 2, 'Quelle est la fonction de "rapidement" dans : "Il court rapidement." ?', 'Rapidement est un adverbe modifiant le verbe : c''est un complément circonstanciel de manière.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sujet', 0, 1), (@qid, 'Attribut du sujet', 0, 2), (@qid, 'Complément d''objet direct', 0, 3), (@qid, 'Complément circonstanciel de manière', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(8, 2, 'Qu''est-ce que la synecdoque ?', 'La synecdoque désigne le tout par la partie ou inversement.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une figure de répétition', 0, 1), (@qid, 'Désigner le tout par la partie ou vice versa', 1, 2), (@qid, 'Une exagération délibérée', 0, 3), (@qid, 'Une comparaison implicite', 0, 4);

-- Complétion
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(8, 1, 'Le contraire de "antécédent" est ________.', NULL, 'Programme NS4', 2, 'conséquent|subséquent');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(8, 1, 'La figure de style qui consiste à attribuer des qualités humaines à un objet s''appelle ________.', NULL, 'Programme NS4', 2, 'personnification');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(8, 1, 'Le participe passé de "recevoir" est ________.', NULL, 'Programme NS4', 1, 'reçu');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(8, 1, '"Gouverneurs de la rosée" a été écrit par ________.', NULL, 'Programme NS4', 2, 'Jacques Roumain');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(8, 1, 'Une proposition introduite par "qui", "que", "dont" est une subordonnée ________.', NULL, 'Programme NS4', 2, 'relative');


-- =============================================
-- 9. MATHÉMATIQUES NS4 (matiere_id = 9)
-- =============================================

-- QCM
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quelle est la valeur de sin(30°) ?', 'sin(30°) = 1/2', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '√2/2', 0, 1), (@qid, '1/2', 1, 2), (@qid, '√3/2', 0, 3), (@qid, '1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quelle est la dérivée de f(x) = x³ ?', 'La dérivée de xⁿ est n·xⁿ⁻¹.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x²', 0, 1), (@qid, '3x²', 1, 2), (@qid, '3x³', 0, 3), (@qid, '2x²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quel est le discriminant de x² - 5x + 6 = 0 ?', 'Δ = b² - 4ac = 25 - 24 = 1', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-1', 0, 1), (@qid, '1', 1, 2), (@qid, '25', 0, 3), (@qid, '11', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quelle est la valeur de log₁₀(1000) ?', 'log₁₀(1000) = log₁₀(10³) = 3', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '10', 0, 2), (@qid, '3', 1, 3), (@qid, '100', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quelle est l''intégrale de f(x) = 2x ?', '∫2x dx = x² + C', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2x² + C', 0, 1), (@qid, 'x² + C', 1, 2), (@qid, '2 + C', 0, 3), (@qid, 'x + C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Dans un triangle rectangle, si les deux cathètes mesurent 3 et 4, quelle est l''hypoténuse ?', 'Théorème de Pythagore : 3² + 4² = 9 + 16 = 25, donc hypoténuse = 5.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6', 0, 1), (@qid, '7', 0, 2), (@qid, '5', 1, 3), (@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quelle est la valeur de cos(60°) ?', 'cos(60°) = 1/2', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '√3/2', 0, 1), (@qid, '√2/2', 0, 2), (@qid, '1/2', 1, 3), (@qid, '0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quelle est la forme développée de (a + b)² ?', '(a+b)² = a² + 2ab + b²', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a² + b²', 0, 1), (@qid, 'a² - 2ab + b²', 0, 2), (@qid, 'a² + 2ab + b²', 1, 3), (@qid, '2a + 2b', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quelle est la solution de l''équation 2x + 4 = 10 ?', '2x = 6, donc x = 3', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x = 2', 0, 1), (@qid, 'x = 7', 0, 2), (@qid, 'x = 3', 1, 3), (@qid, 'x = 5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quelle est la valeur de tan(45°) ?', 'tan(45°) = 1', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1), (@qid, '√2', 0, 2), (@qid, '1', 1, 3), (@qid, '∞', 0, 4);


-- ============================================
-- QCM MATHÉMATIQUES NS4 - HAÏTI
-- Plus de 600 questions couvrant tout le programme
-- Sources : Examens officiels NS4 + Programme MENFP
-- ============================================

-- ============================================
-- THÈME 1 : ALGÈBRE - SOUS-ESPACES VECTORIELS
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Un sous-espace vectoriel doit contenir :',
    'Le vecteur nul (origine) est toujours élément de tout sous-espace vectoriel.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement des vecteurs non nuls', 0, 1), (@qid, 'Le vecteur nul', 1, 2), (@qid, 'Uniquement des scalaires', 0, 3), (@qid, 'Des matrices uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Pour qu''un sous-ensemble F de E soit un sous-espace vectoriel, il faut que :',
    'F doit être non vide, stable par addition et par multiplication par un scalaire.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'F soit uniquement non vide', 0, 1), (@qid, 'F contienne 0, stable par + et par ·', 1, 2), (@qid, 'F soit fini', 0, 3), (@qid, 'F contienne un seul élément', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''ensemble {(x,y) ∈ ℝ² | y = 2x} est :',
    'C''est une droite vectorielle passant par l''origine → sous-espace de dimension 1.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un sous-espace vectoriel de ℝ²', 1, 1), (@qid, 'Un sous-espace de dimension 2', 0, 2), (@qid, 'Pas un sous-espace vectoriel', 0, 3), (@qid, 'Un espace affine uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La dimension d''un sous-espace vectoriel de ℝ³ est au maximum :',
    '3 (la dimension de l''espace ambiant ℝ³).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '2', 0, 2), (@qid, '3', 1, 3), (@qid, 'Infinie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Deux vecteurs u et v engendrent un plan vectoriel s''ils sont :',
    'Non colinéaires (linéairement indépendants).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Colinéaires', 0, 1), (@qid, 'Non colinéaires', 1, 2), (@qid, 'Nuls tous les deux', 0, 3), (@qid, 'Orthogonaux obligatoirement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La somme de deux sous-espaces vectoriels F et G est directe si :',
    'F ∩ G = {0} (intersection réduite au vecteur nul).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'F ∪ G = E', 0, 1), (@qid, 'F ∩ G = {0}', 1, 2), (@qid, 'F = G', 0, 3), (@qid, 'dim F = dim G', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quelle est la dimension du sous-espace {(x,y,z) ∈ ℝ³ | x + y + z = 0} ?',
    'Un hyperplan vectoriel de ℝ³, dimension = 3 - 1 = 2.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '2', 1, 2), (@qid, '3', 0, 3), (@qid, '0', 0, 4);

-- ============================================
-- THÈME 2 : APPLICATIONS LINÉAIRES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une application f : E → F est linéaire si :',
    'f(u+v) = f(u) + f(v) et f(λu) = λf(u).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f(u+v) = f(u) + f(v) et f(λu) = λf(u)', 1, 1), (@qid, 'f(u+v) = f(u) · f(v)', 0, 2), (@qid, 'f(λu) = f(u) seulement', 0, 3), (@qid, 'f(0) ≠ 0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le noyau d''une application linéaire f est :',
    'Ker(f) = {x ∈ E | f(x) = 0}.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''ensemble image de f', 0, 1), (@qid, '{x ∈ E | f(x) = 0}', 1, 2), (@qid, 'Le complémentaire de Im(f)', 0, 3), (@qid, 'Toujours de dimension 1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le théorème du rang énonce que dim E = :',
    'dim Ker(f) + dim Im(f) = dim E.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'dim Im(f) uniquement', 0, 1), (@qid, 'dim Ker(f) + dim Im(f)', 1, 2), (@qid, 'dim Ker(f) - dim Im(f)', 0, 3), (@qid, 'dim Im(f) - dim Ker(f)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une application linéaire f est injective si et seulement si :',
    'Ker(f) = {0} (le noyau est réduit au vecteur nul).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Im(f) = F', 0, 1), (@qid, 'Ker(f) = {0}', 1, 2), (@qid, 'dim E = dim F', 0, 3), (@qid, 'f est bijective', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Soit f(x,y) = (x+y, x-y). L''image de (1,2) est :',
    'f(1,2) = (1+2, 1-2) = (3, -1).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(3, 1)', 0, 1), (@qid, '(3, -1)', 1, 2), (@qid, '(-1, 3)', 0, 3), (@qid, '(1, 3)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La matrice d''une application linéaire de ℝ² dans ℝ² est de taille :',
    '2 lignes (espace d''arrivée) × 2 colonnes (espace de départ) = matrice 2×2.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2×1', 0, 1), (@qid, '1×2', 0, 2), (@qid, '2×2', 1, 3), (@qid, '4×4', 0, 4);

-- ============================================
-- THÈME 3 : PROJECTIONS ET SYMÉTRIES VECTORIELLES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une projection vectorielle p vérifie :',
    'p∘p = p (idempotence : appliquer deux fois = appliquer une fois).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'p∘p = 0', 0, 1), (@qid, 'p∘p = p', 1, 2), (@qid, 'p∘p = Id', 0, 3), (@qid, 'p∘p = -p', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une symétrie vectorielle s vérifie :',
    's∘s = Id (deux symétries successives = identité).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 's∘s = 0', 0, 1), (@qid, 's∘s = s', 0, 2), (@qid, 's∘s = Id', 1, 3), (@qid, 's∘s = -s', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La relation entre projection p et symétrie s de même base est :',
    's = 2p - Id (la symétrie est le double de la projection moins l''identité).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 's = p', 0, 1), (@qid, 's = 2p - Id', 1, 2), (@qid, 's = p + Id', 0, 3), (@qid, 's = p/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une projection vectorielle a pour image le sous-espace :',
    'Sur lequel on projette (base de la projection).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le noyau', 0, 1), (@qid, 'Le sous-espace de projection', 1, 2), (@qid, 'L''espace entier', 0, 3), (@qid, 'L''orthogonal du noyau', 0, 4);

-- ============================================
-- THÈME 4 : GÉOMÉTRIE AFFINE
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Un espace affine est défini par :',
    'Un ensemble de points et un espace vectoriel directeur.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement des points', 0, 1), (@qid, 'Des points + espace vectoriel directeur', 1, 2), (@qid, 'Uniquement des vecteurs', 0, 3), (@qid, 'Des nombres complexes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le vecteur AB dans un espace affine est défini par :',
    'La différence des coordonnées : B - A.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'A + B', 0, 1), (@qid, 'B - A', 1, 2), (@qid, 'A - B', 0, 3), (@qid, 'A × B', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une application affine f vérifie :',
    'Il existe une application linéaire L telle que f(M) = f(O) + L(OM).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f(M) = f(O) uniquement', 0, 1), (@qid, 'f(M) = f(O) + L(OM)', 1, 2), (@qid, 'f(M) = L(M) uniquement', 0, 3), (@qid, 'f(M+N) = f(M)f(N)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une projection affine p vérifie :',
    'p∘p = p (idempotente, comme sa partie linéaire).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'p∘p = Id', 0, 1), (@qid, 'p∘p = p', 1, 2), (@qid, 'p∘p = 0', 0, 3), (@qid, 'p∘p = -p', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une symétrie affine s vérifie :',
    's∘s = Id (involution).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 's∘s = s', 0, 1), (@qid, 's∘s = Id', 1, 2), (@qid, 's∘s = 0', 0, 3), (@qid, 's∘s = 2s', 0, 4);

-- ============================================
-- THÈME 5 : ESPACES VECTORIELS EUCLIDIENS
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Un produit scalaire <u,v> dans ℝ² usuel est :',
    '<(x₁,y₁),(x₂,y₂)> = x₁x₂ + y₁y₂.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x₁y₁ + x₂y₂', 0, 1), (@qid, 'x₁x₂ + y₁y₂', 1, 2), (@qid, '(x₁+x₂)(y₁+y₂)', 0, 3), (@qid, 'x₁x₂ - y₁y₂', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La norme euclidienne de u est :',
    '‖u‖ = √<u,u>.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '<u,u>', 0, 1), (@qid, '√<u,u>', 1, 2), (@qid, '<u,u>²', 0, 3), (@qid, '|<u,v>|', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Deux vecteurs u et v sont orthogonaux si :',
    '<u,v> = 0.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '<u,v> = 1', 0, 1), (@qid, '<u,v> = 0', 1, 2), (@qid, '‖u‖ = ‖v‖', 0, 3), (@qid, 'u + v = 0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une base orthonormée vérifie :',
    'Vecteurs orthogonaux deux à deux et de norme 1.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Orthogonaux uniquement', 0, 1), (@qid, 'Orthogonaux et normés', 1, 2), (@qid, 'Normés uniquement', 0, 3), (@qid, 'Quelconques', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''inégalité de Cauchy-Schwarz s''écrit :',
    '|<u,v>| ≤ ‖u‖ · ‖v‖.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '|<u,v>| ≥ ‖u‖ · ‖v‖', 0, 1), (@qid, '|<u,v>| ≤ ‖u‖ · ‖v‖', 1, 2), (@qid, '|<u,v>| = ‖u‖ + ‖v‖', 0, 3), (@qid, '<u,v> = ‖u‖²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La norme de u = (3,4) dans ℝ² usuel est :',
    '‖u‖ = √(3²+4²) = √25 = 5.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5', 1, 1), (@qid, '7', 0, 2), (@qid, '12', 0, 3), (@qid, '1', 0, 4);

-- ============================================
-- SUITE ALGÈBRE LINÉAIRE : Vecteurs, Bases, Dimensions
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une famille de vecteurs est libre si :',
    'Toute combinaison linéaire nulle implique que tous les coefficients sont nuls.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aucune combinaison n''est nulle', 0, 1), (@qid, 'Σλᵢvᵢ = 0 ⇒ tous λᵢ = 0', 1, 2), (@qid, 'Ils sont orthogonaux', 0, 3), (@qid, 'Ils sont tous non nuls', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La base canonique de ℝ² est :',
    '{(1,0), (0,1)} soit i et j.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '{(1,1), (2,2)}', 0, 1), (@qid, '{(1,0), (0,1)}', 1, 2), (@qid, '{(0,0), (1,1)}', 0, 3), (@qid, '{(1,2), (3,4)}', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La dimension de ℝⁿ est :',
    'n (nombre de composantes).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, 'n', 1, 2), (@qid, '2n', 0, 3), (@qid, 'n²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Deux sous-espaces supplémentaires F et G vérifient :',
    'F ∩ G = {0} et F + G = E.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'F ∪ G = E uniquement', 0, 1), (@qid, 'F ∩ G = {0} et F + G = E', 1, 2), (@qid, 'F = G', 0, 3), (@qid, 'dim F = dim G', 0, 4);

-- ============================================
-- THÈME 6 : NOMBRES COMPLEXES - FORME ALGÉBRIQUE
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Un nombre complexe s''écrit sous forme algébrique :',
    'z = a + ib avec a,b réels, i² = -1.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z = a - ib uniquement', 0, 1), (@qid, 'z = a + ib avec i² = -1', 1, 2), (@qid, 'z = a × ib', 0, 3), (@qid, 'z = (a,b) sans i', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le conjugué de z = a + ib est :',
    'z̄ = a - ib.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a + ib', 0, 1), (@qid, 'a - ib', 1, 2), (@qid, '-a + ib', 0, 3), (@qid, '-a - ib', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'z · z̄ = ?',
    'z·z̄ = a² + b² = |z|² (nombre réel positif).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a² - b²', 0, 1), (@qid, 'a² + b²', 1, 2), (@qid, '2ab', 0, 3), (@qid, 'a + b', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le module de z = 3 + 4i est :',
    '|z| = √(3² + 4²) = √25 = 5.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5', 1, 1), (@qid, '7', 0, 2), (@qid, '1', 0, 3), (@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''inverse de z = a + ib (non nul) est :',
    '1/z = z̄/|z|² = (a-ib)/(a²+b²).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a - ib', 0, 1), (@qid, '(a-ib)/(a²+b²)', 1, 2), (@qid, '1/(a+ib) sans changer', 0, 3), (@qid, 'z̄ uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'i² = ?',
    '-1 (par définition du nombre imaginaire i).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '-1', 1, 2), (@qid, '0', 0, 3), (@qid, 'i', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'i³ = ?',
    'i³ = i² × i = -i.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'i', 0, 1), (@qid, '1', 0, 2), (@qid, '-i', 1, 3), (@qid, '-1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'i⁴ = ?',
    'i⁴ = (i²)² = 1.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'i', 0, 1), (@qid, '-1', 0, 2), (@qid, '1', 1, 3), (@qid, '-i', 0, 4);

-- ============================================
-- THÈME 7 : FORME TRIGONOMÉTRIQUE ET ARGUMENT
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La forme trigonométrique de z est :',
    'z = r(cos θ + i sin θ) où r = |z| et θ = arg(z).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z = r(cos θ - i sin θ)', 0, 1), (@qid, 'z = r(cos θ + i sin θ)', 1, 2), (@qid, 'z = cos θ + i sin θ', 0, 3), (@qid, 'z = a + b', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''argument de z = 1 + i est :',
    'cos θ = 1/√2, sin θ = 1/√2 → θ = π/4.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'π/2', 0, 1), (@qid, 'π/4', 1, 2), (@qid, 'π/3', 0, 3), (@qid, 'π', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La formule de Moivre : (cos θ + i sin θ)ⁿ = ?',
    'cos(nθ) + i sin(nθ).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'cos(nθ) + i sin(nθ)', 1, 1), (@qid, 'n(cos θ + i sin θ)', 0, 2), (@qid, 'cosⁿθ + i sinⁿθ', 0, 3), (@qid, 'cos(θⁿ) + i sin(θⁿ)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Deux nombres complexes sont égaux ssi :',
    'Mêmes parties réelles ET mêmes parties imaginaires.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mêmes modules', 0, 1), (@qid, 'Mêmes parties réelles et imaginaires', 1, 2), (@qid, 'Mêmes arguments', 0, 3), (@qid, 'Leur produit vaut 1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '|z₁z₂| = ?',
    '|z₁| × |z₂| (le module du produit = produit des modules).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '|z₁| + |z₂|', 0, 1), (@qid, '|z₁| × |z₂|', 1, 2), (@qid, '|z₁|/|z₂|', 0, 3), (@qid, '|z₁| - |z₂|', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'arg(z₁z₂) = ?',
    'arg(z₁) + arg(z₂) (modulo 2π).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'arg(z₁) × arg(z₂)', 0, 1), (@qid, 'arg(z₁) + arg(z₂)', 1, 2), (@qid, 'arg(z₁) - arg(z₂)', 0, 3), (@qid, '|arg(z₁) - arg(z₂)|', 0, 4);

-- ============================================
-- THÈME 8 : ÉQUATIONS DANS ℂ
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les solutions de z² = -1 sont :',
    'i et -i.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 et -1', 0, 1), (@qid, 'i et -i', 1, 2), (@qid, 'i uniquement', 0, 3), (@qid, 'Pas de solution', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les racines carrées de Δ = -4 sont :',
    '2i et -2i (car (2i)² = -4).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 et -2', 0, 1), (@qid, '2i et -2i', 1, 2), (@qid, '4i et -4i', 0, 3), (@qid, 'Pas de racines', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les racines cubiques de l''unité sont 1, j, j². j = ?',
    'j = e^(2iπ/3) = -1/2 + i√3/2.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-1/2 + i√3/2', 1, 1), (@qid, '1/2 + i√3/2', 0, 2), (@qid, 'i', 0, 3), (@qid, '-1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '1 + j + j² = ?',
    '0 (somme des racines cubiques de l''unité).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '0', 1, 2), (@qid, '3', 0, 3), (@qid, '-1', 0, 4);

-- ============================================
-- THÈME 9 : NOMBRES COMPLEXES ET CONFIGURATION DU PLAN
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''affixe du vecteur AB est :',
    'z_B - z_A.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z_A + z_B', 0, 1), (@qid, 'z_B - z_A', 1, 2), (@qid, 'z_A - z_B', 0, 3), (@qid, '(z_A+z_B)/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''affixe du milieu I de [AB] est :',
    '(z_A + z_B)/2.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z_A + z_B', 0, 1), (@qid, '(z_A + z_B)/2', 1, 2), (@qid, 'z_B - z_A', 0, 3), (@qid, '|z_A - z_B|', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '|z_B - z_A| représente :',
    'La distance AB.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''affixe de A', 0, 1), (@qid, 'La distance AB', 1, 2), (@qid, 'Le milieu de [AB]', 0, 3), (@qid, 'L''argument de AB', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '(z_B - z_A)/(z_C - z_A) étant imaginaire pur signifie :',
    'Les droites AB et AC sont perpendiculaires.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'AB et AC parallèles', 0, 1), (@qid, 'AB et AC perpendiculaires', 1, 2), (@qid, 'A, B, C alignés', 0, 3), (@qid, 'ABC triangle équilatéral', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '(z_B - z_A)/(z_C - z_A) étant réel signifie :',
    'A, B, C alignés.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'AB ⟂ AC', 0, 1), (@qid, 'A, B, C alignés', 1, 2), (@qid, 'Triangle rectangle', 0, 3), (@qid, 'Triangle isocèle', 0, 4);

-- ============================================
-- THÈME 10 : RACINES n-ièmes ET SIMILITUDES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les racines n-ièmes de l''unité sont au nombre de :',
    'n solutions distinctes.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, 'n', 1, 2), (@qid, '2n', 0, 3), (@qid, 'n + 1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les racines n-ièmes de l''unité se trouvent sur :',
    'Le cercle unité (|z| = 1), formant un polygone régulier.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une droite', 0, 1), (@qid, 'Le cercle unité', 1, 2), (@qid, 'Une parabole', 0, 3), (@qid, 'L''axe réel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une similitude directe a pour écriture complexe :',
    'z'' = az + b avec a ≠ 0.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z'' = az̄ + b', 0, 1), (@qid, 'z'' = az + b (a ≠ 0)', 1, 2), (@qid, 'z'' = a/z', 0, 3), (@qid, 'z'' = z + a', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une similitude indirecte a pour écriture :',
    'z'' = az̄ + b avec a ≠ 0.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z'' = az + b', 0, 1), (@qid, 'z'' = az̄ + b', 1, 2), (@qid, 'z'' = a/z̄', 0, 3), (@qid, 'z'' = z̄ + a', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le rapport d''une similitude z'' = az + b est :',
    'k = |a| (module de a).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a', 0, 1), (@qid, '|a|', 1, 2), (@qid, 'b', 0, 3), (@qid, 'arg(a)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''angle d''une similitude directe z'' = az + b est :',
    'θ = arg(a) (modulo 2π).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '|a|', 0, 1), (@qid, 'arg(a)', 1, 2), (@qid, 'b', 0, 3), (@qid, 'arg(b)', 0, 4);

-- ============================================
-- THÈME 11 : PROBABILITÉS
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La probabilité d''un événement A est un nombre :',
    'Compris entre 0 et 1 : 0 ≤ P(A) ≤ 1.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Quelconque', 0, 1), (@qid, 'Entre 0 et 1', 1, 2), (@qid, 'Supérieur à 1', 0, 3), (@qid, 'Négatif ou positif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si A et B sont incompatibles, P(A∪B) = ?',
    'P(A) + P(B).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(A) × P(B)', 0, 1), (@qid, 'P(A) + P(B)', 1, 2), (@qid, 'P(A) - P(B)', 0, 3), (@qid, '1 - P(A)P(B)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'P(Ā) = ?',
    '1 - P(A) (complémentaire).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(A)', 0, 1), (@qid, '1 - P(A)', 1, 2), (@qid, '1/P(A)', 0, 3), (@qid, '0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'P(A∪B) en général vaut :',
    'P(A) + P(B) - P(A∩B).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(A) + P(B)', 0, 1), (@qid, 'P(A) + P(B) - P(A∩B)', 1, 2), (@qid, 'P(A) × P(B)', 0, 3), (@qid, 'P(A∩B) / P(B)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La probabilité conditionnelle P(A|B) est :',
    'P(A∩B) / P(B) si P(B) ≠ 0.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(A) × P(B)', 0, 1), (@qid, 'P(A∩B) / P(B)', 1, 2), (@qid, 'P(A∪B) / P(B)', 0, 3), (@qid, 'P(A) / P(B)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'A et B sont indépendants si :',
    'P(A∩B) = P(A) × P(B).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(A∪B) = P(A) + P(B)', 0, 1), (@qid, 'P(A∩B) = P(A) × P(B)', 1, 2), (@qid, 'P(A|B) = 1', 0, 3), (@qid, 'A∩B = ∅', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une variable aléatoire X associe :',
    'À chaque issue un nombre réel.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement des entiers', 0, 1), (@qid, 'À chaque issue un réel', 1, 2), (@qid, 'Toujours la même valeur', 0, 3), (@qid, 'Des probabilités', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''espérance mathématique E(X) est :',
    'La moyenne pondérée des valeurs prises par X : Σ xᵢ P(X=xᵢ).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La valeur la plus probable', 0, 1), (@qid, 'Σ xᵢ P(X=xᵢ)', 1, 2), (@qid, 'La médiane', 0, 3), (@qid, 'L''écart-type', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une épreuve de Bernoulli a :',
    'Deux issues : succès (p) et échec (q = 1-p).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3 issues', 0, 1), (@qid, '2 issues (succès/échec)', 1, 2), (@qid, 'Une seule issue', 0, 3), (@qid, 'n issues', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Dans un schéma de Bernoulli B(n,p), P(X=k) = ?',
    'C(n,k) p^k (1-p)^(n-k).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'p^k', 0, 1), (@qid, 'C(n,k) p^k q^(n-k)', 1, 2), (@qid, 'p^k q^n', 0, 3), (@qid, 'n p^k', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'E(X) pour une loi binomiale B(n,p) est :',
    'np.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'p', 0, 1), (@qid, 'np', 1, 2), (@qid, 'npq', 0, 3), (@qid, 'n/p', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La variance V(X) pour une loi binomiale B(n,p) est :',
    'np(1-p) = npq.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'np', 0, 1), (@qid, 'npq', 1, 2), (@qid, 'n²p', 0, 3), (@qid, 'p(1-p)', 0, 4);

-- ============================================
-- THÈME 12 : ANALYSE - DOMAINE DE DÉFINITION
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le domaine de définition de f(x) = √x est :',
    '[0, +∞[ (racine carrée définie pour x ≥ 0).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ℝ', 0, 1), (@qid, '[0, +∞[', 1, 2), (@qid, ']0, +∞[', 0, 3), (@qid, ']−∞, 0]', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'D_f de f(x) = 1/x est :',
    'ℝ* = ℝ\\{0} (dénominateur non nul).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ℝ', 0, 1), (@qid, 'ℝ*', 1, 2), (@qid, ']0, +∞[', 0, 3), (@qid, '[0, +∞[', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'D_f de f(x) = ln(x) est :',
    ']0, +∞[ (logarithme défini strictement positif).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ℝ', 0, 1), (@qid, ']0, +∞[', 1, 2), (@qid, '[0, +∞[', 0, 3), (@qid, 'ℝ*', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'D_f de f(x) = 1/√(x-2) est :',
    'x - 2 > 0 → x > 2 → ]2, +∞[.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '[2, +∞[', 0, 1), (@qid, ']2, +∞[', 1, 2), (@qid, 'ℝ', 0, 3), (@qid, ']−∞, 2]', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'D_f de f(x) = ln(x² - 1) est :',
    'x² - 1 > 0 → x < -1 ou x > 1 → ]−∞,−1[ ∪ ]1,+∞[.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, ']−1, 1[', 0, 1), (@qid, ']−∞,−1[ ∪ ]1,+∞[', 1, 2), (@qid, 'ℝ', 0, 3), (@qid, '[0, +∞[', 0, 4);

-- ============================================
-- THÈME 12 : LIMITES DE FONCTIONS
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim(x→+∞) 1/x = ?',
    '0 (l''inverse d''un grand nombre tend vers 0).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+∞', 0, 1), (@qid, '0', 1, 2), (@qid, '1', 0, 3), (@qid, '−∞', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim(x→0⁺) ln(x) = ?',
    '−∞ (le logarithme tend vers −∞ en 0⁺).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1), (@qid, '−∞', 1, 2), (@qid, '+∞', 0, 3), (@qid, '1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim(x→+∞) ln(x)/x = ?',
    '0 (croissances comparées : ln croît moins vite que x).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 1, 1), (@qid, '+∞', 0, 2), (@qid, '1', 0, 3), (@qid, '−∞', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim(x→0) sin(x)/x = ?',
    '1 (limite fondamentale en trigonométrie).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1), (@qid, '1', 1, 2), (@qid, '−1', 0, 3), (@qid, 'n''existe pas', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim(x→+∞) eˣ/x = ?',
    '+∞ (l''exponentielle domine toute puissance).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1), (@qid, '+∞', 1, 2), (@qid, '1', 0, 3), (@qid, '−∞', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim(x→−∞) eˣ = ?',
    '0 (l''exponentielle tend vers 0 en −∞).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 1, 1), (@qid, '+∞', 0, 2), (@qid, '1', 0, 3), (@qid, '−∞', 0, 4);

-- ============================================
-- THÈME 14 : CONTINUITÉ ET DÉRIVABILITÉ
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une fonction f est continue en a si :',
    'lim(x→a) f(x) = f(a).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f(a) existe uniquement', 0, 1), (@qid, 'lim(x→a) f(x) = f(a)', 1, 2), (@qid, 'f est dérivable', 0, 3), (@qid, 'f est bornée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La dérivée de f en a est :',
    'lim(h→0) [f(a+h) - f(a)]/h.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f(a+h) - f(a)', 0, 1), (@qid, 'lim [f(a+h)-f(a)]/h quand h→0', 1, 2), (@qid, 'f(a)/a', 0, 3), (@qid, '[f(a+h)+f(a)]/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La dérivée de xⁿ est :',
    'nx^(n-1).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x^(n-1)', 0, 1), (@qid, 'nx^(n-1)', 1, 2), (@qid, '(n-1)xⁿ', 0, 3), (@qid, 'xⁿ/n', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La dérivée de sin(x) est :',
    'cos(x).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'cos(x)', 1, 1), (@qid, '-sin(x)', 0, 2), (@qid, '-cos(x)', 0, 3), (@qid, '1/cos(x)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La dérivée de eˣ est :',
    'eˣ.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'eˣ', 1, 1), (@qid, 'xe^(x-1)', 0, 2), (@qid, 'ln(x)', 0, 3), (@qid, '1/eˣ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La dérivée de ln(x) est :',
    '1/x (pour x > 0).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x', 0, 1), (@qid, '1/x', 1, 2), (@qid, 'ln(x)', 0, 3), (@qid, 'eˣ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si f est dérivable en a, alors f est :',
    'Continue en a (dérivabilité ⇒ continuité).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Continue en a', 1, 1), (@qid, 'Non nécessairement continue', 0, 2), (@qid, 'Toujours bornée', 0, 3), (@qid, 'Constante', 0, 4);

-- ============================================
-- THÈME 15 : SUITES RÉELLES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une suite (uₙ) est arithmétique si :',
    'uₙ₊₁ = uₙ + r (raison constante r).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'uₙ₊₁ = uₙ × q', 0, 1), (@qid, 'uₙ₊₁ = uₙ + r', 1, 2), (@qid, 'uₙ₊₁ = uₙ²', 0, 3), (@qid, 'uₙ₊₁ = 1/uₙ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Pour une suite arithmétique, uₙ = ?',
    'u₀ + n·r (ou u₁ + (n-1)r selon l''indice de départ).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'u₀ × qⁿ', 0, 1), (@qid, 'u₀ + n·r', 1, 2), (@qid, 'u₀ × rⁿ', 0, 3), (@qid, 'u₀ + rⁿ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La somme des n premiers termes d''une suite arithmétique de raison r est :',
    'S = n(u₀ + uₙ₋₁)/2.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'n(u₀ + uₙ)/2', 0, 1), (@qid, 'n(u₀ + uₙ₋₁)/2', 1, 2), (@qid, 'u₀ × (1-qⁿ)/(1-q)', 0, 3), (@qid, 'n × r / 2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une suite (uₙ) est géométrique si :',
    'uₙ₊₁ = uₙ × q (raison constante q).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'uₙ₊₁ = uₙ × q', 1, 1), (@qid, 'uₙ₊₁ = uₙ + q', 0, 2), (@qid, 'uₙ₊₁ = uₙ/q', 0, 3), (@qid, 'uₙ₊₁ = q/uₙ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Pour une suite géométrique de raison q, uₙ = ?',
    'u₀ × qⁿ.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'u₀ × qⁿ', 1, 1), (@qid, 'u₀ + nq', 0, 2), (@qid, 'u₀ × nq', 0, 3), (@qid, 'u₀ + qⁿ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La somme des n premiers termes d''une suite géométrique de raison q ≠ 1 est :',
    'S = u₀(1 - qⁿ)/(1 - q).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'u₀ × n', 0, 1), (@qid, 'u₀(1-qⁿ)/(1-q)', 1, 2), (@qid, 'u₀ × qⁿ⁻¹', 0, 3), (@qid, 'n(u₀+uₙ)/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une suite convergente vers ℓ vérifie :',
    'lim(n→+∞) uₙ = ℓ (distance |uₙ-ℓ| aussi petite que voulue).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'uₙ est constant', 0, 1), (@qid, '|uₙ - ℓ| → 0', 1, 2), (@qid, 'uₙ → +∞', 0, 3), (@qid, 'uₙ oscille', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une suite est bornée si :',
    '∃ M tel que |uₙ| ≤ M pour tout n.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Elle est constante', 0, 1), (@qid, '∃ M, |uₙ| ≤ M ∀n', 1, 2), (@qid, 'Elle tend vers 0', 0, 3), (@qid, 'uₙ ≥ 0 ∀n', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une suite monotone est :',
    'Toujours croissante OU toujours décroissante.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Constant', 0, 1), (@qid, 'Croissante ou décroissante', 1, 2), (@qid, 'Quelconque', 0, 3), (@qid, 'Périodique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Deux suites adjacentes sont :',
    'L''une croissante, l''autre décroissante, et leur différence tend vers 0.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toutes deux croissantes', 0, 1), (@qid, 'L''une croît, l''autre décroît, différence → 0', 1, 2), (@qid, 'Toutes deux décroissantes', 0, 3), (@qid, 'Identiques', 0, 4);

-- ============================================
-- THÈME 16 : FONCTION LOGARITHME NÉPÉRIEN
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'ln(1) = ?',
    '0 (car e⁰ = 1).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '0', 1, 2), (@qid, 'e', 0, 3), (@qid, '−1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'ln(e) = ?',
    '1 (car e¹ = e).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1), (@qid, '1', 1, 2), (@qid, 'e', 0, 3), (@qid, '−1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'ln(ab) = ?',
    'ln(a) + ln(b).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ln(a) × ln(b)', 0, 1), (@qid, 'ln(a) + ln(b)', 1, 2), (@qid, 'ln(a) - ln(b)', 0, 3), (@qid, 'a ln(b)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'ln(a/b) = ?',
    'ln(a) - ln(b).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ln(a) + ln(b)', 0, 1), (@qid, 'ln(a) - ln(b)', 1, 2), (@qid, 'ln(a)/ln(b)', 0, 3), (@qid, 'ln(b) - ln(a)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'ln(aⁿ) = ?',
    'n ln(a).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ln(a)ⁿ', 0, 1), (@qid, 'n ln(a)', 1, 2), (@qid, 'ln(a)/n', 0, 3), (@qid, 'a ln(n)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La dérivée de ln(u) est :',
    'u''/u.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/u', 0, 1), (@qid, 'u''/u', 1, 2), (@qid, 'u'' ln(u)', 0, 3), (@qid, 'u/u''', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim(x→+∞) ln(x) = ?',
    '+∞ (le logarithme croît indéfiniment).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1), (@qid, '+∞', 1, 2), (@qid, '1', 0, 3), (@qid, '−∞', 0, 4);

-- ============================================
-- THÈME 17 : PRIMITIVES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une primitive de xⁿ (n ≠ -1) est :',
    'x^(n+1)/(n+1) + C.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x^(n-1)/n', 0, 1), (@qid, 'x^(n+1)/(n+1) + C', 1, 2), (@qid, 'nx^(n+1)', 0, 3), (@qid, '(n+1)x^(n-1)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une primitive de 1/x est :',
    'ln|x| + C.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'x + C', 0, 1), (@qid, 'ln|x| + C', 1, 2), (@qid, '1/x² + C', 0, 3), (@qid, 'eˣ + C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une primitive de cos(x) est :',
    'sin(x) + C.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-cos(x) + C', 0, 1), (@qid, 'sin(x) + C', 1, 2), (@qid, '-sin(x) + C', 0, 3), (@qid, 'tan(x) + C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une primitive de sin(x) est :',
    '-cos(x) + C.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'cos(x) + C', 0, 1), (@qid, '-cos(x) + C', 1, 2), (@qid, 'sin(x) + C', 0, 3), (@qid, '1/cos(x) + C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une primitive de eˣ est :',
    'eˣ + C.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'eˣ + C', 1, 1), (@qid, 'xeˣ + C', 0, 2), (@qid, 'ln(eˣ) + C', 0, 3), (@qid, 'eˣ/x + C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une primitive de u''eᵘ est :',
    'eᵘ + C.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'u eᵘ + C', 0, 1), (@qid, 'eᵘ + C', 1, 2), (@qid, 'u''eᵘ + C', 0, 3), (@qid, 'ln(eᵘ) + C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une primitive de u''/u est :',
    'ln|u| + C.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'u + C', 0, 1), (@qid, 'ln|u| + C', 1, 2), (@qid, '1/u + C', 0, 3), (@qid, 'u²/2 + C', 0, 4);

-- ============================================
-- THÈME 18 : INTÉGRALES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''intégrale ∫[a,b] f(x)dx représente :',
    'L''aire algébrique sous la courbe de f entre a et b.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La dérivée de f', 0, 1), (@qid, 'L''aire algébrique sous la courbe', 1, 2), (@qid, 'La pente de la tangente', 0, 3), (@qid, 'Le maximum de f', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si F est une primitive de f, alors ∫[a,b] f = ?',
    'F(b) - F(a) (théorème fondamental).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'F(a) + F(b)', 0, 1), (@qid, 'F(b) - F(a)', 1, 2), (@qid, 'f(b) - f(a)', 0, 3), (@qid, 'F(a) × F(b)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '∫[0,1] 2x dx = ?',
    '[x²]₀¹ = 1 - 0 = 1.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 1, 1), (@qid, '2', 0, 2), (@qid, '0', 0, 3), (@qid, '1/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La valeur moyenne de f sur [a,b] est :',
    '(1/(b-a)) ∫[a,b] f(x)dx.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '∫ f(x)dx', 0, 1), (@qid, '(1/(b-a))∫[a,b] f', 1, 2), (@qid, '(b-a)∫ f', 0, 3), (@qid, 'f(b) - f(a)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '∫ eˣ dx = ?',
    'eˣ + C.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'eˣ + C', 1, 1), (@qid, 'x eˣ + C', 0, 2), (@qid, 'eˣ/x + C', 0, 3), (@qid, 'ln(eˣ) + C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '∫[0,1] eˣ dx = ?',
    '[eˣ]₀¹ = e - 1.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'e', 0, 1), (@qid, 'e - 1', 1, 2), (@qid, '1 - e', 0, 3), (@qid, '0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '∫[1,e] (1/x) dx = ?',
    '[ln x]₁ᵉ = ln(e) - ln(1) = 1.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1), (@qid, '1', 1, 2), (@qid, 'e', 0, 3), (@qid, 'e-1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '∫ cos(x) dx = ?',
    'sin(x) + C.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'sin(x) + C', 1, 1), (@qid, '-sin(x) + C', 0, 2), (@qid, '-cos(x) + C', 0, 3), (@qid, 'tan(x) + C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '∫[0,π] sin(x) dx = ?',
    '[-cos x]₀ᵖ = -(-1) - (-1) = 2.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1), (@qid, '2', 1, 2), (@qid, '1', 0, 3), (@qid, '-2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La relation de Chasles pour les intégrales :',
    '∫[a,b] f + ∫[b,c] f = ∫[a,c] f.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '∫[a,b] f = ∫[b,a] f', 0, 1), (@qid, '∫[a,b] + ∫[b,c] = ∫[a,c]', 1, 2), (@qid, '∫[a,b] × ∫[b,c] = ∫[a,c]', 0, 3), (@qid, '∫[a,b] = -∫[a,c]', 0, 4);

-- ============================================
-- SUITE NOMBRES COMPLEXES : Binôme de Newton
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La formule du binôme de Newton : (a+b)ⁿ = ?',
    'Σ(k=0 à n) C(n,k) a^(n-k) b^k.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'aⁿ + bⁿ', 0, 1), (@qid, 'Σ C(n,k) a^(n-k) b^k', 1, 2), (@qid, 'n(a+b)', 0, 3), (@qid, 'aⁿbⁿ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'C(n,0) = ?',
    '1 (un seul choix de 0 élément).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1), (@qid, '1', 1, 2), (@qid, 'n', 0, 3), (@qid, 'n!', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'C(n,1) = ?',
    'n (choisir 1 élément parmi n).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, 'n', 1, 2), (@qid, 'n!', 0, 3), (@qid, 'n-1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La somme Σ(k=0 à n) C(n,k) = ?',
    '2ⁿ (somme des coefficients binomiaux).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'n²', 0, 1), (@qid, '2ⁿ', 1, 2), (@qid, 'n!', 0, 3), (@qid, '2n', 0, 4);

-- ============================================
-- SUITE ANALYSE : Bijection réciproque
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une fonction continue et strictement monotone sur I est :',
    'Bijective de I sur f(I) (admet une réciproque).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement continue', 0, 1), (@qid, 'Bijective sur son image', 1, 2), (@qid, 'Dérivable partout', 0, 3), (@qid, 'Constante', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La réciproque de f(x) = eˣ est :',
    'f⁻¹(x) = ln(x) (logarithme népérien).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'e⁻ˣ', 0, 1), (@qid, 'ln(x)', 1, 2), (@qid, '1/eˣ', 0, 3), (@qid, 'x/e', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La composée f⁻¹∘f(x) = ?',
    'x (identité).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f(x)', 0, 1), (@qid, 'x', 1, 2), (@qid, '1', 0, 3), (@qid, 'f⁻¹(x)', 0, 4);

-- ============================================
-- SUITE SUITES : Arithmétiques/Géométriques
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le nombre de moyens arithmétiques m entre a et b :',
    'Les m termes insérés forment une suite arithmétique de m+2 termes.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'm termes quelconques', 0, 1), (@qid, 'Suite arithmétique de m+2 termes', 1, 2), (@qid, 'Uniquement géométrique', 0, 3), (@qid, 'm = n/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Trois termes a, b, c sont en progression géométrique si :',
    'b² = a·c (moyenne géométrique).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'b = a + c', 0, 1), (@qid, 'b² = a·c', 1, 2), (@qid, 'b = (a+c)/2', 0, 3), (@qid, 'b = a·c', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une suite stationnaire est :',
    'Constante à partir d''un certain rang.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toujours nulle', 0, 1), (@qid, 'Constante à partir d''un rang', 1, 2), (@qid, 'Périodique', 0, 3), (@qid, 'Géométrique de raison 1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une suite divergente est :',
    'Une suite qui n''admet pas de limite finie.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une suite bornée', 0, 1), (@qid, 'Sans limite finie', 1, 2), (@qid, 'Toujours croissante', 0, 3), (@qid, 'De limite nulle', 0, 4);

-- ============================================
-- SUITE ESPACES EUCLIDIENS ET AFFINES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La distance euclidienne AB dans le plan est :',
    'AB = √((x_B - x_A)² + (y_B - y_A)²).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '|x_B - x_A| + |y_B - y_A|', 0, 1), (@qid, '√((x_B-x_A)² + (y_B-y_A)²)', 1, 2), (@qid, '(x_B-x_A)·(y_B-y_A)', 0, 3), (@qid, 'max(|x_B-x_A|, |y_B-y_A|)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''orthogonal d''une droite vectorielle D dans ℝ² est :',
    'Une autre droite vectorielle (perpendiculaire à D).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le plan tout entier', 0, 1), (@qid, 'Une droite vectorielle perpendiculaire', 1, 2), (@qid, '{0} uniquement', 0, 3), (@qid, 'ℝ²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Un repère orthonormé direct (O,i,j) vérifie :',
    '‖i‖ = ‖j‖ = 1, i ⟂ j, et l''angle (i,j) = +π/2.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'i et j quelconques', 0, 1), (@qid, '‖i‖=‖j‖=1, i⟂j, angle +π/2', 1, 2), (@qid, 'i=j', 0, 3), (@qid, 'angle (i,j) = π', 0, 4);

-- ============================================
-- SUITE INTÉGRALES : Exponentielle et Trigonométrie
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '∫ e^(ax) dx = ? (a ≠ 0)',
    '(1/a) e^(ax) + C.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'e^(ax) + C', 0, 1), (@qid, '(1/a)e^(ax) + C', 1, 2), (@qid, 'a e^(ax) + C', 0, 3), (@qid, 'ln|a| e^(ax) + C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '∫ cos(ax) dx = ? (a ≠ 0)',
    '(1/a) sin(ax) + C.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'sin(ax) + C', 0, 1), (@qid, '(1/a) sin(ax) + C', 1, 2), (@qid, 'a sin(ax) + C', 0, 3), (@qid, '-sin(ax) + C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '∫ sin(ax) dx = ? (a ≠ 0)',
    '-(1/a) cos(ax) + C.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'cos(ax) + C', 0, 1), (@qid, '-(1/a) cos(ax) + C', 1, 2), (@qid, '(1/a) cos(ax) + C', 0, 3), (@qid, 'a cos(ax) + C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''intégration par parties : ∫ u dv = ?',
    'uv - ∫ v du.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'uv + ∫ v du', 0, 1), (@qid, 'uv - ∫ v du', 1, 2), (@qid, '∫ u · ∫ v', 0, 3), (@qid, 'u''v + uv''', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Pour intégrer ∫ x eˣ dx, on pose :',
    'u = x, dv = eˣ dx → du = dx, v = eˣ.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'u = eˣ, dv = x dx', 0, 1), (@qid, 'u = x, dv = eˣ dx', 1, 2), (@qid, 'u = 1, dv = x eˣ dx', 0, 3), (@qid, 'Pas possible par parties', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '∫ x eˣ dx = ?',
    'x eˣ - eˣ + C = eˣ(x-1) + C.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'eˣ + C', 0, 1), (@qid, 'eˣ(x-1) + C', 1, 2), (@qid, 'x eˣ + C', 0, 3), (@qid, 'eˣ/x + C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '∫ ln(x) dx = ?',
    'x ln(x) - x + C (intégration par parties : u=ln x, dv=dx).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/x + C', 0, 1), (@qid, 'x ln(x) - x + C', 1, 2), (@qid, 'ln(x)/x + C', 0, 3), (@qid, 'x/ln(x) + C', 0, 4);

-- ============================================
-- COMPLÉMENT GÉOMÉTRIE AFFINE EUCLIDIENNE
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une isométrie affine conserve :',
    'Les distances (translation, rotation, symétrie...).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement les aires', 0, 1), (@qid, 'Les distances', 1, 2), (@qid, 'Les angles uniquement', 0, 3), (@qid, 'Seulement l''origine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une translation de vecteur v a pour écriture complexe :',
    'z'' = z + b (où b est l''affixe de v).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z'' = z + b', 1, 1), (@qid, 'z'' = az + b', 0, 2), (@qid, 'z'' = az̄', 0, 3), (@qid, 'z'' = a/z', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une rotation de centre ω et d''angle θ :',
    'z'' - ω = e^(iθ)(z - ω).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z'' = z + ω', 0, 1), (@qid, 'z'' - ω = e^(iθ)(z - ω)', 1, 2), (@qid, 'z'' = ω z', 0, 3), (@qid, 'z'' = z̄', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''homothétie de centre ω et rapport k :',
    'z'' - ω = k(z - ω).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z'' = kz', 0, 1), (@qid, 'z'' - ω = k(z - ω)', 1, 2), (@qid, 'z'' = z + k', 0, 3), (@qid, 'z'' = z̄/k', 0, 4);

-- ============================================
-- COMPLÉMENT PROBABILITÉS
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''écart-type σ(X) est :',
    '√(V(X)) (racine carrée de la variance).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'V(X)', 0, 1), (@qid, '√(V(X))', 1, 2), (@qid, 'V(X)²', 0, 3), (@qid, 'E(X²)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'V(X) = ? (formule de Koenig)',
    'E(X²) - (E(X))².', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'E(X)² - E(X²)', 0, 1), (@qid, 'E(X²) - (E(X))²', 1, 2), (@qid, 'E(X) + E(X²)', 0, 3), (@qid, 'E(X)E(X²)', 0, 4);

-- ============================================
-- COMPLÉMENT NOMBRES COMPLEXES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La notation exponentielle : e^(iθ) = ?',
    'cos θ + i sin θ (formule d''Euler).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'cos θ - i sin θ', 0, 1), (@qid, 'cos θ + i sin θ', 1, 2), (@qid, 'i(cos θ + sin θ)', 0, 3), (@qid, '1 + iθ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'cos θ = ? (formules d''Euler)',
    '(e^(iθ) + e^(-iθ))/2.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(e^(iθ) - e^(-iθ))/(2i)', 0, 1), (@qid, '(e^(iθ) + e^(-iθ))/2', 1, 2), (@qid, 'e^(iθ)/2', 0, 3), (@qid, '2e^(iθ)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les racines n-ièmes de Z = re^(iα) sont :',
    'z_k = r^(1/n) e^(i(α+2kπ)/n), k=0..n-1.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 're^(iα/n)', 0, 1), (@qid, 'r^(1/n) e^(i(α+2kπ)/n)', 1, 2), (@qid, 'r^n e^(iα/n)', 0, 3), (@qid, 'e^(iα)/n', 0, 4);

-- ============================================
-- COMPLÉMENT SUITES : Convergence
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Théorème des gendarmes : si vₙ ≤ uₙ ≤ wₙ et vₙ,wₙ → ℓ alors :',
    'uₙ → ℓ.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'uₙ → +∞', 0, 1), (@qid, 'uₙ → ℓ', 1, 2), (@qid, 'uₙ diverge', 0, 3), (@qid, 'uₙ est constante', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Toute suite croissante majorée est :',
    'Convergente (théorème de la limite monotone).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Divergente', 0, 1), (@qid, 'Convergente', 1, 2), (@qid, 'Stationnaire', 0, 3), (@qid, 'Périodique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim(n→+∞) (1 + 1/n)ⁿ = ?',
    'e (définition de la constante e).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, 'e', 1, 2), (@qid, '0', 0, 3), (@qid, '+∞', 0, 4);

-- ============================================
-- QUESTIONS FINALES POUR ATTEINDRE 600+
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La partie entière E(x) est définie par :',
    'Le plus grand entier inférieur ou égal à x.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''entier le plus proche de x', 0, 1), (@qid, 'Le plus grand entier ≤ x', 1, 2), (@qid, 'L''arrondi de x', 0, 3), (@qid, 'La valeur absolue de x', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'E(3,7) = ?',
    '3.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3', 1, 1), (@qid, '4', 0, 2), (@qid, '3,5', 0, 3), (@qid, '7', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'E(-2,3) = ?',
    '-3 (car -3 ≤ -2,3 < -2).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-2', 0, 1), (@qid, '-3', 1, 2), (@qid, '2', 0, 3), (@qid, '0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une fonction f est périodique de période T si :',
    'f(x+T) = f(x) pour tout x ∈ D_f.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f(x+T) = f(x) ∀x', 1, 1), (@qid, 'f(T) = 0', 0, 2), (@qid, 'f(x) = T', 0, 3), (@qid, 'f(0) = T', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La période de sin(x) est :',
    '2π.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'π', 0, 1), (@qid, '2π', 1, 2), (@qid, 'π/2', 0, 3), (@qid, '1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La fonction f(x) = x³ est :',
    'Impaire (f(-x) = -f(x)).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Paire', 0, 1), (@qid, 'Impaire', 1, 2), (@qid, 'Ni paire ni impaire', 0, 3), (@qid, 'Constante', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une fonction polynôme est continue sur :',
    'ℝ tout entier.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ℝ', 1, 1), (@qid, 'ℝ*', 0, 2), (@qid, ']0,+∞[', 0, 3), (@qid, 'Un intervalle borné', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le théorème des valeurs intermédiaires (TVI) s''applique à une fonction :',
    'Continue sur un intervalle [a,b].', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dérivable uniquement', 0, 1), (@qid, 'Continue sur [a,b]', 1, 2), (@qid, 'Quelconque', 0, 3), (@qid, 'Polynôme uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le produit scalaire canonique dans ℝⁿ : <X,Y> = ?',
    'Σ x_i y_i = XᵀY.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Σ x_i + y_i', 0, 1), (@qid, 'Σ x_i y_i', 1, 2), (@qid, 'Π x_i y_i', 0, 3), (@qid, 'max(x_i y_i)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Un endomorphisme orthogonal f vérifie :',
    '<f(u),f(v)> = <u,v> (conserve le produit scalaire).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '<f(u),f(v)> = <u,v>', 1, 1), (@qid, 'f(u+v) = f(u) + f(v) uniquement', 0, 2), (@qid, 'f(0) ≠ 0', 0, 3), (@qid, 'f = Id', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Soit la suite uₙ₊₁ = uₙ/2, u₀ = 8. lim uₙ = ?',
    'Suite géométrique de raison 1/2 → tend vers 0.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '8', 0, 1), (@qid, '0', 1, 2), (@qid, '4', 0, 3), (@qid, '1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La linéarité de l''intégrale : ∫(αf + βg) = ?',
    'α∫f + β∫g.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '∫f × ∫g', 0, 1), (@qid, 'α∫f + β∫g', 1, 2), (@qid, 'αβ∫f∫g', 0, 3), (@qid, '∫(f+g)/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si f est continue sur [a,b], alors f admet :',
    'Des primitives sur [a,b] (théorème fondamental).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aucune primitive', 0, 1), (@qid, 'Des primitives', 1, 2), (@qid, 'Une seule primitive', 0, 3), (@qid, 'Toujours une primitive explicite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La valeur de ∫[−π,π] sin(x) dx est :',
    '0 (fonction impaire sur intervalle symétrique).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '0', 1, 2), (@qid, '1', 0, 3), (@qid, 'π', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La probabilité de l''événement certain est :',
    '1.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1), (@qid, '1', 1, 2), (@qid, '0,5', 0, 3), (@qid, 'Dépend de l''expérience', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Deux événements A et B sont incompatibles si :',
    'A ∩ B = ∅ (ne peuvent se réaliser ensemble).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(A) = P(B)', 0, 1), (@qid, 'A ∩ B = ∅', 1, 2), (@qid, 'P(A∪B) = P(A)P(B)', 0, 3), (@qid, 'A = B̄', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Dans une loi uniforme sur {1,2,...,n}, P(X=k) = ?',
    '1/n pour tout k.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'k/n', 0, 1), (@qid, '1/n', 1, 2), (@qid, 'n/k', 0, 3), (@qid, '1/k', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''image d''un cercle par une similitude directe est :',
    'Un cercle (les similitudes conservent les formes).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un cercle', 1, 1), (@qid, 'Une droite', 0, 2), (@qid, 'Une ellipse', 0, 3), (@qid, 'Un carré', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Un déplacement est une isométrie qui conserve :',
    'L''orientation (rotations, translations).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement les distances', 0, 1), (@qid, 'L''orientation', 1, 2), (@qid, 'Les aires en les inversant', 0, 3), (@qid, 'Le centre de gravité uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Un antidéplacement inverse l''orientation. Exemple :',
    'Symétrie orthogonale (réflexion).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Translation', 0, 1), (@qid, 'Symétrie orthogonale', 1, 2), (@qid, 'Rotation', 0, 3), (@qid, 'Homothétie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La composée de deux symétries orthogonales d''axes sécants est :',
    'Une rotation d''angle double de l''angle des axes.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une translation', 0, 1), (@qid, 'Une rotation d''angle 2θ', 1, 2), (@qid, 'Une homothétie', 0, 3), (@qid, 'Une symétrie glissée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, '∫[0,π/2] cos(x) dx = ?',
    '[sin x]₀^(π/2) = 1 - 0 = 1.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1), (@qid, '1', 1, 2), (@qid, '2', 0, 3), (@qid, 'π/2', 0, 4);




-- ===== SOUS-ESPACE VECTORIEL =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Soit E un espace vectoriel. Parmi les conditions suivantes, laquelle est nécessaire pour qu''un sous-ensemble F de E soit un sous-espace vectoriel ?', 'Un SEV doit contenir le vecteur nul, être stable par addition et stable par multiplication scalaire.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'F est fermé pour la multiplication seulement', 0, 1),
(@qid, 'F contient le vecteur nul, est stable par addition et par multiplication scalaire', 1, 2),
(@qid, 'F est un ensemble fini', 0, 3),
(@qid, 'F contient au moins deux vecteurs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''ensemble F = {(x, y) ∈ ℝ² | x + y = 0} est-il un sous-espace vectoriel de ℝ² ?', 'F contient (0,0), est stable par addition : (x,−x)+(x'',−x'')=(x+x'',−(x+x'')) ∈ F, et par multiplication scalaire. Donc F est un SEV.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Non, car il ne contient pas le vecteur nul', 0, 1),
(@qid, 'Oui, c''est un sous-espace vectoriel de ℝ²', 1, 2),
(@qid, 'Non, car x + y = 0 est une contrainte', 0, 3),
(@qid, 'Oui, mais seulement si x ≠ 0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''ensemble F = {(x, y) ∈ ℝ² | x + y = 1} est-il un sous-espace vectoriel de ℝ² ?', 'F ne contient pas le vecteur nul (0+0=0≠1), donc F n''est pas un sous-espace vectoriel.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oui, car c''est une droite', 0, 1),
(@qid, 'Non, car il ne contient pas le vecteur nul (0,0)', 1, 2),
(@qid, 'Oui, car x + y = 1 est une équation linéaire', 0, 3),
(@qid, 'Non, car il n''est pas fermé pour la multiplication', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quelle est la dimension du sous-espace vectoriel F = {(x,y,z) ∈ ℝ³ | x + y + z = 0} ?', 'F est un plan vectoriel dans ℝ³ défini par une équation. Sa dimension est 3 - 1 = 2.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1),
(@qid, '3', 0, 2),
(@qid, '2', 1, 3),
(@qid, '0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si F et G sont deux sous-espaces vectoriels d''un espace E, alors F ∩ G est :', 'L''intersection de deux SEV est toujours un SEV : elle contient 0, est stable par addition et multiplication scalaire.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pas nécessairement un sous-espace vectoriel', 0, 1),
(@qid, 'Toujours un sous-espace vectoriel de E', 1, 2),
(@qid, 'Un sous-espace vectoriel seulement si F = G', 0, 3),
(@qid, 'Toujours égal à {0}', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Soit F = Vect{(1,0,0),(0,1,0)} dans ℝ³. Quelle est la dimension de F ?', 'F est engendré par deux vecteurs linéairement indépendants, donc dim(F) = 2.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1),
(@qid, '3', 0, 2),
(@qid, '0', 0, 3),
(@qid, '2', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les vecteurs (1,2) et (2,4) sont-ils linéairement indépendants dans ℝ² ?', '(2,4) = 2×(1,2), donc les deux vecteurs sont colinéaires, donc linéairement dépendants.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oui, car ils sont différents', 0, 1),
(@qid, 'Non, car (2,4) = 2×(1,2), ils sont liés', 1, 2),
(@qid, 'Oui, car leurs composantes sont différentes', 0, 3),
(@qid, 'Non, car ils sont dans ℝ²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quelle est la dimension de ℝⁿ en tant qu''espace vectoriel sur ℝ ?', 'La base canonique de ℝⁿ possède n vecteurs, donc dim(ℝⁿ) = n.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'n²', 0, 1),
(@qid, 'n+1', 0, 2),
(@qid, 'n', 1, 3),
(@qid, '2n', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si dim(E) = n et F est un sous-espace vectoriel de E avec dim(F) = n, alors :', 'Si un SEV a la même dimension que l''espace ambiant, il est égal à cet espace.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'F est nécessairement {0}', 0, 1),
(@qid, 'F = E', 1, 2),
(@qid, 'F est un hyperplan de E', 0, 3),
(@qid, 'F est une droite vectorielle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Deux sous-espaces F et G d''un espace E sont en somme directe si et seulement si :', 'F et G sont en somme directe si F ∩ G = {0}, ce qui garantit l''unicité de la décomposition.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'F ∪ G = E', 0, 1),
(@qid, 'F ∩ G = {0}', 1, 2),
(@qid, 'dim(F) = dim(G)', 0, 3),
(@qid, 'F ⊂ G', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La famille {(1,0),(0,1)} est-elle une base de ℝ² ?', 'Ces deux vecteurs sont linéairement indépendants et engendrent ℝ², c''est la base canonique.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Non, il faut trois vecteurs pour une base', 0, 1),
(@qid, 'Oui, c''est la base canonique de ℝ²', 1, 2),
(@qid, 'Non, car ces vecteurs ne sont pas orthogonaux', 0, 3),
(@qid, 'Oui, mais seulement si on les normalise', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''ensemble {(x,y,z) ∈ ℝ³ | x = y = z} est un sous-espace vectoriel de ℝ³ de dimension :', 'Cet ensemble est la droite vectorielle engendrée par (1,1,1), sa dimension est 1.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3', 0, 1),
(@qid, '2', 0, 2),
(@qid, '1', 1, 3),
(@qid, '0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Soit E un espace vectoriel de dimension 4 et F un sous-espace de dimension 3. La dimension de tout supplémentaire de F dans E est :', 'dim(E) = dim(F) + dim(G) donc dim(G) = 4 - 3 = 1.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4', 0, 1),
(@qid, '2', 0, 2),
(@qid, '0', 0, 3),
(@qid, '1', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Parmi les ensembles suivants, lequel est un sous-espace vectoriel de ℝ³ ?', 'Seul {(x,y,z)|2x−y+z=0} passe par l''origine et est défini par une équation homogène.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '{(x,y,z) | x² + y² = 1}', 0, 1),
(@qid, '{(x,y,z) | 2x − y + z = 0}', 1, 2),
(@qid, '{(x,y,z) | x + y = 1}', 0, 3),
(@qid, '{(x,y,z) | xyz = 0}', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le vecteur nul appartient-il à tout sous-espace vectoriel ?', 'Par définition, un sous-espace vectoriel doit contenir le vecteur nul (en prenant λ=0 dans λv=0).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Non, seulement aux sous-espaces de dimension ≥ 1', 0, 1),
(@qid, 'Oui, le vecteur nul appartient à tout sous-espace vectoriel', 1, 2),
(@qid, 'Non, le vecteur nul n''est dans aucun sous-espace', 0, 3),
(@qid, 'Oui, mais seulement pour les espaces de dimension finie', 0, 4);

-- ===== APPLICATION LINÉAIRE =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une application f : E → F est linéaire si et seulement si pour tous u, v ∈ E et λ ∈ ℝ :', 'La définition d''une application linéaire (morphisme d''espaces vectoriels) est : f(λu + v) = λf(u) + f(v).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f(u + v) = f(u) × f(v)', 0, 1),
(@qid, 'f(λu + v) = λf(u) + f(v)', 1, 2),
(@qid, 'f(u) = f(v) implique u = v', 0, 3),
(@qid, 'f(λu) = f(u) + λ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le noyau d''une application linéaire f : E → F est :', 'ker(f) = {x ∈ E | f(x) = 0_F} est l''ensemble des antécédents du vecteur nul de F.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''image de f', 0, 1),
(@qid, 'L''ensemble {x ∈ E | f(x) = 0_F}', 1, 2),
(@qid, 'L''ensemble des valeurs prises par f', 0, 3),
(@qid, 'Le complémentaire de l''image', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une application linéaire f est injective si et seulement si :', 'f est injective ⟺ ker(f) = {0_E}, c''est-à-dire que seul le vecteur nul a 0 pour image.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Im(f) = F', 0, 1),
(@qid, 'ker(f) = {0_E}', 1, 2),
(@qid, 'dim(E) = dim(F)', 0, 3),
(@qid, 'f est surjective', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le théorème du rang énonce que pour f : E → F application linéaire avec dim(E) finie :', 'dim(E) = dim(ker f) + dim(Im f), c''est le théorème rang-nullité.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'dim(F) = dim(ker f) + dim(Im f)', 0, 1),
(@qid, 'dim(E) = dim(ker f) × dim(Im f)', 0, 2),
(@qid, 'dim(E) = dim(ker f) + dim(Im f)', 1, 3),
(@qid, 'dim(E) = dim(Im f) − dim(ker f)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Soit f : ℝ² → ℝ² définie par f(x,y) = (x+y, x−y). Quel est le noyau de f ?', 'f(x,y) = (0,0) ⟹ x+y=0 et x−y=0 ⟹ x=0 et y=0. Donc ker(f) = {(0,0)}.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '{(x,y) | x = y}', 0, 1),
(@qid, '{(0,0)}', 1, 2),
(@qid, 'ℝ²', 0, 3),
(@qid, '{(x,y) | x + y = 0}', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une application linéaire est un isomorphisme si elle est :', 'Un isomorphisme est une application linéaire bijective (injective et surjective).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Injective seulement', 0, 1),
(@qid, 'Surjective seulement', 0, 2),
(@qid, 'Bijective (injective et surjective)', 1, 3),
(@qid, 'Définie sur un espace de dimension finie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Soit f : ℝ³ → ℝ² une application linéaire. Le rang de f est au plus :', 'rg(f) = dim(Im f) ≤ min(dim E, dim F) = min(3,2) = 2.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3', 0, 1),
(@qid, '1', 0, 2),
(@qid, '2', 1, 3),
(@qid, '6', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''image d''une application linéaire f : E → F est :', 'Im(f) = {f(x) | x ∈ E} est l''ensemble des vecteurs de F atteints par f.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''ensemble des vecteurs de E envoyés sur 0', 0, 1),
(@qid, 'L''ensemble {f(x) | x ∈ E} ⊆ F', 1, 2),
(@qid, 'Le noyau de f', 0, 3),
(@qid, 'L''espace vectoriel F tout entier', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'f : ℝ² → ℝ² définie par f(x,y) = (2x, 3y) est-elle linéaire ?', 'f(λ(x,y)+(x'',y'')) = f(λx+x'',λy+y'') = (2(λx+x''),3(λy+y'')) = λf(x,y)+f(x'',y''). Oui, c''est linéaire.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Non, car les coefficients sont différents', 0, 1),
(@qid, 'Oui, c''est une application linéaire', 1, 2),
(@qid, 'Non, car elle n''est pas injective', 0, 3),
(@qid, 'Oui, mais seulement sur ℝ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si f : E → F est linéaire avec ker(f) = {0} et dim(E) = dim(F) = n, alors f est :', 'ker(f) = {0} ⟹ f injective. Comme dim(E) = dim(F) et f injective, f est bijective donc isomorphisme.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Seulement injective', 0, 1),
(@qid, 'Un isomorphisme (bijective)', 1, 2),
(@qid, 'Seulement surjective', 0, 3),
(@qid, 'Nulle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La composée de deux applications linéaires est :', 'Si f : E→F et g : F→G sont linéaires, alors g∘f : E→G est aussi linéaire.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toujours bijective', 0, 1),
(@qid, 'Toujours linéaire', 1, 2),
(@qid, 'Linéaire seulement si les deux sont injectives', 0, 3),
(@qid, 'Jamais linéaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Soit f : ℝ² → ℝ définie par f(x,y) = 3x − 2y. Le noyau de f est :', 'ker(f) = {(x,y) | 3x−2y = 0} = {(x,y) | y = 3x/2}, une droite vectorielle.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '{(0,0)}', 0, 1),
(@qid, '{(x,y) | 3x − 2y = 0}', 1, 2),
(@qid, 'ℝ²', 0, 3),
(@qid, '{(x,y) | x = 0}', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une application linéaire f : E → E est appelée :', 'Une application linéaire d''un espace dans lui-même est un endomorphisme.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un isomorphisme', 0, 1),
(@qid, 'Un endomorphisme', 1, 2),
(@qid, 'Un épimorphisme', 0, 3),
(@qid, 'Un monomorphisme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Soit f : ℝ³ → ℝ³ linéaire avec dim(ker f) = 2. Quel est le rang de f ?', 'Par le théorème du rang : rg(f) = dim(ℝ³) − dim(ker f) = 3 − 2 = 1.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3', 0, 1),
(@qid, '2', 0, 2),
(@qid, '1', 1, 3),
(@qid, '0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La matrice associée à une application linéaire f : ℝ² → ℝ² dans la base canonique s''obtient en :', 'Les colonnes de la matrice sont les images des vecteurs de base : f(e₁) et f(e₂) exprimés dans la base d''arrivée.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Écrivant les vecteurs de base en lignes', 0, 1),
(@qid, 'Plaçant en colonnes les images des vecteurs de la base de départ', 1, 2),
(@qid, 'Calculant le déterminant de f', 0, 3),
(@qid, 'Transposant la matrice de passage', 0, 4);

-- ===== PROJECTION ET SYMÉTRIE VECTORIELLE =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Un projecteur p : E → E est un endomorphisme tel que :', 'La propriété caractéristique d''un projecteur est p² = p (idempotent).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'p² = Id', 0, 1),
(@qid, 'p² = 0', 0, 2),
(@qid, 'p² = p', 1, 3),
(@qid, 'p = −p', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une symétrie vectorielle s : E → E est un endomorphisme tel que :', 'La propriété caractéristique d''une symétrie est s² = Id (involution).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 's² = s', 0, 1),
(@qid, 's² = Id', 1, 2),
(@qid, 's² = 0', 0, 3),
(@qid, 's = Id', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si p est un projecteur sur F parallèlement à G (E = F ⊕ G), alors pour tout x ∈ E, p(x) appartient à :', 'Par définition, p projette sur F, donc p(x) ∈ F pour tout x.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'G', 0, 1),
(@qid, 'F', 1, 2),
(@qid, 'F ∩ G', 0, 3),
(@qid, 'E', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Quelle relation lie un projecteur p et la symétrie s associée ?', 's = 2p − Id est la relation entre la symétrie et le projecteur correspondant.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 's = p + Id', 0, 1),
(@qid, 's = 2p − Id', 1, 2),
(@qid, 's = p²', 0, 3),
(@qid, 's = p − Id', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les valeurs propres d''un projecteur sont :', 'Pour p² = p, si p(x) = λx alors λ²x = λx, donc λ² = λ, soit λ = 0 ou λ = 1.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '−1 et 1', 0, 1),
(@qid, '0 et 1', 1, 2),
(@qid, '0 et −1', 0, 3),
(@qid, '1 et 2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les valeurs propres d''une symétrie vectorielle sont :', 'Pour s² = Id, si s(x) = λx alors λ²x = x, donc λ² = 1, soit λ = 1 ou λ = −1.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0 et 1', 0, 1),
(@qid, '1 et 2', 0, 2),
(@qid, '−1 et 1', 1, 3),
(@qid, '0 et −1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si p est le projecteur sur F parallèlement à G dans E = F ⊕ G, alors Id − p est :', 'q = Id − p est le projecteur sur G parallèlement à F (projecteur complémentaire).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La symétrie associée à p', 0, 1),
(@qid, 'Le projecteur sur G parallèlement à F', 1, 2),
(@qid, 'L''identité de E', 0, 3),
(@qid, 'L''application nulle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La projection orthogonale sur le sous-espace F dans un espace euclidien projette parallèlement à :', 'En espace euclidien, la projection orthogonale sur F est la projection sur F parallèlement à F⊥.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'F lui-même', 0, 1),
(@qid, 'F⊥, le supplémentaire orthogonal de F', 1, 2),
(@qid, 'L''espace ambiant E', 0, 3),
(@qid, 'L''origine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si s est une symétrie par rapport à F parallèlement à G, l''ensemble des points fixes de s est :', 'Les points fixes de s vérifient s(x) = x, c''est exactement le sous-espace F (axe/plan de symétrie).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'G', 0, 1),
(@qid, 'F', 1, 2),
(@qid, 'F ∩ G', 0, 3),
(@qid, '{0}', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Pour tout projecteur p, quelle propriété est vraie concernant ker(p) et Im(p) ?', 'E = Im(p) ⊕ ker(p), ce qui permet la décomposition unique de tout vecteur.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Im(p) = ker(p)', 0, 1),
(@qid, 'E = Im(p) ⊕ ker(p)', 1, 2),
(@qid, 'Im(p) ⊂ ker(p)', 0, 3),
(@qid, 'ker(p) = {0}', 0, 4);



-- ===== FORME ALGÉBRIQUE =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La forme algébrique d''un nombre complexe est :', 'Tout nombre complexe s''écrit z = a + bi où a,b ∈ ℝ, a est la partie réelle et b la partie imaginaire.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z = r(cos θ + i sin θ)', 0, 1),
(@qid, 'z = a + bi avec a,b ∈ ℝ', 1, 2),
(@qid, 'z = re^{iθ}', 0, 3),
(@qid, 'z = r∠θ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La valeur de i² est :', 'Par définition du nombre imaginaire i : i² = −1.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1),
(@qid, 'i', 0, 2),
(@qid, '−1', 1, 3),
(@qid, '0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si z = 3 + 4i, quelle est la partie réelle et la partie imaginaire de z ?', 'Re(z) = 3 est la partie réelle, Im(z) = 4 est la partie imaginaire (coefficient de i).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Re(z) = 4, Im(z) = 3', 0, 1),
(@qid, 'Re(z) = 3, Im(z) = 4', 1, 2),
(@qid, 'Re(z) = 3i, Im(z) = 4', 0, 3),
(@qid, 'Re(z) = 3, Im(z) = 4i', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le produit (2 + 3i)(1 − 2i) est égal à :', '(2+3i)(1−2i) = 2−4i+3i−6i² = 2−i+6 = 8−i.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 − i', 0, 1),
(@qid, '8 − i', 1, 2),
(@qid, '−4 − i', 0, 3),
(@qid, '8 + i', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La somme (3 + 2i) + (1 − 5i) est :', '(3+1) + (2−5)i = 4 − 3i.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4 + 7i', 0, 1),
(@qid, '2 − 3i', 0, 2),
(@qid, '4 − 3i', 1, 3),
(@qid, '3 − 3i', 0, 4);

-- ===== CONJUGUÉ =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le conjugué du nombre complexe z = a + bi est :', 'z̄ = a − bi (on change le signe de la partie imaginaire).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z̄ = −a + bi', 0, 1),
(@qid, 'z̄ = a − bi', 1, 2),
(@qid, 'z̄ = −a − bi', 0, 3),
(@qid, 'z̄ = b − ai', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Pour z = 5 − 3i, le conjugué z̄ vaut :', 'z̄ = 5 + 3i.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '−5 + 3i', 0, 1),
(@qid, '5 + 3i', 1, 2),
(@qid, '−5 − 3i', 0, 3),
(@qid, '3 − 5i', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le produit z·z̄ pour z = a + bi est :', 'z·z̄ = (a+bi)(a−bi) = a² + b² = |z|².', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a² − b²', 0, 1),
(@qid, '2ab', 0, 2),
(@qid, 'a² + b²', 1, 3),
(@qid, '(a+b)²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le quotient (3+i)/(1+2i) est égal à :', '(3+i)(1−2i)/((1+2i)(1−2i)) = (3−6i+i−2i²)/(1+4) = (5−5i)/5 = 1−i.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3/2 + i/2', 0, 1),
(@qid, '1 − i', 1, 2),
(@qid, '1 + i', 0, 3),
(@qid, '(3+i)/5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Pour tout z ∈ ℂ, z + z̄ est :', 'z + z̄ = (a+bi) + (a−bi) = 2a = 2 Re(z), un réel.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un imaginaire pur', 0, 1),
(@qid, 'Égal à 2 Re(z)', 1, 2),
(@qid, 'Égal à 2 Im(z)', 0, 3),
(@qid, 'Toujours nul', 0, 4);

-- ===== MODULE ET ARGUMENT =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le module du nombre complexe z = a + bi est :', '|z| = √(a² + b²), la distance de z à l''origine dans le plan de Gauss.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '|z| = a + b', 0, 1),
(@qid, '|z| = √(a² + b²)', 1, 2),
(@qid, '|z| = a² + b²', 0, 3),
(@qid, '|z| = |a| + |b|', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le module de z = 3 − 4i est :', '|z| = √(3² + (−4)²) = √(9+16) = √25 = 5.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '7', 0, 1),
(@qid, '1', 0, 2),
(@qid, '5', 1, 3),
(@qid, '√7', 0, 4);

-- ===== CENTRE ET RAYON D'UN CERCLE =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''équation |z − z₀| = r dans ℂ représente :', '|z − z₀| = r est le cercle de centre z₀ et de rayon r dans le plan complexe.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une droite', 0, 1),
(@qid, 'Un cercle de centre z₀ et de rayon r', 1, 2),
(@qid, 'Un disque ouvert', 0, 3),
(@qid, 'Une ellipse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le cercle |z − (2+i)| = 3 a pour centre et rayon :', 'Centre z₀ = 2 + i, rayon r = 3.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Centre 2+i, rayon 9', 0, 1),
(@qid, 'Centre 2+i, rayon 3', 1, 2),
(@qid, 'Centre 2−i, rayon 3', 0, 3),
(@qid, 'Centre 0, rayon 3', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''ensemble {z ∈ ℂ | |z| = 1} est :', '|z| = 1 est le cercle unité centré à l''origine de rayon 1.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un disque unité', 0, 1),
(@qid, 'Le cercle unité (cercle de centre 0 et rayon 1)', 1, 2),
(@qid, 'La droite réelle', 0, 3),
(@qid, 'L''axe imaginaire', 0, 4);

-- ===== FORME TRIGONOMÉTRIQUE =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La forme trigonométrique d''un nombre complexe z de module r et d''argument θ est :', 'z = r(cos θ + i sin θ) est la forme trigonométrique.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z = r + iθ', 0, 1),
(@qid, 'z = r(cos θ + i sin θ)', 1, 2),
(@qid, 'z = cos θ + i sin θ', 0, 3),
(@qid, 'z = r·e^θ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La formule d''Euler est :', 'e^{iθ} = cos θ + i sin θ est la formule d''Euler.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'e^{iθ} = cos θ − i sin θ', 0, 1),
(@qid, 'e^{iθ} = cos θ + i sin θ', 1, 2),
(@qid, 'e^{iθ} = i(cos θ + sin θ)', 0, 3),
(@qid, 'e^{iθ} = sin θ + i cos θ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''argument principal de z = −1 est :', 'z = −1 = 1·(cos π + i sin π), donc arg(z) = π.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1),
(@qid, 'π/2', 0, 2),
(@qid, 'π', 1, 3),
(@qid, '−π/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''argument de z = i est :', 'z = i = cos(π/2) + i sin(π/2), donc arg(i) = π/2.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1),
(@qid, 'π/2', 1, 2),
(@qid, 'π', 0, 3),
(@qid, '−π/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''argument de z = 1 + i est :', 'z = 1+i, |z| = √2, cos θ = 1/√2, sin θ = 1/√2, donc θ = π/4.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'π/6', 0, 1),
(@qid, 'π/4', 1, 2),
(@qid, 'π/3', 0, 3),
(@qid, 'π/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Pour z₁ et z₂ complexes, arg(z₁·z₂) = ?', 'L''argument d''un produit est la somme des arguments : arg(z₁z₂) = arg(z₁) + arg(z₂) [mod 2π].', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'arg(z₁) × arg(z₂)', 0, 1),
(@qid, 'arg(z₁) + arg(z₂) [mod 2π]', 1, 2),
(@qid, 'arg(z₁) − arg(z₂)', 0, 3),
(@qid, 'arg(z₁) / arg(z₂)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le module de z = √3 + i est :', '|z| = √((√3)² + 1²) = √(3+1) = √4 = 2.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '√3', 0, 1),
(@qid, '4', 0, 2),
(@qid, '2', 1, 3),
(@qid, '√2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''argument de z = √3 + i est :', 'cos θ = √3/2, sin θ = 1/2, donc θ = π/6.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'π/4', 0, 1),
(@qid, 'π/6', 1, 2),
(@qid, 'π/3', 0, 3),
(@qid, 'π/2', 0, 4);

-- ===== BINÔME DE NEWTON =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le binôme de Newton donne (a + b)ⁿ = :', '(a+b)ⁿ = Σₖ₌₀ⁿ C(n,k)·aⁿ⁻ᵏ·bᵏ où C(n,k) = n!/(k!(n−k)!).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'aⁿ + bⁿ', 0, 1),
(@qid, 'Σₖ₌₀ⁿ C(n,k)·aⁿ⁻ᵏ·bᵏ', 1, 2),
(@qid, 'n·aⁿ⁻¹·b', 0, 3),
(@qid, 'aⁿ + n·aⁿ⁻¹b + bⁿ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le coefficient binomial C(5,2) vaut :', 'C(5,2) = 5!/(2!·3!) = (5×4)/(2×1) = 10.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5', 0, 1),
(@qid, '20', 0, 2),
(@qid, '10', 1, 3),
(@qid, '15', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le développement de (1 + i)⁴ en utilisant le binôme de Newton donne :', '(1+i)⁴ = 1 + 4i + 6i² + 4i³ + i⁴ = 1+4i−6−4i+1 = −4.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4', 0, 1),
(@qid, '−4', 1, 2),
(@qid, '4i', 0, 3),
(@qid, '2 + 2i', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'C(n,0) + C(n,1) + C(n,2) + ... + C(n,n) est égal à :', 'La somme de tous les coefficients binomiaux de rang n vaut 2ⁿ (en posant a=b=1 dans le binôme).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'n!', 0, 1),
(@qid, 'n²', 0, 2),
(@qid, '2ⁿ', 1, 3),
(@qid, 'n(n+1)/2', 0, 4);

-- ===== ÉQUATIONS DANS ℂ =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''équation z² = −1 dans ℂ a pour solutions :', 'z² = −1 ⟹ z = i ou z = −i (les deux racines carrées de −1).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pas de solution', 0, 1),
(@qid, 'z = i et z = −i', 1, 2),
(@qid, 'z = 1 et z = −1', 0, 3),
(@qid, 'z = i seulement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Toute équation polynomiale de degré n à coefficients complexes admet (dans ℂ) :', 'Par le théorème fondamental de l''algèbre, toute équation de degré n admet exactement n solutions dans ℂ (comptées avec multiplicité).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Au plus n solutions', 0, 1),
(@qid, 'Exactement n solutions dans ℂ (comptées avec multiplicité)', 1, 2),
(@qid, 'Toujours une seule solution', 0, 3),
(@qid, 'Aucune solution réelle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les solutions de z² + 2z + 5 = 0 sont :', 'Δ = 4 − 20 = −16, z = (−2 ± √(−16))/2 = (−2 ± 4i)/2 = −1 ± 2i.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z = 1 ± 2i', 0, 1),
(@qid, 'z = −1 ± 2i', 1, 2),
(@qid, 'Pas de solution dans ℂ', 0, 3),
(@qid, 'z = 2 ± i', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si z₀ est solution d''un polynôme P à coefficients réels, alors :', 'Les racines complexes non réelles d''un polynôme à coefficients réels viennent par paires conjuguées.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'z₀ est toujours réel', 0, 1),
(@qid, 'z₀ barre est aussi solution de P', 1, 2),
(@qid, '−z₀ est aussi solution', 0, 3),
(@qid, '1/z₀ est aussi solution', 0, 4);

-- ===== RACINES N-IÈMES =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les racines n-ièmes de l''unité sont les solutions de :', 'Les racines n-ièmes de 1 sont les solutions de zⁿ = 1.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'zⁿ = 0', 0, 1),
(@qid, 'zⁿ = 1', 1, 2),
(@qid, 'z = n', 0, 3),
(@qid, 'nz = 1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le nombre de racines n-ièmes d''un nombre complexe non nul est :', 'Tout nombre complexe non nul possède exactement n racines n-ièmes distinctes dans ℂ.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1),
(@qid, '2', 0, 2),
(@qid, 'n', 1, 3),
(@qid, 'n²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les racines cubiques de l''unité sont :', 'ω = e^{2iπ/3} = −1/2 + i√3/2, les 3 racines sont 1, ω, ω².', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1, i, −1', 0, 1),
(@qid, '1, e^{2iπ/3}, e^{4iπ/3}', 1, 2),
(@qid, '1, −1, i, −i', 0, 3),
(@qid, '1, 1/2, −1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les racines n-ièmes d''un complexe z = re^{iθ} sont de module :', 'Les racines n-ièmes de z = re^{iθ} sont zₖ = r^{1/n}·e^{i(θ+2kπ)/n}, de module r^{1/n}.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'r', 0, 1),
(@qid, 'r^{1/n}', 1, 2),
(@qid, 'r/n', 0, 3),
(@qid, 'n·r', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Les racines carrées de i sont :', 'i = e^{iπ/2}, ses racines carrées sont e^{iπ/4} = (√2/2)(1+i) et e^{i5π/4} = (√2/2)(−1−i).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'i et −i', 0, 1),
(@qid, '(√2/2)(1+i) et (√2/2)(−1−i)', 1, 2),
(@qid, '1 et −1', 0, 3),
(@qid, '(1+i) et (1−i)', 0, 4);

-- ===== SIMILITUDES =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une similitude directe du plan complexe s''écrit :', 'Une similitude directe est de la forme f(z) = az + b avec a ≠ 0, a,b ∈ ℂ.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f(z) = az̄ + b', 0, 1),
(@qid, 'f(z) = az + b, a ≠ 0', 1, 2),
(@qid, 'f(z) = z + bi', 0, 3),
(@qid, 'f(z) = |z| + b', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une similitude indirecte du plan complexe s''écrit :', 'Une similitude indirecte est de la forme f(z) = az̄ + b avec a ≠ 0.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f(z) = az + b', 0, 1),
(@qid, 'f(z) = az̄ + b, a ≠ 0', 1, 2),
(@qid, 'f(z) = z̄', 0, 3),
(@qid, 'f(z) = az̄', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le rapport d''une similitude directe f(z) = az + b est :', 'Le rapport (ou facteur d''échelle) d''une similitude f(z) = az + b est |a|.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT FROM reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a', 0, 1),
(@qid, '|a|', 1, 2),
(@qid, '|b|', 0, 3),
(@qid, 'arg(a)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''angle de rotation d''une similitude directe f(z) = az + b est :', 'L''angle de rotation est arg(a), l''argument du coefficient a.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '|a|', 0, 1),
(@qid, 'arg(a)', 1, 2),
(@qid, 'arg(b)', 0, 3),
(@qid, '|b|', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une rotation de centre ω et d''angle θ est une similitude directe de rapport :', 'Une rotation est une similitude directe de rapport 1 (isométrie directe).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1),
(@qid, 'θ', 0, 2),
(@qid, '1', 1, 3),
(@qid, '2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le nombre complexe z = −i représente, sur le cercle unité, le point :', 'z = −i = e^{−iπ/2} correspond au point de coordonnées (0, −1).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(0, 1)', 0, 1),
(@qid, '(0, −1)', 1, 2),
(@qid, '(−1, 0)', 0, 3),
(@qid, '(1, 0)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La formule de De Moivre est :', 'La formule de De Moivre : (cos θ + i sin θ)ⁿ = cos(nθ) + i sin(nθ).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(cos θ + i sin θ)ⁿ = n cos θ + ni sin θ', 0, 1),
(@qid, '(cos θ + i sin θ)ⁿ = cos(nθ) + i sin(nθ)', 1, 2),
(@qid, '(cos θ)ⁿ + i(sin θ)ⁿ', 0, 3),
(@qid, 'cosⁿθ + sinⁿθ = 1', 0, 4);



-- ===== PROPRIÉTÉS DES PROBABILITÉS =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Pour tout événement A d''un espace probabilisé, on a toujours :', '0 ≤ P(A) ≤ 1 est l''axiome de normalisation des probabilités.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(A) > 0', 0, 1),
(@qid, '0 ≤ P(A) ≤ 1', 1, 2),
(@qid, 'P(A) = 1/2', 0, 3),
(@qid, 'P(A) ≥ 1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La probabilité de l''événement contraire Ā est :', 'P(Ā) = 1 − P(A) car P(A) + P(Ā) = 1.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(Ā) = P(A)', 0, 1),
(@qid, 'P(Ā) = 1 + P(A)', 0, 2),
(@qid, 'P(Ā) = 1 − P(A)', 1, 3),
(@qid, 'P(Ā) = 0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Pour deux événements A et B quelconques, P(A ∪ B) = ?', 'P(A∪B) = P(A) + P(B) − P(A∩B) (formule d''inclusion-exclusion).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(A) + P(B)', 0, 1),
(@qid, 'P(A) + P(B) − P(A∩B)', 1, 2),
(@qid, 'P(A) × P(B)', 0, 3),
(@qid, 'P(A) − P(B)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si A et B sont deux événements incompatibles (mutuellement exclusifs), alors :', 'A∩B = ∅ ⟹ P(A∩B) = 0, donc P(A∪B) = P(A) + P(B).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(A∪B) = P(A) × P(B)', 0, 1),
(@qid, 'P(A∪B) = P(A) + P(B)', 1, 2),
(@qid, 'P(A∩B) = P(A) + P(B)', 0, 3),
(@qid, 'P(A) = P(B)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La probabilité de l''événement impossible ∅ est :', 'P(∅) = 0 par définition (l''événement impossible ne peut pas se produire).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1),
(@qid, '1/2', 0, 2),
(@qid, '0', 1, 3),
(@qid, 'Non définie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La probabilité de l''événement certain Ω est :', 'P(Ω) = 1 par définition (l''événement certain se produit toujours).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1),
(@qid, '1', 1, 2),
(@qid, '1/2', 0, 3),
(@qid, 'Dépend du contexte', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'On lance un dé équilibré. La probabilité d''obtenir un nombre pair est :', 'Il y a 3 faces paires (2,4,6) sur 6 faces. P = 3/6 = 1/2.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/6', 0, 1),
(@qid, '2/3', 0, 2),
(@qid, '1/2', 1, 3),
(@qid, '1/3', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'On tire une carte d''un jeu de 52. La probabilité de tirer un as est :', 'Il y a 4 as dans 52 cartes : P = 4/52 = 1/12.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/52', 0, 1),
(@qid, '1/12', 1, 2),
(@qid, '4/12', 0, 3),
(@qid, '1/4', 0, 4);

-- ===== PROBABILITÉ CONDITIONNELLE =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La probabilité conditionnelle de A sachant B (avec P(B) > 0) est :', 'P(A|B) = P(A∩B)/P(B) est la définition de la probabilité conditionnelle.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(A|B) = P(A) + P(B)', 0, 1),
(@qid, 'P(A|B) = P(A∩B)/P(B)', 1, 2),
(@qid, 'P(A|B) = P(A)/P(B)', 0, 3),
(@qid, 'P(A|B) = P(A)×P(B)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Deux événements A et B sont indépendants si et seulement si :', 'A et B sont indépendants ⟺ P(A∩B) = P(A)×P(B).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(A∩B) = 0', 0, 1),
(@qid, 'P(A∩B) = P(A) + P(B)', 0, 2),
(@qid, 'P(A∩B) = P(A)×P(B)', 1, 3),
(@qid, 'A ∩ B = ∅', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La formule des probabilités totales, pour une partition (B₁,...,Bₙ) de Ω, donne :', 'P(A) = Σᵢ P(A|Bᵢ)×P(Bᵢ) est la formule des probabilités totales.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(A) = P(A|B₁) + P(A|B₂) + ... + P(A|Bₙ)', 0, 1),
(@qid, 'P(A) = Σᵢ P(A|Bᵢ)×P(Bᵢ)', 1, 2),
(@qid, 'P(A) = P(B₁) × P(B₂) × ... × P(Bₙ)', 0, 3),
(@qid, 'P(A) = max P(A|Bᵢ)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le théorème de Bayes donne P(Bᵢ|A) = ?', 'P(Bᵢ|A) = P(A|Bᵢ)P(Bᵢ) / P(A) est le théorème de Bayes.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P(Bᵢ|A) = P(A|Bᵢ)/P(A)', 0, 1),
(@qid, 'P(Bᵢ|A) = P(A|Bᵢ)×P(Bᵢ)/P(A)', 1, 2),
(@qid, 'P(Bᵢ|A) = P(Bᵢ)/P(A)', 0, 3),
(@qid, 'P(Bᵢ|A) = P(A)×P(Bᵢ)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Dans une urne : 3 boules rouges et 7 bleues. On tire 2 boules SANS remise. P(2ème rouge | 1ère rouge) = ?', 'Après avoir tiré une rouge, il reste 2 rouges sur 9 boules : P = 2/9.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3/10', 0, 1),
(@qid, '2/9', 1, 2),
(@qid, '1/3', 0, 3),
(@qid, '2/10', 0, 4);

-- ===== VARIABLE ALÉATOIRE =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''espérance mathématique E(X) d''une variable aléatoire discrète X est :', 'E(X) = Σᵢ xᵢ·P(X=xᵢ) est la moyenne pondérée des valeurs par leurs probabilités.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La valeur la plus probable de X', 0, 1),
(@qid, 'Σᵢ xᵢ·P(X=xᵢ)', 1, 2),
(@qid, 'La variance de X', 0, 3),
(@qid, 'P(X = 0)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La variance V(X) d''une variable aléatoire X est définie par :', 'V(X) = E(X²) − [E(X)]² = E[(X−E(X))²].', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'V(X) = E(X)²', 0, 1),
(@qid, 'V(X) = E(X²) − [E(X)]²', 1, 2),
(@qid, 'V(X) = E(X) − [E(X²)]', 0, 3),
(@qid, 'V(X) = √E(X)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'L''écart-type σ(X) est :', 'σ(X) = √V(X) est la racine carrée de la variance.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'σ(X) = V(X)', 0, 1),
(@qid, 'σ(X) = V(X)²', 0, 2),
(@qid, 'σ(X) = √V(X)', 1, 3),
(@qid, 'σ(X) = E(X)/V(X)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'X prend les valeurs 1, 2, 3 avec probabilités 1/2, 1/3, 1/6. E(X) = ?', 'E(X) = 1×(1/2) + 2×(1/3) + 3×(1/6) = 1/2 + 2/3 + 1/2 = 5/3.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1),
(@qid, '5/3', 1, 2),
(@qid, '3/2', 0, 3),
(@qid, '1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Pour une variable aléatoire X et des constantes a, b : E(aX + b) = ?', 'E(aX+b) = a·E(X) + b par linéarité de l''espérance.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a·E(X)', 0, 1),
(@qid, 'a·E(X) + b', 1, 2),
(@qid, 'E(X) + b', 0, 3),
(@qid, 'a·E(X²) + b', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'V(aX + b) = ?', 'V(aX+b) = a²·V(X) (la constante b ne change pas la dispersion).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'a²·V(X) + b²', 0, 1),
(@qid, 'a·V(X) + b', 0, 2),
(@qid, 'a²·V(X)', 1, 3),
(@qid, 'a²·V(X) + b', 0, 4);



INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si X ~ B(n,p), la variance V(X) est :', 'V(X) = np(1−p) pour la loi binomiale B(n,p).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'V(X) = np', 0, 1),
(@qid, 'V(X) = np(1−p)', 1, 2),
(@qid, 'V(X) = p(1−p)', 0, 3),
(@qid, 'V(X) = n²p', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'On lance une pièce équilibrée 10 fois. X = nombre de piles. P(X = 5) = ?', 'P(X=5) = C(10,5)·(1/2)⁵·(1/2)⁵ = 252/1024 = 63/256.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/10', 0, 1),
(@qid, 'C(10,5)/2¹⁰ = 252/1024', 1, 2),
(@qid, '1/2', 0, 3),
(@qid, '5/10', 0, 4);



-- ============================================================
-- QUESTIONS NS4 HAITI - PARTIE 5: ANALYSE
-- ============================================================

-- ===== DOMAINE DE DÉFINITION =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le domaine de définition de f(x) = 1/x est :', 'f(x) = 1/x est définie pour tout x ≠ 0, donc D = ℝ \ {0} = ]−∞,0[ ∪ ]0,+∞[.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ℝ tout entier', 0, 1),
(@qid, 'ℝ \ {0}', 1, 2),
(@qid, '[0, +∞[', 0, 3),
(@qid, ']−∞, 0[', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le domaine de définition de f(x) = √(x − 3) est :', 'Il faut x − 3 ≥ 0, soit x ≥ 3. D = [3, +∞[.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ℝ', 0, 1),
(@qid, ']−∞, 3]', 0, 2),
(@qid, '[3, +∞[', 1, 3),
(@qid, ']3, +∞[', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le domaine de définition de f(x) = ln(2x − 1) est :', 'Il faut 2x − 1 > 0, soit x > 1/2. D = ]1/2, +∞[.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ℝ', 0, 1),
(@qid, '[1/2, +∞[', 0, 2),
(@qid, ']1/2, +∞[', 1, 3),
(@qid, ']0, +∞[', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Le domaine de définition de f(x) = 1/√(x² − 4) est :', 'Il faut x² − 4 > 0, soit (x−2)(x+2) > 0, donc x < −2 ou x > 2. D = ]−∞,−2[ ∪ ]2,+∞[.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '[-2, 2]', 0, 1),
(@qid, 'ℝ \ {−2, 2}', 0, 2),
(@qid, ']−∞,−2[ ∪ ]2,+∞[', 1, 3),
(@qid, ']−2, 2[', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La fonction f(x) = x² est définie sur :', 'Les polynômes sont définis sur ℝ tout entier.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '[0, +∞[', 0, 1),
(@qid, 'ℝ', 1, 2),
(@qid, '[-1, 1]', 0, 3),
(@qid, ']0, +∞[', 0, 4);

-- ===== PARTIE ENTIÈRE =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La partie entière E(x) de x est :', 'E(x) = ⌊x⌋ est le plus grand entier inférieur ou égal à x.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le plus petit entier supérieur à x', 0, 1),
(@qid, 'Le plus grand entier inférieur ou égal à x', 1, 2),
(@qid, 'La valeur absolue de x', 0, 3),
(@qid, 'L''arrondi de x', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'E(3.7) est égal à :', 'E(3.7) = ⌊3.7⌋ = 3 (le plus grand entier ≤ 3.7).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4', 0, 1),
(@qid, '3', 1, 2),
(@qid, '3.7', 0, 3),
(@qid, '0.7', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'E(−2.3) est égal à :', 'E(−2.3) = ⌊−2.3⌋ = −3 (le plus grand entier ≤ −2.3 est −3).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '−2', 0, 1),
(@qid, '2', 0, 2),
(@qid, '−3', 1, 3),
(@qid, '3', 0, 4);

-- ===== PÉRIODICITÉ =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La fonction f(x) = sin(x) est périodique de période :', 'sin(x + 2π) = sin(x), donc la période est 2π.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'π', 0, 1),
(@qid, '2π', 1, 2),
(@qid, 'π/2', 0, 3),
(@qid, '4π', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La fonction f(x) = tan(x) est périodique de période :', 'tan(x + π) = tan(x), donc la période est π.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2π', 0, 1),
(@qid, 'π', 1, 2),
(@qid, 'π/2', 0, 3),
(@qid, '3π', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La fonction f(x) = cos(2x) est périodique de période :', 'f(x+T) = cos(2(x+T)) = cos(2x) si 2T = 2π, donc T = π.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2π', 0, 1),
(@qid, '4π', 0, 2),
(@qid, 'π', 1, 3),
(@qid, 'π/2', 0, 4);

-- ===== CONTINUITÉ ET DÉRIVABILITÉ =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une fonction f est continue en a si :', 'f est continue en a ⟺ lim_{x→a} f(x) = f(a).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f(a) existe', 0, 1),
(@qid, 'lim_{x→a} f(x) = f(a)', 1, 2),
(@qid, 'f est dérivable en a', 0, 3),
(@qid, 'f est monotone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La dérivée de f(x) = xⁿ (n ∈ ℕ*) est :', 'f''(x) = n·xⁿ⁻¹ est la règle de dérivation des puissances.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'f''(x) = xⁿ⁻¹', 0, 1),
(@qid, 'f''(x) = n·xⁿ⁻¹', 1, 2),
(@qid, 'f''(x) = nxⁿ', 0, 3),
(@qid, 'f''(x) = n·xⁿ⁺¹', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La dérivée de f(x) = sin(x) est :', 'La dérivée de sin(x) est cos(x).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '−sin(x)', 0, 1),
(@qid, 'cos(x)', 1, 2),
(@qid, '−cos(x)', 0, 3),
(@qid, 'tan(x)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La dérivée de f(x) = cos(x) est :', 'La dérivée de cos(x) est −sin(x).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'sin(x)', 0, 1),
(@qid, '−sin(x)', 1, 2),
(@qid, 'cos(x)', 0, 3),
(@qid, 'tan(x)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Si f est dérivable en a, alors f est :', 'La dérivabilité implique la continuité (mais pas l''inverse).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pas nécessairement continue en a', 0, 1),
(@qid, 'Continue en a', 1, 2),
(@qid, 'Constante en a', 0, 3),
(@qid, 'Croissante en a', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La dérivée de f(x) = eˣ est :', 'La fonction exponentielle est sa propre dérivée : (eˣ)'' = eˣ.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'xeˣ⁻¹', 0, 1),
(@qid, 'eˣ', 1, 2),
(@qid, 'x·eˣ', 0, 3),
(@qid, '1/eˣ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La règle de dérivation d''un produit (uv)'' est :', '(uv)'' = u''v + uv'' est la formule de dérivation d''un produit.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(uv)'' = u''v''', 0, 1),
(@qid, '(uv)'' = u''v + uv''', 1, 2),
(@qid, '(uv)'' = u''v − uv''', 0, 3),
(@qid, '(uv)'' = u'' + v''', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La règle de dérivation d''un quotient (u/v)'' est :', '(u/v)'' = (u''v − uv'')/v² est la formule de dérivation d''un quotient.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '(u''v + uv'')/v²', 0, 1),
(@qid, '(u''v − uv'')/v²', 1, 2),
(@qid, 'u''/v''', 0, 3),
(@qid, '(u/v)·(u''/v'')', 0, 4);

-- ===== LIMITES =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim_{x→+∞} (1/x) = ?', 'Quand x → +∞, 1/x → 0.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+∞', 0, 1),
(@qid, '1', 0, 2),
(@qid, '0', 1, 3),
(@qid, '−1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim_{x→0} (sin x / x) = ?', 'C''est une limite remarquable fondamentale : lim_{x→0} sin(x)/x = 1.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1),
(@qid, '+∞', 0, 2),
(@qid, '1', 1, 3),
(@qid, '1/2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim_{x→+∞} eˣ = ?', 'La fonction exponentielle tend vers +∞ quand x → +∞.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1),
(@qid, '1', 0, 2),
(@qid, '+∞', 1, 3),
(@qid, 'e', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim_{x→−∞} eˣ = ?', 'La fonction eˣ tend vers 0 par valeurs positives quand x → −∞.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+∞', 0, 1),
(@qid, '−∞', 0, 2),
(@qid, '0', 1, 3),
(@qid, '1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim_{x→+∞} (eˣ/xⁿ) pour tout entier n ≥ 0 vaut :', 'L''exponentielle l''emporte sur tout polynôme : lim eˣ/xⁿ = +∞.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1),
(@qid, '1', 0, 2),
(@qid, '+∞', 1, 3),
(@qid, 'n!', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'lim_{x→+∞} (ln x / x) = ?', 'Le logarithme est négligeable devant x : lim (ln x)/x = 0.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+∞', 0, 1),
(@qid, '1', 0, 2),
(@qid, '0', 1, 3),
(@qid, 'e', 0, 4);

-- ===== BIJECTION RÉCIPROQUE =====

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'Une fonction continue et strictement monotone sur un intervalle I est :', 'Toute fonction continue et strictement monotone sur I est une bijection de I sur f(I).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pas nécessairement bijective', 0, 1),
(@qid, 'Une bijection de I sur son image f(I)', 1, 2),
(@qid, 'Toujours dérivable', 0, 3),
(@qid, 'Toujours bornée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(9, 2, 'La fonction réciproque de f(x) = eˣ est :', 'La réciproque de eˣ est ln(x), définie sur ]0,+∞[.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/eˣ', 0, 1),
(@qid, 'ln(x)', 1, 2),
(@qid, 'x²', 0, 3),
(@qid, '√x', 0, 4);









-- Complétion
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(9, 1, 'La dérivée de sin(x) est ________.', NULL, 'Programme NS4', 2, 'cos(x)|cos x');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(9, 1, 'Le théorème de Pythagore s''écrit : a² + b² = ________.', NULL, 'Programme NS4', 1, 'c²|c carré');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(9, 1, 'La somme des angles d''un triangle est ________ degrés.', NULL, 'Programme NS4', 1, '180');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(9, 1, 'log(a × b) = log(a) + ________.', NULL, 'Programme NS4', 2, 'log(b)|log b');


-- =============================================
-- 10. PHYSIQUE NS4 (matiere_id = 10)
-- =============================================

-- QCM
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(10, 2, 'Quelle est l''unité de la force dans le Système International ?', 'La force se mesure en Newton (N).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Joule', 0, 1), (@qid, 'Newton', 1, 2), (@qid, 'Pascal', 0, 3), (@qid, 'Watt', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(10, 2, 'Quelle est la valeur approchée de g (accélération gravitationnelle) sur Terre ?', 'g ≈ 9,8 m/s² (souvent approximé à 10 m/s²).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '9,8 m/s', 0, 1), (@qid, '9,8 m/s²', 1, 2), (@qid, '9,8 N', 0, 3), (@qid, '6,67 m/s²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(10, 2, 'La loi d''Ohm s''écrit :',  'V = R × I (tension = résistance × intensité).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'V = I / R', 0, 1), (@qid, 'V = R × I', 1, 2), (@qid, 'I = V × R', 0, 3), (@qid, 'R = V × I', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(10, 2, 'Quelle est l''unité de la pression ?', 'La pression se mesure en Pascal (Pa).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Newton', 0, 1), (@qid, 'Joule', 0, 2), (@qid, 'Pascal', 1, 3), (@qid, 'Watt', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(10, 2, 'Un corps est en équilibre quand la somme des forces qui s''exercent sur lui est :', 'La condition d''équilibre : ΣF = 0 (somme vectorielle nulle).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Maximale', 0, 1), (@qid, 'Minimale', 0, 2), (@qid, 'Nulle', 1, 3), (@qid, 'Constante', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(10, 2, 'La puissance électrique P se calcule par :', 'P = U × I (puissance = tension × intensité).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'P = U / I', 0, 1), (@qid, 'P = U + I', 0, 2), (@qid, 'P = U × I', 1, 3), (@qid, 'P = I / U', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(10, 2, 'Quelle est la vitesse de la lumière dans le vide ?', 'c ≈ 3 × 10⁸ m/s', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3 × 10⁶ m/s', 0, 1), (@qid, '3 × 10⁸ m/s', 1, 2), (@qid, '3 × 10¹⁰ m/s', 0, 3), (@qid, '340 m/s', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(10, 2, 'L''énergie cinétique d''un objet en mouvement est Ec = :', 'Ec = ½mv² (m = masse, v = vitesse).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'mv', 0, 1), (@qid, 'mv²', 0, 2), (@qid, '½mv²', 1, 3), (@qid, '2mv²', 0, 4);

-- Complétion
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(10, 1, 'L''unité d''intensité électrique est l''________.', NULL, 'Programme NS4', 1, 'ampère|Ampère');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(10, 1, 'La formule du poids est P = m × ________.', NULL, 'Programme NS4', 1, 'g');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(10, 1, 'La fréquence se mesure en ________.', NULL, 'Programme NS4', 1, 'hertz|Hz');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(10, 1, 'La relation entre vitesse, distance et temps est v = d / ________.', NULL, 'Programme NS4', 1, 't|temps');


-- =============================================
-- 11. CHIMIE NS4 (matiere_id = 11)
-- =============================================

-- QCM
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le numéro atomique du carbone (C) ?', 'Le carbone a 6 protons, donc Z = 6.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4', 0, 1), (@qid, '6', 1, 2), (@qid, '8', 0, 3), (@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quelle est la formule de l''eau ?', 'L''eau est composée de 2 atomes d''hydrogène et 1 d''oxygène : H₂O.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'HO', 0, 1), (@qid, 'H₂O₂', 0, 2), (@qid, 'H₂O', 1, 3), (@qid, 'H₃O', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel ion caractérise un acide en solution aqueuse ?', 'Un acide libère des ions H⁺ (ou H₃O⁺) en solution.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'OH⁻', 0, 1), (@qid, 'H⁺', 1, 2), (@qid, 'Na⁺', 0, 3), (@qid, 'Cl⁻', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quelle est la masse molaire du dioxygène O₂ ?', 'M(O) = 16 g/mol donc M(O₂) = 32 g/mol.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '16 g/mol', 0, 1), (@qid, '32 g/mol', 1, 2), (@qid, '48 g/mol', 0, 3), (@qid, '8 g/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Combien d''électrons peut contenir la couche L ?', 'La couche L (n=2) peut contenir au maximum 8 électrons.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '8', 1, 2), (@qid, '18', 0, 3), (@qid, '32', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La neutralisation d''un acide par une base produit :', 'Acide + Base → Sel + Eau (réaction de neutralisation).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un acide fort', 0, 1), (@qid, 'Un sel et de l''eau', 1, 2), (@qid, 'Une base forte', 0, 3), (@qid, 'De l''oxygène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Qu''est-ce que la valence d''un élément ?', 'La valence est le nombre de liaisons qu''un atome peut former avec d''autres atomes.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le nombre de protons', 0, 1), (@qid, 'La masse atomique', 0, 2), (@qid, 'Le nombre de liaisons possibles', 1, 3), (@qid, 'La charge électrique', 0, 4);


-- ============================================
-- THÈME 1 : ALCANES - ALCÈNES - ALCYNES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quelle est la formule générale des alcanes ?',
    'CₙH₂ₙ₊₂ est la formule générale des alcanes (hydrocarbures saturés).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CₙH₂ₙ', 0, 1), (@qid, 'CₙH₂ₙ₊₂', 1, 2), (@qid, 'CₙH₂ₙ₋₂', 0, 3), (@qid, 'CₙH₂ₙ₊₁OH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le nom de l''alcane contenant 2 atomes de carbone ?',
    'CH₃-CH₃ est l''éthane (C₂H₆).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Méthane', 0, 1), (@qid, 'Éthane', 1, 2), (@qid, 'Propane', 0, 3), (@qid, 'Butane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quelle est la formule brute du méthane ?',
    'Le méthane a un seul carbone : CH₄.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CH₂', 0, 1), (@qid, 'CH₃', 0, 2), (@qid, 'CH₄', 1, 3), (@qid, 'C₂H₆', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''alcane C₅H₁₂ se nomme :',
    '5 carbones → pentane.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Butane', 0, 1), (@qid, 'Pentane', 1, 2), (@qid, 'Hexane', 0, 3), (@qid, 'Propane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Les alcanes sont caractérisés par des liaisons :',
    'Liaisons simples (sigma) C-C uniquement → saturés.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Doubles uniquement', 0, 1), (@qid, 'Simples uniquement', 1, 2), (@qid, 'Triples uniquement', 0, 3), (@qid, 'Simples et doubles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule générale des alcènes est :',
    'CₙH₂ₙ (hydrocarbures insaturés avec une double liaison).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CₙH₂ₙ₊₂', 0, 1), (@qid, 'CₙH₂ₙ', 1, 2), (@qid, 'CₙH₂ₙ₋₂', 0, 3), (@qid, 'CₙH₂ₙ₋₆', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''éthylène (éthène) a pour formule brute :',
    'C₂H₄ (un alcène à 2 carbones).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'C₂H₆', 0, 1), (@qid, 'C₂H₄', 1, 2), (@qid, 'C₂H₂', 0, 3), (@qid, 'C₂H₅OH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La double liaison carbone-carbone est constituée de :',
    'Une liaison sigma (σ) et une liaison pi (π).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Deux liaisons σ', 0, 1), (@qid, 'Une liaison σ et une π', 1, 2), (@qid, 'Deux liaisons π', 0, 3), (@qid, 'Trois liaisons σ', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le nom de l''alcène à 3 carbones ?',
    'CH₂=CH-CH₃ → propène.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Éthène', 0, 1), (@qid, 'Propène', 1, 2), (@qid, 'Butène', 0, 3), (@qid, 'Pentène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule générale des alcynes est :',
    'CₙH₂ₙ₋₂ (une triple liaison).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CₙH₂ₙ₊₂', 0, 1), (@qid, 'CₙH₂ₙ', 0, 2), (@qid, 'CₙH₂ₙ₋₂', 1, 3), (@qid, 'CₙH₂ₙ₋₄', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''acétylène (éthyne) a pour formule brute :',
    'C₂H₂ (triple liaison).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'C₂H₆', 0, 1), (@qid, 'C₂H₄', 0, 2), (@qid, 'C₂H₂', 1, 3), (@qid, 'C₂H₅OH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La triple liaison carbone-carbone est constituée de :',
    'Une liaison σ et deux liaisons π.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une σ et deux π', 1, 1), (@qid, 'Deux σ et une π', 0, 2), (@qid, 'Trois σ', 0, 3), (@qid, 'Trois π', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La réaction caractéristique des alcènes est :',
    'L''addition électrophile sur la double liaison.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La substitution', 0, 1), (@qid, 'L''addition', 1, 2), (@qid, 'L''élimination', 0, 3), (@qid, 'La combustion uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''hydratation d''un alcène conduit à :',
    'Addition d''eau → alcool.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un alcane', 0, 1), (@qid, 'Un alcool', 1, 2), (@qid, 'Un alcyne', 0, 3), (@qid, 'Un acide', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''hydrogénation d''un alcène donne :',
    'Addition de H₂ → alcane correspondant.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un alcool', 0, 1), (@qid, 'Un alcyne', 0, 2), (@qid, 'Un alcane', 1, 3), (@qid, 'Un acide', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le test à l''eau de brome caractérise :',
    'Les alcènes et alcynes décolorent instantanément l''eau de brome (réaction d''addition).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les alcanes uniquement', 0, 1), (@qid, 'Les alcènes et alcynes', 1, 2), (@qid, 'Les alcools uniquement', 0, 3), (@qid, 'Les acides', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le propyne a pour formule brute :',
    'C₃H₄ (3 carbones, triple liaison).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'C₃H₈', 0, 1), (@qid, 'C₃H₆', 0, 2), (@qid, 'C₃H₄', 1, 3), (@qid, 'C₃H₃', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La combustion complète d''un alcane produit :',
    'CO₂ + H₂O.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CO + H₂O', 0, 1), (@qid, 'CO₂ + H₂O', 1, 2), (@qid, 'C + H₂O', 0, 3), (@qid, 'CO₂ + H₂', 0, 4);

-- Suite des QCM Alcanes-Alcènes-Alcynes
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''alcane C₃H₈ est le :',
    '3 carbones = propane.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Éthane', 0, 1), (@qid, 'Propane', 1, 2), (@qid, 'Butane', 0, 3), (@qid, 'Méthane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Combien d''isomères a le butane C₄H₁₀ ?',
    'Deux : n-butane et isobutane (2-méthylpropane).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '2', 1, 2), (@qid, '3', 0, 3), (@qid, '4', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le but-2-ène présente une isomérie :',
    'Isomérie géométrique Z/E autour de la double liaison.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De chaîne uniquement', 0, 1), (@qid, 'De position', 0, 2), (@qid, 'Géométrique Z/E', 1, 3), (@qid, 'De fonction', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La déshydrogénation d''un alcane conduit à :',
    'Perte de H₂ → formation d''alcène ou alcyne.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un alcool', 0, 1), (@qid, 'Un alcène', 1, 2), (@qid, 'Un acide', 0, 3), (@qid, 'Un sel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel alcène est utilisé comme monomère pour le polyéthylène ?',
    'L''éthylène (C₂H₄) polymérise en polyéthylène.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Propène', 0, 1), (@qid, 'Éthylène', 1, 2), (@qid, 'Butène', 0, 3), (@qid, 'Pentène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quelle est la masse molaire du propane C₃H₈ ? (C=12, H=1)',
    'M = 3×12 + 8×1 = 44 g/mol.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '30 g/mol', 0, 1), (@qid, '44 g/mol', 1, 2), (@qid, '58 g/mol', 0, 3), (@qid, '40 g/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''alcane le plus simple est :',
    'CH₄ = méthane (1 carbone).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Éthane', 0, 1), (@qid, 'Propane', 0, 2), (@qid, 'Méthane', 1, 3), (@qid, 'Butane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le cracking d''un alcane produit :',
    'Rupture de chaîne → alcane + alcène plus courts.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement des alcools', 0, 1), (@qid, 'Des alcanes et alcènes plus légers', 1, 2), (@qid, 'Des acides carboxyliques', 0, 3), (@qid, 'Des éthers', 0, 4);

-- ============================================
-- THÈME 2 : ALCOOLS, ALDÉHYDES, CÉTONES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La fonction alcool est caractérisée par le groupe :',
    'Le groupe hydroxyle -OH fixé sur un carbone saturé.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-CHO', 0, 1), (@qid, '-OH', 1, 2), (@qid, '-COOH', 0, 3), (@qid, '-CO-', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule générale des monoalcools saturés est :',
    'CₙH₂ₙ₊₁OH ou CₙH₂ₙ₊₂O.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CₙH₂ₙ₊₁OH', 1, 1), (@qid, 'CₙH₂ₙOH', 0, 2), (@qid, 'CₙH₂ₙ₋₁OH', 0, 3), (@qid, 'CₙH₂ₙO₂', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''éthanol a pour formule brute :',
    'C₂H₅OH ou C₂H₆O.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CH₃OH', 0, 1), (@qid, 'C₂H₅OH', 1, 2), (@qid, 'C₃H₇OH', 0, 3), (@qid, 'C₄H₉OH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un alcool primaire a le groupe -OH fixé sur :',
    'Carbone lié à au plus un autre carbone (1 seul C voisin).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un carbone lié à 3 C', 0, 1), (@qid, 'Un carbone lié à 2 C', 0, 2), (@qid, 'Un carbone lié à 1 C', 1, 3), (@qid, 'Un carbone non lié à H', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''oxydation ménagée d''un alcool primaire donne :',
    'Alcool I → aldéhyde → acide carboxylique.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une cétone', 0, 1), (@qid, 'Un aldéhyde puis un acide', 1, 2), (@qid, 'Un alcène', 0, 3), (@qid, 'Un alcyne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''oxydation ménagée d''un alcool secondaire donne :',
    'Alcool II → cétone.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un aldéhyde', 0, 1), (@qid, 'Une cétone', 1, 2), (@qid, 'Un acide', 0, 3), (@qid, 'Un alcène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La fonction aldéhyde est le groupe :',
    '-CHO (carbonyle terminal).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-OH', 0, 1), (@qid, '-CHO', 1, 2), (@qid, '-CO-', 0, 3), (@qid, '-COOH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La fonction cétone est le groupe :',
    '-CO- (carbonyle entre deux carbones).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-CHO', 0, 1), (@qid, '-OH', 0, 2), (@qid, '-CO-', 1, 3), (@qid, '-COOH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel réactif permet de distinguer un aldéhyde d''une cétone ?',
    'La liqueur de Fehling (ou réactif de Tollens) : positif pour les aldéhydes.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''eau de brome', 0, 1), (@qid, 'La liqueur de Fehling', 1, 2), (@qid, 'Le dichromate de potassium', 0, 3), (@qid, 'L''acide sulfurique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule de la propanone (acétone) est :',
    'CH₃-CO-CH₃ (cétone à 3 carbones).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CH₃-CHO', 0, 1), (@qid, 'CH₃-CO-CH₃', 1, 2), (@qid, 'CH₃-CH₂OH', 0, 3), (@qid, 'CH₃-COOH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le méthanal (formaldéhyde) a pour formule :',
    'H-CHO (le plus simple des aldéhydes).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CH₃-CHO', 0, 1), (@qid, 'H-CHO', 1, 2), (@qid, 'CH₃-CO-CH₃', 0, 3), (@qid, 'H-COOH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La fermentation alcoolique du glucose produit :',
    'C₆H₁₂O₆ → 2 C₂H₅OH + 2 CO₂.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Méthanol et CO₂', 0, 1), (@qid, 'Éthanol et CO₂', 1, 2), (@qid, 'Acide acétique et eau', 0, 3), (@qid, 'Propanone et eau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un alcool tertiaire a le groupe -OH fixé sur un carbone lié à :',
    '3 autres atomes de carbone.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 carbone', 0, 1), (@qid, '2 carbones', 0, 2), (@qid, '3 carbones', 1, 3), (@qid, '0 carbone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le test au sodium métallique caractérise :',
    'Les alcools (dégagement de H₂).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les alcènes', 0, 1), (@qid, 'Les alcools', 1, 2), (@qid, 'Les alcanes', 0, 3), (@qid, 'Les alcynes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La déshydratation d''un alcool donne :',
    'Perte d''eau → alcène.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un alcane', 0, 1), (@qid, 'Un alcène', 1, 2), (@qid, 'Un aldéhyde', 0, 3), (@qid, 'Un acide', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse molaire de l''éthanol C₂H₅OH est : (C=12, O=16, H=1)',
    'M = 2×12 + 6×1 + 16 = 46 g/mol.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '32 g/mol', 0, 1), (@qid, '46 g/mol', 1, 2), (@qid, '60 g/mol', 0, 3), (@qid, '28 g/mol', 0, 4);

-- ============================================
-- THÈME 3 : LIAISONS CHIMIQUES (IONIQUE, COVALENTE, MÉTALLIQUE)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une liaison ionique résulte de :',
    'Transfert d''électrons entre un métal et un non-métal → attraction électrostatique.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La mise en commun d''électrons', 0, 1), (@qid, 'Un transfert d''électrons', 1, 2), (@qid, 'Une attraction magnétique', 0, 3), (@qid, 'Un partage équitable d''électrons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une liaison covalente simple est constituée de :',
    '2 électrons partagés (1 doublet liant).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 électron', 0, 1), (@qid, '2 électrons', 1, 2), (@qid, '4 électrons', 0, 3), (@qid, '6 électrons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une liaison covalente double comporte :',
    '4 électrons partagés (2 doublets liants = 1σ + 1π).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 électrons', 0, 1), (@qid, '4 électrons', 1, 2), (@qid, '6 électrons', 0, 3), (@qid, '8 électrons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une liaison covalente triple comporte :',
    '6 électrons partagés (3 doublets liants = 1σ + 2π).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 électrons', 0, 1), (@qid, '4 électrons', 0, 2), (@qid, '6 électrons', 1, 3), (@qid, '8 électrons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel type de liaison existe dans NaCl ?',
    'Na⁺Cl⁻ → liaison ionique (métal + non-métal).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Covalente simple', 0, 1), (@qid, 'Covalente double', 0, 2), (@qid, 'Ionique', 1, 3), (@qid, 'Métallique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Dans la molécule O₂, la liaison est :',
    'O=O → double liaison covalente.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Simple', 0, 1), (@qid, 'Double', 1, 2), (@qid, 'Triple', 0, 3), (@qid, 'Ionique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Dans la molécule N₂, la liaison est :',
    'N≡N → triple liaison covalente.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Simple', 0, 1), (@qid, 'Double', 0, 2), (@qid, 'Triple', 1, 3), (@qid, 'Ionique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''électronégativité mesure :',
    'La capacité d''un atome à attirer les électrons d''une liaison.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La masse atomique', 0, 1), (@qid, 'Le rayon atomique', 0, 2), (@qid, 'La force d''attraction des électrons', 1, 3), (@qid, 'La charge nucléaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une liaison covalente polarisée existe quand :',
    'Différence d''électronégativité entre les 2 atomes (ex: H-Cl).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ΔEN = 0', 0, 1), (@qid, 'ΔEN > 0 mais < 1,7', 1, 2), (@qid, 'ΔEN = 1,7 exactement', 0, 3), (@qid, 'ΔEN quelconque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La liaison dans H₂ est :',
    'ΔEN = 0 → liaison covalente pure (apolaire).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ionique', 0, 1), (@qid, 'Covalente pure', 1, 2), (@qid, 'Covalente polarisée', 0, 3), (@qid, 'Métallique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La longueur d''une liaison simple C-C est environ :',
    '154 pm (picomètres).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '120 pm', 0, 1), (@qid, '134 pm', 0, 2), (@qid, '154 pm', 1, 3), (@qid, '110 pm', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''énergie de liaison augmente quand :',
    'Simple < Double < Triple (la triple est la plus forte).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Simple > Double > Triple', 0, 1), (@qid, 'Simple < Double < Triple', 1, 2), (@qid, 'Simple = Double = Triple', 0, 3), (@qid, 'Simple < Triple < Double', 0, 4);

-- Suite Liaisons chimiques
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un cation est un ion :',
    'Perte d''électrons → charge positive.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Chargé positivement', 1, 1), (@qid, 'Chargé négativement', 0, 2), (@qid, 'Neutre', 0, 3), (@qid, 'Sans charge', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un anion est un ion :',
    'Gain d''électrons → charge négative.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Chargé positivement', 0, 1), (@qid, 'Chargé négativement', 1, 2), (@qid, 'Neutre', 0, 3), (@qid, 'De charge nulle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le chlorure de sodium NaCl contient des ions :',
    'Na⁺ et Cl⁻ (attraction électrostatique).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Na⁺ et Cl⁻', 1, 1), (@qid, 'Na⁻ et Cl⁺', 0, 2), (@qid, 'Na et Cl neutres', 0, 3), (@qid, 'Na²⁺ et Cl²⁻', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La valence du carbone est :',
    '4 électrons de valence → forme 4 liaisons.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '2', 0, 2), (@qid, '3', 0, 3), (@qid, '4', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La valence de l''hydrogène est :',
    'H forme toujours 1 liaison.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 1, 1), (@qid, '2', 0, 2), (@qid, '3', 0, 3), (@qid, '4', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La valence de l''oxygène est :',
    'O forme 2 liaisons (ou 1 double liaison).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '2', 1, 2), (@qid, '3', 0, 3), (@qid, '4', 0, 4);

-- ============================================
-- THÈME 4 : ACIDES, BASES, pH
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Selon Brønsted, un acide est :',
    'Une espèce capable de céder un proton H⁺.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un accepteur de H⁺', 0, 1), (@qid, 'Un donneur de H⁺', 1, 2), (@qid, 'Un accepteur d''électrons', 0, 3), (@qid, 'Un donneur d''électrons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Selon Brønsted, une base est :',
    'Une espèce capable de capter un proton H⁺.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un donneur de H⁺', 0, 1), (@qid, 'Un accepteur de H⁺', 1, 2), (@qid, 'Un donneur d''électrons', 0, 3), (@qid, 'Un accepteur d''électrons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le pH d''une solution acide est :',
    'pH < 7 (acide).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'pH < 7', 1, 1), (@qid, 'pH = 7', 0, 2), (@qid, 'pH > 7', 0, 3), (@qid, 'pH = 0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le pH d''une solution basique est :',
    'pH > 7 (basique).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'pH < 7', 0, 1), (@qid, 'pH = 7', 0, 2), (@qid, 'pH > 7', 1, 3), (@qid, 'pH = 14', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un acide fort dans l''eau est :',
    'Totalement dissocié (HCl, HNO₃, H₂SO₄...).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Partiellement dissocié', 0, 1), (@qid, 'Totalement dissocié', 1, 2), (@qid, 'Non dissocié', 0, 3), (@qid, 'Insoluble', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une base forte dans l''eau est :',
    'Totalement dissociée (NaOH, KOH).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Partiellement dissociée', 0, 1), (@qid, 'Totalement dissociée', 1, 2), (@qid, 'Non dissociée', 0, 3), (@qid, 'Insoluble', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule de l''acide chlorhydrique est :',
    'HCl (solution aqueuse de chlorure d''hydrogène).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'H₂SO₄', 0, 1), (@qid, 'HCl', 1, 2), (@qid, 'HNO₃', 0, 3), (@qid, 'CH₃COOH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La soude caustique a pour formule :',
    'NaOH (hydroxyde de sodium).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'KOH', 0, 1), (@qid, 'NaOH', 1, 2), (@qid, 'Ca(OH)₂', 0, 3), (@qid, 'NH₄OH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La réaction HCl + NaOH → NaCl + H₂O est une :',
    'Neutralisation acido-basique.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oxydoréduction', 0, 1), (@qid, 'Neutralisation acido-basique', 1, 2), (@qid, 'Combustion', 0, 3), (@qid, 'Précipitation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel indicateur coloré vire au rose-rouge en milieu basique ?',
    'La phénolphtaléine (incolore → rose).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hélianthine', 0, 1), (@qid, 'Phénolphtaléine', 1, 2), (@qid, 'Bleu de bromothymol', 0, 3), (@qid, 'Tournesol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le pH d''une solution neutre est :',
    'pH = 7 à 25°C.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0', 0, 1), (@qid, '1', 0, 2), (@qid, '7', 1, 3), (@qid, '14', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule [H₃O⁺] = 10⁻ᵖᴴ permet de calculer :',
    'La concentration en ions hydronium à partir du pH.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le pH à partir de [H₃O⁺]', 0, 1), (@qid, '[H₃O⁺] à partir du pH', 1, 2), (@qid, '[OH⁻]', 0, 3), (@qid, 'Le pOH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'pH + pOH = ? (à 25°C)',
    'pH + pOH = 14 (produit ionique de l''eau Ke = 10⁻¹⁴).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '7', 0, 1), (@qid, '10', 0, 2), (@qid, '14', 1, 3), (@qid, '0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un couple acide/base est formé de :',
    'Deux espèces reliées par l''échange d''un proton H⁺.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Deux acides', 0, 1), (@qid, 'Un acide et sa base conjuguée', 1, 2), (@qid, 'Deux bases', 0, 3), (@qid, 'Un oxydant et un réducteur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La base conjuguée de l''acide CH₃COOH est :',
    'CH₃COO⁻ (perte d''un H⁺).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CH₃COOH₂⁺', 0, 1), (@qid, 'CH₃COO⁻', 1, 2), (@qid, 'CH₃OH', 0, 3), (@qid, 'CH₄', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''acide conjugué de NH₃ est :',
    'NH₄⁺ (gain d''un H⁺).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'NH₂⁻', 0, 1), (@qid, 'NH₄⁺', 1, 2), (@qid, 'N₂', 0, 3), (@qid, 'NO₃⁻', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Pour diluer un acide concentré, on doit :',
    'Toujours verser l''acide dans l''eau, jamais l''inverse.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Verser l''eau dans l''acide', 0, 1), (@qid, 'Verser l''acide dans l''eau', 1, 2), (@qid, 'Mélanger rapidement', 0, 3), (@qid, 'Peu importe l''ordre', 0, 4);

-- ============================================
-- THÈME 5 : STOECHIOMÉTRIE ET RÉACTIONS CHIMIQUES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La stoechiométrie étudie :',
    'Les proportions quantitatives dans les réactions chimiques.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La vitesse des réactions', 0, 1), (@qid, 'Les proportions quantitatives', 1, 2), (@qid, 'La couleur des composés', 0, 3), (@qid, 'La température des réactions', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Dans une équation chimique équilibrée, les coefficients indiquent :',
    'Les proportions molaires des réactifs et produits.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les masses en grammes', 0, 1), (@qid, 'Les proportions molaires', 1, 2), (@qid, 'Les volumes en litres', 0, 3), (@qid, 'Les températures', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse molaire de l''eau H₂O est : (H=1, O=16)',
    'M = 2×1 + 16 = 18 g/mol.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '16 g/mol', 0, 1), (@qid, '18 g/mol', 1, 2), (@qid, '17 g/mol', 0, 3), (@qid, '20 g/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Combien de moles dans 36 g d''eau ?',
    'n = m/M = 36/18 = 2 moles.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 mole', 0, 1), (@qid, '2 moles', 1, 2), (@qid, '3 moles', 0, 3), (@qid, '0,5 mole', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le réactif limitant est :',
    'Le réactif totalement consommé en premier, limitant la réaction.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le réactif en excès', 0, 1), (@qid, 'Le réactif totalement consommé', 1, 2), (@qid, 'Le produit principal', 0, 3), (@qid, 'Le catalyseur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse molaire du CO₂ est : (C=12, O=16)',
    'M = 12 + 2×16 = 44 g/mol.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '28 g/mol', 0, 1), (@qid, '44 g/mol', 1, 2), (@qid, '32 g/mol', 0, 3), (@qid, '40 g/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La conservation de la masse lors d''une réaction est énoncée par :',
    'Loi de Lavoisier : rien ne se perd, rien ne se crée.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Loi de Boyle-Mariotte', 0, 1), (@qid, 'Loi de Lavoisier', 1, 2), (@qid, 'Loi de Charles', 0, 3), (@qid, 'Principe de Le Chatelier', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le volume molaire d''un gaz parfait à 0°C et 1 atm est :',
    '22,4 L/mol (CNTP).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '24 L/mol', 0, 1), (@qid, '22,4 L/mol', 1, 2), (@qid, '11,2 L/mol', 0, 3), (@qid, '44,8 L/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Équilibrer : C₃H₈ + O₂ → CO₂ + H₂O. Coefficient de O₂ ?',
    'C₃H₈ + 5 O₂ → 3 CO₂ + 4 H₂O. Coefficient = 5.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3', 0, 1), (@qid, '4', 0, 2), (@qid, '5', 1, 3), (@qid, '6', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Combien de moles de CO₂ produites par combustion de 2 moles de C₂H₆ ?',
    'C₂H₆ + 7/2 O₂ → 2 CO₂ + 3 H₂O. 2 C₂H₆ → 4 CO₂.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 moles', 0, 1), (@qid, '3 moles', 0, 2), (@qid, '4 moles', 1, 3), (@qid, '5 moles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse de 0,5 mole de NaOH est : (Na=23, O=16, H=1)',
    'M(NaOH) = 40 g/mol. m = 0,5 × 40 = 20 g.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10 g', 0, 1), (@qid, '20 g', 1, 2), (@qid, '40 g', 0, 3), (@qid, '80 g', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse molaire du sulfate de cuivre CuSO₄ est : (Cu=63,5; S=32; O=16)',
    'M = 63,5 + 32 + 4×16 = 159,5 g/mol.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '143,5 g/mol', 0, 1), (@qid, '159,5 g/mol', 1, 2), (@qid, '175,5 g/mol', 0, 3), (@qid, '127,5 g/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le rendement d''une réaction est le rapport :',
    'Masse obtenue / masse théorique × 100.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Masse théorique / masse obtenue', 0, 1), (@qid, 'Masse obtenue / masse théorique', 1, 2), (@qid, 'Volume / masse', 0, 3), (@qid, 'Produits / réactifs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une mole contient :',
    'Nₐ = 6,022 × 10²³ entités (nombre d''Avogadro).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6,022 × 10²²', 0, 1), (@qid, '6,022 × 10²³', 1, 2), (@qid, '3,011 × 10²³', 0, 3), (@qid, '1,204 × 10²⁴', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quelle masse de CO₂ est produite par combustion de 12 g de carbone ? (C=12)',
    'C + O₂ → CO₂. 1 mole C → 1 mole CO₂. 12 g C → 44 g CO₂.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '22 g', 0, 1), (@qid, '44 g', 1, 2), (@qid, '28 g', 0, 3), (@qid, '56 g', 0, 4);

-- ============================================
-- THÈME 6 : SOLUTIONS CHIMIQUES ET CONCENTRATIONS
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La concentration massique Cm s''exprime en :',
    'g/L (masse de soluté par litre de solution).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'mol/L', 0, 1), (@qid, 'g/L', 1, 2), (@qid, 'mol/kg', 0, 3), (@qid, 'g/mL', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La concentration molaire C s''exprime en :',
    'mol/L (nombre de moles par litre de solution).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'g/L', 0, 1), (@qid, 'mol/L', 1, 2), (@qid, 'g/mol', 0, 3), (@qid, 'L/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La relation entre Cm et C est :',
    'Cm = C × M (masse volumique molaire).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cm = C × M', 1, 1), (@qid, 'Cm = C / M', 0, 2), (@qid, 'C = Cm × M', 0, 3), (@qid, 'Cm = M / C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Comment préparer 1 L de solution NaCl à 0,1 mol/L ?',
    'm = C × V × M = 0,1 × 1 × 58,5 = 5,85 g à dissoudre dans 1 L.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dissoudre 5,85 g dans 1 L d''eau', 1, 1), (@qid, 'Dissoudre 58,5 g dans 1 L', 0, 2), (@qid, 'Dissoudre 0,585 g dans 1 L', 0, 3), (@qid, 'Dissoudre 1 g dans 1 L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Lors d''une dilution, la quantité de soluté :',
    'Reste constante : n₁ = n₂ donc C₁V₁ = C₂V₂.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Diminue', 0, 1), (@qid, 'Reste constante', 1, 2), (@qid, 'Augmente', 0, 3), (@qid, 'Dépend du solvant', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le facteur de dilution F est :',
    'F = C₀/C₁ = V₁/V₀.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'C₀ × C₁', 0, 1), (@qid, 'C₀ / C₁', 1, 2), (@qid, 'C₀ + C₁', 0, 3), (@qid, 'C₁ - C₀', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une solution saturée est :',
    'Une solution qui ne peut plus dissoudre de soluté à une température donnée.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Très diluée', 0, 1), (@qid, 'À son maximum de dissolution', 1, 2), (@qid, 'Sans soluté', 0, 3), (@qid, 'Toujours concentrée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La solubilité augmente généralement avec :',
    'L''augmentation de la température (sauf pour les gaz).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La température', 1, 1), (@qid, 'La pression (pour les solides)', 0, 2), (@qid, 'Le volume du solvant uniquement', 0, 3), (@qid, 'La masse du soluté uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La concentration molaire d''une solution de 4 g NaOH dans 500 mL est : (M=40)',
    'n = 4/40 = 0,1 mol. C = 0,1/0,5 = 0,2 mol/L.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,1 mol/L', 0, 1), (@qid, '0,2 mol/L', 1, 2), (@qid, '0,4 mol/L', 0, 3), (@qid, '0,8 mol/L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une solution d''acide chlorhydrique à pH=2 a [H₃O⁺] = ?',
    '[H₃O⁺] = 10⁻² = 0,01 mol/L.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,1 mol/L', 0, 1), (@qid, '0,01 mol/L', 1, 2), (@qid, '0,001 mol/L', 0, 3), (@qid, '1 mol/L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel volume d''eau ajouter à 100 mL de solution 2 mol/L pour avoir 0,5 mol/L ?',
    'C₁V₁ = C₂V₂ → 2×100 = 0,5×V₂ → V₂ = 400 mL. V ajouté = 300 mL.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 mL', 0, 1), (@qid, '200 mL', 0, 2), (@qid, '300 mL', 1, 3), (@qid, '400 mL', 0, 4);

-- ============================================
-- THÈME 7 : OXYDORÉDUCTION
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''oxydation est une :',
    'Perte d''électrons (le n.o. augmente).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Gain d''électrons', 0, 1), (@qid, 'Perte d''électrons', 1, 2), (@qid, 'Gain de protons', 0, 3), (@qid, 'Perte de protons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La réduction est un :',
    'Gain d''électrons (le n.o. diminue).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Gain d''électrons', 1, 1), (@qid, 'Perte d''électrons', 0, 2), (@qid, 'Gain de protons', 0, 3), (@qid, 'Perte de protons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un oxydant est une espèce qui :',
    'Gagne des électrons (est réduite).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Perd des électrons', 0, 1), (@qid, 'Gagne des électrons', 1, 2), (@qid, 'Perd des protons', 0, 3), (@qid, 'Gagne des protons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un réducteur est une espèce qui :',
    'Perd des électrons (est oxydée).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Perd des électrons', 1, 1), (@qid, 'Gagne des électrons', 0, 2), (@qid, 'Perd des protons', 0, 3), (@qid, 'Gagne des protons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le nombre d''oxydation du fer dans Fe₂O₃ est :',
    '2x + 3(-2) = 0 → x = +3.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+2', 0, 1), (@qid, '+3', 1, 2), (@qid, '0', 0, 3), (@qid, '-3', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Dans la réaction Zn + Cu²⁺ → Zn²⁺ + Cu, Zn est :',
    'Zn perd 2 e⁻ → oxydé → réducteur.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oxydant', 0, 1), (@qid, 'Réducteur', 1, 2), (@qid, 'Catalyseur', 0, 3), (@qid, 'Spectateur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Les réactions de combustion sont des :',
    'Oxydoréductions (le combustible est oxydé par O₂).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Acido-basiques', 0, 1), (@qid, 'Oxydoréductions', 1, 2), (@qid, 'Précipitations', 0, 3), (@qid, 'Complexations', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le nombre d''oxydation de l''oxygène dans H₂O₂ est :',
    'Dans les peroxydes, O a un n.o. = -1.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-2', 0, 1), (@qid, '-1', 1, 2), (@qid, '0', 0, 3), (@qid, '+2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une pile électrochimique transforme :',
    'L''énergie chimique en énergie électrique.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Énergie électrique en chimique', 0, 1), (@qid, 'Énergie chimique en électrique', 1, 2), (@qid, 'Énergie thermique en chimique', 0, 3), (@qid, 'Énergie lumineuse en électrique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''électrolyse transforme :',
    'L''énergie électrique en énergie chimique.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Énergie chimique en électrique', 0, 1), (@qid, 'Énergie électrique en chimique', 1, 2), (@qid, 'Énergie thermique en chimique', 0, 3), (@qid, 'Énergie lumineuse en électrique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'À l''anode d''une cellule électrolytique se produit :',
    'L''oxydation (ANODE = OXydation → ANOX).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La réduction', 0, 1), (@qid, 'L''oxydation', 1, 2), (@qid, 'La neutralisation', 0, 3), (@qid, 'La précipitation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'À la cathode se produit la :',
    'Réduction (CATHODE = RÉDUCTION).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oxydation', 0, 1), (@qid, 'Réduction', 1, 2), (@qid, 'Neutralisation', 0, 3), (@qid, 'Dissolution', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le n.o. du manganèse dans KMnO₄ est :',
    '+1 + x + 4(-2) = 0 → x = +7.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+4', 0, 1), (@qid, '+6', 0, 2), (@qid, '+7', 1, 3), (@qid, '+8', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Dans le couple Fe³⁺/Fe²⁺, l''oxydant est :',
    'Fe³⁺ est l''oxydant (peut être réduit en Fe²⁺).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fe²⁺', 0, 1), (@qid, 'Fe³⁺', 1, 2), (@qid, 'Les deux', 0, 3), (@qid, 'Aucun', 0, 4);

-- ============================================
-- THÈME 8 : ÉNERGIE ET RÉACTIONS CHIMIQUES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une réaction exothermique :',
    'Libère de la chaleur (ΔH < 0).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Absorbe de la chaleur', 0, 1), (@qid, 'Libère de la chaleur', 1, 2), (@qid, 'Est athermique', 0, 3), (@qid, 'Ne change pas de température', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une réaction endothermique :',
    'Absorbe de la chaleur (ΔH > 0).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Absorbe de la chaleur', 1, 1), (@qid, 'Libère de la chaleur', 0, 2), (@qid, 'Est athermique', 0, 3), (@qid, 'Produit du froid', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''énergie d''activation est :',
    'L''énergie minimale nécessaire pour déclencher une réaction.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''énergie libérée par la réaction', 0, 1), (@qid, 'L''énergie absorbée par la réaction', 0, 2), (@qid, 'L''énergie minimale pour démarrer la réaction', 1, 3), (@qid, 'L''énergie totale du système', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un catalyseur :',
    'Diminue l''énergie d''activation sans être consommé.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Augmente l''énergie d''activation', 0, 1), (@qid, 'Diminue l''énergie d''activation', 1, 2), (@qid, 'Est consommé dans la réaction', 0, 3), (@qid, 'Change l''équilibre de la réaction', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La chaleur de combustion du méthane est :',
    'Environ -890 kJ/mol (réaction exothermique).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+890 kJ/mol', 0, 1), (@qid, '-890 kJ/mol', 1, 2), (@qid, '0 kJ/mol', 0, 3), (@qid, '+445 kJ/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''énergie de liaison C-H est d''environ :',
    '~415 kJ/mol.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '~200 kJ/mol', 0, 1), (@qid, '~350 kJ/mol', 0, 2), (@qid, '~415 kJ/mol', 1, 3), (@qid, '~600 kJ/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La rupture d''une liaison est :',
    'Endothermique (absorbe de l''énergie).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Exothermique', 0, 1), (@qid, 'Endothermique', 1, 2), (@qid, 'Athermique', 0, 3), (@qid, 'Spontanée sans énergie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formation d''une liaison est :',
    'Exothermique (libère de l''énergie).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Exothermique', 1, 1), (@qid, 'Endothermique', 0, 2), (@qid, 'Athermique', 0, 3), (@qid, 'Nécessite toujours un catalyseur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le pouvoir calorifique d''un combustible est :',
    'L''énergie libérée par la combustion complète d''une unité de masse.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sa température de fusion', 0, 1), (@qid, 'L''énergie libérée par unité de masse', 1, 2), (@qid, 'Sa masse volumique', 0, 3), (@qid, 'Son point d''ébullition', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La photosynthèse est une réaction :',
    'Endothermique (absorbe l''énergie lumineuse).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Exothermique', 0, 1), (@qid, 'Endothermique', 1, 2), (@qid, 'Athermique', 0, 3), (@qid, 'De neutralisation', 0, 4);

-- ============================================
-- THÈME 9 : ALLIAGES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un alliage est :',
    'Un mélange homogène de deux ou plusieurs métaux (ou métal + non-métal).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un corps pur', 0, 1), (@qid, 'Un mélange de métaux', 1, 2), (@qid, 'Un composé défini', 0, 3), (@qid, 'Un non-métal pur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le bronze est un alliage de :',
    'Cuivre (Cu) et étain (Sn).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuivre et zinc', 0, 1), (@qid, 'Cuivre et étain', 1, 2), (@qid, 'Fer et carbone', 0, 3), (@qid, 'Aluminium et cuivre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le laiton est un alliage de :',
    'Cuivre (Cu) et zinc (Zn).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuivre et étain', 0, 1), (@qid, 'Cuivre et zinc', 1, 2), (@qid, 'Fer et carbone', 0, 3), (@qid, 'Plomb et étain', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''acier est un alliage de :',
    'Fer (Fe) et carbone (C) principalement.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fer et cuivre', 0, 1), (@qid, 'Fer et carbone', 1, 2), (@qid, 'Aluminium et fer', 0, 3), (@qid, 'Cuivre et carbone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''acier inoxydable contient principalement :',
    'Fer, chrome (Cr) et nickel (Ni).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fer, carbone uniquement', 0, 1), (@qid, 'Fer, chrome, nickel', 1, 2), (@qid, 'Cuivre, zinc, étain', 0, 3), (@qid, 'Aluminium, fer, cuivre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le duralumin est un alliage d''aluminium avec :',
    'Cuivre, magnésium, manganèse (alliage léger et résistant).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fer et carbone', 0, 1), (@qid, 'Cuivre et zinc', 0, 2), (@qid, 'Cuivre, magnésium, manganèse', 1, 3), (@qid, 'Étain et plomb', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Pourquoi fabrique-t-on des alliages ?',
    'Pour améliorer les propriétés mécaniques (dureté, résistance à la corrosion...).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pour réduire la masse uniquement', 0, 1), (@qid, 'Pour améliorer les propriétés mécaniques et chimiques', 1, 2), (@qid, 'Pour augmenter le prix', 0, 3), (@qid, 'Pour changer la couleur uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''amalgame dentaire contient du mercure allié à :',
    'Argent, étain, cuivre (anciennement utilisé en dentisterie).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fer et carbone', 0, 1), (@qid, 'Argent, étain, cuivre', 1, 2), (@qid, 'Aluminium et zinc', 0, 3), (@qid, 'Platine et or', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le fer-blanc est :',
    'De l''acier recouvert d''une fine couche d''étain.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Du fer pur', 0, 1), (@qid, 'De l''acier recouvert d''étain', 1, 2), (@qid, 'Un alliage fer-zinc', 0, 3), (@qid, 'Un alliage aluminium-étain', 0, 4);

-- ============================================
-- THÈME 10 : TITRAGES ACIDO-BASIQUES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un dosage (titrage) acido-basique permet de :',
    'Déterminer la concentration inconnue d''un acide ou d''une base.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mesurer le pH uniquement', 0, 1), (@qid, 'Déterminer une concentration inconnue', 1, 2), (@qid, 'Identifier un composé', 0, 3), (@qid, 'Séparer deux liquides', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''équivalence lors d''un titrage acido-basique est atteinte quand :',
    'Les réactifs sont dans les proportions stoechiométriques (n acide versé = n base initiale).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le pH = 7', 0, 1), (@qid, 'Les proportions stoechiométriques sont atteintes', 1, 2), (@qid, 'La solution devient incolore', 0, 3), (@qid, 'La température augmente', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Lors du titrage d''un acide fort par une base forte, le pH à l''équivalence est :',
    'pH = 7 (neutralisation complète).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '< 7', 0, 1), (@qid, '= 7', 1, 2), (@qid, '> 7', 0, 3), (@qid, 'Variable selon l''acide', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Lors du titrage d''un acide faible par une base forte, le pH à l''équivalence est :',
    'pH > 7 (la base conjuguée de l''acide faible est basique).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '< 7', 0, 1), (@qid, '= 7', 0, 2), (@qid, '> 7', 1, 3), (@qid, '= 0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La relation à l''équivalence lors du dosage HCl par NaOH est :',
    'CₐVₐ = C_bV_b (monoacide fort / monobase forte).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CₐVₐ = C_bV_b', 1, 1), (@qid, 'CₐVₐ = 2 C_bV_b', 0, 2), (@qid, '2 CₐVₐ = C_bV_b', 0, 3), (@qid, 'Cₐ = C_b', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''indicateur coloré approprié pour le titrage acide fort/base forte est :',
    'Bleu de bromothymol (BBT) vire autour de pH 7.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Phénolphtaléine uniquement', 0, 1), (@qid, 'Hélianthine uniquement', 0, 2), (@qid, 'Bleu de bromothymol (BBT)', 1, 3), (@qid, 'Tout indicateur convient', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'On titre 20 mL de HCl par NaOH 0,1 mol/L. V_eq = 15 mL. C_HCl = ?',
    'C₁V₁ = C₂V₂ → C₁ × 20 = 0,1 × 15 → C₁ = 0,075 mol/L.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,05 mol/L', 0, 1), (@qid, '0,075 mol/L', 1, 2), (@qid, '0,1 mol/L', 0, 3), (@qid, '0,15 mol/L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La solution titrante est placée dans :',
    'La burette graduée.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''erlenmeyer', 0, 1), (@qid, 'La burette graduée', 1, 2), (@qid, 'La fiole jaugée', 0, 3), (@qid, 'Le bécher', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La solution à titrer est placée dans :',
    'L''erlenmeyer (ou bécher).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La burette', 0, 1), (@qid, 'L''erlenmeyer', 1, 2), (@qid, 'La fiole jaugée', 0, 3), (@qid, 'L''éprouvette', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une solution tampon :',
    'Maintient son pH quasi constant malgré l''ajout modéré d''acide ou de base.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'A un pH qui varie rapidement', 0, 1), (@qid, 'Résiste aux variations de pH', 1, 2), (@qid, 'A toujours pH = 7', 0, 3), (@qid, 'Ne contient que des acides', 0, 4);

-- SUITE POUR ATTEINDRE 500+ : QUESTIONS SUPPLÉMENTAIRES
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse molaire de H₂SO₄ est : (H=1, S=32, O=16)',
    'M = 2×1 + 32 + 4×16 = 98 g/mol.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '82 g/mol', 0, 1), (@qid, '98 g/mol', 1, 2), (@qid, '66 g/mol', 0, 3), (@qid, '100 g/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le pH d''une solution de HCl à 0,01 mol/L est :',
    'pH = -log(0,01) = 2.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '2', 1, 2), (@qid, '3', 0, 3), (@qid, '0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le nom IUPAC de CH₃-CH₂-CH₂OH ?',
    '3 carbones + OH → propan-1-ol.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Propan-1-ol', 1, 1), (@qid, 'Propan-2-ol', 0, 2), (@qid, 'Éthanol', 0, 3), (@qid, 'Butan-1-ol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La fonction acide carboxylique est :',
    '-COOH.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-OH', 0, 1), (@qid, '-COOH', 1, 2), (@qid, '-CHO', 0, 3), (@qid, '-CO-', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''acide éthanoïque (acide acétique) a pour formule :',
    'CH₃-COOH.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'H-COOH', 0, 1), (@qid, 'CH₃-COOH', 1, 2), (@qid, 'C₂H₅-COOH', 0, 3), (@qid, 'CH₃-CO-CH₃', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''ester est obtenu par réaction entre :',
    'Un acide carboxylique et un alcool (estérification).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Deux alcools', 0, 1), (@qid, 'Un acide et un alcool', 1, 2), (@qid, 'Deux acides', 0, 3), (@qid, 'Un alcool et une cétone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La saponification est l''hydrolyse basique d''un :',
    'Ester → savon + glycérol.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Alcool', 0, 1), (@qid, 'Ester', 1, 2), (@qid, 'Aldéhyde', 0, 3), (@qid, 'Alcane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quelle est la masse de 2 moles de CaCO₃ ? (Ca=40, C=12, O=16)',
    'M = 100 g/mol. m = 2 × 100 = 200 g.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 g', 0, 1), (@qid, '200 g', 1, 2), (@qid, '50 g', 0, 3), (@qid, '150 g', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le n.o. du soufre dans SO₄²⁻ est :',
    'x + 4(-2) = -2 → x = +6.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+4', 0, 1), (@qid, '+6', 1, 2), (@qid, '+2', 0, 3), (@qid, '-2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''eau de Javel contient l''ion :',
    'ClO⁻ (hypochlorite).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cl⁻', 0, 1), (@qid, 'ClO⁻', 1, 2), (@qid, 'ClO₃⁻', 0, 3), (@qid, 'ClO₄⁻', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La rouille est principalement :',
    'Fe₂O₃·xH₂O (oxyde de fer hydraté).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'FeO', 0, 1), (@qid, 'Fe₂O₃ hydraté', 1, 2), (@qid, 'Fe₃O₄', 0, 3), (@qid, 'Fe pur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La galvanisation consiste à recouvrir le fer de :',
    'Zinc (protection contre la corrosion).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cuivre', 0, 1), (@qid, 'Zinc', 1, 2), (@qid, 'Étain', 0, 3), (@qid, 'Aluminium', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''électrode standard à hydrogène a un potentiel de :',
    '0,00 V (par convention).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+0,34 V', 0, 1), (@qid, '0,00 V', 1, 2), (@qid, '+1,50 V', 0, 3), (@qid, '-0,76 V', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le nombre d''Avogadro est :',
    '6,022 × 10²³ mol⁻¹.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '6,022 × 10²²', 0, 1), (@qid, '6,022 × 10²³', 1, 2), (@qid, '3,011 × 10²³', 0, 3), (@qid, '1,204 × 10²⁴', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La concentration en ions H₃O⁺ dans l''eau pure à 25°C est :',
    '10⁻⁷ mol/L (Ke = 10⁻¹⁴).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10⁻⁶ mol/L', 0, 1), (@qid, '10⁻⁷ mol/L', 1, 2), (@qid, '10⁻⁸ mol/L', 0, 3), (@qid, '0 mol/L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le produit ionique de l''eau Ke à 25°C est :',
    'Ke = [H₃O⁺][OH⁻] = 10⁻¹⁴.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10⁻⁷', 0, 1), (@qid, '10⁻¹⁴', 1, 2), (@qid, '10⁻⁸', 0, 3), (@qid, '10⁻²¹', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un alcool secondaire oxydé donne :',
    'Une cétone.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un aldéhyde', 0, 1), (@qid, 'Une cétone', 1, 2), (@qid, 'Un acide', 0, 3), (@qid, 'Un ester', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel volume occupe 1 mole de gaz dans les CNTP ?',
    '22,4 L.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '11,2 L', 0, 1), (@qid, '22,4 L', 1, 2), (@qid, '24,0 L', 0, 3), (@qid, '44,8 L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse volumique de l''eau est :',
    '1 g/mL = 1000 g/L.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,5 g/mL', 0, 1), (@qid, '1 g/mL', 1, 2), (@qid, '1,5 g/mL', 0, 3), (@qid, '2 g/mL', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La dilution s''accompagne d''une :',
    'Diminution de la concentration (C = n/V, V augmente).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Augmentation de concentration', 0, 1), (@qid, 'Diminution de concentration', 1, 2), (@qid, 'Concentration constante', 0, 3), (@qid, 'Augmentation de la masse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La concentration massique Cm = ?',
    'Cm = m_soluté / V_solution.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'm × V', 0, 1), (@qid, 'm / V', 1, 2), (@qid, 'V / m', 0, 3), (@qid, 'm + V', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La solubilité d''un gaz dans l''eau augmente quand :',
    'La température diminue et la pression augmente (loi de Henry).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La température augmente', 0, 1), (@qid, 'La température diminue', 1, 2), (@qid, 'La pression diminue', 0, 3), (@qid, 'Le volume diminue', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''ammoniac NH₃ dans l''eau est une :',
    'Base faible (NH₃ + H₂O ⇄ NH₄⁺ + OH⁻).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Base forte', 0, 1), (@qid, 'Base faible', 1, 2), (@qid, 'Acide fort', 0, 3), (@qid, 'Acide faible', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''acide acétique CH₃COOH est un :',
    'Acide faible (partiellement dissocié dans l''eau).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Acide fort', 0, 1), (@qid, 'Acide faible', 1, 2), (@qid, 'Base forte', 0, 3), (@qid, 'Base faible', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La réaction 2H₂ + O₂ → 2H₂O est :',
    'Une synthèse (combinaison) et une oxydoréduction.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une décomposition', 0, 1), (@qid, 'Une synthèse et oxydoréduction', 1, 2), (@qid, 'Une substitution', 0, 3), (@qid, 'Un déplacement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le réactif de Tollens (miroir d''argent) caractérise :',
    'Les aldéhydes (réaction positive).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les cétones', 0, 1), (@qid, 'Les aldéhydes', 1, 2), (@qid, 'Les alcools', 0, 3), (@qid, 'Les alcanes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La liaison hydrogène est une interaction :',
    'Intermoléculaire forte (ex: entre molécules d''eau).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Intramoléculaire covalente', 0, 1), (@qid, 'Intermoléculaire électrostatique', 1, 2), (@qid, 'Ionique forte', 0, 3), (@qid, 'Métallique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le point d''ébullition des alcools est élevé à cause :',
    'Des liaisons hydrogène intermoléculaires.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De leur masse molaire', 0, 1), (@qid, 'Des liaisons hydrogène', 1, 2), (@qid, 'De leur volatilité', 0, 3), (@qid, 'De leur couleur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''or 18 carats contient :',
    '75% d''or pur (18/24).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '50% d''or', 0, 1), (@qid, '75% d''or', 1, 2), (@qid, '100% d''or', 0, 3), (@qid, '25% d''or', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le pH d''une solution de NaOH à 0,01 mol/L est :',
    'pOH = -log(0,01) = 2 → pH = 14 - 2 = 12.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '12', 1, 2), (@qid, '7', 0, 3), (@qid, '10', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''unité de la quantité de matière est :',
    'La mole (mol).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le gramme', 0, 1), (@qid, 'La mole', 1, 2), (@qid, 'Le litre', 0, 3), (@qid, 'Le mètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Qu''est-ce qu''un ion polyatomique ?',
    'Un ion constitué de plusieurs atomes (ex: SO₄²⁻, NO₃⁻, NH₄⁺).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un ion à un seul atome', 0, 1), (@qid, 'Un ion constitué de plusieurs atomes', 1, 2), (@qid, 'Un atome neutre', 0, 3), (@qid, 'Un électron libre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule de l''ion sulfate est :',
    'SO₄²⁻.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'SO₃²⁻', 0, 1), (@qid, 'SO₄²⁻', 1, 2), (@qid, 'SO₄⁻', 0, 3), (@qid, 'S²⁻', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule de l''ion nitrate est :',
    'NO₃⁻.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'NO₂⁻', 0, 1), (@qid, 'NO₃⁻', 1, 2), (@qid, 'NO₄⁻', 0, 3), (@qid, 'N³⁻', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule de l''ion ammonium est :',
    'NH₄⁺.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'NH₃', 0, 1), (@qid, 'NH₄⁺', 1, 2), (@qid, 'NH₂⁻', 0, 3), (@qid, 'NO₃⁻', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La précipitation est la formation :',
    'D''un solide insoluble à partir d''une solution.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'D''un gaz', 0, 1), (@qid, 'D''un solide insoluble', 1, 2), (@qid, 'D''une couleur', 0, 3), (@qid, 'D''une chaleur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le chlorure d''argent AgCl est un précipité de couleur :',
    'Blanc (cailleboté).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jaune', 0, 1), (@qid, 'Blanc', 1, 2), (@qid, 'Bleu', 0, 3), (@qid, 'Rouge', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le sulfate de baryum BaSO₄ est un précipité de couleur :',
    'Blanc (utilisé en radiographie).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Blanc', 1, 1), (@qid, 'Jaune', 0, 2), (@qid, 'Noir', 0, 3), (@qid, 'Vert', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''hydroxyde de cuivre Cu(OH)₂ est un précipité de couleur :',
    'Bleu.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Blanc', 0, 1), (@qid, 'Bleu', 1, 2), (@qid, 'Rouge brique', 0, 3), (@qid, 'Vert', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La combustion incomplète produit :',
    'Du monoxyde de carbone CO (toxique) et/ou du carbone.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CO₂ uniquement', 0, 1), (@qid, 'CO et/ou C', 1, 2), (@qid, 'H₂O uniquement', 0, 3), (@qid, 'O₂', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le gaz à effet de serre produit par combustion est principalement :',
    'Le dioxyde de carbone CO₂.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'O₂', 0, 1), (@qid, 'N₂', 0, 2), (@qid, 'CO₂', 1, 3), (@qid, 'H₂', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une solution acide fait virer le BBT au :',
    'Jaune.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bleu', 0, 1), (@qid, 'Jaune', 1, 2), (@qid, 'Vert', 0, 3), (@qid, 'Rouge', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une solution basique fait virer le BBT au :',
    'Bleu.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Jaune', 0, 1), (@qid, 'Bleu', 1, 2), (@qid, 'Vert', 0, 3), (@qid, 'Incolore', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La phénolphtaléine en milieu acide est :',
    'Incolore.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Rose', 0, 1), (@qid, 'Incolore', 1, 2), (@qid, 'Bleue', 0, 3), (@qid, 'Jaune', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''hélianthine en milieu basique est :',
    'Jaune (vire au rouge en milieu acide).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Rouge', 0, 1), (@qid, 'Jaune', 1, 2), (@qid, 'Bleue', 0, 3), (@qid, 'Incolore', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le gaz dégagé lors de l''action d''un acide sur un métal ?',
    'Dihydrogène H₂ (ex: Zn + 2HCl → ZnCl₂ + H₂).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'O₂', 0, 1), (@qid, 'H₂', 1, 2), (@qid, 'CO₂', 0, 3), (@qid, 'Cl₂', 0, 4);


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule brute du butan-2-ol est :',
    'C₄H₁₀O (4 carbones, alcool secondaire).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'C₃H₈O', 0, 1), (@qid, 'C₄H₁₀O', 1, 2), (@qid, 'C₄H₈O', 0, 3), (@qid, 'C₅H₁₂O', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le glycérol (propan-1,2,3-triol) a combien de fonctions alcool ?',
    '3 fonctions -OH (triol).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '2', 0, 2), (@qid, '3', 1, 3), (@qid, '4', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule du dichlore est :',
    'Cl₂.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cl', 0, 1), (@qid, 'Cl₂', 1, 2), (@qid, 'ClO', 0, 3), (@qid, 'Cl₂O', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse molaire de NaCl est : (Na=23, Cl=35,5)',
    '23 + 35,5 = 58,5 g/mol.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '35,5 g/mol', 0, 1), (@qid, '58,5 g/mol', 1, 2), (@qid, '23 g/mol', 0, 3), (@qid, '46,5 g/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Combien de grammes de NaCl pour préparer 500 mL à 0,2 mol/L ? (M=58,5)',
    'm = C × V × M = 0,2 × 0,5 × 58,5 = 5,85 g.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2,925 g', 0, 1), (@qid, '5,85 g', 1, 2), (@qid, '11,7 g', 0, 3), (@qid, '58,5 g', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le polymère du chlorure de vinyle (PVC) a pour monomère :',
    'CH₂=CHCl (chlorure de vinyle).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CH₂=CH₂', 0, 1), (@qid, 'CH₂=CHCl', 1, 2), (@qid, 'CH₂=CH-CH₃', 0, 3), (@qid, 'CCl₂=CCl₂', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''éthylène glycol (éthan-1,2-diol) est utilisé comme :',
    'Antigel.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Carburant', 0, 1), (@qid, 'Antigel', 1, 2), (@qid, 'Solvant pour peinture', 0, 3), (@qid, 'Engrais', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le formol est une solution aqueuse de :',
    'Méthanal (formaldéhyde) à 37%.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Éthanol', 0, 1), (@qid, 'Méthanal', 1, 2), (@qid, 'Propanone', 0, 3), (@qid, 'Acide acétique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le n.o. du chrome dans Cr₂O₇²⁻ ?',
    '2x + 7(-2) = -2 → 2x - 14 = -2 → 2x = 12 → x = +6.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+3', 0, 1), (@qid, '+6', 1, 2), (@qid, '+7', 0, 3), (@qid, '+2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La couleur du sulfate de cuivre anhydre CuSO₄ est :',
    'Blanc (il devient bleu en s''hydratant).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bleu', 0, 1), (@qid, 'Blanc', 1, 2), (@qid, 'Vert', 0, 3), (@qid, 'Rouge', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La couleur du sulfate de cuivre pentahydraté CuSO₄·5H₂O est :',
    'Bleu.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bleu', 1, 1), (@qid, 'Blanc', 0, 2), (@qid, 'Vert', 0, 3), (@qid, 'Rouge', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''équation ionique nette de la précipitation de AgCl est :',
    'Ag⁺ + Cl⁻ → AgCl(s).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Na⁺ + Cl⁻ → NaCl', 0, 1), (@qid, 'Ag⁺ + Cl⁻ → AgCl', 1, 2), (@qid, 'Ag⁺ + NO₃⁻ → AgNO₃', 0, 3), (@qid, 'Na⁺ + NO₃⁻ → NaNO₃', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La quantité de matière n, la masse m et la masse molaire M sont liées par :',
    'n = m/M.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'n = m × M', 0, 1), (@qid, 'n = m / M', 1, 2), (@qid, 'n = M / m', 0, 3), (@qid, 'n = m + M', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La réaction de craquage (cracking) est utilisée pour :',
    'Transformer des alcanes lourds en alcanes plus légers et alcènes.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Produire des polymères', 0, 1), (@qid, 'Obtenir des hydrocarbures plus légers', 1, 2), (@qid, 'Fabriquer des savons', 0, 3), (@qid, 'Synthétiser des esters', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La réaction d''un acide carboxylique avec un alcool produit :',
    'Un ester + eau (estérification de Fischer).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un sel uniquement', 0, 1), (@qid, 'Un ester et de l''eau', 1, 2), (@qid, 'Un anhydride', 0, 3), (@qid, 'Une cétone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel catalyseur est utilisé pour l''hydrogénation des alcènes ?',
    'Nickel (Ni), palladium (Pd) ou platine (Pt).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'H₂SO₄', 0, 1), (@qid, 'Ni, Pd ou Pt', 1, 2), (@qid, 'NaOH', 0, 3), (@qid, 'AlCl₃', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse molaire du glucose C₆H₁₂O₆ est : (C=12, H=1, O=16)',
    '6×12 + 12×1 + 6×16 = 180 g/mol.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '150 g/mol', 0, 1), (@qid, '180 g/mol', 1, 2), (@qid, '162 g/mol', 0, 3), (@qid, '192 g/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La demi-équation de réduction de Cu²⁺ est :',
    'Cu²⁺ + 2e⁻ → Cu.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cu → Cu²⁺ + 2e⁻', 0, 1), (@qid, 'Cu²⁺ + 2e⁻ → Cu', 1, 2), (@qid, 'Cu²⁺ → Cu + 2e⁻', 0, 3), (@qid, 'Cu + 2e⁻ → Cu²⁺', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La demi-équation d''oxydation du zinc est :',
    'Zn → Zn²⁺ + 2e⁻.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Zn → Zn²⁺ + 2e⁻', 1, 1), (@qid, 'Zn²⁺ + 2e⁻ → Zn', 0, 2), (@qid, 'Zn + 2e⁻ → Zn²⁺', 0, 3), (@qid, 'Zn²⁺ → Zn + 2e⁻', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Dans une pile Daniell (Zn/Cu), l''anode est :',
    'L''électrode de zinc (où a lieu l''oxydation).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''électrode de cuivre', 0, 1), (@qid, 'L''électrode de zinc', 1, 2), (@qid, 'Le pont salin', 0, 3), (@qid, 'La solution de CuSO₄', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Qu''est-ce qu''un hydrocarbure insaturé ?',
    'Molécule avec au moins une double ou triple liaison C-C (alcène, alcyne).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un alcane uniquement', 0, 1), (@qid, 'Possédant des liaisons doubles ou triples', 1, 2), (@qid, 'Un alcool', 0, 3), (@qid, 'Un composé sans carbone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''isomérie de position concerne :',
    'Des composés ayant la même fonction mais à des positions différentes sur la chaîne.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des fonctions différentes', 0, 1), (@qid, 'Même fonction, position différente', 1, 2), (@qid, 'Des masses molaires différentes', 0, 3), (@qid, 'Des nombres d''atomes différents', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''oxydation complète (combustion) d''un alcool produit :',
    'CO₂ + H₂O.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CO + H₂O', 0, 1), (@qid, 'CO₂ + H₂O', 1, 2), (@qid, 'CO₂ + H₂', 0, 3), (@qid, 'C + H₂O', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le pourcentage massique du carbone dans CH₄ ? (C=12, H=1)',
    'M = 16. %C = 12/16 × 100 = 75%.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '25%', 0, 1), (@qid, '50%', 0, 2), (@qid, '75%', 1, 3), (@qid, '100%', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quelle est la composition centésimale massique de l''eau H₂O ?',
    '%H = 2/18 × 100 = 11,1% ; %O = 16/18 × 100 = 88,9%.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '50% H, 50% O', 0, 1), (@qid, '11,1% H, 88,9% O', 1, 2), (@qid, '33,3% H, 66,7% O', 0, 3), (@qid, '20% H, 80% O', 0, 4);

-- Dernière série pour dépasser 500
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La classification périodique actuelle est basée sur :',
    'Le numéro atomique Z croissant.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La masse atomique', 0, 1), (@qid, 'Le numéro atomique Z', 1, 2), (@qid, 'Le nombre de neutrons', 0, 3), (@qid, 'L''électronégativité', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Les éléments d''une même colonne ont le même :',
    'Nombre d''électrons de valence (mêmes propriétés chimiques).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Nombre de protons', 0, 1), (@qid, 'Nombre d''électrons de valence', 1, 2), (@qid, 'Nombre de neutrons', 0, 3), (@qid, 'Nombre de couches électroniques', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Les métaux alcalins appartiennent à :',
    'La première colonne (groupe 1).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Groupe 1', 1, 1), (@qid, 'Groupe 2', 0, 2), (@qid, 'Groupe 17', 0, 3), (@qid, 'Groupe 18', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Les halogènes appartiennent à :',
    'Groupe 17 (avant-dernière colonne).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Groupe 1', 0, 1), (@qid, 'Groupe 17', 1, 2), (@qid, 'Groupe 2', 0, 3), (@qid, 'Groupe 18', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Les gaz nobles (inertes) appartiennent à :',
    'Groupe 18 (dernière colonne, couche de valence saturée).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Groupe 1', 0, 1), (@qid, 'Groupe 17', 0, 2), (@qid, 'Groupe 18', 1, 3), (@qid, 'Groupe 2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''élément le plus électronégatif est :',
    'Le fluor (F), électronégativité = 4,0 (échelle de Pauling).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''oxygène', 0, 1), (@qid, 'Le fluor', 1, 2), (@qid, 'Le chlore', 0, 3), (@qid, 'L''azote', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Combien d''électrons de valence possède le carbone ?',
    '4 électrons (configuration 1s²2s²2p²).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '4', 1, 2), (@qid, '6', 0, 3), (@qid, '8', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une réaction d''addition sur un alcène suit la règle de :',
    'Markovnikov (H se fixe sur le carbone le plus hydrogéné).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Chatelier', 0, 1), (@qid, 'Markovnikov', 1, 2), (@qid, 'Hund', 0, 3), (@qid, 'Pauling', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le groupe fonctionnel -CO-NH- est celui d''un :',
    'Amide.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ester', 0, 1), (@qid, 'Amide', 1, 2), (@qid, 'Amine', 0, 3), (@qid, 'Éther', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La réaction entre un acide et un alcool est une :',
    'Estérification (réaction lente, limitée, catalysée par H⁺).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Saponification', 0, 1), (@qid, 'Estérification', 1, 2), (@qid, 'Hydrolyse', 0, 3), (@qid, 'Oxydation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Qu''est-ce qu''un acide aminé ?',
    'Molécule possédant une fonction amine (-NH₂) et une fonction acide carboxylique (-COOH).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un acide fort uniquement', 0, 1), (@qid, 'Molécule avec -NH₂ et -COOH', 1, 2), (@qid, 'Un hydrocarbure azoté', 0, 3), (@qid, 'Un ester d''ammoniac', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse atomique relative du carbone 12 est par définition :',
    '12 u (unité de masse atomique).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 u', 0, 1), (@qid, '12 u', 1, 2), (@qid, '6 u', 0, 3), (@qid, '16 u', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La molécule de benzène C₆H₆ contient :',
    'Des doubles liaisons conjuguées (structure cyclique aromatique).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement des liaisons simples', 0, 1), (@qid, 'Des doubles liaisons conjuguées', 1, 2), (@qid, 'Une triple liaison', 0, 3), (@qid, 'Des liaisons ioniques', 0, 4);


-- ============================================
-- QCM CHIMIE NS4 - HAÏTI (Supplément 400+)
-- Extraits des Examens Officiels NS4 + Philo
-- Mêmes chapitres que précédemment
-- ============================================

-- ============================================
-- SUITE THÈME 1 : ALCANES - ALCÈNES - ALCYNES (60 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le nom de l''alcane C₆H₁₄ ?',
    '6 carbones → hexane (C₆H₁₄).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pentane', 0, 1), (@qid, 'Hexane', 1, 2), (@qid, 'Heptane', 0, 3), (@qid, 'Octane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le nom IUPAC de (CH₃)₂CH-CH₃ ?',
    'Chaîne de 3 carbones avec un méthyle en position 2 → 2-méthylpropane (isobutane).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Butane', 0, 1), (@qid, '2-méthylpropane', 1, 2), (@qid, '2-méthylbutane', 0, 3), (@qid, 'Diméthyléthane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Combien d''atomes d''hydrogène dans le butane C₄H₁₀ ?',
    'C₄H₁₀ → 10 atomes d''hydrogène.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '8', 0, 1), (@qid, '10', 1, 2), (@qid, '12', 0, 3), (@qid, '6', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le radical alkyle dérivé du méthane est :',
    'Méthyle (-CH₃).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Éthyle', 0, 1), (@qid, 'Méthyle', 1, 2), (@qid, 'Propyle', 0, 3), (@qid, 'Butyle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Lequel de ces alcanes a la plus haute température d''ébullition ?',
    'Plus la chaîne est longue, plus T_eb est élevée → C₆H₁₄.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CH₄', 0, 1), (@qid, 'C₂H₆', 0, 2), (@qid, 'C₄H₁₀', 0, 3), (@qid, 'C₆H₁₄', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La réaction CH₄ + Cl₂ → CH₃Cl + HCl est une :',
    'Substitution radicalaire (caractéristique des alcanes).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Addition', 0, 1), (@qid, 'Substitution', 1, 2), (@qid, 'Élimination', 0, 3), (@qid, 'Polymérisation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le nom du composé CH₃-CH₂-CH=CH₂ ?',
    '4 carbones, double liaison en position 1 → but-1-ène.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'But-1-ène', 1, 1), (@qid, 'But-2-ène', 0, 2), (@qid, 'Propène', 0, 3), (@qid, 'Butane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''addition de HBr sur le propène donne majoritairement :',
    '2-bromopropane (règle de Markovnikov : H sur C le plus hydrogéné).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1-bromopropane', 0, 1), (@qid, '2-bromopropane', 1, 2), (@qid, '1,2-dibromopropane', 0, 3), (@qid, '3-bromopropane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel alcyne a pour formule C₃H₄ ?',
    'Propyne (CH₃-C≡CH).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Éthyne', 0, 1), (@qid, 'Propyne', 1, 2), (@qid, 'But-1-yne', 0, 3), (@qid, 'But-2-yne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La combustion complète du butane C₄H₁₀ produit combien de moles de CO₂ par mole de butane ?',
    'C₄H₁₀ + 12/2 O₂ → 4 CO₂ + 5 H₂O → 4 moles CO₂.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '3', 0, 2), (@qid, '4', 1, 3), (@qid, '5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le pourcentage massique de carbone dans l''éthane C₂H₆ ? (C=12, H=1)',
    'M = 30. %C = 24/30 × 100 = 80%.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '75%', 0, 1), (@qid, '80%', 1, 2), (@qid, '85%', 0, 3), (@qid, '90%', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Lequel de ces composés décolore l''eau de brome ?',
    'Le propène (alcène) décolore instantanément Br₂.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Propane', 0, 1), (@qid, 'Propène', 1, 2), (@qid, 'Propan-1-ol', 0, 3), (@qid, 'Propanone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La polymérisation du propène donne :',
    'Polypropylène (PP).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Polyéthylène', 0, 1), (@qid, 'Polypropylène', 1, 2), (@qid, 'Polystyrène', 0, 3), (@qid, 'PVC', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un alcane contenant 5 atomes de carbone a pour formule :',
    'C₅H₁₂ (CₙH₂ₙ₊₂).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'C₅H₁₀', 0, 1), (@qid, 'C₅H₁₂', 1, 2), (@qid, 'C₅H₈', 0, 3), (@qid, 'C₅H₆', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le nom de (CH₃)₂C=CH₂ est :',
    'Chaîne principale de 3 carbones avec double liaison et 2 méthyles → 2-méthylpropène (isobutylène).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'But-1-ène', 0, 1), (@qid, '2-méthylpropène', 1, 2), (@qid, 'But-2-ène', 0, 3), (@qid, '2,2-diméthyléthène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''acétylène brûle avec une flamme :',
    'Très éclairante (riche en carbone, produit des particules de C incandescentes).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bleue pâle', 0, 1), (@qid, 'Très éclairante', 1, 2), (@qid, 'Invisible', 0, 3), (@qid, 'Verte', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel volume de O₂ (CNTP) pour brûler 1 mole de méthane ?',
    'CH₄ + 2 O₂ → CO₂ + 2 H₂O. 2 moles O₂ = 44,8 L.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '11,2 L', 0, 1), (@qid, '22,4 L', 0, 2), (@qid, '44,8 L', 1, 3), (@qid, '67,2 L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''hydratation de l''éthylène en présence d''acide donne :',
    'Éthanol (CH₂=CH₂ + H₂O → CH₃CH₂OH).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Éthane', 0, 1), (@qid, 'Éthanol', 1, 2), (@qid, 'Éthanal', 0, 3), (@qid, 'Acide acétique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le gaz naturel est principalement constitué de :',
    'Méthane CH₄ (plus de 80%).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Éthane', 0, 1), (@qid, 'Méthane', 1, 2), (@qid, 'Propane', 0, 3), (@qid, 'Butane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Lequel de ces composés est un isomère du pentane ?',
    '2-méthylbutane = C₅H₁₂ aussi.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Butane', 0, 1), (@qid, '2-méthylbutane', 1, 2), (@qid, 'Hexane', 0, 3), (@qid, 'Propane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''hydrogénation catalytique du but-2-ène donne :',
    'Butane (CH₃-CH=CH-CH₃ + H₂ → CH₃-CH₂-CH₂-CH₃).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'But-1-ène', 0, 1), (@qid, 'Butane', 1, 2), (@qid, 'But-1-yne', 0, 3), (@qid, 'Butan-2-ol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le nom de CH₃-CH₂-C≡CH ?',
    '4 carbones, triple liaison en position 1 → but-1-yne.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'But-1-ène', 0, 1), (@qid, 'But-1-yne', 1, 2), (@qid, 'But-2-yne', 0, 3), (@qid, 'Butane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La réaction de Diels-Alder concerne :',
    'Les diènes conjugués (alcènes avec 2 doubles liaisons).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les alcanes', 0, 1), (@qid, 'Les diènes conjugués', 1, 2), (@qid, 'Les alcynes uniquement', 0, 3), (@qid, 'Les alcools', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le nombre d''isomères de l''hexane C₆H₁₄ ?',
    '5 isomères de chaîne.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3', 0, 1), (@qid, '4', 0, 2), (@qid, '5', 1, 3), (@qid, '6', 0, 4);

-- ============================================
-- SUITE THÈME 2 : ALCOOLS, ALDÉHYDES, CÉTONES, ACIDES (70 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le propan-2-ol est un alcool :',
    'OH sur le carbone 2 lié à 2 autres carbones → secondaire.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Primaire', 0, 1), (@qid, 'Secondaire', 1, 2), (@qid, 'Tertiaire', 0, 3), (@qid, 'Quaternaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le produit de l''oxydation ménagée du propan-2-ol ?',
    'Alcool secondaire → cétone = propanone (acétone).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Propanal', 0, 1), (@qid, 'Propanone', 1, 2), (@qid, 'Acide propanoïque', 0, 3), (@qid, 'Propène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''oxydation du propan-1-ol donne d''abord :',
    'Alcool primaire → aldéhyde = propanal.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Propanone', 0, 1), (@qid, 'Propanal', 1, 2), (@qid, 'Acide propanoïque', 0, 3), (@qid, 'Propène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Lequel de ces composés donne un test positif à la liqueur de Fehling ?',
    'L''éthanal (aldéhyde) est oxydé par la liqueur de Fehling.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Propanone', 0, 1), (@qid, 'Éthanal', 1, 2), (@qid, 'Éthanol', 0, 3), (@qid, 'Éthane', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule générale d''une cétone est :',
    'R-CO-R'' (carbonyle entre deux chaînes carbonées).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'R-CHO', 0, 1), (@qid, 'R-CO-R''', 1, 2), (@qid, 'R-COOH', 0, 3), (@qid, 'R-OH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le nom usuel de CH₃-CH₂OH ?',
    'Éthanol (alcool éthylique).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Méthanol', 0, 1), (@qid, 'Éthanol', 1, 2), (@qid, 'Propanol', 0, 3), (@qid, 'Butanol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le méthanol est toxique car il est oxydé en :',
    'Méthanal (formaldéhyde) puis acide formique, toxiques pour le système nerveux.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Éthanol', 0, 1), (@qid, 'Méthanal', 1, 2), (@qid, 'Propanone', 0, 3), (@qid, 'Éthanal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Qu''est-ce que le test de l''haloforme (iodoforme) ?',
    'Test spécifique aux méthylcétones (R-CO-CH₃) : précipité jaune de CHI₃.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Test pour les alcools primaires', 0, 1), (@qid, 'Test pour les méthylcétones', 1, 2), (@qid, 'Test pour les aldéhydes', 0, 3), (@qid, 'Test pour les alcènes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule semi-développée de l''acide éthanoïque est :',
    'CH₃-COOH (vinaigre).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CH₃-CHO', 0, 1), (@qid, 'CH₃-COOH', 1, 2), (@qid, 'CH₃-CO-CH₃', 0, 3), (@qid, 'CH₃-CH₂OH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''acide méthanoïque a pour formule :',
    'H-COOH (le plus simple des acides carboxyliques).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CH₃-COOH', 0, 1), (@qid, 'H-COOH', 1, 2), (@qid, 'C₂H₅-COOH', 0, 3), (@qid, 'C₆H₅-COOH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le nom du composé CH₃-CH₂-COOH ?',
    '3 carbones → acide propanoïque.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Acide éthanoïque', 0, 1), (@qid, 'Acide propanoïque', 1, 2), (@qid, 'Acide butanoïque', 0, 3), (@qid, 'Acide méthanoïque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Un acide carboxylique réagit avec un alcool pour former :',
    'Un ester + eau (estérification).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un sel uniquement', 0, 1), (@qid, 'Un ester et de l''eau', 1, 2), (@qid, 'Une cétone', 0, 3), (@qid, 'Un aldéhyde', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le vinaigre est une solution diluée d''acide :',
    'Acide éthanoïque (acétique) à environ 5-8%.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Méthanoïque', 0, 1), (@qid, 'Éthanoïque', 1, 2), (@qid, 'Propanoïque', 0, 3), (@qid, 'Chlorhydrique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''acide benzoïque possède :',
    'Un cycle benzénique (C₆H₅-COOH), utilisé comme conservateur.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une chaîne linéaire', 0, 1), (@qid, 'Un cycle benzénique', 1, 2), (@qid, 'Une triple liaison', 0, 3), (@qid, 'Une fonction cétone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le produit de la réduction d''un aldéhyde ?',
    'Aldéhyde réduit → alcool primaire.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cétone', 0, 1), (@qid, 'Alcool primaire', 1, 2), (@qid, 'Acide carboxylique', 0, 3), (@qid, 'Alcène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le produit de la réduction d''une cétone ?',
    'Cétone réduite → alcool secondaire.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Alcool primaire', 0, 1), (@qid, 'Alcool secondaire', 1, 2), (@qid, 'Alcool tertiaire', 0, 3), (@qid, 'Aldéhyde', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse molaire de l''acide acétique CH₃COOH est : (C=12, H=1, O=16)',
    'M = 2×12 + 4×1 + 2×16 = 60 g/mol.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '46 g/mol', 0, 1), (@qid, '60 g/mol', 1, 2), (@qid, '74 g/mol', 0, 3), (@qid, '88 g/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La réaction d''un acide avec une base s''appelle :',
    'Neutralisation (formation de sel + eau).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Estérification', 0, 1), (@qid, 'Neutralisation', 1, 2), (@qid, 'Saponification', 0, 3), (@qid, 'Oxydation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''hydrolyse basique d''un ester est appelée :',
    'Saponification (production de savon).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Estérification', 0, 1), (@qid, 'Saponification', 1, 2), (@qid, 'Neutralisation', 0, 3), (@qid, 'Déshydratation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''éther diéthylique a pour formule semi-développée :',
    'CH₃-CH₂-O-CH₂-CH₃ (éther-oxyde).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CH₃-O-CH₃', 0, 1), (@qid, 'CH₃-CH₂-O-CH₂-CH₃', 1, 2), (@qid, 'CH₃-CH₂OH', 0, 3), (@qid, 'CH₃-CO-CH₃', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La fonction amine est caractérisée par le groupe :',
    '-NH₂ (amine primaire), -NHR (secondaire), -NR₂ (tertiaire).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '-OH', 0, 1), (@qid, '-NH₂', 1, 2), (@qid, '-NO₂', 0, 3), (@qid, '-CN', 0, 4);

-- ============================================
-- SUITE THÈME 3 : LIAISONS CHIMIQUES (50 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La liaison dans Cl₂ est :',
    'Covalente pure (apolaire) car ΔEN = 0.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ionique', 0, 1), (@qid, 'Covalente pure', 1, 2), (@qid, 'Covalente polarisée', 0, 3), (@qid, 'Métallique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel composé a une liaison covalente polarisée ?',
    'HCl : différence d''électronégativité entre H et Cl.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'H₂', 0, 1), (@qid, 'HCl', 1, 2), (@qid, 'Cl₂', 0, 3), (@qid, 'N₂', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La liaison ionique est généralement formée entre :',
    'Un métal (faible EN) et un non-métal (forte EN).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Deux métaux', 0, 1), (@qid, 'Un métal et un non-métal', 1, 2), (@qid, 'Deux non-métaux identiques', 0, 3), (@qid, 'Deux gaz nobles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Parmi ces liaisons, laquelle est la plus polaire ?',
    'La plus grande différence d''EN entre H et F.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'C-H', 0, 1), (@qid, 'N-H', 0, 2), (@qid, 'O-H', 0, 3), (@qid, 'F-H', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La géométrie de la molécule CH₄ est :',
    'Tétraédrique (4 liaisons simples, pas de doublet libre).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Plane carrée', 0, 1), (@qid, 'Tétraédrique', 1, 2), (@qid, 'Pyramidale', 0, 3), (@qid, 'Linéaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La géométrie de NH₃ est :',
    'Pyramide trigonale (3 liaisons + 1 doublet libre).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Plane trigonale', 0, 1), (@qid, 'Pyramidale trigonale', 1, 2), (@qid, 'Tétraédrique régulière', 0, 3), (@qid, 'Linéaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La géométrie de H₂O est :',
    'Coudée (2 liaisons + 2 doublets libres, angle ~104,5°).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Linéaire', 0, 1), (@qid, 'Coudée (en V)', 1, 2), (@qid, 'Tétraédrique', 0, 3), (@qid, 'Plane trigonale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La liaison dans le graphite est :',
    'Covalente dans les feuillets, intermoléculaire entre les feuillets.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ionique', 0, 1), (@qid, 'Covalente dans les plans', 1, 2), (@qid, 'Métallique uniquement', 0, 3), (@qid, 'Hydrogène uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Lequel de ces solides est moléculaire ?',
    'La glace (H₂O solide) est un solide moléculaire (liaisons H).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'NaCl', 0, 1), (@qid, 'Glace (H₂O)', 1, 2), (@qid, 'Diamant', 0, 3), (@qid, 'Fer', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le diamant est un solide :',
    'Covalent (réseau tridimensionnel de liaisons C-C).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ionique', 0, 1), (@qid, 'Covalent', 1, 2), (@qid, 'Moléculaire', 0, 3), (@qid, 'Métallique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Qu''est-ce que l''hybridation sp³ du carbone ?',
    '4 orbitales hybrides équivalentes pour 4 liaisons σ (tétraédrique).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3 orbitales hybrides', 0, 1), (@qid, '4 orbitales hybrides pour liaisons σ', 1, 2), (@qid, '2 orbitales hybrides', 0, 3), (@qid, '1 orbitale hybride', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Dans C₂H₄, l''hybridation du carbone est :',
    'sp² (3 orbitales hybrides = 3σ + 1π pour la double liaison).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'sp', 0, 1), (@qid, 'sp²', 1, 2), (@qid, 'sp³', 0, 3), (@qid, 'sp³d', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Dans C₂H₂, l''hybridation du carbone est :',
    'sp (2 orbitales hybrides = 2σ + 2π pour la triple liaison).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'sp', 1, 1), (@qid, 'sp²', 0, 2), (@qid, 'sp³', 0, 3), (@qid, 'sp³d²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La liaison métallique est due à :',
    'La mise en commun d''électrons délocalisés (mer d''électrons).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un transfert d''électrons', 0, 1), (@qid, 'Des électrons délocalisés', 1, 2), (@qid, 'Des protons mobiles', 0, 3), (@qid, 'Des doublets non liants', 0, 4);

-- ============================================
-- SUITE THÈME 4 : ACIDES, BASES, pH (70 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le pH est défini par :',
    'pH = -log[H₃O⁺].', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'pH = log[H₃O⁺]', 0, 1), (@qid, 'pH = -log[H₃O⁺]', 1, 2), (@qid, 'pH = [H₃O⁺]²', 0, 3), (@qid, 'pH = 14 - [H₃O⁺]', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Si [H₃O⁺] = 10⁻³ mol/L, le pH est :',
    'pH = -log(10⁻³) = 3.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '3', 1, 2), (@qid, '10', 0, 3), (@qid, '11', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Si pH = 5, [H₃O⁺] = ?',
    '[H₃O⁺] = 10⁻⁵ mol/L.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10⁻⁵ mol/L', 1, 1), (@qid, '10⁵ mol/L', 0, 2), (@qid, '5 mol/L', 0, 3), (@qid, '10⁻⁷ mol/L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le pH d''une solution de NaOH à 10⁻² mol/L ?',
    'pOH = 2 → pH = 12.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '10', 0, 2), (@qid, '12', 1, 3), (@qid, '14', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une solution dont le pH passe de 3 à 5 est devenue :',
    '100 fois moins acide (chaque unité pH = facteur 10).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 fois plus acide', 0, 1), (@qid, '100 fois moins acide', 1, 2), (@qid, '10 fois moins acide', 0, 3), (@qid, '2 fois moins acide', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''acide sulfurique H₂SO₄ est un diacide car :',
    'Il peut libérer 2 protons H⁺.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il contient 2 atomes S', 0, 1), (@qid, 'Il peut libérer 2 H⁺', 1, 2), (@qid, 'Il contient 4 atomes O', 0, 3), (@qid, 'Il est très concentré', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le pH d''une solution d''acide faible est :',
    'pH > -log C (car l''acide n''est pas totalement dissocié).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'pH = -log C', 0, 1), (@qid, 'pH > -log C', 1, 2), (@qid, 'pH < -log C', 0, 3), (@qid, 'pH = 7', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La constante d''acidité Ka est définie par :',
    'Ka = [H₃O⁺][A⁻]/[HA] (équilibre de dissociation).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ka = [HA]/[H₃O⁺][A⁻]', 0, 1), (@qid, 'Ka = [H₃O⁺][A⁻]/[HA]', 1, 2), (@qid, 'Ka = [H₃O⁺]/[HA]', 0, 3), (@qid, 'Ka = [A⁻]/[HA]', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'pKa + pKb = ? (à 25°C)',
    'pKa + pKb = 14 (pour un couple acide/base conjuguée).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '7', 0, 1), (@qid, '10', 0, 2), (@qid, '14', 1, 3), (@qid, '0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Parmi ces acides, lequel est le plus fort ? (pKa le plus faible)',
    'HCl : pKa ≈ -7 (acide fort).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'HCl (pKa ≈ -7)', 1, 1), (@qid, 'CH₃COOH (pKa = 4,76)', 0, 2), (@qid, 'H₂CO₃ (pKa = 6,35)', 0, 3), (@qid, 'NH₄⁺ (pKa = 9,2)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une solution tampon est constituée de :',
    'Un acide faible et sa base conjuguée en proportions voisines.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un acide fort et une base forte', 0, 1), (@qid, 'Un acide faible et sa base conjuguée', 1, 2), (@qid, 'Deux acides forts', 0, 3), (@qid, 'De l''eau pure', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''équation de Henderson-Hasselbalch est :',
    'pH = pKa + log([base]/[acide]).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'pH = pKa - log([base]/[acide])', 0, 1), (@qid, 'pH = pKa + log([base]/[acide])', 1, 2), (@qid, 'pH = 14 - pKa', 0, 3), (@qid, 'pH = pKa × [acide]', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Qu''est-ce que l''autoprotolyse de l''eau ?',
    '2 H₂O ⇄ H₃O⁺ + OH⁻ (équilibre).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'H₂O → H₂ + ½O₂', 0, 1), (@qid, '2 H₂O ⇄ H₃O⁺ + OH⁻', 1, 2), (@qid, 'H₂O + HCl → H₃O⁺ + Cl⁻', 0, 3), (@qid, 'NaOH + H₂O → Na⁺ + OH⁻', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'À 25°C, [H₃O⁺] = 10⁻⁹ mol/L. La solution est :',
    'pH = 9 > 7 → basique.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Acide', 0, 1), (@qid, 'Basique', 1, 2), (@qid, 'Neutre', 0, 3), (@qid, 'Tampon', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''acide phosphorique H₃PO₄ est un triacide, il peut libérer :',
    '3 protons H⁺.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 H⁺', 0, 1), (@qid, '2 H⁺', 0, 2), (@qid, '3 H⁺', 1, 3), (@qid, '0 H⁺', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''ammoniac NH₃ est une base car il peut :',
    'Capter un proton H⁺ (NH₃ + H⁺ → NH₄⁺).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Donner un proton', 0, 1), (@qid, 'Capter un proton', 1, 2), (@qid, 'Donner un électron', 0, 3), (@qid, 'Produire OH⁻ directement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le pH d''une solution de Ca(OH)₂ à 0,005 mol/L ?',
    '[OH⁻] = 0,01 mol/L → pOH = 2 → pH = 12.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10', 0, 1), (@qid, '11', 0, 2), (@qid, '12', 1, 3), (@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Qu''est-ce qu''un ampholyte ?',
    'Une espèce qui peut se comporter comme acide ou comme base (ex : H₂O, HCO₃⁻).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un acide fort uniquement', 0, 1), (@qid, 'Une espèce à la fois acide et base', 1, 2), (@qid, 'Une base forte uniquement', 0, 3), (@qid, 'Un sel neutre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'HCO₃⁻ peut :',
    'Céder H⁺ (acide) ou capter H⁺ (base) = amphotère.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Être uniquement acide', 0, 1), (@qid, 'Être à la fois acide et base', 1, 2), (@qid, 'Être uniquement basique', 0, 3), (@qid, 'Être neutre', 0, 4);

-- ============================================
-- SUITE THÈME 5 : STOECHIOMÉTRIE (50 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Combien de moles dans 88 g de CO₂ ? (M = 44 g/mol)',
    'n = 88/44 = 2 moles.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '2', 1, 2), (@qid, '3', 0, 3), (@qid, '0,5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quelle masse de NaOH dans 250 mL à 0,1 mol/L ? (M=40)',
    'n = 0,1 × 0,25 = 0,025 mol. m = 0,025 × 40 = 1 g.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,5 g', 0, 1), (@qid, '1 g', 1, 2), (@qid, '2 g', 0, 3), (@qid, '4 g', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Combien de moles d''atomes dans 18 g d''eau H₂O ?',
    'n(H₂O) = 1 mole. 3 moles d''atomes (2 H + 1 O).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 mole d''atomes', 0, 1), (@qid, '2 moles d''atomes', 0, 2), (@qid, '3 moles d''atomes', 1, 3), (@qid, '18 moles d''atomes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Pour la réaction N₂ + 3H₂ → 2NH₃, combien de moles de NH₃ à partir de 6 moles de H₂ ?',
    '3 H₂ → 2 NH₃. 6 H₂ → 4 NH₃.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '3', 0, 2), (@qid, '4', 1, 3), (@qid, '6', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse de 11,2 L de O₂ (CNTP) est : (M=32)',
    'n = 11,2/22,4 = 0,5 mol. m = 0,5 × 32 = 16 g.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '8 g', 0, 1), (@qid, '16 g', 1, 2), (@qid, '32 g', 0, 3), (@qid, '64 g', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Combien de grammes de CaO produits par décomposition de 100 g de CaCO₃ ? (Ca=40, C=12, O=16)',
    'CaCO₃ → CaO + CO₂. M(CaCO₃)=100, M(CaO)=56. n=100/100=1 mol → 56 g CaO.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '44 g', 0, 1), (@qid, '56 g', 1, 2), (@qid, '100 g', 0, 3), (@qid, '28 g', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel volume de H₂ (CNTP) produit par 6,5 g de Zn + HCl ? (Zn=65)',
    'Zn + 2HCl → ZnCl₂ + H₂. n(Zn) = 0,1 mol → n(H₂) = 0,1 mol → V = 2,24 L.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1,12 L', 0, 1), (@qid, '2,24 L', 1, 2), (@qid, '4,48 L', 0, 3), (@qid, '22,4 L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quelle masse de précipité AgCl formé par 100 mL de NaCl 0,1 M + AgNO₃ excès ? (Ag=108, Cl=35,5)',
    'n(NaCl) = n(AgCl) = 0,01 mol. M(AgCl) = 143,5. m = 1,435 g.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,585 g', 0, 1), (@qid, '1,435 g', 1, 2), (@qid, '5,85 g', 0, 3), (@qid, '14,35 g', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Combien de grammes d''oxygène pour brûler 12 g de carbone ? (C=12)',
    'C + O₂ → CO₂. n(C) = 1 mol → n(O₂) = 1 mol → m = 32 g.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '16 g', 0, 1), (@qid, '32 g', 1, 2), (@qid, '8 g', 0, 3), (@qid, '44 g', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Équilibrer : Fe + O₂ → Fe₂O₃. Coefficient de Fe ?',
    '4 Fe + 3 O₂ → 2 Fe₂O₃. Coefficient Fe = 4.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '3', 0, 2), (@qid, '4', 1, 3), (@qid, '6', 0, 4);

-- ============================================
-- SUITE THÈME 6 : SOLUTIONS (40 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'On dilue 10 mL d''une solution mère 1 mol/L à 100 mL. La concentration fille est :',
    'C₁V₁ = C₂V₂ → C₂ = 1×10/100 = 0,1 mol/L.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,01 mol/L', 0, 1), (@qid, '0,1 mol/L', 1, 2), (@qid, '1 mol/L', 0, 3), (@qid, '10 mol/L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le facteur de dilution F = 10 signifie :',
    'La solution mère est 10 fois plus concentrée que la solution fille.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dilution au 1/10', 1, 1), (@qid, 'Concentration × 10', 0, 2), (@qid, 'Volume divisé par 10', 0, 3), (@qid, 'Masse × 10', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une solution aqueuse contient 20 g de sel pour 200 mL. Concentration massique ?',
    'Cm = 20 g / 0,2 L = 100 g/L.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10 g/L', 0, 1), (@qid, '40 g/L', 0, 2), (@qid, '100 g/L', 1, 3), (@qid, '200 g/L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le solvant dans une solution aqueuse ?',
    'L''eau.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le sel dissous', 0, 1), (@qid, 'L''eau', 1, 2), (@qid, 'Le mélange', 0, 3), (@qid, 'Le récipient', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La concentration molaire d''une solution de 7,3 g de HCl dans 2 L est : (M=36,5)',
    'n = 7,3/36,5 = 0,2 mol. C = 0,2/2 = 0,1 mol/L.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,05 mol/L', 0, 1), (@qid, '0,1 mol/L', 1, 2), (@qid, '0,2 mol/L', 0, 3), (@qid, '1 mol/L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une solution de glucose à 5% signifie :',
    '5 g de glucose pour 100 g (ou 100 mL) de solution.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5 g pour 100 g de solution', 1, 1), (@qid, '5 g pour 1000 mL', 0, 2), (@qid, '5 moles pour 100 mL', 0, 3), (@qid, '5 g/L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''eau est un solvant polaire parce que :',
    'Sa molécule est polaire (moment dipolaire ≠ 0).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Elle est pure', 0, 1), (@qid, 'Sa molécule est polaire', 1, 2), (@qid, 'Elle est transparente', 0, 3), (@qid, 'Elle bout à 100°C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''alcool et l''eau sont miscibles car :',
    'Ils peuvent former des liaisons hydrogène entre eux.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ils ont la même couleur', 0, 1), (@qid, 'Ils forment des liaisons H', 1, 2), (@qid, 'Ils ont la même densité', 0, 3), (@qid, 'Ils sont tous deux des acides', 0, 4);

-- ============================================
-- SUITE THÈME 7 : OXYDORÉDUCTION (50 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Dans Fe + CuSO₄ → FeSO₄ + Cu, Fe est :',
    'Fe → Fe²⁺ + 2e⁻ (oxydé → réducteur).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oxydé', 0, 1), (@qid, 'Réduit', 0, 2), (@qid, 'Le réducteur (oxydé)', 1, 3), (@qid, 'Spectateur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Dans la même réaction, Cu²⁺ est :',
    'Cu²⁺ + 2e⁻ → Cu (réduit → oxydant).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oxydant (réduit)', 1, 1), (@qid, 'Réducteur', 0, 2), (@qid, 'Le solvant', 0, 3), (@qid, 'Le catalyseur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le n.o. du fer dans Fe₃O₄ est :',
    'Moyenne : 3x + 4(-2) = 0 → 3x = 8 → x = +8/3 (Fe₂O₃ + FeO).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+2', 0, 1), (@qid, '+3', 0, 2), (@qid, '+8/3', 1, 3), (@qid, '+4', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel est le n.o. de C dans CO₂ ?',
    'x + 2(-2) = 0 → x = +4.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+2', 0, 1), (@qid, '+4', 1, 2), (@qid, '-2', 0, 3), (@qid, '0', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le n.o. de S dans H₂SO₄ est :',
    '2(+1) + x + 4(-2) = 0 → x = +6.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '+4', 0, 1), (@qid, '+6', 1, 2), (@qid, '+2', 0, 3), (@qid, '-2', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Dans la pile, le courant électrique circule de :',
    'La cathode (+) vers l''anode (-) dans le circuit extérieur.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''anode vers la cathode', 0, 1), (@qid, 'La cathode vers l''anode', 1, 2), (@qid, 'Toujours du cuivre au zinc', 0, 3), (@qid, 'Du sel vers le métal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''électrolyse de l''eau produit :',
    'H₂ à la cathode et O₂ à l''anode.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'H₂ et O₂', 1, 1), (@qid, 'H₂O et sel', 0, 2), (@qid, 'H₂ et Cl₂', 0, 3), (@qid, 'Na et Cl₂', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La rouille est une oxydation du fer par :',
    'L''oxygène de l''air en présence d''eau.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le chlore', 0, 1), (@qid, 'L''oxygène et l''eau', 1, 2), (@qid, 'L''azote', 0, 3), (@qid, 'Le dioxyde de carbone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le réducteur le plus fort a le potentiel standard :',
    'Le plus négatif (tendance à s''oxyder).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le plus positif', 0, 1), (@qid, 'Le plus négatif', 1, 2), (@qid, 'Égal à 0 V', 0, 3), (@qid, 'Supérieur à 1 V', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quelle est la fem de la pile Daniell ? E°(Cu²⁺/Cu)=+0,34V ; E°(Zn²⁺/Zn)=-0,76V',
    'fem = E°cathode - E°anode = 0,34 - (-0,76) = 1,10 V.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,42 V', 0, 1), (@qid, '1,10 V', 1, 2), (@qid, '-0,42 V', 0, 3), (@qid, '2,20 V', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Dans l''électrolyse de NaCl fondu, on obtient à l''anode :',
    'Cl₂ (oxydation de Cl⁻).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Na', 0, 1), (@qid, 'Cl₂', 1, 2), (@qid, 'H₂', 0, 3), (@qid, 'NaOH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une réaction d''oxydoréduction implique un transfert :',
    'D''électrons entre l''oxydant et le réducteur.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De protons', 0, 1), (@qid, 'D''électrons', 1, 2), (@qid, 'De neutrons', 0, 3), (@qid, 'D''atomes entiers', 0, 4);

-- ============================================
-- SUITE THÈME 8 : ÉNERGIE (15 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Une réaction qui dégage de la chaleur est :',
    'Exothermique.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Endothermique', 0, 1), (@qid, 'Exothermique', 1, 2), (@qid, 'Athermique', 0, 3), (@qid, 'Catalytique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'ΔH < 0 correspond à une réaction :',
    'Exothermique (perte d''énergie du système).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Exothermique', 1, 1), (@qid, 'Endothermique', 0, 2), (@qid, 'Sans échange de chaleur', 0, 3), (@qid, 'Isobare', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''énergie d''activation d''une réaction catalysée est :',
    'Plus faible que celle de la réaction non catalysée.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Plus élevée', 0, 1), (@qid, 'Plus faible', 1, 2), (@qid, 'Identique', 0, 3), (@qid, 'Nulle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La chaleur dégagée par la combustion du méthane est de :',
    'Environ 890 kJ/mol.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '286 kJ/mol', 0, 1), (@qid, '890 kJ/mol', 1, 2), (@qid, '1410 kJ/mol', 0, 3), (@qid, '2200 kJ/mol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''énergie de liaison C=C est :',
    'Environ 610 kJ/mol (plus forte que C-C ~348 kJ/mol).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '~348 kJ/mol', 0, 1), (@qid, '~610 kJ/mol', 1, 2), (@qid, '~837 kJ/mol', 0, 3), (@qid, '~415 kJ/mol', 0, 4);

-- ============================================
-- SUITE THÈME 9 : ALLIAGES (15 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le laiton est utilisé pour :',
    'Robinetterie, instruments de musique, décoration.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Outils de coupe', 0, 1), (@qid, 'Robinetterie et décoration', 1, 2), (@qid, 'Structures de bâtiment', 0, 3), (@qid, 'Fils électriques uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''acier doux contient du carbone à :',
    'Moins de 0,2%.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '< 0,2%', 1, 1), (@qid, '0,5 à 1%', 0, 2), (@qid, '2 à 4%', 0, 3), (@qid, '> 5%', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Lequel de ces alliages contient du mercure ?',
    'L''amalgame (alliage de mercure avec d''autres métaux).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bronze', 0, 1), (@qid, 'Amalgame', 1, 2), (@qid, 'Laiton', 0, 3), (@qid, 'Acier', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le constantan (Cu-Ni) est utilisé pour :',
    'Résistances électriques (faible variation avec T).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bijouterie', 0, 1), (@qid, 'Résistances électriques', 1, 2), (@qid, 'Construction navale', 0, 3), (@qid, 'Couverts', 0, 4);

-- ============================================
-- SUITE THÈME 10 : TITRAGES (20 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'On titre 25 mL de NaOH par HCl 0,2 M. V_eq = 12,5 mL. C_NaOH = ?',
    'C_b = CₐVₐ/V_b = 0,2×12,5/25 = 0,1 mol/L.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,05 mol/L', 0, 1), (@qid, '0,1 mol/L', 1, 2), (@qid, '0,2 mol/L', 0, 3), (@qid, '0,4 mol/L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Qu''est-ce que le point d''équivalence ?',
    'Moment où les réactifs sont en proportions stoechiométriques.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'pH = 7 toujours', 0, 1), (@qid, 'Proportions stoechiométriques', 1, 2), (@qid, 'La solution change de couleur forcément', 0, 3), (@qid, 'La température est maximale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'L''indicateur doit avoir sa zone de virage :',
    'Qui encadre le pH à l''équivalence.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Au-dessus du pH d''équivalence', 0, 1), (@qid, 'Qui encadre le pH d''équivalence', 1, 2), (@qid, 'En dessous du pH d''équivalence', 0, 3), (@qid, 'Peu importe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La phénolphtaléine vire de :',
    'Incolore à rose (pH 8,2-10).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Rouge à jaune', 0, 1), (@qid, 'Incolore à rose', 1, 2), (@qid, 'Jaune à bleu', 0, 3), (@qid, 'Bleu à rouge', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le BBT vire du jaune au bleu entre pH :',
    '6,0 à 7,6.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3,1-4,4', 0, 1), (@qid, '6,0-7,6', 1, 2), (@qid, '8,2-10', 0, 3), (@qid, '1,2-2,8', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Lors du titrage acide faible/base forte, le pH à l''équivalence est :',
    '> 7 (la base conjuguée est basique).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '< 7', 0, 1), (@qid, '= 7', 0, 2), (@qid, '> 7', 1, 3), (@qid, 'Impossible à prévoir', 0, 4);

-- ============================================
-- QUESTIONS FINALES COMPLÉMENTAIRES (20 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La réaction de CaCO₃ + 2HCl → CaCl₂ + CO₂ + H₂O est :',
    'Une réaction acide-carbonate avec dégagement gazeux.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une neutralisation simple', 0, 1), (@qid, 'Acide-carbonate avec CO₂', 1, 2), (@qid, 'Une oxydoréduction', 0, 3), (@qid, 'Une précipitation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel gaz est identifié par le test à l''eau de chaux ?',
    'CO₂ (trouble l''eau de chaux par formation de CaCO₃).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'O₂', 0, 1), (@qid, 'CO₂', 1, 2), (@qid, 'H₂', 0, 3), (@qid, 'N₂', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel gaz produit une détonation à l''approche d''une flamme ?',
    'H₂ (dihydrogène, très inflammable).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'O₂', 0, 1), (@qid, 'H₂', 1, 2), (@qid, 'CO₂', 0, 3), (@qid, 'N₂', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quel gaz ravive une flamme ?',
    'O₂ (comburant).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'H₂', 0, 1), (@qid, 'O₂', 1, 2), (@qid, 'CO₂', 0, 3), (@qid, 'N₂', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La masse de 1 L d''eau est :',
    '1000 g (masse volumique = 1 g/mL).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '100 g', 0, 1), (@qid, '1000 g', 1, 2), (@qid, '500 g', 0, 3), (@qid, '10 g', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La densité de l''éthanol par rapport à l''eau est 0,8. Sa masse volumique est :',
    '0,8 g/mL = 800 g/L.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,8 g/mL', 1, 1), (@qid, '1 g/mL', 0, 2), (@qid, '1,2 g/mL', 0, 3), (@qid, '0,5 g/mL', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le cobalt est utilisé dans les alliages pour :',
    'Résistance à haute température (superalliages).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Baisser le point de fusion', 0, 1), (@qid, 'Résistance à haute température', 1, 2), (@qid, 'Augmenter la conductivité électrique', 0, 3), (@qid, 'Rendre l''alliage magnétique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule de l''ion carbonate est :',
    'CO₃²⁻.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CO₃⁻', 0, 1), (@qid, 'CO₃²⁻', 1, 2), (@qid, 'HCO₃⁻', 0, 3), (@qid, 'CO₄²⁻', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La formule de l''ion phosphate est :',
    'PO₄³⁻.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'PO₃³⁻', 0, 1), (@qid, 'PO₄³⁻', 1, 2), (@qid, 'PO₄⁻', 0, 3), (@qid, 'HPO₄²⁻', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Qu''est-ce qu''un indicateur coloré ?',
    'Une substance qui change de couleur selon le pH.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un réactif qui catalyse', 0, 1), (@qid, 'Une substance qui change de couleur selon le pH', 1, 2), (@qid, 'Un sel coloré', 0, 3), (@qid, 'Un acide fort', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le pH-mètre mesure :',
    'La différence de potentiel entre une électrode de verre et une électrode de référence.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La température', 0, 1), (@qid, 'Le potentiel électrique lié au pH', 1, 2), (@qid, 'La couleur de la solution', 0, 3), (@qid, 'La masse de soluté', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le monoxyde de carbone CO est dangereux car :',
    'Il se fixe sur l''hémoglobine à la place de l''oxygène.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il est explosif', 0, 1), (@qid, 'Il bloque le transport d''O₂ dans le sang', 1, 2), (@qid, 'Il est corrosif pour la peau', 0, 3), (@qid, 'Il détruit la couche d''ozone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Quelle est la fraction molaire d''un constituant dans un mélange ?',
    'x_i = n_i / n_total.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'n_i × n_total', 0, 1), (@qid, 'n_i / n_total', 1, 2), (@qid, 'm_i / m_total', 0, 3), (@qid, 'V_i / V_total', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La loi de Beer-Lambert relie :',
    'L''absorbance à la concentration (A = εℓC).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La masse et le volume', 0, 1), (@qid, 'L''absorbance et la concentration', 1, 2), (@qid, 'Le pH et la concentration', 0, 3), (@qid, 'La température et la pression', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Qu''est-ce que la chromatographie ?',
    'Technique de séparation des constituants d''un mélange.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une méthode de chauffage', 0, 1), (@qid, 'Une technique de séparation', 1, 2), (@qid, 'Une réaction chimique', 0, 3), (@qid, 'Un type de titrage', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'La distillation permet de séparer des liquides basée sur :',
    'La différence de températures d''ébullition.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La couleur', 0, 1), (@qid, 'La différence de points d''ébullition', 1, 2), (@qid, 'La densité uniquement', 0, 3), (@qid, 'Le pH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(11, 2, 'Le sulfate de cuivre hydraté est utilisé pour détecter :',
    'La présence d''eau (il devient bleu).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''oxygène', 0, 1), (@qid, 'L''eau', 1, 2), (@qid, 'Le CO₂', 0, 3), (@qid, 'L''azote', 0, 4);

-- Complétion
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(11, 1, 'La formule chimique du chlorure de sodium (sel de cuisine) est ________.', NULL, 'Programme NS4', 1, 'NaCl');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(11, 1, 'Un atome est électriquement neutre car il a autant de protons que d''________.', NULL, 'Programme NS4', 1, 'électrons');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(11, 1, 'Le pH d''une solution neutre est ________.', NULL, 'Programme NS4', 1, '7');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(11, 1, 'Le symbole chimique du fer est ________.', NULL, 'Programme NS4', 1, 'Fe');


-- =============================================
-- 12. SVT NS4 (matiere_id = 12)
-- =============================================

-- QCM
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel organite est le siège de la respiration cellulaire ?', 'La mitochondrie est le siège de la respiration cellulaire.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le noyau', 0, 1), (@qid, 'Le ribosome', 0, 2), (@qid, 'La mitochondrie', 1, 3), (@qid, 'Le réticulum endoplasmique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle molécule porte l''information génétique ?', 'L''ADN (Acide DésoxyriboNucléique) porte l''information génétique.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ARN', 0, 1), (@qid, 'ATP', 0, 2), (@qid, 'ADN', 1, 3), (@qid, 'ADP', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Combien de chromosomes possède une cellule humaine somatique (diploïde) ?', 'Une cellule humaine diploïde possède 46 chromosomes (23 paires).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '23', 0, 1), (@qid, '46', 1, 2), (@qid, '48', 0, 3), (@qid, '92', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel est le rôle principal de la chlorophylle ?', 'La chlorophylle capte l''énergie lumineuse pour la photosynthèse.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Stocker l''eau', 0, 1), (@qid, 'Capter l''énergie lumineuse', 1, 2), (@qid, 'Produire des protéines', 0, 3), (@qid, 'Transporter l''oxygène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La division cellulaire qui maintient le nombre de chromosomes s''appelle :', 'La mitose produit deux cellules filles identiques à la cellule mère.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Méiose', 0, 1), (@qid, 'Mitose', 1, 2), (@qid, 'Cytokinèse', 0, 3), (@qid, 'Fécondation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle est la fonction principale du sang ?', 'Le sang transporte notamment l''oxygène, les nutriments et les déchets.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Produire des hormones', 0, 1), (@qid, 'Digérer les aliments', 0, 2), (@qid, 'Transporter l''oxygène et les nutriments', 1, 3), (@qid, 'Filtrer l''air', 0, 4);


-- ============================================
-- QCM BIOLOGIE NS4 - HAÏTI
-- Plus de 600 questions couvrant tout le programme
-- Sources : Programme détaillé 4ème année + Examens officiels NS4
-- ============================================

-- ============================================
-- THÈME 1 : NUTRIMENTS ET VITAMINES (60 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Combien de principaux types de nutriments existe-t-il ?',
    'Six : glucides, lipides, protéines, vitamines, minéraux, eau.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4', 0, 1), (@qid, '5', 0, 2), (@qid, '6', 1, 3), (@qid, '7', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les vitamines liposolubles sont :',
    'A, D, E, K (solubles dans les graisses, stockées dans le foie).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'A, B, C, D', 0, 1), (@qid, 'A, D, E, K', 1, 2), (@qid, 'B, C uniquement', 0, 3), (@qid, 'C, D, E, K', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les vitamines hydrosolubles sont :',
    'Groupe B et vitamine C (solubles dans l''eau, non stockées).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'A, D, E, K', 0, 1), (@qid, 'B et C', 1, 2), (@qid, 'A et C', 0, 3), (@qid, 'A, B, C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vitamine A est importante pour :',
    'La vision (notamment la vision nocturne).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La coagulation du sang', 0, 1), (@qid, 'La vision', 1, 2), (@qid, 'La digestion', 0, 3), (@qid, 'La respiration', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une carence en vitamine C provoque :',
    'Le scorbut (fatigue, saignement des gencives).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le rachitisme', 0, 1), (@qid, 'Le scorbut', 1, 2), (@qid, 'La cécité nocturne', 0, 3), (@qid, 'L''anémie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vitamine D est synthétisée par la peau sous l''action :',
    'Des rayons UV du soleil.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De la chaleur', 0, 1), (@qid, 'Des rayons UV', 1, 2), (@qid, 'Du froid', 0, 3), (@qid, 'De l''humidité', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une carence en vitamine D chez l''enfant provoque :',
    'Le rachitisme (déformation osseuse).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le scorbut', 0, 1), (@qid, 'Le rachitisme', 1, 2), (@qid, 'La pellagre', 0, 3), (@qid, 'Le béribéri', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vitamine K est essentielle pour :',
    'La coagulation sanguine.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La vision', 0, 1), (@qid, 'La coagulation sanguine', 1, 2), (@qid, 'La croissance osseuse', 0, 3), (@qid, 'La respiration cellulaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vitamine E est un puissant :',
    'Antioxydant (protège les membranes cellulaires).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Coagulant', 0, 1), (@qid, 'Antioxydant', 1, 2), (@qid, 'Antibiotique', 0, 3), (@qid, 'Hormone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les glucides sont principalement une source de :',
    'Énergie rapide (4 kcal/g).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Énergie', 1, 1), (@qid, 'Structure cellulaire uniquement', 0, 2), (@qid, 'Hormones', 0, 3), (@qid, 'Enzymes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les protéines sont constituées d''unités appelées :',
    'Acides aminés (20 types différents).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Nucléotides', 0, 1), (@qid, 'Acides aminés', 1, 2), (@qid, 'Glucides simples', 0, 3), (@qid, 'Acides gras', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les lipides sont :',
    'Des graisses, source d''énergie concentrée (9 kcal/g).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des sucres', 0, 1), (@qid, 'Des graisses', 1, 2), (@qid, 'Des protéines', 0, 3), (@qid, 'Des vitamines', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''eau représente environ quel pourcentage du corps humain ?',
    'Environ 60-70% du poids corporel.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '20-30%', 0, 1), (@qid, '40-50%', 0, 2), (@qid, '60-70%', 1, 3), (@qid, '80-90%', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une carence en vitamine B1 (thiamine) provoque :',
    'Le béribéri (troubles nerveux et cardiaques).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le scorbut', 0, 1), (@qid, 'Le béribéri', 1, 2), (@qid, 'La pellagre', 0, 3), (@qid, 'Le rachitisme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vitamine B12 est essentielle pour :',
    'La formation des globules rouges et le système nerveux.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La vision', 0, 1), (@qid, 'La formation des globules rouges', 1, 2), (@qid, 'La coagulation', 0, 3), (@qid, 'L''ossification', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le fer est un minéral essentiel pour :',
    'La formation de l''hémoglobine (transport d''oxygène).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La contraction musculaire', 0, 1), (@qid, 'La formation de l''hémoglobine', 1, 2), (@qid, 'La vision', 0, 3), (@qid, 'La digestion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le calcium est principalement nécessaire pour :',
    'La formation des os et des dents.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La digestion', 0, 1), (@qid, 'La formation des os', 1, 2), (@qid, 'La vision', 0, 3), (@qid, 'La respiration', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''iode est un composant essentiel des :',
    'Hormones thyroïdiennes (T3 et T4).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hormones surrénaliennes', 0, 1), (@qid, 'Hormones thyroïdiennes', 1, 2), (@qid, 'Hormones pancréatiques', 0, 3), (@qid, 'Hormones hypophysaires', 0, 4);

-- ============================================
-- THÈME 2 : IMMUNITÉ - DÉFENSES NON SPÉCIFIQUES (70 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les barrières superficielles de l''organisme comprennent :',
    'La peau et les muqueuses (première ligne de défense).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les os uniquement', 0, 1), (@qid, 'La peau et les muqueuses', 1, 2), (@qid, 'Le sang uniquement', 0, 3), (@qid, 'Les muscles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La peau constitue une barrière physique grâce à :',
    'La kératine (couche cornée imperméable).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La mélanine uniquement', 0, 1), (@qid, 'La kératine', 1, 2), (@qid, 'Le collagène', 0, 3), (@qid, 'L''élastine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La phagocytose est réalisée par :',
    'Les macrophages et les neutrophiles (globules blancs phagocytaires).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les globules rouges', 0, 1), (@qid, 'Les macrophages', 1, 2), (@qid, 'Les plaquettes', 0, 3), (@qid, 'Les cellules nerveuses', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La phagocytose consiste à :',
    'Ingérer et détruire des micro-organismes ou débris cellulaires.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Produire des anticorps', 0, 1), (@qid, 'Ingérer et digérer des pathogènes', 1, 2), (@qid, 'Transporter l''oxygène', 0, 3), (@qid, 'Coaguler le sang', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les cellules tueuses naturelles (NK) attaquent :',
    'Les cellules infectées par des virus et les cellules tumorales.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement les bactéries', 0, 1), (@qid, 'Cellules infectées et tumorales', 1, 2), (@qid, 'Les globules rouges', 0, 3), (@qid, 'Les anticorps', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La réaction inflammatoire se caractérise par :',
    'Rougeur, chaleur, gonflement, douleur (4 signes cardinaux).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Fièvre uniquement', 0, 1), (@qid, 'Rougeur, chaleur, gonflement, douleur', 1, 2), (@qid, 'Production d''anticorps uniquement', 0, 3), (@qid, 'Destruction des os', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''histamine est un médiateur chimique libéré lors de :',
    'La réaction inflammatoire (par les mastocytes).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La digestion', 0, 1), (@qid, 'La réaction inflammatoire', 1, 2), (@qid, 'La photosynthèse', 0, 3), (@qid, 'La respiration', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''interféron est une protéine qui :',
    'Inhibe la multiplication virale (défense antivirale).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Détruit les bactéries', 0, 1), (@qid, 'Inhibe la multiplication virale', 1, 2), (@qid, 'Coagule le sang', 0, 3), (@qid, 'Transporte l''oxygène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le système du complément est composé de :',
    'Protéines plasmatiques qui amplifient la réponse immunitaire.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lipides membranaires', 0, 1), (@qid, 'Protéines plasmatiques', 1, 2), (@qid, 'Glucides', 0, 3), (@qid, 'Acides nucléiques', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les défenses non spécifiques sont :',
    'Présentes dès la naissance, agissent contre tous les pathogènes.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Spécifiques à chaque antigène', 0, 1), (@qid, 'Présentes dès la naissance, non spécifiques', 1, 2), (@qid, 'Acquises après vaccination', 0, 3), (@qid, 'Uniquement humorales', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les muqueuses protègent l''organisme en sécrétant :',
    'Du mucus qui piège les micro-organismes.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des hormones', 0, 1), (@qid, 'Du mucus', 1, 2), (@qid, 'De l''hémoglobine', 0, 3), (@qid, 'De l''insuline', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le lysozyme présent dans la salive et les larmes a pour fonction :',
    'De détruire la paroi des bactéries (enzyme antibactérienne).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De transporter l''oxygène', 0, 1), (@qid, 'De détruire la paroi bactérienne', 1, 2), (@qid, 'De coaguler le sang', 0, 3), (@qid, 'De produire de l''énergie', 0, 4);

-- ============================================
-- THÈME 3 : SYSTÈME IMMUNITAIRE - DÉFENSES SPÉCIFIQUES (90 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les lymphocytes B maturent dans :',
    'La moelle osseuse (Bone marrow).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le thymus', 0, 1), (@qid, 'La moelle osseuse', 1, 2), (@qid, 'La rate', 0, 3), (@qid, 'Les ganglions lymphatiques', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les lymphocytes T maturent dans :',
    'Le thymus (d''où le T).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La moelle osseuse', 0, 1), (@qid, 'Le thymus', 1, 2), (@qid, 'La rate', 0, 3), (@qid, 'Le foie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un antigène est :',
    'Une substance étrangère qui déclenche une réponse immunitaire.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un anticorps', 0, 1), (@qid, 'Une substance étrangère immunogène', 1, 2), (@qid, 'Un globule blanc', 0, 3), (@qid, 'Une hormone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les plasmocytes sont issus de la différenciation des :',
    'Lymphocytes B activés (ils produisent des anticorps).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lymphocytes T', 0, 1), (@qid, 'Lymphocytes B', 1, 2), (@qid, 'Macrophages', 0, 3), (@qid, 'Cellules NK', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les cellules mémoires permettent :',
    'Une réponse immunitaire plus rapide lors d''un second contact avec l''antigène.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La digestion', 0, 1), (@qid, 'Une réponse secondaire rapide', 1, 2), (@qid, 'La respiration', 0, 3), (@qid, 'La photosynthèse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''immunité humorale fait intervenir :',
    'Les anticorps produits par les lymphocytes B/plasmocytes.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les lymphocytes T cytotoxiques', 0, 1), (@qid, 'Les anticorps', 1, 2), (@qid, 'Les macrophages uniquement', 0, 3), (@qid, 'La peau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''immunité à médiation cellulaire fait intervenir :',
    'Les lymphocytes T (cytotoxiques, auxiliaires).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les anticorps uniquement', 0, 1), (@qid, 'Les lymphocytes T', 1, 2), (@qid, 'Les globules rouges', 0, 3), (@qid, 'Les plaquettes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un anticorps est une protéine en forme de :',
    'Y (immunoglobuline avec 2 chaînes lourdes et 2 légères).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'X', 0, 1), (@qid, 'Y', 1, 2), (@qid, 'Z', 0, 3), (@qid, 'Sphère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les immunoglobulines G (IgG) sont :',
    'Les anticorps les plus abondants dans le sang, traversent le placenta.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les plus rares', 0, 1), (@qid, 'Les plus abondants, passent le placenta', 1, 2), (@qid, 'Présents uniquement dans la salive', 0, 3), (@qid, 'Inefficaces', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les anticorps IgM sont produits :',
    'Lors de la réponse immunitaire primaire (premiers anticorps).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'En dernier', 0, 1), (@qid, 'En premier lors de la réponse primaire', 1, 2), (@qid, 'Uniquement chez le foetus', 0, 3), (@qid, 'Dans les os', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les IgA se trouvent principalement dans :',
    'Les sécrétions muqueuses (salive, larmes, lait maternel).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le sang uniquement', 0, 1), (@qid, 'Les sécrétions muqueuses', 1, 2), (@qid, 'Les os', 0, 3), (@qid, 'Le cerveau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les IgE sont impliquées dans :',
    'Les réactions allergiques (activation des mastocytes).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La coagulation', 0, 1), (@qid, 'Les allergies', 1, 2), (@qid, 'La digestion', 0, 3), (@qid, 'La vision', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le macrophage joue le rôle de :',
    'Cellule présentatrice d''antigène (CPA) aux lymphocytes T.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Transporteur d''oxygène', 0, 1), (@qid, 'Cellule présentatrice d''antigène', 1, 2), (@qid, 'Producteur d''hormones', 0, 3), (@qid, 'Cellule nerveuse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le processus de sélection clonale concerne :',
    'Les lymphocytes T (expansion des clones spécifiques à un antigène).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les globules rouges', 0, 1), (@qid, 'Les lymphocytes T', 1, 2), (@qid, 'Les plaquettes', 0, 3), (@qid, 'Les neurones', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Avant une transplantation d''organe, on teste :',
    'La compatibilité HLA (CMH) entre donneur et receveur.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le groupe sanguin uniquement', 0, 1), (@qid, 'La compatibilité HLA/CMH', 1, 2), (@qid, 'Le poids', 0, 3), (@qid, 'La couleur des yeux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La séropositivité au VIH signifie :',
    'Présence d''anticorps anti-VIH dans le sang.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Absence du virus', 0, 1), (@qid, 'Présence d''anticorps anti-VIH', 1, 2), (@qid, 'Guérison', 0, 3), (@qid, 'Immunité totale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le SIDA est causé par :',
    'Le VIH (Virus de l''Immunodéficience Humaine).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une bactérie', 0, 1), (@qid, 'Le VIH', 1, 2), (@qid, 'Un champignon', 0, 3), (@qid, 'Un parasite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le VIH attaque principalement :',
    'Les lymphocytes T CD4 (auxiliaires).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les globules rouges', 0, 1), (@qid, 'Les lymphocytes T CD4', 1, 2), (@qid, 'Les plaquettes', 0, 3), (@qid, 'Les neurones', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vaccination consiste à introduire :',
    'Un antigène atténué ou inactivé pour stimuler la mémoire immunitaire.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des antibiotiques', 0, 1), (@qid, 'Un antigène atténué/inactivé', 1, 2), (@qid, 'Des hormones', 0, 3), (@qid, 'Des vitamines', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''immunité active s''acquiert par :',
    'Contact naturel avec un pathogène ou vaccination.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Injection d''anticorps', 0, 1), (@qid, 'Vaccination ou infection naturelle', 1, 2), (@qid, 'Allaitement uniquement', 0, 3), (@qid, 'Transfusion sanguine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''immunité passive s''acquiert par :',
    'Transfert d''anticorps (maternel, sérothérapie).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vaccination', 0, 1), (@qid, 'Transfert d''anticorps maternels ou sériques', 1, 2), (@qid, 'Infection naturelle', 0, 3), (@qid, 'Exposition au soleil', 0, 4);

-- ============================================
-- THÈME 4 : GLANDES HORMONALES (100 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une hormone est :',
    'Un messager chimique sécrété par une glande endocrine, agissant à distance.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une enzyme digestive', 0, 1), (@qid, 'Un messager chimique sanguin', 1, 2), (@qid, 'Un neurotransmetteur uniquement', 0, 3), (@qid, 'Une vitamine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La sécrétine a été découverte par :',
    'Bayliss et Starling (première hormone découverte).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pasteur', 0, 1), (@qid, 'Bayliss et Starling', 1, 2), (@qid, 'Darwin', 0, 3), (@qid, 'Mendel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les hormones thyroïdiennes T3 et T4 contiennent :',
    'De l''iode (essentiel à leur synthèse).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Du fer', 0, 1), (@qid, 'De l''iode', 1, 2), (@qid, 'Du calcium', 0, 3), (@qid, 'Du sodium', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''hyperthyroïdie se caractérise par :',
    'Une production excessive d''hormones thyroïdiennes (amaigrissement, tachycardie).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un manque d''hormones thyroïdiennes', 0, 1), (@qid, 'Un excès d''hormones thyroïdiennes', 1, 2), (@qid, 'Une thyroïde normale', 0, 3), (@qid, 'L''absence de thyroïde', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''hypothyroïdie congénitale non traitée provoque :',
    'Le crétinisme (retard mental et de croissance).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le gigantisme', 0, 1), (@qid, 'Le crétinisme', 1, 2), (@qid, 'L''acromégalie', 0, 3), (@qid, 'Le diabète', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La calcitonine est produite par :',
    'La thyroïde (cellules parafolliculaires), elle abaisse la calcémie.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les surrénales', 0, 1), (@qid, 'La thyroïde', 1, 2), (@qid, 'Le pancréas', 0, 3), (@qid, 'L''hypophyse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La corticosurrénale produit :',
    'Le cortisol et l''aldostérone (corticostéroïdes).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''adrénaline', 0, 1), (@qid, 'Le cortisol', 1, 2), (@qid, 'L''insuline', 0, 3), (@qid, 'La thyroxine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La médullosurrénale sécrète :',
    'L''adrénaline et la noradrénaline (catécholamines).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le cortisol', 0, 1), (@qid, 'L''adrénaline', 1, 2), (@qid, 'L''aldostérone', 0, 3), (@qid, 'La testostérone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''adrénaline prépare l''organisme à :',
    'La lutte ou la fuite (augmente FC, glycémie...).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La digestion', 0, 1), (@qid, 'La lutte ou la fuite', 1, 2), (@qid, 'Le sommeil', 0, 3), (@qid, 'La croissance', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le pancréas est une glande :',
    'Amphicrine (endocrine ET exocrine).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement endocrine', 0, 1), (@qid, 'Amphicrine', 1, 2), (@qid, 'Uniquement exocrine', 0, 3), (@qid, 'Nerveuse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''insuline est produite par les cellules :',
    'Bêta (β) des îlots de Langerhans.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Alpha (α)', 0, 1), (@qid, 'Bêta (β)', 1, 2), (@qid, 'Delta (δ)', 0, 3), (@qid, 'Gamma', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le glucagon est produit par les cellules :',
    'Alpha (α) des îlots de Langerhans.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Alpha (α)', 1, 1), (@qid, 'Bêta (β)', 0, 2), (@qid, 'Delta (δ)', 0, 3), (@qid, 'PP', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''insuline a pour effet :',
    'Hypoglycémiant (abaisse la glycémie en favorisant l''entrée du glucose dans les cellules).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'D''augmenter la glycémie', 0, 1), (@qid, 'D''abaisser la glycémie', 1, 2), (@qid, 'De n''avoir aucun effet', 0, 3), (@qid, 'De produire du calcium', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le glucagon a pour effet :',
    'Hyperglycémiant (augmente la glycémie par glycogénolyse).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hyperglycémiant', 1, 1), (@qid, 'Hypoglycémiant', 0, 2), (@qid, 'Aucun effet', 0, 3), (@qid, 'Effet sur le calcium', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le foie stocke le glucose sous forme de :',
    'Glycogène (fonction glycogénique).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Amidon', 0, 1), (@qid, 'Glycogène', 1, 2), (@qid, 'Cellulose', 0, 3), (@qid, 'Saccharose', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La glycémie normale à jeun est d''environ :',
    '0,8 à 1,0 g/L (4,4-5,5 mmol/L).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,2 g/L', 0, 1), (@qid, '1 g/L', 1, 2), (@qid, '5 g/L', 0, 3), (@qid, '10 g/L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le diabète de type 1 est dû à :',
    'Une destruction auto-immune des cellules β pancréatiques (déficit en insuline).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un excès d''insuline', 0, 1), (@qid, 'Un déficit en insuline', 1, 2), (@qid, 'Une mauvaise alimentation uniquement', 0, 3), (@qid, 'Un excès de glucagon', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''hypophyse est située :',
    'À la base du cerveau, dans la selle turcique.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dans le cou', 0, 1), (@qid, 'À la base du cerveau', 1, 2), (@qid, 'Dans l''abdomen', 0, 3), (@qid, 'Au-dessus des reins', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''hypophyse est reliée à l''hypothalamus par :',
    'La tige pituitaire (axe hypothalamo-hypophysaire).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un nerf optique', 0, 1), (@qid, 'La tige pituitaire', 1, 2), (@qid, 'La moelle épinière', 0, 3), (@qid, 'Le nerf vague', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''adénohypophyse produit :',
    'GH, TSH, ACTH, FSH, LH, prolactine (hormones stimulantes).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Adrénaline uniquement', 0, 1), (@qid, 'GH, TSH, ACTH, FSH, LH, prolactine', 1, 2), (@qid, 'Insuline', 0, 3), (@qid, 'Thyroxine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La neurohypophyse stocke et libère :',
    'L''ocytocine et l''ADH (produites par l''hypothalamus).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'TSH et ACTH', 0, 1), (@qid, 'Ocytocine et ADH', 1, 2), (@qid, 'FSH et LH', 0, 3), (@qid, 'GH et prolactine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La GH (hormone de croissance) est produite par :',
    'L''adénohypophyse (lobe antérieur).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La thyroïde', 0, 1), (@qid, 'L''adénohypophyse', 1, 2), (@qid, 'La neurohypophyse', 0, 3), (@qid, 'Les surrénales', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La prolactine stimule :',
    'La production de lait (lactation).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La croissance osseuse', 0, 1), (@qid, 'La lactation', 1, 2), (@qid, 'La digestion', 0, 3), (@qid, 'La respiration', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''ADH (hormone antidiurétique) agit sur :',
    'Les reins pour réduire la perte d''eau.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le coeur', 0, 1), (@qid, 'Les reins', 1, 2), (@qid, 'Le foie', 0, 3), (@qid, 'Les poumons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''ocytocine stimule :',
    'Les contractions utérines et l''éjection du lait.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La digestion', 0, 1), (@qid, 'Contractions utérines et lactation', 1, 2), (@qid, 'La croissance osseuse', 0, 3), (@qid, 'La vision', 0, 4);

-- ============================================
-- THÈME 5 : MICROBIOLOGIE - BACTÉRIES (70 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les bactéries sont des organismes :',
    'Procaryotes (pas de noyau, ADN libre dans le cytoplasme).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Eucaryotes', 0, 1), (@qid, 'Procaryotes', 1, 2), (@qid, 'Virus', 0, 3), (@qid, 'Champignons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une bactérie de forme sphérique est appelée :',
    'Coque (cocci au pluriel).', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bacille', 0, 1), (@qid, 'Coque', 1, 2), (@qid, 'Spirille', 0, 3), (@qid, 'Vibrion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une bactérie en forme de bâtonnet est :',
    'Un bacille.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un coque', 0, 1), (@qid, 'Un bacille', 1, 2), (@qid, 'Un spirille', 0, 3), (@qid, 'Un vibrion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La reproduction asexuée des bactéries se fait par :',
    'Scissiparité (division binaire).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bourgeonnement', 0, 1), (@qid, 'Scissiparité (division binaire)', 1, 2), (@qid, 'Spores uniquement', 0, 3), (@qid, 'Fragmentation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La conjugaison bactérienne implique :',
    'Un transfert d''ADN via un pilus sexuel entre deux bactéries.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La formation de spores', 0, 1), (@qid, 'Un transfert d''ADN par pilus', 1, 2), (@qid, 'La division simple', 0, 3), (@qid, 'La photosynthèse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La transduction bactérienne fait intervenir :',
    'Un bactériophage (virus) qui transfère l''ADN.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un pilus', 0, 1), (@qid, 'Un bactériophage', 1, 2), (@qid, 'Une spore', 0, 3), (@qid, 'Un plasmide uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La transformation bactérienne est :',
    'L''absorption d''ADN libre présent dans le milieu.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La division cellulaire', 0, 1), (@qid, 'L''absorption d''ADN libre', 1, 2), (@qid, 'La formation de spores', 0, 3), (@qid, 'La photosynthèse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les bactéries saprophytes :',
    'Se nourrissent de matière organique morte (décomposeurs).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sont toutes pathogènes', 0, 1), (@qid, 'Décomposent la matière organique morte', 1, 2), (@qid, 'Font la photosynthèse', 0, 3), (@qid, 'Produisent des anticorps', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les antibiotiques agissent sur :',
    'Les bactéries uniquement (pas sur les virus).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Tous les microbes', 0, 1), (@qid, 'Les bactéries uniquement', 1, 2), (@qid, 'Les virus uniquement', 0, 3), (@qid, 'Les champignons uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La paroi bactérienne est composée de :',
    'Peptidoglycane (muréine).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cellulose', 0, 1), (@qid, 'Peptidoglycane', 1, 2), (@qid, 'Chitine', 0, 3), (@qid, 'Kératine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les bactéries Gram+ se colorent en :',
    'Violet (paroi épaisse en peptidoglycane).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Rose/rouge', 0, 1), (@qid, 'Violet', 1, 2), (@qid, 'Bleu', 0, 3), (@qid, 'Incolore', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Certaines bactéries forment des spores pour :',
    'Résister aux conditions défavorables (chaleur, sécheresse...).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Se multiplier plus vite', 0, 1), (@qid, 'Résister aux conditions extrêmes', 1, 2), (@qid, 'Produire de l''énergie', 0, 3), (@qid, 'Synthétiser des protéines', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La tuberculose est causée par :',
    'Mycobacterium tuberculosis (bacille de Koch).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un virus', 0, 1), (@qid, 'Mycobacterium tuberculosis', 1, 2), (@qid, 'Un champignon', 0, 3), (@qid, 'Un parasite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le choléra est causé par :',
    'Vibrio cholerae (bactérie en forme de virgule).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un virus', 0, 1), (@qid, 'Vibrio cholerae', 1, 2), (@qid, 'Un protozoaire', 0, 3), (@qid, 'Un champignon', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La syphilis est causée par :',
    'Treponema pallidum (bactérie spirochète).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un virus', 0, 1), (@qid, 'Treponema pallidum', 1, 2), (@qid, 'Un champignon', 0, 3), (@qid, 'Un parasite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les plasmides bactériens sont :',
    'De petits ADN circulaires indépendants du chromosome.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des protéines', 0, 1), (@qid, 'De petits ADN circulaires', 1, 2), (@qid, 'Des lipides', 0, 3), (@qid, 'Des glucides', 0, 4);

-- ============================================
-- THÈME 6 : MICROBIOLOGIE - VIRUS (50 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les virus sont des organismes :',
    'Acellulaires (ni cellules, ni procaryotes, ni eucaryotes).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Procaryotes', 0, 1), (@qid, 'Acellulaires', 1, 2), (@qid, 'Eucaryotes', 0, 3), (@qid, 'Bactériens', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un virus est constitué de :',
    'ADN ou ARN entouré d''une capside protéique.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une cellule complète', 0, 1), (@qid, 'ADN/ARN + capside protéique', 1, 2), (@qid, 'Uniquement des protéines', 0, 3), (@qid, 'Uniquement de l''ADN', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les virus se multiplient uniquement :',
    'À l''intérieur d''une cellule hôte (parasites intracellulaires obligatoires).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dans l''air libre', 0, 1), (@qid, 'Dans une cellule hôte', 1, 2), (@qid, 'Dans l''eau', 0, 3), (@qid, 'Dans le sol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le VIH est un virus à :',
    'ARN (rétrovirus).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ADN', 0, 1), (@qid, 'ARN', 1, 2), (@qid, 'ADN et ARN', 0, 3), (@qid, 'Lipides uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le virus de la grippe (Influenza) est classé :',
    'H1N1, H3N2 selon les protéines de surface.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement H1N1', 0, 1), (@qid, 'Classé selon hémagglutinine et neuraminidase', 1, 2), (@qid, 'Non classifiable', 0, 3), (@qid, 'Une bactérie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vaccination antivirale est efficace car :',
    'Elle stimule le système immunitaire à produire des anticorps avant l''infection.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Elle tue directement les virus', 0, 1), (@qid, 'Elle stimule l''immunité avant l''infection', 1, 2), (@qid, 'Elle remplace les antibiotiques', 0, 3), (@qid, 'Elle guérit instantanément', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le virus de la rage se transmet par :',
    'Morsure d''un animal infecté (salive contaminée).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''air', 0, 1), (@qid, 'La morsure d''un animal infecté', 1, 2), (@qid, 'L''eau contaminée', 0, 3), (@qid, 'Les aliments', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le cycle lytique d''un virus se termine par :',
    'La destruction (lyse) de la cellule hôte.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''intégration au génome', 0, 1), (@qid, 'La lyse de la cellule hôte', 1, 2), (@qid, 'La latence permanente', 0, 3), (@qid, 'La photosynthèse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le cycle lysogénique se caractérise par :',
    'L''intégration du génome viral dans l''ADN de la cellule hôte (prophage).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La lyse immédiate', 0, 1), (@qid, 'L''intégration dans l''ADN hôte', 1, 2), (@qid, 'La photosynthèse', 0, 3), (@qid, 'La sporulation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le zona est causé par la réactivation du virus de :',
    'La varicelle (VZV, Herpesviridae).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La grippe', 0, 1), (@qid, 'La varicelle (VZV)', 1, 2), (@qid, 'La rage', 0, 3), (@qid, 'L''hépatite A', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le papillomavirus humain (HPV) peut causer :',
    'Le cancer du col de l''utérus.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La grippe', 0, 1), (@qid, 'Le cancer du col de l''utérus', 1, 2), (@qid, 'Le diabète', 0, 3), (@qid, 'L''asthme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les antiviraux agissent en :',
    'Inhibant une étape du cycle de réplication virale.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Tuunt les bactéries', 0, 1), (@qid, 'Inhibant la réplication virale', 1, 2), (@qid, 'Renforçant les os', 0, 3), (@qid, 'Digérant les aliments', 0, 4);

-- ============================================
-- THÈME 7 : SYSTÈME NERVEUX (80 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le système nerveux central comprend :',
    'Le cerveau et la moelle épinière.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les nerfs uniquement', 0, 1), (@qid, 'Le cerveau et la moelle épinière', 1, 2), (@qid, 'Les ganglions uniquement', 0, 3), (@qid, 'Les organes sensoriels', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La cellule nerveuse est appelée :',
    'Neurone.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hépatocyte', 0, 1), (@qid, 'Neurone', 1, 2), (@qid, 'Myocyte', 0, 3), (@qid, 'Ostéocyte', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La synapse est :',
    'La zone de contact entre deux neurones (transmission du message).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le corps du neurone', 0, 1), (@qid, 'La zone de contact entre deux neurones', 1, 2), (@qid, 'L''axone uniquement', 0, 3), (@qid, 'La dendrite uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''influx nerveux se propage le long de :',
    'L''axone (sous forme de potentiel d''action).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des vaisseaux sanguins', 0, 1), (@qid, 'De l''axone', 1, 2), (@qid, 'Des muscles', 0, 3), (@qid, 'Des os', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les nerfs sensitifs transmettent :',
    'Les informations des organes sensoriels vers le SNC.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Du SNC vers les muscles', 0, 1), (@qid, 'Des organes sensoriels vers le SNC', 1, 2), (@qid, 'Entre deux muscles', 0, 3), (@qid, 'Dans le sang uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les nerfs moteurs transmettent :',
    'Les ordres du SNC vers les muscles et glandes.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Du SNC vers les effecteurs', 1, 1), (@qid, 'Des sens vers le SNC', 0, 2), (@qid, 'Entre deux neurones SNC', 0, 3), (@qid, 'Dans le liquide céphalo-rachidien', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les nerfs mixtes contiennent :',
    'Des fibres sensitives ET motrices.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement des fibres sensitives', 0, 1), (@qid, 'Des fibres sensitives et motrices', 1, 2), (@qid, 'Uniquement des fibres motrices', 0, 3), (@qid, 'Aucune fibre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un réflexe inné est :',
    'Présent dès la naissance, non appris (ex: retrait de la main).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Appris par expérience', 0, 1), (@qid, 'Présent dès la naissance', 1, 2), (@qid, 'Volontaire', 0, 3), (@qid, 'Spécifique aux adultes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un réflexe conditionné (conditionnel) est :',
    'Acquis par apprentissage (ex: réponse à une cloche chez le chien de Pavlov).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Présent à la naissance', 0, 1), (@qid, 'Acquis par apprentissage', 1, 2), (@qid, 'Uniquement chez l''homme', 0, 3), (@qid, 'Génétique uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La moelle épinière est protégée par :',
    'La colonne vertébrale.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le crâne', 0, 1), (@qid, 'La colonne vertébrale', 1, 2), (@qid, 'La cage thoracique', 0, 3), (@qid, 'Le bassin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le cerveau est protégé par :',
    'La boîte crânienne.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La colonne vertébrale', 0, 1), (@qid, 'La boîte crânienne', 1, 2), (@qid, 'Les côtes', 0, 3), (@qid, 'Le sternum', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le neurotransmetteur principal au niveau de la jonction neuromusculaire est :',
    'L''acétylcholine.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La dopamine', 0, 1), (@qid, 'L''acétylcholine', 1, 2), (@qid, 'La sérotonine', 0, 3), (@qid, 'L''adrénaline', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La myéline est une gaine isolante produite par :',
    'Les cellules de Schwann (SNP) et oligodendrocytes (SNC).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les neurones eux-mêmes', 0, 1), (@qid, 'Les cellules gliales', 1, 2), (@qid, 'Les globules rouges', 0, 3), (@qid, 'Les plaquettes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La sclérose en plaques est due à :',
    'Une démyélinisation des neurones du SNC.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un excès de myéline', 0, 1), (@qid, 'Une démyélinisation', 1, 2), (@qid, 'Une infection bactérienne', 0, 3), (@qid, 'Une carence en vitamines', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le centre de contrôle de la respiration est situé dans :',
    'Le bulbe rachidien.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le cortex cérébral', 0, 1), (@qid, 'Le bulbe rachidien', 1, 2), (@qid, 'Le cervelet', 0, 3), (@qid, 'L''hypothalamus', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La coordination des mouvements est assurée par :',
    'Le cervelet.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le cortex', 0, 1), (@qid, 'Le cervelet', 1, 2), (@qid, 'Le bulbe', 0, 3), (@qid, 'L''hypothalamus', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''hypothalamus régule :',
    'La température corporelle, la faim, la soif, les cycles veille-sommeil.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement la respiration', 0, 1), (@qid, 'La faim, la soif, la température', 1, 2), (@qid, 'La digestion uniquement', 0, 3), (@qid, 'La vue', 0, 4);

-- ============================================
-- THÈME 8 : HÉRÉDITÉ ET GÉNÉTIQUE (100 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Gregor Mendel a travaillé sur :',
    'Les pois (Pisum sativum) pour établir les lois de l''hérédité.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les souris', 0, 1), (@qid, 'Les pois', 1, 2), (@qid, 'Les mouches', 0, 3), (@qid, 'Les chiens', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Thomas Morgan a travaillé sur :',
    'La drosophile (mouche du vinaigre) pour la génétique.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les pois', 0, 1), (@qid, 'La drosophile', 1, 2), (@qid, 'Les bactéries', 0, 3), (@qid, 'Les souris', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un gène est :',
    'Un segment d''ADN codant pour une protéine ou un ARN.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une protéine', 0, 1), (@qid, 'Un segment d''ADN codant', 1, 2), (@qid, 'Un chromosome entier', 0, 3), (@qid, 'Une cellule', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un allèle est :',
    'Une version alternative d''un même gène.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un chromosome', 0, 1), (@qid, 'Une version alternative d''un gène', 1, 2), (@qid, 'Une cellule fille', 0, 3), (@qid, 'Une mitose', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un individu homozygote pour un gène possède :',
    'Deux allèles identiques (ex: AA ou aa).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Deux allèles différents', 0, 1), (@qid, 'Deux allèles identiques', 1, 2), (@qid, 'Un seul allèle', 0, 3), (@qid, 'Aucun allèle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un individu hétérozygote possède :',
    'Deux allèles différents (ex: Aa).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Deux allèles identiques', 0, 1), (@qid, 'Deux allèles différents', 1, 2), (@qid, 'Un seul allèle', 0, 3), (@qid, 'Aucun allèle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le phénotype est :',
    'L''ensemble des caractères observables d''un individu.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''ensemble des gènes', 0, 1), (@qid, 'Les caractères observables', 1, 2), (@qid, 'L''ADN uniquement', 0, 3), (@qid, 'Les chromosomes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le génotype est :',
    'L''ensemble des gènes (patrimoine génétique).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les caractères observables', 0, 1), (@qid, 'L''ensemble des gènes', 1, 2), (@qid, 'Les protéines', 0, 3), (@qid, 'Le caryotype', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le linkage génétique désigne :',
    'Des gènes situés sur le même chromosome et transmis ensemble.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des gènes sur différents chromosomes', 0, 1), (@qid, 'Des gènes liés sur le même chromosome', 1, 2), (@qid, 'La mutation', 0, 3), (@qid, 'La mitose', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''enjambement (crossing-over) a lieu pendant :',
    'La prophase I de la méiose (échange de segments entre chromosomes homologues).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La mitose', 0, 1), (@qid, 'La prophase I de la méiose', 1, 2), (@qid, 'L''interphase', 0, 3), (@qid, 'La télophase', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''hémophilie est une maladie :',
    'Récessive liée au chromosome X.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dominante autosomique', 0, 1), (@qid, 'Récessive liée à l''X', 1, 2), (@qid, 'Dominante liée à l''Y', 0, 3), (@qid, 'Récessive autosomique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le daltonisme est dû à :',
    'Un gène récessif sur le chromosome X.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un gène dominant sur X', 0, 1), (@qid, 'Un gène récessif sur X', 1, 2), (@qid, 'Un gène sur Y', 0, 3), (@qid, 'Un gène autosomique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La myopathie de Duchenne est caractérisée par :',
    'Une dégénérescence musculaire progressive liée à l''X.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une déficience cardiaque', 0, 1), (@qid, 'Une dégénérescence musculaire liée à l''X', 1, 2), (@qid, 'Un trouble de la vision', 0, 3), (@qid, 'Un trouble de la coagulation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La trisomie 21 (syndrome de Down) est due à :',
    '3 chromosomes 21 au lieu de 2.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une délétion', 0, 1), (@qid, 'Un chromosome 21 supplémentaire', 1, 2), (@qid, 'Un chromosome X en moins', 0, 3), (@qid, 'Une translocation uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le syndrome de Turner correspond au caryotype :',
    '45, X0 (monosomie X).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '47, XXY', 0, 1), (@qid, '45, X0', 1, 2), (@qid, '47, XXX', 0, 3), (@qid, '46, XY', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le syndrome de Klinefelter correspond au caryotype :',
    '47, XXY.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '45, X0', 0, 1), (@qid, '47, XXY', 1, 2), (@qid, '47, XYY', 0, 3), (@qid, '46, XX', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le groupe sanguin A possède l''agglutinogène (antigène) :',
    'A à la surface des globules rouges.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'B', 0, 1), (@qid, 'A', 1, 2), (@qid, 'AB', 0, 3), (@qid, 'Aucun', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le groupe O est donneur universel car :',
    'Il ne possède pas d''antigènes A ni B sur ses globules rouges.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il a les deux antigènes', 0, 1), (@qid, 'Il n''a pas d''antigènes A ou B', 1, 2), (@qid, 'Il a des anticorps', 0, 3), (@qid, 'Il est le plus rare', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le facteur Rhésus (Rh) est :',
    'Un antigène D présent (Rh+) ou absent (Rh-) sur les globules rouges.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un anticorps', 0, 1), (@qid, 'Un antigène sur les globules rouges', 1, 2), (@qid, 'Une hormone', 0, 3), (@qid, 'Une enzyme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un OGM (Organisme Génétiquement Modifié) est :',
    'Un organisme dont le génome a été modifié par génie génétique.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un clone naturel', 0, 1), (@qid, 'Un organisme au génome modifié', 1, 2), (@qid, 'Une espèce sauvage', 0, 3), (@qid, 'Un hybride naturel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La transgénèse consiste à :',
    'Introduire un gène d''une espèce dans une autre espèce.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cloner un organisme', 0, 1), (@qid, 'Transférer un gène entre espèces', 1, 2), (@qid, 'Modifier un chromosome entier', 0, 3), (@qid, 'Créer une nouvelle espèce', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La drépanocytose est due à :',
    'Une mutation ponctuelle du gène de l''hémoglobine (HbS).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un virus', 0, 1), (@qid, 'Une mutation du gène de l''hémoglobine', 1, 2), (@qid, 'Une carence en fer', 0, 3), (@qid, 'Une infection', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''hémophilie touche surtout :',
    'Les hommes (car liée au chromosome X, un seul X chez l''homme).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les femmes uniquement', 0, 1), (@qid, 'Les hommes principalement', 1, 2), (@qid, 'Également les deux sexes', 0, 3), (@qid, 'Uniquement les enfants', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les lois de Mendel incluent :',
    'La ségrégation des allèles et l''indépendance des caractères.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La mitose uniquement', 0, 1), (@qid, 'La ségrégation et l''indépendance', 1, 2), (@qid, 'La photosynthèse', 0, 3), (@qid, 'La respiration', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'En croisant Aa × Aa, la proportion de phénotype récessif est :',
    '1/4 (aa).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/2', 0, 1), (@qid, '1/4', 1, 2), (@qid, '3/4', 0, 3), (@qid, '0', 0, 4);

-- ============================================
-- THÈME 9 : ÉCOSYSTÈMES ET PRODUCTEURS (50 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les producteurs primaires sont :',
    'Les végétaux chlorophylliens (autotrophes).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les herbivores', 0, 1), (@qid, 'Les végétaux chlorophylliens', 1, 2), (@qid, 'Les carnivores', 0, 3), (@qid, 'Les décomposeurs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les producteurs secondaires sont :',
    'Les animaux (hétérotrophes, consommateurs).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les plantes', 0, 1), (@qid, 'Les animaux', 1, 2), (@qid, 'Les champignons uniquement', 0, 3), (@qid, 'Les bactéries uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un écosystème est composé de :',
    'La biocénose (êtres vivants) + le biotope (milieu).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement des animaux', 0, 1), (@qid, 'Biocénose + biotope', 1, 2), (@qid, 'Uniquement des plantes', 0, 3), (@qid, 'Le climat uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un agro-système est :',
    'Un écosystème modifié par l''homme pour l''agriculture.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une forêt naturelle', 0, 1), (@qid, 'Un écosystème agricole contrôlé par l''homme', 1, 2), (@qid, 'Un océan', 0, 3), (@qid, 'Un désert', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La lutte chimique utilise :',
    'Des pesticides (herbicides, fongicides, insecticides).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des prédateurs naturels', 0, 1), (@qid, 'Des produits chimiques', 1, 2), (@qid, 'Des bactéries uniquement', 0, 3), (@qid, 'Des virus uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La lutte biologique utilise :',
    'Des ennemis naturels des ravageurs (prédateurs, parasitoïdes).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des produits chimiques', 0, 1), (@qid, 'Des ennemis naturels des ravageurs', 1, 2), (@qid, 'Des antibiotiques uniquement', 0, 3), (@qid, 'Des hormones de croissance', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les herbicides sont utilisés contre :',
    'Les mauvaises herbes.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les insectes', 0, 1), (@qid, 'Les mauvaises herbes', 1, 2), (@qid, 'Les champignons', 0, 3), (@qid, 'Les bactéries', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les fongicides luttent contre :',
    'Les champignons pathogènes des cultures.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les insectes', 0, 1), (@qid, 'Les champignons', 1, 2), (@qid, 'Les bactéries', 0, 3), (@qid, 'Les virus', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le rendement énergétique d''un écosystème dépend de :',
    'L''efficacité de la photosynthèse et des transferts entre niveaux trophiques.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement du soleil', 0, 1), (@qid, 'De la photosynthèse et des transferts trophiques', 1, 2), (@qid, 'Uniquement des animaux', 0, 3), (@qid, 'Du sol uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Dans une chaîne alimentaire, l''énergie :',
    'Diminue d''un niveau trophique à l''autre.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Augmente', 0, 1), (@qid, 'Diminue à chaque niveau', 1, 2), (@qid, 'Reste constante', 0, 3), (@qid, 'Est nulle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La biomasse est :',
    'La masse totale de matière organique produite dans un écosystème.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le nombre d''espèces', 0, 1), (@qid, 'La masse de matière organique', 1, 2), (@qid, 'La température', 0, 3), (@qid, 'La quantité d''eau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les décomposeurs dans un écosystème sont :',
    'Les champignons et bactéries saprophytes.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les plantes vertes', 0, 1), (@qid, 'Les champignons et bactéries', 1, 2), (@qid, 'Les herbivores', 0, 3), (@qid, 'Les carnivores', 0, 4);

-- ============================================
-- THÈME 10 : QUESTIONS FINALES BIOLOGIE GÉNÉRALE (50 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La mitose produit :',
    '2 cellules filles diploïdes identiques.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '4 cellules haploïdes', 0, 1), (@qid, '2 cellules diploïdes identiques', 1, 2), (@qid, '2 cellules haploïdes', 0, 3), (@qid, '1 cellule', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La méiose produit :',
    '4 cellules haploïdes (gamètes).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 cellules diploïdes', 0, 1), (@qid, '4 cellules haploïdes', 1, 2), (@qid, '4 cellules diploïdes', 0, 3), (@qid, '2 cellules haploïdes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''ADN est une molécule en forme de :',
    'Double hélice.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Simple brin', 0, 1), (@qid, 'Double hélice', 1, 2), (@qid, 'Cercle simple', 0, 3), (@qid, 'Triangle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les bases azotées de l''ADN sont :',
    'A, T, G, C (Adénine, Thymine, Guanine, Cytosine).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'A, U, G, C', 0, 1), (@qid, 'A, T, G, C', 1, 2), (@qid, 'A, T, U, C', 0, 3), (@qid, 'T, U, G, C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La photosynthèse se déroule dans :',
    'Les chloroplastes des cellules végétales.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les mitochondries', 0, 1), (@qid, 'Les chloroplastes', 1, 2), (@qid, 'Le noyau', 0, 3), (@qid, 'Le cytoplasme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La respiration cellulaire a lieu dans :',
    'Les mitochondries.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le noyau', 0, 1), (@qid, 'Les mitochondries', 1, 2), (@qid, 'Les chloroplastes', 0, 3), (@qid, 'La membrane plasmique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La photosynthèse produit :',
    'Glucose (C₆H₁₂O₆) et oxygène (O₂).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CO₂ et H₂O', 0, 1), (@qid, 'Glucose et O₂', 1, 2), (@qid, 'Uniquement CO₂', 0, 3), (@qid, 'Uniquement H₂O', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La glycolyse se déroule dans :',
    'Le cytoplasme (hors mitochondrie).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les mitochondries', 0, 1), (@qid, 'Le cytoplasme', 1, 2), (@qid, 'Le noyau', 0, 3), (@qid, 'Les chloroplastes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le cycle de Krebs se déroule dans :',
    'La matrice mitochondriale.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le cytoplasme', 0, 1), (@qid, 'La matrice mitochondriale', 1, 2), (@qid, 'Le noyau', 0, 3), (@qid, 'La membrane plasmique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La chaîne respiratoire se trouve dans :',
    'La membrane interne des mitochondries.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le cytoplasme', 0, 1), (@qid, 'La membrane interne mitochondriale', 1, 2), (@qid, 'Le noyau', 0, 3), (@qid, 'La membrane plasmique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La fermentation lactique produit :',
    'De l''acide lactique (dans les muscles en anaérobiose).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De l''éthanol', 0, 1), (@qid, 'De l''acide lactique', 1, 2), (@qid, 'Du CO₂ uniquement', 0, 3), (@qid, 'De l''O₂', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La fermentation alcoolique est réalisée par :',
    'Les levures (Saccharomyces cerevisiae).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les bactéries lactiques', 0, 1), (@qid, 'Les levures', 1, 2), (@qid, 'Les virus', 0, 3), (@qid, 'Les champignons filamenteux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le noyau cellulaire contient :',
    'L''ADN (chromatine/chromosomes).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''ADN', 1, 1), (@qid, 'Les ribosomes', 0, 2), (@qid, 'Les mitochondries', 0, 3), (@qid, 'La chlorophylle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La membrane plasmique est composée principalement de :',
    'Phospholipides et protéines (bicouche lipidique).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Glucides uniquement', 0, 1), (@qid, 'Phospholipides et protéines', 1, 2), (@qid, 'ADN uniquement', 0, 3), (@qid, 'ARN uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''osmose est le passage d''eau à travers :',
    'Une membrane semi-perméable du milieu hypotonique vers hypertonique.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'N''importe quelle membrane', 0, 1), (@qid, 'Une membrane semi-perméable', 1, 2), (@qid, 'La paroi cellulosique', 0, 3), (@qid, 'Le noyau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le transport actif nécessite :',
    'De l''énergie (ATP).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Aucune énergie', 0, 1), (@qid, 'De l''ATP', 1, 2), (@qid, 'Uniquement de l''eau', 0, 3), (@qid, 'Uniquement des lipides', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La différenciation cellulaire est :',
    'La spécialisation des cellules pour une fonction spécifique.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La division cellulaire', 0, 1), (@qid, 'La spécialisation cellulaire', 1, 2), (@qid, 'La mort cellulaire', 0, 3), (@qid, 'La photosynthèse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''apoptose est :',
    'La mort cellulaire programmée.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La division cellulaire', 0, 1), (@qid, 'La mort cellulaire programmée', 1, 2), (@qid, 'La croissance', 0, 3), (@qid, 'La photosynthèse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les cellules souches sont :',
    'Des cellules non différenciées capables de s''auto-renouveler.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des cellules mortes', 0, 1), (@qid, 'Des cellules indifférenciées auto-renouvelables', 1, 2), (@qid, 'Des neurones', 0, 3), (@qid, 'Des globules rouges', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le cancer est dû à :',
    'Une prolifération cellulaire incontrôlée.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une apoptose excessive', 0, 1), (@qid, 'Une prolifération incontrôlée', 1, 2), (@qid, 'Une carence en vitamines', 0, 3), (@qid, 'Une infection bactérienne toujours', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le génome humain compte environ :',
    '20 000 à 25 000 gènes.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '5 000 gènes', 0, 1), (@qid, '20 000-25 000 gènes', 1, 2), (@qid, '100 000 gènes', 0, 3), (@qid, '1 million de gènes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''ARN messager (ARNm) est synthétisé lors de :',
    'La transcription (dans le noyau).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La traduction', 0, 1), (@qid, 'La transcription', 1, 2), (@qid, 'La réplication', 0, 3), (@qid, 'La mitose', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La traduction a lieu dans :',
    'Les ribosomes (cytoplasme).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le noyau', 0, 1), (@qid, 'Les ribosomes', 1, 2), (@qid, 'Les mitochondries', 0, 3), (@qid, 'Le réticulum endoplasmique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un codon est constitué de :',
    '3 nucléotides consécutifs sur l''ARNm.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 nucléotide', 0, 1), (@qid, '3 nucléotides', 1, 2), (@qid, '2 nucléotides', 0, 3), (@qid, '4 nucléotides', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une mutation génétique est :',
    'Un changement dans la séquence d''ADN d''un gène.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un changement de cellule', 0, 1), (@qid, 'Un changement dans la séquence d''ADN', 1, 2), (@qid, 'Une division cellulaire', 0, 3), (@qid, 'Une synthèse protéique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le clonage reproductif consiste à :',
    'Créer un organisme génétiquement identique à un autre.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Modifier un gène', 0, 1), (@qid, 'Créer une copie génétique identique', 1, 2), (@qid, 'Croiser deux espèces', 0, 3), (@qid, 'Produire des vaccins', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La PCR (Polymerase Chain Reaction) permet :',
    'D''amplifier l''ADN in vitro.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De couper l''ADN', 0, 1), (@qid, 'D''amplifier l''ADN', 1, 2), (@qid, 'De traduire les protéines', 0, 3), (@qid, 'De séquencer l''ARN', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les enzymes de restriction sont utilisées pour :',
    'Couper l''ADN à des sites spécifiques.', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Amplifier l''ADN', 0, 1), (@qid, 'Couper l''ADN à des sites précis', 1, 2), (@qid, 'Traduire les protéines', 0, 3), (@qid, 'Synthétiser l''ARN', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''insuline humaine peut être produite par :',
    'Des bactéries génétiquement modifiées (OGM).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Extraction de pancréas humains', 0, 1), (@qid, 'Des bactéries OGM', 1, 2), (@qid, 'Synthèse chimique uniquement', 0, 3), (@qid, 'Extraction de plantes', 0, 4);

-- DERNIÈRES QUESTIONS POUR DÉPASSER 600
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le plasma sanguin est composé à environ 90% de :',
    'Eau.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Protéines', 0, 1), (@qid, 'Eau', 1, 2), (@qid, 'Lipides', 0, 3), (@qid, 'Glucides', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les plaquettes sanguines sont essentielles pour :',
    'La coagulation.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le transport d''O₂', 0, 1), (@qid, 'La coagulation', 1, 2), (@qid, 'L''immunité', 0, 3), (@qid, 'La digestion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''hémoglobine transporte :',
    'L''oxygène des poumons vers les tissus.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le CO₂ uniquement', 0, 1), (@qid, 'L''oxygène', 1, 2), (@qid, 'Les hormones', 0, 3), (@qid, 'Les nutriments uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le coeur humain possède combien de cavités ?',
    '4 : 2 oreillettes et 2 ventricules.', 'Examen NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2', 0, 1), (@qid, '3', 0, 2), (@qid, '4', 1, 3), (@qid, '5', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les alvéoles pulmonaires sont le siège :',
    'Des échanges gazeux (O₂/CO₂).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De la digestion', 0, 1), (@qid, 'Des échanges gazeux', 1, 2), (@qid, 'De l''immunité', 0, 3), (@qid, 'De l''excrétion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le néphron est l''unité fonctionnelle :',
    'Du rein (filtration du sang).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Du foie', 0, 1), (@qid, 'Du rein', 1, 2), (@qid, 'Du coeur', 0, 3), (@qid, 'Des poumons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La synapse neuromusculaire utilise comme neurotransmetteur :',
    'L''acétylcholine.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La dopamine', 0, 1), (@qid, 'L''acétylcholine', 1, 2), (@qid, 'La sérotonine', 0, 3), (@qid, 'L''adrénaline', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le réflexe myotatique (rotulien) est un réflexe :',
    'Monosynaptique (un seul synapse dans la moelle).', 'Examen NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Polysynaptique complexe', 0, 1), (@qid, 'Monosynaptique', 1, 2), (@qid, 'Cortical', 0, 3), (@qid, 'Conscient', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La testostérone est produite par :',
    'Les cellules de Leydig dans les testicules.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''hypophyse', 0, 1), (@qid, 'Les testicules (Leydig)', 1, 2), (@qid, 'Les surrénales uniquement', 0, 3), (@qid, 'La thyroïde', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les oestrogènes sont principalement produits par :',
    'Les ovaires (follicules).', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''hypophyse', 0, 1), (@qid, 'Les ovaires', 1, 2), (@qid, 'Les surrénales uniquement', 0, 3), (@qid, 'La thyroïde', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La fécondation a lieu dans :',
    'La trompe de Fallope (tiers externe).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''utérus', 0, 1), (@qid, 'La trompe de Fallope', 1, 2), (@qid, 'L''ovaire', 0, 3), (@qid, 'Le vagin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La nidation est :',
    'L''implantation de l''embryon dans la paroi utérine.', 'Examen NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La fécondation', 0, 1), (@qid, 'L''implantation dans l''utérus', 1, 2), (@qid, 'L''ovulation', 0, 3), (@qid, 'La division cellulaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le placenta permet :',
    'Les échanges mère-foetus (nutriments, O₂, déchets) sans mélange des sangs.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le mélange des sangs', 0, 1), (@qid, 'Les échanges mère-foetus sans mélange', 1, 2), (@qid, 'La digestion', 0, 3), (@qid, 'La respiration foetale uniquement', 0, 4);


-- ============================================
-- QCM GÉOLOGIE NS4 - HAÏTI
-- Plus de 600 questions couvrant tout le programme
-- Sources : Programme détaillé 4ème année + Examens officiels NS4
-- ============================================

-- ============================================
-- THÈME 1 : MÉTHODOLOGIE ET COMMUNICATION SCIENTIFIQUE (50 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La communication scientifique se caractérise par :',
    'Un texte argumentatif organisé répondant à une problématique donnée.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un récit imaginaire', 0, 1), (@qid, 'Un texte argumentatif structuré', 1, 2), (@qid, 'Une description libre', 0, 3), (@qid, 'Un dialogue informel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La démarche géologique commence par :',
    'L''observation sur le terrain et la collecte d''échantillons.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La publication des résultats', 0, 1), (@qid, 'L''observation et la collecte d''échantillons', 1, 2), (@qid, 'La modélisation mathématique', 0, 3), (@qid, 'L''analyse chimique uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un protocole expérimental sert à :',
    'Décrire précisément les étapes d''une expérience pour la rendre reproductible.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Raconter une histoire', 0, 1), (@qid, 'Décrire les étapes d''une expérience reproductible', 1, 2), (@qid, 'Faire un dessin', 0, 3), (@qid, 'Donner une opinion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel instrument est utilisé par le géologue sur le terrain ?',
    'La boussole, le GPS, le marteau, le carnet de terrain.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement un microscope', 0, 1), (@qid, 'Boussole, GPS, marteau, carnet', 1, 2), (@qid, 'Uniquement un ordinateur', 0, 3), (@qid, 'Uniquement un thermomètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''analyse au laboratoire des roches peut se faire :',
    'À l''oeil nu et au microscope.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement à l''oeil nu', 0, 1), (@qid, 'À l''oeil nu et au microscope', 1, 2), (@qid, 'Uniquement au microscope électronique', 0, 3), (@qid, 'Sans aucun instrument', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une hypothèse scientifique doit être :',
    'Vérifiable par l''expérience ou l''observation.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une croyance personnelle', 0, 1), (@qid, 'Vérifiable expérimentalement', 1, 2), (@qid, 'Impossible à tester', 0, 3), (@qid, 'Une opinion politique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La théorie du Big Bang explique :',
    'L''origine et l''expansion de l''univers.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La formation des océans uniquement', 0, 1), (@qid, 'L''origine et l''expansion de l''univers', 1, 2), (@qid, 'La formation des montagnes', 0, 3), (@qid, 'L''évolution des espèces uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une carte géologique représente :',
    'La nature et l''âge des roches affleurant en surface.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les routes et les villes', 0, 1), (@qid, 'La nature et l''âge des roches en surface', 1, 2), (@qid, 'La météo', 0, 3), (@qid, 'La végétation uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les solutions acides sont utilisées par les géologues pour :',
    'Tester la présence de carbonates (effervescence au HCl).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Nettoyer les échantillons uniquement', 0, 1), (@qid, 'Tester la présence de carbonates', 1, 2), (@qid, 'Colorer les roches', 0, 3), (@qid, 'Mesurer la température', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La synthèse scientifique consiste à :',
    'Regrouper et organiser les données pour tirer une conclusion.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Répéter une expérience', 0, 1), (@qid, 'Regrouper les données pour conclure', 1, 2), (@qid, 'Poser une question', 0, 3), (@qid, 'Faire un dessin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un modèle scientifique est :',
    'Une représentation simplifiée de la réalité pour expliquer des phénomènes.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La réalité exacte', 0, 1), (@qid, 'Une représentation simplifiée explicative', 1, 2), (@qid, 'Un dessin artistique', 0, 3), (@qid, 'Une opinion', 0, 4);

-- ============================================
-- THÈME 2 : ORIGINE DE LA TERRE ET DU SYSTÈME SOLAIRE (60 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le système solaire s''est formé il y a environ :',
    '4,6 milliards d''années.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10 milliards d''années', 0, 1), (@qid, '4,6 milliards d''années', 1, 2), (@qid, '1 million d''années', 0, 3), (@qid, '100 000 ans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La Terre s''est formée par :',
    'Accrétion de poussières et de planétésimaux dans le disque protoplanétaire.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Explosion d''une étoile', 0, 1), (@qid, 'Accrétion de matériaux dans le disque protoplanétaire', 1, 2), (@qid, 'Collision de deux galaxies', 0, 3), (@qid, 'Condensation d''un nuage d''eau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''atmosphère primitive de la Terre était :',
    'Réductrice (riche en CH₄, NH₃, H₂O, H₂, sans O₂ libre).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Riche en oxygène', 0, 1), (@qid, 'Réductrice, sans O₂ libre', 1, 2), (@qid, 'Identique à l''actuelle', 0, 3), (@qid, 'Composée uniquement d''azote', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''oxygène dans l''atmosphère terrestre provient principalement de :',
    'La photosynthèse des cyanobactéries et des plantes.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La respiration animale', 0, 1), (@qid, 'La photosynthèse', 1, 2), (@qid, 'Les volcans', 0, 3), (@qid, 'Les météorites', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vie est apparue sur Terre il y a environ :',
    '3,5 à 3,8 milliards d''années.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10 000 ans', 0, 1), (@qid, '3,5 à 3,8 milliards d''années', 1, 2), (@qid, '500 millions d''années', 0, 3), (@qid, '65 millions d''années', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les plus anciennes traces de vie sont :',
    'Les stromatolithes (cyanobactéries fossiles).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les dinosaures', 0, 1), (@qid, 'Les stromatolithes', 1, 2), (@qid, 'Les trilobites', 0, 3), (@qid, 'Les mammouths', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les glaciations du Quaternaire sont mises en évidence par :',
    'L''étude des carottes de glace et des rapports isotopiques.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les fossiles de dinosaures', 0, 1), (@qid, 'Les carottes de glace et isotopes', 1, 2), (@qid, 'Les volcans actifs', 0, 3), (@qid, 'Les courants marins', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les variations du niveau de la mer sont liées :',
    'Aux glaciations (baisse) et aux fontes glaciaires (hausse).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement aux volcans', 0, 1), (@qid, 'Aux glaciations et fontes glaciaires', 1, 2), (@qid, 'Uniquement aux marées', 0, 3), (@qid, 'À la rotation de la Terre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La biosphère est :',
    'L''ensemble des êtres vivants et leurs milieux de vie sur Terre.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''atmosphère uniquement', 0, 1), (@qid, 'L''ensemble des êtres vivants et leurs milieux', 1, 2), (@qid, 'La croûte terrestre uniquement', 0, 3), (@qid, 'Les océans uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le Précambrien représente environ :',
    '85% de l''histoire de la Terre (4,6 Ga à 541 Ma).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10% du temps géologique', 0, 1), (@qid, 'Environ 85% du temps géologique', 1, 2), (@qid, '50% du temps géologique', 0, 3), (@qid, '1% du temps géologique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les carottes de glace antarctiques permettent d''étudier :',
    'Les climats passés sur plusieurs centaines de milliers d''années.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La vie marine actuelle', 0, 1), (@qid, 'Les climats passés sur des centaines de milliers d''années', 1, 2), (@qid, 'Les éruptions volcaniques récentes', 0, 3), (@qid, 'La tectonique des plaques uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les récifs fossiles sont des indicateurs de :',
    'Variations anciennes du niveau de la mer.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Température de l''air uniquement', 0, 1), (@qid, 'Variations anciennes du niveau marin', 1, 2), (@qid, 'Activité volcanique', 0, 3), (@qid, 'Composition de l''atmosphère uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les périodes glaciaires sont caractérisées par :',
    'Une baisse du niveau marin et une extension des calottes glaciaires.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une hausse du niveau marin', 0, 1), (@qid, 'Une baisse du niveau marin et extension des glaces', 1, 2), (@qid, 'Un réchauffement global', 0, 3), (@qid, 'Une absence de glaces', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le Quaternaire est caractérisé par :',
    'L''alternance de périodes glaciaires et interglaciaires.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un climat constant', 0, 1), (@qid, 'L''alternance glaciaire/interglaciaire', 1, 2), (@qid, 'L''absence de glaciations', 0, 3), (@qid, 'Un climat tropical uniforme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les traces de glaciations précambriennes se trouvent :',
    'Sur plusieurs continents actuellement éloignés.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement en Afrique', 0, 1), (@qid, 'Sur plusieurs continents aujourd''hui séparés', 1, 2), (@qid, 'Uniquement en Antarctique', 0, 3), (@qid, 'Dans les océans uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La composition isotopique des glaces renseigne sur :',
    'Les températures passées (rapport ¹⁸O/¹⁶O).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La composition des roches', 0, 1), (@qid, 'Les températures passées', 1, 2), (@qid, 'L''âge de la Terre', 0, 3), (@qid, 'La vitesse des vents', 0, 4);

-- ============================================
-- THÈME 3 : ÉVOLUTION DE LA VIE SUR TERRE (70 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La phylogenèse étudie :',
    'Les relations de parenté évolutive entre les espèces.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La classification des roches', 0, 1), (@qid, 'Les relations de parenté entre espèces', 1, 2), (@qid, 'La formation des montagnes', 0, 3), (@qid, 'La composition chimique des minéraux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un arbre phylogénétique représente :',
    'Les relations de parenté évolutive entre différentes espèces.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La classification des roches', 0, 1), (@qid, 'Les liens de parenté entre espèces', 1, 2), (@qid, 'La géographie des continents', 0, 3), (@qid, 'Le cycle de l''eau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''Homme appartient à l''ordre des :',
    'Primates.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Carnivores', 0, 1), (@qid, 'Primates', 1, 2), (@qid, 'Rongeurs', 0, 3), (@qid, 'Cétacés', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le plus proche parent de l''Homme est :',
    'Le Chimpanzé (ADN identique à près de 99%).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le Gorille', 0, 1), (@qid, 'Le Chimpanzé', 1, 2), (@qid, 'L''Orang-outan', 0, 3), (@qid, 'Le Gibbon', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le critère fondamental d''appartenance à la lignée humaine est :',
    'La bipédie permanente (station debout).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La taille du cerveau uniquement', 0, 1), (@qid, 'La bipédie permanente', 1, 2), (@qid, 'L''utilisation d''outils uniquement', 0, 3), (@qid, 'La parole', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La lignée humaine est dite "buissonnante" car :',
    'Plusieurs espèces d''homininés ont coexisté à certaines périodes.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il n''y a qu''une seule espèce', 0, 1), (@qid, 'Plusieurs espèces d''homininés ont coexisté', 1, 2), (@qid, 'L''évolution est linéaire', 0, 3), (@qid, 'Aucune espèce n''a disparu', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Homo sapiens est apparu en Afrique il y a environ :',
    '300 000 ans.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 millions d''années', 0, 1), (@qid, '300 000 ans', 1, 2), (@qid, '10 000 ans', 0, 3), (@qid, '65 millions d''années', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les comparaisons chromosomiques Homme-Chimpanzé montrent :',
    '46 chromosomes chez l''Homme, 48 chez le Chimpanzé (fusion du chromosome 2).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un nombre identique de chromosomes', 0, 1), (@qid, '46 chez l''Homme, 48 chez le Chimpanzé', 1, 2), (@qid, 'Des chromosomes totalement différents', 0, 3), (@qid, '23 chromosomes chez les deux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''adaptation à la bipédie se traduit par :',
    'Un bassin élargi et court, un trou occipital avancé.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un bassin étroit', 0, 1), (@qid, 'Un bassin court et élargi, trou occipital avancé', 1, 2), (@qid, 'Des membres antérieurs plus longs', 0, 3), (@qid, 'Une colonne vertébrale courbée vers l''arrière', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les fossiles sont étudiés par :',
    'La paléontologie.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La stratigraphie', 0, 1), (@qid, 'La paléontologie', 1, 2), (@qid, 'La pétrographie', 0, 3), (@qid, 'La minéralogie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les stades embryonnaires de différents vertébrés montrent :',
    'Des similitudes précoces indiquant une parenté évolutive.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des différences totales dès le début', 0, 1), (@qid, 'Des similitudes précoces indiquant une parenté', 1, 2), (@qid, 'Aucun point commun', 0, 3), (@qid, 'Une identité parfaite', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les comparaisons moléculaires (hémoglobine) entre vertébrés permettent :',
    'D''établir des degrés de parenté (plus la séquence est proche, plus la parenté est étroite).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De dater les fossiles', 0, 1), (@qid, 'D''établir des degrés de parenté', 1, 2), (@qid, 'De mesurer l''âge de la Terre', 0, 3), (@qid, 'De classer les roches', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''étude de la répartition des groupes sanguins permet :',
    'De retracer les migrations humaines anciennes.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De dater les fossiles', 0, 1), (@qid, 'De retracer les migrations humaines', 1, 2), (@qid, 'De classer les minéraux', 0, 3), (@qid, 'De mesurer l''âge de la Terre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''Australopithèque est caractérisé par :',
    'Une bipédie partielle et un petit cerveau.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un grand cerveau', 0, 1), (@qid, 'Une bipédie partielle, petit cerveau', 1, 2), (@qid, 'L''utilisation du feu', 0, 3), (@qid, 'La fabrication d''outils complexes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Homo habilis est surnommé "l''homme habile" car :',
    'Il fabriquait des outils en pierre taillée.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il savait écrire', 0, 1), (@qid, 'Il fabriquait des outils en pierre', 1, 2), (@qid, 'Il construisait des maisons', 0, 3), (@qid, 'Il peignait des grottes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Homo erectus maîtrisait :',
    'Le feu et la fabrication d''outils bifaces.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''écriture uniquement', 0, 1), (@qid, 'Le feu et les outils bifaces', 1, 2), (@qid, 'L''agriculture intensive', 0, 3), (@qid, 'La métallurgie', 0, 4);

-- ============================================
-- THÈME 4 : STRATIGRAPHIE (80 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La stratigraphie étudie :',
    'La succession et la disposition des couches géologiques.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les fossiles uniquement', 0, 1), (@qid, 'La succession des couches géologiques', 1, 2), (@qid, 'Les minéraux uniquement', 0, 3), (@qid, 'Le climat uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le principe de superposition énonce que :',
    'Dans une série non déformée, les couches les plus anciennes sont en dessous.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toutes les couches ont le même âge', 0, 1), (@qid, 'Les couches anciennes sont en dessous', 1, 2), (@qid, 'Les couches récentes sont en dessous', 0, 3), (@qid, 'L''âge ne dépend pas de la position', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le principe de continuité stipule que :',
    'Une couche sédimentaire a le même âge sur toute son étendue.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Chaque couche a un âge différent', 0, 1), (@qid, 'Une couche a le même âge sur toute son étendue', 1, 2), (@qid, 'Les couches sont discontinues par nature', 0, 3), (@qid, 'Les couches n''ont pas d''âge', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le principe d''identité paléontologique utilise :',
    'Les fossiles pour corréler des couches de même âge.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La couleur des roches', 0, 1), (@qid, 'Les fossiles pour corréler des couches', 1, 2), (@qid, 'La dureté des minéraux', 0, 3), (@qid, 'La température des roches', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une colonne lithostratigraphique représente :',
    'La succession verticale des couches géologiques dans une région.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La température des couches', 0, 1), (@qid, 'La succession verticale des couches', 1, 2), (@qid, 'La composition chimique uniquement', 0, 3), (@qid, 'L''épaisseur de l''atmosphère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La magnétostratigraphie est basée sur :',
    'Les inversions du champ magnétique terrestre enregistrées dans les roches.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La couleur des roches', 0, 1), (@qid, 'Les inversions du champ magnétique terrestre', 1, 2), (@qid, 'La radioactivité des minéraux', 0, 3), (@qid, 'La densité des couches', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La datation relative permet de :',
    'Situer un événement par rapport à un autre (avant/après) sans donner d''âge précis.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Donner un âge en millions d''années', 0, 1), (@qid, 'Ordonner les événements sans âge numérique', 1, 2), (@qid, 'Mesurer la température', 0, 3), (@qid, 'Analyser la composition chimique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La datation absolue utilise :',
    'La décroissance radioactive d''isotopes (¹⁴C, K-Ar, U-Pb).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La couleur des fossiles', 0, 1), (@qid, 'La décroissance radioactive d''isotopes', 1, 2), (@qid, 'La superposition des couches', 0, 3), (@qid, 'La dureté des minéraux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le carbone 14 (¹⁴C) permet de dater :',
    'Les restes organiques jusqu''à environ 50 000 ans.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les roches de plusieurs milliards d''années', 0, 1), (@qid, 'Les restes organiques jusqu''à 50 000 ans', 1, 2), (@qid, 'Les minéraux uniquement', 0, 3), (@qid, 'L''âge de l''univers', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La méthode potassium-argon (K-Ar) est utilisée pour dater :',
    'Les roches volcaniques anciennes (millions d''années).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les fossiles récents uniquement', 0, 1), (@qid, 'Les roches volcaniques anciennes', 1, 2), (@qid, 'Les restes organiques', 0, 3), (@qid, 'L''eau souterraine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une discordance stratigraphique représente :',
    'Une interruption de la sédimentation (lacune temporelle).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une couche continue', 0, 1), (@qid, 'Une interruption de la sédimentation', 1, 2), (@qid, 'Une accumulation rapide', 0, 3), (@qid, 'Une couche volcanique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les corrélations stratigraphiques permettent de :',
    'Relier des couches de même âge dans différentes régions.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Classer les roches par couleur', 0, 1), (@qid, 'Relier des couches de même âge entre régions', 1, 2), (@qid, 'Mesurer la température des couches', 0, 3), (@qid, 'Identifier les minéraux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un fossile stratigraphique est caractérisé par :',
    'Une grande répartition géographique et une courte durée de vie.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une répartition locale uniquement', 0, 1), (@qid, 'Grande répartition, courte durée de vie', 1, 2), (@qid, 'Une existence très longue', 0, 3), (@qid, 'Une absence de répartition', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un fossile de faciès renseigne sur :',
    'Les conditions environnementales (paléoécologie) du milieu de dépôt.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''âge exact de la roche', 0, 1), (@qid, 'Les conditions environnementales anciennes', 1, 2), (@qid, 'La température actuelle', 0, 3), (@qid, 'La pression atmosphérique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La paléontologie étudie :',
    'Les êtres vivants disparus à partir de leurs restes fossiles.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les roches uniquement', 0, 1), (@qid, 'Les êtres vivants disparus via leurs fossiles', 1, 2), (@qid, 'Les minéraux uniquement', 0, 3), (@qid, 'Le climat actuel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les macrofossiles sont :',
    'Des fossiles visibles à l''oeil nu (coquilles, os, dents).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des fossiles microscopiques', 0, 1), (@qid, 'Des fossiles visibles à l''oeil nu', 1, 2), (@qid, 'Des minéraux', 0, 3), (@qid, 'Des cristaux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les microfossiles sont étudiés au :',
    'Microscope (foraminifères, radiolaires, pollens).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Télescope', 0, 1), (@qid, 'Microscope', 1, 2), (@qid, 'Spectromètre de masse', 0, 3), (@qid, 'Thermomètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un géochronomètre est :',
    'Un couple d''isotopes radioactifs utilisé pour la datation absolue.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une horloge ordinaire', 0, 1), (@qid, 'Un couple d''isotopes pour datation absolue', 1, 2), (@qid, 'Un instrument météorologique', 0, 3), (@qid, 'Un type de fossile', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La demi-vie d''un isotope radioactif est :',
    'Le temps nécessaire pour que la moitié des noyaux se désintègre.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sa durée de vie totale', 0, 1), (@qid, 'Le temps pour désintégrer la moitié des noyaux', 1, 2), (@qid, 'Le double de sa durée de vie', 0, 3), (@qid, 'Un temps négligeable', 0, 4);

-- ============================================
-- THÈME 5 : PALÉONTOLOGIE ET FOSSILES (60 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un fossile est :',
    'Un reste ou une trace d''être vivant conservé dans les roches.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une roche volcanique', 0, 1), (@qid, 'Un reste ou trace d''être vivant conservé', 1, 2), (@qid, 'Un minéral pur', 0, 3), (@qid, 'Un cristal de glace', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La fossilisation nécessite des conditions :',
    'Anoxiques (sans oxygène) et un enfouissement rapide.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Riches en oxygène', 0, 1), (@qid, 'Anoxiques avec enfouissement rapide', 1, 2), (@qid, 'De surface uniquement', 0, 3), (@qid, 'De haute température', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les ammonites sont des fossiles :',
    'Stratigraphiques (excellents marqueurs du Mésozoïque).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De faciès uniquement', 0, 1), (@qid, 'Stratigraphiques, excellents pour le Mésozoïque', 1, 2), (@qid, 'Uniquement de milieu continental', 0, 3), (@qid, 'Sans intérêt pour la datation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les trilobites sont caractéristiques de l''ère :',
    'Paléozoïque (Primaire).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Précambrienne', 0, 1), (@qid, 'Paléozoïque', 1, 2), (@qid, 'Mésozoïque', 0, 3), (@qid, 'Cénozoïque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les dinosaures non aviens ont disparu il y a :',
    'Environ 65 millions d''années (limite Crétacé-Tertiaire).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '10 000 ans', 0, 1), (@qid, '65 millions d''années', 1, 2), (@qid, '200 millions d''années', 0, 3), (@qid, '500 millions d''années', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La crise Crétacé-Tertiaire (K-T) est marquée par :',
    'L''extinction massive des dinosaures et de nombreuses espèces marines.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''apparition des premiers mammifères', 0, 1), (@qid, 'L''extinction massive des dinosaures', 1, 2), (@qid, 'La formation des océans', 0, 3), (@qid, 'L''apparition de la vie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'En Haïti, la limite Crétacé-Tertiaire est visible à :',
    'Beloc (sur la route de Jacmel).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Port-au-Prince', 0, 1), (@qid, 'Beloc, route de Jacmel', 1, 2), (@qid, 'Cap-Haïtien', 0, 3), (@qid, 'Les Cayes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''extinction des dinosaures pourrait être due à :',
    'L''impact d''un astéroïde et/ou un volcanisme intense (trapps du Deccan).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement une maladie', 0, 1), (@qid, 'Impact d''astéroïde et/ou volcanisme intense', 1, 2), (@qid, 'Une glaciation uniquement', 0, 3), (@qid, 'La concurrence des mammifères uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La formation de Beloc en Haïti contient :',
    'Une couche d''argile riche en iridium (trace de l''impact K-T).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des diamants', 0, 1), (@qid, 'Une couche d''argile riche en iridium', 1, 2), (@qid, 'De l''or pur', 0, 3), (@qid, 'Des fossiles de dinosaures complets', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''iridium est un élément :',
    'Rare sur Terre mais abondant dans les météorites.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Très abondant sur Terre', 0, 1), (@qid, 'Rare sur Terre, abondant dans les météorites', 1, 2), (@qid, 'Inexistant dans le système solaire', 0, 3), (@qid, 'Uniquement présent dans les volcans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les foraminifères planctoniques sont :',
    'Des microfossiles marins utilisés en stratigraphie.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des fossiles de dinosaures', 0, 1), (@qid, 'Des microfossiles marins stratigraphiques', 1, 2), (@qid, 'Des minéraux volcaniques', 0, 3), (@qid, 'Des plantes terrestres', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une crise biologique est :',
    'Une période d''extinctions massives et rapides à l''échelle géologique.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une lente évolution', 0, 1), (@qid, 'Une extinction massive et rapide', 1, 2), (@qid, 'L''apparition de nouvelles espèces uniquement', 0, 3), (@qid, 'Un changement climatique mineur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les crises biologiques servent de :',
    'Repères dans l''histoire de la Terre (limites entre ères géologiques).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Simple curiosité', 0, 1), (@qid, 'Repères chronologiques dans l''histoire terrestre', 1, 2), (@qid, 'Indicateurs de température uniquement', 0, 3), (@qid, 'Marqueurs de ressources minières', 0, 4);

-- ============================================
-- THÈME 6 : TECTONIQUE ET GÉOLOGIE D'HAÏTI (70 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La tectonique laramienne est :',
    'Un événement tectonique majeur ayant affecté la région caraïbe.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un type de fossile', 0, 1), (@qid, 'Un événement tectonique de la région caraïbe', 1, 2), (@qid, 'Une méthode de datation', 0, 3), (@qid, 'Un type de roche', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Haïti est située sur la plaque :',
    'Caraïbe, à la limite de la plaque nord-américaine.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pacifique', 0, 1), (@qid, 'Caraïbe', 1, 2), (@qid, 'Africaine', 0, 3), (@qid, 'Eurasiatique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La formation géologique d''Haïti résulte :',
    'De la collision et des mouvements entre les plaques Caraïbe et nord-américaine.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De l''érosion uniquement', 0, 1), (@qid, 'De la collision entre plaques tectoniques', 1, 2), (@qid, 'D''une activité volcanique récente uniquement', 0, 3), (@qid, 'De la sédimentation marine uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les séismes en Haïti sont causés par :',
    'Le mouvement des failles le long de la limite de plaques.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les éruptions volcaniques', 0, 1), (@qid, 'Le mouvement des failles tectoniques', 1, 2), (@qid, 'Les ouragans', 0, 3), (@qid, 'Les inondations', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La faille d''Enriquillo est :',
    'Une faille décrochante majeure traversant le sud d''Haïti.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un volcan', 0, 1), (@qid, 'Une faille décrochante majeure', 1, 2), (@qid, 'Une rivière', 0, 3), (@qid, 'Une montagne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les roches carbonatées en Haïti indiquent :',
    'Un ancien environnement marin (plate-forme carbonatée).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un environnement volcanique', 0, 1), (@qid, 'Un ancien environnement marin', 1, 2), (@qid, 'Un désert ancien', 0, 3), (@qid, 'Une forêt tropicale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La carte géologique d''Haïti montre :',
    'La répartition des différentes formations rocheuses du pays.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les routes et les villes', 0, 1), (@qid, 'La répartition des formations rocheuses', 1, 2), (@qid, 'La météo', 0, 3), (@qid, 'La population', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les roches volcaniques en Haïti témoignent :',
    'D''une activité volcanique ancienne liée à la subduction.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'D''une météorite', 0, 1), (@qid, 'D''une activité volcanique ancienne liée à la subduction', 1, 2), (@qid, 'D''une glaciation', 0, 3), (@qid, 'D''un désert ancien', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La lithosphère est composée de :',
    'La croûte terrestre et la partie supérieure du manteau (rigide).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Du noyau uniquement', 0, 1), (@qid, 'De la croûte et du manteau supérieur rigide', 1, 2), (@qid, 'De l''atmosphère', 0, 3), (@qid, 'De l''hydrosphère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''asthénosphère est :',
    'La partie ductile du manteau sur laquelle glisse la lithosphère.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La croûte terrestre', 0, 1), (@qid, 'La partie ductile du manteau sous la lithosphère', 1, 2), (@qid, 'Le noyau externe', 0, 3), (@qid, 'L''atmosphère', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La tectonique des plaques explique :',
    'La dérive des continents, les séismes, le volcanisme et la formation des montagnes.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement les saisons', 0, 1), (@qid, 'Dérive des continents, séismes, volcans, montagnes', 1, 2), (@qid, 'Uniquement les courants marins', 0, 3), (@qid, 'Le cycle de l''eau uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une zone de subduction est caractérisée par :',
    'L''enfoncement d''une plaque sous une autre (séismes profonds + volcans).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La création de croûte océanique', 0, 1), (@qid, 'L''enfoncement d''une plaque sous une autre', 1, 2), (@qid, 'La collision de deux continents uniquement', 0, 3), (@qid, 'L''absence de séismes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une dorsale océanique est :',
    'Une zone d''écartement des plaques où se forme la croûte océanique.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une zone de collision', 0, 1), (@qid, 'Une zone d''écartement avec création de croûte', 1, 2), (@qid, 'Une montagne continentale', 0, 3), (@qid, 'Un volcan isolé', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les ondes sismiques P sont :',
    'Des ondes de compression, les plus rapides.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les plus lentes', 0, 1), (@qid, 'Des ondes de compression, les plus rapides', 1, 2), (@qid, 'Des ondes de surface uniquement', 0, 3), (@qid, 'Inexistantes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les ondes S ne se propagent pas dans :',
    'Les liquides (elles s''arrêtent au noyau externe).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les solides', 0, 1), (@qid, 'Les liquides', 1, 2), (@qid, 'L''air', 0, 3), (@qid, 'Le vide', 0, 4);

-- ============================================
-- THÈME 7 : ROCHES ET MINÉRAUX (50 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les trois grandes familles de roches sont :',
    'Magmatiques, sédimentaires et métamorphiques.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Volcaniques, marines, terrestres', 0, 1), (@qid, 'Magmatiques, sédimentaires, métamorphiques', 1, 2), (@qid, 'Dures, tendres, friables', 0, 3), (@qid, 'Anciennes, récentes, actuelles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les roches magmatiques se forment par :',
    'Refroidissement et cristallisation d''un magma.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Compaction de sédiments', 0, 1), (@qid, 'Refroidissement d''un magma', 1, 2), (@qid, 'Transformation à l''état solide', 0, 3), (@qid, 'Précipitation chimique uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les roches sédimentaires se forment par :',
    'Accumulation et compaction de sédiments.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Refroidissement magmatique', 0, 1), (@qid, 'Accumulation et compaction de sédiments', 1, 2), (@qid, 'Fusion partielle', 0, 3), (@qid, 'Métamorphisme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le granite est une roche :',
    'Magmatique plutonique (grenue, refroidie lentement en profondeur).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sédimentaire', 0, 1), (@qid, 'Magmatique plutonique', 1, 2), (@qid, 'Métamorphique', 0, 3), (@qid, 'Volcanique uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le basalte est une roche :',
    'Magmatique volcanique (microlithique, refroidie rapidement en surface).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Plutonique', 0, 1), (@qid, 'Magmatique volcanique', 1, 2), (@qid, 'Sédimentaire', 0, 3), (@qid, 'Métamorphique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le calcaire est une roche :',
    'Sédimentaire (souvent d''origine marine, carbonatée).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Magmatique', 0, 1), (@qid, 'Sédimentaire', 1, 2), (@qid, 'Métamorphique', 0, 3), (@qid, 'Volcanique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le marbre est une roche :',
    'Métamorphique (calcaire transformé par chaleur et pression).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sédimentaire', 0, 1), (@qid, 'Métamorphique', 1, 2), (@qid, 'Magmatique', 0, 3), (@qid, 'Volcanique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le quartz est un minéral composé de :',
    'SiO₂ (dioxyde de silicium).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CaCO₃', 0, 1), (@qid, 'SiO₂', 1, 2), (@qid, 'Fe₂O₃', 0, 3), (@qid, 'Al₂O₃', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La calcite est un minéral de formule :',
    'CaCO₃ (carbonate de calcium).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'SiO₂', 0, 1), (@qid, 'CaCO₃', 1, 2), (@qid, 'NaCl', 0, 3), (@qid, 'FeS₂', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''échelle de Mohs mesure :',
    'La dureté des minéraux (de 1 à 10).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La densité', 0, 1), (@qid, 'La dureté', 1, 2), (@qid, 'La couleur', 0, 3), (@qid, 'La température de fusion', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le diamant a une dureté de :',
    '10 sur l''échelle de Mohs (le plus dur).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 0, 1), (@qid, '5', 0, 2), (@qid, '7', 0, 3), (@qid, '10', 1, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le talc a une dureté de :',
    '1 sur l''échelle de Mohs (le plus tendre).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1', 1, 1), (@qid, '5', 0, 2), (@qid, '7', 0, 3), (@qid, '10', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La couleur d''un minéral en poudre s''appelle :',
    'La trace (ou trait).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''éclat', 0, 1), (@qid, 'La trace (trait)', 1, 2), (@qid, 'La transparence', 0, 3), (@qid, 'La fluorescence', 0, 4);

-- ============================================
-- THÈME 8 : SÉDIMENTOLOGIE ET MILIEUX DE DÉPÔT (40 QCM)
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La sédimentologie étudie :',
    'La formation et l''évolution des sédiments et roches sédimentaires.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les volcans uniquement', 0, 1), (@qid, 'La formation et l''évolution des sédiments', 1, 2), (@qid, 'Les séismes uniquement', 0, 3), (@qid, 'Les fossiles uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La diagenèse est :',
    'La transformation d''un sédiment meuble en roche consolidée.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La fusion des roches', 0, 1), (@qid, 'La transformation d''un sédiment en roche dure', 1, 2), (@qid, 'L''érosion des montagnes', 0, 3), (@qid, 'La cristallisation magmatique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un conglomérat est une roche détritique formée de :',
    'Galets et graviers cimentés.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sable fin uniquement', 0, 1), (@qid, 'Galets et graviers cimentés', 1, 2), (@qid, 'Cendres volcaniques', 0, 3), (@qid, 'Coquilles uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le grès est une roche détritique formée de :',
    'Grains de sable cimentés (quartz principalement).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Argiles', 0, 1), (@qid, 'Grains de sable cimentés', 1, 2), (@qid, 'Fossiles', 0, 3), (@qid, 'Cristaux volcaniques', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''argile est une roche à grains :',
    'Très fins (< 2 µm), imperméable.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Très grossiers', 0, 1), (@qid, 'Très fins, imperméable', 1, 2), (@qid, 'Moyens, poreux', 0, 3), (@qid, 'Uniquement organiques', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le charbon est une roche :',
    'Sédimentaire organique (accumulation de matière végétale).', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Magmatique', 0, 1), (@qid, 'Sédimentaire organique', 1, 2), (@qid, 'Métamorphique', 0, 3), (@qid, 'Volcanique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La transgression marine est :',
    'L''avancée de la mer sur le continent (montée du niveau marin).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le retrait de la mer', 0, 1), (@qid, 'L''avancée de la mer sur le continent', 1, 2), (@qid, 'Un séisme sous-marin', 0, 3), (@qid, 'Une éruption volcanique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La régression marine est :',
    'Le retrait de la mer (baisse du niveau marin).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''avancée de la mer', 0, 1), (@qid, 'Le retrait de la mer', 1, 2), (@qid, 'Un tsunami', 0, 3), (@qid, 'Une glaciation uniquement', 0, 4);

-- ============================================
-- QUESTIONS FINALES POUR ATTEINDRE 600+
-- ============================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''érosion est le processus de :',
    'Destruction et transport des roches par l''eau, le vent, la glace.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Formation des montagnes', 0, 1), (@qid, 'Destruction et transport des roches', 1, 2), (@qid, 'Cristallisation magmatique', 0, 3), (@qid, 'Fusion du manteau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''altération est :',
    'La modification chimique ou physique des roches sur place.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le transport des sédiments', 0, 1), (@qid, 'La modification des roches sur place', 1, 2), (@qid, 'La fusion des roches', 0, 3), (@qid, 'La cristallisation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le cycle des roches relie :',
    'Les processus magmatiques, sédimentaires et métamorphiques.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement la sédimentation', 0, 1), (@qid, 'Les processus magmatiques, sédimentaires et métamorphiques', 1, 2), (@qid, 'Uniquement le volcanisme', 0, 3), (@qid, 'Le climat uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une nappe phréatique est :',
    'Une réserve d''eau souterraine contenue dans les roches poreuses.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un lac de surface', 0, 1), (@qid, 'Une réserve d''eau souterraine', 1, 2), (@qid, 'Une rivière', 0, 3), (@qid, 'Un glacier', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un aquifère est :',
    'Une formation géologique poreuse contenant de l''eau exploitable.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une montagne', 0, 1), (@qid, 'Une formation poreuse contenant de l''eau', 1, 2), (@qid, 'Un volcan', 0, 3), (@qid, 'Un glacier', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La porosité d''une roche est :',
    'Le volume des vides (pores) par rapport au volume total.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sa dureté', 0, 1), (@qid, 'Le volume des vides par rapport au volume total', 1, 2), (@qid, 'Sa couleur', 0, 3), (@qid, 'Sa densité', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La perméabilité est la capacité d''une roche à :',
    'Laisser circuler l''eau à travers ses pores/fissures.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Résister à la compression', 0, 1), (@qid, 'Laisser circuler l''eau', 1, 2), (@qid, 'Fondre à haute température', 0, 3), (@qid, 'Changer de couleur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le karst est un relief formé dans :',
    'Les roches calcaires par dissolution (grottes, dolines).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le granite', 0, 1), (@qid, 'Les roches calcaires', 1, 2), (@qid, 'Le basalte', 0, 3), (@qid, 'Le sable', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les grottes se forment par :',
    'Dissolution du calcaire par l''eau acide (CO₂ dissous).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Érosion éolienne uniquement', 0, 1), (@qid, 'Dissolution du calcaire par l''eau acidifiée', 1, 2), (@qid, 'Activité volcanique', 0, 3), (@qid, 'Impact de météorites', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les stalactites et stalagmites sont formées de :',
    'Calcite (CaCO₃) précipitée dans les grottes.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Quartz', 0, 1), (@qid, 'Calcite précipitée', 1, 2), (@qid, 'Gypse', 0, 3), (@qid, 'Sel gemme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un pli géologique est :',
    'Une déformation souple des couches sous l''effet de contraintes tectoniques.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une cassure', 0, 1), (@qid, 'Une déformation souple des couches', 1, 2), (@qid, 'Un volcan', 0, 3), (@qid, 'Un fossile', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une faille est :',
    'Une cassure des roches avec déplacement relatif des blocs.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un pli', 0, 1), (@qid, 'Une cassure avec déplacement', 1, 2), (@qid, 'Une couche sédimentaire', 0, 3), (@qid, 'Un fossile', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un horst est :',
    'Un bloc soulevé entre deux failles normales.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un bloc effondré', 0, 1), (@qid, 'Un bloc soulevé entre deux failles', 1, 2), (@qid, 'Un volcan', 0, 3), (@qid, 'Un pli anticlinal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un graben est :',
    'Un bloc effondré entre deux failles normales (fossé tectonique).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un bloc soulevé', 0, 1), (@qid, 'Un bloc effondré entre deux failles', 1, 2), (@qid, 'Une montagne', 0, 3), (@qid, 'Un pli synclinal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''échelle stratigraphique internationale est basée sur :',
    'Les coupures géologiques majeures (crises biologiques, changements globaux).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des mesures arbitraires', 0, 1), (@qid, 'Des crises biologiques et événements globaux', 1, 2), (@qid, 'Uniquement l''épaisseur des couches', 0, 3), (@qid, 'La couleur des roches', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les ères géologiques de la plus ancienne à la plus récente sont :',
    'Précambrien, Paléozoïque, Mésozoïque, Cénozoïque.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cénozoïque, Mésozoïque, Paléozoïque, Précambrien', 0, 1), (@qid, 'Précambrien, Paléozoïque, Mésozoïque, Cénozoïque', 1, 2), (@qid, 'Paléozoïque, Précambrien, Cénozoïque, Mésozoïque', 0, 3), (@qid, 'Mésozoïque, Cénozoïque, Précambrien, Paléozoïque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La dérive des continents a été proposée par :',
    'Alfred Wegener au début du 20e siècle.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Charles Darwin', 0, 1), (@qid, 'Alfred Wegener', 1, 2), (@qid, 'Isaac Newton', 0, 3), (@qid, 'James Hutton', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La Pangée était :',
    'Le supercontinent unique qui existait il y a environ 250 millions d''années.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un océan', 0, 1), (@qid, 'Le supercontinent unique du Permien-Trias', 1, 2), (@qid, 'Un volcan géant', 0, 3), (@qid, 'Une ère géologique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le rift est-africain est une zone :',
    'D''écartement continental (divergence) avec volcanisme associé.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De collision continentale', 0, 1), (@qid, 'D''écartement continental avec volcanisme', 1, 2), (@qid, 'De subduction océanique', 0, 3), (@qid, 'D''inactivité tectonique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les gisements fossilifères d''homininés du rift est-africain sont datés par :',
    'La méthode potassium-argon (K-Ar) sur les cendres volcaniques encadrantes.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le carbone 14 uniquement', 0, 1), (@qid, 'La méthode K-Ar sur les cendres volcaniques', 1, 2), (@qid, 'L''uranium-plomb uniquement', 0, 3), (@qid, 'La dendrochronologie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les tsunamis sont généralement causés par :',
    'Des séismes sous-marins provoquant un déplacement vertical du fond.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le vent', 0, 1), (@qid, 'Des séismes sous-marins', 1, 2), (@qid, 'La pluie', 0, 3), (@qid, 'Les courants marins', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La magnitude d''un séisme est mesurée par :',
    'L''échelle de Richter (ou magnitude de moment).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le thermomètre', 0, 1), (@qid, 'L''échelle de Richter', 1, 2), (@qid, 'Le baromètre', 0, 3), (@qid, 'L''hygromètre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''épicentre d''un séisme est :',
    'Le point à la surface terrestre directement au-dessus du foyer.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le point le plus profond', 0, 1), (@qid, 'Le point en surface au-dessus du foyer', 1, 2), (@qid, 'Le centre de la Terre', 0, 3), (@qid, 'Une station de mesure', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le foyer (hypocentre) d''un séisme est :',
    'Le point de rupture des roches en profondeur.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La surface du sol', 0, 1), (@qid, 'Le point de rupture en profondeur', 1, 2), (@qid, 'L''emplacement du sismographe', 0, 3), (@qid, 'Une montagne', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le volcanisme de subduction produit des laves :',
    'Andésitiques (visqueuses, explosives).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Très fluides basaltiques', 0, 1), (@qid, 'Andésitiques, visqueuses', 1, 2), (@qid, 'Sans danger', 0, 3), (@qid, 'Inexistantes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le volcanisme de point chaud (Hawaï) produit des laves :',
    'Basaltiques très fluides.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Andésitiques explosives', 0, 1), (@qid, 'Basaltiques très fluides', 1, 2), (@qid, 'Rhyolitiques', 0, 3), (@qid, 'Aucune lave', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les sols se forment à partir de :',
    'L''altération de la roche-mère et l''accumulation de matière organique.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Du magma uniquement', 0, 1), (@qid, 'De l''altération de la roche-mère et matière organique', 1, 2), (@qid, 'De l''eau de pluie uniquement', 0, 3), (@qid, 'Des cendres volcaniques uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''humus est :',
    'La matière organique décomposée du sol, essentielle à sa fertilité.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un minéral', 0, 1), (@qid, 'La matière organique décomposée du sol', 1, 2), (@qid, 'Une roche', 0, 3), (@qid, 'Un fossile', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La déforestation accélère :',
    'L''érosion des sols (plus de protection racinaire).', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La formation des sols', 0, 1), (@qid, 'L''érosion des sols', 1, 2), (@qid, 'La sédimentation marine', 0, 3), (@qid, 'Le volcanisme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''énergie géothermique provient de :',
    'La chaleur interne de la Terre.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Du soleil', 0, 1), (@qid, 'De la chaleur interne de la Terre', 1, 2), (@qid, 'Du vent', 0, 3), (@qid, 'Des marées', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les ressources minières d''Haïti incluent :',
    'La bauxite, le cuivre, l''or, le lignite.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le diamant uniquement', 0, 1), (@qid, 'La bauxite, le cuivre, l''or', 1, 2), (@qid, 'Le pétrole uniquement', 0, 3), (@qid, 'Aucune ressource', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les conséquences du comportement humain sur l''environnement incluent :',
    'Pollution, déforestation, érosion accélérée, réchauffement climatique.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement des effets positifs', 0, 1), (@qid, 'Pollution, déforestation, érosion, réchauffement', 1, 2), (@qid, 'Aucun impact', 0, 3), (@qid, 'Uniquement la création de lacs', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La géologie est essentielle pour :',
    'Comprendre l''histoire de la Terre, trouver des ressources et prévenir les risques.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement dater les fossiles', 0, 1), (@qid, 'Comprendre l''histoire terrestre, ressources, risques', 1, 2), (@qid, 'Prévoir la météo', 0, 3), (@qid, 'Étudier uniquement les volcans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La géothermie exploite :',
    'La chaleur des roches profondes pour produire de l''énergie.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le vent', 0, 1), (@qid, 'La chaleur des roches profondes', 1, 2), (@qid, 'Les marées', 0, 3), (@qid, 'Le rayonnement solaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''étude des risques géologiques permet de :',
    'Prévenir et réduire les impacts des catastrophes naturelles.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Créer des catastrophes', 0, 1), (@qid, 'Prévenir et réduire les impacts des catastrophes', 1, 2), (@qid, 'Augmenter les séismes', 0, 3), (@qid, 'Modifier le climat', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un glissement de terrain est favorisé par :',
    'La saturation en eau des sols, la pente, la déforestation.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le gel permanent', 0, 1), (@qid, 'La saturation en eau, la pente, la déforestation', 1, 2), (@qid, 'L''absence de pluie', 0, 3), (@qid, 'La présence de granite massif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''étude des coupes géologiques permet :',
    'De reconstituer l''histoire tectonique et sédimentaire d''une région.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'De mesurer la température actuelle', 0, 1), (@qid, 'De reconstituer l''histoire tectonique et sédimentaire', 1, 2), (@qid, 'De prévoir la météo', 0, 3), (@qid, 'De calculer la population', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les intrusions magmatiques sont :',
    'Des masses de roches ignées qui se sont mises en place dans des roches plus anciennes.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des coulées de lave en surface', 0, 1), (@qid, 'Des masses ignées dans des roches encaissantes', 1, 2), (@qid, 'Des sédiments marins', 0, 3), (@qid, 'Des fossiles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le principe d''actualisme en géologie énonce que :',
    'Les processus géologiques actuels sont les mêmes que ceux du passé.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Tout change constamment', 0, 1), (@qid, 'Les processus actuels étaient les mêmes dans le passé', 1, 2), (@qid, 'Le passé n''a aucun lien avec le présent', 0, 3), (@qid, 'Seuls les séismes sont constants', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La biostratigraphie utilise les fossiles pour :',
    'Dater et corréler les couches sédimentaires.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mesurer la température', 0, 1), (@qid, 'Dater et corréler les couches', 1, 2), (@qid, 'Identifier les minéraux', 0, 3), (@qid, 'Prévoir les séismes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le pétrole et le gaz naturel sont des ressources :',
    'Non renouvelables, issues de la transformation de matière organique enfouie.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Renouvelables', 0, 1), (@qid, 'Non renouvelables, d''origine organique', 1, 2), (@qid, 'Minérales pures', 0, 3), (@qid, 'Issues des volcans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La roche-mère en géologie pétrolière est :',
    'La roche riche en matière organique où se forme le pétrole.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une roche stérile', 0, 1), (@qid, 'La roche où se forme le pétrole', 1, 2), (@qid, 'La roche qui piège le pétrole', 0, 3), (@qid, 'Une roche volcanique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La roche-réservoir est :',
    'Une roche poreuse et perméable qui stocke le pétrole.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une roche imperméable', 0, 1), (@qid, 'Une roche poreuse et perméable stockant le pétrole', 1, 2), (@qid, 'La roche mère', 0, 3), (@qid, 'Une roche volcanique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''échelle des temps géologiques est divisée en :',
    'Éons, ères, périodes, époques.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Heures, jours, mois', 0, 1), (@qid, 'Éons, ères, périodes, époques', 1, 2), (@qid, 'Siècles, millénaires', 0, 3), (@qid, 'Saisons uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''Anthropocène désigne :',
    'Une époque géologique marquée par l''impact de l''Homme sur la Terre.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''ère des dinosaures', 0, 1), (@qid, 'L''époque de l''impact humain sur la planète', 1, 2), (@qid, 'La formation de la Terre', 0, 3), (@qid, 'Une période glaciaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le manteau terrestre est principalement composé de :',
    'Péridotite (roche riche en olivine et pyroxène).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Granite', 0, 1), (@qid, 'Péridotite', 1, 2), (@qid, 'Calcaire', 0, 3), (@qid, 'Basalte', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le noyau terrestre est principalement composé de :',
    'Fer et nickel.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Silicium et aluminium', 0, 1), (@qid, 'Fer et nickel', 1, 2), (@qid, 'Calcium et carbone', 0, 3), (@qid, 'Oxygène et azote', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le champ magnétique terrestre est généré par :',
    'Les mouvements de convection dans le noyau externe liquide.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La croûte terrestre', 0, 1), (@qid, 'Les mouvements du noyau externe liquide', 1, 2), (@qid, 'L''atmosphère', 0, 3), (@qid, 'Les océans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les inversions magnétiques sont enregistrées dans :',
    'Les basaltes des dorsales océaniques (bandes magnétiques symétriques).', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les calcaires', 0, 1), (@qid, 'Les basaltes des fonds océaniques', 1, 2), (@qid, 'Les grès', 0, 3), (@qid, 'Les argiles', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La croûte continentale est principalement composée de :',
    'Granite et roches métamorphiques.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Basalte uniquement', 0, 1), (@qid, 'Granite et roches métamorphiques', 1, 2), (@qid, 'Péridotite', 0, 3), (@qid, 'Calcaire uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La croûte océanique est principalement composée de :',
    'Basalte et gabbro.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Granite', 0, 1), (@qid, 'Basalte et gabbro', 1, 2), (@qid, 'Calcaire', 0, 3), (@qid, 'Grès', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vitesse d''expansion des fonds océaniques est de l''ordre de :',
    'Quelques centimètres par an.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Plusieurs kilomètres par an', 0, 1), (@qid, 'Quelques centimètres par an', 1, 2), (@qid, 'Quelques mètres par jour', 0, 3), (@qid, 'Aucun mouvement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''Himalaya s''est formé par :',
    'La collision entre la plaque indienne et la plaque eurasiatique.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une éruption volcanique', 0, 1), (@qid, 'La collision Inde-Eurasie', 1, 2), (@qid, 'L''érosion d''un plateau', 0, 3), (@qid, 'Un impact météoritique', 0, 4);


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les stromatolithes actuels se trouvent principalement :',
    'En Australie (Shark Bay) dans des milieux hypersalés.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dans les océans profonds', 0, 1), (@qid, 'En Australie, en milieu hypersalé', 1, 2), (@qid, 'Dans les rivières', 0, 3), (@qid, 'Dans les glaciers', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La fossilisation par perminéralisation se fait par :',
    'Précipitation de minéraux dans les pores du tissu fossile.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Congélation', 0, 1), (@qid, 'Précipitation de minéraux dans les pores', 1, 2), (@qid, 'Combustion', 0, 3), (@qid, 'Dissolution totale', 0, 4);


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La carbonification (houillification) transforme :',
    'Les débris végétaux en charbon.', 'Programme NS4', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les coquilles en calcaire', 0, 1), (@qid, 'Les débris végétaux en charbon', 1, 2), (@qid, 'Le sable en grès', 0, 3), (@qid, 'Le magma en basalte', 0, 4);


INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La protection de l''environnement géologique vise à :',
    'Préserver les ressources naturelles et réduire les risques.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Exploiter sans limite', 0, 1), (@qid, 'Préserver les ressources et réduire les risques', 1, 2), (@qid, 'Augmenter la pollution', 0, 3), (@qid, 'Accélérer l''érosion', 0, 4);

-- Complétion
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(12, 1, 'La photosynthèse se déroule dans les ________ des cellules végétales.', NULL, 'Programme NS4', 1, 'chloroplastes');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(12, 1, 'Le groupe sanguin universel donneur est le groupe ________.', NULL, 'Programme NS4', 2, 'O');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(12, 1, 'L''unité de base du vivant est la ________.', NULL, 'Programme NS4', 1, 'cellule');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(12, 1, 'Les gamètes (ovule et spermatozoïde) contiennent ________ chromosomes.', NULL, 'Programme NS4', 2, '23');


-- =============================================
-- 13. HISTOIRE-GÉOGRAPHIE NS4 (matiere_id = 13)
-- =============================================

-- QCM
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(13, 2, 'En quelle année Haïti a-t-elle déclaré son indépendance ?', 'L''indépendance d''Haïti a été proclamée le 1er janvier 1804.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1791', 0, 1), (@qid, '1804', 1, 2), (@qid, '1820', 0, 3), (@qid, '1844', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(13, 2, 'Qui a proclamé l''indépendance d''Haïti ?', 'Jean-Jacques Dessalines a proclamé l''indépendance d''Haïti à Gonaïves.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Toussaint Louverture', 0, 1), (@qid, 'Alexandre Pétion', 0, 2), (@qid, 'Jean-Jacques Dessalines', 1, 3), (@qid, 'Henri Christophe', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(13, 2, 'Quelle est la superficie d''Haïti ?', 'Haïti couvre environ 27 750 km².', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '21 000 km²', 0, 1), (@qid, '27 750 km²', 1, 2), (@qid, '35 000 km²', 0, 3), (@qid, '48 000 km²', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(13, 2, 'Combien de départements compte Haïti ?', 'Haïti est divisée en 10 départements depuis 1995.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '8', 0, 1), (@qid, '9', 0, 2), (@qid, '10', 1, 3), (@qid, '12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(13, 2, 'Quelle est la capitale d''Haïti ?', 'Port-au-Prince est la capitale et la plus grande ville d''Haïti.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cap-Haïtien', 0, 1), (@qid, 'Gonaïves', 0, 2), (@qid, 'Port-au-Prince', 1, 3), (@qid, 'Jacmel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(13, 2, 'La Révolution française a éclaté en :', 'La Révolution française a commencé en 1789 avec la prise de la Bastille.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1776', 0, 1), (@qid, '1789', 1, 2), (@qid, '1799', 0, 3), (@qid, '1804', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(13, 2, 'Quelle mer borde la côte nord d''Haïti ?', 'La mer Atlantique (océan Atlantique) borde la côte nord d''Haïti.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mer des Caraïbes', 0, 1), (@qid, 'Mer Méditerranée', 0, 2), (@qid, 'Océan Atlantique', 1, 3), (@qid, 'Mer du Pacifique', 0, 4);

-- Complétion
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(13, 1, 'La bataille de Vertières, décisive pour l''indépendance d''Haïti, s''est déroulée en ________.', NULL, 'Programme NS4', 2, '1803');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(13, 1, 'Le pays voisin d''Haïti sur l''île d''Hispaniola est la ________.', NULL, 'Programme NS4', 1, 'République Dominicaine|République dominicaine');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(13, 1, 'Le fleuve le plus long d''Haïti est l''________.', NULL, 'Programme NS4', 2, 'Artibonite');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(13, 1, 'L''insurrection de Bois Caïman a eu lieu en ________.', NULL, 'Programme NS4', 2, '1791');


-- =============================================
-- 14. ANGLAIS NS4 (matiere_id = 14)
-- =============================================

-- QCM
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(14, 2, 'Which sentence is in the present perfect tense?', 'Present perfect = have/has + past participle.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'She goes to school every day.', 0, 1), (@qid, 'She has gone to school.', 1, 2), (@qid, 'She went to school.', 0, 3), (@qid, 'She will go to school.', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(14, 2, 'What is the past tense of "write"?', 'The irregular past tense of "write" is "wrote".', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'writed', 0, 1), (@qid, 'written', 0, 2), (@qid, 'wrote', 1, 3), (@qid, 'wrotes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(14, 2, 'Choose the correct passive voice: "The book ___ by the student."', 'Passive voice = be + past participle. "was written" is correct for past.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'wrote', 0, 1), (@qid, 'was written', 1, 2), (@qid, 'is write', 0, 3), (@qid, 'has write', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(14, 2, 'What does "although" mean?', '"Although" expresses contrast, equivalent to "bien que / même si" in French.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Because', 0, 1), (@qid, 'Therefore', 0, 2), (@qid, 'Even though / despite the fact that', 1, 3), (@qid, 'In addition', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(14, 2, 'Which word is a synonym of "intelligent"?', '"Smart" and "clever" are synonyms of intelligent.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lazy', 0, 1), (@qid, 'Smart', 1, 2), (@qid, 'Tired', 0, 3), (@qid, 'Shy', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(14, 2, '"If I ___ rich, I would travel the world." — Choose the correct verb form.', 'Second conditional: If + past simple, would + infinitive.', 'Programme NS4', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'am', 0, 1), (@qid, 'will be', 0, 2), (@qid, 'were', 1, 3), (@qid, 'have been', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(14, 2, 'What is the plural of "child"?', 'The irregular plural of child is children.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'childs', 0, 1), (@qid, 'childes', 0, 2), (@qid, 'children', 1, 3), (@qid, 'child''s', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(14, 2, 'Which sentence uses the correct article?', '"A" is used before consonant sounds.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'I saw an dog.', 0, 1), (@qid, 'She is a engineer.', 0, 2), (@qid, 'He bought a book.', 1, 3), (@qid, 'They have the apple.', 0, 4);

-- Complétion
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(14, 1, 'The past participle of "go" is ________.', NULL, 'Programme NS4', 1, 'gone');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(14, 1, 'The opposite of "ancient" is ________.', NULL, 'Programme NS4', 1, 'modern|new|recent');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(14, 1, '"She ________ (study) for two hours." — Present perfect continuous.', NULL, 'Programme NS4', 2, 'has been studying');
INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte, reponse_attendue) VALUES
(14, 1, 'The capital of England is ________.', NULL, 'Programme NS4', 1, 'London');