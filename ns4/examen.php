<?php
$pageTitle = 'Examens Passés - NS4';
$classeActive = 'ns4';
require_once __DIR__ . '/../includes/functions.php';

$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');
$name = getStudentName();

// ─────────────────────────────────────────────────────────────────────────────
// Icônes par matière (correspondance souple)
// ─────────────────────────────────────────────────────────────────────────────
function getIcon(string $fichier): string {
    $f = mb_strtolower($fichier);
    if (str_contains($f, 'anglais'))                                          return '🇬🇧';
    if (str_contains($f, 'kreyol') || str_contains($f, 'kreyòl')
        || str_contains($f, 'creol'))                                         return '🇭🇹';
    if (str_contains($f, 'espagnol'))                                         return '🇪🇸';
    if (str_contains($f, 'français') || str_contains($f, 'francais'))        return '📝';
    if (str_contains($f, 'math'))                                             return '🔢';
    if (str_contains($f, 'chimie'))                                           return '⚗️';
    if (str_contains($f, 'physique') || str_contains($f, 'physic'))          return '⚡';
    if (str_contains($f, 'svt') || str_contains($f, 'biologie')
        || str_contains($f, 'géologie') || str_contains($f, 'geologie'))     return '🌿';
    if (str_contains($f, 'hist') || str_contains($f, 'géo')
        || str_contains($f, 'geo'))                                           return '🌍';
    if (str_contains($f, 'philo'))                                            return '🤔';
    if (str_contains($f, 'econom'))                                           return '📊';
    if (str_contains($f, 'informat'))                                         return '💻';
    if (str_contains($f, 'arts') || str_contains($f, 'musique'))             return '🎨';
    return '📄';
}

// ─────────────────────────────────────────────────────────────────────────────
// Nom d'affichage lisible à partir du nom de fichier NS4
// Exemple : Anglais_2022_LLA_Dallas.pdf → Anglais · LLA · Dallas
// ─────────────────────────────────────────────────────────────────────────────
function nomAffichage(string $fichier): string {
    $base = pathinfo($fichier, PATHINFO_FILENAME);

    $matiereMap = [
        'anglais'    => 'Anglais',
        'arts'       => 'Arts & Musiques',
        'chimie'     => 'Chimie',
        'economie'   => 'Économie',
        'économie'   => 'Économie',
        'espagnol'   => 'Espagnol',
        'hist-géo'   => 'Hist-Géo',
        'hist-geo'   => 'Hist-Géo',
        'informatique' => 'Informatique',
        'kreyol'     => 'Kreyòl',
        'maths'      => 'Mathématiques',
        'math'       => 'Mathématiques',
        'philo'      => 'Philosophie',
        'physique'   => 'Physique',
        'svt'        => 'SVT',
        'géologie'   => 'Géologie',
        'geologie'   => 'Géologie',
        'bio-géo'    => 'Bio-Géo',
        'bio-geo'    => 'Bio-Géo',
    ];

    $parts = explode('_', $base);
    $matiere = strtolower($parts[0] ?? '');
    $label   = $matiereMap[$matiere] ?? ($parts[0] ?? $base);

    $session = '';
    foreach ($parts as $i => $p) {
        if ($i < 2) continue;
        if (preg_match('/^(LLA|SES|SMP|SVT|SMO|SM)/', strtoupper($p))) {
            $session = strtoupper($p);
            break;
        }
    }

    $keyword = '';
    $last = end($parts);
    if ($last && !preg_match('/^\d{4}$/', $last) && !preg_match('/^(LLA|SES|SMP|SVT|SMO|SM)$/i', $last)) {
        $keyword = preg_replace('/([-_]?(NS|SR|B)$)/i', '', $last);
        $keyword = preg_replace('/-NS$|-SR$/i', '', $keyword);
    }

    $parts_display = array_filter([$label, $session, $keyword]);
    return implode(' · ', $parts_display);
}

$matieres = [
    'Anglais'      => 'Anglais',
    'Arts'         => 'Arts',
    'Chimie'       => 'Chimie',
    'Economie'     => 'Économie',
    'Espagnol'     => 'Espagnol',
    'Hist-Geo'     => 'Hist-Géo',
    'Informatique' => 'Informatique',
    'Kreyol'       => 'Kreyòl',
    'Maths'        => 'Mathématiques',
    'Philo'        => 'Philosophie',
    'Physique'     => 'Physique',
    'SVT'          => 'SVT / Bio-Géo',
];

