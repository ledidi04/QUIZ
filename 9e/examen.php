<?php
$pageTitle = 'Examens Officiels - 9ème AF';
$classeActive = '9e';
require_once __DIR__ . '/../includes/functions.php';

$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');
$name = getStudentName();

// Structure des examens par année
$examens = [
    '2022' => [
        'Anglais.pdf',
        'Créole.pdf',
        'Espagnol.pdf',
        'Français.pdf',
        'Mathématiques.pdf',
        'Sciences Experimentales.pdf',
        'Sciences Sociales.pdf'
    ],
    '2023' => [
        'Anglais.pdf',
        'Créole.pdf',
        'Espagnol.pdf',
        'Mathématiques.pdf',
        'Sciences Naturelles.pdf',
        'Sciences physique.pdf',
        'Sciences sociales.pdf'
    ],
    '2024' => [
        'Anglais.pdf',
        'Créole.pdf',
        'Éducation à la citoyenneté.pdf',
        'Education Esthétique et Artistique.pdf',
        'Éducation physique et sportive.pdf',
        'ETAP.pdf',
        'Mathématiques.pdf',
        'Sces naturelles.pdf',
        'Sces physiques.pdf',
        'Sciences Sociales.pdf'
    ]
];

// Icônes par matière
$iconesMatieres = [
    'Anglais' => '🇬🇧',
    'Créole' => '🇭🇹',
    'Espagnol' => '🇪🇸',
    'Français' => '📝',
    'Mathématiques' => '🔢',
    'Sciences Experimentales' => '🔬',
    'Sciences Sociales' => '🌍',
    'Sciences Naturelles' => '🌿',
    'Sciences physique' => '⚡',
    'Sciences sociales' => '🌍',
    'Sces naturelles' => '🌿',
    'Sces physiques' => '⚡',
    'Éducation à la citoyenneté' => '🏛️',
    'Education Esthétique et Artistique' => '🎨',
    'Éducation physique et sportive' => '🏃',
    'ETAP' => '💻',
];

