<?php
/**
 * Programmes Officiels NS4 ( 4ème Secondaire)
 * Quiz Ayiti - Documents pédagogiques conformes au MENFP
 *
 * SEO optimisé pour : programmes ns4, programme ns4 menfp, programme chimie ns4,
 * programme maths ns4, programme philosophie ns4, programme physique ns4,
 * programme svt ns4, programme économie ns4, éducation Haïti, quiz ns4
 */
$pageTitle = 'Programmes Officiels NS4';
$classeActive = 'ns4';
require_once __DIR__ . '/../includes/functions.php';

$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_SESSION['student_name']  = trim($_POST['student_name'] ?? '');
    $_SESSION['student_class'] = $_POST['student_class'] ?? 'ns4';
}

$name   = getStudentName();
$classe = getStudentClass();

// ── Programmes NS4 disponibles ──────────────────────────────────────────────
$programmes = [
    [
        'id'          => 'economie',
        'matiere'     => 'Économie',
        'icon'        => '💰',
        'fichier'     => 'ns4_programme_d_economie_menfp.pdf',
        'description' => 'Programme d\'Économie NS4 : microéconomie, macroéconomie, marché, production, monnaie et finances publiques haïtiennes.',
        'themes'      => ['Microéconomie', 'Macroéconomie', 'Marché', 'Monnaie', 'Finances publiques'],
        'color'       => 'economie',
        'mots_cles'   => 'programme économie ns4, économie secondaire haïti, microéconomie ns4, macroéconomie ns4 menfp',
    ],
    [
        'id'          => 'chimie',
        'matiere'     => 'Chimie',
        'icon'        => '⚗️',
        'fichier'     => 'ns4_programme_de_chimie_menfp.pdf',
        'description' => 'Programme de Chimie NS4 : atome, liaison chimique, réactions, solutions, électrochimie et chimie organique.',
        'themes'      => ['Atome & Structure', 'Liaisons chimiques', 'Réactions chimiques', 'Solutions', 'Chimie organique'],
        'color'       => 'chimie',
        'mots_cles'   => 'programme chimie ns4, chimie ns4 menfp, atome ns4, réactions chimiques secondaire haïti',
    ],
    [
        'id'          => 'maths',
        'matiere'     => 'Mathématiques',
        'icon'        => '🔢',
        'fichier'     => 'ns4_programme_de_mathematiques_menfp.pdf',
        'description' => 'Programme de Mathématiques NS4 : algèbre avancée, fonctions, trigonométrie, géométrie analytique et statistiques.',
        'themes'      => ['Algèbre', 'Fonctions', 'Trigonométrie', 'Géométrie analytique', 'Statistiques'],
        'color'       => 'maths',
        'mots_cles'   => 'programme maths ns4, mathématiques ns4 menfp, algèbre ns4, trigonométrie ns4, géométrie ns4',
    ],
    [
        'id'          => 'philosophie',
        'matiere'     => 'Philosophie',
        'icon'        => '🧠',
        'fichier'     => 'ns4_programme_de_philosophie_menfp.pdf',
        'description' => 'Programme de Philosophie NS4 : logique, épistémologie, éthique, philosophie politique et histoire de la pensée.',
        'themes'      => ['Logique', 'Épistémologie', 'Éthique', 'Philosophie politique', 'Histoire de la pensée'],
        'color'       => 'philosophie',
        'mots_cles'   => 'programme philosophie ns4, philosophie ns4 menfp, logique ns4, éthique secondaire haïti',
    ],
    [
        'id'          => 'physique',
        'matiere'     => 'Physique',
        'icon'        => '⚡',
        'fichier'     => 'ns4_programme_de_physique_menfp.pdf',
        'description' => 'Programme de Physique NS4 : mécanique, électricité, magnétisme, optique, thermodynamique et ondes.',
        'themes'      => ['Mécanique', 'Électricité', 'Magnétisme', 'Optique', 'Thermodynamique'],
        'color'       => 'physique',
        'mots_cles'   => 'programme physique ns4, physique ns4 menfp, mécanique ns4, électricité ns4, optique secondaire',
    ],
    [
        'id'          => 'svt',
        'matiere'     => 'Sciences de la Vie et de la Terre (SVT)',
        'icon'        => '🌿',
        'fichier'     => 'ns4_programme_de_svt_menfp.pdf',
        'description' => 'Programme de SVT NS4 : biologie cellulaire, génétique, écologie, géologie et physiologie humaine.',
        'themes'      => ['Biologie cellulaire', 'Génétique', 'Écologie', 'Géologie', 'Physiologie'],
        'color'       => 'svt',
        'mots_cles'   => 'programme svt ns4, biologie ns4 menfp, génétique ns4, écologie ns4, sciences vie terre',
    ],
    [
        'id'          => 'communication',
        'matiere'     => 'Communication (Créole)',
        'icon'        => '🇭🇹',
        'fichier'     => 'Pwogram_Kominikasyon_Kreyòl_Programme_de_Communi....pdf',
        'description' => 'Pwogram Kominikasyon Kreyòl NS4 : grammaire créole avancée, littérature haïtienne, expression et rédaction.',
        'themes'      => ['Grammaire créole', 'Littérature haïtienne', 'Expression orale', 'Rédaction', 'Communication'],
        'color'       => 'creole',
        'mots_cles'   => 'programme créole ns4, communication ns4 menfp, pwogram kominikasyon kreyòl, littérature haïtienne ns4',
    ],
];
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">

    <!-- ════════════════ SEO ════════════════ -->
    <title>Programmes Officiels NS4 - Chimie, Maths, Physique, SVT, Philo, Éco | Quiz Ayiti</title>
    <meta name="description" content="Téléchargez les programmes officiels NS4  conformes au MENFP : Chimie, Mathématiques, Physique, SVT, Philosophie, Économie, Communication Créole. Documents PDF gratuits pour préparer vos examens.">
    <meta name="keywords" content="programmes ns4, programme ns4 menfp, programme chimie ns4, programme maths ns4, programme physique ns4, programme svt ns4, programme philosophie ns4, programme économie ns4, programme créole ns4, ns4 haïti, quiz ns4, qcm ns4, révision ns4, examen ns4, éducation haïti, MENFP ns4, secondaire haïti">
    <meta name="robots" content="index, follow">
    <meta name="author" content="Quiz Ayiti">
    <link rel="canonical" href="https://quizayiti.com/ns4/programmes.php">

    <!-- Open Graph -->
    <meta property="og:title" content="Programmes Officiels NS4  - MENFP | Quiz Ayiti">
    <meta property="og:description" content="Tous les programmes NS4 conformes au MENFP : Chimie, Maths, Physique, SVT, Philo, Économie, Créole. PDF gratuits + Quiz interactifs.">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://quizayiti.com/ns4/programmes.php">
    <meta property="og:locale" content="fr_HT">

    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="Programmes NS4 - Quiz Ayiti">
    <meta name="twitter:description" content="Programmes officiels NS4 MENFP. Chimie, Maths, Physique, SVT et plus. PDF gratuits.">

    <link rel="icon" href="../images/logo.png" type="image/png">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- ════════════ Données Structurées Schema.org ════════════ -->
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "EducationalOrganization",
        "name": "Quiz Ayiti - Programmes NS4",
        "description": "Documents pédagogiques officiels conformes au MENFP pour NS4 ( 4ème Secondaire)",
        "url": "https://quizayiti.com/ns4/programmes.php",
        "educationalLevel": "NS4 - 4ème Secondaire ",
        "offers": [
            <?php foreach ($programmes as $i => $p): ?>
            {
                "@type": "EducationalOccupationalProgram",
                "name": "Programme <?= e($p['matiere']) ?> NS4",
                "description": "<?= e($p['description']) ?>",
                "educationalProgramMode": "document",
                "educationalLevel": "NS4 Haïti"
            }<?= $i < count($programmes) - 1 ? ',' : '' ?>
            <?php endforeach; ?>
        ]
    }
    </script>

    <!-- BreadcrumbList -->
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "BreadcrumbList",
        "itemListElement": [
            {"@type":"ListItem","position":1,"name":"Accueil","item":"https://quizayiti.com/"},
            {"@type":"ListItem","position":2,"name":"NS4","item":"https://quizayiti.com/ns4/index.php"},
            {"@type":"ListItem","position":3,"name":"Programmes Officiels NS4","item":"https://quizayiti.com/ns4/programmes.php"}
        ]
    }
    </script>

    <style>
        :root {
            --blue:#002395; --red:#d21034; --gold:#f1c40f; --green:#10b981;
            --purple:#7c3aed; --orange:#f59e0b;
            --gray-50:#f8fafc; --gray-100:#f1f5f9; --gray-200:#e2e8f0;
            --gray-300:#cbd5e1; --gray-400:#94a3b8; --gray-500:#64748b;
            --gray-600:#475569; --gray-700:#334155; --gray-800:#1e293b;
            --gray-900:#0f172a; --white:#ffffff;
            --shadow-sm:0 1px 2px rgba(0,0,0,.05);
            --shadow-md:0 4px 6px rgba(0,0,0,.07);
            --shadow-lg:0 10px 25px rgba(0,0,0,.08);
            --shadow-xl:0 20px 25px rgba(0,0,0,.1);
            --radius:12px; --radius-lg:16px; --radius-xl:24px;
            --transition:0.2s cubic-bezier(0.4,0,0.2,1);
        }
        *{margin:0;padding:0;box-sizing:border-box;}
        html{font-size:16px;scroll-behavior:smooth;-webkit-font-smoothing:antialiased;}
        body{
            font-family:'Inter',sans-serif;line-height:1.7;color:var(--gray-800);
            background:linear-gradient(180deg,#f0f4ff 0%,var(--gray-50) 30%);
            display:flex;flex-direction:column;min-height:100vh;
        }

        /* ─── NAVBAR ─────────────────────────── */
        .navbar{
            display:flex;justify-content:space-between;align-items:center;
            background:rgba(255,255,255,.95);backdrop-filter:blur(10px);
            padding:0 1.5rem;height:70px;position:sticky;top:0;z-index:1000;
            border-bottom:1px solid var(--gray-200);box-shadow:var(--shadow-sm);
        }
        .nav-brand{display:flex;align-items:center;gap:.75rem;text-decoration:none;}
        .nav-brand img{height:44px;width:44px;object-fit:contain;border-radius:var(--radius);}
        .nav-brand-text{font-size:1.35rem;font-weight:800;color:var(--gray-900);}
        .nav-brand-text span{color:var(--red);}
        .nav-brand:hover .nav-brand-text{color:var(--blue);}
        .nav-menu{display:flex;list-style:none;gap:.35rem;align-items:center;}
        .nav-menu a{
            color:var(--gray-600);text-decoration:none;font-weight:500;font-size:.9rem;
            padding:.5rem .9rem;border-radius:var(--radius);transition:all var(--transition);white-space:nowrap;
        }
        .nav-menu a:hover{color:var(--blue);background:#eff6ff;}
        .nav-menu a.active{color:var(--white);background:var(--blue);font-weight:600;}
        .nav-toggle{display:none;flex-direction:column;background:none;border:none;cursor:pointer;gap:5px;}
        .nav-toggle .bar{width:26px;height:2.5px;background:var(--gray-700);border-radius:2px;}

        /* ─── LAYOUT ─────────────────────────── */
        .container{flex:1;width:100%;max-width:800px;margin:0 auto;padding:2rem 1.5rem;}

        /* ─── BREADCRUMB ─────────────────────── */
        .breadcrumb{
            display:flex;align-items:center;gap:.4rem;margin-bottom:1.5rem;
            font-size:.85rem;color:var(--gray-500);flex-wrap:wrap;
        }
        .breadcrumb a{color:var(--gray-500);text-decoration:none;}
        .breadcrumb a:hover{color:var(--blue);}
        .breadcrumb .separator{color:var(--gray-400);}
        .breadcrumb .current{color:var(--gray-700);font-weight:600;}

        /* ─── PAGE HEADER ────────────────────── */
        .page-header{text-align:center;margin-bottom:2.5rem;}
        .class-badge{
            display:inline-flex;align-items:center;gap:.5rem;
            background:linear-gradient(135deg,#eff6ff,#dbeafe);
            color:var(--blue);font-weight:600;font-size:.85rem;
            padding:.5rem 1.2rem;border-radius:50px;margin-bottom:1rem;
            border:1px solid #bfdbfe;
        }
        .page-header h1{font-size:clamp(1.8rem,5vw,2.6rem);font-weight:800;color:var(--gray-900);line-height:1.2;}
        .page-header h1 .highlight{
            background:linear-gradient(135deg,var(--blue),#3b82f6);
            -webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;
        }
        .page-header .subtitle{color:var(--gray-500);font-size:1rem;margin-top:.5rem;}
        .welcome-message{
            display:inline-flex;align-items:center;gap:.5rem;
            background:#f0fdf4;color:#166534;font-weight:600;font-size:1rem;
            padding:.6rem 1.2rem;border-radius:50px;border:1px solid #bbf7d0;margin-top:.75rem;
        }

        /* ─── CARD ───────────────────────────── */
        .card{
            background:var(--white);border-radius:var(--radius-xl);padding:2rem;
            box-shadow:var(--shadow-lg);margin-bottom:1.5rem;border:1px solid var(--gray-100);
        }
        .card-header{
            display:flex;align-items:center;gap:.75rem;margin-bottom:1.5rem;
            padding-bottom:1rem;border-bottom:2px solid var(--gray-100);
        }
        .card-icon{
            width:44px;height:44px;
            background:linear-gradient(135deg,#eff6ff,#dbeafe);
            border-radius:var(--radius);display:flex;align-items:center;justify-content:center;font-size:1.3rem;
        }
        .card-header h2{font-size:1.3rem;font-weight:700;color:var(--gray-900);}
        .card-header p{font-size:.9rem;color:var(--gray-500);}

        /* ─── GRILLE PROGRAMMES ──────────────── */
        .programme-grid{display:grid;grid-template-columns:1fr 1fr;gap:1rem;}
        .programme-card{
            background:var(--gray-50);border:2px solid var(--gray-200);
            border-radius:var(--radius-lg);padding:1.5rem;
            transition:all var(--transition);display:flex;flex-direction:column;gap:.75rem;
        }
        .programme-card:hover{
            border-color:var(--blue);background:#f8fbff;
            box-shadow:0 8px 25px rgba(0,35,149,.1);transform:translateY(-2px);
        }
        .prog-header{display:flex;align-items:center;gap:.75rem;}
        .prog-icon{
            width:48px;height:48px;border-radius:var(--radius);
            display:flex;align-items:center;justify-content:center;font-size:1.6rem;flex-shrink:0;
        }
        /* Couleurs par matière */
        .prog-icon.chimie       {background:linear-gradient(135deg,#ecfdf5,#a7f3d0);}
        .prog-icon.maths        {background:linear-gradient(135deg,#eff6ff,#bfdbfe);}
        .prog-icon.physique     {background:linear-gradient(135deg,#fffbeb,#fde68a);}
        .prog-icon.svt          {background:linear-gradient(135deg,#f0fdf4,#bbf7d0);}
        .prog-icon.philosophie  {background:linear-gradient(135deg,#f5f3ff,#ddd6fe);}
        .prog-icon.economie     {background:linear-gradient(135deg,#fff7ed,#fed7aa);}
        .prog-icon.creole       {background:linear-gradient(135deg,#fff1f2,#fecdd3);}

        .prog-title{font-weight:700;font-size:1rem;color:var(--gray-900);}
        .prog-subtitle{font-size:.8rem;color:var(--gray-500);}
        .prog-desc{font-size:.88rem;color:var(--gray-600);line-height:1.6;}
        .prog-themes{display:flex;flex-wrap:wrap;gap:.4rem;}
        .theme-tag{
            background:var(--gray-200);color:var(--gray-600);
            font-size:.75rem;font-weight:500;padding:.25rem .6rem;border-radius:50px;
        }
        .download-btn{
            display:flex;align-items:center;justify-content:center;gap:.5rem;
            background:linear-gradient(135deg,var(--blue),#1e40af);
            color:var(--white);text-decoration:none;font-weight:600;font-size:.9rem;
            padding:.75rem 1rem;border-radius:var(--radius);
            transition:all var(--transition);margin-top:auto;
        }
        .download-btn:hover{transform:translateY(-2px);box-shadow:0 6px 18px rgba(0,35,149,.35);}

        /* ─── INFO SECTION ───────────────────── */
        .info-section{
            display:grid;grid-template-columns:repeat(3,1fr);gap:1rem;margin-bottom:1.5rem;
        }
        .info-item{
            background:var(--white);border-radius:var(--radius-lg);padding:1.25rem 1rem;
            box-shadow:var(--shadow-md);text-align:center;border:1px solid var(--gray-100);
        }
        .info-icon{font-size:1.5rem;margin-bottom:.4rem;}
        .info-value{font-size:1.5rem;font-weight:800;color:var(--blue);}
        .info-label{font-size:.8rem;color:var(--gray-500);font-weight:500;}

        /* ─── SEO SECTION ────────────────────── */
        .seo-section{margin-bottom:2rem;}
        .seo-section h2{font-size:1.1rem;font-weight:700;color:var(--gray-800);margin-bottom:.75rem;}
        .seo-section p{font-size:.9rem;color:var(--gray-600);line-height:1.7;margin-bottom:.75rem;}
        .keyword-tags{display:flex;flex-wrap:wrap;gap:.5rem;}
        .keyword-tag{
            background:var(--gray-100);color:var(--gray-600);
            font-size:.8rem;font-weight:500;padding:.35rem .8rem;border-radius:50px;
            text-decoration:none;transition:all var(--transition);
        }
        .keyword-tag:hover{background:#eff6ff;color:var(--blue);}

        /* ─── FOOTER ─────────────────────────── */
        .footer{
            text-align:center;padding:1.5rem;font-size:.85rem;color:var(--gray-400);
            border-top:1px solid var(--gray-200);background:var(--white);margin-top:auto;
        }

        /* ─── RESPONSIVE ─────────────────────── */
        @media(max-width:640px){
            .nav-menu{
                display:none;flex-direction:column;position:absolute;top:70px;left:0;right:0;
                background:#fff;padding:1rem;gap:.5rem;
                border-bottom:1px solid var(--gray-200);box-shadow:var(--shadow-md);
            }
            .nav-menu.show{display:flex;}
            .nav-toggle{display:flex;}
            .nav-menu a{padding:.75rem 1rem;font-size:.95rem;width:100%;}
            .container{padding:1.25rem 1rem;}
            .card{padding:1.25rem;}
            .programme-grid{grid-template-columns:1fr;}
            .info-section{grid-template-columns:repeat(3,1fr);}
        }
        @media(min-width:641px)and(max-width:900px){
            .nav-menu a{padding:.5rem .7rem;font-size:.85rem;}
            .nav-menu{gap:.25rem;}
        }
        @media(max-width:400px){
            .info-section{grid-template-columns:repeat(2,1fr);}
        }
    </style>
</head>
<body>

<!-- ════════════════ NAVBAR ════════════════ -->
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
        <li><a href="<?= $basePath ?>/download.php">Télécharger l'app</a></li>
    </ul>
</nav>

<!-- ════════════════ MAIN ════════════════ -->
<main class="container">

    <!-- Fil d'Ariane -->
    <nav class="breadcrumb" aria-label="Fil d'Ariane">
        <a href="<?= $basePath ?>/index.php">Accueil</a>
        <span class="separator">›</span>
        <a href="<?= $basePath ?>/ns4/index.php">NS4</a>
        <span class="separator">›</span>
        <span class="current">Programmes Officiels</span>
    </nav>

    <!-- Header -->
    <div class="page-header">
        <div class="class-badge">📚 NS4 — 4ème Secondaire </div>
        <h1>Programmes <span class="highlight">Officiels</span> NS4 MENFP</h1>
        <p class="subtitle">Téléchargez les programmes officiels du Ministère de l'Éducation Nationale pour NS4</p>
        <?php if ($name): ?>
            <div class="welcome-message"> Bon travail, <strong><?= e($name) ?></strong> !</div>
        <?php endif; ?>
    </div>

    <!-- Intro -->
    <div class="card">
        <div class="card-header">
            <div class="card-icon">📋</div>
            <div>
                <h2>Documents officiels NS4 conformes au MENFP</h2>
                <p>Programmes détaillés pour chaque matière de NS4</p>
            </div>
        </div>
        <p style="color:var(--gray-600);line-height:1.7;margin-bottom:1rem;">
            Retrouvez ici tous les <strong>programmes officiels de NS4 </strong>.
            Ces documents sont conformes aux directives du
            <strong>Ministère de l'Éducation Nationale et de la Formation Professionnelle (MENFP)</strong>.
            Ils couvrent <strong>Chimie, Mathématiques, Physique, SVT, Philosophie, Économie et Communication Créole</strong>,
            toutes les matières essentielles pour réussir vos examens officiels de NS4.
        </p>
        <p style="color:var(--gray-500);font-size:.9rem;line-height:1.6;">
             <strong>Astuce :</strong> Utilisez ces programmes en complément de nos
            <strong>quiz et QCM NS4 interactifs</strong> pour une préparation complète et efficace.
        </p>
    </div>

    <!-- Grille programmes -->
    <div class="card">
        <div class="card-header">
            <div class="card-icon">📁</div>
            <div>
                <h2>Programmes NS4 disponibles</h2>
                <p>Cliquez sur une carte pour télécharger le PDF</p>
            </div>
        </div>

        <div class="programme-grid">
            <?php foreach ($programmes as $prog): ?>
            <div class="programme-card">
                <div class="prog-header">
                    <div class="prog-icon <?= $prog['color'] ?>">
                        <?= $prog['icon'] ?>
                    </div>
                    <div>
                        <h3 class="prog-title"><?= e($prog['matiere']) ?></h3>
                        <p class="prog-subtitle">Programme officiel MENFP — NS4</p>
                    </div>
                </div>

                <p class="prog-desc"><?= e($prog['description']) ?></p>

                <div class="prog-themes">
                    <?php foreach ($prog['themes'] as $theme): ?>
                        <span class="theme-tag"><?= e($theme) ?></span>
                    <?php endforeach; ?>
                </div>

                <a href="<?= $basePath ?>/ns4/programmes/<?= rawurlencode($prog['fichier']) ?>"
                   class="download-btn"
                   target="_blank"
                   rel="noopener"
                   title="Télécharger le programme de <?= e($prog['matiere']) ?> NS4 - MENFP">
                    📥 Télécharger Le Programme
                </a>
            </div>
            <?php endforeach; ?>
        </div>
    </div>

    <!-- Stats -->
    <div class="info-section">
        <div class="info-item">
          
            <div class="info-value"><?= count($programmes) ?></div>
            <div class="info-label">Matières</div>
        </div>
        <div class="info-item">
           
            <div class="info-value"><?= count($programmes) ?></div>
            <div class="info-label">Documents PDF</div>
        </div>
        <div class="info-item">
            
            <div class="info-value">100%</div>
            <div class="info-label">Conforme MENFP</div>
        </div>
    </div>

    <!-- Section SEO textuelle -->
    <div class="card seo-section">
        <h2>À propos des programmes NS4 en Haïti</h2>
        <p>
            Les <strong>programmes NS4</strong>  en Haïti sont établis par le
            <strong>MENFP</strong> et constituent la référence officielle pour tous les élèves de
            <strong>4ème Secondaire</strong>. Ces programmes couvrent les matières scientifiques
            (Chimie, Physique, SVT, Mathématiques) et littéraires (Philosophie, Économie, Communication Créole),
            préparant les élèves aux <strong>examens officiels NS4</strong> et au baccalauréat haïtien.
        </p>
        <p>
            Notre plateforme met à votre disposition ces documents
            <strong>gratuitement</strong>, en complément de centaines de <strong>quiz et QCM NS4 interactifs</strong>
            conformes aux mêmes programmes officiels.
        </p>
        <div class="keyword-tags">
            <a href="<?= $basePath ?>/ns4/index.php" class="keyword-tag">Quiz NS4</a>
            <a href="<?= $basePath ?>/ns4/programmes.php" class="keyword-tag">Programmes NS4 MENFP</a>
            <span class="keyword-tag">Chimie NS4</span>
            <span class="keyword-tag">Maths NS4</span>
            <span class="keyword-tag">Physique NS4</span>
            <span class="keyword-tag">SVT NS4</span>
            <span class="keyword-tag">Philosophie NS4</span>
            <span class="keyword-tag">Économie NS4</span>
            <span class="keyword-tag">Créole NS4</span>
            <span class="keyword-tag">Examen NS4</span>
            <span class="keyword-tag">Révision NS4</span>
        </div>
    </div>

    <!-- CTA -->
    <div class="card" style="text-align:center;background:linear-gradient(135deg,#eff6ff,#dbeafe);border-color:#bfdbfe;">
        <h3 style="font-weight:700;color:var(--gray-900);margin-bottom:.5rem;">Prêt à tester tes connaissances NS4 ?</h3>
        <p style="color:var(--gray-600);margin-bottom:1.25rem;">
            Après avoir révisé avec les programmes, entraîne-toi avec nos quiz et QCM NS4 interactifs !
        </p>
        <a href="<?= $basePath ?>/ns4/index.php"
           style="display:inline-block;background:linear-gradient(135deg,var(--blue),#1e40af);color:var(--white);padding:.75rem 2rem;border-radius:50px;text-decoration:none;font-weight:600;">
            🎮 Commencer un Quiz NS4
        </a>
    </div>

</main>

<!-- ════════════════ FOOTER ════════════════ -->
<footer class="footer">
    <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash;
    NS4 — 4ème Secondaire — Programmes officiels MENFP &mdash;
    <a href="<?= $basePath ?>/ns4/index.php" style="color:var(--gray-400);">Quiz NS4</a></p>
</footer>

<script>
    document.getElementById('navToggle').addEventListener('click', () => {
        document.getElementById('navMenu').classList.toggle('show');
    });
    document.addEventListener('click', (e) => {
        if (!document.querySelector('.navbar').contains(e.target)) {
            document.getElementById('navMenu').classList.remove('show');
        }
    });
</script>
</body>
</html>