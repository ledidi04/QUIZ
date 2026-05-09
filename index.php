<?php
$pageTitle = 'Accueil';
require_once __DIR__ . '/includes/functions.php';

// ═══════════════════════════════════════
// DÉTECTION AUTOMATIQUE DU DOSSIER RACINE
// ═══════════════════════════════════════
$basePath = rtrim(dirname($_SERVER['SCRIPT_NAME']), '/');

// URL complète actuelle (pour JSON-LD et Open Graph)
$currentUrl = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'] . $basePath;

// ═══════════════════════════════════════
// TRAITEMENT DU FORMULAIRE
// ═══════════════════════════════════════
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_SESSION['student_name']  = trim($_POST['student_name'] ?? '');
    $_SESSION['student_class'] = $_POST['student_class'] ?? '9e';
    
    // Redirection selon la classe choisie
    $classe = $_SESSION['student_class'];
    if ($classe === 'ns4') {
        header('Location: ' . $basePath . '/ns4/index.php');
        exit;
    } else {
        // Par défaut : 9ème AF
        header('Location: ' . $basePath . '/9e/index.php');
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <!-- Meta description optimisée avec mots-clés longue traîne -->
    <meta name="description" content="Plateforme de quiz et QCM pour 9ème année, NS4, Philo, Université, Préfac en Haïti. Exercices interactifs, mode examen, corrigés détaillés basés sur les programmes officiels du MENFP.">
    <meta name="keywords" content="quiz haiti, qcm 9eme annee, ns4 haiti, philo haiti, universite haiti, prefac, revision examen 9eme, education haiti, menfp, exercices interactifs haiti">
    <meta name="google-site-verification" content="ikYgHEBCKlQWimzFOnFPfwoOUqXJ41fPNc6nXbI1lng" />
    
    <!-- Titre optimisé pour le SEO (environ 60 caractères) -->
    <title>Quiz Ayiti , Quiz Haïti | 9ème, NS4, Philo, Université, Préfac – QCM Haïti</title>
    
    <!-- Open Graph pour les réseaux sociaux -->
    <meta property="og:title" content="Quiz Ayiti | 9ème, NS4, Philo, Université, Préfac – QCM Haïti">
    <meta property="og:description" content="Plateforme de quiz et QCM pour élèves et étudiants haïtiens. 9ème, NS4, Philo, Université, Préfac. Exercices interactifs, annales, mode examen.">
    <meta property="og:url" content="<?= $currentUrl ?>/index.php">
    <meta property="og:type" content="website">
    <meta property="og:image" content="<?= $currentUrl ?>/images/logo.png">
    <meta property="og:image:alt" content="Logo Quiz Ayiti – Quiz éducatif Haïti">
    <meta property="og:locale" content="fr_HT">
    
    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="Quiz Ayiti, Quiz Haiti | 9ème, NS4, Philo, Université, Préfac – QCM Haïti">
    <meta name="twitter:description" content="Plateforme de quiz et QCM pour élèves et étudiants haïtiens. Exercices interactifs, annales, mode examen.">
    <meta name="twitter:image" content="<?= $currentUrl ?>/images/logo.png">

    <!-- Données structurées JSON-LD (Site Web et Organisation Éducative) -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "EducationalOrganization",
      "name": "Quiz Ayiti",
      "url": "<?= $currentUrl ?>",
      "description": "Plateforme de quiz et QCM pour 9ème année, NS4, Philo, Université et classes Pré-Fac en Haïti.",
      "logo": "<?= $currentUrl ?>/images/logo.png",
      "address": {
        "@type": "PostalAddress",
        "addressCountry": "HT"
      },
      "sameAs": []
    }
    </script>
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "WebSite",
      "name": "Quiz Ayiti",
      "url": "<?= $currentUrl ?>",
      "description": "Plateforme de quiz éducatif pour 9ème, NS4, Philo, Université, Préfac en Haïti.",
      "potentialAction": {
        "@type": "SearchAction",
        "target": "<?= $currentUrl ?>/recherche?q={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    }
    </script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --blue: #002395;
            --red: #d21034;
            --gold: #f1c40f;
            --green: #10b981;
            --dark: #0f172a;
            --gray-50: #f8fafc;
            --gray-100: #f1f5f9;
            --gray-200: #e2e8f0;
            --gray-300: #cbd5e1;
            --gray-400: #94a3b8;
            --gray-500: #64748b;
            --gray-600: #475569;
            --gray-700: #334155;
            --gray-800: #1e293b;
            --gray-900: #0f172a;
            --white: #ffffff;
            --shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
            --shadow: 0 1px 3px rgba(0,0,0,0.1), 0 1px 2px rgba(0,0,0,0.06);
            --shadow-md: 0 4px 6px rgba(0,0,0,0.07), 0 2px 4px rgba(0,0,0,0.06);
            --shadow-lg: 0 10px 15px rgba(0,0,0,0.1), 0 4px 6px rgba(0,0,0,0.05);
            --shadow-xl: 0 20px 25px rgba(0,0,0,0.1), 0 10px 10px rgba(0,0,0,0.04);
            --radius-sm: 8px;
            --radius: 12px;
            --radius-lg: 16px;
            --radius-xl: 24px;
            --transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        *,
        *::before,
        *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            font-size: 16px;
            scroll-behavior: smooth;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Roboto, 'Helvetica Neue', system-ui, sans-serif;
            line-height: 1.7;
            color: var(--gray-800);
            background: var(--gray-50);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* ═══════════════════ NAVBAR UNIFIÉE ═══════════════════ */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(255,255,255,0.95);
            backdrop-filter: blur(10px);
            padding: 0 1.5rem;
            height: 70px;
            position: sticky;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid var(--gray-200);
            box-shadow: var(--shadow-sm);
        }

        .nav-brand {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            text-decoration: none;
        }

        .nav-brand img {
            height: 44px;
            width: 44px;
            object-fit: contain;
            border-radius: var(--radius);
        }

        .nav-brand-text {
            font-size: 1.35rem;
            font-weight: 800;
            color: var(--gray-900);
        }

        .nav-brand-text span {
            color: var(--red);
        }

        .nav-brand:hover .nav-brand-text {
            color: var(--blue);
        }

        .nav-menu {
            display: flex;
            list-style: none;
            gap: 0.35rem;
            align-items: center;
        }

        .nav-menu a {
            color: var(--gray-600);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.9rem;
            padding: 0.5rem 0.9rem;
            border-radius: var(--radius);
            transition: all var(--transition);
            white-space: nowrap;
        }

        .nav-menu a:hover {
            color: var(--blue);
            background: #eff6ff;
        }

        .nav-menu a.active {
            color: var(--white);
            background: var(--blue);
            font-weight: 600;
        }

        .nav-menu a.btn-apk {
            background: linear-gradient(135deg, var(--green), #059669);
            color: var(--white);
            font-weight: 600;
            box-shadow: 0 3px 10px rgba(16,185,129,.3);
            padding: 0.5rem 0.9rem;
        }

        .nav-menu a.btn-apk:hover {
            transform: translateY(-1px);
            box-shadow: 0 5px 14px rgba(16,185,129,.4);
        }

        .nav-toggle {
            display: none;
            flex-direction: column;
            background: none;
            border: none;
            cursor: pointer;
            gap: 5px;
        }

        .nav-toggle .bar {
            width: 26px;
            height: 2.5px;
            background: var(--gray-700);
            border-radius: 2px;
        }

        /* ========== MAIN CONTAINER ========== */
        .container {
            flex: 1;
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
            padding: 3rem 1.5rem;
        }

        /* ========== HERO ========== */
        .hero-section {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: #eff6ff;
            color: var(--blue);
            font-weight: 600;
            font-size: 0.85rem;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            margin-bottom: 1.5rem;
            border: 1px solid #bfdbfe;
        }

        .hero-badge .badge-dot {
            width: 8px;
            height: 8px;
            background: #22c55e;
            border-radius: 50%;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.4; }
        }

        .hero-section h1 {
            font-size: clamp(2rem, 5vw, 3.2rem);
            font-weight: 800;
            color: var(--gray-900);
            line-height: 1.2;
            letter-spacing: -1px;
            margin-bottom: 1rem;
        }

        .hero-section h1 .highlight {
            background: linear-gradient(135deg, var(--blue), #3b82f6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-section .lead {
            font-size: 1.15rem;
            color: var(--gray-500);
            max-width: 650px;
            margin: 0 auto 1rem;
            line-height: 1.8;
        }

        .hero-features {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 0.75rem;
            margin-top: 1.5rem;
        }

        .feature-tag {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            background: var(--white);
            border: 1px solid var(--gray-200);
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 500;
            color: var(--gray-600);
            transition: all var(--transition);
        }

        .feature-tag:hover {
            border-color: var(--blue);
            color: var(--blue);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .feature-tag .tag-icon {
            font-size: 1rem;
        }

        /* ========== CARD FORM ========== */
        .main-card {
            background: var(--white);
            border-radius: var(--radius-xl);
            padding: 2.5rem;
            box-shadow: var(--shadow-xl);
            max-width: 520px;
            margin: 0 auto;
            border: 1px solid var(--gray-100);
            position: relative;
            overflow: hidden;
        }

        .main-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--blue), var(--red), var(--gold));
        }

        .main-card .card-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .main-card .card-header h2 {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--gray-900);
            margin-bottom: 0.4rem;
        }

        .main-card .card-header p {
            color: var(--gray-400);
            font-size: 0.9rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--gray-700);
            font-size: 0.9rem;
            letter-spacing: 0.2px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 0.9rem 1rem;
            border: 2px solid var(--gray-200);
            border-radius: var(--radius);
            font-size: 1rem;
            font-family: inherit;
            transition: all var(--transition);
            background: var(--gray-50);
            color: var(--gray-800);
            appearance: none;
            -webkit-appearance: none;
        }

        .form-group select {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath d='M6 8L1 3h10z' fill='%2364748b'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            padding-right: 2.5rem;
            cursor: pointer;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: var(--blue);
            outline: none;
            box-shadow: 0 0 0 4px rgba(0,35,149,0.1);
            background: var(--white);
        }

        .form-group input::placeholder {
            color: var(--gray-400);
        }

        .btn-submit {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, var(--blue), #1e40af);
            color: var(--white);
            border: none;
            border-radius: var(--radius);
            font-size: 1.05rem;
            font-weight: 600;
            font-family: inherit;
            cursor: pointer;
            transition: all var(--transition);
            letter-spacing: 0.3px;
            box-shadow: 0 4px 16px rgba(0,35,149,0.3);
            position: relative;
            overflow: hidden;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(0,35,149,0.35);
            background: linear-gradient(135deg, #002fb8, #1e3a8a);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        /* ========== STATS BANNER ========== */
        .stats-banner {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 1rem;
            max-width: 700px;
            margin: 2.5rem auto 0;
        }

        .stat-item {
            background: var(--white);
            border-radius: var(--radius-lg);
            padding: 1.25rem;
            text-align: center;
            border: 1px solid var(--gray-100);
            box-shadow: var(--shadow-sm);
            transition: all var(--transition);
        }

        .stat-item:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-md);
        }

        .stat-item .stat-icon {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        .stat-item .stat-value {
            font-size: 1.6rem;
            font-weight: 800;
            color: var(--gray-900);
            line-height: 1;
        }

        .stat-item .stat-label {
            font-size: 0.8rem;
            color: var(--gray-500);
            margin-top: 0.3rem;
            font-weight: 500;
        }

        /* ========== NIVEAUX SECTION (ajout SEO) ========== */
        .levels-section {
            max-width: 700px;
            margin: 3rem auto 0;
            text-align: center;
        }

        .levels-section h2 {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--gray-900);
            margin-bottom: 1.5rem;
        }

        .levels-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
            gap: 1rem;
        }

        .level-card {
            background: var(--white);
            border-radius: var(--radius-lg);
            padding: 1.25rem 1rem;
            border: 1px solid var(--gray-200);
            box-shadow: var(--shadow-sm);
            transition: all var(--transition);
        }

        .level-card.active {
            border-left: 4px solid var(--blue);
        }

        .level-card.soon {
            opacity: 0.6;
            border-left: 4px solid var(--gold);
        }

        .level-card h3 {
            font-size: 1rem;
            font-weight: 600;
            color: var(--gray-800);
            margin-bottom: 0.4rem;
        }

        .level-card p {
            font-size: 0.85rem;
            color: var(--gray-500);
        }

        /* ========== FOOTER ========== */
        .footer {
            background: var(--white);
            border-top: 1px solid var(--gray-200);
            padding: 1.5rem;
            text-align: center;
            color: var(--gray-400);
            font-size: 0.85rem;
        }

        .footer a {
            color: var(--blue);
            text-decoration: none;
            font-weight: 500;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        /* ═══════════════════ RESPONSIVE ═══════════════════ */
        @media (max-width: 768px) {
            .navbar {
                padding: 0 1rem;
                height: 60px;
            }

            .nav-menu {
                display: none;
                flex-direction: column;
                position: absolute;
                top: 60px;
                left: 0;
                width: 100%;
                background: rgba(255,255,255,.98);
                padding: 1rem;
                border-bottom: 1px solid var(--gray-200);
                box-shadow: var(--shadow-lg);
                gap: 0.5rem;
            }

            .nav-menu.show {
                display: flex;
            }

            .nav-menu a {
                padding: 0.75rem 1rem;
                font-size: 0.95rem;
                width: 100%;
            }

            .nav-toggle {
                display: flex;
            }

            .hero-section h1 {
                font-size: 1.8rem;
            }

            .hero-section .lead {
                font-size: 1rem;
            }

            .main-card {
                padding: 1.5rem;
                border-radius: var(--radius-lg);
            }

            .container {
                padding: 2rem 1rem;
            }

            .stats-banner {
                grid-template-columns: repeat(2, 1fr);
            }

            .levels-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (min-width: 641px) and (max-width: 900px) {
            .nav-menu a {
                padding: 0.5rem 0.7rem;
                font-size: 0.85rem;
            }
            .nav-menu {
                gap: 0.25rem;
            }
        }

        @media (max-width: 400px) {
            .hero-features {
                gap: 0.4rem;
            }
            .feature-tag {
                font-size: 0.75rem;
                padding: 0.4rem 0.75rem;
            }
            .stats-banner {
                grid-template-columns: 1fr 1fr;
                gap: 0.5rem;
            }
            .stat-item {
                padding: 0.75rem;
            }
            .stat-item .stat-value {
                font-size: 1.3rem;
            }
            .levels-grid {
                grid-template-columns: 1fr 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- ═══════════════════ NAVBAR UNIFIÉE ═══════════════════ -->
    <nav class="navbar" role="navigation" aria-label="Navigation principale">
        <a href="<?= $basePath ?>/index.php" class="nav-brand" title="Quiz Ayiti – Accueil">
            <img src="<?= $basePath ?>/images/logo.png" alt="Quiz Ayiti">
            <span class="nav-brand-text">Quiz Ayiti</span>
        </a>
        <button class="nav-toggle" id="navToggle" aria-label="Menu">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </button>
        <ul class="nav-menu" id="navMenu">
            <li><a href="<?= $basePath ?>/index.php" >Accueil</a></li>
            <li><a href="<?= $basePath ?>/9e/index.php">9ème AF</a></li>
            <li><a href="<?= $basePath ?>/ns4/index.php">NS4</a></li>
            <li><a href="<?= $basePath ?>/about/index.php">À propos</a></li>
            <li><a href="<?= $basePath ?>/download.php" >Télécharger l'app</a></li>
        </ul>
    </nav>

    <!-- ========== MAIN CONTENT ========== -->
    <main class="container">
        <!-- Hero -->
        <section class="hero-section">
            <div class="hero-badge">
                <span class="badge-dot"></span>
                Programmes officiels MENFP
            </div>
            <h1>
                Révisez avec<br><span class="highlight">Quiz Ayiti</span>
            </h1>
            <p class="lead">
                Une plateforme interactive conçue pour les élèves de 
                <strong>9ème année fondamentale</strong> et <strong>NS4</strong>, 
                basée sur les programmes officiels et les examens des années antérieures.
            </p>
            <div class="hero-features">
                <span class="feature-tag"><span class="tag-icon"></span> QCM</span>
                <span class="feature-tag"><span class="tag-icon"></span> Completer</span>
                <span class="feature-tag"><span class="tag-icon"></span> Examen Passés</span>
                <span class="feature-tag"><span class="tag-icon"></span> Cartes,Shema,Graphes...</span>
                <span class="feature-tag"><span class="tag-icon">⏱</span> Mode Examen</span>
            </div>
        </section>

        <!-- Formulaire -->
        <div class="main-card">
            <div class="card-header">
                <h2>🎯 Commence tes révisions</h2>
                <p>Entre ton nom et choisis ta classe</p>
            </div>
            <!-- Le formulaire pointe vers index.php qui traite et redirige -->
            <form action="<?= $basePath ?>/index.php" method="post" class="start-form" novalidate>
                <div class="form-group">
                    <label for="studentName"> Ton prénom ou pseudo</label>
                    <input 
                        type="text" 
                        id="studentName" 
                        name="student_name"
                        placeholder="Ex. : Jean" 
                        required 
                        autocomplete="given-name"
                        value="<?= e(getStudentName()) ?>"
                    >
                </div>
                <div class="form-group">
                    <label for="classSelect"> Choisis ta classe</label>
                    <select id="classSelect" name="student_class" required>
                        <option value="" disabled <?= !getStudentClass() ? 'selected' : '' ?>>-- Sélectionne ta classe --</option>
                        <option value="9e"  <?= getStudentClass() === '9e'  ? 'selected' : '' ?>>9ème Année Fondamentale</option>
                        <option value="ns4" <?= getStudentClass() === 'ns4' ? 'selected' : '' ?>>NS4 (Secondaire IV)</option>
                    </select>
                </div>
                <button type="submit" class="btn-submit">
                    🚀 Commencer les révisions
                </button>
            </form>
        </div>

        <!-- Stats Banner -->
        <div class="stats-banner">
            <div class="stat-item">
                <div class="stat-icon">📖</div>
                <div class="stat-value">20+</div>
                <div class="stat-label">Matières couvertes</div>
            </div>
            <div class="stat-item">
                <div class="stat-icon">📝</div>
                <div class="stat-value">10+</div>
                <div class="stat-label">Types d'exercices</div>
            </div>
            <div class="stat-item">
                <div class="stat-icon">🎯</div>
                <div class="stat-value">100%</div>
                <div class="stat-label">Conforme MENFP</div>
            </div>
        </div>

        <!-- Niveaux couverts -->
        <section class="levels-section">
            <h2> Niveaux couverts</h2>
            <div class="levels-grid">
                <div class="level-card active">
                    <h3>9ème Année </h3>
                    
                </div>
                <div class="level-card active">
                    <h3>NS4 (Secondaire IV)</h3>
                    
                </div>
                
                <div class="level-card soon">
                    <h3>Université / Pré-Fac</h3>
                </div>
            </div>
        </section>
    </main>

    <!-- ========== FOOTER ========== -->
    <footer class="footer">
        <p>
            &copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; 
            Basé sur les <a href="#" title="Programmes officiels MENFP Haïti">programmes officiels du MENFP</a>
        </p>
    </footer>

    <script>
        // Menu hamburger mobile
        document.getElementById('navToggle').addEventListener('click', function() {
            document.getElementById('navMenu').classList.toggle('show');
        });
        document.addEventListener('click', function(e) {
            const nav = document.querySelector('.navbar');
            if (!nav.contains(e.target)) {
                document.getElementById('navMenu').classList.remove('show');
            }
        });
    </script>
</body>
</html>