function getIcon($filename) {
    global $iconesMatieres;
    foreach ($iconesMatieres as $nom => $icon) {
        if (stripos($filename, $nom) !== false) return $icon;
    }
    return '📄';
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <title><?= $pageTitle ?> - Quiz Ayiti</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --blue: #002395; --red: #d21034; --gold: #f1c40f;
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
        body { font-family: 'Inter', sans-serif; line-height: 1.7; color: var(--gray-800); background: var(--gray-50); display: flex; flex-direction: column; min-height: 100vh; }
        .navbar { display: flex; justify-content: space-between; align-items: center; background: rgba(255,255,255,0.95); padding: 0 2rem; height: 70px; position: sticky; top: 0; z-index: 1000; border-bottom: 1px solid var(--gray-200); backdrop-filter: blur(10px); }
        .nav-brand { display: flex; align-items: center; gap: 0.75rem; font-size: 1.4rem; font-weight: 800; color: var(--gray-900); text-decoration: none; }
        .nav-brand .brand-icon { width: 40px; height: 40px; background: linear-gradient(135deg, var(--blue), #1e40af); border-radius: var(--radius); display: flex; align-items: center; justify-content: center; color: var(--gold); font-size: 1.2rem; font-weight: 800; box-shadow: 0 4px 12px rgba(0,35,149,0.25); }
        .nav-brand .brand-dot { color: var(--red); }
        .nav-menu { display: flex; list-style: none; gap: 0.5rem; align-items: center; }
        .nav-menu a { color: var(--gray-600); text-decoration: none; font-weight: 500; font-size: 0.95rem; padding: 0.6rem 1.1rem; border-radius: var(--radius); transition: all var(--transition); }
        .nav-menu a:hover { color: var(--blue); background: #eff6ff; }
        .nav-menu a.active { color: var(--white); background: var(--blue); font-weight: 600; }
        .nav-toggle { display: none; flex-direction: column; background: none; border: none; cursor: pointer; gap: 5px; }
        .nav-toggle .bar { width: 26px; height: 2.5px; background: var(--gray-700); border-radius: 2px; }
        .container { flex: 1; width: 100%; max-width: 900px; margin: 0 auto; padding: 2rem 1.5rem; }
        .page-header { text-align: center; margin-bottom: 2rem; }
        .page-header .class-badge { display: inline-flex; align-items: center; gap: 0.5rem; background: linear-gradient(135deg, #fff5f5, #ffe8e8); color: var(--red); font-weight: 600; font-size: 0.85rem; padding: 0.5rem 1.2rem; border-radius: 50px; margin-bottom: 1rem; border: 1px solid #fecaca; }
        .page-header h1 { font-size: clamp(1.6rem, 4vw, 2.4rem); font-weight: 800; color: var(--gray-900); }
        .page-header h1 .highlight { background: linear-gradient(135deg, var(--blue), #3b82f6); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
        .welcome-message { display: inline-flex; align-items: center; gap: 0.5rem; background: #f0fdf4; color: #166534; font-weight: 600; font-size: 1rem; padding: 0.6rem 1.2rem; border-radius: 50px; border: 1px solid #bbf7d0; margin-top: 0.5rem; }
        .card { background: var(--white); border-radius: var(--radius-xl); padding: 2rem; box-shadow: var(--shadow-lg); margin-bottom: 1.5rem; border: 1px solid var(--gray-100); }
        .card-header { display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.5rem; padding-bottom: 1rem; border-bottom: 2px solid var(--gray-100); }
        .card-header .card-icon { width: 48px; height: 48px; background: linear-gradient(135deg, #fff5f5, #ffe8e8); border-radius: var(--radius); display: flex; align-items: center; justify-content: center; font-size: 1.4rem; }
        .card-header h2 { font-size: 1.3rem; font-weight: 700; color: var(--gray-900); margin: 0; }
        .card-header p { color: var(--gray-400); font-size: 0.85rem; margin: 0; }
        
        /* Accordéon années */
        .year-section { margin-bottom: 1rem; }
        .year-header { display: flex; align-items: center; gap: 0.75rem; padding: 1rem 1.25rem; background: var(--gray-50); border: 2px solid var(--gray-200); border-radius: var(--radius-lg); cursor: pointer; transition: all var(--transition); user-select: none; }
        .year-header:hover { border-color: var(--blue); background: #eff6ff; }
        .year-header .year-badge { display: flex; align-items: center; justify-content: center; width: 44px; height: 44px; background: linear-gradient(135deg, var(--blue), #1e40af); color: var(--white); border-radius: var(--radius); font-weight: 800; font-size: 1rem; flex-shrink: 0; }
        .year-header .year-title { font-weight: 700; font-size: 1.1rem; color: var(--gray-800); flex: 1; }
        .year-header .year-count { font-size: 0.85rem; color: var(--gray-500); background: var(--gray-200); padding: 0.25rem 0.75rem; border-radius: 50px; }
        .year-header .year-arrow { font-size: 1.2rem; transition: transform 0.3s ease; color: var(--gray-500); }
        .year-header.open .year-arrow { transform: rotate(90deg); }
        
        .year-content { display: none; padding: 1rem 0.5rem; }
        .year-content.show { display: block; animation: slideDown 0.3s ease; }
        
        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .file-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(180px, 1fr)); gap: 0.75rem; }
        .file-card { display: flex; align-items: center; gap: 0.75rem; padding: 0.9rem 1rem; background: var(--gray-50); border: 2px solid var(--gray-200); border-radius: var(--radius); text-decoration: none; color: var(--gray-700); transition: all var(--transition); }
        .file-card:hover { border-color: var(--red); background: #fff5f5; transform: translateY(-2px); box-shadow: var(--shadow-md); }
        .file-card .file-icon { font-size: 1.5rem; flex-shrink: 0; }
        .file-card .file-name { font-weight: 500; font-size: 0.9rem; flex: 1; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
        .file-card .file-dl { font-size: 0.8rem; color: var(--gray-400); flex-shrink: 0; }
        
        .btn-back { display: inline-flex; align-items: center; gap: 0.5rem; padding: 0.8rem 1.5rem; background: var(--gray-200); color: var(--gray-700); border: none; border-radius: var(--radius); font-size: 0.95rem; font-weight: 600; cursor: pointer; text-decoration: none; transition: all var(--transition); margin-top: 0.5rem; }
        .btn-back:hover { background: var(--gray-300); }
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
            .card { padding: 1.25rem; }
            .file-grid { grid-template-columns: 1fr 1fr; }
        }
        @media (max-width: 400px) {
            .file-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="<?= $basePath ?>/index.php" class="nav-brand"><span class="brand-icon">Q</span>Quiz<span class="brand-dot">.</span>Ayiti</a>
        <button class="nav-toggle" id="navToggle"><span class="bar"></span><span class="bar"></span><span class="bar"></span></button>
        <ul class="nav-menu" id="navMenu">
            <li><a href="<?= $basePath ?>/index.php">Accueil</a></li>
            <li><a href="<?= $basePath ?>/9e/index.php" class="active">9ème AF</a></li>
            <li><a href="<?= $basePath ?>/ns4/index.php">NS4</a></li>
        </ul>
    </nav>

    <main class="container">
        <div class="page-header">
            <div class="class-badge">📚 Examens Officiels 9ème AF</div>
            <h1>Anciens <span class="highlight">Examens</span></h1>
            <?php if ($name): ?>
                <div class="welcome-message">👋 Bon travail, <strong><?= e($name) ?></strong> !</div>
            <?php endif; ?>
        </div>

        <div class="card">
            <div class="card-header">
                <div class="card-icon">📁</div>
                <div>
                    <h2>Examens par année</h2>
                    <p>Clique sur une année pour voir les épreuves</p>
                </div>
            </div>

            <?php foreach ($examens as $annee => $fichiers): ?>
                <div class="year-section">
                    <div class="year-header" onclick="toggleYear(this)">
                        <div class="year-badge"><?= substr($annee, 2) ?></div>
                        <span class="year-title">Examen <?= $annee ?></span>
                        <span class="year-count"><?= count($fichiers) ?> épreuves</span>
                        <span class="year-arrow">▶</span>
                    </div>
                    <div class="year-content">
                        <div class="file-grid">
                            <?php foreach ($fichiers as $fichier): 
                                $nomAffichage = pathinfo($fichier, PATHINFO_FILENAME);
                                $urlFichier = $basePath . '/9e/examen/' . $annee . '/' . urlencode($fichier);
                            ?>
                                <a href="<?= $urlFichier ?>" class="file-card" target="_blank" title="Ouvrir <?= $nomAffichage ?>">
                                    <span class="file-icon"><?= getIcon($fichier) ?></span>
                                    <span class="file-name"><?= $nomAffichage ?></span>
                                    <span class="file-dl">📥</span>
                                </a>
                            <?php endforeach; ?>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>

        <a href="<?= $basePath ?>/9e/index.php" class="btn-back">⬅️ Retour aux exercices</a>
    </main>

    <footer class="footer"><p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; 9ème AF</p></footer>

    <script>
        document.getElementById('navToggle').addEventListener('click', () => document.getElementById('navMenu').classList.toggle('show'));
        document.addEventListener('click', (e) => { if (!document.querySelector('.navbar').contains(e.target)) document.getElementById('navMenu').classList.remove('show'); });

        function toggleYear(header) {
            const content = header.nextElementSibling;
            const isOpen = content.classList.contains('show');
            
            // Fermer tous les autres
            document.querySelectorAll('.year-content.show').forEach(el => el.classList.remove('show'));
            document.querySelectorAll('.year-header').forEach(el => el.classList.remove('open'));
            
            // Ouvrir celui-ci s'il était fermé
            if (!isOpen) {
                content.classList.add('show');
                header.classList.add('open');
            }
        }
        
        // Ouvrir la première année par défaut
        document.querySelector('.year-header').click();
    </script>
</body>
</html>