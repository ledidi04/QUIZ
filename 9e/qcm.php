<?php
session_start();

// Fonction d'échappement
function e($s) { return htmlspecialchars($s ?? '', ENT_QUOTES, 'UTF-8'); }

// Récupération du nom
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['student_name'])) {
    $_SESSION['student_name'] = trim($_POST['student_name'] ?? '');
}
$name = $_SESSION['student_name'] ?? null;

// Calcul du chemin de base
$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');

$pageTitle = 'QCM - 9ème AF';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <link rel="shortcut icon" href="<?= $basePath ?>/images/logo.png" type="image/x-icon">
    <title><?= $pageTitle ?> - Quiz Ayiti</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --blue: #002395;
            --blue-light: #3b82f6;
            --red: #d21034;
            --gold: #f1c40f;
            --green: #10b981;
            --gray-50: #f8fafc; --gray-100: #f1f5f9; --gray-200: #e2e8f0;
            --gray-300: #cbd5e1; --gray-400: #94a3b8; --gray-500: #64748b;
            --gray-600: #475569; --gray-700: #334155; --gray-800: #1e293b;
            --gray-900: #0f172a; --white: #ffffff;
            --shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
            --shadow-md: 0 4px 6px rgba(0,0,0,0.07);
            --shadow-lg: 0 10px 15px rgba(0,0,0,0.1), 0 4px 6px rgba(0,0,0,0.05);
            --shadow-xl: 0 20px 25px rgba(0,0,0,0.1), 0 10px 10px rgba(0,0,0,0.04);
            --radius: 12px; --radius-lg: 16px; --radius-xl: 24px;
            --transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        html { font-size: 16px; scroll-behavior: smooth; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; }
        body { font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif; line-height: 1.7; color: var(--gray-800); background: linear-gradient(180deg, #f0f4ff 0%, var(--gray-50) 100%); display: flex; flex-direction: column; min-height: 100vh; }

        /* ===== NAVBAR ===== */
        .navbar {
            display: flex; justify-content: space-between; align-items: center;
            background: rgba(255,255,255,.95); backdrop-filter: blur(10px); -webkit-backdrop-filter: blur(10px);
            padding: 0 1.5rem;
            height: 70px; position: sticky; top: 0; z-index: 1000;
            border-bottom: 1px solid var(--gray-200); box-shadow: var(--shadow-sm);
        }
        .nav-brand { display: flex; align-items: center; gap: .75rem; text-decoration: none; }
        .nav-brand img { height: 44px; width: 44px; object-fit: contain; border-radius: var(--radius); }
        .nav-brand-text { font-size: 1.35rem; font-weight: 800; color: var(--gray-900); }
        .nav-brand-text span { color: var(--red); }
        .nav-brand:hover .nav-brand-text { color: var(--blue); }
        .nav-menu { display: flex; list-style: none; gap: 0.35rem; align-items: center; }
        .nav-menu a { color: var(--gray-600); text-decoration: none; font-weight: 500; font-size: .9rem; padding: 0.5rem 0.9rem; border-radius: var(--radius); transition: all var(--transition); white-space: nowrap; }
        .nav-menu a:hover { color: var(--blue); background: #eff6ff; }
        .nav-menu a.active { color: var(--white); background: var(--blue); font-weight: 600; }
        .nav-menu a.btn-apk { background: linear-gradient(135deg, var(--green), #059669); color: var(--white); font-weight: 600; box-shadow: 0 3px 10px rgba(16,185,129,.3); padding: 0.5rem 0.9rem; }
        .nav-menu a.btn-apk:hover { transform: translateY(-1px); box-shadow: 0 5px 14px rgba(16,185,129,.4); }
        .nav-toggle { display: none; flex-direction: column; background: none; border: none; cursor: pointer; gap: 5px; padding: 4px; }
        .nav-toggle .bar { width: 26px; height: 2.5px; background: var(--gray-700); border-radius: 2px; transition: var(--transition); }

        /* ========== CONTAINER ========== */
        .container { flex: 1; width: 100%; max-width: 800px; margin: 0 auto; padding: 2rem 1.5rem; }

        /* ========== CARDS ========== */
        .card { background: var(--white); border-radius: var(--radius-xl); padding: 2rem; box-shadow: var(--shadow-lg); margin-bottom: 1.5rem; border: 1px solid var(--gray-100); transition: var(--transition); }
        .card:hover { box-shadow: var(--shadow-xl); }
        .card-header { display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.5rem; padding-bottom: 1rem; border-bottom: 2px solid var(--gray-100); }
        .card-header .card-icon { width: 48px; height: 48px; background: linear-gradient(135deg, #eff6ff, #dbeafe); border-radius: var(--radius); display: flex; align-items: center; justify-content: center; font-size: 1.4rem; flex-shrink: 0; }
        .card-header h2 { font-size: 1.3rem; font-weight: 700; color: var(--gray-900); margin: 0; }
        .card-header p { color: var(--gray-400); font-size: 0.85rem; margin: 0; }

        /* ========== GRILLE MATIÈRES ========== */
        .subject-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(140px, 1fr)); gap: 0.85rem; }
        .subject-btn { display: flex; flex-direction: column; align-items: center; gap: 0.6rem; padding: 1.5rem 1rem; background: var(--gray-50); border: 2px solid var(--gray-200); border-radius: var(--radius-lg); cursor: pointer; transition: all var(--transition); text-align: center; font-family: inherit; font-size: inherit; }
        .subject-btn:hover { border-color: var(--blue); background: #eff6ff; transform: translateY(-3px); box-shadow: var(--shadow-lg); }
        .subject-btn.active { border-color: var(--blue); background: linear-gradient(135deg, #eff6ff, #dbeafe); box-shadow: 0 0 0 4px rgba(0,35,149,0.1); }
        .subject-btn .subject-icon { font-size: 2rem; }
        .subject-btn .subject-name { font-weight: 600; font-size: 0.9rem; color: var(--gray-700); }

        /* ========== QUIZ CONTAINER ========== */
        #quizContainer { min-height: 100px; }
        .question-progress { display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.25rem; font-size: 0.85rem; color: var(--gray-500); font-weight: 500; }
        .question-progress span { white-space: nowrap; font-weight: 600; color: var(--gray-700); }
        .progress-bar { flex: 1; height: 8px; background: var(--gray-200); border-radius: 4px; overflow: hidden; }
        .progress-bar .progress-fill { height: 100%; background: linear-gradient(90deg, var(--blue), var(--blue-light)); border-radius: 4px; transition: width 0.4s ease; }
        .question-text { font-weight: 600; font-size: 1.15rem; color: var(--gray-900); margin-bottom: 1.5rem; line-height: 1.6; padding: 0.25rem 0; }

        /* ========== OPTIONS ========== */
        .option-btn { display: block; width: 100%; text-align: left; background: var(--gray-50); border: 2px solid var(--gray-200); border-radius: var(--radius); padding: 1rem 1.25rem; margin-bottom: 0.7rem; cursor: pointer; transition: all var(--transition); font-size: 1rem; font-family: inherit; color: var(--gray-700); position: relative; }
        .option-btn:hover:not(:disabled) { border-color: var(--blue); background: #eff6ff; transform: translateX(6px); box-shadow: var(--shadow-md); }
        .option-btn:disabled { cursor: not-allowed; opacity: 0.9; }
        .option-btn.correct { background: #d4edda; border-color: #28a745; color: #155724; font-weight: 600; }
        .option-btn.correct::after { content: ' ✓'; position: absolute; right: 1rem; color: #28a745; font-weight: 700; }
        .option-btn.wrong { background: #f8d7da; border-color: #dc3545; color: #721c24; }
        .option-btn.wrong::after { content: ' ✗'; position: absolute; right: 1rem; color: #dc3545; font-weight: 700; }

        /* ========== EXPLICATION ========== */
        .explication { background: #fffbeb; border-left: 4px solid var(--gold); padding: 1rem 1.25rem; margin-top: 1rem; border-radius: 0 8px 8px 0; font-size: 0.9rem; color: var(--gray-700); animation: fadeIn 0.3s ease; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-5px); } to { opacity: 1; transform: translateY(0); } }

        /* ========== BOUTONS ========== */
        .btn-next { display: block; width: 100%; padding: 1rem; background: linear-gradient(135deg, var(--blue), #1e40af); color: var(--white); border: none; border-radius: var(--radius); font-size: 1.05rem; font-weight: 600; cursor: pointer; margin-top: 1rem; transition: all var(--transition); font-family: inherit; }
        .btn-next:hover { transform: translateY(-2px); box-shadow: 0 6px 18px rgba(0,35,149,0.35); }
        .btn-next:active { transform: translateY(0); }
        .btn-back { display: block; width: 100%; padding: 0.9rem; background: var(--gray-200); color: var(--gray-700); border: none; border-radius: var(--radius); font-size: 1rem; font-weight: 600; cursor: pointer; margin-top: 0.5rem; text-align: center; text-decoration: none; transition: var(--transition); }
        .btn-back:hover { background: var(--gray-300); }

        /* ========== SCORE FINAL ========== */
        .score-final { text-align: center; padding: 1.5rem 0; }
        .score-circle { width: 130px; height: 130px; border-radius: 50%; background: linear-gradient(135deg, #eff6ff, #dbeafe); display: flex; flex-direction: column; align-items: center; justify-content: center; margin: 0 auto 1.5rem; border: 5px solid var(--blue); box-shadow: 0 0 0 8px rgba(0,35,149,0.08); }
        .score-circle .score-number { font-size: 2.8rem; font-weight: 800; color: var(--blue); line-height: 1; }
        .score-circle .score-total { font-size: 0.9rem; color: var(--gray-500); }
        .score-percent { font-size: 3.5rem; font-weight: 800; color: var(--gray-900); line-height: 1.2; }
        .score-emoji { font-size: 3.5rem; margin-bottom: 0.5rem; }
        .score-message { font-size: 1.1rem; color: var(--gray-600); margin-bottom: 1.5rem; }

        /* ========== TABLEAU RÉSUMÉ ========== */
        .summary-table { width: 100%; border-collapse: collapse; margin: 1rem 0; font-size: 0.9rem; border-radius: var(--radius); overflow: hidden; }
        .summary-table th, .summary-table td { padding: 0.7rem 0.9rem; border: 1px solid var(--gray-200); text-align: left; }
        .summary-table th { background: var(--gray-100); font-weight: 600; color: var(--gray-700); }
        .summary-table .row-correct { background: #d4edda; }
        .summary-table .row-wrong { background: #f8d7da; }

        /* ========== FOOTER ========== */
        .footer { background: var(--white); border-top: 1px solid var(--gray-200); padding: 1.5rem; text-align: center; color: var(--gray-400); font-size: 0.85rem; margin-top: auto; }

        /* ========== RESPONSIVE ========== */
        @media (max-width: 640px) {
            .navbar { padding: 0 1rem; }
            .nav-menu { display: none; position: absolute; top: 70px; left: 0; right: 0; background: rgba(255,255,255,.98); flex-direction: column; padding: 1rem; gap: 0.5rem; border-bottom: 1px solid var(--gray-200); box-shadow: var(--shadow-md); }
            .nav-menu.show { display: flex; }
            .nav-toggle { display: flex; }
            .nav-menu a { padding: 0.75rem 1rem; font-size: 0.95rem; width: 100%; }
            .container { padding: 1.25rem 1rem; }
            .card { padding: 1.25rem; }
            .subject-grid { grid-template-columns: repeat(auto-fill, minmax(120px, 1fr)); gap: 0.6rem; }
            .subject-btn { padding: 1.2rem 0.8rem; }
            .subject-btn .subject-icon { font-size: 1.6rem; }
            .subject-btn .subject-name { font-size: 0.8rem; }
            .question-text { font-size: 1.05rem; }
            .option-btn { padding: 0.85rem 1rem; font-size: 0.95rem; }
            .score-percent { font-size: 2.5rem; }
            .score-circle { width: 100px; height: 100px; }
            .score-circle .score-number { font-size: 2rem; }
        }
        @media (min-width: 641px) and (max-width: 900px) {
            .nav-menu a { padding: 0.5rem 0.7rem; font-size: 0.85rem; }
            .nav-menu { gap: 0.25rem; }
        }
        @media (max-width: 400px) {
            .subject-grid { grid-template-columns: 1fr 1fr; }
            .card { padding: 1rem; border-radius: var(--radius-lg); }
        }
    </style>
</head>
<body>

    <!-- ===== NAVBAR ===== -->
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

    <!-- ========== CONTENU PRINCIPAL ========== -->
    <main class="container">
        <?php if ($name): ?>
            <p style="text-align:center;color:var(--gray-500);margin-bottom:1rem;font-size:0.95rem;">
                👋 Bienvenue, <strong><?= e($name) ?></strong> !
            </p>
        <?php endif; ?>

        <!-- Étape 1 : Choix de la matière -->
        <div class="card" id="stepMatiere">
            <div class="card-header">
                <div class="card-icon">📖</div>
                <div>
                    <h2>🎯 Choisis une matière</h2>
                    <p>Sélectionne la matière sur laquelle tu veux être interrogé(e)</p>
                </div>
            </div>
            <div class="subject-grid" id="subjectGrid">
                <button class="subject-btn" data-matiere="creole"><span class="subject-icon">🇭🇹</span><span class="subject-name">Créole</span></button>
                <button class="subject-btn" data-matiere="francais"><span class="subject-icon">📝</span><span class="subject-name">Français</span></button>
                <button class="subject-btn" data-matiere="maths"><span class="subject-icon">🔢</span><span class="subject-name">Maths</span></button>
                <button class="subject-btn" data-matiere="sciences_exp"><span class="subject-icon">🔬</span><span class="subject-name">Sciences Exp.</span></button>
                <button class="subject-btn" data-matiere="sciences_soc"><span class="subject-icon">🌍</span><span class="subject-name">Sciences Soc.</span></button>
                <button class="subject-btn" data-matiere="anglais"><span class="subject-icon">🇬🇧</span><span class="subject-name">Anglais</span></button>
                <button class="subject-btn" data-matiere="espagnol"><span class="subject-icon">🇪🇸</span><span class="subject-name">Espagnol</span></button>
            </div>
            <a href="<?= $basePath ?>/9e/index.php" class="btn-back" style="margin-top:1.25rem;">
                ⬅️ Retour aux exercices
            </a>
        </div>

        <!-- Étape 2 : Quiz -->
        <div id="quizContainer" class="card" style="display:none;">
            <p style="text-align:center;color:var(--gray-400);padding:2rem;">
                👆 Choisis une matière ci-dessus pour commencer le quiz
            </p>
        </div>
    </main>

    <!-- ========== FOOTER ========== -->
    <footer class="footer">
        <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; 9ème AF &mdash; Tous droits réservés</p>
    </footer>

    <!-- ========== JAVASCRIPT ========== -->
    <script>
        // Configuration
        const API_URL = '<?= $basePath ?>/api/questions.php';

        /**
         * Convertit les caractères mathématiques Unicode en HTML lisible.
         */
        function formatMath(text) {
            if (!text) return text;
            const REPLACEMENTS = [
                ['\u221a', '&radic;'], ['\u222b', '&int;'], ['\u221e', '&infin;'],
                ['\u2248', '&asymp;'], ['\u2260', '&ne;'], ['\u2261', '&equiv;'],
                ['\u2192', '&rarr;'], ['\u21c4', '&#8644;'], ['\u00d7', '&times;'],
                ['\u00b7', '&middot;'], ['\u0394', '&Delta;'], ['\u03c0', '&pi;'],
                ['\u03c3', '&sigma;'], ['\u03b5', '&epsilon;'], ['\u00b0', '&deg;'],
                ['\u2113', '&#8467;'],
                ['\u2070','<sup>0</sup>'],['\u00b9','<sup>1</sup>'],['\u00b2','<sup>2</sup>'],
                ['\u00b3','<sup>3</sup>'],['\u2074','<sup>4</sup>'],['\u2075','<sup>5</sup>'],
                ['\u2076','<sup>6</sup>'],['\u2077','<sup>7</sup>'],['\u2078','<sup>8</sup>'],
                ['\u2079','<sup>9</sup>'],['\u207f','<sup>n</sup>'],['\u207a','<sup>+</sup>'],
                ['\u207b','<sup>-</sup>'],['\u207c','<sup>=</sup>'],['\u207d','<sup>(</sup>'],
                ['\u207e','<sup>)</sup>'],['\u02e3','<sup>x</sup>'],['\u1d34','<sup>H</sup>'],
                ['\u1d56','<sup>p</sup>'],['\u1d43','<sup>a</sup>'],['\u1d47','<sup>b</sup>'],
                ['\u1d9c','<sup>c</sup>'],['\u1d48','<sup>d</sup>'],['\u1d49','<sup>e</sup>'],
                ['\u1da0','<sup>f</sup>'],['\u1d4d','<sup>g</sup>'],['\u02b0','<sup>h</sup>'],
                ['\u2071','<sup>i</sup>'],['\u02b2','<sup>j</sup>'],['\u1d4f','<sup>k</sup>'],
                ['\u02e1','<sup>l</sup>'],['\u1d50','<sup>m</sup>'],['\u1d52','<sup>o</sup>'],
                ['\u02b3','<sup>r</sup>'],['\u02e2','<sup>s</sup>'],['\u1d57','<sup>t</sup>'],
                ['\u1d58','<sup>u</sup>'],['\u1d5b','<sup>v</sup>'],['\u02b7','<sup>w</sup>'],
                ['\u02b8','<sup>y</sup>'],
                ['\u2080','<sub>0</sub>'],['\u2081','<sub>1</sub>'],['\u2082','<sub>2</sub>'],
                ['\u2083','<sub>3</sub>'],['\u2084','<sub>4</sub>'],['\u2085','<sub>5</sub>'],
                ['\u2086','<sub>6</sub>'],['\u2087','<sub>7</sub>'],['\u2088','<sub>8</sub>'],
                ['\u2089','<sub>9</sub>'],['\u2099','<sub>n</sub>'],['\u2093','<sub>x</sub>'],
                ['\u2090','<sub>a</sub>'],['\u2091','<sub>e</sub>'],['\u2092','<sub>o</sub>'],
                ['\u1d62','<sub>i</sub>'],['\u1d63','<sub>r</sub>'],['\u1d64','<sub>u</sub>'],
                ['\u1d65','<sub>v</sub>'],['\u208a','<sub>+</sub>'],['\u208b','<sub>-</sub>'],
            ];
            for (const [from, to] of REPLACEMENTS) { text = text.split(from).join(to); }
            text = text.replace(/<\/sup><sup>/g, '');
            text = text.replace(/<\/sub><sub>/g, '');
            return text;
        }

        const CLASSE = '9e';
        const QUIZ_TYPE = 'qcm';
        let currentQuestions = [];
        let currentIndex = 0;
        let score = 0;
        let userAnswers = [];

        // Menu mobile
        document.getElementById('navToggle').addEventListener('click', function() {
            document.getElementById('navMenu').classList.toggle('show');
        });
        document.addEventListener('click', function(e) {
            if (!document.querySelector('.navbar').contains(e.target)) {
                document.getElementById('navMenu').classList.remove('show');
            }
        });

        // Sélection d'une matière
        const subjectBtns = document.querySelectorAll('.subject-btn');
        const quizContainer = document.getElementById('quizContainer');

        subjectBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                subjectBtns.forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                loadQuiz(this.dataset.matiere);
            });
        });

        async function loadQuiz(matiere) {
            quizContainer.style.display = 'block';
            quizContainer.innerHTML = `
                <div style="text-align:center;padding:2rem;">
                    <div style="font-size:3rem;margin-bottom:1rem;">⏳</div>
                    <p style="color:var(--gray-600);">Chargement des questions...</p>
                    <p style="color:var(--gray-400);font-size:0.85rem;">Matière : ${matiere}</p>
                </div>
            `;
            const url = `${API_URL}?classe=${encodeURIComponent(CLASSE)}&matiere=${encodeURIComponent(matiere)}&type=${encodeURIComponent(QUIZ_TYPE)}&random=true&limit=20`;
            console.log('🔍 Chargement:', url);
            try {
                const response = await fetch(url);
                if (!response.ok) throw new Error(`Erreur HTTP ${response.status}`);
                const data = await response.json();
                console.log('📦 Données reçues:', data);
                if (data.error) throw new Error(data.error);
                currentQuestions = (data.questions || []).filter(q =>
                    q.type === 'qcm' && q.options && q.options.length >= 2
                );
                currentIndex = 0;
                score = 0;
                userAnswers = [];
                console.log('📊 Questions QCM filtrées:', currentQuestions.length);
                if (currentQuestions.length === 0) {
                    quizContainer.innerHTML = `
                        <div style="text-align:center;padding:2rem;">
                            <div style="font-size:3rem;">😕</div>
                            <p style="color:var(--gray-600);margin-top:1rem;">Aucune question QCM disponible pour cette matière.</p>
                            <p style="color:var(--gray-400);">Essaie une autre matière ou contacte ton professeur.</p>
                        </div>
                    `;
                    return;
                }
                renderQuestion();
                quizContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
            } catch (error) {
                console.error('❌ Erreur:', error);
                quizContainer.innerHTML = `
                    <div style="text-align:center;padding:2rem;">
                        <div style="font-size:3rem;">⚠️</div>
                        <p style="color:#dc3545;margin-top:1rem;">Erreur lors du chargement</p>
                        <p style="color:var(--gray-500);">${error.message}</p>
                    </div>
                `;
            }
        }

        function renderQuestion() {
            if (currentIndex >= currentQuestions.length) { showScore(); return; }
            const q = currentQuestions[currentIndex];
            const progress = (currentIndex / currentQuestions.length) * 100;
            let html = `
                <div class="question-progress">
                    <span>Question ${currentIndex + 1}/${currentQuestions.length}</span>
                    <div class="progress-bar"><div class="progress-fill" style="width: ${progress}%"></div></div>
                </div>
            `;
            html += `<p class="question-text">${formatMath(q.enonce)}</p>`;
            if (q.options && q.options.length >= 2) {
                q.options.forEach((option, index) => {
                    const letter = String.fromCharCode(65 + index);
                    html += `<button class="option-btn" data-correct="${option.correct}" data-index="${index}"><strong>${letter}.</strong> ${formatMath(option.texte)}</button>`;
                });
            } else {
                html += '<p style="color:#dc3545;text-align:center;">⚠️ Question sans options.</p>';
            }
            quizContainer.innerHTML = html;
            const optionButtons = document.querySelectorAll('.option-btn[data-correct]');
            optionButtons.forEach(btn => {
                btn.addEventListener('click', function() {
                    if (this.disabled) return;
                    optionButtons.forEach(b => { b.disabled = true; if (b.dataset.correct === 'true') b.classList.add('correct'); });
                    if (this.dataset.correct !== 'true') this.classList.add('wrong');
                    const isCorrect = this.dataset.correct === 'true';
                    userAnswers.push({ question: q.enonce, type: q.type, userAnswer: this.textContent.trim(), correct: isCorrect });
                    handleAnswer(q, isCorrect);
                });
            });
            quizContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }

        function handleAnswer(q, isCorrect) {
            if (isCorrect) score++;
            if (q.explication && q.explication.trim() !== '') {
                const explDiv = document.createElement('div');
                explDiv.className = 'explication';
                explDiv.innerHTML = `<strong>💡 Explication :</strong> ${formatMath(q.explication)}`;
                quizContainer.appendChild(explDiv);
            }
            const nextBtn = document.createElement('button');
            nextBtn.className = 'btn-next';
            nextBtn.textContent = currentIndex < currentQuestions.length - 1 ? '⏭️ Question suivante' : '🎯 Voir mon résultat';
            nextBtn.addEventListener('click', function() {
                currentIndex++;
                renderQuestion();
                quizContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
            });
            quizContainer.appendChild(nextBtn);
            setTimeout(() => { nextBtn.scrollIntoView({ behavior: 'smooth', block: 'center' }); }, 150);
        }

        function showScore() {
            const totalQuestions = currentQuestions.length;
            const pourcentage = Math.round((score / totalQuestions) * 100);
            let emoji, message, messageColor;
            if (pourcentage >= 90) { emoji = '🏆'; message = 'Excellent ! Tu maîtrises parfaitement cette matière !'; messageColor = '#28a745'; }
            else if (pourcentage >= 70) { emoji = '👏'; message = 'Très bien ! Continue comme ça, tu progresses !'; messageColor = '#28a745'; }
            else if (pourcentage >= 50) { emoji = '💪'; message = 'Pas mal ! Mais tu peux encore t\'améliorer.'; messageColor = '#f59e0b'; }
            else { emoji = '📚'; message = 'Continue à réviser, tu vas y arriver !'; messageColor = '#dc3545'; }
            let html = `
                <div class="score-final">
                    <div class="score-emoji">${emoji}</div>
                    <div class="score-circle"><span class="score-number">${score}</span><span class="score-total">/ ${totalQuestions}</span></div>
                    <div class="score-percent">${pourcentage}%</div>
                    <p class="score-message" style="color:${messageColor};">${message}</p>
                    <button class="btn-next" onclick="location.reload()" style="max-width:300px;margin:0 auto;">🔄 Recommencer le quiz</button>
                    <a href="<?= $basePath ?>/9e/index.php" class="btn-back" style="max-width:300px;margin:0.5rem auto;">⬅️ Retour aux exercices</a>
                </div>
            `;
            if (userAnswers.length > 0) {
                html += `
                    <div style="margin-top:2rem;">
                        <h3 style="text-align:center;margin-bottom:1rem;color:var(--gray-700);">📋 Résumé de tes réponses</h3>
                        <div style="overflow-x:auto;">
                            <table class="summary-table">
                                <thead><tr><th style="width:40px;">#</th><th>Question</th><th style="width:60px;">Résultat</th></tr></thead>
                                <tbody>
                `;
                userAnswers.forEach((answer, index) => {
                    const shortQuestion = answer.question.length > 70 ? answer.question.substring(0, 70) + '...' : answer.question;
                    html += `<tr class="${answer.correct ? 'row-correct' : 'row-wrong'}"><td style="text-align:center;font-weight:600;">${index + 1}</td><td>${shortQuestion}</td><td style="text-align:center;">${answer.correct ? '✅' : '❌'}</td></tr>`;
                });
                html += `</tbody></table></div></div>`;
            }
            quizContainer.innerHTML = html;
            quizContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }

        console.log('📋 Quiz QCM 9ème AF - Prêt');
        console.log('🔗 API:', API_URL);
    </script>
</body>
</html>