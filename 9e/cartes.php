<?php
$pageTitle = 'Cartes & Dessin - 9ème AF';
$classeActive = '9e';
require_once __DIR__ . '/../includes/functions.php';

$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');
$name = getStudentName();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <title><?= $pageTitle ?> - Quiz Ayiti</title>
    <link rel="shortcut icon" href="<?= $basePath ?>/images/logo.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --blue: #002395; --red: #d21034; --gold: #f1c40f; --green: #10b981; --purple: #7c3aed;
            --gray-50: #f8fafc; --gray-100: #f1f5f9; --gray-200: #e2e8f0;
            --gray-300: #cbd5e1; --gray-400: #94a3b8; --gray-500: #64748b;
            --gray-600: #475569; --gray-700: #334155; --gray-800: #1e293b;
            --gray-900: #0f172a; --white: #ffffff;
            --shadow-sm: 0 1px 2px rgba(0,0,0,.05);
            --shadow-md: 0 4px 6px rgba(0,0,0,.07);
            --shadow-lg: 0 10px 25px rgba(0,0,0,.08);
            --radius: 12px; --radius-lg: 16px; --radius-xl: 24px;
            --transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html { font-size: 16px; scroll-behavior: smooth; -webkit-font-smoothing: antialiased; }
        body { font-family: 'Inter', sans-serif; line-height: 1.7; color: var(--gray-800); background: var(--gray-50); display: flex; flex-direction: column; min-height: 100vh; }

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
        .nav-menu { display: flex; list-style: none; gap: 0.35rem; align-items: center; }
        .nav-menu a { color: var(--gray-600); text-decoration: none; font-weight: 500; font-size: .9rem; padding: 0.5rem 0.9rem; border-radius: var(--radius); transition: all var(--transition); white-space: nowrap; }
        .nav-menu a:hover { color: var(--blue); background: #eff6ff; }
        .nav-menu a.active { color: var(--white); background: var(--blue); font-weight: 600; }
        .nav-menu a.btn-apk { background: linear-gradient(135deg, var(--green), #059669); color: var(--white); font-weight: 600; box-shadow: 0 3px 10px rgba(16,185,129,.3); padding: 0.5rem 0.9rem; }
        .nav-menu a.btn-apk:hover { transform: translateY(-1px); box-shadow: 0 5px 14px rgba(16,185,129,.4); }
        .nav-toggle { display: none; flex-direction: column; background: none; border: none; cursor: pointer; gap: 5px; }
        .nav-toggle .bar { width: 26px; height: 2.5px; background: var(--gray-700); border-radius: 2px; }

        .container { flex: 1; width: 100%; max-width: 750px; margin: 0 auto; padding: 2rem 1.5rem; }
        .page-header { text-align: center; margin-bottom: 2rem; }
        .page-header .class-badge { display: inline-flex; align-items: center; gap: 0.5rem; background: linear-gradient(135deg, #f5f3ff, #ede9fe); color: var(--purple); font-weight: 600; font-size: 0.85rem; padding: 0.5rem 1.2rem; border-radius: 50px; margin-bottom: 1rem; border: 1px solid #ddd6fe; }
        .page-header h1 { font-size: clamp(1.6rem, 4vw, 2.2rem); font-weight: 800; color: var(--gray-900); }
        .page-header h1 .highlight { background: linear-gradient(135deg, #7c3aed, #a78bfa); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .card { background: var(--white); border-radius: var(--radius-xl); padding: 2rem; box-shadow: var(--shadow-lg); margin-bottom: 1.5rem; border: 1px solid var(--gray-100); }
        .card-header { display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.5rem; padding-bottom: 1rem; border-bottom: 2px solid var(--gray-100); }
        .card-header .card-icon { width: 48px; height: 48px; background: linear-gradient(135deg, #f5f3ff, #ede9fe); border-radius: var(--radius); display: flex; align-items: center; justify-content: center; font-size: 1.4rem; flex-shrink: 0; }
        .card-header h2 { font-size: 1.3rem; font-weight: 700; color: var(--gray-900); }
        .card-header p { color: var(--gray-400); font-size: 0.85rem; }

        /* ===== QUIZ ===== */
        .question-progress { display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.25rem; font-size: 0.85rem; color: var(--gray-500); font-weight: 500; }
        .progress-bar { flex: 1; height: 8px; background: var(--gray-200); border-radius: 4px; overflow: hidden; }
        .progress-bar .progress-fill { height: 100%; background: linear-gradient(90deg, #7c3aed, #a78bfa); border-radius: 4px; transition: width 0.4s ease; }
        .question-text { font-weight: 600; font-size: 1.15rem; color: var(--gray-900); margin-bottom: 1.5rem; text-align: center; line-height: 1.6; }
        .map-image-wrapper { width: 100%; max-width: 450px; margin: 0 auto 1.5rem; border-radius: var(--radius-lg); border: 3px solid var(--gray-200); box-shadow: var(--shadow-md); overflow: hidden; background: #f0f4ff; display: flex; align-items: center; justify-content: center; }
        .map-image { width: 100%; height: 300px; object-fit: contain; display: block; background: #f0f4ff; }
        .option-btn { display: block; width: 100%; text-align: left; background: var(--gray-50); border: 2px solid var(--gray-200); border-radius: var(--radius); padding: 0.9rem 1.15rem; margin-bottom: 0.6rem; cursor: pointer; transition: all var(--transition); font-size: 0.95rem; font-family: inherit; color: var(--gray-700); }
        .option-btn:hover:not(:disabled) { border-color: #7c3aed; background: #f5f3ff; transform: translateX(4px); }
        .option-btn:disabled { cursor: not-allowed; opacity: 0.9; }
        .option-btn.correct { background: #d4edda; border-color: #28a745; color: #155724; }
        .option-btn.wrong { background: #f8d7da; border-color: #dc3545; color: #721c24; }
        .explication { background: #fffbeb; border-left: 4px solid var(--gold); padding: 1rem 1.15rem; margin-top: 1rem; border-radius: 0 8px 8px 0; font-size: 0.9rem; color: var(--gray-700); animation: fadeIn 0.3s ease; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-5px); } to { opacity: 1; transform: translateY(0); } }
        .btn-next { display: block; width: 100%; padding: 0.9rem; background: linear-gradient(135deg, #7c3aed, #6d28d9); color: var(--white); border: none; border-radius: var(--radius); font-size: 1rem; font-weight: 600; cursor: pointer; margin-top: 1rem; transition: all var(--transition); }
        .btn-next:hover { transform: translateY(-2px); box-shadow: 0 6px 18px rgba(124,58,237,0.35); }
        .score-final { text-align: center; padding: 1rem 0; }
        .score-circle { width: 130px; height: 130px; border-radius: 50%; background: linear-gradient(135deg, #f5f3ff, #ede9fe); display: flex; flex-direction: column; align-items: center; justify-content: center; margin: 0 auto 1.5rem; border: 5px solid #7c3aed; }
        .score-circle .score-number { font-size: 2.8rem; font-weight: 800; color: #7c3aed; line-height: 1; }
        .score-circle .score-total { font-size: 0.9rem; color: var(--gray-500); }
        .score-percent { font-size: 3.5rem; font-weight: 800; color: var(--gray-900); line-height: 1.2; }
        .score-emoji { font-size: 3.5rem; margin-bottom: 0.5rem; }
        .summary-table { width: 100%; border-collapse: collapse; margin: 1rem 0; font-size: 0.9rem; }
        .summary-table th, .summary-table td { padding: 0.6rem 0.8rem; border: 1px solid var(--gray-200); text-align: left; }
        .summary-table th { background: var(--gray-100); font-weight: 600; }
        .summary-table .row-correct { background: #d4edda; }
        .summary-table .row-wrong { background: #f8d7da; }
        .btn-back { display: inline-flex; align-items: center; gap: 0.5rem; padding: 0.8rem 1.5rem; background: var(--gray-200); color: var(--gray-700); border: none; border-radius: var(--radius); font-size: 0.95rem; font-weight: 600; cursor: pointer; text-decoration: none; transition: all var(--transition); margin-top: 0.5rem; }
        .btn-back:hover { background: var(--gray-300); }
        .footer { background: var(--white); border-top: 1px solid var(--gray-200); padding: 1.5rem; text-align: center; color: var(--gray-400); font-size: 0.85rem; margin-top: auto; }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 640px) {
            .navbar { padding: 0 1rem; }
            .nav-menu { display: none; position: absolute; top: 70px; left: 0; right: 0; background: rgba(255,255,255,.98); flex-direction: column; padding: 1rem; gap: 0.5rem; border-bottom: 1px solid var(--gray-200); box-shadow: var(--shadow-md); }
            .nav-menu.show { display: flex; }
            .nav-toggle { display: flex; }
            .nav-menu a { padding: 0.75rem 1rem; font-size: 0.95rem; width: 100%; }
            .container { padding: 1.25rem 1rem; }
            .map-image { height: 220px; }
        }
        @media (min-width: 641px) and (max-width: 900px) {
            .nav-menu a { padding: 0.5rem 0.7rem; font-size: 0.85rem; }
            .nav-menu { gap: 0.25rem; }
        }
        @media (max-width: 400px) {
            .map-image { height: 180px; }
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

<main class="container">
    <div class="page-header">
        <div class="class-badge">🗺️ Cartes — 9ème AF</div>
        <h1>Identifie les <span class="highlight">cartes</span></h1>
        <?php if ($name): ?>
            <p style="color:var(--gray-500);margin-top:0.5rem;">👋 <strong><?= e($name) ?></strong> — 10 questions aléatoires</p>
        <?php endif; ?>

        <!-- Sélecteur de catégorie -->
        <div style="display:flex;gap:0.75rem;justify-content:center;margin-top:1.25rem;flex-wrap:wrap;">
            <button onclick="setCategory('pays')" id="btn-pays" class="cat-btn cat-active">🌍 Pays du monde</button>
            <button onclick="setCategory('haiti')" id="btn-haiti" class="cat-btn">🇭🇹 Départements d'Haïti</button>
            <button onclick="setCategory('all')" id="btn-all" class="cat-btn">🔀 Mélanger tout</button>
        </div>
    </div>

    <style>
        .cat-btn { padding: 0.6rem 1.2rem; border: 2px solid var(--gray-300); background: var(--white); border-radius: 50px; font-size: 0.9rem; font-weight: 600; cursor: pointer; transition: all 0.2s; color: var(--gray-600); font-family: inherit; }
        .cat-btn:hover { border-color: #7c3aed; color: #7c3aed; background: #f5f3ff; }
        .cat-active { border-color: #7c3aed !important; background: #7c3aed !important; color: white !important; }
    </style>

    <!-- ===== ZONE QUIZ ===== -->
    <div id="quizContainer" class="card">
        <p style="text-align:center;">⏳ Chargement du quiz...</p>
    </div>
</main>

<footer class="footer"><p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; 9ème AF</p></footer>

<script>
// ═══════════════════════════════════════
// BASE DE DONNÉES — PAYS DU MONDE
// ═══════════════════════════════════════
const countriesData = [
    // Afrique
    { name: 'Afrique du Sud', category: 'pays', imageFile: 'afrique_du_sud.png', neighbors: ['Namibie', 'Botswana', 'Zimbabwe', 'Mozambique', 'Lesotho'] },
    { name: 'Algérie', category: 'pays', imageFile: 'algerie.png', neighbors: ['Maroc', 'Tunisie', 'Libye', 'Mauritanie', 'Mali', 'Niger'] },
    { name: 'Nigeria', category: 'pays', imageFile: 'nigeria.png', neighbors: ['Cameroun', 'Tchad', 'Bénin', 'Niger', 'Ghana'] },
    { name: 'Égypte', category: 'pays', imageFile: 'egypte.png', neighbors: ['Libye', 'Soudan', 'Israël', 'Arabie Saoudite', 'Jordanie'] },
    // Europe
    { name: 'France', category: 'pays', imageFile: 'france.png', neighbors: ['Espagne', 'Italie', 'Allemagne', 'Belgique', 'Suisse', 'Royaume-Uni'] },
    { name: 'Allemagne', category: 'pays', imageFile: 'allemagne.png', neighbors: ['France', 'Pologne', 'Autriche', 'Pays-Bas', 'Danemark', 'Suisse'] },
    { name: 'Italie', category: 'pays', imageFile: 'italie.png', neighbors: ['France', 'Espagne', 'Grèce', 'Suisse', 'Autriche', 'Slovénie'] },
    { name: 'Espagne', category: 'pays', imageFile: 'espagne.png', neighbors: ['France', 'Portugal', 'Italie', 'Maroc', 'Andorre'] },
    { name: 'Ukraine', category: 'pays', imageFile: 'ukraine.png', neighbors: ['Pologne', 'Turquie', 'Roumanie', 'Biélorussie', 'Russie', 'Moldavie'] },
    { name: 'Turquie', category: 'pays', imageFile: 'turquie.png', neighbors: ['Ukraine', 'Irak', 'Iran', 'Grèce', 'Bulgarie', 'Syrie'] },
    { name: 'Russie', category: 'pays', imageFile: 'russie.png', neighbors: ['Ukraine', 'Chine', 'Mongolie', 'Kazakhstan', 'Finlande', 'Pologne'] },
    // Amériques
    { name: 'Canada', category: 'pays', imageFile: 'canada.png', neighbors: ['USA', 'Mexique', 'Groenland', 'Russie'] },
    { name: 'USA', category: 'pays', imageFile: 'usa.png', neighbors: ['Canada', 'Mexique', 'Cuba', 'Bahamas', 'Jamaïque'] },
    { name: 'Mexique', category: 'pays', imageFile: 'mexique.png', neighbors: ['USA', 'Cuba', 'Guatemala', 'Belize', 'Honduras'] },
    { name: 'Brésil', category: 'pays', imageFile: 'bresil.png', neighbors: ['Argentine', 'Colombie', 'Pérou', 'Venezuela', 'Uruguay', 'Paraguay'] },
    { name: 'Argentine', category: 'pays', imageFile: 'argentine.png', neighbors: ['Chili', 'Brésil', 'Uruguay', 'Paraguay', 'Bolivie'] },
    { name: 'Chili', category: 'pays', imageFile: 'chili.png', neighbors: ['Argentine', 'Pérou', 'Bolivie', 'Équateur'] },
    { name: 'Colombie', category: 'pays', imageFile: 'colombie.png', neighbors: ['Venezuela', 'Brésil', 'Pérou', 'Panama', 'Équateur'] },
    { name: 'Pérou', category: 'pays', imageFile: 'perou.png', neighbors: ['Chili', 'Brésil', 'Colombie', 'Équateur', 'Bolivie'] },
    { name: 'Venezuela', category: 'pays', imageFile: 'venezuela.png', neighbors: ['Colombie', 'Brésil', 'Guyana', 'Trinidad'] },
    // Moyen-Orient
    { name: 'Arabie Saoudite', category: 'pays', imageFile: 'arabie_saoudite.png', neighbors: ['Irak', 'Iran', 'Israël', 'Égypte', 'Yémen', 'Émirats'] },
    { name: 'Irak', category: 'pays', imageFile: 'irak.png', neighbors: ['Iran', 'Turquie', 'Arabie Saoudite', 'Syrie', 'Jordanie', 'Koweït'] },
    { name: 'Iran', category: 'pays', imageFile: 'iran.png', neighbors: ['Irak', 'Turquie', 'Afghanistan', 'Pakistan', 'Turkménistan', 'Azerbaïdjan'] },
    { name: 'Israël', category: 'pays', imageFile: 'israel.png', neighbors: ['Égypte', 'Arabie Saoudite', 'Liban', 'Syrie', 'Jordanie', 'Irak'] },
    // Asie
    { name: 'Chine', category: 'pays', imageFile: 'chine.png', neighbors: ['Inde', 'Russie', 'Japon', 'Corée du Nord', 'Vietnam', 'Mongolie'] },
    { name: 'Inde', category: 'pays', imageFile: 'inde.png', neighbors: ['Chine', 'Pakistan', 'Bangladesh', 'Népal', 'Birmanie', 'Sri Lanka'] },
    { name: 'Japon', category: 'pays', imageFile: 'japon.png', neighbors: ['Chine', 'Corée du Sud', 'Corée du Nord', 'Russie', 'Taïwan'] },
    { name: 'Corée du Sud', category: 'pays', imageFile: 'coree_du_sud.png', neighbors: ['Corée du Nord', 'Japon', 'Chine', 'Russie'] },
    { name: 'Corée du Nord', category: 'pays', imageFile: 'coree_du_nord.png', neighbors: ['Corée du Sud', 'Chine', 'Russie', 'Japon'] },
    // Océanie
    { name: 'Australie', category: 'pays', imageFile: 'australie.png', neighbors: ['Nouvelle-Zélande', 'Indonésie', 'Papouasie', 'Timor'] },
    // Caraïbes
    { name: 'Cuba', category: 'pays', imageFile: 'cuba.png', neighbors: ['USA', 'Mexique', 'Haïti', 'Jamaïque', 'Bahamas'] },
    { name: 'Haïti', category: 'pays', imageFile: 'haiti.png', neighbors: ['République Dominicaine', 'Cuba', 'Jamaïque', 'USA'] },
    { name: 'République Dominicaine', category: 'pays', imageFile: 'republique_dominicaine.png', neighbors: ['Haïti', 'Cuba', 'Porto Rico', 'USA'] }
];

// ═══════════════════════════════════════
// BASE DE DONNÉES — DÉPARTEMENTS D'HAÏTI
// ═══════════════════════════════════════
const haitiDepts = [
    { name: 'Artibonite', category: 'haiti', imageFile: 'artibonite.png', neighbors: ['Nord', 'Centre', 'Ouest', 'Nord-Ouest'] },
    { name: 'Centre', category: 'haiti', imageFile: 'centre.png', neighbors: ['Artibonite', 'Ouest', 'Nord-Est', 'Nord'] },
    { name: 'Grand Anse', category: 'haiti', imageFile: 'grand_anse.png', neighbors: ['Sud', 'Nippes', 'Nord-Ouest'] },
    { name: 'Nippes', category: 'haiti', imageFile: 'nippes.png', neighbors: ['Grand-Anse', 'Sud', 'Ouest', 'Artibonite'] },
    { name: 'Nord', category: 'haiti', imageFile: 'nord.png', neighbors: ['Nord-Est', 'Nord-Ouest', 'Artibonite', 'Centre'] },
    { name: 'Nord-Est', category: 'haiti', imageFile: 'nord-est.png', neighbors: ['Nord', 'Centre'] },
    { name: 'Nord-Ouest', category: 'haiti', imageFile: 'nord-ouest.png', neighbors: ['Nord', 'Artibonite'] },
    { name: 'Ouest', category: 'haiti', imageFile: 'ouest.png', neighbors: ['Artibonite', 'Centre', 'Sud-Est', 'Nippes'] },
    { name: 'Sud', category: 'haiti', imageFile: 'sud.png', neighbors: ['Grand-Anse', 'Nippes', 'Sud-Est'] },
    { name: 'Sud-Est', category: 'haiti', imageFile: 'sud-est.png', neighbors: ['Sud', 'Nippes', 'Ouest'] }
];

        let currentQuestions = [], currentIndex = 0, score = 0;
        let userAnswers = [];
        let activeCategory = 'pays';

        function setCategory(cat) {
            activeCategory = cat;
            document.querySelectorAll('.cat-btn').forEach(b => b.classList.remove('cat-active'));
            document.getElementById('btn-' + cat).classList.add('cat-active');
            initQuiz();
        }

        function buildPool() {
            if (activeCategory === 'pays') return [...countriesData];
            if (activeCategory === 'haiti') return [...haitiDepts];
            return [...countriesData, ...haitiDepts];
        }

        function getQuestionText(item) {
            return item.category === 'haiti'
                ? 'Quel département d\'Haïti est représenté sur cette carte ?'
                : 'Quel pays est représenté sur cette carte ?';
        }

        function getImagePath(item) {
            const base = '<?= $basePath ?>/9e/cartes/';
            return base + item.imageFile;
        }

        function initQuiz() {
            const pool = buildPool();
            const shuffled = [...pool].sort(() => Math.random() - 0.5);
            const selected = shuffled.slice(0, Math.min(10, shuffled.length));

            currentQuestions = selected.map(item => {
                const allNames = pool.map(x => x.name);
                let options = [item.name];
                item.neighbors.forEach(n => {
                    if (!options.includes(n) && options.length < 4 && allNames.includes(n)) options.push(n);
                });
                if (options.length < 4) {
                    const others = pool
                        .filter(c => !options.includes(c.name) && c.name !== item.name)
                        .sort(() => Math.random() - 0.5)
                        .slice(0, 4 - options.length);
                    others.forEach(c => options.push(c.name));
                }
                options = options.slice(0, 4).sort(() => Math.random() - 0.5);
                return {
                    image: getImagePath(item),
                    correctName: item.name,
                    questionText: getQuestionText(item),
                    options: options,
                    correctIndex: options.indexOf(item.name)
                };
            });

            currentIndex = 0;
            score = 0;
            userAnswers = [];
            renderQuestion();
        }

        function renderQuestion() {
            const c = document.getElementById('quizContainer');
            if (currentIndex >= currentQuestions.length) { showScore(); return; }
            const q = currentQuestions[currentIndex];
            const pct = (currentIndex / currentQuestions.length) * 100;
            let h = '';
            h += `<div class="question-progress"><span>Question ${currentIndex+1}/${currentQuestions.length}</span><div class="progress-bar"><div class="progress-fill" style="width:${pct}%"></div></div></div>`;
            h += `<p class="question-text">${q.questionText}</p>`;
            h += `<div class="map-image-wrapper"><img src="${q.image}" alt="Carte" class="map-image" onerror="this.src='data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 width=%22450%22 height=%22300%22><rect fill=%22%23f0f4ff%22 width=%22450%22 height=%22300%22/><text fill=%22%237c3aed%22 x=%22225%22 y=%22150%22 text-anchor=%22middle%22 font-size=%2218%22>Image non disponible</text></svg>'"></div>`;
            q.options.forEach((opt, i) => {
                h += `<button class="option-btn" data-index="${i}"><strong>${String.fromCharCode(65+i)}.</strong> ${opt}</button>`;
            });
            c.innerHTML = h;
            c.scrollIntoView({ behavior: 'smooth' });
            document.querySelectorAll('.option-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    if (this.disabled) return;
                    handleAnswer(this, q);
                });
            });
        }

        function handleAnswer(btn, q) {
            document.querySelectorAll('.option-btn').forEach(b => b.disabled = true);
            const selectedIndex = parseInt(btn.dataset.index);
            const isCorrect = selectedIndex === q.correctIndex;
            document.querySelectorAll('.option-btn').forEach((b, i) => {
                if (i === q.correctIndex) b.classList.add('correct');
            });
            if (!isCorrect) btn.classList.add('wrong');
            if (isCorrect) score++;
            userAnswers.push({ question: q.correctName, correct: isCorrect });
            const fb = document.createElement('div');
            fb.className = 'explication';
            fb.innerHTML = isCorrect
                ? `✅ Bonne réponse ! C'est bien <strong>${q.correctName}</strong>.`
                : `❌ La bonne réponse était <strong>${q.correctName}</strong>.`;
            document.getElementById('quizContainer').appendChild(fb);
            const nextBtn = document.createElement('button');
            nextBtn.className = 'btn-next';
            nextBtn.textContent = currentIndex < currentQuestions.length - 1 ? '⏭️ Question suivante' : '🎯 Voir le résultat';
            nextBtn.addEventListener('click', () => { currentIndex++; renderQuestion(); });
            document.getElementById('quizContainer').appendChild(nextBtn);
        }

        function showScore() {
            const pct = Math.round((score / currentQuestions.length) * 100);
            let emoji = pct >= 90 ? '🏆' : pct >= 70 ? '👏' : pct >= 50 ? '💪' : '📚';
            let h = `<div class="score-final">
                <div class="score-emoji">${emoji}</div>
                <div class="score-circle"><span class="score-number">${score}</span><span class="score-total">/${currentQuestions.length}</span></div>
                <div class="score-percent">${pct}%</div>
                <p style="color:var(--gray-600);">${pct>=90?'Excellent !':pct>=70?'Très bien !':pct>=50?'Continue !':'Révise encore !'}</p>
                <button class="btn-next" onclick="initQuiz()">🔄 Nouveau quiz</button>
                <a href="<?= $basePath ?>/9e/index.php" class="btn-back" style="display:inline-flex;width:100%;justify-content:center;text-align:center;">⬅️ Retour aux exercices</a>
            </div>`;
            if (userAnswers.length > 0) {
                h += `<table class="summary-table"><thead><tr><th>#</th><th>Réponse</th><th>Résultat</th></tr></thead><tbody>`;
                userAnswers.forEach((a, i) => h += `<tr class="${a.correct?'row-correct':'row-wrong'}"><td>${i+1}</td><td>${a.question}</td><td>${a.correct?'✅':'❌'}</td></tr>`);
                h += `</tbody></table>`;
            }
            document.getElementById('quizContainer').innerHTML = h;
            document.getElementById('quizContainer').scrollIntoView({ behavior: 'smooth' });
        }

        // Menu mobile
        document.getElementById('navToggle').addEventListener('click', () => document.getElementById('navMenu').classList.toggle('show'));
        document.addEventListener('click', (e) => { if (!document.querySelector('.navbar').contains(e.target)) document.getElementById('navMenu').classList.remove('show'); });

        // Lancement automatique
        initQuiz();
</script>

</body>
</html>