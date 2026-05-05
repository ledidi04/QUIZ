<?php
session_start();

function e($s) { return htmlspecialchars($s ?? '', ENT_QUOTES, 'UTF-8'); }

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['student_name'])) {
    $_SESSION['student_name'] = trim($_POST['student_name'] ?? '');
}
$name = $_SESSION['student_name'] ?? null;

$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');

$pageTitle = 'QCM - NS4';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <title><?= $pageTitle ?> - Quiz Ayiti</title>
    <link rel="shortcut icon" href="../images/logo.png" type="image/x-icon>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --blue: #002395;
            --blue-light: #3b82f6;
            --red: #d21034;
            --gold: #f1c40f;
            --green: #28a745;
            --purple: #7c3aed;
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
            --shadow-md: 0 4px 6px rgba(0,0,0,0.07);
            --shadow-lg: 0 10px 15px rgba(0,0,0,0.1), 0 4px 6px rgba(0,0,0,0.05);
            --shadow-xl: 0 20px 25px rgba(0,0,0,0.1), 0 10px 10px rgba(0,0,0,0.04);
            --radius: 12px;
            --radius-lg: 16px;
            --radius-xl: 24px;
            --transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        html { font-size: 16px; scroll-behavior: smooth; -webkit-font-smoothing: antialiased; }
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            line-height: 1.7; color: var(--gray-800);
            background: linear-gradient(180deg, #fdf4ff 0%, var(--gray-50) 100%);
            display: flex; flex-direction: column; min-height: 100vh;
        }

        /* ========== NAVBAR ========== */
        .navbar {
            display: flex; justify-content: space-between; align-items: center;
            background: rgba(255,255,255,0.95); backdrop-filter: blur(10px);
            padding: 0 2rem; height: 70px; position: sticky; top: 0; z-index: 1000;
            border-bottom: 1px solid var(--gray-200); box-shadow: var(--shadow-sm);
        }
        .nav-brand { display: flex; align-items: center; gap: 0.75rem; font-size: 1.4rem; font-weight: 800; color: var(--gray-900); text-decoration: none; transition: var(--transition); }
        .nav-brand:hover { transform: scale(1.02); }
        .nav-brand .brand-icon { width: 42px; height: 42px; background: linear-gradient(135deg, var(--blue), #1e40af); border-radius: var(--radius); display: flex; align-items: center; justify-content: center; color: var(--gold); font-size: 1.3rem; font-weight: 800; box-shadow: 0 4px 12px rgba(0,35,149,0.25); }
        .nav-brand .brand-dot { color: var(--red); }
        .nav-menu { display: flex; list-style: none; gap: 0.5rem; align-items: center; }
        .nav-menu a { color: var(--gray-600); text-decoration: none; font-weight: 500; font-size: 0.95rem; padding: 0.6rem 1.1rem; border-radius: var(--radius); transition: all var(--transition); }
        .nav-menu a:hover { color: var(--blue); background: #eff6ff; }
        .nav-menu a.active { color: var(--white); background: var(--blue); font-weight: 600; }
        .nav-toggle { display: none; flex-direction: column; background: none; border: none; cursor: pointer; gap: 5px; padding: 4px; }
        .nav-toggle .bar { width: 26px; height: 2.5px; background: var(--gray-700); border-radius: 2px; }

        /* ========== CONTAINER ========== */
        .container { flex: 1; width: 100%; max-width: 800px; margin: 0 auto; padding: 2rem 1.5rem; }

        /* ========== PAGE HEADER ========== */
        .page-header { text-align: center; margin-bottom: 2rem; }
        .page-header .class-badge { display: inline-flex; align-items: center; gap: 0.5rem; background: linear-gradient(135deg, #fdf4ff, #ede9fe); color: var(--purple); font-weight: 600; font-size: 0.85rem; padding: 0.5rem 1.2rem; border-radius: 50px; margin-bottom: 0.75rem; border: 1px solid #ddd6fe; }
        .page-header h1 { font-size: clamp(1.6rem, 4vw, 2.2rem); font-weight: 800; color: var(--gray-900); }
        .page-header h1 .highlight { background: linear-gradient(135deg, var(--purple), #8b5cf6); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .page-header .subtitle { color: var(--gray-500); font-size: 0.95rem; margin-top: 0.4rem; }

        /* ========== CARDS ========== */
        .card { background: var(--white); border-radius: var(--radius-xl); padding: 2rem; box-shadow: var(--shadow-lg); margin-bottom: 1.5rem; border: 1px solid var(--gray-100); transition: var(--transition); }
        .card:hover { box-shadow: var(--shadow-xl); }
        .card-header { display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.5rem; padding-bottom: 1rem; border-bottom: 2px solid var(--gray-100); }
        .card-header .card-icon { width: 48px; height: 48px; background: linear-gradient(135deg, #fdf4ff, #ede9fe); border-radius: var(--radius); display: flex; align-items: center; justify-content: center; font-size: 1.4rem; flex-shrink: 0; }
        .card-header h2 { font-size: 1.3rem; font-weight: 700; color: var(--gray-900); margin: 0; }
        .card-header p { color: var(--gray-400); font-size: 0.85rem; margin: 0; }

        /* ========== GRILLE MATIÈRES NS4 ========== */
        .subject-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(140px, 1fr)); gap: 0.85rem; }
        .subject-btn {
            display: flex; flex-direction: column; align-items: center; gap: 0.6rem;
            padding: 1.5rem 1rem; background: var(--gray-50); border: 2px solid var(--gray-200);
            border-radius: var(--radius-lg); cursor: pointer; transition: all var(--transition);
            text-align: center; font-family: inherit;
        }
        .subject-btn:hover { border-color: var(--purple); background: #fdf4ff; transform: translateY(-3px); box-shadow: 0 10px 25px rgba(124,58,237,0.12); }
        .subject-btn.active { border-color: var(--purple); background: linear-gradient(135deg, #fdf4ff, #ede9fe); }
        .subject-btn .subject-icon { font-size: 2rem; }
        .subject-btn .subject-name { font-weight: 600; font-size: 0.9rem; color: var(--gray-700); }

        /* ========== QUIZ AREA ========== */
        #quizContainer { min-height: 100px; }
        .question-progress { display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.25rem; font-size: 0.85rem; color: var(--gray-500); font-weight: 500; }
        .progress-bar { flex: 1; height: 6px; background: var(--gray-200); border-radius: 3px; overflow: hidden; }
        .progress-bar .progress-fill { height: 100%; background: linear-gradient(90deg, var(--purple), #8b5cf6); border-radius: 3px; transition: width 0.3s ease; }
        .question-text { font-weight: 600; font-size: 1.1rem; color: var(--gray-900); margin-bottom: 1.25rem; line-height: 1.6; }
        .option-btn { display: block; width: 100%; text-align: left; background: var(--gray-50); border: 2px solid var(--gray-200); border-radius: var(--radius); padding: 0.9rem 1.15rem; margin-bottom: 0.6rem; cursor: pointer; transition: all var(--transition); font-size: 0.95rem; font-family: inherit; color: var(--gray-700); }
        .option-btn:hover:not(:disabled) { border-color: var(--purple); background: #fdf4ff; transform: translateX(4px); }
        .option-btn:disabled { cursor: not-allowed; opacity: 0.9; }
        .option-btn.correct { background: #d4edda; border-color: #28a745; color: #155724; }
        .option-btn.wrong { background: #f8d7da; border-color: #dc3545; color: #721c24; }
        .explication { background: #fffbeb; border-left: 4px solid var(--gold); padding: 1rem 1.15rem; margin-top: 1rem; border-radius: 0 8px 8px 0; font-size: 0.9rem; color: var(--gray-700); }
        .btn-next { display: block; width: 100%; padding: 0.9rem; background: linear-gradient(135deg, var(--purple), #6d28d9); color: var(--white); border: none; border-radius: var(--radius); font-size: 1rem; font-weight: 600; cursor: pointer; margin-top: 1rem; font-family: inherit; transition: all var(--transition); }
        .btn-next:hover { transform: translateY(-2px); box-shadow: 0 6px 18px rgba(124,58,237,0.35); }
        .btn-back { display: block; width: 100%; padding: 0.9rem; background: var(--gray-200); color: var(--gray-700); border: none; border-radius: var(--radius); font-size: 1rem; font-weight: 600; cursor: pointer; margin-top: 0.5rem; text-align: center; text-decoration: none; }

        /* ========== SCORE ========== */
        .score-final { text-align: center; padding: 1rem 0; }
        .score-circle { width: 120px; height: 120px; border-radius: 50%; background: linear-gradient(135deg, #fdf4ff, #ede9fe); display: flex; flex-direction: column; align-items: center; justify-content: center; margin: 0 auto 1.5rem; border: 4px solid var(--purple); }
        .score-circle .score-number { font-size: 2.5rem; font-weight: 800; color: var(--purple); }
        .score-circle .score-total { font-size: 0.9rem; color: var(--gray-500); }
        .score-percent { font-size: 3rem; font-weight: 800; color: var(--gray-900); }
        .score-emoji { font-size: 3rem; margin-bottom: 0.5rem; }
        .score-message { font-size: 1.1rem; color: var(--gray-600); margin-bottom: 1.5rem; }
        .summary-table { width: 100%; border-collapse: collapse; margin: 1rem 0; font-size: 0.9rem; }
        .summary-table th, .summary-table td { padding: 0.6rem 0.8rem; border: 1px solid var(--gray-200); text-align: left; }
        .summary-table th { background: var(--gray-100); font-weight: 600; }
        .summary-table .row-correct { background: #d4edda; }
        .summary-table .row-wrong { background: #f8d7da; }

        .footer { background: var(--white); border-top: 1px solid var(--gray-200); padding: 1.5rem; text-align: center; color: var(--gray-400); font-size: 0.85rem; margin-top: auto; }

        @media (max-width: 768px) {
            .navbar { padding: 0 1.25rem; height: 60px; }
            .nav-brand { font-size: 1.2rem; }
            .nav-brand .brand-icon { width: 34px; height: 34px; font-size: 1rem; }
            .nav-menu { display: none; flex-direction: column; position: absolute; top: 60px; left: 0; width: 100%; background: var(--white); padding: 1rem; border-bottom: 1px solid var(--gray-200); box-shadow: var(--shadow-lg); z-index: 999; }
            .nav-menu.show { display: flex; }
            .nav-toggle { display: flex; }
            .container { padding: 1.25rem 1rem; }
            .card { padding: 1.25rem; }
            .subject-grid { grid-template-columns: repeat(3, 1fr); }
        }
        @media (max-width: 400px) {
            .subject-grid { grid-template-columns: repeat(2, 1fr); }
        }
    </style>
</head>
<body>
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

    <main class="container">
        <!-- Header -->
        <div class="page-header">
            <div class="class-badge">🎓 NS4 — Nouveaux Secondaires 4</div>
            <h1>QCM <span class="highlight">NS4</span></h1>
            <p class="subtitle">Choisis une matière et commence à t'entraîner</p>
        </div>

        <!-- Choix de matière -->
        <div class="card">
            <div class="card-header">
                <div class="card-icon">📚</div>
                <div>
                    <h2>Choisir une matière</h2>
                    <p>7 matières du programme NS4</p>
                </div>
            </div>
            <div class="subject-grid" id="subjectGrid">
                <button class="subject-btn" data-matiere="philosophie">
                    <span class="subject-icon">🧠</span>
                    <span class="subject-name">Philosophie</span>
                </button>
                <button class="subject-btn" data-matiere="maths">
                    <span class="subject-icon">➗</span>
                    <span class="subject-name">Mathématiques</span>
                </button>
                <button class="subject-btn" data-matiere="physique">
                    <span class="subject-icon">⚡</span>
                    <span class="subject-name">Physique</span>
                </button>
                <button class="subject-btn" data-matiere="chimie">
                    <span class="subject-icon">🧪</span>
                    <span class="subject-name">Chimie</span>
                </button>
                <button class="subject-btn" data-matiere="svt">
                    <span class="subject-icon">🌿</span>
                    <span class="subject-name">SVT</span>
                </button>
                <button class="subject-btn" data-matiere="histoire_geo">
                    <span class="subject-icon">🗺️</span>
                    <span class="subject-name">Histoire-Géo</span>
                </button>
                <button class="subject-btn" data-matiere="anglais">
                    <span class="subject-icon">🇬🇧</span>
                    <span class="subject-name">Anglais</span>
                </button>
            </div>
        </div>

        <!-- Zone de quiz -->
        <div class="card" id="quizCard" style="display:none;">
            <div class="card-header">
                <div class="card-icon">📋</div>
                <div>
                    <h2 id="quizTitle">QCM</h2>
                    <p id="quizSubtitle">Questions à choix multiples</p>
                </div>
            </div>
            <div id="quizContainer"></div>
        </div>

        <a href="<?= $basePath ?>/ns4/index.php" class="btn-back" style="max-width:800px;display:block;text-align:center;padding:0.75rem;background:var(--gray-100);color:var(--gray-600);border-radius:var(--radius);text-decoration:none;font-weight:500;margin-top:0.5rem;">
            ⬅️ Retour aux exercices NS4
        </a>
    </main>

    <footer class="footer">
        <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; NS4 — Programmes officiels MENFP</p>
    </footer>

    <script>
        const API_URL = '<?= $basePath ?>/api/questions.php';
        const CLASSE  = 'ns4';
        const QUIZ_TYPE = 'qcm';

        /**
         * Convertit les caractères Unicode exposants/indices
         * en vraies balises HTML <sup> et <sub> pour un affichage correct.
         */
        /**
         * Convertit les caractères mathématiques Unicode en HTML lisible.
         * Utilise un remplacement char par char (pas de regex sur classe Unicode)
         * pour éviter les bugs sur tous les navigateurs/appareils.
         */
function formatMath(text) {
    if (!text) return text;

    const REPLACEMENTS = [
        // === Symboles mathématiques ===
        ['√', '&radic;'],   // racine carrée
        ['∫', '&int;'],     // intégrale
        ['∞', '&infin;'],   // infini
        ['≈', '&asymp;'],   // environ égal
        ['≠', '&ne;'],      // différent
        ['≤', '&le;'],      // inférieur ou égal
        ['≥', '&ge;'],      // supérieur ou égal
        ['×', '&times;'],   // multiplication
        ['·', '&middot;'],  // point médian
        ['°', '&deg;'],     // degré
        ['→', '&rarr;'],    // flèche droite
        ['←', '&larr;'],    // flèche gauche
        ['↔', '&harr;'],    // flèche double
        ['⇒', '&rArr;'],    // flèche double droite
        ['⇔', '&hArr;'],    // flèche double
        // === Lettres grecques ===
        ['Δ', '&Delta;'],   // Delta
        ['π', '&pi;'],      // pi
        ['Π', '&Pi;'],      // Pi majuscule
        ['σ', '&sigma;'],   // sigma
        ['Σ', '&Sigma;'],   // Sigma
        ['ε', '&epsilon;'], // epsilon
        ['α', '&alpha;'],   // alpha
        ['β', '&beta;'],    // beta
        ['γ', '&gamma;'],   // gamma
        ['θ', '&theta;'],   // theta
        ['λ', '&lambda;'],  // lambda
        ['μ', '&mu;'],      // mu
        ['ω', '&omega;'],   // omega
        ['Ω', '&Omega;'],   // Omega
        ['ρ', '&rho;'],     // rho
        ['φ', '&phi;'],     // phi
        ['δ', '&delta;'],   // delta minuscule
        // === Ensembles ===
        ['ℝ', '&#8477;'],   // R ensemble réel
        ['ℕ', '&#8469;'],   // N ensemble naturel
        ['ℤ', '&#8484;'],   // Z ensemble entier
        ['ℚ', '&#8474;'],   // Q ensemble rationnel
        ['ℂ', '&#8450;'],   // C ensemble complexe
        ['∅', '&empty;'],   // ensemble vide
        ['∈', '&isin;'],    // appartient
        ['∉', '&notin;'],   // n'appartient pas
        ['⊂', '&sub;'],     // sous-ensemble
        ['⊆', '&sube;'],    // sous-ensemble ou égal
        ['∪', '&cup;'],     // union
        ['∩', '&cap;'],     // intersection
        ['∀', '&forall;'],  // pour tout
        ['∃', '&exist;'],   // il existe
        // === Exposants → <sup> ===
        ['⁰', '<sup>0</sup>'], ['¹', '<sup>1</sup>'], ['²', '<sup>2</sup>'],
        ['³', '<sup>3</sup>'], ['⁴', '<sup>4</sup>'], ['⁵', '<sup>5</sup>'],
        ['⁶', '<sup>6</sup>'], ['⁷', '<sup>7</sup>'], ['⁸', '<sup>8</sup>'],
        ['⁹', '<sup>9</sup>'], ['ⁿ', '<sup>n</sup>'], ['⁺', '<sup>+</sup>'],
        ['⁻', '<sup>-</sup>'], ['ˣ', '<sup>x</sup>'],
        // === Indices → <sub> ===
        ['₀', '<sub>0</sub>'], ['₁', '<sub>1</sub>'], ['₂', '<sub>2</sub>'],
        ['₃', '<sub>3</sub>'], ['₄', '<sub>4</sub>'], ['₅', '<sub>5</sub>'],
        ['₆', '<sub>6</sub>'], ['₇', '<sub>7</sub>'], ['₈', '<sub>8</sub>'],
        ['₉', '<sub>9</sub>'], ['ₙ', '<sub>n</sub>'], ['ₓ', '<sub>x</sub>'],
        ['₊', '<sub>+</sub>'], ['₋', '<sub>-</sub>'],
        // === Fractions ===
        ['½', '&frac12;'], ['⅓', '&frac13;'], ['¼', '&frac14;'],
        ['¾', '&frac34;'],
        // === Flèches réaction chimique ===
        ['→', '&rarr;'],
    ];

    for (const [from, to] of REPLACEMENTS) {
        text = text.split(from).join(to);
    }

    // Fusionner les balises sup/sub consécutives
    text = text.replace(/<\/sup><sup>/g, '');
    text = text.replace(/<\/sub><sub>/g, '');

    return text;
}

        let currentQuestions = [];
        let currentIndex = 0;
        let score = 0;
        let userAnswers = [];

        const quizCard = document.getElementById('quizCard');
        const quizContainer = document.getElementById('quizContainer');

        // Menu mobile
        document.getElementById('navToggle').addEventListener('click', () => {
            document.getElementById('navMenu').classList.toggle('show');
        });
        document.addEventListener('click', (e) => {
            if (!document.querySelector('.navbar').contains(e.target)) {
                document.getElementById('navMenu').classList.remove('show');
            }
        });

        // Sélection matière
        document.querySelectorAll('.subject-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                document.querySelectorAll('.subject-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                const matiere = this.dataset.matiere;
                const matiereLabel = this.querySelector('.subject-name').textContent;
                document.getElementById('quizTitle').textContent = 'QCM — ' + matiereLabel;
                quizCard.style.display = 'block';
                loadQuiz(matiere);
                quizCard.scrollIntoView({ behavior: 'smooth', block: 'start' });
            });
        });

        async function loadQuiz(matiere) {
            currentIndex = 0; score = 0; userAnswers = [];
            quizContainer.innerHTML = '<p style="text-align:center;padding:2rem;">⏳ Chargement des questions...</p>';

            try {
                const url = `${API_URL}?classe=${CLASSE}&matiere=${matiere}&type=qcm&random=true&limit=20`;
                const response = await fetch(url);
                const data = await response.json();
                if (data.error) throw new Error(data.error);
                currentQuestions = data.questions || [];
                if (currentQuestions.length === 0) {
                    quizContainer.innerHTML = `
                        <div style="text-align:center;padding:2rem;">
                            <div style="font-size:3rem;">😕</div>
                            <p style="color:var(--gray-600);margin-top:1rem;">Aucune question QCM disponible pour cette matière.</p>
                            <p style="color:var(--gray-400);">Essaie une autre matière.</p>
                        </div>`;
                    return;
                }
                renderQuestion();
                quizContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
            } catch (error) {
                quizContainer.innerHTML = `
                    <div style="text-align:center;padding:2rem;">
                        <div style="font-size:3rem;">⚠️</div>
                        <p style="color:#dc3545;margin-top:1rem;">Erreur lors du chargement</p>
                        <p style="color:var(--gray-500);">${error.message}</p>
                    </div>`;
            }
        }

        function renderQuestion() {
            if (currentIndex >= currentQuestions.length) { showScore(); return; }
            const q = currentQuestions[currentIndex];
            const progress = (currentIndex / currentQuestions.length) * 100;

            let html = `
                <div class="question-progress">
                    <span>Question ${currentIndex + 1}/${currentQuestions.length}</span>
                    <div class="progress-bar"><div class="progress-fill" style="width:${progress}%"></div></div>
                </div>
                <p class="question-text">${formatMath(q.enonce)}</p>
            `;

            if (q.options && q.options.length >= 2) {
                q.options.forEach((option, index) => {
                    const letter = String.fromCharCode(65 + index);
                    html += `<button class="option-btn" data-correct="${option.correct}" data-index="${index}"><strong>${letter}.</strong> ${formatMath(option.texte)}</button>`;
                });
            } else {
                html += '<p style="color:#dc3545;text-align:center;">⚠️ Question sans options.</p>';
            }

            quizContainer.innerHTML = html;

            document.querySelectorAll('.option-btn[data-correct]').forEach(btn => {
                btn.addEventListener('click', function() {
                    if (this.disabled) return;
                    document.querySelectorAll('.option-btn').forEach(b => {
                        b.disabled = true;
                        if (b.dataset.correct === 'true') b.classList.add('correct');
                    });
                    if (this.dataset.correct !== 'true') this.classList.add('wrong');
                    const isCorrect = this.dataset.correct === 'true';
                    userAnswers.push({ question: q.enonce, correct: isCorrect });
                    handleAnswer(q, isCorrect);
                });
            });
        }

        function handleAnswer(q, isCorrect) {
            if (isCorrect) score++;
            if (q.explication && q.explication.trim()) {
                const explDiv = document.createElement('div');
                explDiv.className = 'explication';
                explDiv.innerHTML = `<strong>💡 Explication :</strong> ${formatMath(q.explication)}`;
                quizContainer.appendChild(explDiv);
            }
            const nextBtn = document.createElement('button');
            nextBtn.className = 'btn-next';
            nextBtn.textContent = currentIndex < currentQuestions.length - 1 ? '⏭️ Question suivante' : '🎯 Voir mon résultat';
            nextBtn.addEventListener('click', () => { currentIndex++; renderQuestion(); quizContainer.scrollIntoView({ behavior: 'smooth', block: 'start' }); });
            quizContainer.appendChild(nextBtn);
            setTimeout(() => nextBtn.scrollIntoView({ behavior: 'smooth', block: 'center' }), 150);
        }

        function showScore() {
            const total = currentQuestions.length;
            const pct = Math.round((score / total) * 100);
            let emoji = pct >= 90 ? '🏆' : pct >= 70 ? '👏' : pct >= 50 ? '💪' : '📚';
            let msg = pct >= 90 ? 'Excellent ! Tu maîtrises parfaitement cette matière !' :
                      pct >= 70 ? 'Très bien ! Continue comme ça, tu progresses !' :
                      pct >= 50 ? "Pas mal ! Mais tu peux encore t'améliorer." :
                                  'Continue à réviser, tu vas y arriver !';
            let msgColor = pct >= 70 ? '#28a745' : pct >= 50 ? '#f59e0b' : '#dc3545';

            let html = `
                <div class="score-final">
                    <div class="score-emoji">${emoji}</div>
                    <div class="score-circle">
                        <span class="score-number">${score}</span>
                        <span class="score-total">/ ${total}</span>
                    </div>
                    <div class="score-percent">${pct}%</div>
                    <p class="score-message" style="color:${msgColor};">${msg}</p>
                    <button class="btn-next" onclick="location.reload()" style="max-width:300px;margin:0 auto;">🔄 Recommencer</button>
                    <a href="<?= $basePath ?>/ns4/index.php" class="btn-back" style="max-width:300px;margin:0.5rem auto;">⬅️ Retour aux exercices</a>
                </div>
            `;

            if (userAnswers.length > 0) {
                html += `<div style="margin-top:2rem;"><h3 style="text-align:center;margin-bottom:1rem;color:var(--gray-700);">📋 Résumé de tes réponses</h3><div style="overflow-x:auto;"><table class="summary-table"><thead><tr><th style="width:40px;">#</th><th>Question</th><th style="width:60px;">Résultat</th></tr></thead><tbody>`;
                userAnswers.forEach((a, i) => {
                    const q = a.question.length > 70 ? a.question.substring(0, 70) + '...' : a.question;
                    html += `<tr class="${a.correct ? 'row-correct' : 'row-wrong'}"><td style="text-align:center;font-weight:600;">${i+1}</td><td>${q}</td><td style="text-align:center;">${a.correct ? '✅' : '❌'}</td></tr>`;
                });
                html += `</tbody></table></div></div>`;
            }

            quizContainer.innerHTML = html;
            quizContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
    </script>
</body>
</html>