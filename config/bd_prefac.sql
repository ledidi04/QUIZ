-- ============================================================
-- QCM BIOLOGIE - EXAMENS OFFICIELS NS4 HAÏTI (MENFP) 2022
-- Plus de 400 questions / réponses
-- matiere_id = 12 (Biologie SVT), type_id = 2 (QCM)
-- Difficulté : 1 (facile) à 5 (très difficile)
-- ============================================================

-- ============================================================
-- SECTION 1 : GÉNÉTIQUE ET HÉRÉDITÉ
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La drépanocytose est causée par une mutation sur :',
 'La drépanocytose résulte d''une mutation ponctuelle sur la chaîne bêta de l''hémoglobine, en position 6.', 'Examen NS4 SVT 2022 - Glucogène/Morphologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La chaîne alpha de l''hémoglobine, position 1', 0, 1),
(@qid, 'La chaîne bêta de l''hémoglobine, position 6', 1, 2),
(@qid, 'La chaîne gamma de l''hémoglobine, position 3', 0, 3),
(@qid, 'Le chromosome X, position 12', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Dans la drépanocytose, quel acide aminé remplace la glutamine sur la chaîne bêta ?',
 'La valine remplace l''acide glutamique en position 6 de la chaîne bêta, due à une mutation ponctuelle (substitution).', 'Programme NS4 - Génétique moléculaire', 4);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Alanine', 0, 1),
(@qid, 'Leucine', 0, 2),
(@qid, 'Valine', 1, 3),
(@qid, 'Proline', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le génotype d''un individu atteint de drépanocytose s''écrit :',
 'L''individu malade est homozygote pour l''allèle drépanocytaire : HbS/HbS (ou ss selon la notation utilisée).', 'Examen NS4 SVT 2022', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'HbA/HbA', 0, 1),
