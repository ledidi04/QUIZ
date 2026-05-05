<?php
$pageTitle = 'Quiz NS4';
$classeActive = 'ns4';
require_once __DIR__ . '/../includes/functions.php';

$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_SESSION['student_name']  = trim($_POST['student_name'] ?? '');
    $_SESSION['student_class'] = $_POST['student_class'] ?? 'ns4';
}

$name  = getStudentName();
$classe = getStudentClass();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <title>Quiz NS4 - Quiz Ayiti</title>
    <link rel="shortcut icon" href="../images/logo.png" type="image/x-icon
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
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
            --shadow-xl: 0 20px 25px rgba(0,0,0,0.1);
            --radius: 12px; --radius-lg: 16px; --radius-xl: 24px;
            --transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html { font-size: 16px; scroll-behavior: smooth; -webkit-font-smoothing: antialiased; }
        body {
            font-family: 'Inter', sans-serif; line-height: 1.7; color: var(--gray-800);
            background: linear-gradient(180deg, #fdf4ff 0%, var(--gray-50) 30%);
            display: flex; flex-direction: column; min-height: 100vh;
        }
        .navbar {
            display: flex; justify-content: space-between; align-items: center;
            background: rgba(255,255,255,0.95); backdrop-filter: blur(10px);
            padding: 0 2rem; height: 70px; position: sticky; top: 0; z-index: 1000;
            border-bottom: 1px solid var(--gray-200); box-shadow: var(--shadow-sm);
        }
        .nav-brand { display: flex; align-items: center; gap: 0.75rem; font-size: 1.4rem; font-weight: 800; color: var(--gray-900); text-decoration: none; }
        .nav-brand:hover { transform: scale(1.02); }
        .nav-brand .brand-icon { width: 42px; height: 42px; background: linear-gradient(135deg, var(--blue), #1e40af); border-radius: var(--radius); display: flex; align-items: center; justify-content: center; color: var(--gold); font-size: 1.3rem; font-weight: 800; box-shadow: 0 4px 12px rgba(0,35,149,0.25); }
        .nav-brand .brand-dot { color: var(--red); }
        .nav-menu { display: flex; list-style: none; gap: 0.5rem; align-items: center; }
        .nav-menu a { color: var(--gray-600); text-decoration: none; font-weight: 500; font-size: 0.95rem; padding: 0.6rem 1.1rem; border-radius: var(--radius); transition: all var(--transition); }
        .nav-menu a:hover { color: var(--blue); background: #eff6ff; }
        .nav-menu a.active { color: var(--white); background: var(--blue); font-weight: 600; }
        .nav-toggle { display: none; flex-direction: column; background: none; border: none; cursor: pointer; gap: 5px; }
        .nav-toggle .bar { width: 26px; height: 2.5px; background: var(--gray-700); border-radius: 2px; }
        .container { flex: 1; width: 100%; max-width: 800px; margin: 0 auto; padding: 2rem 1.5rem; }

        /* Header */
        .page-header { text-align: center; margin-bottom: 2.5rem; }
        .page-header .class-badge { display: inline-flex; align-items: center; gap: 0.5rem; background: linear-gradient(135deg, #fdf4ff, #ede9fe); color: var(--purple); font-weight: 600; font-size: 0.85rem; padding: 0.5rem 1.2rem; border-radius: 50px; margin-bottom: 1rem; border: 1px solid #ddd6fe; }
        .page-header h1 { font-size: clamp(1.8rem, 5vw, 2.6rem); font-weight: 800; color: var(--gray-900); line-height: 1.2; }
        .page-header h1 .highlight { background: linear-gradient(135deg, var(--purple), #8b5cf6); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .page-header .subtitle { color: var(--gray-500); font-size: 1rem; margin-top: 0.5rem; }
        .welcome-message { display: inline-flex; align-items: center; gap: 0.5rem; background: #f0fdf4; color: #166534; font-weight: 600; font-size: 1rem; padding: 0.6rem 1.2rem; border-radius: 50px; border: 1px solid #bbf7d0; margin-top: 0.75rem; }

        /* Cartes */
        .card { background: var(--white); border-radius: var(--radius-xl); padding: 2rem; box-shadow: var(--shadow-lg); margin-bottom: 1.5rem; border: 1px solid var(--gray-100); }
        .card-header { display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.5rem; padding-bottom: 1rem; border-bottom: 2px solid var(--gray-100); }
        .card-header .card-icon { width: 48px; height: 48px; background: linear-gradient(135deg, #fdf4ff, #ede9fe); border-radius: var(--radius); display: flex; align-items: center; justify-content: center; font-size: 1.4rem; flex-shrink: 0; }
        .card-header h2 { font-size: 1.3rem; font-weight: 700; color: var(--gray-900); margin: 0; }
        .card-header p { color: var(--gray-400); font-size: 0.85rem; margin: 0; }

        /* Grille des types */
        .type-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 1rem; }
        .type-card { display: flex; flex-direction: column; align-items: center; gap: 0.8rem; padding: 2rem 1.2rem; border: 2px solid var(--gray-200); border-radius: var(--radius-lg); cursor: pointer; transition: all var(--transition); text-align: center; text-decoration: none; color: inherit; position: relative; overflow: hidden; }
        .type-card:hover { transform: translateY(-4px); box-shadow: var(--shadow-xl); }
        .type-card:active { transform: translateY(-2px); }
        .type-card .type-icon-wrapper { width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 2rem; transition: all var(--transition); }
        .type-card .type-name { font-weight: 700; font-size: 1.05rem; }
        .type-card .type-desc { font-size: 0.8rem; color: var(--gray-500); line-height: 1.4; }

        /* QCM */
        .card-qcm { background: #f0f9ff; border-color: #bae6fd; }
        .card-qcm:hover { border-color: #0ea5e9; background: #e0f2fe; }
        .card-qcm .type-icon-wrapper { background: #dbeafe; }
        .card-qcm .type-name { color: #0369a1; }

        /* Compléter */
        .card-completer { background: #fefce8; border-color: #fef08a; }
        .card-completer:hover { border-color: #eab308; background: #fef9c3; }
        .card-completer .type-icon-wrapper { background: #fef3c7; }
        .card-completer .type-name { color: #a16207; }

        /* Examen */
        .card-exam { background: #fff1f2; border-color: #fecdd3; }
        .card-exam:hover { border-color: #e11d48; background: #ffe4e6; }
        .card-exam .type-icon-wrapper { background: #fecdd3; }
        .card-exam .type-name { color: #be123c; }

        /* Examens Passés */
        .card-past { background: #f0fdf4; border-color: #bbf7d0; }
        .card-past:hover { border-color: #22c55e; background: #dcfce7; }
        .card-past .type-icon-wrapper { background: #bbf7d0; }
        .card-past .type-name { color: #15803d; }

        /* Formules / Fiches */
        .card-formules { background: #f5f3ff; border-color: #ddd6fe; }
        .card-formules:hover { border-color: #8b5cf6; background: #ede9fe; }
        .card-formules .type-icon-wrapper { background: #ddd6fe; }
        .card-formules .type-name { color: #6d28d9; }

        /* Info section */
        .info-section { display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 0.75rem; margin-top: 1.5rem; }
        .info-item { background: var(--gray-50); border-radius: var(--radius); padding: 1rem; text-align: center; border: 1px solid var(--gray-100); }
        .info-item .info-icon { font-size: 1.5rem; margin-bottom: 0.25rem; }
        .info-item .info-value { font-weight: 700; color: var(--gray-800); font-size: 1.1rem; }
        .info-item .info-label { font-size: 0.75rem; color: var(--gray-400); }

        .footer { background: var(--white); border-top: 1px solid var(--gray-200); padding: 1.5rem; text-align: center; color: var(--gray-400); font-size: 0.85rem; margin-top: auto; }

        @media (max-width: 768px) {
            .navbar { padding: 0 1.25rem; height: 60px; }
            .nav-brand { font-size: 1.2rem; }
            .nav-brand .brand-icon { width: 34px; height: 34px; font-size: 1rem; }
            .nav-menu { display: none; flex-direction: column; position: absolute; top: 60px; left: 0; width: 100%; background: var(--white); padding: 1rem; border-bottom: 1px solid var(--gray-200); box-shadow: var(--shadow-lg); z-index: 999; }
            .nav-menu.show { display: flex; }
            .nav-menu a { padding: 0.8rem 1rem; }
            .nav-toggle { display: flex; }
            .container { padding: 1.25rem 1rem; }
            .type-grid { grid-template-columns: 1fr 1fr; gap: 0.75rem; }
            .type-card { padding: 1.5rem 1rem; }
            .type-card .type-icon-wrapper { width: 50px; height: 50px; font-size: 1.6rem; }
            .info-section { grid-template-columns: repeat(3, 1fr); }
        }
        @media (max-width: 400px) {
            .type-grid { grid-template-columns: 1fr; }
            .info-section { grid-template-columns: repeat(2, 1fr); }
        }
    </style>
</head>
<body>
    <!-- ========== NAVIGATION ========== -->
    <nav class="navbar">
        <a href="<?= $basePath ?>/index.php" class="nav-brand">
            <span class="brand-icon">Q</span>Quiz<span class="brand-dot">.</span>Ayiti
        </a>
        <button class="nav-toggle" id="navToggle" aria-label="Menu">
            <span class="bar"></span><span class="bar"></span><span class="bar"></span>
        </button>
        <ul class="nav-menu" id="navMenu">
            <li><a href="<?= $basePath ?>/index.php">Accueil</a></li>
            <li><a href="<?= $basePath ?>/9e/index.php">9ème AF</a></li>
            <li><a href="<?= $basePath ?>/ns4/index.php" class="active">NS4</a></li>
        </ul>
    </nav>

    <!-- ========== CONTENU PRINCIPAL ========== -->
    <main class="container">
        <!-- Header -->
        <div class="page-header">
            <div class="class-badge">🎓 Nouveaux Secondaires 4 — Examens Officiels</div>
            <h1>Choisis ton <span class="highlight">exercice</span></h1>
            <p class="subtitle">Prépare-toi aux épreuves officielles du MENFP</p>
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
                <a href="<?= $basePath ?>/ns4/qcm.php" class="type-card card-qcm">
                    <div class="type-icon-wrapper">📋</div>
                    <span class="type-name">QCM</span>
                    <span class="type-desc">Questions à choix multiples</span>
                </a>

                <!-- Compléter -->
                <a href="<?= $basePath ?>/ns4/completer.php" class="type-card card-completer">
                    <div class="type-icon-wrapper">✍️</div>
                    <span class="type-name">Compléter</span>
                    <span class="type-desc">Textes à trous interactifs</span>
                </a>

                <!-- Mode Examen -->
                <a href="<?= $basePath ?>/ns4/exam.php" class="type-card card-exam">
                    <div class="type-icon-wrapper">⏱️</div>
                    <span class="type-name">Mode Examen</span>
                    <span class="type-desc">60 questions chronométrées</span>
                </a>

                <!-- Examens Passés -->
                <a href="<?= $basePath ?>/ns4/examen.php" class="type-card card-past">
                    <div class="type-icon-wrapper">📁</div>
                    <span class="type-name">Examens Passés</span>
                    <span class="type-desc">Épreuves officielles NS4 2022-2024</span>
                </a>

                <!-- Formules & Fiches -->
                <a href="<?= $basePath ?>/ns4/formules.php" class="type-card card-formules">
                    <div class="type-icon-wrapper">🧪</div>
                    <span class="type-name">Formules & Fiches</span>
                    <span class="type-desc">Maths, Physique, Chimie, SVT…</span>
                </a>
            </div>
        </div>

        <!-- Infos rapides -->
        <div class="info-section">
            <div class="info-item">
                <div class="info-icon">📖</div>
                <div class="info-value">8</div>
                <div class="info-label">Matières</div>
            </div>
            <div class="info-item">
                <div class="info-icon">📝</div>
                <div class="info-value">4000+</div>
                <div class="info-label">Questions</div>
            </div>
            <div class="info-item">
                <div class="info-icon">🎯</div>
                <div class="info-value">100%</div>
                <div class="info-label">Conforme MENFP</div>
            </div>
        </div>
    </main>

    <!-- ========== FOOTER ========== -->
    <footer class="footer">
        <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; NS4 — Nouveaux Secondaires 4 &mdash; Programmes officiels MENFP</p>
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