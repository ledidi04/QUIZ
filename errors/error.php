<?php
/**
 * Page d'erreur personnalisée — Quiz Ayiti
 * Couvre : 400, 401, 403, 404, 405, 408, 429, 500, 502, 503, 504
 */

$code = (int)($_GET['code'] ?? http_response_code());

// Dictionnaire des erreurs
$errors = [
    400 => [
        'title'   => 'Requête invalide',
        'icon'    => '⚠️',
        'message' => 'Ta requête est mal formée ou contient des données incorrectes.',
        'color'   => '#f59e0b',
        'bg'      => '#fffbeb',
        'border'  => '#fde68a',
    ],
    401 => [
        'title'   => 'Accès non autorisé',
        'icon'    => '🔒',
        'message' => 'Tu dois être connecté pour accéder à cette page.',
        'color'   => '#7c3aed',
        'bg'      => '#fdf4ff',
        'border'  => '#ddd6fe',
    ],
    403 => [
        'title'   => 'Accès interdit',
        'icon'    => '🚫',
        'message' => 'Tu n\'as pas la permission d\'accéder à cette ressource.',
        'color'   => '#d21034',
        'bg'      => '#fff1f2',
        'border'  => '#fecdd3',
    ],
    404 => [
        'title'   => 'Page introuvable',
        'icon'    => '🔍',
        'message' => 'La page que tu cherches n\'existe pas ou a été déplacée.',
        'color'   => '#002395',
        'bg'      => '#eff6ff',
        'border'  => '#bfdbfe',
    ],
    405 => [
        'title'   => 'Méthode non autorisée',
        'icon'    => '🚧',
        'message' => 'La méthode utilisée pour cette requête n\'est pas autorisée.',
        'color'   => '#f59e0b',
        'bg'      => '#fffbeb',
        'border'  => '#fde68a',
    ],
    408 => [
        'title'   => 'Délai dépassé',
        'icon'    => '⏱️',
        'message' => 'Le serveur a mis trop de temps à répondre. Réessaie dans quelques instants.',
        'color'   => '#64748b',
        'bg'      => '#f8fafc',
        'border'  => '#e2e8f0',
    ],
    429 => [
        'title'   => 'Trop de requêtes',
        'icon'    => '🛑',
        'message' => 'Tu as envoyé trop de requêtes en peu de temps. Attends un moment avant de réessayer.',
        'color'   => '#d21034',
        'bg'      => '#fff1f2',
        'border'  => '#fecdd3',
    ],
    500 => [
        'title'   => 'Erreur serveur',
        'icon'    => '💥',
        'message' => 'Une erreur interne s\'est produite sur le serveur. Notre équipe en est informée.',
        'color'   => '#d21034',
        'bg'      => '#fff1f2',
        'border'  => '#fecdd3',
    ],
    502 => [
        'title'   => 'Mauvaise passerelle',
        'icon'    => '🔌',
        'message' => 'Le serveur a reçu une réponse invalide d\'un serveur intermédiaire.',
        'color'   => '#64748b',
        'bg'      => '#f8fafc',
        'border'  => '#e2e8f0',
    ],
    503 => [
        'title'   => 'Service indisponible',
        'icon'    => '🛠️',
        'message' => 'Le site est temporairement en maintenance. Reviens très bientôt !',
        'color'   => '#7c3aed',
        'bg'      => '#fdf4ff',
        'border'  => '#ddd6fe',
    ],
    504 => [
        'title'   => 'Timeout passerelle',
        'icon'    => '⌛',
        'message' => 'Le serveur n\'a pas répondu à temps. Vérifie ta connexion et réessaie.',
        'color'   => '#64748b',
        'bg'      => '#f8fafc',
        'border'  => '#e2e8f0',
    ],
];

// Fallback si le code n'est pas dans la liste
$err = $errors[$code] ?? [
    'title'   => 'Erreur inattendue',
    'icon'    => '❓',
    'message' => 'Une erreur inconnue s\'est produite.',
    'color'   => '#64748b',
    'bg'      => '#f8fafc',
    'border'  => '#e2e8f0',
];

// Appliquer le bon code HTTP
http_response_code($code);

