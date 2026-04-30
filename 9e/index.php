<?php
$pageTitle = 'Quiz 9ème AF';
$classeActive = '9e';
require_once __DIR__ . '/../includes/functions.php';

// ═══════════════════════════════════════
// DÉTECTION AUTOMATIQUE DU DOSSIER RACINE
// ═══════════════════════════════════════
$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');

// Traitement du formulaire (nom + classe)
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
    <meta name="description" content="Quiz 9ème Année Fondamentale - Exercices interactifs basés sur le programme officiel MENFP">
    <title>Quiz 9ème AF - Quiz Ayiti</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --blue: #002395;
            --red: #d21034;
            --gold: #f1c40f;
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

        /* ========== NAVIGATION ========== */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: var(--white);
            padding: 0 2rem;
            height: 70px;
            position: sticky;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid var(--gray-200);
            backdrop-filter: blur(10px);
            background: rgba(255,255,255,0.95);
        }

        .nav-brand {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-size: 1.4rem;
            font-weight: 800;
            color: var(--gray-900);
            text-decoration: none;
            letter-spacing: -0.5px;
        }

        .nav-brand .brand-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, var(--blue), #1e40af);
            border-radius: var(--radius);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--gold);
            font-size: 1.2rem;
            font-weight: 800;
            box-shadow: 0 4px 12px rgba(0,35,149,0.25);
        }

        .nav-brand .brand-dot {
            color: var(--red);
        }

        .nav-menu {
            display: flex;
            list-style: none;
            gap: 0.5rem;
            align-items: center;
        }

        .nav-menu a {
            color: var(--gray-600);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.95rem;
            padding: 0.6rem 1.1rem;
            border-radius: var(--radius);
            transition: all var(--transition);
            position: relative;
        }

        .nav-menu a:hover {
            color: var(--blue);
            background: #eff6ff;
        }

        .nav-menu a.active {
            color: var(--white);
            background: var(--blue);
            font-weight: 600;
            box-shadow: 0 2px 8px rgba(0,35,149,0.3);
        }

        .nav-toggle {
            display: none;
            flex-direction: column;
            background: none;
            border: none;
            cursor: pointer;
            gap: 5px;
            padding: 0.5rem;
        }

        .nav-toggle .bar {
            width: 26px;
            height: 2.5px;
            background: var(--gray-700);
            border-radius: 2px;
            transition: var(--transition);
        }

        /* ========== MAIN CONTAINER ========== */
        .container {
            flex: 1;
            width: 100%;
            max-width: 900px;
            margin: 0 auto;
            padding: 2rem 1.5rem;
        }

        /* ========== PAGE HEADER ========== */
        .page-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .page-header .class-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: linear-gradient(135deg, #eff6ff, #dbeafe);
            color: var(--blue);
            font-weight: 600;
            font-size: 0.85rem;
            padding: 0.5rem 1.2rem;
            border-radius: 50px;
            margin-bottom: 1rem;
            border: 1px solid #bfdbfe;
        }

        .page-header h1 {
            font-size: clamp(1.6rem, 4vw, 2.4rem);
            font-weight: 800;
            color: var(--gray-900);
            line-height: 1.3;
            letter-spacing: -0.5px;
            margin-bottom: 0.5rem;
        }

        .page-header h1 .highlight {
            background: linear-gradient(135deg, var(--blue), #3b82f6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .welcome-message {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: #f0fdf4;
            color: #166534;
            font-weight: 600;
            font-size: 1rem;
            padding: 0.6rem 1.2rem;
            border-radius: 50px;
            border: 1px solid #bbf7d0;
            margin-top: 0.5rem;
        }

        .welcome-message .wave {
            font-size: 1.2rem;
        }

        /* ========== CARDS ========== */
        .card {
            background: var(--white);
            border-radius: var(--radius-xl);
            padding: 2rem;
            box-shadow: var(--shadow-lg);
            margin-bottom: 1.5rem;
            border: 1px solid var(--gray-100);
            transition: all var(--transition);
        }

        .card-header {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--gray-100);
        }

        .card-header .card-icon {
            width: 44px;
            height: 44px;
            background: linear-gradient(135deg, #eff6ff, #dbeafe);
            border-radius: var(--radius);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
        }

        .card-header h2 {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--gray-900);
            margin: 0;
        }

        .card-header p {
            color: var(--gray-400);
            font-size: 0.85rem;
            margin: 0;
        }

        /* ========== SUBJECT GRID ========== */
        .subject-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 0.85rem;
        }

        .subject-btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.6rem;
            padding: 1.5rem 1rem;
            background: var(--gray-50);
            border: 2px solid var(--gray-200);
            border-radius: var(--radius-lg);
            cursor: pointer;
            transition: all var(--transition);
            text-align: center;
            font-family: inherit;
            position: relative;
            overflow: hidden;
        }

        .subject-btn:hover {
            border-color: var(--blue);
            background: #eff6ff;
            transform: translateY(-3px);
            box-shadow: var(--shadow-lg);
        }

        .subject-btn.active {
            border-color: var(--blue);
            background: linear-gradient(135deg, #eff6ff, #dbeafe);
            box-shadow: 0 4px 12px rgba(0,35,149,0.2);
        }

        .subject-btn.active::after {
            content: '✓';
            position: absolute;
            top: 8px;
            right: 12px;
            font-size: 0.8rem;
            color: var(--blue);
            font-weight: 700;
        }

        .subject-btn .subject-icon {
            font-size: 2rem;
            line-height: 1;
        }

        .subject-btn .subject-name {
            font-weight: 600;
            font-size: 0.9rem;
            color: var(--gray-700);
        }

        .subject-btn.active .subject-name {
            color: var(--blue);
        }

        /* ========== QUIZ CONTAINER ========== */
        #quizContainer {
            min-height: 100px;
        }

        .quiz-placeholder {
            text-align: center;
            padding: 2rem;
            color: var(--gray-400);
        }

        .quiz-placeholder .placeholder-icon {
            font-size: 3rem;
            margin-bottom: 0.75rem;
            opacity: 0.6;
        }

        .quiz-placeholder p {
            font-size: 1rem;
        }

        /* ========== QUESTION BLOCK ========== */
        .question-block {
            padding: 0.5rem 0;
        }

        .question-progress {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.25rem;
            font-size: 0.85rem;
            color: var(--gray-500);
            font-weight: 500;
        }

        .progress-bar {
            flex: 1;
            height: 6px;
            background: var(--gray-200);
            border-radius: 3px;
            overflow: hidden;
        }

        .progress-bar .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, var(--blue), #3b82f6);
            border-radius: 3px;
            transition: width 0.3s ease;
        }

        .question-text {
            font-weight: 600;
            font-size: 1.1rem;
            color: var(--gray-900);
            margin-bottom: 1.25rem;
            line-height: 1.6;
        }

        .option-btn {
            display: block;
            width: 100%;
            text-align: left;
            background: var(--gray-50);
            border: 2px solid var(--gray-200);
            border-radius: var(--radius);
            padding: 0.9rem 1.15rem;
            margin-bottom: 0.6rem;
            cursor: pointer;
            transition: all var(--transition);
            font-size: 0.95rem;
            font-family: inherit;
            color: var(--gray-700);
            position: relative;
        }

        .option-btn:hover:not(:disabled) {
            border-color: var(--blue);
            background: #eff6ff;
            transform: translateX(4px);
        }

        .option-btn:disabled {
            cursor: not-allowed;
            opacity: 0.9;
        }

        .option-btn.correct {
            background: #d4edda;
            border-color: #28a745;
            color: #155724;
        }

        .option-btn.wrong {
            background: #f8d7da;
            border-color: #dc3545;
            color: #721c24;
        }

        .explication {
            background: #fffbeb;
            border-left: 4px solid var(--gold);
            padding: 1rem 1.15rem;
            margin-top: 1rem;
            border-radius: 0 var(--radius-sm) var(--radius-sm) 0;
            font-size: 0.9rem;
            color: var(--gray-700);
            line-height: 1.6;
        }

        .explication strong {
            color: var(--gray-900);
        }

        .btn-next {
            display: block;
            width: 100%;
            padding: 0.9rem;
            background: linear-gradient(135deg, var(--blue), #1e40af);
            color: var(--white);
            border: none;
            border-radius: var(--radius);
            font-size: 1rem;
            font-weight: 600;
            font-family: inherit;
            cursor: pointer;
            transition: all var(--transition);
            margin-top: 1rem;
            box-shadow: 0 4px 12px rgba(0,35,149,0.25);
        }

        .btn-next:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(0,35,149,0.35);
        }

        /* ========== SCORE FINAL ========== */
        .score-final {
            text-align: center;
            padding: 1rem 0;
        }

        .score-circle {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: linear-gradient(135deg, #eff6ff, #dbeafe);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            border: 4px solid var(--blue);
        }

        .score-circle .score-number {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--blue);
            line-height: 1;
        }

        .score-circle .score-total {
            font-size: 0.9rem;
            color: var(--gray-500);
            margin-top: -5px;
        }

        .score-percent {
            font-size: 3rem;
            font-weight: 800;
            color: var(--gray-900);
            margin-bottom: 0.25rem;
        }

        .score-emoji {
            font-size: 3rem;
            margin-bottom: 0.5rem;
        }

        .score-message {
            font-size: 1.1rem;
            color: var(--gray-600);
            margin-bottom: 1.5rem;
        }

        .completion-input {
            width: 100%;
            padding: 0.9rem 1rem;
            border: 2px solid var(--gray-200);
            border-radius: var(--radius);
            font-size: 1rem;
            font-family: inherit;
            transition: all var(--transition);
            background: var(--white);
        }

        .completion-input:focus {
            border-color: var(--blue);
            outline: none;
            box-shadow: 0 0 0 4px rgba(0,35,149,0.1);
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

        /* ========== RESPONSIVE ========== */
        @media (max-width: 768px) {
            .navbar {
                padding: 0 1.25rem;
                height: 60px;
            }

            .nav-brand {
                font-size: 1.2rem;
            }

            .nav-brand .brand-icon {
                width: 34px;
                height: 34px;
                font-size: 1rem;
            }

            .nav-menu {
                display: none;
                flex-direction: column;
                position: absolute;
                top: 60px;
                left: 0;
                width: 100%;
                background: var(--white);
                padding: 1rem;
                border-bottom: 1px solid var(--gray-200);
                box-shadow: var(--shadow-lg);
                z-index: 999;
            }

            .nav-menu.show {
                display: flex;
            }

            .nav-menu a {
                padding: 0.8rem 1rem;
                border-radius: var(--radius-sm);
            }

            .nav-menu a.active {
                border-radius: var(--radius-sm);
            }

            .nav-toggle {
                display: flex;
            }

            .container {
                padding: 1.25rem 1rem;
            }

            .page-header h1 {
                font-size: 1.5rem;
            }

            .card {
                padding: 1.25rem;
            }

            .subject-grid {
                grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
                gap: 0.6rem;
            }

            .subject-btn {
                padding: 1rem 0.75rem;
            }

            .subject-btn .subject-icon {
                font-size: 1.5rem;
            }

            .subject-btn .subject-name {
                font-size: 0.8rem;
            }

            .score-circle {
                width: 100px;
                height: 100px;
            }
        }

        @media (max-width: 400px) {
            .subject-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>
    <!-- ========== NAVIGATION ========== -->
    <nav class="navbar" role="navigation" aria-label="Navigation principale">
        <a href="<?= $basePath ?>/index.php" class="nav-brand">
            <span class="brand-icon">Q</span>
            Quiz<span class="brand-dot">.</span>Ayiti
        </a>
        <button class="nav-toggle" id="navToggle" aria-label="Menu">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </button>
        <ul class="nav-menu" id="navMenu">
            <li><a href="<?= $basePath ?>/index.php">Accueil</a></li>
            <li><a href="<?= $basePath ?>/9e/index.php" class="active">9ème AF</a></li>
            <li><a href="<?= $basePath ?>/ns4/index.php">NS4</a></li>
        </ul>
    </nav>

    <!-- ========== MAIN CONTENT ========== -->
    <main class="container">
        <!-- Page Header -->
        <div class="page-header">
            <div class="class-badge">
                📚 9ème Année Fondamentale
            </div>
            <h1>Révise tes <span class="highlight">matières</span></h1>
            <?php if ($name): ?>
                <div class="welcome-message">
                    <span class="wave">👋</span> Bon travail, <strong><?= e($name) ?></strong> !
                </div>
            <?php endif; ?>
        </div>

        <!-- Choix de la matière -->
        <div class="card">
            <div class="card-header">
                <div class="card-icon">📖</div>
                <div>
                    <h2>Choisis une matière</h2>
                    <p>Sélectionne pour commencer le quiz</p>
                </div>
            </div>
            <div class="subject-grid" id="subjectGrid">
                <button class="subject-btn" data-matiere="creole">
                    <span class="subject-icon">🇭🇹</span>
                    <span class="subject-name">Créole</span>
                </button>
                <button class="subject-btn" data-matiere="francais">
                    <span class="subject-icon">📝</span>
                    <span class="subject-name">Français</span>
                </button>
                <button class="subject-btn" data-matiere="maths">
                    <span class="subject-icon">🔢</span>
                    <span class="subject-name">Mathématiques</span>
                </button>
                <button class="subject-btn" data-matiere="sciences_exp">
                    <span class="subject-icon">🔬</span>
                    <span class="subject-name">Sciences Exp.</span>
                </button>
                <button class="subject-btn" data-matiere="sciences_soc">
                    <span class="subject-icon">🌍</span>
                    <span class="subject-name">Sciences Soc.</span>
                </button>
                <button class="subject-btn" data-matiere="anglais">
                    <span class="subject-icon">🇬🇧</span>
                    <span class="subject-name">Anglais</span>
                </button>
                <button class="subject-btn" data-matiere="espagnol">
                    <span class="subject-icon">🇪🇸</span>
                    <span class="subject-name">Espagnol</span>
                </button>
            </div>
        </div>

        <!-- Zone du quiz -->
        <div id="quizContainer" class="card">
            <div class="quiz-placeholder">
                <div class="placeholder-icon">👆</div>
                <p>Sélectionne une matière ci-dessus pour commencer le quiz.</p>
            </div>
        </div>
    </main>

    <!-- ========== FOOTER ========== -->
    <footer class="footer">
        <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; 9ème Année Fondamentale</p>
    </footer>

    <script>
        // Menu hamburger mobile
        (function() {
            const navToggle = document.getElementById('navToggle');
            const navMenu = document.getElementById('navMenu');
            if (navToggle && navMenu) {
                navToggle.addEventListener('click', function() {
                    navMenu.classList.toggle('show');
                });
                document.addEventListener('click', function(e) {
                    const nav = document.querySelector('.navbar');
                    if (!nav.contains(e.target)) {
                        navMenu.classList.remove('show');
                    }
                });
            }
        })();

        // ═══════════════════════════════════════
        // CONFIGURATION DU QUIZ
        // ═══════════════════════════════════════
        window.QUIZ_CONFIG = {
            apiUrl: '<?= $basePath ?>/api/questions.php',
            basePath: '<?= $basePath ?>',
            classe: '9e'
        };
    </script>
    <script src="<?= $basePath ?>/js/quiz.js"></script>
</body>
</html>