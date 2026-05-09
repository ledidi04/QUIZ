<?php
$pageTitle = 'Examens Officiels - 9ème AF';
$classeActive = '9e';
require_once __DIR__ . '/../includes/functions.php';

$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');
$name = getStudentName();

// ─────────────────────────────────────────────────────────────────────────────
// Noms d'affichage lisibles pour les fichiers avec noms courts/abrégés
// ─────────────────────────────────────────────────────────────────────────────
function nomAffichage(string $fichier): string {
    $base = pathinfo($fichier, PATHINFO_FILENAME);
    // Nettoyer les années collées au nom (ex: francais2010 → Français)
    $base = preg_replace('/\d{4}$/', '', $base);
    $map = [
        'francais'   => 'Français',
        'math'       => 'Mathématiques',
        'scsexp'     => 'Sc. Expérimentales',
        'scsociales' => 'Sciences Sociales',
    ];
    $key = strtolower(trim($base));
    return $map[$key] ?? $base;
}

// ─────────────────────────────────────────────────────────────────────────────
// Icônes par matière (correspondance souple)
// ─────────────────────────────────────────────────────────────────────────────
function getIcon(string $fichier): string {
    $f = mb_strtolower($fichier);
    if (str_contains($f, 'anglais'))                          return '🇬🇧';
    if (str_contains($f, 'creole') || str_contains($f, 'créole')) return '🇭🇹';
    if (str_contains($f, 'espagnol'))                         return '🇪🇸';
    if (str_contains($f, 'francais') || str_contains($f, 'français')) return '📝';
    if (str_contains($f, 'math'))                             return '🔢';
    if (str_contains($f, 'scsexp') || str_contains($f, 'experimentale') || str_contains($f, 'expérimentale')) return '🔬';
    if (str_contains($f, 'scsociales') || str_contains($f, 'sociales')) return '🌍';
    if (str_contains($f, 'naturelle'))                        return '🌿';
    if (str_contains($f, 'physique') || str_contains($f, 'physic')) return '⚡';
    if (str_contains($f, 'citoyennete') || str_contains($f, 'citoyenneté')) return '🏛️';
    if (str_contains($f, 'esthetique') || str_contains($f, 'artistique')) return '🎨';
    if (str_contains($f, 'sportive') || str_contains($f, 'eps'))  return '🏃';
    if (str_contains($f, 'etap'))                             return '💻';
    if (str_contains($f, 'kanndel') || str_contains($f, 'document')) return '📄';
    return '📄';
}