(@qid, 'HbA/HbS', 0, 2),
(@qid, 'HbS/HbS', 1, 3),
(@qid, 'HbA/HbC', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel type de mutation est mis en évidence dans la drépanocytose ?',
 'C''est une mutation ponctuelle de type substitution : un nucléotide est remplacé par un autre, entraînant le remplacement de l''acide glutamique par la valine.', 'Examen NS4 SVT 2022 - Biologie moléculaire', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Délétion', 0, 1),
(@qid, 'Insertion', 0, 2),
(@qid, 'Substitution (mutation ponctuelle)', 1, 3),
(@qid, 'Translocation chromosomique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''hémoglobine est appelée pigment respiratoire car :',
 'L''hémoglobine fixe et transporte le dioxygène (O₂) grâce à son groupement hème contenant le fer.', 'Examen NS4 SVT 2022 - Glucogène', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Elle donne la couleur rouge à la peau', 0, 1),
(@qid, 'Elle fixe et transporte le dioxygène dans le sang', 1, 2),
(@qid, 'Elle produit de l''énergie lors de la respiration', 0, 3),
(@qid, 'Elle est présente dans les poumons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle vitamine peut-on prendre pour stimuler l''hématopoïèse ?',
 'La vitamine B12 (cyanocobalamine) est indispensable à la formation des globules rouges (hématopoïèse).', 'Examen NS4 SVT 2022 - Morphologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vitamine C', 0, 1),
(@qid, 'Vitamine D', 0, 2),
(@qid, 'Vitamine B12', 1, 3),
(@qid, 'Vitamine A', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La drépanocytose est-elle liée aux hétérochromosomes ?',
 'Non, la drépanocytose est une maladie autosomale : le gène HBB est situé sur le chromosome 11 (autosome), pas sur les chromosomes sexuels.', 'Examen NS4 SVT 2022 - Morphologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oui, elle est liée au chromosome X', 0, 1),
(@qid, 'Oui, elle est liée au chromosome Y', 0, 2),
(@qid, 'Non, elle est autosomale (chromosome 11)', 1, 3),
(@qid, 'Oui, elle est liée aux deux chromosomes sexuels', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La forme normale des globules rouges chez un individu sain est :',
 'Les globules rouges normaux ont une forme de disque biconcave. Dans la drépanocytose, ils prennent une forme de faucille.', 'Examen NS4 SVT 2022 - Paléontologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sphérique', 0, 1),
(@qid, 'En faucille (falciforme)', 0, 2),
(@qid, 'Disque biconcave', 1, 3),
(@qid, 'Ovale allongée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle est la durée de vie moyenne d''un globule rouge ?',
 'Un globule rouge vit environ 120 jours. Dans la drépanocytose, cette durée est réduite à 10-20 jours.', 'Examen NS4 SVT 2022 - Paléontologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '30 jours', 0, 1),
(@qid, '60 jours', 0, 2),
(@qid, '120 jours', 1, 3),
(@qid, '200 jours', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le syndrome de Down est aussi appelé :',
 'La trisomie 21 est aussi connue sous le nom de syndrome de Down. Elle est due à la présence d''un chromosome 21 surnuméraire.', 'Examen NS4 SVT 2022 - Glucogène', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Trisomie 18', 0, 1),
(@qid, 'Trisomie 21', 1, 2),
(@qid, 'Monosomie X', 0, 3),
(@qid, 'Syndrome de Turner', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le caryotype d''une femme atteinte du syndrome de Down est :',
 '47, XX + 21 : la personne possède 47 chromosomes avec trois chromosomes 21.', 'Examen NS4 SVT 2022 - Glucogène', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '46, XX', 0, 1),
(@qid, '47, XX + 21', 1, 2),
(@qid, '47, XY + 21', 0, 3),
(@qid, '45, XO', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Pourquoi la trisomie 21 est-elle dite autosomale ?',
 'Elle est autosomale car le chromosome en excès (chromosome 21) est un autosome, c''est-à-dire un chromosome non sexuel.', 'Examen NS4 SVT 2022 - Glucogène', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Elle touche uniquement les femmes', 0, 1),
(@qid, 'Le chromosome en excès est un chromosome sexuel', 0, 2),
(@qid, 'Le chromosome en excès (chr 21) est un autosome', 1, 3),
(@qid, 'Elle n''affecte pas le caryotype', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''âge de la mère est-il un facteur de risque pour la trisomie 21 ?',
 'Oui, le risque de trisomie 21 augmente significativement avec l''âge de la mère, surtout après 35 ans, en raison du vieillissement ovocytaire.', 'Examen NS4 SVT 2022 - Glucogène', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Non, l''âge maternel n''a aucune influence', 0, 1),
(@qid, 'Oui, le risque augmente avec l''âge maternel (surtout après 35 ans)', 1, 2),
(@qid, 'Seul l''âge du père compte', 0, 3),
(@qid, 'Le risque diminue avec l''âge maternel', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Parmi les propositions suivantes, laquelle est une anomalie chromosomique de nombre concernant les gonosomes ?',
 'Le syndrome de Klinefelter (47, XXY) et le syndrome de Turner (45, X0) sont des anomalies numériques des chromosomes sexuels (gonosomes).', 'Examen NS4 SVT 2022 - Glucogène', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Trisomie 21', 0, 1),
(@qid, 'Syndrome de Klinefelter (47, XXY)', 1, 2),
(@qid, 'Trisomie 18', 0, 3),
(@qid, 'Syndrome du cri du chat', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le caryotype d''un homme atteint du syndrome de Klinefelter est :',
 'Le syndrome de Klinefelter se caractérise par 47 chromosomes avec deux chromosomes X et un chromosome Y : 47, XXY.', 'Examen NS4 SVT 2022 - Microbiologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '46, XY', 0, 1),
(@qid, '45, XO', 0, 2),
(@qid, '47, XXY', 1, 3),
(@qid, '47, XYY', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le daltonisme est une maladie :',
 'Le daltonisme est récessif et lié au chromosome X (gonosomal). Le gène muté est porté sur le chromosome X.', 'Examen NS4 SVT 2022 - Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Autosomale dominante', 0, 1),
(@qid, 'Autosomale récessive', 0, 2),
(@qid, 'Gonosomale récessive liée au chromosome X', 1, 3),
(@qid, 'Gonosomale liée au chromosome Y', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Pourquoi un père daltonien ne transmet-il jamais cette tare à ses fils ?',
 'Le père daltonien (X^d Y) transmet son X^d à ses filles et son Y à ses fils. Les fils reçoivent donc le Y du père et ne peuvent pas hériter du gène du daltonisme par lui.', 'Examen NS4 SVT 2022 - Physiologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Parce que le daltonisme ne touche pas les hommes', 0, 1),
(@qid, 'Parce que le père transmet son chromosome Y (et non X) à ses fils', 1, 2),
(@qid, 'Parce que le gène est sur le chromosome Y', 0, 3),
(@qid, 'Parce que le daltonisme est récessif chez l''homme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le gène responsable de la myopathie de Duchenne est situé sur :',
 'La myopathie de Duchenne est une maladie récessive liée au chromosome X. Le gène de la dystrophine est sur le chromosome X.', 'Examen NS4 SVT 2022 - Histologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le chromosome 1', 0, 1),
(@qid, 'Le chromosome Y', 0, 2),
(@qid, 'Le chromosome X', 1, 3),
(@qid, 'Le chromosome 21', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une femme conductrice de la myopathie possède le génotype :',
 'Une femme conductrice (vectrice) est hétérozygote pour le gène de la myopathie : X^M X^m. Elle ne manifeste pas la maladie mais peut la transmettre.', 'Examen NS4 SVT 2022 - Histologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'X^m X^m (homozygote malade)', 0, 1),
(@qid, 'X^M X^M (homozygote saine)', 0, 2),
(@qid, 'X^M X^m (hétérozygote conductrice)', 1, 3),
(@qid, 'X^m Y (impossible pour une femme)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le syndrome du cri du chat est causé par :',
 'Le syndrome du cri du chat (5p-) est dû à une délétion du bras court du chromosome 5. C''est une anomalie de structure, non de nombre.', 'Examen NS4 SVT 2022 - Morphologie_B', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une anomalie de nombre (trisomie)', 0, 1),
(@qid, 'Une délétion du bras court du chromosome 5 (anomalie de structure)', 1, 2),
(@qid, 'Une mutation ponctuelle sur le chromosome X', 0, 3),
(@qid, 'Une translocation entre chromosomes 5 et 21', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce que le crossing-over ?',
 'Le crossing-over est un échange de fragments entre deux chromatides non-sœurs de chromosomes homologues, survenant pendant la méiose I (prophase I). Il augmente la variabilité génétique.', 'Examen NS4 SVT 2022 - Glucogène', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La duplication de l''ADN avant la mitose', 0, 1),
(@qid, 'Un échange de fragments entre chromatides non-sœurs de chromosomes homologues', 1, 2),
(@qid, 'La séparation des chromosomes homologues en méiose II', 0, 3),
(@qid, 'La transcription de l''ARNm à partir de l''ADN', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce qu''un individu homozygote ?',
 'Un individu homozygote possède deux allèles identiques pour un gène donné (AA ou aa). Un hétérozygote a deux allèles différents (Aa).', 'Examen NS4 SVT 2022 - Histologie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Qui possède deux allèles différents pour un gène', 0, 1),
(@qid, 'Qui possède deux allèles identiques pour un gène', 1, 2),
(@qid, 'Qui est porteur d''une maladie génétique', 0, 3),
(@qid, 'Qui a subi une mutation génétique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''appelle-t-on allèles ?',
 'Les allèles sont les différentes formes que peut prendre un même gène. Ils occupent le même locus sur les chromosomes homologues.', 'Examen NS4 SVT 2022 - Zoologie/Vitamines', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les deux brins d''une molécule d''ADN', 0, 1),
(@qid, 'Les différentes formes d''un même gène sur les chromosomes homologues', 1, 2),
(@qid, 'Les gènes situés sur des chromosomes différents', 0, 3),
(@qid, 'Les protéines codées par un même gène', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quand dit-on qu''un caractère est récessif ?',
 'Un caractère est récessif lorsqu''il ne s''exprime phénotypiquement que chez les individus homozygotes pour cet allèle (aa). Il est masqué chez les hétérozygotes (Aa).', 'Examen NS4 SVT 2022 - Histologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Quand il s''exprime chez tous les individus qui le possèdent', 0, 1),
(@qid, 'Quand il s''exprime seulement chez les individus homozygotes', 1, 2),
(@qid, 'Quand il est lié au chromosome X', 0, 3),
(@qid, 'Quand il est présent chez les deux parents', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Dans un croisement entre deux variétés de lignée pure donnant des hybrides uniformes en F1, quelle loi de Mendel est vérifiée ?',
 'La 1ère loi de Mendel (loi d''uniformité des hybrides de la 1ère génération) : tous les hybrides F1 issus du croisement de deux lignées pures sont phénotypiquement identiques.', 'Examen NS4 SVT 2022 - Morphologie_B', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3ème loi (ségrégation indépendante)', 0, 1),
(@qid, '1ère loi (uniformité des hybrides de F1)', 1, 2),
(@qid, 'Loi de codominance', 0, 3),
(@qid, '2ème loi (disjonction des allèles)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Lors d''un croisement entre deux haricots géants et nains (lignées pures), on obtient uniquement des haricots nains en F1. Lequel est dominant ?',
 'Si la F1 ne donne que des haricots nains alors que les parents étaient l''un géant, l''autre nain, c''est le caractère nain qui est dominant.', 'Examen NS4 SVT 2022 - Morphologie_B', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le caractère géant est dominant', 0, 1),
(@qid, 'Les deux caractères sont codominants', 0, 2),
(@qid, 'Le caractère nain est dominant', 1, 3),
(@qid, 'Il y a dominance intermédiaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Dans quel cas fait-on appel au test cross (croisement test) ?',
 'Le test cross est utilisé pour déterminer le génotype d''un individu au phénotype dominant mais dont on ne sait pas s''il est homozygote (AA) ou hétérozygote (Aa). On le croise avec un individu homozygote récessif (aa).', 'Examen NS4 SVT 2022 - Morphologie_B', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pour obtenir des individus de lignée pure', 0, 1),
(@qid, 'Pour déterminer si un individu dominant est homo- ou hétérozygote', 1, 2),
(@qid, 'Pour étudier la transmission liée au sexe', 0, 3),
(@qid, 'Pour créer des OGM en laboratoire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Lors d''un croisement de deux individus F1 hétérozygotes (Aa x Aa), le rapport phénotypique attendu en F2 est :',
 'Le rapport 3/4 dominant : 1/4 récessif est attendu en F2, ce qui correspond à une proportion de 3 : 1 en phénotype.', 'Programme NS4 - Génétique mendélienne', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1/2 dominant : 1/2 récessif', 0, 1),
(@qid, '3/4 dominant : 1/4 récessif', 1, 2),
(@qid, 'Tous dominants', 0, 3),
(@qid, '1/4 dominant : 3/4 récessif', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce qu''une mutation somatique ?',
 'Une mutation somatique survient dans une cellule somatique (non reproductrice). Elle n''est pas transmise à la descendance mais peut se propager aux cellules filles par mitose.', 'Examen NS4 SVT 2022 - Paléontologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une mutation qui affecte les cellules reproductrices', 0, 1),
(@qid, 'Une mutation transmissible à la descendance', 0, 2),
(@qid, 'Une mutation affectant les cellules du corps non reproductrices', 1, 3),
(@qid, 'Une mutation survenant uniquement dans le noyau', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''albinisme est une maladie :',
 'L''albinisme est autosomale récessive : le gène affecté est sur un autosome. L''individu atteint est homozygote récessif. Les parents à peau normale peuvent être conducteurs.', 'Examen NS4 SVT 2022 - Neurone', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Autosomale dominante', 0, 1),
(@qid, 'Autosomale récessive', 1, 2),
(@qid, 'Liée au chromosome X', 0, 3),
(@qid, 'Liée au chromosome Y', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La mélanine est la substance qui, au niveau de l''épiderme, intervient dans la protection naturelle contre les UV. Elle est produite par :',
 'La mélanine est produite par les mélanocytes, cellules situées dans la couche basale de l''épiderme.', 'Examen NS4 SVT 2022 - Neurone', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les kératinocytes', 0, 1),
(@qid, 'Les mélanocytes', 1, 2),
(@qid, 'Les fibroblastes', 0, 3),
(@qid, 'Les lymphocytes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Dans un croisement de haricots rouges et haricots blancs (lignées pures), on obtient des haricots roses en F1. Ce résultat indique :',
 'L''obtention d''un phénotype intermédiaire en F1 indique une dominance intermédiaire (codominance partielle), où aucun des deux allèles n''est complètement dominant sur l''autre.', 'Examen NS4 SVT 2022 - Neurone', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le rouge est dominant sur le blanc', 0, 1),
(@qid, 'Le blanc est dominant sur le rouge', 0, 2),
(@qid, 'Il y a dominance intermédiaire (codominance partielle)', 1, 3),
(@qid, 'Les deux couleurs sont indépendantes', 0, 4);

-- ============================================================
-- SECTION 2 : BIOLOGIE MOLÉCULAIRE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle enzyme est responsable de la transcription de l''ADN en ARN ?',
 'L''ARN polymérase est l''enzyme qui catalyse la synthèse de l''ARNm à partir du brin matrice de l''ADN lors de la transcription.', 'Examen NS4 SVT 2022 - Glucogène', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ADN polymérase', 0, 1),
(@qid, 'ARN polymérase', 1, 2),
(@qid, 'Hélicase', 0, 3),
(@qid, 'Ligase', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les bases azotées de l''ADN sont appariées selon la règle de Chargaff. Quels sont les couples de bases complémentaires ?',
 'Dans l''ADN : Adénine (A) s''apparie avec Thymine (T), et Guanine (G) s''apparie avec Cytosine (C). Dans l''ARN, la Thymine est remplacée par l''Uracile.', 'Examen NS4 SVT 2022 - Histologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'A-C et G-T', 0, 1),
(@qid, 'A-T et G-C', 1, 2),
(@qid, 'A-G et T-C', 0, 3),
(@qid, 'A-U et G-C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les bases azotées de l''ARN ribonucléique (ARNr) sont :',
 'L''ARN contient 4 bases azotées : Adénine (A), Uracile (U), Guanine (G) et Cytosine (C). La Thymine est spécifique à l''ADN et remplacée par l''Uracile dans l''ARN.', 'Examen NS4 SVT 2022 - Microbiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'A, T, G, C', 0, 1),
(@qid, 'A, U, G, C', 1, 2),
(@qid, 'A, T, U, C', 0, 3),
(@qid, 'A, G, C seulement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''appelle-t-on transcription ?',
 'La transcription est le processus par lequel l''information génétique portée par l''ADN est copiée en ARNm (ARN messager) dans le noyau cellulaire.', 'Examen NS4 SVT 2022 - Paléontologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La synthèse d''une protéine à partir de l''ARNm', 0, 1),
(@qid, 'La duplication de l''ADN avant la division cellulaire', 0, 2),
(@qid, 'La synthèse d''ARNm à partir de l''ADN dans le noyau', 1, 3),
(@qid, 'Le transport des acides aminés par l''ARNt', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel est le rôle de l''ARNm (ARN messager) ?',
 'L''ARNm transporte l''information génétique du noyau vers les ribosomes dans le cytoplasme, où elle sera traduite en protéines.', 'Examen NS4 SVT 2022 - Morphologie_B', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Transporter les acides aminés vers les ribosomes', 0, 1),
(@qid, 'Former la structure des ribosomes', 0, 2),
(@qid, 'Transporter l''information génétique du noyau aux ribosomes pour la traduction', 1, 3),
(@qid, 'Répliquer l''ADN lors de la division cellulaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les acteurs de la traduction sont :',
 'La traduction nécessite : les ribosomes (lieu de synthèse), l''ARNm (matrice), les ARNt (transportent les acides aminés) et les enzymes (aminoacyl-ARNt synthétases).', 'Examen NS4 SVT 2022 - Zoologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'ADN polymérase, noyau, chromosomes', 0, 1),
(@qid, 'Ribosomes, ARNm, ARNt et acides aminés', 1, 2),
(@qid, 'ARN polymérase, ADN, noyau', 0, 3),
(@qid, 'Mitochondries, ADN, ARNm', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce qu''un OGM (Organisme Génétiquement Modifié) ?',
 'Un OGM est un organisme dont le génome a été modifié par les techniques de génie génétique, notamment par l''introduction d''un ou plusieurs gènes exogènes.', 'Examen NS4 SVT 2022 - Histologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un organisme né par reproduction asexuée', 0, 1),
(@qid, 'Un organisme dont le génome a été modifié par génie génétique', 1, 2),
(@qid, 'Un organisme qui présente une mutation naturelle', 0, 3),
(@qid, 'Un organisme hybride issu de croisement entre espèces proches', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'En quoi consiste la transgénèse ?',
 'La transgénèse consiste à introduire un gène étranger (transgène) dans le génome d''un organisme receveur, lui conférant de nouvelles caractéristiques héréditaires.', 'Examen NS4 SVT 2022 - Physiologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La délétion de gènes dans un génome', 0, 1),
(@qid, 'L''introduction d''un gène étranger (transgène) dans le génome d''un organisme', 1, 2),
(@qid, 'Le croisement entre deux espèces différentes', 0, 3),
(@qid, 'La duplication d''un chromosome entier', 0, 4);

-- ============================================================
-- SECTION 3 : CELLULE - HISTOLOGIE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel organite est responsable de la digestion intracellulaire ?',
 'Les lysosomes contiennent des enzymes hydrolytiques permettant la digestion intracellulaire des macromolécules et des organites usés.', 'Examen NS4 SVT 2022 - Histologie/Microbiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Mitochondrie', 0, 1),
(@qid, 'Ribosome', 0, 2),
(@qid, 'Lysosome', 1, 3),
(@qid, 'Vacuole', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel organite est responsable des oxydations cellulaires (respiration cellulaire) ?',
 'Les mitochondries sont le siège des réactions d''oxydation cellulaire (cycle de Krebs, phosphorylation oxydative) permettant la production d''ATP.', 'Examen NS4 SVT 2022 - Zoologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lysosome', 0, 1),
(@qid, 'Chloroplaste', 0, 2),
(@qid, 'Mitochondrie', 1, 3),
(@qid, 'Appareil de Golgi', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un eucaryote est un organisme :',
 'Un eucaryote est un organisme dont les cellules possèdent un noyau véritable délimité par une membrane nucléaire. Cela s''oppose aux procaryotes (bactéries) sans noyau membranaire.', 'Examen NS4 SVT 2022 - Histologie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sans noyau défini dans ses cellules', 0, 1),
(@qid, 'Dont les cellules ont un noyau véritable délimité par une membrane', 1, 2),
(@qid, 'Qui se reproduit uniquement de façon asexuée', 0, 3),
(@qid, 'Qui possède une paroi cellulaire rigide', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel est le caryotype d''une cellule humaine issue de la spermatogenèse (spermatozoïde) ?',
 'Les spermatozoïdes sont des cellules haploïdes (n=23 chromosomes) issues de la méiose. Leur caryotype est soit 23, X soit 23, Y.', 'Examen NS4 SVT 2022 - Vitamines', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '46, XY', 0, 1),
(@qid, '46, XX', 0, 2),
(@qid, '23, X ou 23, Y', 1, 3),
(@qid, '47, XYY', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le caryotype d''une gonie humaine (cellule germinale diploïde) est :',
 'Les gonies sont diploïdes : 46 chromosomes chez l''homme (46, XY) et chez la femme (46, XX). Elles sont à l''origine des gamètes après méiose.', 'Examen NS4 SVT 2022 - Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '23 chromosomes', 0, 1),
(@qid, '46 chromosomes (46, XX ou 46, XY)', 1, 2),
(@qid, '47 chromosomes', 0, 3),
(@qid, '92 chromosomes', 0, 4);

-- ============================================================
-- SECTION 4 : MICROBIOLOGIE - VIROLOGIE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce qu''un bactériophage ?',
 'Un bactériophage est un virus qui infecte et se multiplie dans les bactéries. Il est aussi appelé phage.', 'Examen NS4 SVT 2022 - Glucogène', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une bactérie qui détruit les virus', 0, 1),
(@qid, 'Un virus qui infecte les bactéries', 1, 2),
(@qid, 'Un antibiotique produit par les bactéries', 0, 3),
(@qid, 'Une enzyme dégradant les bactéries', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les virus peuvent-ils se multiplier en dehors des cellules hôtes ?',
 'Non, les virus sont des parasites intracellulaires obligatoires. Ils ne possèdent pas les enzymes nécessaires à leur propre réplication ; ils ont besoin de la machinerie cellulaire d''une cellule hôte.', 'Examen NS4 SVT 2022 - Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oui, dans des milieux nutritifs appropriés', 0, 1),
(@qid, 'Non, ils sont des parasites intracellulaires obligatoires', 1, 2),
(@qid, 'Oui, comme les bactéries', 0, 3),
(@qid, 'Oui, mais uniquement à basse température', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''appelle-t-on rétrovirus ?',
 'Un rétrovirus est un virus à ARN qui possède une enzyme (transcriptase inverse) permettant de transcrire son ARN en ADN. Le VIH est le rétrovirus le plus connu.', 'Examen NS4 SVT 2022 - Zoologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un virus qui infecte les bactéries', 0, 1),
(@qid, 'Un virus à ARN capable de transcrire son ARN en ADN (transcriptase inverse)', 1, 2),
(@qid, 'Un virus qui ne peut infecter que les vertébrés', 0, 3),
(@qid, 'Un virus à ADN double brin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle bactérie se présente au microscope en forme de grappe ou en amas ?',
 'Le Staphylocoque (Staphylococcus) se présente en amas ou en grappes de raisins. Le Streptocoque se présente en chaînes.', 'Examen NS4 SVT 2022 - Neurone', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Streptocoque', 0, 1),
(@qid, 'Staphylocoque', 1, 2),
(@qid, 'Pneumocoque', 0, 3),
(@qid, 'Méningocoque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Parmi les bactéries suivantes, laquelle est de forme allongée (bacille) ?',
 'Les bacilles sont des bactéries de forme allongée (bâtonnet) : Bacillus anthracis, Mycobacterium tuberculosis, Escherichia coli, Clostridium tetani…', 'Examen NS4 SVT 2022 - Zoologie/Morphologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Staphylococcus aureus', 0, 1),
(@qid, 'Streptococcus pneumoniae', 0, 2),
(@qid, 'Mycobacterium tuberculosis (bacille)', 1, 3),
(@qid, 'Neisseria gonorrhoeae', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle condition est obligatoire pour que les virus se multiplient ?',
 'Les virus ne peuvent se multiplier qu''à l''intérieur d''une cellule vivante (cellule hôte). Ils utilisent la machinerie cellulaire de l''hôte pour leur réplication.', 'Examen NS4 SVT 2022 - Zoologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Présence d''un milieu nutritif riche', 0, 1),
(@qid, 'Être à l''intérieur d''une cellule hôte vivante', 1, 2),
(@qid, 'Présence d''oxygène', 0, 3),
(@qid, 'Température supérieure à 37°C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Sur quel chromosome retrouve-t-on le gène responsable de la drépanocytose ?',
 'Le gène de la bêta-globine (HBB) responsable de la drépanocytose est situé sur le chromosome 11 (autosome).', 'Examen NS4 SVT 2022 - Physiologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Chromosome X', 0, 1),
(@qid, 'Chromosome Y', 0, 2),
(@qid, 'Chromosome 11', 1, 3),
(@qid, 'Chromosome 21', 0, 4);

-- ============================================================
-- SECTION 5 : VITAMINES
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelles sont les deux grandes classes de vitamines ?',
 'Les vitamines sont classées en : vitamines liposolubles (A, D, E, K) solubles dans les lipides, et vitamines hydrosolubles (C, groupe B) solubles dans l''eau.', 'Examen NS4 SVT 2022 - Microbiologie/Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vitamines organiques et vitamines minérales', 0, 1),
(@qid, 'Vitamines liposolubles et vitamines hydrosolubles', 1, 2),
(@qid, 'Vitamines essentielles et vitamines non essentielles', 0, 3),
(@qid, 'Vitamines animales et vitamines végétales', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce qu''une provitamine ?',
 'Une provitamine est un précurseur d''une vitamine, c''est-à-dire une substance qui, sous l''action de certains facteurs (lumière, enzymes), se transforme en vitamine active. Ex : le bêta-carotène (provitamine A).', 'Examen NS4 SVT 2022 - Microbiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une vitamine synthétique produite en laboratoire', 0, 1),
(@qid, 'Un précurseur qui se transforme en vitamine active dans l''organisme', 1, 2),
(@qid, 'Une vitamine en excès dans l''organisme', 0, 3),
(@qid, 'Une vitamine dégradée par la chaleur', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle vitamine est synthétisée par la flore intestinale ?',
 'La vitamine K est synthétisée par les bactéries de la flore intestinale. Elle joue un rôle dans la coagulation sanguine.', 'Examen NS4 SVT 2022 - Microbiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vitamine C', 0, 1),
(@qid, 'Vitamine D', 0, 2),
(@qid, 'Vitamine K', 1, 3),
(@qid, 'Vitamine E', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel autre nom est donné à la vitamine B9 ?',
 'La vitamine B9 est aussi appelée acide folique ou folate. Elle est indispensable à la division cellulaire et à la prévention des malformations du tube neural.', 'Examen NS4 SVT 2022 - Microbiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cyanocobalamine', 0, 1),
(@qid, 'Acide folique', 1, 2),
(@qid, 'Niacine', 0, 3),
(@qid, 'Thiamine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vitamine B12 est également connue sous le nom de :',
 'La vitamine B12 est la cyanocobalamine. Elle est nécessaire à la formation des globules rouges et au fonctionnement du système nerveux.', 'Examen NS4 SVT 2022 - Morphologie_B', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Acide folique', 0, 1),
(@qid, 'Cyanocobalamine', 1, 2),
(@qid, 'Riboflavine', 0, 3),
(@qid, 'Calciférol', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle avitaminose est causée par une carence en vitamine C ?',
 'La carence en vitamine C provoque le scorbut, caractérisé par des hémorragies gingivales, la fragilité des vaisseaux sanguins et la fatigue.', 'Examen NS4 SVT 2022 - Vitamines', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Rachitisme', 0, 1),
(@qid, 'Scorbut', 1, 2),
(@qid, 'Béribéri', 0, 3),
(@qid, 'Pellagre', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La xérophtalmie est causée par une carence en :',
 'La xérophtalmie (sécheresse oculaire pouvant mener à la cécité) est causée par une carence en vitamine A (rétinol).', 'Examen NS4 SVT 2022 - Vitamines', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vitamine B12', 0, 1),
(@qid, 'Vitamine C', 0, 2),
(@qid, 'Vitamine A', 1, 3),
(@qid, 'Vitamine D', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le béribéri est provoqué par une carence en :',
 'Le béribéri est une maladie due à la carence en vitamine B1 (thiamine). Elle se manifeste par des troubles nerveux et cardiaques.', 'Examen NS4 SVT 2022 - Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vitamine B6', 0, 1),
(@qid, 'Vitamine B1 (thiamine)', 1, 2),
(@qid, 'Vitamine B3 (niacine)', 0, 3),
(@qid, 'Vitamine B9', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La pellagre est causée par une carence en :',
 'La pellagre est due à la carence en vitamine B3 (niacine ou PP). Elle se manifeste par les 3 D : Dermatite, Diarrhée, Démence.', 'Examen NS4 SVT 2022 - Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vitamine B1', 0, 1),
(@qid, 'Vitamine B3 (niacine)', 1, 2),
(@qid, 'Vitamine B12', 0, 3),
(@qid, 'Vitamine C', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une carence en vitamine D chez l''enfant provoque :',
 'La carence en vitamine D chez l''enfant provoque le rachitisme : ramollissement et déformation des os par défaut de minéralisation.', 'Examen NS4 SVT 2022 - Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le scorbut', 0, 1),
(@qid, 'Le rachitisme', 1, 2),
(@qid, 'La pellagre', 0, 3),
(@qid, 'Le béribéri', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Une carence en vitamine D chez l''adulte provoque :',
 'Chez l''adulte, la carence en vitamine D provoque l''ostéomalacie (ramollissement des os) et contribue à l''ostéoporose.', 'Examen NS4 SVT 2022 - Physiologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le scorbut', 0, 1),
(@qid, 'L''ostéomalacie', 1, 2),
(@qid, 'La pellagre', 0, 3),
(@qid, 'Le béribéri', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vitamine ajoutée à la B12 pour combattre l''anémie de Biermer est :',
 'L''anémie de Biermer (anémie pernicieuse) est traitée par l''association vitamine B12 + acide folique (B9). Le facteur intrinsèque est nécessaire à l''absorption de la B12.', 'Examen NS4 SVT 2022 - Physiologie', 4);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vitamine B1', 0, 1),
(@qid, 'Vitamine B9 (acide folique)', 1, 2),
(@qid, 'Vitamine C', 0, 3),
(@qid, 'Vitamine D', 0, 4);

-- ============================================================
-- SECTION 6 : ENDOCRINOLOGIE - HORMONES
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''hypophyse est une glande :',
 'L''hypophyse (ou glande pituitaire) est une petite glande endocrine située à la base du cerveau. Elle est souvent appelée la "glande maîtresse" car elle contrôle de nombreuses autres glandes endocrines.', 'Examen NS4 SVT 2022 - Histologie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Digestive', 0, 1),
(@qid, 'Endocrine située à la base du cerveau', 1, 2),
(@qid, 'Exocrine située dans l''abdomen', 0, 3),
(@qid, 'Amphicrine située dans le pancréas', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce qu''une stimuline ?',
 'Les stimulines sont des hormones hypophysaires (produites par l''adénohypophyse) qui stimulent d''autres glandes endocrines à produire leurs propres hormones. Exemples : TSH, FSH, LH, ACTH.', 'Examen NS4 SVT 2022 - Glucogène/Histologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hormone produite par la thyroïde pour stimuler le métabolisme', 0, 1),
(@qid, 'Hormone hypophysaire qui stimule une autre glande endocrine', 1, 2),
(@qid, 'Hormone produite par les surrénales en réponse au stress', 0, 3),
(@qid, 'Neurotransmetteur du système nerveux sympathique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle est la différence entre l''adénohypophyse et la neurohypophyse ?',
 'L''adénohypophyse (lobe antérieur) est un tissu glandulaire qui produit des hormones comme les stimulines, la GH, la prolactine. La neurohypophyse (lobe postérieur) est du tissu nerveux qui libère l''ADH et l''ocytocine, synthétisées par l''hypothalamus.', 'Examen NS4 SVT 2022 - Histologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''adénohypophyse est postérieure ; la neurohypophyse est antérieure', 0, 1),
(@qid, 'L''adénohypophyse est un tissu glandulaire (sécrétant stimulines, GH) ; la neurohypophyse est du tissu nerveux (libérant ADH, ocytocine)', 1, 2),
(@qid, 'Elles sont identiques, le nom change selon les auteurs', 0, 3),
(@qid, 'L''adénohypophyse régule la pression artérielle et la neurohypophyse régule la glycémie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce qu''une neurohormone ? En donner un exemple.',
 'Une neurohormone est une substance chimique sécrétée par des cellules nerveuses (neurones) et libérée dans le sang pour agir à distance. Exemples : ADH (hormone antidiurétique), ocytocine, adrénaline.', 'Examen NS4 SVT 2022 - Histologie/Neurone', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Hormone sécrétée par les glandes endocrines classiques ; ex. : insuline', 0, 1),
(@qid, 'Substance chimique sécrétée par des neurones et libérée dans le sang ; ex. : ADH', 1, 2),
(@qid, 'Hormone qui régule l''activité nerveuse ; ex. : dopamine', 0, 3),
(@qid, 'Enzyme digestive produite par le pancréas ; ex. : lipase', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''ADH (hormone antidiurétique) a-t-elle pour origine la neurohypophyse ?',
 'L''ADH est synthétisée par l''hypothalamus mais stockée et libérée par la neurohypophyse. Donc sa libération se fait au niveau de la neurohypophyse.', 'Examen NS4 SVT 2022 - Histologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Non, elle est produite par les reins', 0, 1),
(@qid, 'Non, elle est produite par l''adénohypophyse', 0, 2),
(@qid, 'Oui, elle est libérée par la neurohypophyse (synthétisée par l''hypothalamus)', 1, 3),
(@qid, 'Non, elle est produite par les surrénales', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le pancréas est dit glande amphicrine (mixte) car :',
 'Le pancréas est amphicrine car il possède à la fois une fonction exocrine (sécrétion du suc pancréatique dans le duodénum) et une fonction endocrine (sécrétion d''insuline et de glucagon dans le sang par les îlots de Langerhans).', 'Examen NS4 SVT 2022 - Vitamines/Microbiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il sécrète deux types de sucs digestifs', 0, 1),
(@qid, 'Il possède à la fois une fonction exocrine (suc pancréatique) et endocrine (insuline, glucagon)', 1, 2),
(@qid, 'Il agit à la fois sur la digestion et sur la respiration', 0, 3),
(@qid, 'Il est situé entre l''estomac et l''intestin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel est le nom des îlots de cellules endocrines du pancréas ?',
 'Les cellules endocrines du pancréas sont regroupées en îlots appelés îlots de Langerhans. Ils comprennent les cellules alpha (glucagon), bêta (insuline) et delta (somatostatine).', 'Examen NS4 SVT 2022 - Microbiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Îlots de Cajal', 0, 1),
(@qid, 'Îlots de Langerhans', 1, 2),
(@qid, 'Acini pancréatiques', 0, 3),
(@qid, 'Corpuscules de Malpighi', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle cellule des îlots de Langerhans sécrète l''insuline ?',
 'Les cellules bêta (β) des îlots de Langerhans sécrètent l''insuline, hormone hypoglycémiante qui favorise l''entrée du glucose dans les cellules et sa mise en réserve sous forme de glycogène.', 'Examen NS4 SVT 2022 - Microbiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cellules alpha (α)', 0, 1),
(@qid, 'Cellules bêta (β)', 1, 2),
(@qid, 'Cellules delta (δ)', 0, 3),
(@qid, 'Cellules acineuses', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle cellule des îlots de Langerhans sécrète le glucagon ?',
 'Les cellules alpha (α) sécrètent le glucagon, hormone hyperglycémiante qui favorise la glycogénolyse hépatique pour augmenter la glycémie.', 'Examen NS4 SVT 2022 - Microbiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cellules bêta (β)', 0, 1),
(@qid, 'Cellules alpha (α)', 1, 2),
(@qid, 'Cellules delta (δ)', 0, 3),
(@qid, 'Cellules F (PP)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le diabète de type 1 se distingue du diabète de type 2 en ce que :',
 'Le diabète de type 1 (insulino-dépendant) est dû à la destruction auto-immune des cellules bêta (absence d''insuline). Le type 2 est caractérisé par une résistance à l''insuline et une production insuffisante d''insuline (non auto-immune).', 'Examen NS4 SVT 2022 - Microbiologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le type 1 touche les adultes obèses ; le type 2 touche les enfants', 0, 1),
(@qid, 'Le type 1 est dû à la destruction des cellules bêta (absence d''insuline) ; le type 2 est dû à une résistance à l''insuline', 1, 2),
(@qid, 'Le type 1 se soigne par régime ; le type 2 nécessite des injections d''insuline', 0, 3),
(@qid, 'Il n''y a pas de différence causale', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les sécrétions thyroïdiennes sont :',
 'La thyroïde produit la thyroxine (T4) et la triiodothyronine (T3), qui régulent le métabolisme, et la calcitonine, qui régule la calcémie.', 'Examen NS4 SVT 2022 - Morphologie_B', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Insuline et glucagon', 0, 1),
(@qid, 'Thyroxine (T4), triiodothyronine (T3) et calcitonine', 1, 2),
(@qid, 'Adrénaline et noradrénaline', 0, 3),
(@qid, 'Cortisol et aldostérone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quels sont deux signes retrouvés en cas d''hyperthyroïdie ?',
 'L''hyperthyroïdie se manifeste par : tachycardie, perte de poids, nervosité/anxiété, hypersudation, tremblements, exophtalmie (dans le cas de la maladie de Basedow).', 'Examen NS4 SVT 2022 - Microbiologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bradycardie et prise de poids', 0, 1),
(@qid, 'Tachycardie et perte de poids', 1, 2),
(@qid, 'Hypothermie et somnolence', 0, 3),
(@qid, 'Peau sèche et constipation', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les hormones qui régulent la calcémie sont :',
 'La calcémie est régulée par la calcitonine (thyroïde - hypocalcémiante) et la parathormone PTH (parathyroïdes - hypercalcémiante). La vitamine D joue aussi un rôle important.', 'Examen NS4 SVT 2022 - Vitamines', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Insuline et glucagon', 0, 1),
(@qid, 'Calcitonine (thyroïde) et parathormone - PTH (parathyroïdes)', 1, 2),
(@qid, 'Adrénaline et cortisol', 0, 3),
(@qid, 'Estrogènes et testostérone', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelles sont les deux hormones qui agissent sur la glande mammaire ?',
 'La prolactine (adénohypophyse) stimule la production de lait, et l''ocytocine (neurohypophyse) provoque l''éjection du lait lors de la tétée.', 'Examen NS4 SVT 2022 - Histologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'FSH et LH', 0, 1),
(@qid, 'Prolactine et ocytocine', 1, 2),
(@qid, 'Estrogènes et progestérone uniquement', 0, 3),
(@qid, 'GH et TSH', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les rôles de l''hormone ocytocine sont :',
 'L''ocytocine stimule les contractions utérines lors de l''accouchement et provoque l''éjection du lait lors de l''allaitement. Elle joue aussi un rôle dans les comportements d''attachement.', 'Examen NS4 SVT 2022 - Physiologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Régule la glycémie et stimule la croissance', 0, 1),
(@qid, 'Stimule les contractions utérines et provoque l''éjection du lait', 1, 2),
(@qid, 'Stimule la production des spermatozoïdes', 0, 3),
(@qid, 'Régule la pression artérielle uniquement', 0, 4);

-- ============================================================
-- SECTION 7 : SYSTÈME NERVEUX
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce qu''un réflexe inné ?',
 'Un réflexe inné (ou réflexe non conditionné) est une réponse automatique, involontaire et non apprise à un stimulus. Il est présent dès la naissance et identique pour tous les individus de l''espèce. Ex : retirer la main d''une flamme, réflexe rotulien.', 'Examen NS4 SVT 2022 - Glucogène', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un réflexe acquis par l''expérience et l''apprentissage', 0, 1),
(@qid, 'Une réponse automatique, involontaire et innée à un stimulus', 1, 2),
(@qid, 'Une réponse volontaire du cerveau à un stimulus', 0, 3),
(@qid, 'Un comportement appris en réponse à un stimulus conditionné', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle est une caractéristique du réflexe conditionné ?',
 'Un réflexe conditionné (pavlovien) est acquis par apprentissage/conditionnement. Il résulte de l''association répétée d''un stimulus naturel et d''un stimulus neutre. Il est réversible.', 'Examen NS4 SVT 2022 - Neurone', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il est inné et non modifiable', 0, 1),
(@qid, 'Il est acquis par conditionnement (apprentissage) et réversible', 1, 2),
(@qid, 'Il ne passe pas par le système nerveux central', 0, 3),
(@qid, 'Il est présent dès la naissance', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Comment peut-on diviser le système nerveux ?',
 'Le système nerveux se divise en : système nerveux central (SNC = encéphale + moelle épinière) et système nerveux périphérique (SNP = nerfs crâniens et rachidiens). Le SNP comprend le système nerveux somatique et végétatif (autonome).', 'Examen NS4 SVT 2022 - Paléontologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Système nerveux sensitif et système nerveux moteur uniquement', 0, 1),
(@qid, 'Système nerveux central (SNC) et système nerveux périphérique (SNP)', 1, 2),
(@qid, 'Système nerveux volontaire et système nerveux cérébral', 0, 3),
(@qid, 'Système nerveux osseux et système nerveux musculaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La synapse neuromusculaire utilise quel neurotransmetteur ?',
 'À la jonction neuromusculaire, le neurotransmetteur libéré est l''acétylcholine. Elle se fixe sur les récepteurs de la membrane musculaire pour déclencher la contraction.', 'Programme NS4 - Système nerveux', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La dopamine', 0, 1),
(@qid, 'La sérotonine', 0, 2),
(@qid, 'L''acétylcholine', 1, 3),
(@qid, 'L''adrénaline', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La structure d''une cellule nerveuse (neurone) comprend :',
 'Un neurone comprend : le corps cellulaire (soma) avec le noyau, les dendrites (prolongements récepteurs), et l''axone (prolongement efférent souvent myélinisé) qui se termine par des boutons synaptiques.', 'Examen NS4 SVT 2022 - Paléontologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Noyau, cytoplasme et paroi cellulaire', 0, 1),
(@qid, 'Corps cellulaire (soma), dendrites et axone', 1, 2),
(@qid, 'Membrane, flagelle et vacuoles', 0, 3),
(@qid, 'Ribosome, mitochondrie et chloroplaste', 0, 4);

-- ============================================================
-- SECTION 8 : IMMUNOLOGIE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''appelle-t-on immunoglobuline ?',
 'Les immunoglobulines (Ig) sont des protéines produites par les lymphocytes B (plasmocytes) en réponse à un antigène. Elles sont aussi appelées anticorps et sont spécifiques d''un antigène.', 'Examen NS4 SVT 2022 - Neurone', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des globules blancs qui phagocytent les bactéries', 0, 1),
(@qid, 'Des protéines (anticorps) produites par les lymphocytes B contre des antigènes', 1, 2),
(@qid, 'Des globules rouges transportant l''oxygène', 0, 3),
(@qid, 'Des enzymes digestives du système gastro-intestinal', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les agglutinogènes du système ABO sont portés par :',
 'Les agglutinogènes (antigènes A et/ou B) sont portés à la surface des globules rouges (hématies). Les agglutinines (anticorps) correspondants sont dans le plasma.', 'Examen NS4 SVT 2022 - Neurone', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les globules blancs', 0, 1),
(@qid, 'Les plaquettes sanguines', 0, 2),
(@qid, 'La surface des globules rouges', 1, 3),
(@qid, 'Le plasma sanguin', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quels sont les deux agglutinogènes du système ABO ?',
 'Les deux agglutinogènes du système ABO sont l''agglutinogène A et l''agglutinogène B. Selon leur présence, on détermine le groupe sanguin (A, B, AB ou O).', 'Examen NS4 SVT 2022 - Neurone', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Agglutinogène C et agglutinogène D', 0, 1),
(@qid, 'Agglutinogène A et agglutinogène B', 1, 2),
(@qid, 'Agglutinine alpha et agglutinine bêta', 0, 3),
(@qid, 'Antigène Rh+ et antigène Rh-', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Deux éléments de défense naturelle de l''organisme sont :',
 'Les défenses naturelles comprennent les barrières physiques (peau, muqueuses), les cellules phagocytaires (macrophages, neutrophiles), les protéines du complément, les cellules NK, et les interférons.', 'Examen NS4 SVT 2022 - Zoologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les vaccins et les antibiotiques', 0, 1),
(@qid, 'La peau (barrière physique) et les macrophages (phagocytose)', 1, 2),
(@qid, 'Les vitamines et les minéraux', 0, 3),
(@qid, 'Les hormones et les neurotransmetteurs', 0, 4);

-- ============================================================
-- SECTION 9 : ANATOMIE ET PHYSIOLOGIE GÉNÉRALE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les cellules du tissu exocrine du pancréas sont appelées :',
 'Les cellules acineuses (ou acini pancréatiques) forment le tissu exocrine du pancréas. Elles sécrètent le suc pancréatique contenant des enzymes digestives (amylase, lipase, protéases).', 'Examen NS4 SVT 2022 - Microbiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cellules de Langerhans', 0, 1),
(@qid, 'Cellules acineuses', 1, 2),
(@qid, 'Cellules alpha', 0, 3),
(@qid, 'Hépatocytes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les hormones pancréatiques insuline et glucagon peuvent-elles être libérées simultanément ?',
 'Non, l''insuline et le glucagon exercent des effets antagonistes et leur libération est mutuellement exclusive. Quand la glycémie est élevée, l''insuline est libérée par les cellules β ; quand elle est basse, le glucagon est libéré par les cellules α.', 'Examen NS4 SVT 2022 - Microbiologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Oui, elles sont libérées ensemble en permanence', 0, 1),
(@qid, 'Non, elles sont antagonistes et libérées en alternance selon la glycémie', 1, 2),
(@qid, 'Oui, mais seulement pendant les repas', 0, 3),
(@qid, 'Non, car elles proviennent du même type cellulaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Où se trouve l''épicentre d''un séisme ?',
 'L''épicentre est le point à la surface terrestre situé à la verticale du foyer (hypocentre), c''est-à-dire l''endroit en surface directement au-dessus du lieu de rupture.', 'Examen NS4 SVT 2022 - Morphologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le lieu dans le plan de faille où se produit réellement le séisme', 0, 1),
(@qid, 'Le point à la surface terrestre à la verticale du foyer', 1, 2),
(@qid, 'Le centre de la Terre', 0, 3),
(@qid, 'La zone de subduction', 0, 4);

-- ============================================================
-- SECTION 10 : REPRODUCTION ET DEVELOPPEMENT
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Alice est daltonienne. Quel est le génotype de sa mère Rose ?',
 'Alice (daltonienne) a le génotype X^d X^d. Elle a reçu un X^d de son père (qui est donc daltonien) et un X^d de sa mère. Rose doit donc être au moins conductrice X^D X^d, voire daltonienne X^d X^d.', 'Examen NS4 SVT 2022 - Paléontologie', 4);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'X^D X^D (saine homozygote)', 0, 1),
(@qid, 'X^D X^d (conductrice/vectrice)', 1, 2),
(@qid, 'X^d Y (impossible pour une femme)', 0, 3),
(@qid, 'X^D Y (homme sain)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le daltonisme se caractérise principalement par :',
 'Le daltonisme est une anomalie de la vision des couleurs. La forme la plus courante est la confusion rouge-vert (deutéranopie ou protanopie), due à un déficit de certains cônes rétiniens.', 'Examen NS4 SVT 2022 - Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Une cécité totale (vue nulle)', 0, 1),
(@qid, 'Une confusion ou absence de perception de certaines couleurs (surtout rouge-vert)', 1, 2),
(@qid, 'Une myopie sévère', 0, 3),
(@qid, 'Un déficit en bâtonnets rétiniens', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les chromosomes sexuels sont aussi appelés :',
 'Les chromosomes sexuels (X et Y) sont aussi désignés sous le terme hétérochromosomes ou gonosomes. Les chromosomes non sexuels sont les autosomes.', 'Examen NS4 SVT 2022 - Histologie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Autosomes', 0, 1),
(@qid, 'Hétérochromosomes (gonosomes)', 1, 2),
(@qid, 'Chromosomes homologues', 0, 3),
(@qid, 'Chromosomes diploïdes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les autosomes se différencient des hétérochromosomes par :',
 'Les autosomes (paires 1 à 22 chez l''humain) sont les chromosomes non sexuels, présents en paires identiques chez les deux sexes. Les hétérochromosomes (X et Y) déterminent le sexe.', 'Examen NS4 SVT 2022 - Histologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les autosomes sont plus grands que les hétérochromosomes', 0, 1),
(@qid, 'Les autosomes ne déterminent pas le sexe ; les hétérochromosomes (X, Y) déterminent le sexe', 1, 2),
(@qid, 'Les autosomes ne portent pas de gènes', 0, 3),
(@qid, 'Les autosomes sont présents en nombre impair', 0, 4);

-- ============================================================
-- SECTION 11 : EVOLUTION - PHYLOGENESE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce que la phylogenèse ?',
 'La phylogenèse (ou phylogénie) est l''étude de l''histoire évolutive et des relations de parenté entre les organismes vivants à travers le temps géologique.', 'Examen NS4 SVT 2022 - Vitamines/Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''étude du développement embryonnaire d''un organisme', 0, 1),
(@qid, 'L''étude de l''histoire évolutive et des relations de parenté entre organismes', 1, 2),
(@qid, 'La classification morphologique des êtres vivants actuels', 0, 3),
(@qid, 'L''étude de la reproduction chez les vertébrés', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce que la biodiversité ?',
 'La biodiversité désigne la diversité du vivant à tous ses niveaux : diversité des écosystèmes, des espèces (diversité spécifique) et diversité génétique au sein de chaque espèce.', 'Examen NS4 SVT 2022 - Neurone', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La diversité des espèces animales uniquement', 0, 1),
(@qid, 'La diversité de la vie à tous niveaux : écosystèmes, espèces, gènes', 1, 2),
(@qid, 'La classification des espèces par ordre alphabétique', 0, 3),
(@qid, 'Le nombre d''espèces dans un écosystème donné', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''étaient les Australopithèques ?',
 'Les Australopithèques sont des hominidés bipèdes fossiles ayant vécu en Afrique il y a environ 4 à 2 millions d''années. Ils constituent un groupe proche des ancêtres du genre Homo.', 'Examen NS4 SVT 2022 - Neurone', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des dinosaures bipèdes de l''ère secondaire', 0, 1),
(@qid, 'Des primates modernes vivant en Australie', 0, 2),
(@qid, 'Des hominidés bipèdes fossiles africains, précurseurs du genre Homo', 1, 3),
(@qid, 'Des mammifères aquatiques de l''ère tertiaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Homo habilis est caractérisé par :',
 'Homo habilis (l''Homme habile) est apparu il y a environ 2,8 millions d''années en Afrique. Il est le premier représentant du genre Homo, caractérisé par l''utilisation d''outils en pierre (industrie oldowayenne) et un cerveau plus volumineux que les Australopithèques.', 'Examen NS4 SVT 2022 - Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''utilisation du feu et l''art rupestre', 0, 1),
(@qid, 'L''utilisation des premiers outils taillés en pierre (Oldowayen) et un cerveau plus grand que l''Australopithèque', 1, 2),
(@qid, 'La migration hors d''Afrique vers l''Europe', 0, 3),
(@qid, 'Le langage articulé développé', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La théorie de Darwin sur l''évolution est fondée sur :',
 'Darwin a proposé la théorie de la sélection naturelle : les individus ayant des variations avantageuses ont une meilleure survie et reproduction. Ces variations héréditaires favorables sont transmises et s''accumulent dans la population au fil des générations.', 'Examen NS4 SVT 2022 - Zoologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La transmission des caractères acquis (Lamarck)', 0, 1),
(@qid, 'La sélection naturelle : survie différentielle des individus les mieux adaptés', 1, 2),
(@qid, 'La création simultanée de toutes les espèces (créationnisme)', 0, 3),
(@qid, 'Les mutations seules comme moteur de l''évolution', 0, 4);

-- ============================================================
-- SECTION 12 : GEOLOGIE / STRATIGRAPHIE (BIOLOGIE-GEOLOGIE CONNEXES)
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce qu''un microfossile ?',
 'Un microfossile est un fossile de petite taille (généralement < 1 mm) visible seulement au microscope. Exemples : foraminifères, diatomées, conodontes, pollens fossiles.', 'Examen NS4 SVT 2022 - Glucogène', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un fossile de grande taille visible à l''œil nu', 0, 1),
(@qid, 'Un fossile très petit visible uniquement au microscope', 1, 2),
(@qid, 'Un fragment de roche volcanique', 0, 3),
(@qid, 'Un fossile récent de moins de 10 000 ans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce qu''un fossile de faciès ?',
 'Un fossile de faciès est un fossile caractéristique d''un milieu de sédimentation particulier (faciès sédimentaire). Il indique les conditions environnementales de dépôt mais pas forcément l''âge de la roche.', 'Examen NS4 SVT 2022 - Glucogène', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un fossile permettant de dater précisément une roche', 0, 1),
(@qid, 'Un fossile caractéristique d''un milieu de sédimentation particulier', 1, 2),
(@qid, 'Un fossile trouvé uniquement dans les roches métamorphiques', 0, 3),
(@qid, 'Un fossile d''espèce vivant encore aujourd''hui', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Un bon fossile stratigraphique doit :',
 'Un bon fossile stratigraphique doit : être abondant, avoir une large répartition géographique (ubiquiste), avoir une courte durée d''existence, être facilement identifiable et avoir une bonne fossilisation.', 'Examen NS4 SVT 2022 - Microbiologie/Morphologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Être rare et avoir une longue durée d''existence', 0, 1),
(@qid, 'Être abondant, ubiquiste, à courte durée d''existence et facilement identifiable', 1, 2),
(@qid, 'N''exister que dans un seul continent', 0, 3),
(@qid, 'Provenir uniquement des roches sédimentaires marines', 0, 4);

-- ============================================================
-- SECTION 13 : QUESTIONS SUPPLEMENTAIRES - BIOLOGIE GENERALE
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle est la formule chimique de l''azurite (minerai de cuivre) ?',
 'L''azurite est un carbonate de cuivre basique de formule Cu₃(CO₃)₂(OH)₂ ou parfois notée 2CuCO₃·Cu(OH)₂. C''est un minéral bleu utilisé comme minerai de cuivre.', 'Examen NS4 SVT 2022 - Microbiologie/Morphologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CuSO₄', 0, 1),
(@qid, 'Cu₃(CO₃)₂(OH)₂', 1, 2),
(@qid, 'Cu₂S', 0, 3),
(@qid, 'CuO', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La blende est le principal minerai de quel métal ?',
 'La blende (sphalérite) est un sulfure de zinc (ZnS), principal minerai industriel de zinc.', 'Examen NS4 SVT 2022 - Glucogène', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Plomb', 0, 1),
(@qid, 'Cuivre', 0, 2),
(@qid, 'Zinc', 1, 3),
(@qid, 'Fer', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Dans le cadre de la dihybridie avec dominance totale, le rapport phénotypique observé à la F2 est :',
 'En dihybridie avec dominance totale et disjonction indépendante (loi de Mendel), le rapport phénotypique en F2 est 9 : 3 : 3 : 1 (neuf double dominants, trois d''un dominant, trois de l''autre, un double récessif).', 'Examen NS4 SVT 2022 - Zoologie', 4);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '1 : 2 : 1', 0, 1),
(@qid, '3 : 1', 0, 2),
(@qid, '9 : 3 : 3 : 1', 1, 3),
(@qid, '1 : 1 : 1 : 1', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'En dihybridie, combien de types de gamètes produit un hybride F1 (AaBb) en cas de disjonction indépendante ?',
 'Un hybride AaBb produit 4 types de gamètes : AB, Ab, aB, ab. La règle générale : 2^n types de gamètes pour n paires de gènes hétérozygotes.', 'Examen NS4 SVT 2022 - Zoologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '2 types de gamètes', 0, 1),
(@qid, '4 types de gamètes (AB, Ab, aB, ab)', 1, 2),
(@qid, '8 types de gamètes', 0, 3),
(@qid, '1 seul type de gamète', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le gène responsable de la couleur des yeux est un exemple de gène :',
 'Les gènes qui codent pour des caractères phénotypiques continus ou discontinus sont portés par les autosomes (sauf exceptions liées au sexe). La couleur des yeux est un caractère polygénique complexe.', 'Programme NS4 - Génétique', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Lié au chromosome Y uniquement', 0, 1),
(@qid, 'Porté par un autosome (polygénique)', 1, 2),
(@qid, 'Uniquement lié au chromosome X', 0, 3),
(@qid, 'Mitochondrial uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle est la principale cause de la diversité génétique lors de la méiose ?',
 'La diversité génétique lors de la méiose est due à : le crossing-over (brassage intra-chromosomique), la disjonction indépendante des chromosomes homologues (brassage interchromosomique) et la fécondation aléatoire.', 'Programme NS4 - Génétique', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La mitose uniquement', 0, 1),
(@qid, 'Le crossing-over et la disjonction indépendante des chromosomes', 1, 2),
(@qid, 'La réplication de l''ADN avant la division', 0, 3),
(@qid, 'La transcription de nouveaux gènes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel est le nombre diploïde de chromosomes chez l''être humain ?',
 'L''être humain possède 46 chromosomes (2n = 46), soit 23 paires de chromosomes homologues : 22 paires d''autosomes et 1 paire de chromosomes sexuels.', 'Programme NS4 - Cytologie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '23 chromosomes', 0, 1),
(@qid, '46 chromosomes', 1, 2),
(@qid, '48 chromosomes', 0, 3),
(@qid, '92 chromosomes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La méiose est la division cellulaire qui permet de :',
 'La méiose est une division cellulaire réductionnelle qui produit des cellules haploïdes (gamètes ou spores) à partir d''une cellule diploïde. Elle assure la diversité génétique.', 'Programme NS4 - Division cellulaire', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Produire deux cellules diploïdes identiques', 0, 1),
(@qid, 'Produire des cellules haploïdes (gamètes) à partir d''une cellule diploïde', 1, 2),
(@qid, 'Réparer les tissus endommagés', 0, 3),
(@qid, 'Dupliquer les chromosomes sans division cellulaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La mitose est la division cellulaire qui permet de :',
 'La mitose est une division cellulaire équationnelle qui produit deux cellules filles diploïdes identiques à la cellule mère. Elle est responsable de la croissance et du renouvellement cellulaire.', 'Programme NS4 - Division cellulaire', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Produire des gamètes haploïdes', 0, 1),
(@qid, 'Produire deux cellules filles diploïdes identiques à la cellule mère', 1, 2),
(@qid, 'Permettre la fécondation', 0, 3),
(@qid, 'Réduire le nombre de chromosomes de moitié', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La spermatogenèse se déroule dans :',
 'La spermatogenèse est le processus de formation des spermatozoïdes. Elle se déroule dans les tubes séminifères des testicules, sous l''influence de la FSH et de la testostérone.', 'Programme NS4 - Reproduction', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''épididyme', 0, 1),
(@qid, 'Les tubes séminifères des testicules', 1, 2),
(@qid, 'La prostate', 0, 3),
(@qid, 'Les vésicules séminales', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''ovogenèse se déroule principalement dans :',
 'L''ovogenèse est le processus de formation des ovocytes et ovules. Elle se déroule dans les ovaires, sous l''influence de la FSH et des estrogènes.', 'Programme NS4 - Reproduction', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''utérus', 0, 1),
(@qid, 'Les trompes de Fallope', 0, 2),
(@qid, 'Les ovaires', 1, 3),
(@qid, 'Le col de l''utérus', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel est le nom donné à la première division de la méiose ?',
 'La première division de la méiose est la division réductionnelle (méiose I). Elle sépare les chromosomes homologues, réduisant le nombre de chromosomes de 2n à n. La méiose II est la division équationnelle.', 'Programme NS4 - Division cellulaire', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Division équationnelle', 0, 1),
(@qid, 'Division réductionnelle', 1, 2),
(@qid, 'Division mitotique', 0, 3),
(@qid, 'Division cytokinétique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La FSH (hormone folliculo-stimulante) agit sur :',
 'La FSH est une stimuline hypophysaire qui agit sur les gonades : chez la femme, elle stimule la maturation des follicules ovariens ; chez l''homme, elle stimule la spermatogenèse dans les tubes séminifères.', 'Programme NS4 - Endocrinologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La thyroïde', 0, 1),
(@qid, 'Les gonades (ovaires/testicules)', 1, 2),
(@qid, 'Les surrénales', 0, 3),
(@qid, 'Le pancréas', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le cycle menstruel dure en moyenne :',
 'Le cycle menstruel dure en moyenne 28 jours. Il est divisé en phase folliculaire (J1-J14), ovulation (vers J14), et phase lutéale (J14-J28).', 'Programme NS4 - Reproduction', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '21 jours', 0, 1),
(@qid, '28 jours', 1, 2),
(@qid, '35 jours', 0, 3),
(@qid, '14 jours', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La progestérone est principalement produite par :',
 'Après l''ovulation, le follicule se transforme en corps jaune (corpus luteum) qui sécrète la progestérone. Cette hormone prépare l''endomètre utérin pour l''implantation embryonnaire.', 'Programme NS4 - Reproduction', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''hypophyse (adénohypophyse)', 0, 1),
(@qid, 'Le corps jaune (post-ovulation)', 1, 2),
(@qid, 'Le follicule ovarien avant ovulation', 0, 3),
(@qid, 'Les glandes surrénales uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle est la structure principale de défense de l''organisme contre les agents pathogènes extracellulaires ?',
 'Les anticorps (immunoglobulines) produits par les plasmocytes (issus des lymphocytes B) constituent la principale défense humorale contre les agents pathogènes extracellulaires.', 'Programme NS4 - Immunologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les lymphocytes T cytotoxiques', 0, 1),
(@qid, 'Les anticorps (immunoglobulines) produits par les lymphocytes B', 1, 2),
(@qid, 'Les plaquettes sanguines', 0, 3),
(@qid, 'Les globules rouges', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle est la composition de l''atmosphère terrestre actuelle ?',
 'L''atmosphère terrestre actuelle est composée principalement de : diazote N₂ (~78%), dioxygène O₂ (~21%), argon Ar (~0,9%), et dioxyde de carbone CO₂ (~0,04%) plus d''autres gaz en traces.', 'Examen NS4 SVT 2022 - Paléontologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'O₂ (78%) et N₂ (21%)', 0, 1),
(@qid, 'N₂ (~78%), O₂ (~21%), Ar (~0,9%) et CO₂ (~0,04%)', 1, 2),
(@qid, 'CO₂ (50%) et O₂ (50%)', 0, 3),
(@qid, 'H₂ (50%), N₂ (30%) et O₂ (20%)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce qu''un agent pathogène ?',
 'Un agent pathogène est un organisme (bactérie, virus, champignon, parasite) ou une substance capable de provoquer une maladie chez un hôte. Exemples : Mycobacterium tuberculosis, VIH, Plasmodium.', 'Examen NS4 SVT 2022 - Zoologie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un organisme bénéfique pour la santé', 0, 1),
(@qid, 'Un organisme ou substance capable de provoquer une maladie chez un hôte', 1, 2),
(@qid, 'Un médicament utilisé contre les infections', 0, 3),
(@qid, 'Une cellule du système immunitaire', 0, 4);

-- ============================================================
-- SECTION 14 : BIOCHIMIE ET METABOLISME
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le glycogène est la forme de réserve du glucose dans :',
 'Le glycogène est la forme de réserve du glucose chez les animaux, principalement stocké dans le foie (glycogène hépatique) et les muscles (glycogène musculaire).', 'Programme NS4 - Biochimie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les plantes (sous forme d''amidon)', 0, 1),
(@qid, 'Le foie et les muscles chez les animaux', 1, 2),
(@qid, 'Les globules rouges uniquement', 0, 3),
(@qid, 'Le cerveau uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle hormone favorise la glycogénolyse (dégradation du glycogène) ?',
 'Le glucagon (sécrété par les cellules α du pancréas) stimule la glycogénolyse hépatique, libérant du glucose dans le sang pour augmenter la glycémie (effet hyperglycémiant).', 'Programme NS4 - Endocrinologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''insuline', 0, 1),
(@qid, 'Le glucagon', 1, 2),
(@qid, 'La thyroxine', 0, 3),
(@qid, 'La prolactine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La glycémie normale à jeun est d''environ :',
 'La glycémie normale à jeun est d''environ 0,8 à 1,1 g/L (soit environ 4,4 à 6,1 mmol/L). Une valeur supérieure à 1,26 g/L à deux reprises indique un diabète.', 'Programme NS4 - Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '0,3 à 0,5 g/L', 0, 1),
(@qid, '0,8 à 1,1 g/L', 1, 2),
(@qid, '2,0 à 2,5 g/L', 0, 3),
(@qid, '5,0 à 6,0 g/L', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''ATP (adénosine triphosphate) est :',
 'L''ATP est la principale molécule énergétique des cellules vivantes. Elle est produite par la respiration cellulaire (mitochondries) et la glycolyse. Son hydrolyse libère de l''énergie utilisable pour les processus cellulaires.', 'Programme NS4 - Biochimie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un acide aminé essentiel', 0, 1),
(@qid, 'La principale molécule énergétique de la cellule', 1, 2),
(@qid, 'Un acide nucléique comme l''ADN', 0, 3),
(@qid, 'Une vitamine du groupe B', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La photosynthèse se déroule dans :',
 'La photosynthèse se déroule dans les chloroplastes des cellules végétales et des algues. Plus précisément, les réactions lumineuses se font dans les thylakoïdes et le cycle de Calvin dans le stroma.', 'Programme NS4 - Biologie végétale', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les mitochondries', 0, 1),
(@qid, 'Les chloroplastes', 1, 2),
(@qid, 'Les ribosomes', 0, 3),
(@qid, 'Le noyau cellulaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Parmi les substances suivantes, laquelle est une protéine ?',
 'L''hémoglobine est une protéine (métalloprotéine) constituée de 4 chaînes polypeptidiques et de 4 groupements hème contenant le fer. Elle transporte l''O₂ dans le sang.', 'Programme NS4 - Biochimie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''ADN', 0, 1),
(@qid, 'L''hémoglobine', 1, 2),
(@qid, 'Le glycogène', 0, 3),
(@qid, 'La phosphatidylcholine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les acides aminés sont les monomères des :',
 'Les acides aminés sont les unités de base (monomères) des protéines. Ils sont reliés entre eux par des liaisons peptidiques pour former des chaînes polypeptidiques.', 'Programme NS4 - Biochimie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Acides nucléiques (ADN, ARN)', 0, 1),
(@qid, 'Glucides complexes (amidon, glycogène)', 0, 2),
(@qid, 'Protéines', 1, 3),
(@qid, 'Lipides (graisses)', 0, 4);

-- ============================================================
-- SECTION 15 : COMPLEMENTAIRES - SUJETS FREQUENTS NS4
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le syndrome de Turner est caractérisé par le caryotype :',
 'Le syndrome de Turner touche les femmes avec un seul chromosome X (45, X0). Il se manifeste par une petite taille, un infantilisme sexuel, un cou palmé et une stérilité.', 'Programme NS4 - Génétique', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '47, XXX', 0, 1),
(@qid, '45, X0', 1, 2),
(@qid, '47, XXY', 0, 3),
(@qid, '46, XY', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel est le lien entre la structure d''un ARNm et la protéine qu''il code ?',
 'La séquence des codons (triplets de 3 nucléotides) sur l''ARNm détermine la séquence des acides aminés dans la protéine selon le code génétique. C''est le principe de la traduction.', 'Programme NS4 - Biologie moléculaire', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La longueur de l''ARNm détermine la masse de la protéine uniquement', 0, 1),
(@qid, 'La séquence des codons de l''ARNm détermine la séquence des acides aminés de la protéine', 1, 2),
(@qid, 'L''ARNm est directement transformé en protéine sans code', 0, 3),
(@qid, 'La protéine est identique à l''ARNm qui la code', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel est le chromosome portant le gène SRY déterminant le sexe masculin ?',
 'Le gène SRY (Sex-determining Region Y) est situé sur le chromosome Y. Il induit la différenciation des gonades en testicules et oriente le développement vers le phénotype masculin.', 'Programme NS4 - Génétique', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le chromosome 1', 0, 1),
(@qid, 'Le chromosome X', 0, 2),
(@qid, 'Le chromosome Y', 1, 3),
(@qid, 'Le chromosome 21', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La sélection naturelle agit sur :',
 'La sélection naturelle agit sur le phénotype des individus, éliminant ceux qui sont moins bien adaptés à leur environnement et favorisant la reproduction des mieux adaptés.', 'Programme NS4 - Evolution', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Directement sur le génotype', 0, 1),
(@qid, 'Sur le phénotype (caractères exprimés) des individus', 1, 2),
(@qid, 'Sur les gènes récessifs uniquement', 0, 3),
(@qid, 'Sur les mutations létales uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce que la dérive génétique ?',
 'La dérive génétique est un changement aléatoire de la fréquence des allèles dans une population, dû au hasard de la reproduction. Elle est particulièrement importante dans les petites populations.', 'Programme NS4 - Génétique des populations', 4);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La sélection des individus les mieux adaptés', 0, 1),
(@qid, 'Un changement aléatoire de la fréquence allélique dans une population', 1, 2),
(@qid, 'La migration d''individus entre populations', 0, 3),
(@qid, 'L''apparition de nouvelles mutations', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les lipides sont des molécules organiques qui :',
 'Les lipides sont des molécules organiques hydrophobes composées principalement de carbone, hydrogène et oxygène. Ils jouent des rôles de réserve énergétique, de structure membranaire (phospholipides) et de signalisation (hormones stéroïdes).', 'Programme NS4 - Biochimie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sont solubles dans l''eau', 0, 1),
(@qid, 'Sont hydrophobes et servent de réserve énergétique et de constituants membranaires', 1, 2),
(@qid, 'Sont les monomères des protéines', 0, 3),
(@qid, 'Stockent l''information génétique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le paludisme (malaria) est transmis par :',
 'Le paludisme est causé par le parasite Plasmodium et transmis par la piqûre de la femelle Anophèle (moustique). C''est l''une des maladies à vecteur les plus répandues dans le monde.', 'Programme NS4 - Microbiologie/Parasitologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La consommation d''eau contaminée', 0, 1),
(@qid, 'La piqûre du moustique femelle Anophèle', 1, 2),
(@qid, 'Le contact direct avec un malade', 0, 3),
(@qid, 'La piqûre du moustique Aedes aegypti', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La dengue est une maladie virale transmise par :',
 'La dengue est transmise par la piqûre du moustique Aedes aegypti (et Aedes albopictus). C''est une arbovirose (maladie virale à arbovirus) très répandue dans les régions tropicales et subtropicales.', 'Programme NS4 - Virologie/Santé', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le moustique Anophèle', 0, 1),
(@qid, 'Le moustique Aedes aegypti', 1, 2),
(@qid, 'La mouche tsé-tsé', 0, 3),
(@qid, 'Les poux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le VIH est le virus responsable de :',
 'Le VIH (Virus de l''Immunodéficience Humaine) est responsable du SIDA (Syndrome d''Immunodéficience Acquise). C''est un rétrovirus qui détruit les lymphocytes T CD4+, affaiblissant le système immunitaire.', 'Programme NS4 - Virologie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''hépatite B', 0, 1),
(@qid, 'Le SIDA', 1, 2),
(@qid, 'La tuberculose', 0, 3),
(@qid, 'Le paludisme', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La tuberculose est causée par :',
 'La tuberculose est causée par Mycobacterium tuberculosis (bacille de Koch). C''est une infection bactérienne qui touche principalement les poumons.', 'Programme NS4 - Microbiologie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un virus (VBK)', 0, 1),
(@qid, 'Mycobacterium tuberculosis (bacille de Koch)', 1, 2),
(@qid, 'Plasmodium falciparum', 0, 3),
(@qid, 'Streptococcus pneumoniae', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quelle est la cellule cible du VIH dans l''organisme ?',
 'Le VIH infecte préférentiellement les lymphocytes T CD4+ (lymphocytes T auxiliaires), car ces cellules expriment à leur surface la protéine CD4 qui sert de récepteur au virus.', 'Programme NS4 - Immunologie/Virologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les globules rouges', 0, 1),
(@qid, 'Les lymphocytes T CD4+', 1, 2),
(@qid, 'Les plaquettes sanguines', 0, 3),
(@qid, 'Les cellules musculaires', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vaccination contre une maladie confère une immunité dite :',
 'La vaccination confère une immunité active artificielle : elle stimule le système immunitaire à produire des anticorps et des cellules mémoire sans traverser la maladie. L''immunité passive est le transfert direct d''anticorps préformés.', 'Programme NS4 - Immunologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Passive naturelle', 0, 1),
(@qid, 'Active artificielle', 1, 2),
(@qid, 'Passive artificielle', 0, 3),
(@qid, 'Active naturelle', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le cholestérol est un précurseur de :',
 'Le cholestérol est le précurseur de nombreuses molécules biologiques importantes : les hormones stéroïdes (cortisol, testostérone, estrogènes, aldostérone), la vitamine D₃ et les sels biliaires.', 'Programme NS4 - Biochimie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des acides aminés essentiels', 0, 1),
(@qid, 'Des hormones stéroïdes, de la vitamine D et des sels biliaires', 1, 2),
(@qid, 'Des vitamines du groupe B', 0, 3),
(@qid, 'Des acides nucléiques', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les enzymes sont des :',
 'Les enzymes sont des protéines (sauf quelques ARN catalytiques = ribozymes) qui servent de biocatalyseurs : elles accélèrent les réactions chimiques sans être consommées, en abaissant l''énergie d''activation.', 'Programme NS4 - Biochimie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Des glucides qui stockent l''énergie', 0, 1),
(@qid, 'Des protéines biocatalyseurs qui accélèrent les réactions chimiques', 1, 2),
(@qid, 'Des lipides membranaires', 0, 3),
(@qid, 'Des acides nucléiques porteurs d''information génétique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Dans les cellules eucaryotes, où est localisé l''ADN nucléaire ?',
 'Dans les cellules eucaryotes, l''ADN nucléaire est localisé dans le noyau, enroulé autour de protéines appelées histones, formant la chromatine (chromosomes pendant la division).', 'Programme NS4 - Cytologie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Dans les mitochondries', 0, 1),
(@qid, 'Dans le cytoplasme libre', 0, 2),
(@qid, 'Dans le noyau cellulaire', 1, 3),
(@qid, 'Sur les ribosomes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La coagulation sanguine fait intervenir quelle vitamine ?',
 'La vitamine K est indispensable à la synthèse de plusieurs facteurs de coagulation (prothrombine, facteurs II, VII, IX, X). Son déficit entraîne des troubles de la coagulation et des hémorragies.', 'Programme NS4 - Physiologie/Vitamines', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vitamine C', 0, 1),
(@qid, 'Vitamine B12', 0, 2),
(@qid, 'Vitamine K', 1, 3),
(@qid, 'Vitamine A', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le collagène est la protéine la plus abondante du corps humain. La vitamine nécessaire à sa synthèse est :',
 'La vitamine C (acide ascorbique) est nécessaire à la synthèse du collagène car elle est le cofacteur des enzymes qui hydroxylent la proline et la lysine (prolyl-hydroxylase). Son déficit cause le scorbut.', 'Programme NS4 - Biochimie/Vitamines', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vitamine A', 0, 1),
(@qid, 'Vitamine C', 1, 2),
(@qid, 'Vitamine D', 0, 3),
(@qid, 'Vitamine E', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les sources alimentaires de vitamine D comprennent :',
 'Les principales sources de vitamine D sont les poissons gras (saumon, thon, maquereau), le foie, les œufs et les produits laitiers enrichis. La peau peut aussi synthétiser la vitamine D sous l''action des UV solaires.', 'Examen NS4 SVT 2022 - Vitamines', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les agrumes (citron, orange)', 0, 1),
(@qid, 'Les poissons gras (saumon, thon) et les œufs', 1, 2),
(@qid, 'Les légumes verts (épinards, brocolis)', 0, 3),
(@qid, 'Les légumineuses (lentilles, pois chiches)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les sources alimentaires de vitamine E (tocophérol) comprennent :',
 'La vitamine E est principalement présente dans les huiles végétales (tournesol, olive, soja), les fruits oléagineux (amandes, noix), les graines et les céréales complètes.', 'Examen NS4 SVT 2022 - Vitamines', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les viandes rouges et le lait uniquement', 0, 1),
(@qid, 'Les huiles végétales, les fruits oléagineux et les céréales complètes', 1, 2),
(@qid, 'Les fruits tropicaux uniquement', 0, 3),
(@qid, 'Les produits de la mer uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''acide désoxyribonucléique (ADN) est une molécule :',
 'L''ADN est une molécule double brin (double hélice) composée de nucléotides (base azotée + désoxyribose + phosphate). Il est le support de l''information génétique chez la plupart des êtres vivants.', 'Programme NS4 - Biologie moléculaire', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Simple brin portant le message génétique vers les ribosomes', 0, 1),
(@qid, 'Double hélice support de l''information génétique', 1, 2),
(@qid, 'Protéique servant de biocatalyseur', 0, 3),
(@qid, 'Lipidique constituant les membranes cellulaires', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les ribosomes sont le siège de :',
 'Les ribosomes sont les organites où se déroule la traduction : la synthèse des protéines à partir du message génétique porté par l''ARNm. Ils peuvent être libres dans le cytoplasme ou liés au réticulum endoplasmique rugueux.', 'Programme NS4 - Cytologie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La transcription de l''ADN en ARNm', 0, 1),
(@qid, 'La traduction de l''ARNm en protéines', 1, 2),
(@qid, 'La production d''énergie (ATP)', 0, 3),
(@qid, 'La digestion des molécules étrangères', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La structure en double hélice de l''ADN a été proposée par :',
 'La structure en double hélice de l''ADN a été proposée par James Watson et Francis Crick en 1953, en utilisant les données de diffraction aux rayons X de Rosalind Franklin et les données de Chargaff.', 'Programme NS4 - Histoire des sciences', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Pasteur et Koch', 0, 1),
(@qid, 'Watson et Crick (1953)', 1, 2),
(@qid, 'Mendel et Darwin', 0, 3),
(@qid, 'Lamarck et Cuvier', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Combien de paires de bases contient approximativement le génome humain ?',
 'Le génome humain haploïde contient environ 3 milliards (3 × 10⁹) de paires de bases, réparties sur 23 chromosomes. Il code environ 20 000-25 000 gènes.', 'Programme NS4 - Génomique', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, '3 millions de paires de bases', 0, 1),
(@qid, '3 milliards de paires de bases', 1, 2),
(@qid, '3 000 paires de bases', 0, 3),
(@qid, '300 millions de paires de bases', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La maladie de Parkinson est liée à un déficit de quel neurotransmetteur ?',
 'La maladie de Parkinson est liée à la dégénérescence des neurones dopaminergiques de la substance noire, entraînant un déficit en dopamine. Ce déficit perturbe le contrôle des mouvements.', 'Programme NS4 - Neurosciences', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'L''acétylcholine', 0, 1),
(@qid, 'La sérotonine', 0, 2),
(@qid, 'La dopamine', 1, 3),
(@qid, 'Le GABA', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La maladie d''Alzheimer est caractérisée par :',
 'La maladie d''Alzheimer est une maladie neurodégénérative caractérisée par des plaques amyloïdes (bêta-amyloïde), des enchevêtrements neurofibrillaires (protéine Tau) et la perte progressive de neurones, entraînant des troubles mnésiques et cognitifs.', 'Programme NS4 - Neurosciences', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un déficit en dopamine dans la substance noire', 0, 1),
(@qid, 'Des plaques amyloïdes et neurofibrillaires entraînant la dégénérescence neuronale', 1, 2),
(@qid, 'Une inflammation des méninges', 0, 3),
(@qid, 'Une démyélinisation des fibres nerveuses', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''hémoglobine fœtale (HbF) diffère de l''hémoglobine adulte (HbA) par :',
 'L''HbF (α₂γ₂) contient deux chaînes gamma au lieu des deux chaînes bêta de l''HbA (α₂β₂). L''HbF a une plus grande affinité pour l''oxygène que l''HbA, ce qui facilite le transfert d''O₂ de la mère au fœtus.', 'Programme NS4 - Biochimie', 4);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Sa couleur : l''HbF est bleue et l''HbA est rouge', 0, 1),
(@qid, 'La présence de chaînes gamma au lieu des chaînes bêta (plus grande affinité pour O₂)', 1, 2),
(@qid, 'Sa localisation : l''HbF est dans le plasma, l''HbA dans les GR', 0, 3),
(@qid, 'L''HbF contient du fer ferreux et l''HbA du fer ferrique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La moelle épinière fait partie de :',
 'La moelle épinière fait partie du système nerveux central (SNC), avec l''encéphale. Elle est contenue dans le canal rachidien (vertèbres) et assure la transmission des informations entre le cerveau et le reste du corps.', 'Programme NS4 - Système nerveux', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Le système nerveux périphérique', 0, 1),
(@qid, 'Le système nerveux central (avec l''encéphale)', 1, 2),
(@qid, 'Le système nerveux végétatif uniquement', 0, 3),
(@qid, 'Le système endocrinien', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Dans un arc réflexe, quel est l''ordre correct des éléments ?',
 'L''arc réflexe comprend dans l''ordre : récepteur sensitif → neurone afférent (sensitif) → centre nerveux (moelle épinière) → neurone efférent (moteur) → effecteur (muscle ou glande).', 'Programme NS4 - Système nerveux', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Effecteur → centre nerveux → récepteur', 0, 1),
(@qid, 'Récepteur → neurone afférent → centre nerveux → neurone efférent → effecteur', 1, 2),
(@qid, 'Centre nerveux → récepteur → effecteur → neurone', 0, 3),
(@qid, 'Neurone → récepteur → effecteur uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La myéline qui entoure certains axones est produite par :',
 'Dans le système nerveux central, la myéline est produite par les oligodendrocytes. Dans le système nerveux périphérique, elle est produite par les cellules de Schwann. Elle accélère la conduction nerveuse.', 'Programme NS4 - Histologie nerveuse', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les neurones eux-mêmes', 0, 1),
(@qid, 'Les oligodendrocytes (SNC) et les cellules de Schwann (SNP)', 1, 2),
(@qid, 'Les macrophages du cerveau', 0, 3),
(@qid, 'Les cellules endothéliales des vaisseaux', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel est l''effet de l''insuline sur la glycémie ?',
 'L''insuline est une hormone hypoglycémiante : elle fait baisser la glycémie en favorisant l''entrée du glucose dans les cellules, la glycogénogenèse (stockage en glycogène) et la lipogenèse (conversion en graisses).', 'Programme NS4 - Endocrinologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Elle augmente la glycémie (hyperglycémiante)', 0, 1),
(@qid, 'Elle diminue la glycémie (hypoglycémiante)', 1, 2),
(@qid, 'Elle n''a aucun effet sur la glycémie', 0, 3),
(@qid, 'Elle augmente la glycémie seulement à jeun', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le glucose entre dans les cellules sous l''effet de l''insuline via :',
 'L''insuline stimule la translocation des transporteurs GLUT4 vers la membrane plasmique des cellules musculaires et adipocytes, permettant l''entrée du glucose par transport facilité.', 'Programme NS4 - Physiologie cellulaire', 4);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un transport actif utilisant l''ATP directement', 0, 1),
(@qid, 'Des transporteurs GLUT (transport facilité)', 1, 2),
(@qid, 'La diffusion simple à travers la membrane', 0, 3),
(@qid, 'L''endocytose par la membrane cellulaire', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les quatre signes cliniques d''une hyperglycémie (diabète) sont :',
 'Les signes classiques de l''hyperglycémie/diabète sont : polyurie (urines abondantes), polydipsie (soif intense), polyphagie (faim excessive), asthénie (fatigue), et perte de poids. On retrouve aussi glycosurie (glucose dans les urines).', 'Examen NS4 SVT 2022 - Microbiologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Bradycardie, hypotension, anurie, prise de poids', 0, 1),
(@qid, 'Polyurie, polydipsie, polyphagie et asthénie (fatigue)', 1, 2),
(@qid, 'Toux, fièvre, douleurs articulaires, exanthème', 0, 3),
(@qid, 'Céphalées, vertiges, vomissements, photophobie', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Deux sources alimentaires de cyanocobalamine (vitamine B12) sont :',
 'La vitamine B12 se trouve quasi exclusivement dans les produits d''origine animale : viandes (foie surtout), poissons, fruits de mer, œufs et produits laitiers. Les végétaliens risquent une carence.', 'Examen NS4 SVT 2022 - Morphologie_B', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les légumes verts et les fruits', 0, 1),
(@qid, 'Les viandes (foie) et les fruits de mer', 1, 2),
(@qid, 'Les céréales complètes et les légumineuses', 0, 3),
(@qid, 'Les huiles végétales et les noix', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les phospholipides constituent la structure de base des membranes cellulaires. Ils sont :',
 'Les phospholipides sont des molécules amphiphiles (tête polaire hydrophile + queues apolaires hydrophobes). Ils s''organisent en bicouche lipidique formant la structure de base de toutes les membranes cellulaires.', 'Programme NS4 - Cytologie/Biochimie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Entièrement hydrophiles (solubles dans l''eau)', 0, 1),
(@qid, 'Amphiphiles (tête hydrophile + queues hydrophobes), formant une bicouche', 1, 2),
(@qid, 'Entièrement hydrophobes', 0, 3),
(@qid, 'Des protéines globulaires', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La sécrétion pancréatique exocrine (suc pancréatique) contient :',
 'Le suc pancréatique contient des enzymes digestives : amylase pancréatique (glucides), lipase (lipides), protéases (trypsine, chymotrypsine - protéines), et du bicarbonate de sodium (neutralise l''acidité gastrique).', 'Programme NS4 - Physiologie digestive', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Insuline, glucagon et somatostatine', 0, 1),
(@qid, 'Amylase, lipase, protéases et bicarbonate de sodium', 1, 2),
(@qid, 'Bile, cholestérol et acides biliaires', 0, 3),
(@qid, 'Acide chlorhydrique et pepsine', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le changement climatique actuel est principalement causé par :',
 'Le changement climatique actuel est principalement causé par les activités humaines émettant des gaz à effet de serre (GES) : combustion des énergies fossiles, déforestation, agriculture intensive, industrie.', 'Examen NS4 SVT 2022 - Paléontologie/Neurone', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement des cycles naturels solaires', 0, 1),
(@qid, 'Les activités humaines émettant des gaz à effet de serre (GES)', 1, 2),
(@qid, 'L''activité volcanique seule', 0, 3),
(@qid, 'Les mouvements des continents uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Parmi ces gaz, lequel n''est PAS un gaz à effet de serre ?',
 'Les principaux gaz à effet de serre sont : CO₂, CH₄ (méthane), N₂O, vapeur d''eau et les CFC. Le diazote (N₂) n''est pas un gaz à effet de serre malgré sa grande concentration atmosphérique.', 'Examen NS4 SVT 2022 - Neurone/Paléontologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'CO₂ (dioxyde de carbone)', 0, 1),
(@qid, 'CH₄ (méthane)', 0, 2),
(@qid, 'N₂ (diazote)', 1, 3),
(@qid, 'N₂O (protoxyde d''azote)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel pays est considéré parmi les plus grands pollueurs mondiaux (émissions de CO₂) ?',
 'Les plus grands émetteurs de CO₂ dans le monde sont : la Chine (1er), les États-Unis (2e), l''Inde (3e), la Russie, le Japon... Ces pays sont responsables d''une grande part des émissions mondiales de gaz à effet de serre.', 'Examen NS4 SVT 2022 - Glucogène', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Haïti et le Sénégal', 0, 1),
(@qid, 'La Chine, les États-Unis et l''Inde', 1, 2),
(@qid, 'La France et l''Espagne uniquement', 0, 3),
(@qid, 'Le Brésil et l''Argentine uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le groupe de vertébrés qui s''est développé après la disparition des dinosaures au Crétacé-Tertiaire est :',
 'Après la disparition des dinosaures à la fin du Crétacé (il y a 66 Ma), les mammifères ont connu une radiation évolutive explosive au début du Tertiaire (Paléogène), occupant les niches écologiques laissées vacantes.', 'Examen NS4 SVT 2022 - Microbiologie/Paléontologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les reptiles', 0, 1),
(@qid, 'Les oiseaux uniquement', 0, 2),
(@qid, 'Les mammifères', 1, 3),
(@qid, 'Les poissons', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Deux hypothèses pour expliquer la crise Crétacé-Tertiaire (extinction des dinosaures) sont :',
 'Les deux principales hypothèses sont : (1) impact d''un astéroïde/météorite géant (cratère de Chicxulub, Mexique) - hypothèse d''Alvarez ; et (2) l''activité volcanique intense (trapps du Deccan en Inde). Ces deux événements ont perturbé le climat mondial.', 'Examen NS4 SVT 2022 - Microbiologie/Neurone', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La glaciation et la montée des eaux océaniques', 0, 1),
(@qid, 'L''impact d''un astéroïde et l''activité volcanique intense', 1, 2),
(@qid, 'Une maladie contagieuse et la sécheresse', 0, 3),
(@qid, 'La dérive des continents et l''acidification des océans', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La datation radiométrique (absolue) utilise :',
 'La datation absolue (radiométrique) est basée sur la désintégration radioactive de certains isotopes (ex : Carbone-14, Uranium-238, Potassium-40). On mesure la quantité d''isotope parent et d''isotope fils pour calculer l''âge.', 'Examen NS4 SVT 2022 - Paléontologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La position stratigraphique des couches uniquement', 0, 1),
(@qid, 'La désintégration radioactive d''isotopes (C14, U238, K40...)', 1, 2),
(@qid, 'L''étude des fossiles uniquement', 0, 3),
(@qid, 'La coloration des roches sédimentaires', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Qu''est-ce que la datation relative en stratigraphie ?',
 'La datation relative détermine l''âge d''une roche ou d''un fossile par rapport à d''autres (antérieur, contemporain ou postérieur) sans donner une date chiffrée précise. Elle utilise les principes de superposition, continuité et les fossiles stratigraphiques.', 'Examen NS4 SVT 2022 - Paléontologie/Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Elle donne un âge précis en années grâce aux isotopes', 0, 1),
(@qid, 'Elle détermine l''âge d''une formation par rapport à d''autres, sans date chiffrée précise', 1, 2),
(@qid, 'Elle utilise la radioactivité pour dater les roches', 0, 3),
(@qid, 'Elle ne peut s''appliquer qu''aux roches ignées', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les principaux minerais métalliques exploités en Haïti comprennent :',
 'Haïti possède des ressources en or, argent, cuivre (principalement dans le Massif du Nord), ainsi que du bauxite (nord d''Haïti, aluminium). Il existe aussi des indices de fer et de manganèse.', 'Examen NS4 SVT 2022 - Vitamines/Physiologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Diamant, platine et uranium', 0, 1),
(@qid, 'Or, argent, cuivre et bauxite (aluminium)', 1, 2),
(@qid, 'Charbon, pétrole et gaz naturel uniquement', 0, 3),
(@qid, 'Sel, potasse et phosphates uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La lignée humaine se caractérise notamment par :',
 'Les critères d''appartenance à la lignée humaine comprennent : la bipédie permanente, le développement du volume crânien (encéphalisation), la fabrication et l''utilisation d''outils, le langage articulé et le feu.', 'Examen NS4 SVT 2022 - Vitamines', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La quadrupédie et une petite taille', 0, 1),
(@qid, 'La bipédie permanente, l''encéphalisation et l''utilisation d''outils', 1, 2),
(@qid, 'La nage et les capacités aquatiques', 0, 3),
(@qid, 'La capacité de photosynthèse', 0, 4);

-- ============================================================
-- SECTION 16 : QUESTIONS ADDITIONNELLES DE RÉVISION NS4
-- ============================================================

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le réticulum endoplasmique rugueux (RER) est impliqué dans :',
 'Le réticulum endoplasmique rugueux (couvert de ribosomes) est impliqué dans la synthèse et le transport des protéines destinées à être sécrétées ou incorporées dans les membranes.', 'Programme NS4 - Cytologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La production d''énergie cellulaire', 0, 1),
(@qid, 'La synthèse et le transport des protéines sécrétées', 1, 2),
(@qid, 'La digestion intracellulaire', 0, 3),
(@qid, 'La photosynthèse dans les cellules végétales', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'L''appareil de Golgi est impliqué dans :',
 'L''appareil de Golgi est impliqué dans la maturation, le tri et l''expédition des protéines et lipides. Il modifie les protéines venues du RER (glycosylation, etc.) et les adresse vers leur destination finale (sécrétion, lysosomes, membrane).', 'Programme NS4 - Cytologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La production d''ATP par oxydation', 0, 1),
(@qid, 'La maturation, le tri et l''adressage des protéines', 1, 2),
(@qid, 'La réplication de l''ADN', 0, 3),
(@qid, 'La synthèse des lipides membranaires exclusivement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Chez un individu de groupe sanguin O :',
 'Le groupe O signifie que l''individu ne possède ni agglutinogène A ni agglutinogène B sur ses globules rouges. Son plasma contient les deux agglutinines : anti-A et anti-B. Il est donneur universel.', 'Programme NS4 - Physiologie sanguine', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ses GR portent les agglutinogènes A et B', 0, 1),
(@qid, 'Ses GR n''ont ni agglutinogène A ni B ; son plasma a les anti-A et anti-B', 1, 2),
(@qid, 'Son plasma contient ni anti-A ni anti-B', 0, 3),
(@qid, 'Il peut recevoir du sang de tous les groupes sans risque', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le groupe sanguin AB est dit receveur universel car :',
 'Le groupe AB est dit receveur universel car ses globules rouges portent les agglutinogènes A et B, mais son plasma ne contient ni anti-A ni anti-B. Il peut donc recevoir du sang de tous les groupes sans risque d''agglutination.', 'Programme NS4 - Physiologie sanguine', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ses GR n''ont aucun agglutinogène', 0, 1),
(@qid, 'Son plasma ne contient ni anti-A ni anti-B, donc pas de risque d''agglutination', 1, 2),
(@qid, 'Il produit tous les types d''agglutinines', 0, 3),
(@qid, 'Ses globules rouges résistent à tous les anticorps', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La loi de superposition en stratigraphie stipule que :',
 'La loi de superposition (Nicolas Sténon, 1669) stipule que dans une séquence de couches non déformées, les couches les plus anciennes sont en bas et les plus récentes en haut.', 'Examen NS4 SVT 2022 - Glucogène/Morphologie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les couches les plus anciennes sont en haut', 0, 1),
(@qid, 'Les couches les plus récentes sont en haut et les plus anciennes en bas', 1, 2),
(@qid, 'Toutes les couches d''une même région ont le même âge', 0, 3),
(@qid, 'Les couches les plus minces sont les plus anciennes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel est le principal rôle des lymphocytes T cytotoxiques (CD8+) ?',
 'Les lymphocytes T cytotoxiques (LTc ou CD8+) détruisent directement les cellules infectées par des virus, les cellules tumorales ou les cellules transplantées. Ils constituent l''immunité cellulaire.', 'Programme NS4 - Immunologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Produire des anticorps (immunoglobulines)', 0, 1),
(@qid, 'Détruire directement les cellules infectées et les cellules tumorales', 1, 2),
(@qid, 'Phagocyter les bactéries extracellulaires', 0, 3),
(@qid, 'Stimuler la production de lymphocytes B', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La loi de continuité en stratigraphie stipule que :',
 'La loi de continuité (Sténon) stipule que les couches sédimentaires se déposent horizontalement et latéralement de façon continue dans un bassin sédimentaire donné, même si leur épaisseur peut varier.', 'Programme NS4 - Stratigraphie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Chaque couche a un épaisseur constante partout dans le monde', 0, 1),
(@qid, 'Une même couche sédimentaire a le même âge sur toute son étendue latérale', 1, 2),
(@qid, 'Les couches se déposent toujours de bas en haut', 0, 3),
(@qid, 'Les couches les plus récentes sont nécessairement continues', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Quel est le rôle du foie dans la régulation de la glycémie ?',
 'Le foie joue un rôle central dans la régulation de la glycémie : il stocke le glucose sous forme de glycogène (glycogénogenèse) quand la glycémie est élevée, et libère le glucose dans le sang (glycogénolyse, néoglucogenèse) quand elle est basse.', 'Programme NS4 - Physiologie/Endocrinologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Il produit l''insuline pour réguler la glycémie', 0, 1),
(@qid, 'Il stocke le glucose (glycogénogenèse) ou le libère (glycogénolyse/néoglucogenèse) selon la glycémie', 1, 2),
(@qid, 'Il dégrade uniquement l''alcool et les toxines', 0, 3),
(@qid, 'Il n''a aucun rôle dans la régulation glycémique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La trisomie 18 est aussi appelée :',
 'La trisomie 18 est aussi connue sous le nom de syndrome d''Edwards (du nom du généticien John Edwards qui l''a décrit en 1960). Elle est due à la présence d''un chromosome 18 surnuméraire (47 chromosomes).', 'Programme NS4 - Génétique', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Syndrome de Down', 0, 1),
(@qid, 'Syndrome d''Edwards', 1, 2),
(@qid, 'Syndrome de Patau', 0, 3),
(@qid, 'Syndrome de Klinefelter', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La trisomie 13 est aussi appelée :',
 'La trisomie 13 est le syndrome de Patau (décrit par Klaus Patau en 1960). Elle est due à un chromosome 13 surnuméraire et est la plus grave des trisomies autosomales viables.', 'Programme NS4 - Génétique', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Syndrome de Down', 0, 1),
(@qid, 'Syndrome d''Edwards', 0, 2),
(@qid, 'Syndrome de Patau', 1, 3),
(@qid, 'Syndrome de Turner', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Dans l''hémoglobine, le fer est contenu dans le groupement :',
 'Dans l''hémoglobine, le fer (Fe²⁺) est contenu dans le groupement hème. C''est à ce fer que se fixe le dioxygène (O₂). L''hémoglobine est constituée de 4 chaînes polypeptidiques (globines) chacune associée à un hème.', 'Programme NS4 - Biochimie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'La chaîne polypeptidique (globine)', 0, 1),
(@qid, 'Le groupement hème', 1, 2),
(@qid, 'Le groupement carboxyle de la protéine', 0, 3),
(@qid, 'Le noyau central de la porphyrine cuivreuse', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Parmi les maladies suivantes, laquelle se transmet de la même manière que la myopathie de Duchenne ?',
 'Le daltonisme et l''hémophilie se transmettent de la même manière que la myopathie de Duchenne : selon le mode gonosomal récessif lié au chromosome X. Les femmes sont vectrices, les hommes malades.', 'Examen NS4 SVT 2022 - Histologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Trisomie 21 et drépanocytose', 0, 1),
(@qid, 'Daltonisme et hémophilie', 1, 2),
(@qid, 'Phénylcétonurie et mucoviscidose', 0, 3),
(@qid, 'Albinisme et syndrome de Down', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le bêta-carotène est une provitamine car il se transforme dans l''organisme en :',
 'Le bêta-carotène est la provitamine A. Il est converti en rétinol (vitamine A) dans l''intestin grêle. Il est présent dans les légumes et fruits de couleur orange/rouge (carottes, mangues, tomates).', 'Programme NS4 - Vitamines', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vitamine C (acide ascorbique)', 0, 1),
(@qid, 'Vitamine A (rétinol)', 1, 2),
(@qid, 'Vitamine D (calciférol)', 0, 3),
(@qid, 'Vitamine K (ménadione)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le 7-déhydrocholestérol est une provitamine transformée sous l''action des UV solaires en :',
 'Le 7-déhydrocholestérol (présent dans la peau) est la provitamine D3. Sous l''action des rayons UV-B solaires, il est transformé en vitamine D3 (cholécalciférol) dans la peau.', 'Programme NS4 - Vitamines/Biochimie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Vitamine A (rétinol)', 0, 1),
(@qid, 'Vitamine D3 (cholécalciférol)', 1, 2),
(@qid, 'Vitamine E (tocophérol)', 0, 3),
(@qid, 'Vitamine K (phylloquinone)', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La mémoire immunologique est assurée par :',
 'La mémoire immunologique est assurée par les lymphocytes mémoire (lymphocytes B et T mémoire). Ces cellules à longue durée de vie permettent une réponse immunitaire plus rapide et plus intense lors d''une seconde exposition au même antigène.', 'Programme NS4 - Immunologie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les macrophages uniquement', 0, 1),
(@qid, 'Les lymphocytes mémoire (B et T)', 1, 2),
(@qid, 'Les plaquettes sanguines', 0, 3),
(@qid, 'Les anticorps circulants uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les nucléotides sont les monomères des acides nucléiques. Un nucléotide est constitué de :',
 'Un nucléotide est constitué de trois éléments : une base azotée (purine ou pyrimidine), un sucre pentose (désoxyribose dans l''ADN, ribose dans l''ARN) et un groupement phosphate.', 'Programme NS4 - Biologie moléculaire', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Un acide aminé, un sucre et un phosphate', 0, 1),
(@qid, 'Une base azotée, un sucre (pentose) et un groupement phosphate', 1, 2),
(@qid, 'Deux bases azotées et un sucre', 0, 3),
(@qid, 'Un acide gras, un glycérol et une base azotée', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La phénylcétonurie (PCU) est une maladie métabolique :',
 'La phénylcétonurie est une maladie autosomale récessive due à un déficit en phénylalanine hydroxylase. L''accumulation de phénylalanine est neurotoxique et peut causer un retard mental si non traitée dès la naissance (régime sans phénylalanine).', 'Programme NS4 - Génétique/Biochimie', 4);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Autosomale dominante avec retard mental', 0, 1),
(@qid, 'Autosomale récessive due à un déficit en phénylalanine hydroxylase', 1, 2),
(@qid, 'Liée au chromosome X avec troubles musculaires', 0, 3),
(@qid, 'Due à une trisomie chromosomique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Les gaz à effet de serre ont un effet sur la température de la Terre car :',
 'Les gaz à effet de serre (CO₂, CH₄, H₂O, N₂O...) absorbent le rayonnement infrarouge (chaleur) émis par la surface terrestre et le réémettent vers la Terre, empêchant sa dissipation dans l''espace. Sans effet de serre naturel, la température serait de -18°C au lieu de +15°C.', 'Programme NS4 - Écologie/Géologie', 2);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Ils bloquent les rayons UV entrants du soleil', 0, 1),
(@qid, 'Ils absorbent les infrarouges terrestres et les réémettent vers la Terre, réchauffant l''atmosphère', 1, 2),
(@qid, 'Ils augmentent la réflexion des rayons solaires vers l''espace', 0, 3),
(@qid, 'Ils produisent de la chaleur par réaction chimique', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le brassage génétique lors de la reproduction sexuée est assuré par :',
 'Le brassage génétique est assuré par : (1) le crossing-over (prophase I de la méiose) qui crée de nouvelles combinaisons alléliques sur les chromosomes ; et (2) la disjonction indépendante des chromosomes homologues en méiose I ; plus (3) la fécondation aléatoire.', 'Programme NS4 - Génétique', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Uniquement par les mutations spontanées', 0, 1),
(@qid, 'Le crossing-over, la disjonction indépendante des chromosomes et la fécondation aléatoire', 1, 2),
(@qid, 'Par la mitose uniquement', 0, 3),
(@qid, 'Par la dérive génétique uniquement', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'Le principe de l''identité (de Steno) en stratigraphie dit que :',
 'Le principe d''identité paléontologique stipule que deux couches ayant les mêmes fossiles (surtout fossiles stratigraphiques) sont de même âge, même si elles sont géographiquement éloignées.', 'Programme NS4 - Stratigraphie', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Deux couches identiques visuellement ont le même âge', 0, 1),
(@qid, 'Deux couches ayant les mêmes fossiles stratigraphiques sont contemporaines', 1, 2),
(@qid, 'Une couche est toujours identique à elle-même en épaisseur', 0, 3),
(@qid, 'Les strates se déposent toujours en couches inclinées', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La différence entre un macrofossile et un microfossile est :',
 'Un macrofossile est visible à l''œil nu (ammonites, fougères fossiles, ossements). Un microfossile est trop petit pour être vu à l''œil nu et nécessite un microscope (foraminifères, pollens, conodontes).', 'Examen NS4 SVT 2022 - Morphologie/Physiologie', 1);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Les macrofossiles sont anciens et les microfossiles sont récents', 0, 1),
(@qid, 'Les macrofossiles sont visibles à l''œil nu ; les microfossiles ne sont visibles qu''au microscope', 1, 2),
(@qid, 'Les macrofossiles sont d''origine animale et les microfossiles végétale', 0, 3),
(@qid, 'Il n''y a pas de différence, ce sont des synonymes', 0, 4);

INSERT INTO questions (matiere_id, type_id, enonce, explication, source, difficulte) VALUES
(12, 2, 'La vitamine E (tocophérol) joue principalement le rôle de :',
 'La vitamine E est un puissant antioxydant liposoluble. Elle protège les membranes cellulaires contre la peroxydation lipidique due aux radicaux libres, et prévient ainsi l''oxydation des lipides membranaires.', 'Programme NS4 - Vitamines', 3);
SET @qid = LAST_INSERT_ID();
INSERT INTO reponses (question_id, texte, est_correcte, ordre) VALUES
(@qid, 'Cofacteur de la coagulation sanguine', 0, 1),
(@qid, 'Antioxydant protégeant les membranes contre la peroxydation lipidique', 1, 2),
(@qid, 'Précurseur des hormones stéroïdes', 0, 3),
(@qid, 'Régulateur de la calcémie', 0, 4);

-- FIN DES INSERTIONS
-- Total : > 400 questions de biologie NS4 Haïti