$fichiers_par_matiere = [

    'Anglais' => [
        'Anglais_2015_Atlanta.docx',
        'Anglais_2016_Anserine.docx',
        'Anglais_2016_Antan.docx',
        'Anglais_2016_Antenais.docx',
        'Anglais_2016_Antheve.docx',
        'Anglais_2016_Anthrax.docx',
        'Anglais_2018_LLA_Connect.pdf',
        'Anglais_2018_SES-SVT-SMP_Speech.pdf',
        'Anglais_2019_LLA_Catfish.pdf',
        'Anglais_2019_LLA_Convivial.pdf',
        'Anglais_2019_LLA_Declaim.pdf',
        'Anglais_2019_SES-SVT-SMO_Emulation.pdf',
        'Anglais_2019_SES-SVT-SMP_Country.pdf',
        'Anglais_2019_SES-SVT-SMP_Doleful.pdf',
        'Anglais_2020_LLA_Business.pdf',
        'Anglais_2020_LLA_Currently.pdf',
        'Anglais_2020_LLA_Finacial.pdf',
        'Anglais_2020_SES-SVT-SMP_According.pdf',
        'Anglais_2020_SES-SVT-SMP_Investment.pdf',
        'Anglais_2020_SES-SVT-SMP_Sometimes.pdf',
        'Anglais_2021_LLA_Gabfest.pdf',
        'Anglais_2021_SES-SVT-SMP_Decide.pdf',
        'Anglais_2021_SES-SVT-SMP_Frozen.pdf',
        'Anglais_2021_SES-SVT-SMPSVT-SES-SMP_Appoint.pdf',
        'Anglais_2022_LLA_Atlanta.pdf',
        'Anglais_2022_LLA_Dallas.pdf',
        'Anglais_2022_LLA_Detroit.pdf',
        'Anglais_2022_LLA_Honolulu.pdf',
        'Anglais_2022_LLA_Peaceful.docx',
        'Anglais_2022_LLA_Portland.pdf',
        'Anglais_2022_LLA_Trustful.docx',
        'Anglais_2022_LLA_Unthinkable.docx',
        'Anglais_2022_SES-SMP-SVT_Austin.pdf',
        'Anglais_2022_SES-SMP-SVT_CalmSR.docx',
        'Anglais_2022_SES-SMP-SVT_Cheerful.docx',
        'Anglais_2022_SES-SMP-SVT_Cleveland.pdf',
        'Anglais_2022_SES-SMP-SVT_Faithful.docx',
        'Anglais_2022_SES-SMP-SVT_Fresno.pdf',
        'Anglais_2022_SES-SMP-SVT_Indianapolis.pdf',
        'Anglais_2022_SES-SMP-SVT_Jacksonville.pdf',
        'Anglais_2022_SES-SMP-SVT_Nashville.pdf',
        'Anglais_2022_SES-SMP-SVT_OptimisticSR.docx',
        'Anglais_2022_SES-SMP-SVT_Pittsburgh.pdf',
        'Anglais_2022_SES-SMP-SVT_PositiveSR.docx',
        'Anglais_2022_SES-SMP-SVT_Tucson.pdf',
        'Anglais_2022_SES-SMP-SVT_Unbelievable.docx',
        'Anglais_2022_SES-SMP-SVT_Milwaukee.pdf',
        'Anglais_2022_SES-SVT-SMP_Tucson.pdf',
        'Anglais_SES-SVT-SMP_Milwaukee.pdf',
    ],

    'Arts' => [
        'Arts_2002_Tambour.pdf',
        'Arts_2015_Melodie.docx',
        'Arts_2016_Ibo.docx',
        'Arts_2016_Nago.docx',
        'Arts_2016_Tchatcha.docx',
        'Arts_2016_Violon.docx',
        'Arts_2016_Yanvalou.docx',
        'Arts_2018_Folklore.pdf',
        'Arts_2019_Espace.pdf',
        'Arts_2019_Mysticisme.pdf',
        'Arts_2019_Peinture.pdf',
        'Arts_2020_LLA_Chopin.pdf',
        'Arts_2020_LLA_Hector.pdf',
        'Arts_2020_LLA_Mozart.pdf',
        'Arts_2020_LLA_Occide.pdf',
        'Arts_2021_LLA_Albert.pdf',
        'Arts_2021_LLA_Pyramide.pdf',
        'Arts_2021_LLA_Sébastient.pdf',
        'Arts_2022_Acapala.pdf',
        'Arts_2022_Artisanale.doc',
        'Arts_2022_Carnaval.pdf',
        'Arts_2022_Compas.pdf',
        'Arts_2022_Compas_Compas.pdf',
        'Arts_2022_LLA_Souvenance.pdf',
        'Arts_2022_Saint-Soleil.pdf',
        'Arts_2022_Saint-Soleil.doc',
        'Arts_2022_Tambour.pdf',
        'Arts_2022_Théâtre.doc',
        'Arts_2022_Tiga.doc',
        'Arts_2022_Yanvalou.pdf',
        'Arts_2022-Rara.pdf',
    ],

    'Chimie' => [
        'Chimie_020_LLA_Dioxyde.pdf',
        'Chimie_2015_Oxydation.docx',
        'Chimie_2016_Polyacide.docx',
        'Chimie_2016_Polyamide.docx',
        'Chimie_2016_Polymorphe.docx',
        'Chimie_2016_Polyoside.docx',
        'Chimie_2018_LLA_Organique.pdf',
        'Chimie_2018_SES_Aldéhyde.pdf',
        'Chimie_2018_SVT-SMP_Ethanol.pdf',
        'Chimie_2019_LLA_Glucose.pdf',
        'Chimie_2019_LLA_Hydrogène.pdf',
        'Chimie_2019_LLA_Lipide.pdf',
        'Chimie_2019_SES_Alcool.pdf',
        'Chimie_2019_SES_Amidon.pdf',
        'Chimie_2019_SES_Molaire.pdf',
        'Chimie_2019_SES_Monoxyde.pdf',
        'Chimie_2019_SES_Tertiaire.pdf',
        'Chimie_2019_SVT-SMP_Ethanol.pdf',
        'Chimie_2019_SVT-SMP_Propène.pdf',
        'Chimie_2019_SVT-SMP_Substance.pdf',
        'Chimie_2020_LLA_Isomère.pdf',
        'Chimie_2020_SES_Carbure.pdf',
        'Chimie_2020_SES_Hydrocarbure.pdf',
        'Chimie_2020_SES_Molaire.pdf',
        'Chimie_2020_SVT-SMP_Acétate-NS.pdf',
        'Chimie_2020_SVT-SMP_Éthanol-NS.pdf',
        'Chimie_2020_SVT-SMP_Sodium.pdf',
        'Chimie_2021_SES-LLA_Geotextile.pdf',
        'Chimie_2021_SES-LLA_Redox.pdf',
        'Chimie_2021_SVT-SMP_Acétique.pdf',
        'Chimie_2021_SVT-SMP_Acide.pdf',
        'Chimie_2021_SVT-SMP_Fixateur.pdf',
        'Chimie_2021_SVT-SMP_Fondation.pdf',
        'Chimie_2021_SVT-SMP_Geoscience.pdf',
        'Chimie_2022_LLA_CobaltSR.docx',
        'Chimie_2022_LLA_Covalentes SR.docx',
        'Chimie_2022_LLA_Organomécanique.docx',
        'Chimie_2022_SES_Brome.docx',
        'Chimie_2022_SES_Hydrocarbures.docx',
        'Chimie_2022_SES_Inorganique.docx',
        'Chimie_2022_SES_Métabolisme.docx',
        'Chimie_2022_SES_Polypeptidiques.docx',
        'Chimie_2022_SES_Quinine.docx',
        'Chimie_2022_SMP-SVT_Alcool SR.docx',
        'Chimie_2022_SMP-SVT_Altman.pdf',
        'Chimie_2022_SMP-SVT_Aston.pdf',
        'Chimie_2022_SMP-SVT_Atome SR.docx',
        'Chimie_2022_SMP-SVT_Bain.pdf',
        'Chimie_2022_SMP-SVT_Balandine.pdf',
        'Chimie_2022_SMP-SVT_Barbier.pdf',
        'Chimie_2022_SMP-SVT_Bartlett.pdf',
        'Chimie_2022_SMP-SVT_Barton.pdf',
        'Chimie_2022_SMP-SVT_Darcet.pdf',
        'Chimie_2022_SMP-SVT_Ion SR.docx',
        'Chimie_2022_SMP-SVT_Liaison SR.docx',
        'Chimie_2022_SMP-SVT_Macromolécule SR.docx',
        'Chimie_2022_SMP-SVT_Molécule SR.docx',
        'Chimie_2022_SMP-SVT_Welsbach.pdf',
        'Chimie_2022_SMP-SVT_Barlett.pdf',
        'Chim_2020_SMP-SVT_Propanone.pdf',
    ],

    'Economie' => [
        'Économie_2015_Empinar.docx',
        'Économie_2016_Écologisme.docx',
        'Économie_2016_Économétrie.docx',
        'Économie_2016_Écorner.docx',
        'Économie_2016_Écouler.docx',
        'Économie_2016_Écoutille.docx',
        'Economie_2018_SES_Ménage.pdf',
        'Economie_2018_SMP_Marginal.pdf',
        'Économie_2019_SES_Croissance.pdf',
        'Économie_2019_SES_Élasticité.pdf',
        'Économie_2019_SES_Ménage.pdf',
        'Économie_2019_SES_Monnaie.pdf',
        'Économie_2021_SES_Épargne.pdf',
        'Économie_2021_SES_Ménage.pdf',
        'Économie_2021_SES_Recette.pdf',
        'Économie_2022_SES_Aglietta.pdf',
        'Économie_2022_SES_Bastiat.pdf',
        'Économie_2022_SES_Becker.pdf',
        'Économie_2022_SES_Boltanski.pdf',
        'Économie_2022_SES_Braudel.pdf',
        'Économie_2022_SES_Budget.docx',
        'Économie_2022_SES_Coase.pdf',
        'Économie_2022_SES_Cohen.pdf',
        'Économie_2022_SES_Croissance.docx',
        'Économie_2022_SES_Debreu.pdf',
        'Économie_2022_SES_Favereau.pdf',
        'Économie_2022_SES_Hotelling.pdf',
        'Économie_2022_SES_Inflation.docx',
        'Économie_2022_SES_Investissement.docx',
        'Économie_2022_SES_Kenen.pdf',
        'Économie_2022_SES_Keynes.pdf',
        'Économie_2022_SES_Lucas.pdf',
        'Économie_2022_SES_Mandeville.pdf',
        'Économie_2022_SES_Ménage.docx',
        'Économie_2022_SES_Mercantilisme.docx',
        'Économie_2022_SES_Mitchell.pdf',
        'Économie_2022_SES_Rostov.pdf',
    ],

    'Espagnol' => [
        'Espagnol_2002_LLA_Mexico.pdf',
        'Espagnol_2015_Echada.docx',
        'Espagnol_2016_Escalade.docx',
        'Espagnol_2016_Escamoter.docx',
        'Espagnol_2016_Escarbot.docx',
        'Espagnol_2016_Espadon.docx',
        'Espagnol_2016_Espalier.docx',
        'Espagnol_2018_LLA_Escapada.pdf',
        'Espagnol_2018_SES-SVT_Escachar.pdf',
        'Espagnol_2019_LLA_Entonces.pdf',
        'Espagnol_2019_SES-SVT-SMP_Intelectual.pdf',
        'Espagnol_2019_SES-SVT-SMP_Necesario.pdf',
        'Espagnol_2019_SES-SVT-SMP_Renunciar.pdf',
        'Espagnol_2020_SES-SVT-SMP_Impacto.pdf',
        'Espagnol_2020_SES-SVT-SMP_Naturales.pdf',
        'Espagnol_2021_LLA_Indicado.pdf',
        'Espagnol_2021_SES-SVT-SMO_Derecho.pdf',
        'Espagnol_2021_SES-SVT-SMP_Principios.pdf',
        'Espagnol_2021_SVT-SM-SES_Descri.pdf',
        'Espagnol_2021_SVT-SM-SES_Recogida.pdf',
        'Espagnol_2021_SVT-SM-SES_Vivienda.pdf',
        'Espagnol_2022_LLA_Belmopan.pdf',
        'Espagnol_2022_LLA_Inconcible.docx',
        'Espagnol_2022_LLA_Managua.pdf',
        'Espagnol_2022_LLA_Montevideo.pdf',
        'Espagnol_2022_LLA_Nicaragua.pdf',
        'Espagnol_2022_LLA_Paramaribo.pdf',
        'Espagnol_2022_LLA_Reyalado.docx',
        'Espagnol_2022_LLA+Pacifico.docx',
        'Espagnol_2022_SES-SMP-SVT_Asuncion.pdf',
        'Espagnol_2022_SES-SMP-SVT_Brasil.pdf',
        'Espagnol_2022_SES-SMP-SVT_SanJuan.pdf',
        'Espagnol_2022_SES-SMP-SVT_SanSalvador.pdf',
        'Espagnol_2022_SVT-SES-SMP_Alegremente.docx',
        'Espagnol_2022_SVT-SES-SMP_Confiado.docx',
        'Espagnol_2022_SVT-SES-SMP_Increíble.docx',
        'Espagnol_2022_SVT-SES-SMP_Leal.docx',
        'Espagnol_2022_SVT-SES-SMP_Optimista.docx',
        'Espagnol_2022_SVT-SES-SMP_Tranquilamente.docx',
        'Espagnol_2022_LLA_Mexico.pdf',
    ],

    'Hist-Geo' => [
        'Hist-Géo_2015_Hypotesis.docx',
        'Hist-Géo_2016_août.docx',
        'Hist-Géo_2016_Hisser.docx',
        'Hist-Géo_2016_Histamine.docx',
        'Hist-Géo_2016_Historier.docx',
        'Hist-Géo_2016_Histrion.docx',
        'Hist-Géo_2016_Hystolise.docx',
        'Hist-Géo_2018_LLA-SVT-SMP_Population.pdf',
        'Hist-Géo_2018_SES_Économie.pdf',
        'Hist-Géo_2019_LLA-SVT-SMO_Développement.pdf',
        'Hist-Géo_2019_LLA-SVT-SMP_Continent.pdf',
        'Hist-Géo_2019_LLA-SVT-SMP_Croissance.pdf',
        'Hist-Géo_2019_SES_Accroissement.pdf',
        'Hist-Géo_2019_SES_Capital.pdf',
        'Hist-Géo_2020_Tous_Agraire.pdf',
        'Hist-Géo_2021_SES-LLA_Echographiee.pdf',
        'Hist-Géo_2021_SES-LLA_Edaphique.pdf',
        'Hist-Géo_2021_SVT-SMP_Contagion.pdf',
        'Hist-Géo_2021_SVT-SMP_Continent.pdf',
        'Hist-Géo_2021_Tous_Développement.pdf',
        'Hist-Géo_2021_tous_Développement.pdf',
        'Hist-Géo_2022_LLA-SES_Climatologie.docx',
        'Hist-Géo_2022_LLA-SES_Dessalines.docx',
        'Hist-Géo_2022_LLA-SES_Ferou.pdf',
        'Hist-Géo_2022_LLA-SES_Géodésie.docx',
        'Hist-Géo_2022_LLA-SES_Louis Gabart.pdf',
        'Hist-Géo_2022_LLA-SES_Magloire Ambroise.pdf',
        'Hist-Géo_2022_LLA-SES_Magny.pdf',
        'Hist-Géo_2022_LLA-SES_Marie-Jeanne.pdf',
        'Hist-Géo_2022_LLA-SES_Paul Romain.pdf',
        'Hist-Géo_2022_LLA-SES_Pierrot.pdf',
        'Hist-Géo_2022_LLA-SES_Stenio Vincent.pdf',
        'Hist-Géo_2022_LLA-SES_Yayou.pdf',
        'Hist-Géo_2022_LLS-SES_Suzanne Louverture.pdf',
        'Hist-Géo_2022_SMP - SVT_Dahomey.docx',
        'Hist-Géo_2022_SMP - SVT_Océanographie.docx',
        'Hist-Géo_2022_SMP - SVT_Révolution.docx',
        'Hist-Géo_2022_SMP-SVT_Boisrond Tonnerre.pdf',
        'Hist-Géo_2022_SMP-SVT_Boukman.pdf',
        'Hist-Géo_2022_SMP-SVT_Cangé.pdf',
        'Hist-Géo_2022_SMP-SVT_Cangé b.pdf',
        'Hist-Géo_2022_SMP-SVT_Chareron.pdf',
        'Hist-Géo_2022_SMP-SVT_Derenancourt.pdf',
        'Hist-Géo_2022_SMP-SVT_Macajoux.pdf',
        'Hist-Géo_2022_SMP-SVT_Sanite Bel-Air.pdf',
        'Hist-Géo_2022_SMP-SVT_Sans-Soucis.pdf',
    ],

    'Informatique' => [
        'Informatique_2015_1.docx',
        'Informatique_2016_Exode.docx',
        'Informatique_2016_Isotron.docx',
        'Informatique_2016_Italique.docx',
        'Informatique_2016_Item.docx',
        'Informatique_2016_Ivoire.docx',
        'Informatique_2018_LLA_Système.pdf',
        'Informatique_2018_SES-SMP_Algorithme.pdf',
    ],

    'Kreyol' => [
        'Kreyol_2016_Crepier.docx',
        'Kreyol_2016_Crevette.docx',
        'Kreyol_2016_Crinoline.docx',
        'Kreyol_2016_Crique.docx',
        'Kretol_2021_LLA_Vwyaj.pdf',
        'Kreyol_2018_LLA_Komanse.pdf',
        'Kreyol_2018_SES-SVT-SMP_Pankat.pdf',
        'Kreyol_2019_LLA_Koresponn.pdf',
        'Kreyol_2019_LLA_Reflechi.pdf',
        'Kreyol_2019_LLA_Tetansanm.pdf',
        'Kreyol_2019_SES-SVT-SMP_Lanati.pdf',
        'Kreyol_2020_SES-SVT-SMP_Travay.pdf',
        'Kreyol_2021_SES-SMP-SVT_Pwoteje.pdf',
        'Kreyol_2021_SES-SMP-SVT_Respekte.pdf',
        'Kreyol_2021_SES-SVT-SMP_Antoloji.pdf',
        'Kreyol_2022_LLA_Konfyans.docx',
        'Kreyol_2022_LLA_Patizan.docx',
        'Kreyol_2022_LLA_Pistach.pdf',
        'Kreyol_2022_LLA_Tizon dife.pdf',
        'Kreyol_2022_SES-SMP-SVT_Ayiti.docx',
        'Kreyol_2022_SES-SMP-SVT_Brasè.pdf',
        'Kreyol_2022_SES-SMP-SVT_Lakay.docx',
        'Kreyol_2022_SES-SMP-SVT_Lakou.docx',
        'Kreyol_2022_SES-SMP-SVT_Lodyanse.docx',
        'Kreyol_2022_SES-SMP-SVT_Matom ann.pdf',
        'Kreyol_2022_SES-SVT-SMO_Matomann.pdf',
        'Kreyol_2022_SES-SVT-SMO_Tabatye.pdf',
        'Kreyol_2022_SES-SVT-SMPLLA_Krich.pdf',
        'Kreyol_2022_SVT_Potorik.pdf',
        'Kreyol_2022_SVT_Kotof.pdf',
        'Kreyol_2022_SES-SMP-SVT_Matomann.pdf',
    ],

    'Maths' => [
        'Maths_2015_Minorant.docx',
        'Maths-2015 (6 examens).docx',
        'Maths_2016_Marégraphe.docx',
        'Maths_2016_Marginer.docx',
        'Maths_2016_Marnage.docx',
        'Maths_2018_LLA_Aléatoire.pdf',
        'Maths_2018_LLA-METHODIQUE.pdf',
        'Maths_2018_LLA_Orthogonal.pdf',
        'Maths_2018_SES_Paramètre.pdf',
        'Maths_2018_SVT-SMP_Continue.pdf',
        'Maths_2019_LLA_Aléatoire.pdf',
        'Maths_2019_LLA_Aléatroire.pdf',
        'Maths_2019_LLA_Orthogonal.pdf',
        'Maths_2019_SES_Graphique.pdf',
        'Maths_2019_SES_Orthonormé.pdf',
        'Maths_2019_SVT-SMP_Élasticité.pdf',
        'Maths_2019_SVT-SMP_Evolution.pdf',
        'Maths_2019_SVT-SMP_Polynime.pdf',
        'Maths_2020_LLA_03.pdf',
        'Maths_2020_LLA_Collection-NS.pdf',
        'Maths_2020_LLA_Marginal-NS.pdf',
        'Maths_2020_SVT-SMP_Asymptote-NS.pdf',
        'Maths_2020_SVT-SMP_Graphique-NS.pdf',
        'Maths_2021_LLA_Fonction.pdf',
        'Maths_2021_LLA_Interquartiles.pdf',
        'Maths_2021_LLA_Numérique.pdf',
        'Maths_2021_LLA_Récurrence.pdf',
        'Maths_2021_SES_Arithmétique.pdf',
        'Maths_2021_SES_Expression.pdf',
        'Maths_2021_SVT-SMP_Arithmétic.pdf',
        'Maths_2021_SVT-SMP_Barycentre.pdf',
        'Maths_2021_SVT-SMP_Géométrique.pdf',
        'Maths_2021_SVT-SMP_Triangle.pdf',
        'Maths_2022_LLA_Espace.docx',
        'Maths_2022_LLA_Négation.docx',
        'Maths_2022_LLA_Numérique.pdf',
        'Maths_2022_LLA_Opérations.docx',
        'Maths_2022_LLA_Résolution.pdf',
        'Maths_2022_SES_Absurde.pdf',
        'Maths_2022_SES_Axionatisation.docx',
        'Maths_2022_SES_Codage.pdf',
        'Maths_2022_SES_Exponentiel.pdf',
        'Maths_2022_SES_Graphique.pdf',
        'Maths_2022_SES_Implication.docx',
        'Maths_2022_SES_Logique.pdf',
        'Maths_2022_SES_Mesure.docx',
        'Maths_2022_SES_Numérisation.docx',
        'Maths_2022_SES_Structures.docx',
        'Maths_2022_SES_Topologie.docx',
        'Maths_2022_SMP-SVT_Dérivation.pdf',
        'Maths_2022_SMP-SVT_Limite.pdf',
        'Maths_2022_SMP-SVT_Parabole.pdf',
        'Maths_2022_SMP-SVT_Parallele.pdf',
        'Maths_2022_SMP-SVT_Possibilité.pdf',
        'Maths_2022_SMP-SVT_Sécante.pdf',
        'Maths_2022_SVT-SMP_Angle.docx',
        'Maths_2022_SVT-SMP_Démarche.docx',
        'Maths_2022_SVT-SMP_Discrète.docx',
        'Maths_2022_SVT-SMP_Hyp erbole.pdf',
        'Maths_2022_SVT-SMP_Imaginaire.docx',
        'Maths_2022_SVT-SMP_Limite.pdf',
        'Maths_2022_SVT-SMP_Réel.docx',
        'Maths_2022_SVT-SMP_Secante.pdf',
        'Maths_2022_SVT-SMP_Sécante.pdf',
        'Maths_2022_SVT-SMPDémonstration.docx',
        'Maths_2022_SVT-SMP_Tangente.pdf',
    ],

    'Philo' => [
        'Philo_2015_Pascal.docx',
        'Philo_2016_Philanthrope.docx',
        'Philo_2016_Philatéliste.docx',
        'Philo_2016_Philein.docx',
        'Philo_2016_Philologue.docx',
        'Philo_2016_Philosopher.docx',
        'Philo_2018_LLA_Religion.pdf',
        'Philo_2018_SES-SVT-SMP_Antithèse.pdf',
        'Philo_2019_LLA_Articulation.pdf',
        'Philo_2019_LLA_Connaissance.pdf',
        'Philo_2019_LLA_Objectif.pdf',
        'Philo_2019_SES-SVT-SMP_Humanité.pdf',
        'Philo_2019_SES-SVT-SMP_Progrif.pdf',
        'Philo_2020_SES-SVT-SMP_Métaphysique.pdf',
        'Philo_2021_LLA_Arcade.pdf',
        'Philo_2021_LLA_Canadair.pdf',
        'Philo_2021_SES-SVT-SMP_Crématoire.pdf',
        'Philo_2021_SES-SVT-SMP_Progression-NS.pdf',
        'Philo_2021_SVT-SMP-SES_Arbrisseau.pdf',
        'Philo_2021_SVT-SMP-SES_Carlingue.pdf',
        'Philo_2022_LLA_Anthropogie.docx',
        'Philo_2022_LLA_Apologie.docx',
        'Philo_2022_LLA_Esthétique.docx',
        'Philo_2022_LLA_Intangible.docx',
        'Philo_2022_LLA-SES_Arendt.pdf',
        'Philo_2022_LLA-SES_Dalembert.pdf',
        'Philo_2022_LLA-SES_Hobbes.pdf',
        'Philo_2022_LLA-SES_Platon.pdf',
        'Philo_2022_LLA-SES_Socrate.pdf',
        'Philo_2022_LLA-SES_Spinoza.pdf',
        'Philo_2022_SES_SVT-SMP_Nature.docx',
        'Philo_2022_SES-SVT-SMP_Culture.docx',
        'Philo_2022_SES-SVT-SMP_Épistémologie.docx',
        'Philo_2022_SES-SVT-SMP_Éthique.docx',
        'Philo_2022_SES-SVT-SMP_Logique.docx',
        'Philo_2022_SMP-SVT_Descartes.pdf',
        'Philo_2022_SMP-SVT_Kant.pdf',
        'Philo_2022_SMP-SVT_Marx.pdf',
        'Philo_2022_SMP-SVT_Montesquieu.pdf',
        'Philo_2022_SMP-SVT_Rousseau.pdf',
        'Philo_2022_SMP-SVT_Voltaire.pdf',
        'Philo_2022_SMP-SVT_Voltaire B.pdf',
    ],

    'Physique' => [
        'Physique_2015_SVT-SMP_Photon.docx',
        'Physique_2016_SVT-SMP_Philosophale.docx',
        'Physique_2016_SVT-SMP_Physicalisme.docx',
        'Physique_2016_SVT-SMP_Physico.docx',
        'Physique_2016_SVT-SMP_Phytophage.docx',
        'Physique_2016_SVT-SMP_Phytotron.docx',
        'Physique_2018_SVT-SMP_Dipole.pdf',
        'Physique_2019_SES_Cinétique.pdf',
        'Physique_2019_SES_Impédance.pdf',
        'Physique_2019_SVT-SMP_Aimantation.pdf',
        'Physique_2019_SVT-SMP_Condensateur.pdf',
        'Physique_2019_SVT-SMP_Induction.pdf',
        'Physique_2019_SVT-SMP_Transformateur.pdf',
        'Physique_2020_SVT-SMP_Régression.pdf',
        'Physique_2020_SVT-SMP_Tangente.pdf',
        'Physique_2021_SVT-SMP_Armature.pdf',
        'Physique_2021_SVT-SMP_Balistique.pdf',
        'Physique_2021_SVT-SMP_Barlow.pdf',
        'Physique_2021_SVT-SMP_Bobine.pdf',
        'Physique_2021_SVT-SMP_Courant.pdf',
        'Physique_2021_SVT-SMP_Énergie.pdf',
        'Physique_2021_SVT-SMP_Fourneau.pdf',
        'Physique_2022_SES_Big bang.docx',
        'Physique_2022_SES_Cosmique.docx',
        'Physique_2022_SES_Électromagnétisme.docx',
        'Physique_2022_SES_Englert.pdf',
        'Physique_2022_SES_Étoile.docx',
        'Physique_2022_SES_Gravité.docx',
        'Physique_2022_SES_Kajita.pdf',
        'Physique_2022_SES_Marconi.pdf',
        'Physique_2022_SES_Oncle.docx',
        'Physique_2022_SES_Perl.pdf',
        'Physique_2022_SES_Picard.pdf',
        'Physique_2022_SMP-SVT_Becquerel.pdf',
        'Physique_2022_SMP-SVT_Charpak.pdf',
        'Physique_2022_SMP-SVT_Curien.pdf',
        'Physique_2022_SMP-SVT_Heiseiberg.pdf',
        'Physique_2022_SMP-SVT_Laroche.pdf',
        'Physique_2022_SMP-SVT_Wineland.pdf',
        'Physique_2022_SMP-SVT_Wineland b.pdf',
        'Physique_2022_SVT-SMP_Charpak.pdf',
        'Physique_2022_SVT-SMP_Curien.pdf',
        'Physique_2022_SVT-SMP_GPS.docx',
        'Physique_2022_SVT-SMP_Lumière.docx',
        'Physique_2022_SVT-SMP_Plasma.docx',
        'Physique_2022_SVT-SMP_Polymères.docx',
        'Physique_2022_SVT-SMP_Quanta.docx',
        'Physique_2022_SVT-SMP_Schrodinger.pdf',
        'Physique_2022_SVT-SMP_Vitesse.docx',
    ],

    'SVT' => [
        'Bio-Géo_2016_Homozygote.doc',
        'Bio-Géo_2016_Polymérase.doc',
        'Bio-Géo_2016_Polymérique.doc',
        'Bio-Géo_2016_Polynévrite.doc',
        'Bio-Géo_2016_Polype.doc',
        'Bio-Géo_2016_Protomère.doc',
        'Géologie_2016_LLA_SES_SMP_Protomère.doc',
        'Géologie_2016_LLA_SES_SMP_Polymérique.doc',
        'Géologie_2016_LLA_SES_SMP_Polynévrite.doc',
        'Géologie_2016_LLA_SES_SMP_Polype.doc',
        'Géologie_2018_SES-SMP_Faune.pdf',
        'Géologie_2018_SES-SMP_Gisement.pdf',
        'SVT_2002_LLA_Histologie.pdf',
        'SVT_2015_SVT-05.doc',
        'SVT_2018_SVT_Génétique.pdf',
        'SVT_2019_SES-SMP_Cytoplasme.pdf',
        'SVT_2019_SES-SMP_Vibrion.pdf',
        'SVT_2019_SVT_Gisement.pdf',
        'SVT_2019_SVT_Myopathie.pdf',
        'SVT_2019_SVT_Pancréas.pdf',
        'SVT_2020_SVT_Gamète-NS.pdf',
        'SVT_2021_SES-SMP_Claudiquer.pdf',
        'SVT_2021_SES-SMP_Gamète.pdf',
        'SVT_2021_SVT_Chnodriome.pdf',
        'SVT_2021_SVT_Cintrage.pdf',
        'SVT_2021_SVT_Claustration.pdf',
        'SVT_2021_SVT_Ocytocine.pdf',
        'SVT_2021_SVT_Prolactine.pdf',
        'SVT_2022_LLA-SES-SMP_Anticorps.pdf',
        'SVT_2022_LLA-SES-SMP_Cytologie.pdf',
        'SVT_2022_SES-SMP_Matériaux.docx',
        'SVT_2022_SES-SMP_Risques.docx',
        'SVT_2022_SES-SMP_Seisme.docx',
        'SVT_2022_SVT_Anatomie.pdf',
        'SVT_2022_SVT_Cardiaque.pdf',
        'SVT_2022_SVT_Conservation.docx',
        'SVT_2022_SVT_Élevage.docx',
        'SVT_2022_SVT_Génétique.docx',
        'SVT_2022_SVT_Glucogène.pdf',
        'SVT_2022_SVT_Histologie.pdf',
        'SVT_2022_SVT_Microbiologie.pdf',
        'SVT_2022_SVT_Morphologie.pdf',
        'SVT_2022_SVT_Morphologie B.pdf',
        'SVT_2022_SVT_Neuroscience.docx',
        'SVT_2022_SVT_Neurone.pdf',
        'SVT_2022_SVT_Paléontologie.pdf',
        'SVT_2022_SVT_Physiologie.pdf',
        'SVT_2022_SVT_Taximonie.docx',
        'SVT_2022_SVT_Virologie.docx',
        'SVT_2022_SVT_Vitamines.pdf',
        'SVT_2022_SVT_Zoologie.pdf',
    ],
];