// Chemin de base pour les liens
$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <title>Erreur <?= $code ?> — <?= htmlspecialchars($err['title']) ?> | Quiz Ayiti</title>
    <meta name="robots" content="noindex, nofollow">
    <link rel="shortcut icon" href="<?= $basePath ?>/images/logo.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --blue:   #002395; --red: #d21034; --gold: #f1c40f;
            --green:  #10b981; --purple: #7c3aed; --orange: #f59e0b;
            --gray-50: #f8fafc; --gray-100: #f1f5f9; --gray-200: #e2e8f0;
            --gray-300: #cbd5e1; --gray-400: #94a3b8; --gray-500: #64748b;
            --gray-600: #475569; --gray-700: #334155; --gray-800: #1e293b;
            --gray-900: #0f172a; --white: #ffffff;
            --shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
            --shadow-md: 0 4px 6px rgba(0,0,0,0.07);
            --shadow-lg: 0 10px 25px rgba(0,0,0,0.08);
            --radius: 12px; --radius-lg: 16px; --radius-xl: 24px;
            --transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            --err-color:  <?= $err['color'] ?>;
            --err-bg:     <?= $err['bg'] ?>;
            --err-border: <?= $err['border'] ?>;
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html { font-size: 16px; scroll-behavior: smooth; -webkit-font-smoothing: antialiased; }
        body {
            font-family: 'Inter', sans-serif; line-height: 1.7; color: var(--gray-800);
            background: linear-gradient(180deg, #fdf4ff 0%, var(--gray-50) 30%);
            display: flex; flex-direction: column; min-height: 100vh;
        }

        /* ===== NAVBAR (identique au reste du site) ===== */
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
        .nav-toggle { display: none; flex-direction: column; background: none; border: none; cursor: pointer; gap: 5px; }
        .nav-toggle .bar { width: 26px; height: 2.5px; background: var(--gray-700); border-radius: 2px; }

        /* ===== CONTENU ERREUR ===== */
        .container {
            flex: 1; display: flex; align-items: center; justify-content: center;
            padding: 3rem 1.5rem;
        }
        .error-card {
            background: var(--white); border-radius: var(--radius-xl);
            padding: 3rem 2.5rem; box-shadow: var(--shadow-lg);
            border: 1px solid var(--gray-100); text-align: center;
            max-width: 560px; width: 100%;
        }
        .error-badge {
            display: inline-flex; align-items: center; gap: 0.5rem;
            background: var(--err-bg); color: var(--err-color);
            font-weight: 700; font-size: 0.85rem; padding: 0.5rem 1.2rem;
            border-radius: 50px; border: 1px solid var(--err-border);
            margin-bottom: 1.5rem; letter-spacing: 0.03em;
        }
        .error-icon {
            font-size: 5rem; line-height: 1; margin-bottom: 1rem;
            display: block;
        }
        .error-code {
            font-size: clamp(4rem, 15vw, 7rem); font-weight: 800;
            color: var(--err-color); line-height: 1; letter-spacing: -2px;
            margin-bottom: 0.25rem;
        }
        .error-title {
            font-size: 1.4rem; font-weight: 700; color: var(--gray-900);
            margin-bottom: 0.75rem;
        }
        .error-message {
            color: var(--gray-500); font-size: 1rem; margin-bottom: 2rem;
            max-width: 400px; margin-left: auto; margin-right: auto;
        }
        .error-actions { display: flex; gap: 0.75rem; justify-content: center; flex-wrap: wrap; }
        .btn {
            display: inline-flex; align-items: center; gap: 0.5rem;
            padding: 0.75rem 1.5rem; border-radius: var(--radius);
            font-weight: 600; font-size: 0.95rem; text-decoration: none;
            transition: all var(--transition); cursor: pointer; border: none;
        }
        .btn-primary {
            background: linear-gradient(135deg, var(--blue), #1e40af);
            color: var(--white); box-shadow: 0 4px 12px rgba(0,35,149,0.25);
        }
        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 6px 16px rgba(0,35,149,0.35); }
        .btn-secondary {
            background: var(--gray-100); color: var(--gray-700);
            border: 1px solid var(--gray-200);
        }
        .btn-secondary:hover { background: var(--gray-200); }

        .divider { border: none; border-top: 1px solid var(--gray-100); margin: 2rem 0; }

        .quick-links { display: flex; gap: 0.5rem; justify-content: center; flex-wrap: wrap; }
        .quick-link {
            background: var(--gray-50); color: var(--gray-600);
            padding: 0.4rem 1rem; border-radius: 50px; font-size: 0.85rem;
            font-weight: 500; text-decoration: none; border: 1px solid var(--gray-200);
            transition: all var(--transition);
        }
        .quick-link:hover { background: #eff6ff; color: var(--blue); border-color: #bfdbfe; }

        /* ===== FOOTER ===== */
        .footer {
            text-align: center; padding: 1.5rem; font-size: 0.8rem;
            color: var(--gray-400); border-top: 1px solid var(--gray-200);
            background: var(--white);
        }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 640px) {
            .navbar { padding: 0 1rem; }
            .nav-menu { display: none; position: absolute; top: 70px; left: 0; right: 0; background: rgba(255,255,255,0.98); flex-direction: column; padding: 1rem; gap: 0.25rem; border-bottom: 1px solid var(--gray-200); box-shadow: var(--shadow-md); }
            .nav-menu.show { display: flex; }
            .nav-toggle { display: flex; }
            .error-card { padding: 2rem 1.5rem; }
            .error-actions { flex-direction: column; align-items: center; }
            .btn { width: 100%; justify-content: center; }
        }
    </style>
</head>
<body>

    <!-- ========== NAVBAR ========== -->
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
            <li><a href="<?= $basePath ?>/ns4/index.php">NS4</a></li>
        </ul>
    </nav>

    <!-- ========== ERREUR ========== -->
    <main class="container">
        <div class="error-card">

            <div class="error-badge">
                <?= $err['icon'] ?> Erreur <?= $code ?>
            </div>

            <span class="error-icon"><?= $err['icon'] ?></span>
            <div class="error-code"><?= $code ?></div>
            <h1 class="error-title"><?= htmlspecialchars($err['title']) ?></h1>
            <p class="error-message"><?= htmlspecialchars($err['message']) ?></p>

            <div class="error-actions">
                <a href="javascript:history.back()" class="btn btn-secondary">
                    ← Retour
                </a>
                <a href="<?= $basePath ?>/index.php" class="btn btn-primary">
                    🏠 Accueil
                </a>
            </div>

            <hr class="divider">

            <p style="font-size:0.85rem; color:var(--gray-400); margin-bottom:0.75rem;">
                Ou choisis une section directement :
            </p>
            <div class="quick-links">
                <a href="<?= $basePath ?>/9e/index.php"      class="quick-link">📚 9ème AF</a>
                <a href="<?= $basePath ?>/ns4/index.php"      class="quick-link">🎓 NS4</a>
                <a href="<?= $basePath ?>/ns4/qcm.php"        class="quick-link">📋 QCM</a>
                <a href="<?= $basePath ?>/ns4/exam.php"       class="quick-link">⏱️ Examen</a>
            </div>

        </div>
    </main>

    <!-- ========== FOOTER ========== -->
    <footer class="footer">
        <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; Plateforme de révision pour les élèves d'Haïti</p>
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