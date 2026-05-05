

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
(9, 2, 'On tire une carte d''un jeu de 52. La probabilité de tirer un as est :', 'Il y a 4 as dans 52 cartes : P = 4/52 = 1/13.', 'Programme NS4', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/52', 0, 1),
(@qid, '1/13', 1, 2),
(@qid, '4/13', 0, 3),
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