$examens_par_annee = [];
foreach ($fichiers_par_matiere as $dossier => $fichiers) {
    foreach ($fichiers as $fichier) {
        if (preg_match('/_(\d{4})_/', $fichier, $m) || preg_match('/(\d{4})/', $fichier, $m)) {
            $annee = $m[1];
        } 
        $examens_par_annee[$annee][] = [
            'matiere' => $matieres[$dossier] ?? $dossier,
            'dossier' => $dossier,
            'fichier' => $fichier,
        ];
    }
}
krsort($examens_par_annee);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <link rel="shortcut icon" href="../images/logo.png" type="image/x-icon">
    <title><?= $pageTitle ?> - Quiz Ayiti</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --blue: #002395; --red: #d21034; --gold: #f1c40f; --green: #10b981;
            --purple: #7c3aed;
            --gray-50: #f8fafc; --gray-100: #f1f5f9; --gray-200: #e2e8f0;
            --gray-300: #cbd5e1; --gray-400: #94a3b8; --gray-500: #64748b;
            --gray-600: #475569; --gray-700: #334155; --gray-800: #1e293b;
            --gray-900: #0f172a; --white: #ffffff;
            --shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
            --shadow-md: 0 4px 6px rgba(0,0,0,0.07);
            --shadow-lg: 0 10px 25px rgba(0,0,0,0.08);
            --shadow-xl: 0 20px 40px rgba(0,0,0,0.12);
            --radius: 12px; --radius-lg: 16px; --radius-xl: 24px;
            --transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }
        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }
        html { font-size: 16px; scroll-behavior: smooth; -webkit-font-smoothing: antialiased; }
        body {
            font-family: 'Inter', system-ui, sans-serif;
            line-height: 1.6; color: var(--gray-800);
            background: linear-gradient(160deg, #fdf4ff 0%, var(--gray-50) 40%);
            display: flex; flex-direction: column; min-height: 100vh;
        }

        /* ═══════════════════ NAVBAR UNIFIÉE ═══════════════════ */
        .navbar {
            display: flex; justify-content: space-between; align-items: center;
            background: rgba(255,255,255,0.95); backdrop-filter: blur(10px);
            padding: 0 1.5rem;
            height: 70px; position: sticky; top: 0; z-index: 1000;
            border-bottom: 1px solid var(--gray-200); box-shadow: var(--shadow-sm);
        }
        .nav-brand { display: flex; align-items: center; gap: .75rem; text-decoration: none; }
        .nav-brand img { height: 44px; width: 44px; object-fit: contain; border-radius: var(--radius); }
        .nav-brand-text { font-size: 1.35rem; font-weight: 800; color: var(--gray-900); }
        .nav-brand-text span { color: var(--red); }
        .nav-brand:hover .nav-brand-text { color: var(--blue); }
        .nav-menu {
            display: flex; list-style: none;
            gap: 0.35rem;
            align-items: center;
        }
        .nav-menu a {
            color: var(--gray-600); text-decoration: none; font-weight: 500; font-size: .9rem;
            padding: 0.5rem 0.9rem;
            border-radius: var(--radius); transition: all var(--transition);
            white-space: nowrap;
        }
        .nav-menu a:hover { color: var(--blue); background: #eff6ff; }
        .nav-menu a.active { color: var(--white); background: var(--purple); font-weight: 600; }
        .nav-menu a.btn-apk {
            background: linear-gradient(135deg, var(--green), #059669); color: var(--white);
            font-weight: 600; box-shadow: 0 3px 10px rgba(16,185,129,.3);
            padding: 0.5rem 0.9rem;
        }
        .nav-menu a.btn-apk:hover { transform: translateY(-1px); box-shadow: 0 5px 14px rgba(16,185,129,.4); }
        .nav-toggle { display: none; flex-direction: column; background: none; border: none; cursor: pointer; gap: 5px; padding: 4px; }
        .nav-toggle .bar { width: 26px; height: 2.5px; background: var(--gray-700); border-radius: 2px; }

        .container { flex: 1; width: 100%; max-width: 1080px; margin: 0 auto; padding: 2.5rem 1.5rem; }

        .page-header { text-align: center; margin-bottom: 2.5rem; }
        .class-badge {
            display: inline-flex; align-items: center; gap: .5rem;
            background: linear-gradient(135deg, #fdf4ff, #ede9fe);
            color: var(--purple); font-weight: 600; font-size: .85rem;
            padding: .5rem 1.3rem; border-radius: 50px; margin-bottom: 1rem;
            border: 1px solid #ddd6fe;
        }
        .page-header h1 { font-size: clamp(1.7rem, 4vw, 2.5rem); font-weight: 800; color: var(--gray-900); line-height: 1.2; }
        .page-header h1 .highlight { background: linear-gradient(135deg, var(--purple), #8b5cf6); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .page-header .subtitle { color: var(--gray-500); font-size: .95rem; margin-top: .4rem; }
        .welcome-msg { display: inline-flex; align-items: center; gap: .5rem; background: #f0fdf4; color: #166534; font-weight: 600; font-size: .95rem; padding: .55rem 1.2rem; border-radius: 50px; border: 1px solid #bbf7d0; margin-top: .75rem; }

        .stats-bar { display: flex; flex-wrap: wrap; gap: .75rem; justify-content: center; margin-bottom: 2rem; }
        .stat-pill { display: flex; align-items: center; gap: .5rem; background: var(--white); border: 1px solid var(--gray-200); border-radius: 50px; padding: .55rem 1.2rem; font-size: .88rem; font-weight: 600; color: var(--gray-700); box-shadow: var(--shadow-sm); }
        .stat-pill .stat-num { color: var(--purple); font-weight: 800; font-size: 1rem; }

        .filter-bar { display: flex; flex-wrap: wrap; gap: .5rem; margin-bottom: 1.75rem; }
        .filter-btn {
            display: inline-flex; align-items: center; gap: .4rem;
            padding: .5rem 1rem; border-radius: 50px;
            border: 2px solid var(--gray-200); background: var(--white);
            font-size: .82rem; font-weight: 600; color: var(--gray-600);
            cursor: pointer; transition: all var(--transition);
        }
        .filter-btn:hover { border-color: var(--purple); color: var(--purple); background: #fdf4ff; }
        .filter-btn.active { border-color: var(--purple); background: var(--purple); color: var(--white); }
        .filter-btn .fbadge { background: rgba(255,255,255,0.25); border-radius: 50px; padding: .1rem .45rem; font-size: .75rem; }
        .filter-btn:not(.active) .fbadge { background: var(--gray-100); color: var(--gray-500); }

        .search-wrap { margin-bottom: 1.5rem; position: relative; }
        .search-wrap input {
            width: 100%; padding: .85rem 1rem .85rem 3rem;
            border: 2px solid var(--gray-200); border-radius: var(--radius-lg);
            font-family: inherit; font-size: .95rem; color: var(--gray-800);
            background: var(--white); outline: none; transition: border-color var(--transition);
            box-shadow: var(--shadow-sm);
        }
        .search-wrap input:focus { border-color: var(--purple); }
        .search-wrap .search-icon { position: absolute; left: 1rem; top: 50%; transform: translateY(-50%); font-size: 1.1rem; pointer-events: none; }

        .years-wrapper { display: flex; flex-direction: column; gap: .85rem; }
        .year-block { background: var(--white); border-radius: var(--radius-lg); overflow: hidden; box-shadow: var(--shadow-md); border: 1.5px solid var(--gray-200); transition: box-shadow var(--transition); }
        .year-block:hover { box-shadow: var(--shadow-lg); }
        .year-trigger {
            display: flex; align-items: center; gap: .85rem;
            padding: 1rem 1.25rem; cursor: pointer;
            user-select: none; border: none; background: none; width: 100%; text-align: left;
            transition: background var(--transition);
        }
        .year-trigger:hover { background: #fdf4ff; }
        .year-trigger.open { background: linear-gradient(90deg, #fdf4ff, #ede9fe); border-bottom: 1.5px solid var(--gray-200); }
        .yr-badge {
            width: 52px; height: 52px; flex-shrink: 0;
            background: linear-gradient(135deg, var(--purple), #6d28d9);
            color: var(--white); border-radius: var(--radius);
            display: flex; align-items: center; justify-content: center;
            font-weight: 800; font-size: .95rem;
            box-shadow: 0 4px 10px rgba(124,58,237,.25);
        }
        .yr-info { flex: 1; min-width: 0; }
        .yr-title { font-size: 1.05rem; font-weight: 700; color: var(--gray-900); }
        .yr-sub { font-size: .8rem; color: var(--gray-400); }
        .yr-count { flex-shrink: 0; background: var(--gray-100); color: var(--gray-600); font-size: .8rem; font-weight: 600; padding: .3rem .85rem; border-radius: 50px; }
        .yr-arrow { flex-shrink: 0; font-size: 1rem; color: var(--gray-400); transition: transform .3s ease; }
        .year-trigger.open .yr-arrow { transform: rotate(90deg); color: var(--purple); }

        .year-panel { display: none; padding: 1.25rem; }
        .year-panel.show { display: block; animation: fadeSlide .25s ease; }
        @keyframes fadeSlide { from { opacity: 0; transform: translateY(-8px); } to { opacity: 1; transform: translateY(0); } }

        .matiere-group { margin-bottom: 1.25rem; }
        .matiere-group:last-child { margin-bottom: 0; }
        .matiere-label {
            display: inline-flex; align-items: center; gap: .4rem;
            font-size: .78rem; font-weight: 700; color: var(--gray-500);
            text-transform: uppercase; letter-spacing: .06em;
            padding: .25rem .75rem; background: var(--gray-100);
            border-radius: 50px; margin-bottom: .75rem;
        }

        .file-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(170px, 1fr)); gap: .65rem; }
        .file-card {
            display: flex; flex-direction: column; align-items: center; justify-content: center;
            gap: .45rem; padding: 1rem .75rem;
            background: var(--gray-50); border: 2px solid var(--gray-200);
            border-radius: var(--radius); text-decoration: none; color: var(--gray-700);
            transition: all var(--transition); text-align: center; position: relative; overflow: hidden;
        }
        .file-card:hover { border-color: var(--purple); background: #fdf4ff; transform: translateY(-3px); box-shadow: 0 8px 20px rgba(124,58,237,.12); }
        .file-card:active { transform: translateY(-1px); }
        .file-emoji { font-size: 1.7rem; line-height: 1; }
        .file-name { font-weight: 600; font-size: .8rem; line-height: 1.3; color: var(--gray-700); word-break: break-word; }
        .file-ext { font-size: .68rem; font-weight: 700; letter-spacing: .04em; padding: .15rem .5rem; border-radius: 4px; background: var(--gray-200); color: var(--gray-500); }
        .file-ext.ext-pdf { background: #fee2e2; color: #b91c1c; }
        .file-ext.ext-docx, .file-ext.ext-doc { background: #dbeafe; color: #1e40af; }
        .file-ext.ext-jpg, .file-ext.ext-jpeg { background: #fef3c7; color: #92400e; }

        .btn-back { display: inline-flex; align-items: center; gap: .6rem; padding: .85rem 1.6rem; background: var(--gray-200); color: var(--gray-700); border: none; border-radius: var(--radius); font-size: .95rem; font-weight: 600; cursor: pointer; text-decoration: none; transition: all var(--transition); margin-top: 1rem; }
        .btn-back:hover { background: var(--gray-300); transform: translateX(-3px); }

        .footer { background: var(--white); border-top: 1px solid var(--gray-200); padding: 1.5rem; text-align: center; color: var(--gray-400); font-size: .85rem; margin-top: auto; }

        .year-block.hidden { display: none; }

        /* ═══════════════════ RESPONSIVE ═══════════════════ */
        @media (max-width: 768px) {
            .navbar { padding: 0 1.25rem; height: 60px; }
            .nav-menu {
                display: none; flex-direction: column;
                position: absolute; top: 60px; left: 0; width: 100%;
                background: var(--white); padding: 1rem;
                border-bottom: 1px solid var(--gray-200);
                box-shadow: var(--shadow-lg); z-index: 999;
                gap: 0.5rem;
            }
            .nav-menu.show { display: flex; }
            .nav-menu a {
                padding: 0.75rem 1rem;
                font-size: 0.95rem;
                width: 100%;
            }
            .nav-toggle { display: flex; }
            .container { padding: 1.5rem 1rem; }
            .file-grid { grid-template-columns: repeat(auto-fill, minmax(140px, 1fr)); gap: .55rem; }
            .yr-badge { width: 44px; height: 44px; font-size: .85rem; }
            .stats-bar { gap: .5rem; }
        }
        @media (min-width: 641px) and (max-width: 900px) {
            .nav-menu a { padding: 0.5rem 0.7rem; font-size: 0.85rem; }
            .nav-menu { gap: 0.25rem; }
        }
        @media (max-width: 480px) {
            .file-grid { grid-template-columns: 1fr 1fr; }
            .yr-count { display: none; }
        }
        @media (max-width: 340px) {
            .file-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

<!-- ═══════════════════════ NAVBAR UNIFIÉE ═══════════════════════ -->
<nav class="navbar">
    <a href="<?= $basePath ?>/index.php" class="nav-brand">
        <img src="<?= $basePath ?>/images/logo.png" alt="Quiz Ayiti">
        <span class="nav-brand-text">Quiz Ayiti</span>
    </a>
    <button class="nav-toggle" id="navToggle" aria-label="Menu">
        <span class="bar"></span><span class="bar"></span><span class="bar"></span>
    </button>
    <ul class="nav-menu" id="navMenu">
        <li><a href="<?= $basePath ?>/index.php">Accueil</a></li>
        <li><a href="<?= $basePath ?>/9e/index.php">9ème AF</a></li>
        <li><a href="<?= $basePath ?>/ns4/index.php" >NS4</a></li>
        <li><a href="<?= $basePath ?>/about/index.php">À propos</a></li>
        <li><a href="<?= $basePath ?>/download.php" >Télécharger l'app</a></li>
    </ul>
</nav>

<!-- ═══════════════════════ MAIN ═══════════════════════ -->
<main class="container">

    <div class="page-header">
        <div class="class-badge">🎓 Nouveaux Secondaires 4</div>
        <h1>Examens <span class="highlight">Passés</span></h1>
        <p class="subtitle">Épreuves officielles MENFP · NS4 · 2002 – 2022</p>
        <?php if ($name): ?>
            <div class="welcome-msg">👋 Bon courage, <strong><?= e($name) ?></strong> !</div>
        <?php endif; ?>
    </div>

    <?php
        $totalFichiers = array_sum(array_map('count', $examens_par_annee));
        $totalAnnees   = count($examens_par_annee);
        $totalMatieres = count($fichiers_par_matiere);
    ?>
    <div class="stats-bar">
        <div class="stat-pill">📅 <span class="stat-num"><?= $totalAnnees ?></span> années</div>
        <div class="stat-pill">📄 <span class="stat-num"><?= $totalFichiers ?></span> épreuves</div>
        <div class="stat-pill">📚 <span class="stat-num"><?= $totalMatieres ?></span> matières</div>
        <div class="stat-pill">🎯 <span class="stat-num">100 %</span> officiel MENFP</div>
    </div>

    <div class="filter-bar" id="filterBar">
        <button class="filter-btn active" data-matiere="all" onclick="filterMatiere(this, 'all')">
            🗂️ Toutes les matières <span class="fbadge"><?= $totalFichiers ?></span>
        </button>
        <?php foreach ($fichiers_par_matiere as $dossier => $flist): ?>
        <button class="filter-btn" data-matiere="<?= $dossier ?>" onclick="filterMatiere(this, '<?= $dossier ?>')">
            <?= getIcon($dossier) ?> <?= htmlspecialchars($matieres[$dossier] ?? $dossier) ?>
            <span class="fbadge"><?= count($flist) ?></span>
        </button>
        <?php endforeach; ?>
    </div>

    <div class="search-wrap">
        <span class="search-icon">🔍</span>
        <input type="text" id="searchInput" placeholder="Rechercher une année, matière ou mot-clé…" autocomplete="off">
    </div>

    <div class="years-wrapper" id="yearsWrapper">
        <?php foreach ($examens_par_annee as $annee => $items):
            $parMatiere = [];
            foreach ($items as $item) {
                $parMatiere[$item['dossier']][] = $item['fichier'];
            }
            $nbEpreuves = count($items);
        ?>
        <div class="year-block" data-year="<?= $annee ?>">

            <button class="year-trigger" onclick="toggleYear(this)" aria-expanded="false">
                <div class="yr-badge"><?= $annee ?></div>
                <div class="yr-info">
                    <div class="yr-title">Session <?= $annee ?></div>
                    <div class="yr-sub"><?= count($parMatiere) ?> matière<?= count($parMatiere) > 1 ? 's' : '' ?></div>
                </div>
                <span class="yr-count"><?= $nbEpreuves ?> épreuve<?= $nbEpreuves > 1 ? 's' : '' ?></span>
                <span class="yr-arrow">▶</span>
            </button>

            <div class="year-panel">
                <?php foreach ($parMatiere as $dossier => $fichiers): ?>
                <div class="matiere-group" data-dossier="<?= $dossier ?>">
                    <div class="matiere-label">
                        <?= getIcon($dossier) ?> <?= htmlspecialchars($matieres[$dossier] ?? $dossier) ?>
                    </div>
                    <div class="file-grid">
                        <?php foreach ($fichiers as $fichier):
                            $ext       = strtolower(pathinfo($fichier, PATHINFO_EXTENSION));
                            $affichage = nomAffichage($fichier);
                            $urlFichier = $basePath . '/ns4/examen/' . rawurlencode($dossier) . '/' . rawurlencode($fichier);
                            $extClass  = match($ext) {
                                'pdf'         => 'ext-pdf',
                                'docx', 'doc' => 'ext-docx',
                                'jpg', 'jpeg' => 'ext-jpg',
                                default       => ''
                            };
                        ?>
                        <a href="<?= $urlFichier ?>"
                           class="file-card"
                           target="_blank"
                           rel="noopener"
                           data-dossier="<?= $dossier ?>"
                           title="Ouvrir · <?= htmlspecialchars($affichage) ?>">
                            <span class="file-emoji"><?= getIcon($fichier) ?></span>
                            <span class="file-name"><?= htmlspecialchars($affichage) ?></span>
                            <span class="file-ext <?= $extClass ?>"><?= strtoupper($ext) ?></span>
                        </a>
                        <?php endforeach; ?>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>

        </div>
        <?php endforeach; ?>
    </div>

    <a href="<?= $basePath ?>/ns4/index.php" class="btn-back">⬅️ Retour aux exercices</a>

</main>

<footer class="footer">
    <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; NS4 — Nouveaux Secondaires 4 &mdash; Programmes officiels MENFP</p>
</footer>

<script>
const navToggle = document.getElementById('navToggle');
const navMenu   = document.getElementById('navMenu');
navToggle.addEventListener('click', () => navMenu.classList.toggle('show'));
document.addEventListener('click', e => {
    if (!document.querySelector('.navbar').contains(e.target)) navMenu.classList.remove('show');
});

function toggleYear(btn) {
    const panel  = btn.nextElementSibling;
    const isOpen = panel.classList.contains('show');
    document.querySelectorAll('.year-panel.show').forEach(p => p.classList.remove('show'));
    document.querySelectorAll('.year-trigger.open').forEach(b => { b.classList.remove('open'); b.setAttribute('aria-expanded','false'); });
    if (!isOpen) {
        panel.classList.add('show');
        btn.classList.add('open');
        btn.setAttribute('aria-expanded','true');
        setTimeout(() => btn.scrollIntoView({ behavior: 'smooth', block: 'start' }), 50);
    }
}

const firstTrigger = document.querySelector('.year-trigger');
if (firstTrigger) firstTrigger.click();

let currentMatiere = 'all';

function filterMatiere(btn, matiere) {
    currentMatiere = matiere;
    document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    applyFilters();
}

document.getElementById('searchInput').addEventListener('input', applyFilters);

function applyFilters() {
    const q = document.getElementById('searchInput').value.trim().toLowerCase();
    document.querySelectorAll('.year-block').forEach(block => {
        const year = block.dataset.year;
        let blockVisible = false;
        block.querySelectorAll('.matiere-group').forEach(group => {
            const dossier = group.dataset.dossier;
            const matiereOk = (currentMatiere === 'all' || dossier === currentMatiere);
            let searchOk = true;
            if (q) {
                const names = [...group.querySelectorAll('.file-name')].map(n => n.textContent.toLowerCase()).join(' ');
                searchOk = year.includes(q) || names.includes(q) || dossier.toLowerCase().includes(q);
            }
            const visible = matiereOk && searchOk;
            group.style.display = visible ? '' : 'none';
            if (visible) blockVisible = true;
        });
        block.classList.toggle('hidden', !blockVisible);
    });
}
</script>
</body>
</html>