// ─────────────────────────────────────────────────────────────────────────────
// Structure complète des examens 9ème AF (2010 → 2024)
// Noms de fichiers EXACTS tels qu'ils sont dans le dossier Examen/
// ─────────────────────────────────────────────────────────────────────────────
$examens = [
    '2010' => ['francais2010.pdf', 'math2010.pdf', 'scsexp2010.pdf', 'scsociales2010.pdf'],
    '2011' => ['francais2011.pdf', 'scsexp2011.pdf', 'scsociales2011.pdf'],
    '2012' => ['francais2012.pdf', 'math2012.pdf', 'scsexp2012.pdf', 'scsociales2012.pdf'],
    '2013' => ['francais2013.pdf', 'math2013.pdf', 'scsexp2013.pdf', 'scsociales2013.pdf'],
    '2014' => ['francais2014.pdf', 'scsexp2014.pdf', 'scsociales2014.pdf'],
    '2015' => ['francais2015.pdf', 'math2015.pdf', 'scsexp2015.pdf', 'scsociales2015.pdf'],
    '2016' => ['francais2016.pdf', 'math2016.pdf', 'scsexp2016.pdf', 'scsociales2016.pdf'],
    '2017' => ['francais2017.pdf', 'math2017.pdf', 'scsexp2017.pdf', 'scsociales2017.pdf'],
    '2018' => ['francais2018.pdf', 'math2018.pdf', 'scsexp2018.pdf', 'scsociales2018.pdf'],
    '2019' => ['francais2019.pdf', 'math2019.pdf', 'scsexp2019.pdf', 'scsociales2019.pdf'],
    '2020' => ['francais2020.pdf', 'math2020.pdf', 'scsexp2020.pdf', 'scsociales2020.pdf'],
    '2021' => ['francais2021.pdf', 'math2021.pdf', 'scsexp2021.pdf'],
    '2022' => [
        'Anglais.pdf',
        'Créole.pdf',
        'Espagnol.pdf',
        'Français.pdf',
        'francais2022.pdf',
        'math2022.pdf',
        'Mathématiques.pdf',
        'Sciences Experimentales.pdf',
        'Sciences Sociales.pdf',
        'scsexp2022.pdf',
    ],
    '2023' => [
        'Anglais.pdf',
        'Créole.pdf',
        'Espagnol.pdf',
        'francais2023.pdf',
        'math2023.pdf',
        'Mathématiques.pdf',
        'Sciences  Naturelles.pdf',
        'Sciences physique.pdf',
        'Sciences sociales.pdf',
        'scsexp2023.pdf',
        'scsociales2023.pdf',
    ],
    '2024' => [
        'Anglais.pdf',
        'creole1.jpg',
        'Creole2.jpg',
        'Document from Kanndèl.pdf',
        'Éducation à la citoyennete.pdf',
        'Education Esthétique et Artistique.pdf',
        'Éducation physique et sportive.pdf',
        'ETAP.pdf',
        'Mathématiques.pdf',
        'Sces naturelles.pdf',
        'Sces physiques.pdf',
        'Sciences Sociales.pdf',
    ],
];
// Trier par année décroissante (les plus récents en premier)
krsort($examens);
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
        /* ══════════════════════════════════════
           VARIABLES & RESET
        ══════════════════════════════════════ */
        :root {
            --blue: #002395; --red: #d21034; --gold: #f1c40f; --green: #10b981;
            --purple: #7c3aed; --orange: #f59e0b;
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
            line-height: 1.6;
            color: var(--gray-800);
            background: linear-gradient(160deg, #f0f4ff 0%, var(--gray-50) 40%);
            display: flex; flex-direction: column; min-height: 100vh;
        }

        /* ══════════════════════════════════════
           NAVBAR — UNIFIÉE avec index.php
        ══════════════════════════════════════ */
        .navbar {
            display: flex; justify-content: space-between; align-items: center;
            background: rgba(255,255,255,.95); backdrop-filter: blur(10px);
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
        .nav-menu a.active { color: var(--white); background: var(--blue); font-weight: 600; }
        .nav-menu a.btn-apk {
            background: linear-gradient(135deg, var(--green), #059669); color: var(--white);
            font-weight: 600; box-shadow: 0 3px 10px rgba(16,185,129,.3);
            padding: 0.5rem 0.9rem;
        }
        .nav-menu a.btn-apk:hover { transform: translateY(-1px); box-shadow: 0 5px 14px rgba(16,185,129,.4); }

        .nav-toggle { display: none; flex-direction: column; background: none; border: none; cursor: pointer; gap: 5px; padding: 4px; }
        .nav-toggle .bar { width: 26px; height: 2.5px; background: var(--gray-700); border-radius: 2px; transition: all .3s; }

        /* ══════════════════════════════════════
           LAYOUT
        ══════════════════════════════════════ */
        .container { flex: 1; width: 100%; max-width: 960px; margin: 0 auto; padding: 2.5rem 1.5rem; }

        /* ══════════════════════════════════════
           PAGE HEADER
        ══════════════════════════════════════ */
        .page-header { text-align: center; margin-bottom: 2.5rem; }
        .class-badge {
            display: inline-flex; align-items: center; gap: .5rem;
            background: linear-gradient(135deg, #fff0f0, #ffd6d6);
            color: var(--red); font-weight: 600; font-size: .85rem;
            padding: .5rem 1.3rem; border-radius: 50px; margin-bottom: 1rem;
            border: 1px solid #fca5a5;
        }
        .page-header h1 { font-size: clamp(1.7rem, 4vw, 2.5rem); font-weight: 800; color: var(--gray-900); line-height: 1.2; }
        .page-header h1 .highlight { background: linear-gradient(135deg, var(--blue), #3b82f6); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .page-header .subtitle { color: var(--gray-500); font-size: .95rem; margin-top: .4rem; }
        .welcome-msg { display: inline-flex; align-items: center; gap: .5rem; background: #f0fdf4; color: #166534; font-weight: 600; font-size: .95rem; padding: .55rem 1.2rem; border-radius: 50px; border: 1px solid #bbf7d0; margin-top: .75rem; }

        /* ══════════════════════════════════════
           STATS BAR
        ══════════════════════════════════════ */
        .stats-bar {
            display: flex; flex-wrap: wrap; gap: .75rem; justify-content: center;
            margin-bottom: 2rem;
        }
        .stat-pill {
            display: flex; align-items: center; gap: .5rem;
            background: var(--white); border: 1px solid var(--gray-200);
            border-radius: 50px; padding: .55rem 1.2rem;
            font-size: .88rem; font-weight: 600; color: var(--gray-700);
            box-shadow: var(--shadow-sm);
        }
        .stat-pill .stat-num { color: var(--blue); font-weight: 800; font-size: 1rem; }

        /* ══════════════════════════════════════
           RECHERCHE RAPIDE
        ══════════════════════════════════════ */
        .search-wrap { margin-bottom: 1.5rem; position: relative; }
        .search-wrap input {
            width: 100%; padding: .85rem 1rem .85rem 3rem;
            border: 2px solid var(--gray-200); border-radius: var(--radius-lg);
            font-family: inherit; font-size: .95rem; color: var(--gray-800);
            background: var(--white); outline: none; transition: border-color var(--transition);
            box-shadow: var(--shadow-sm);
        }
        .search-wrap input:focus { border-color: var(--blue); }
        .search-wrap .search-icon { position: absolute; left: 1rem; top: 50%; transform: translateY(-50%); font-size: 1.1rem; pointer-events: none; }

        /* ══════════════════════════════════════
           ACCORDION ANNÉES
        ══════════════════════════════════════ */
        .years-wrapper { display: flex; flex-direction: column; gap: .85rem; }

        .year-block { background: var(--white); border-radius: var(--radius-lg); overflow: hidden; box-shadow: var(--shadow-md); border: 1.5px solid var(--gray-200); transition: box-shadow var(--transition); }
        .year-block:hover { box-shadow: var(--shadow-lg); }

        .year-trigger {
            display: flex; align-items: center; gap: .85rem;
            padding: 1rem 1.25rem; cursor: pointer;
            user-select: none; border: none; background: none; width: 100%; text-align: left;
            transition: background var(--transition);
        }
        .year-trigger:hover { background: #f8faff; }
        .year-trigger.open { background: linear-gradient(90deg, #eef2ff, #f0f9ff); border-bottom: 1.5px solid var(--gray-200); }

        .yr-badge {
            width: 52px; height: 52px; flex-shrink: 0;
            background: linear-gradient(135deg, var(--blue), #1e40af);
            color: var(--white); border-radius: var(--radius);
            display: flex; align-items: center; justify-content: center;
            font-weight: 800; font-size: .95rem;
            box-shadow: 0 4px 10px rgba(0,35,149,.2);
        }
        .yr-info { flex: 1; min-width: 0; }
        .yr-title { font-size: 1.05rem; font-weight: 700; color: var(--gray-900); }
        .yr-sub { font-size: .8rem; color: var(--gray-400); }
        .yr-count {
            flex-shrink: 0; background: var(--gray-100); color: var(--gray-600);
            font-size: .8rem; font-weight: 600; padding: .3rem .85rem; border-radius: 50px;
        }
        .yr-arrow { flex-shrink: 0; font-size: 1rem; color: var(--gray-400); transition: transform .3s ease; }
        .year-trigger.open .yr-arrow { transform: rotate(90deg); color: var(--blue); }

        /* Grille fichiers */
        .year-panel { display: none; padding: 1.25rem; }
        .year-panel.show { display: block; animation: fadeSlide .25s ease; }

        @keyframes fadeSlide {
            from { opacity: 0; transform: translateY(-8px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .file-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(170px, 1fr));
            gap: .65rem;
        }

        .file-card {
            display: flex; flex-direction: column; align-items: center; justify-content: center;
            gap: .5rem; padding: 1.1rem .75rem;
            background: var(--gray-50); border: 2px solid var(--gray-200);
            border-radius: var(--radius); text-decoration: none; color: var(--gray-700);
            transition: all var(--transition); text-align: center;
            position: relative; overflow: hidden;
        }
        .file-card::before {
            content: ''; position: absolute; inset: 0;
            background: linear-gradient(135deg, transparent 60%, rgba(0,35,149,.04));
            opacity: 0; transition: opacity var(--transition);
        }
        .file-card:hover { border-color: var(--red); background: #fff5f5; transform: translateY(-3px); box-shadow: 0 8px 20px rgba(210,16,52,.12); }
        .file-card:hover::before { opacity: 1; }
        .file-card:active { transform: translateY(-1px); }

        .file-emoji { font-size: 1.8rem; line-height: 1; }
        .file-name { font-weight: 600; font-size: .82rem; line-height: 1.3; color: var(--gray-700); word-break: break-word; }
        .file-ext {
            font-size: .7rem; font-weight: 700; letter-spacing: .04em;
            padding: .15rem .5rem; border-radius: 4px;
            background: var(--gray-200); color: var(--gray-500);
        }
        .file-ext.ext-pdf { background: #fee2e2; color: #b91c1c; }
        .file-ext.ext-jpg, .file-ext.ext-jpeg { background: #fef3c7; color: #92400e; }

        /* ══════════════════════════════════════
           BOUTON RETOUR
        ══════════════════════════════════════ */
        .btn-back {
            display: inline-flex; align-items: center; gap: .6rem;
            padding: .85rem 1.6rem; background: var(--gray-200); color: var(--gray-700);
            border: none; border-radius: var(--radius); font-size: .95rem; font-weight: 600;
            cursor: pointer; text-decoration: none; transition: all var(--transition); margin-top: 1rem;
        }
        .btn-back:hover { background: var(--gray-300); transform: translateX(-3px); }

        /* ══════════════════════════════════════
           FOOTER
        ══════════════════════════════════════ */
        .footer { background: var(--white); border-top: 1px solid var(--gray-200); padding: 1.5rem; text-align: center; color: var(--gray-400); font-size: .85rem; margin-top: auto; }

        /* ══════════════════════════════════════
           RESPONSIVE
        ══════════════════════════════════════ */
        @media (max-width: 768px) {
            .navbar { padding: 0 1.25rem; height: 60px; }
            .nav-brand { font-size: 1.2rem; }
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
        @media (max-width: 480px) {
            .file-grid { grid-template-columns: 1fr 1fr; }
            .yr-count { display: none; }
        }
        @media (max-width: 340px) {
            .file-grid { grid-template-columns: 1fr; }
        }

        /* Masquer les éléments filtrés */
        .year-block.hidden { display: none; }
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
        <li><a href="<?= $basePath ?>/9e/index.php" >9ème AF</a></li>
        <li><a href="<?= $basePath ?>/ns4/index.php">NS4</a></li>
        <li><a href="<?= $basePath ?>/about/index.php">À propos</a></li>
        <li><a href="<?= $basePath ?>/download.php" >Télécharger l'app</a></li>
    </ul>
</nav>

<!-- ═══════════════════════ MAIN ═══════════════════════ -->
<main class="container">

    <!-- En-tête de page -->
    <div class="page-header">
        <div class="class-badge">📚 9ème Année Fondamentale</div>
        <h1>Anciens <span class="highlight">Examens</span></h1>
        <p class="subtitle">Épreuves officielles MENFP · 2010 – 2024</p>
        <?php if ($name): ?>
            <div class="welcome-msg">👋 Bon courage, <strong><?= e($name) ?></strong> !</div>
        <?php endif; ?>
    </div>

    <!-- Stats rapides -->
    <?php
        $totalFichiers = array_sum(array_map('count', $examens));
        $totalAnnees   = count($examens);
    ?>
    <div class="stats-bar">
        <div class="stat-pill">📅 <span class="stat-num"><?= $totalAnnees ?></span> années</div>
        <div class="stat-pill">📄 <span class="stat-num"><?= $totalFichiers ?></span> épreuves</div>
        <div class="stat-pill">🎓 <span class="stat-num">100 %</span> officiel MENFP</div>
    </div>

    <!-- Barre de recherche -->
    <div class="search-wrap">
        <span class="search-icon">🔍</span>
        <input type="text" id="searchInput" placeholder="Rechercher une année ou une matière…" autocomplete="off">
    </div>

    <!-- Accordéon des années -->
    <div class="years-wrapper" id="yearsWrapper">
        <?php foreach ($examens as $annee => $fichiers): ?>
        <div class="year-block" data-year="<?= $annee ?>">

            <button class="year-trigger" onclick="toggleYear(this)" aria-expanded="false">
                <div class="yr-badge"><?= $annee ?></div>
                <div class="yr-info">
                    <div class="yr-title">Session <?= $annee ?></div>
                    <div class="yr-sub">Épreuves officielles</div>
                </div>
                <span class="yr-count"><?= count($fichiers) ?> épreuve<?= count($fichiers) > 1 ? 's' : '' ?></span>
                <span class="yr-arrow">▶</span>
            </button>

            <div class="year-panel">
                <div class="file-grid">
                    <?php foreach ($fichiers as $fichier):
                        $ext        = strtolower(pathinfo($fichier, PATHINFO_EXTENSION));
                        $affichage  = nomAffichage($fichier);
                        $urlFichier = $basePath . '/9e/Examen/' . $annee . '/' . rawurlencode($fichier);
                        $extClass   = in_array($ext, ['jpg','jpeg']) ? 'ext-jpg' : 'ext-pdf';
                    ?>
                    <a href="<?= $urlFichier ?>"
                       class="file-card"
                       target="_blank"
                       rel="noopener"
                       title="Ouvrir · <?= e($affichage) ?>">
                        <span class="file-emoji"><?= getIcon($fichier) ?></span>
                        <span class="file-name"><?= e($affichage) ?></span>
                        <span class="file-ext <?= $extClass ?>"><?= strtoupper($ext) ?></span>
                    </a>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
    </div>

    <a href="<?= $basePath ?>/9e/index.php" class="btn-back">⬅️ Retour aux exercices</a>

</main>

<!-- ═══════════════════════ FOOTER ═══════════════════════ -->
<footer class="footer">
    <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; 9ème Année Fondamentale &mdash; Programmes officiels MENFP</p>
</footer>

<script>
/* ── Navigation mobile ── */
const navToggle = document.getElementById('navToggle');
const navMenu   = document.getElementById('navMenu');
navToggle.addEventListener('click', () => navMenu.classList.toggle('show'));
document.addEventListener('click', e => {
    if (!document.querySelector('.navbar').contains(e.target)) navMenu.classList.remove('show');
});

/* ── Accordéon ── */
function toggleYear(btn) {
    const panel  = btn.nextElementSibling;
    const isOpen = panel.classList.contains('show');

    // Fermer tous
    document.querySelectorAll('.year-panel.show').forEach(p => p.classList.remove('show'));
    document.querySelectorAll('.year-trigger.open').forEach(b => { b.classList.remove('open'); b.setAttribute('aria-expanded','false'); });

    // Ouvrir si était fermé
    if (!isOpen) {
        panel.classList.add('show');
        btn.classList.add('open');
        btn.setAttribute('aria-expanded','true');
        setTimeout(() => btn.scrollIntoView({ behavior: 'smooth', block: 'start' }), 50);
    }
}

// Ouvrir automatiquement la première année (la plus récente)
const firstTrigger = document.querySelector('.year-trigger');
if (firstTrigger) firstTrigger.click();

/* ── Recherche ── */
document.getElementById('searchInput').addEventListener('input', function() {
    const q = this.value.trim().toLowerCase();
    document.querySelectorAll('.year-block').forEach(block => {
        if (!q) { block.classList.remove('hidden'); return; }
        const year = block.dataset.year;
        const names = [...block.querySelectorAll('.file-name')].map(n => n.textContent.toLowerCase()).join(' ');
        block.classList.toggle('hidden', !year.includes(q) && !names.includes(q));
    });
});
</script>
</body>
</html>