<?php
/**
 * Programmes Officiels 9ème Année Fondamentale
 * Quiz Ayiti - Documents pédagogiques conformes au MENFP
 * 
 * SEO optimisé pour : programmes 9eme af, programme 9e af, documents éducatifs Haïti,
 * quiz 9eme, éducation Haïti, MENFP programmes
 */
$pageTitle = 'Programmes Officiels 9ème AF';
$classeActive = '9e';
require_once __DIR__ . '/../includes/functions.php';

$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');

// Gestion POST pour le nom
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_SESSION['student_name']  = trim($_POST['student_name'] ?? '');
    $_SESSION['student_class'] = $_POST['student_class'] ?? '9e';
}

$name  = getStudentName();
$classe = getStudentClass();

// Liste des programmes disponibles
$programmes = [
    [
        'id' => 'francais',
        'matiere' => 'Français',
        'icon' => '📝',
        'fichier' => 'francais.pdf',
        'description' => 'Programme détaillé de Français 9ème AF : grammaire, conjugaison, orthographe, expression écrite et orale.',
        'themes' => ['Grammaire', 'Conjugaison', 'Orthographe', 'Expression écrite', 'Littérature'],
        'mots_cles' => 'programme français 9eme af, grammaire 9eme, conjugaison 9eme, expression écrite 9eme'
    ],
    [
        'id' => 'maths',
        'matiere' => 'Mathématiques',
        'icon' => '🔢',
        'fichier' => 'maths.pdf',
        'description' => 'Programme de Mathématiques 9ème AF : algèbre, géométrie, trigonométrie, statistiques et probabilités.',
        'themes' => ['Algèbre', 'Géométrie', 'Trigonométrie', 'Statistiques', 'Probabilités'],
        'mots_cles' => 'programme maths 9eme af, algèbre 9eme, géométrie 9eme, mathématiques secondaire'
    ],
    [
        'id' => 'creole',
        'matiere' => 'Créole',
        'icon' => '🇭🇹',
        'fichier' => 'creole.pdf',
        'description' => 'Programme de Créole 9ème AF : grammaire créole, littérature haïtienne, expression orale et écrite.',
        'themes' => ['Grammaire créole', 'Littérature haïtienne', 'Expression orale', 'Rédaction'],
        'mots_cles' => 'programme créole 9eme af, grammaire créole, littérature haïtienne, créole haïtien'
    ],
    [
        'id' => 'sciences_exp',
        'matiere' => 'Sciences Expérimentales',
        'icon' => '🔬',
        'fichier' => 'sciences_experimentales.pdf',
        'description' => 'Programme de Sciences Expérimentales 9ème AF : physique, chimie, biologie et méthodologie scientifique.',
        'themes' => ['Physique', 'Chimie', 'Biologie', 'Méthodologie scientifique'],
        'mots_cles' => 'programme sciences 9eme af, physique 9eme, chimie 9eme, biologie 9eme'
    ],
    [
        'id' => 'sciences_soc',
        'matiere' => 'Sciences Sociales',
        'icon' => '🌍',
        'fichier' => 'sciences_sociales.pdf',
        'description' => 'Programme de Sciences Sociales 9ème AF : histoire d\'Haïti, géographie, éducation civique et économie.',
        'themes' => ['Histoire d\'Haïti', 'Géographie', 'Éducation civique', 'Économie'],
        'mots_cles' => 'programme sciences sociales 9eme af, histoire haïti, géographie haïti, éducation civique'
    ],
    [
        'id' => 'anglais',
        'matiere' => 'Anglais',
        'icon' => '🇬🇧',
        'fichier' => 'anglais.pdf',
        'description' => 'Programme d\'Anglais 9ème AF : vocabulaire, grammaire anglaise, compréhension et expression.',
        'themes' => ['Vocabulaire', 'Grammaire anglaise', 'Compréhension', 'Expression orale'],
        'mots_cles' => 'programme anglais 9eme af, anglais secondaire, vocabulaire anglais'
    ],
    [
        'id' => 'espagnol',
        'matiere' => 'Espagnol',
        'icon' => '🇪🇸',
        'fichier' => 'espagnol.pdf',
        'description' => 'Programme d\'Espagnol 9ème AF : vocabulaire, conjugaison espagnole, culture hispanique.',
        'themes' => ['Vocabulaire', 'Conjugaison', 'Culture hispanique', 'Expression'],
        'mots_cles' => 'programme espagnol 9eme af, espagnol secondaire, conjugaison espagnole'
    ],
];
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    
    <!-- SEO Meta Tags -->
    <title>Programmes Officiels 9ème AF - Documents MENFP | Quiz Ayiti</title>
    <meta name="description" content="Téléchargez les programmes officiels de la 9ème Année Fondamentale. Documents conformes au MENFP : Français, Maths, Créole, Sciences, Anglais, Espagnol. Quiz et QCM inclus.">
    <meta name="keywords" content="programmes 9eme af, programme 9e af, documents MENFP, éducation Haïti, quiz 9eme, qcm 9eme, programme scolaire haïtien, 9ème année fondamentale, MENFP programmes, révision 9eme af">
    <meta name="robots" content="index, follow">
    <meta name="author" content="Quiz Ayiti">
    <link rel="canonical" href="https://quizayiti.com/9e/programmes.php">
    
    <!-- Open Graph -->
    <meta property="og:title" content="Programmes Officiels 9ème AF - Documents MENFP | Quiz Ayiti">
    <meta property="og:description" content="Tous les programmes officiels de la 9ème Année Fondamentale. Conforme au MENFP. Téléchargez les PDF et préparez vos examens.">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://quizayiti.com/9e/programmes.php">
    
    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="Programmes 9ème AF - Quiz Ayiti">
    <meta name="twitter:description" content="Programmes officiels 9ème AF conformes MENFP. Téléchargez gratuitement.">
    
    <link rel="shortcut icon" href="../images/logo.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    
    <!-- Structured Data -->
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "EducationalOrganization",
        "name": "Quiz Ayiti - Programmes 9ème AF",
        "description": "Documents pédagogiques officiels conformes au MENFP pour la 9ème Année Fondamentale",
        "url": "https://quizayiti.com/9e/programmes.php",
        "educationalLevel": "9ème Année Fondamentale",
        "offers": [
            <?php foreach ($programmes as $i => $p): ?>
            {
                "@type": "EducationalOccupationalProgram",
                "name": "Programme <?= e($p['matiere']) ?> 9ème AF",
                "description": "<?= e($p['description']) ?>",
                "educationalProgramMode": "document"
            }<?= $i < count($programmes) - 1 ? ',' : '' ?>
            <?php endforeach; ?>
        ]
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
            background: linear-gradient(180deg, #f0f4ff 0%, var(--gray-50) 30%);
            display: flex; flex-direction: column; min-height: 100vh;
        }
        
        /* Navbar */
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
        
        /* Container */
        .container { flex: 1; width: 100%; max-width: 900px; margin: 0 auto; padding: 2rem 1.5rem; }
        
        /* Header */
        .page-header { text-align: center; margin-bottom: 2.5rem; }
        .page-header .class-badge { display: inline-flex; align-items: center; gap: 0.5rem; background: linear-gradient(135deg, #eff6ff, #dbeafe); color: var(--blue); font-weight: 600; font-size: 0.85rem; padding: 0.5rem 1.2rem; border-radius: 50px; margin-bottom: 1rem; border: 1px solid #bfdbfe; }
        .page-header h1 { font-size: clamp(1.8rem, 5vw, 2.6rem); font-weight: 800; color: var(--gray-900); line-height: 1.2; }
        .page-header h1 .highlight { background: linear-gradient(135deg, var(--blue), #3b82f6); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .page-header .subtitle { color: var(--gray-500); font-size: 1rem; margin-top: 0.5rem; max-width: 600px; margin-left: auto; margin-right: auto; }
        .welcome-message { display: inline-flex; align-items: center; gap: 0.5rem; background: #f0fdf4; color: #166534; font-weight: 600; font-size: 1rem; padding: 0.6rem 1.2rem; border-radius: 50px; border: 1px solid #bbf7d0; margin-top: 0.75rem; }
        
        /* Cards */
        .card { background: var(--white); border-radius: var(--radius-xl); padding: 2rem; box-shadow: var(--shadow-lg); margin-bottom: 1.5rem; border: 1px solid var(--gray-100); }
        .card-header { display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.5rem; padding-bottom: 1rem; border-bottom: 2px solid var(--gray-100); }
        .card-header .card-icon { width: 48px; height: 48px; background: linear-gradient(135deg, #eff6ff, #dbeafe); border-radius: var(--radius); display: flex; align-items: center; justify-content: center; font-size: 1.4rem; flex-shrink: 0; }
        .card-header h2 { font-size: 1.3rem; font-weight: 700; color: var(--gray-900); margin: 0; }
        .card-header p { color: var(--gray-400); font-size: 0.85rem; margin: 0; }
        
        /* Programme Grid */
        .programme-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.25rem;
        }
        
        .programme-card {
            background: var(--white);
            border: 2px solid var(--gray-200);
            border-radius: var(--radius-lg);
            padding: 1.5rem;
            transition: all var(--transition);
            position: relative;
            overflow: hidden;
            cursor: pointer;
            text-decoration: none;
            display: block;
            color: inherit;
        }
        
        .programme-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-xl);
            border-color: var(--blue);
        }
        
        .programme-card:active {
            transform: translateY(-2px);
        }
        
        .programme-card .prog-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
        }
        
        .programme-card .prog-icon {
            width: 56px;
            height: 56px;
            border-radius: var(--radius);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            flex-shrink: 0;
        }
        
        .programme-card .prog-icon.francais { background: linear-gradient(135deg, #dbeafe, #bfdbfe); }
        .programme-card .prog-icon.maths { background: linear-gradient(135deg, #fef3c7, #fde68a); }
        .programme-card .prog-icon.creole { background: linear-gradient(135deg, #dcfce7, #bbf7d0); }
        .programme-card .prog-icon.sciences { background: linear-gradient(135deg, #fce7f3, #fbcfe8); }
        .programme-card .prog-icon.social { background: linear-gradient(135deg, #ede9fe, #ddd6fe); }
        .programme-card .prog-icon.langue { background: linear-gradient(135deg, #ffe4e6, #fecdd3); }
        
        .programme-card .prog-title {
            font-weight: 700;
            font-size: 1.1rem;
            color: var(--gray-900);
            margin: 0;
        }
        
        .programme-card .prog-subtitle {
            font-size: 0.8rem;
            color: var(--gray-500);
            margin: 0.25rem 0 0 0;
        }
        
        .programme-card .prog-desc {
            font-size: 0.9rem;
            color: var(--gray-600);
            line-height: 1.6;
            margin-bottom: 1rem;
        }
        
        .programme-card .prog-themes {
            display: flex;
            flex-wrap: wrap;
            gap: 0.4rem;
            margin-bottom: 1rem;
        }
        
        .programme-card .theme-tag {
            background: var(--gray-100);
            color: var(--gray-600);
            font-size: 0.75rem;
            padding: 0.25rem 0.65rem;
            border-radius: 50px;
            font-weight: 500;
            white-space: nowrap;
        }
        
        .programme-card .download-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: linear-gradient(135deg, var(--blue), #1e40af);
            color: var(--white);
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            padding: 0.65rem 1.2rem;
            border-radius: var(--radius);
            transition: all var(--transition);
        }
        
        .programme-card .download-btn:hover {
            background: linear-gradient(135deg, #1e40af, var(--blue));
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(0,35,149,0.35);
        }
        
        /* Info section */
        .info-section { display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 0.75rem; margin-top: 1.5rem; }
        .info-item { background: var(--gray-50); border-radius: var(--radius); padding: 1rem; text-align: center; border: 1px solid var(--gray-100); }
        .info-item .info-icon { font-size: 1.5rem; margin-bottom: 0.25rem; }
        .info-item .info-value { font-weight: 700; color: var(--gray-800); font-size: 1.1rem; }
        .info-item .info-label { font-size: 0.75rem; color: var(--gray-400); }
        
        /* Breadcrumb */
        .breadcrumb {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1.5rem;
            font-size: 0.85rem;
            color: var(--gray-500);
            flex-wrap: wrap;
        }
        .breadcrumb a {
            color: var(--blue);
            text-decoration: none;
            font-weight: 500;
        }
        .breadcrumb a:hover { text-decoration: underline; }
        .breadcrumb .separator { color: var(--gray-400); }
        .breadcrumb .current { color: var(--gray-700); font-weight: 600; }
        
        /* Footer */
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
            .programme-grid { grid-template-columns: 1fr; }
            .card { padding: 1.25rem; }
            .info-section { grid-template-columns: repeat(3, 1fr); }
        }
        @media (max-width: 400px) {
            .programme-grid { grid-template-columns: 1fr; }
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
            <li><a href="<?= $basePath ?>/9e/index.php" class="active">9ème AF</a></li>
            <li><a href="<?= $basePath ?>/ns4/index.php">NS4</a></li>
        </ul>
    </nav>

    <!-- ========== CONTENU PRINCIPAL ========== -->
    <main class="container">
        <!-- Fil d'Ariane -->
        <nav class="breadcrumb" aria-label="Fil d'Ariane">
            <a href="<?= $basePath ?>/index.php">Accueil</a>
            <span class="separator">›</span>
            <a href="<?= $basePath ?>/9e/index.php">9ème AF</a>
            <span class="separator">›</span>
            <span class="current">Programmes Officiels</span>
        </nav>
        
        <!-- Header -->
        <div class="page-header">
            <div class="class-badge">📚 9ème Année Fondamentale</div>
            <h1>Programmes <span class="highlight">Officiels</span> MENFP</h1>
            <p class="subtitle">Téléchargez les documents officiels du Ministère de l'Éducation Nationale pour la 9ème AF</p>
            <?php if ($name): ?>
                <div class="welcome-message">👋 Bon travail, <strong><?= e($name) ?></strong> !</div>
            <?php endif; ?>
        </div>

        <!-- Introduction -->
        <div class="card">
            <div class="card-header">
                <div class="card-icon">📋</div>
                <div>
                    <h2>Documents conformes au MENFP</h2>
                    <p>Programmes détaillés pour chaque matière</p>
                </div>
            </div>
            <p style="color: var(--gray-600); line-height: 1.7; margin-bottom: 1rem;">
                Retrouvez ici tous les <strong>programmes officiels de la 9ème Année Fondamentale</strong> (AF). 
                Ces documents sont conformes aux directives du <strong>Ministère de l'Éducation Nationale et de la Formation Professionnelle (MENFP)</strong>. 
                Ils couvrent l'ensemble des matières enseignées en 9ème AF et sont essentiels pour la <strong>préparation aux examens officiels</strong>.
            </p>
            <p style="color: var(--gray-500); font-size: 0.9rem; line-height: 1.6;">
                💡 <strong>Astuce :</strong> Utilisez ces programmes en complément de nos <strong>quiz et QCM interactifs</strong> 
                pour une préparation complète aux examens de 9ème AF.
            </p>
        </div>

        <!-- Grille des programmes -->
        <div class="card">
            <div class="card-header">
                <div class="card-icon">📁</div>
                <div>
                    <h2>Programmes disponibles</h2>
                    <p>Cliquez pour télécharger le PDF</p>
                </div>
            </div>
            
            <div class="programme-grid">
                <?php foreach ($programmes as $prog): 
                    // Déterminer la classe d'icône
                    $iconClass = 'langue';
                    if (in_array($prog['id'], ['francais'])) $iconClass = 'francais';
                    elseif (in_array($prog['id'], ['maths'])) $iconClass = 'maths';
                    elseif (in_array($prog['id'], ['creole'])) $iconClass = 'creole';
                    elseif (in_array($prog['id'], ['sciences_exp'])) $iconClass = 'sciences';
                    elseif (in_array($prog['id'], ['sciences_soc'])) $iconClass = 'social';
                ?>
                <div class="programme-card">
                    <div class="prog-header">
                        <div class="prog-icon <?= $iconClass ?>">
                            <?= $prog['icon'] ?>
                        </div>
                        <div>
                            <h3 class="prog-title"><?= e($prog['matiere']) ?></h3>
                            <p class="prog-subtitle">Programme officiel MENFP</p>
                        </div>
                    </div>
                    
                    <p class="prog-desc"><?= e($prog['description']) ?></p>
                    
                    <div class="prog-themes">
                        <?php foreach ($prog['themes'] as $theme): ?>
                            <span class="theme-tag"><?= e($theme) ?></span>
                        <?php endforeach; ?>
                    </div>
                    
                    <a href="<?= $basePath ?>/programmes/<?= $prog['fichier'] ?>" 
                       class="download-btn" 
                       target="_blank" 
                       rel="noopener"
                       title="Télécharger le programme de <?= e($prog['matiere']) ?> 9ème AF">
                        📥 Télécharger PDF
                    </a>
                </div>
                <?php endforeach; ?>
            </div>
        </div>

        <!-- Infos rapides -->
        <div class="info-section">
            <div class="info-item">
                
                <div class="info-value">7</div>
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
        
        <!-- Appel à l'action -->
        <div class="card" style="text-align: center; background: linear-gradient(135deg, #eff6ff, #dbeafe); border-color: #bfdbfe;">
            
            <h3 style="font-weight: 700; color: var(--gray-900); margin-bottom: 0.5rem;">Prêt à tester tes connaissances ?</h3>
            <p style="color: var(--gray-600); margin-bottom: 1.25rem;">Après avoir révisé avec les programmes, entraîne-toi avec nos quiz et QCM interactifs !</p>
            <a href="<?= $basePath ?>/9e/qcm.php" style="display: inline-block; background: linear-gradient(135deg, var(--blue), #1e40af); color: var(--white); padding: 0.75rem 2rem; border-radius: 50px; text-decoration: none; font-weight: 600;">🎮 Commencer un QCM</a>
        </div>
    </main>

    <!-- ========== FOOTER ========== -->
    <footer class="footer">
        <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; 
        9ème Année Fondamentale &mdash; 
        Programmes officiels MENFP &mdash; 
        <a href="<?= $basePath ?>/9e/index.php" style="color: var(--gray-400);">Quiz 9ème AF</a></p>
    </footer>

    <script>
        // Menu mobile
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