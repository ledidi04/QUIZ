<?php
/**
 * Page d'accueil 9ème Année Fondamentale
 * Quiz Ayiti - Plateforme éducative interactive
 * 
 * SEO optimisé pour : quiz 9eme, qcm 9eme, exercices 9eme af, 
 * révision 9eme, examen 9eme, programme 9eme, éducation Haïti
 */
$pageTitle = 'Quiz 9ème AF - Exercices Interactifs';
$classeActive = '9e';
require_once __DIR__ . '/../includes/functions.php';

$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_SESSION['student_name']  = trim($_POST['student_name'] ?? '');
    $_SESSION['student_class'] = $_POST['student_class'] ?? '9e';
}

$name  = getStudentName();
$classe = getStudentClass();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    
    <!-- SEO Meta Tags -->
    <title>Quiz 9ème AF - Exercices Interactifs QCM | Quiz Ayiti</title>
    <meta name="description" content="Quiz et QCM interactifs pour la 9ème Année Fondamentale. Exercices de Français, Maths, Créole, Sciences, Anglais, Espagnol. Conforme MENFP. Gratuit.">
    <meta name="keywords" content="quiz 9eme af, qcm 9eme, exercices 9eme, révision 9eme, examen 9eme, programme 9eme, quiz haiti, éducation haïti, MENFP, 9ème année fondamentale, quiz éducatif, qcm interactif, quiz scolaire, révision examen 9eme">
    <meta name="robots" content="index, follow">
    <meta name="author" content="Quiz Ayiti">
    <link rel="canonical" href="https://quizayiti.com/9e/index.php">
    
    <!-- Open Graph -->
    <meta property="og:title" content="Quiz 9ème AF - Exercices Interactifs | Quiz Ayiti">
    <meta property="og:description" content="Plateforme de quiz et QCM interactifs pour la 9ème AF. 2000+ questions, 7 matières, 100% conforme MENFP. Préparez vos examens !">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://quizayiti.com/9e/index.php">
    
    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="Quiz 9ème AF - Quiz Ayiti">
    <meta name="twitter:description" content="2000+ questions interactives pour la 9ème AF. Conforme MENFP. Gratuit.">
    
    <link rel="icon" href="../images/logo.png" type="image/png">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    
    <!-- Structured Data -->
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "EducationalOrganization",
        "name": "Quiz Ayiti - 9ème Année Fondamentale",
        "description": "Plateforme de quiz et QCM interactifs pour la 9ème AF. Exercices conformes au programme MENFP.",
        "url": "https://quizayiti.com/9e/index.php",
        "educationalLevel": "9ème Année Fondamentale",
        "hasOfferCatalog": {
            "@type": "OfferCatalog",
            "name": "Types d'exercices 9ème AF",
            "itemListElement": [
                {
                    "@type": "Offer",
                    "itemOffered": {
                        "@type": "EducationalOccupationalProgram",
                        "name": "QCM 9ème AF",
                        "description": "Questions à choix multiples pour la 9ème AF"
                    }
                },
                {
                    "@type": "Offer",
                    "itemOffered": {
                        "@type": "EducationalOccupationalProgram",
                        "name": "Mode Examen 9ème AF",
                        "description": "Simulation d'examen officiel 9ème AF"
                    }
                },
                {
                    "@type": "Offer",
                    "itemOffered": {
                        "@type": "EducationalOccupationalProgram",
                        "name": "Programmes Officiels 9ème AF",
                        "description": "Documents MENFP pour la 9ème AF"
                    }
                }
            ]
        }
    }
    </script>
    
    <style>
        :root {
            --blue: #002395; --red: #d21034; --gold: #f1c40f; --green: #10b981;
            --purple: #7c3aed; --orange: #f59e0b;
            --gray-50: #f8fafc; --gray-100: #f1f5f9; --gray-200: #e2e8f0;
            --gray-300: #cbd5e1; --gray-400: #94a3b8; --gray-500: #64748b;
            --gray-600: #475569; --gray-700: #334155; --gray-800: #1e293b;
            --gray-900: #0f172a; --white: #ffffff;
            --shadow-sm: 0 1px 2px rgba(0,0,0,.05);
            --shadow-md: 0 4px 6px rgba(0,0,0,.07);
            --shadow-lg: 0 10px 25px rgba(0,0,0,.08);
            --shadow-xl: 0 20px 25px rgba(0,0,0,0.1);
            --radius: 12px; --radius-lg: 16px; --radius-xl: 24px;
            --transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html { font-size: 16px; scroll-behavior: smooth; -webkit-font-smoothing: antialiased; }
        body {
            font-family: 'Inter', sans-serif; line-height: 1.7; color: var(--gray-800);
            background: linear-gradient(180deg, #f0f4ff 0%, var(--gray-50) 30%);
            display: flex; flex-direction: column; min-height: 100vh;
        }

        /* ===== NAVBAR ===== */
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

        .nav-toggle { display: none; flex-direction: column; background: none; border: none; cursor: pointer; gap: 5px; }
        .nav-toggle .bar { width: 26px; height: 2.5px; background: var(--gray-700); border-radius: 2px; }

        .container { flex: 1; width: 100%; max-width: 800px; margin: 0 auto; padding: 2rem 1.5rem; }
        
        /* Header */
        .page-header { text-align: center; margin-bottom: 2.5rem; }
        .page-header .class-badge { display: inline-flex; align-items: center; gap: 0.5rem; background: linear-gradient(135deg, #eff6ff, #dbeafe); color: var(--blue); font-weight: 600; font-size: 0.85rem; padding: 0.5rem 1.2rem; border-radius: 50px; margin-bottom: 1rem; border: 1px solid #bfdbfe; }
        .page-header h1 { font-size: clamp(1.8rem, 5vw, 2.6rem); font-weight: 800; color: var(--gray-900); line-height: 1.2; }
        .page-header h1 .highlight { background: linear-gradient(135deg, var(--blue), #3b82f6); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .page-header .subtitle { color: var(--gray-500); font-size: 1rem; margin-top: 0.5rem; }
        .welcome-message { display: inline-flex; align-items: center; gap: 0.5rem; background: #f0fdf4; color: #166534; font-weight: 600; font-size: 1rem; padding: 0.6rem 1.2rem; border-radius: 50px; border: 1px solid #bbf7d0; margin-top: 0.75rem; }
        
        /* Cartes */
        .card { background: var(--white); border-radius: var(--radius-xl); padding: 2rem; box-shadow: var(--shadow-lg); margin-bottom: 1.5rem; border: 1px solid var(--gray-100); }
        .card-header { display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.5rem; padding-bottom: 1rem; border-bottom: 2px solid var(--gray-100); }
        .card-header .card-icon { width: 48px; height: 48px; background: linear-gradient(135deg, #eff6ff, #dbeafe); border-radius: var(--radius); display: flex; align-items: center; justify-content: center; font-size: 1.4rem; flex-shrink: 0; }
        .card-header h2 { font-size: 1.3rem; font-weight: 700; color: var(--gray-900); margin: 0; }
        .card-header p { color: var(--gray-400); font-size: 0.85rem; margin: 0; }
        
        /* Type grid */
        .type-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(140px, 1fr)); gap: 1rem; }
        .type-card { display: flex; flex-direction: column; align-items: center; gap: 0.6rem; padding: 1.5rem 1rem; background: var(--gray-50); border: 2px solid var(--gray-200); border-radius: var(--radius-lg); cursor: pointer; transition: all var(--transition); text-align: center; text-decoration: none; }
        .type-card:hover { transform: translateY(-4px); box-shadow: var(--shadow-xl); border-color: var(--blue); background: #eff6ff; }
        .type-icon-wrapper { font-size: 2rem; }
        .type-name { font-weight: 700; font-size: 0.95rem; color: var(--gray-800); }
        .type-desc { font-size: 0.78rem; color: var(--gray-500); line-height: 1.4; }
        .card-qcm:hover { border-color: var(--blue); }
        .card-completer:hover { border-color: var(--purple); }
        .card-exam:hover { border-color: var(--red); }
        .card-past:hover { border-color: var(--orange); }
        .card-maps:hover { border-color: var(--green); }
        .card-programmes:hover { border-color: var(--gold); }

        /* Info section */
        .info-section { display: grid; grid-template-columns: repeat(3, 1fr); gap: 1rem; margin-bottom: 1.5rem; }
        .info-item { background: var(--white); border-radius: var(--radius-lg); padding: 1.25rem; text-align: center; box-shadow: var(--shadow-md); border: 1px solid var(--gray-100); }
        .info-icon { font-size: 1.5rem; margin-bottom: 0.4rem; }
        .info-value { font-size: 1.6rem; font-weight: 800; color: var(--blue); }
        .info-label { font-size: 0.78rem; color: var(--gray-500); font-weight: 500; margin-top: 0.2rem; }

        /* SEO section */
        .seo-section { margin-bottom: 1.5rem; }
        .keyword-tags { display: flex; flex-wrap: wrap; gap: 0.5rem; }
        .keyword-tag { display: inline-block; background: var(--gray-100); color: var(--gray-600); font-size: 0.8rem; font-weight: 500; padding: 0.35rem 0.85rem; border-radius: 50px; border: 1px solid var(--gray-200); text-decoration: none; transition: all var(--transition); }
        .keyword-tag:hover { background: #eff6ff; color: var(--blue); border-color: #bfdbfe; }

        /* Footer */
        .footer { text-align: center; padding: 1.5rem; font-size: .8rem; color: var(--gray-400); border-top: 1px solid var(--gray-200); background: var(--white); }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 640px) {
            .navbar { padding: 0 1rem; }
            .nav-menu {
                display: none; position: absolute; top: 70px; left: 0; right: 0;
                background: rgba(255,255,255,.98); flex-direction: column;
                padding: 1rem;
                gap: 0.5rem;
                border-bottom: 1px solid var(--gray-200); box-shadow: var(--shadow-md);
            }
            .nav-menu.show { display: flex; }
            .nav-toggle { display: flex; }
            .nav-menu a {
                padding: 0.75rem 1rem;
                font-size: 0.95rem;
                width: 100%;
            }
            .container { padding: 1.25rem 1rem; }
            .card { padding: 1.25rem; }
            .type-grid { grid-template-columns: repeat(2, 1fr); }
            .info-section { grid-template-columns: repeat(3, 1fr); }
        }
        @media (min-width: 641px) and (max-width: 900px) {
            .nav-menu a { padding: 0.5rem 0.7rem; font-size: 0.85rem; }
            .nav-menu { gap: 0.25rem; }
        }
        @media (max-width: 400px) {
            .type-grid { grid-template-columns: 1fr; }
            .info-section { grid-template-columns: repeat(2, 1fr); }
        }
    </style>
</head>
<body>

<!-- ===== NAVBAR ===== -->
<nav class="navbar">
    <a href="<?= $basePath ?>/index.php" class="nav-brand">
        <img src="<?= $basePath ?>/images/logo.png" alt="Quiz Ayiti">
        <span class="nav-brand-text">Quiz<span> </span>Ayiti</span>
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

<!-- ========== CONTENU PRINCIPAL ========== -->
<main class="container">
    <!-- Header -->
    <div class="page-header">
        <div class="class-badge">📚 9ème Année Fondamentale</div>
        <h1>Choisis ton <span class="highlight">Exercice</span></h1>
        <p class="subtitle">Sélectionne le type d'activité que tu souhaites faire</p>
        <?php if ($name): ?>
            <div class="welcome-message">👋 Bon travail, <strong><?= e($name) ?></strong> !</div>
        <?php endif; ?>
    </div>

    <!-- Options principales -->
    <div class="card">
        <div class="card-header">
            <div class="card-icon">🎯</div>
            <div>
                <h2>Types d'exercices</h2>
                <p>Clique sur une carte pour commencer</p>
            </div>
        </div>
        <div class="type-grid">
            <!-- QCM -->
            <a href="<?= $basePath ?>/9e/qcm.php" class="type-card card-qcm" title="QCM 9ème AF - Questions à choix multiples">
                <div class="type-icon-wrapper">📋</div>
                <span class="type-name">QCM</span>
                <span class="type-desc">Questions à choix multiples</span>
            </a>

            <!-- Compléter -->
            <a href="<?= $basePath ?>/9e/completer.php" class="type-card card-completer" title="Exercices à trous 9ème AF">
                <div class="type-icon-wrapper">✍️</div>
                <span class="type-name">Compléter</span>
                <span class="type-desc">Textes à trous interactifs</span>
            </a>

            <!-- Mode Examen -->
            <a href="<?= $basePath ?>/9e/exam.php" class="type-card card-exam" title="Mode Examen 9ème AF - 60 questions chronométrées">
                <div class="type-icon-wrapper">⏱️</div>
                <span class="type-name">Mode Examen</span>
                <span class="type-desc">60 questions chronométrées</span>
            </a>

            <!-- Examens Passés -->
            <a href="<?= $basePath ?>/9e/examen.php" class="type-card card-past" title="Examens officiels 9ème AF 2010-2025">
                <div class="type-icon-wrapper">📁</div>
                <span class="type-name">Examens Passés</span>
                <span class="type-desc">Épreuves officielles 2010-2025</span>
            </a>

            <!-- Cartes / Dessin -->
            <a href="<?= $basePath ?>/9e/cartes.php" class="type-card card-maps" title="Cartes géographiques 9ème AF">
                <div class="type-icon-wrapper">🗺️</div>
                <span class="type-name">Cartes & Dessin</span>
                <span class="type-desc">Cartes du monde, Départements d'Haïti...</span>
            </a>

            <!-- Programmes Officiels -->
            <a href="<?= $basePath ?>/9e/programmes.php" class="type-card card-programmes" title="Programmes officiels MENFP 9ème AF">
                <div class="type-icon-wrapper">📚</div>
                <span class="type-name">Programmes Officiels</span>
                <span class="type-desc">Français, Maths, Créole, Sciences...</span>
            </a>
        </div>
    </div>

    <!-- Infos rapides -->
    <div class="info-section">
        <div class="info-item">
            <div class="info-icon">📖</div>
            <div class="info-value">7</div>
            <div class="info-label">Matières</div>
        </div>
        <div class="info-item">
            <div class="info-icon">📝</div>
            <div class="info-value">2000+</div>
            <div class="info-label">Questions</div>
        </div>
        <div class="info-item">
            <div class="info-icon">🎯</div>
            <div class="info-value">100%</div>
            <div class="info-label">Conforme MENFP</div>
        </div>
    </div>
    
    <!-- Section SEO -->
    <div class="seo-section">
        <div class="keyword-tags">
            <a href="<?= $basePath ?>/9e/qcm.php" class="keyword-tag">QCM 9ème</a>
            <a href="<?= $basePath ?>/9e/exam.php" class="keyword-tag">Examen 9ème AF</a>
            <a href="<?= $basePath ?>/9e/programmes.php" class="keyword-tag">Programmes MENFP</a>
            <a href="<?= $basePath ?>/9e/completer.php" class="keyword-tag">Exercices 9ème</a>
            <a href="<?= $basePath ?>/9e/examen.php" class="keyword-tag">Examens passés</a>
            <span class="keyword-tag">Quiz Haïti</span>
            <span class="keyword-tag">Révision 9ème</span>
            <span class="keyword-tag">Éducation Haïti</span>
        </div>
    </div>
</main>

<!-- ========== FOOTER ========== -->
<footer class="footer">
    <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; 
    9ème Année Fondamentale &mdash; 
    Programmes officiels MENFP 
   
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