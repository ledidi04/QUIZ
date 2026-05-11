<?php
/**
 * Page d'erreur personnalisée — Quiz Ayiti
 * Fonctionne avec : ErrorDocument XXX /error.php?code=XXX
 * 
 * Placé à la racine : /var/www/html/quiz/error.php
 * DocumentRoot pointe sur /var/www/html/quiz
 */

// ═══════════════════════════════════════════
// DÉTECTION DU CODE D'ERREUR
// ═══════════════════════════════════════════
$error_code = 500; // Valeur par défaut

// Priorité 1 : paramètre GET (envoyé par ErrorDocument)
if (isset($_GET['code'])) {
    $error_code = (int)$_GET['code'];
}
// Priorité 2 : code HTTP actuel
else {
    $code = http_response_code();
    if ($code >= 400) {
        $error_code = $code;
    }
}

// ═══════════════════════════════════════════
// CONFIGURATION DES ERREURS
// ═══════════════════════════════════════════
$error_config = [
    400 => [
        'title'   => 'Requête invalide',
        'emoji'   => '⚠️',
        'message' => 'Ta requête est mal formée ou contient des données incorrectes.',
        'color'   => '#f59e0b',
        'bg'      => '#fffbeb',
    ],
    401 => [
        'title'   => 'Accès non autorisé',
        'emoji'   => '🔒',
        'message' => 'Tu dois être connecté pour accéder à cette page.',
        'color'   => '#7c3aed',
        'bg'      => '#fdf4ff',
    ],
    403 => [
        'title'   => 'Accès interdit',
        'emoji'   => '🚫',
        'message' => 'Tu n\'as pas la permission d\'accéder à cette ressource.',
        'color'   => '#d21034',
        'bg'      => '#fff1f2',
    ],
    404 => [
        'title'   => 'Page introuvable',
        'emoji'   => '🔍',
        'message' => 'La page que tu cherches n\'existe pas ou a été déplacée.',
        'color'   => '#002395',
        'bg'      => '#eff6ff',
    ],
    405 => [
        'title'   => 'Méthode non autorisée',
        'emoji'   => '🚧',
        'message' => 'La méthode utilisée pour cette requête n\'est pas autorisée.',
        'color'   => '#f59e0b',
        'bg'      => '#fffbeb',
    ],
    408 => [
        'title'   => 'Délai dépassé',
        'emoji'   => '⏱️',
        'message' => 'Le serveur a mis trop de temps à répondre. Réessaie dans quelques instants.',
        'color'   => '#64748b',
        'bg'      => '#f8fafc',
    ],
    429 => [
        'title'   => 'Trop de requêtes',
        'emoji'   => '🛑',
        'message' => 'Tu as envoyé trop de requêtes en peu de temps. Attends un moment avant de réessayer.',
        'color'   => '#d21034',
        'bg'      => '#fff1f2',
    ],
    500 => [
        'title'   => 'Erreur serveur',
        'emoji'   => '💥',
        'message' => 'Une erreur interne s\'est produite sur le serveur. Notre équipe en est informée.',
        'color'   => '#d21034',
        'bg'      => '#fff1f2',
    ],
    502 => [
        'title'   => 'Mauvaise passerelle',
        'emoji'   => '🔌',
        'message' => 'Le serveur a reçu une réponse invalide d\'un serveur intermédiaire.',
        'color'   => '#64748b',
        'bg'      => '#f8fafc',
    ],
    503 => [
        'title'   => 'Service indisponible',
        'emoji'   => '🛠️',
        'message' => 'Le site est temporairement en maintenance. Reviens très bientôt !',
        'color'   => '#7c3aed',
        'bg'      => '#fdf4ff',
    ],
    504 => [
        'title'   => 'Timeout passerelle',
        'emoji'   => '⌛',
        'message' => 'Le serveur n\'a pas répondu à temps. Vérifie ta connexion et réessaie.',
        'color'   => '#64748b',
        'bg'      => '#f8fafc',
    ],
];

// Fallback
if (!isset($error_config[$error_code])) {
    $error_code = 500;
}
$cfg = $error_config[$error_code];

// Appliquer le code HTTP
http_response_code($error_code);

// Informations pour l'affichage
$date_now    = date('d/m/Y à H:i:s');
$request_uri = htmlspecialchars($_SERVER['REQUEST_URI'] ?? '/');
$is_server_error = $error_code >= 500;
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <title>Erreur <?= $error_code ?> — <?= htmlspecialchars($cfg['title']) ?> | Quiz Ayiti</title>
    <meta name="robots" content="noindex, nofollow">
    <link rel="icon" href="../images/logo.png" type="image/png">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
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
            --radius: 12px; --radius-lg: 16px; --radius-xl: 24px;
            --transition: 0.2s cubic-bezier(.4,0,.2,1);
            --err-color:  <?= $cfg['color'] ?>;
            --err-bg:     <?= $cfg['bg'] ?>;
        }
        *{margin:0;padding:0;box-sizing:border-box;}
        html{font-size:16px;scroll-behavior:smooth;-webkit-font-smoothing:antialiased;}
        body{
            font-family:'Inter',sans-serif;line-height:1.7;color:var(--gray-800);
            background:linear-gradient(180deg,#fdf4ff 0%,var(--gray-50) 30%);
            display:flex;flex-direction:column;min-height:100vh;
        }

        /* ===== NAVBAR ===== */
        .navbar{
            display:flex;justify-content:space-between;align-items:center;
            background:rgba(255,255,255,.95);backdrop-filter:blur(10px);
            padding:0 1.5rem;height:70px;position:sticky;top:0;z-index:1000;
            border-bottom:1px solid var(--gray-200);box-shadow:var(--shadow-sm);
        }
        .nav-brand{display:flex;align-items:center;gap:.75rem;text-decoration:none;flex-shrink:0;}
        .nav-brand img{height:44px;width:44px;object-fit:contain;border-radius:var(--radius);}
        .nav-brand-text{font-size:1.35rem;font-weight:800;color:var(--gray-900);}
        .nav-brand-text span{color:var(--red);}
        .nav-brand:hover .nav-brand-text{color:var(--blue);}
        .nav-menu{display:flex;list-style:none;gap:.35rem;align-items:center;}
        .nav-menu a{color:var(--gray-600);text-decoration:none;font-weight:500;font-size:.9rem;padding:.5rem .9rem;border-radius:var(--radius);transition:all var(--transition);white-space:nowrap;}
        .nav-menu a:hover{color:var(--blue);background:#eff6ff;}
        .nav-menu a.active{color:var(--white);background:var(--blue);font-weight:600;}
        .nav-menu a.btn-apk{background:linear-gradient(135deg,var(--green),#059669);color:var(--white);font-weight:600;box-shadow:0 3px 10px rgba(16,185,129,.3);padding:.5rem .9rem;}
        .nav-menu a.btn-apk:hover{transform:translateY(-1px);box-shadow:0 5px 14px rgba(16,185,129,.4);}
        .nav-toggle{display:none;flex-direction:column;background:none;border:none;cursor:pointer;gap:5px;}
        .nav-toggle .bar{width:26px;height:2.5px;background:var(--gray-700);border-radius:2px;}

        /* ===== CONTENU ===== */
        .container{flex:1;display:flex;align-items:center;justify-content:center;padding:3rem 1.5rem;}
        .error-card{background:var(--white);border-radius:var(--radius-xl);padding:3rem 2.5rem;box-shadow:var(--shadow-lg);border:1px solid var(--gray-100);text-align:center;max-width:560px;width:100%;}
        .error-emoji{font-size:5rem;line-height:1;margin-bottom:1rem;display:block;}
        .error-code{font-size:clamp(4rem,15vw,7rem);font-weight:800;color:var(--err-color);line-height:1;letter-spacing:-2px;margin-bottom:.25rem;}
        .error-title{font-size:1.4rem;font-weight:700;color:var(--gray-900);margin-bottom:.75rem;}
        .error-message{color:var(--gray-500);font-size:1rem;margin-bottom:2rem;max-width:400px;margin-left:auto;margin-right:auto;line-height:1.6;}
        .error-actions{display:flex;gap:.75rem;justify-content:center;flex-wrap:wrap;}
        .btn{display:inline-flex;align-items:center;gap:.5rem;padding:.75rem 1.5rem;border-radius:var(--radius);font-weight:600;font-size:.95rem;text-decoration:none;transition:all var(--transition);cursor:pointer;border:none;}
        .btn-primary{background:linear-gradient(135deg,var(--blue),#1e40af);color:var(--white);box-shadow:0 4px 12px rgba(0,35,149,.25);}
        .btn-primary:hover{transform:translateY(-2px);box-shadow:0 6px 16px rgba(0,35,149,.35);}
        .btn-secondary{background:var(--gray-100);color:var(--gray-700);border:1px solid var(--gray-200);}
        .btn-secondary:hover{background:var(--gray-200);}
        .divider{border:none;border-top:1px solid var(--gray-100);margin:2rem 0;}
        .quick-links{display:flex;gap:.5rem;justify-content:center;flex-wrap:wrap;}
        .quick-link{background:var(--gray-50);color:var(--gray-600);padding:.4rem 1rem;border-radius:50px;font-size:.85rem;font-weight:500;text-decoration:none;border:1px solid var(--gray-200);transition:all var(--transition);}
        .quick-link:hover{background:#eff6ff;color:var(--blue);border-color:#bfdbfe;}
        .error-details{background:var(--err-bg);border-radius:var(--radius);padding:1rem 1.25rem;margin-top:1.5rem;text-align:left;font-size:.8rem;color:var(--gray-500);}
        .error-details .detail-row{display:flex;justify-content:space-between;padding:.25rem 0;border-bottom:1px solid rgba(0,0,0,.05);flex-wrap:wrap;gap:.25rem;}
        .error-details .detail-row:last-child{border-bottom:none;}
        .detail-label{font-weight:600;color:var(--gray-600);flex-shrink:0;}
        .detail-value{color:var(--gray-500);word-break:break-all;text-align:right;}

        .footer{text-align:center;padding:1.5rem;font-size:.8rem;color:var(--gray-400);border-top:1px solid var(--gray-200);background:var(--white);}

        @media(max-width:640px){
            .navbar{padding:0 1rem;}
            .nav-brand-text{font-size:1.1rem;}
            .nav-menu{display:none;position:absolute;top:70px;left:0;right:0;background:rgba(255,255,255,.98);flex-direction:column;padding:1rem;gap:.5rem;border-bottom:1px solid var(--gray-200);box-shadow:var(--shadow-md);}
            .nav-menu.show{display:flex;}
            .nav-toggle{display:flex;}
            .nav-menu a{padding:.75rem 1rem;font-size:.95rem;width:100%;}
            .error-card{padding:2rem 1.5rem;}
            .error-actions{flex-direction:column;align-items:center;}
            .btn{width:100%;justify-content:center;}
            .error-details .detail-row{flex-direction:column;text-align:left;}
            .detail-value{text-align:left;}
        }
    </style>
</head>
<body>

<!-- ===== NAVBAR (chemins absolus /) ===== -->
<nav class="navbar">
    <a href="/index.php" class="nav-brand">
        <img src="/images/logo.png" alt="Quiz Ayiti">
        <span class="nav-brand-text">Quiz<span> </span>Ayiti</span>
    </a>
    <button class="nav-toggle" id="navToggle" aria-label="Menu">
        <span class="bar"></span><span class="bar"></span><span class="bar"></span>
    </button>
    <ul class="nav-menu" id="navMenu">
        <li><a href="/index.php">Accueil</a></li>
        <li><a href="/9e/index.php">9ème AF</a></li>
        <li><a href="/ns4/index.php">NS4</a></li>
        <li><a href="/about/index.php">À propos</a></li>
        <li><a href="/download.php" class="btn-apk">Télécharger l'app</a></li>
    </ul>
</nav>

<!-- ===== CONTENU ERREUR ===== -->
<main class="container">
    <div class="error-card">

        <span class="error-emoji"><?= $cfg['emoji'] ?></span>
        <div class="error-code"><?= $error_code ?></div>
        <h1 class="error-title"><?= htmlspecialchars($cfg['title']) ?></h1>
        <p class="error-message"><?= htmlspecialchars($cfg['message']) ?></p>

        <div class="error-actions">
            <a href="javascript:history.back()" class="btn btn-secondary">← Retour</a>
            <a href="/index.php" class="btn btn-primary">🏠 Accueil</a>
        </div>

        <hr class="divider">

        <p style="font-size:.85rem;color:var(--gray-400);margin-bottom:.75rem;">Ou choisis une section :</p>
        <div class="quick-links">
            <a href="/9e/index.php" class="quick-link">📚 9ème AF</a>
            <a href="/ns4/index.php" class="quick-link">🎓 NS4</a>
            <a href="/ns4/qcm.php" class="quick-link">📋 QCM</a>
            <a href="/about/index.php" class="quick-link">ℹ️ À propos</a>
        </div>

        <div class="error-details">
            <div class="detail-row">
                <span class="detail-label">Code HTTP :</span>
                <span class="detail-value"><?= $error_code ?></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Date :</span>
                <span class="detail-value"><?= $date_now ?></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">URL demandée :</span>
                <span class="detail-value"><?= $request_uri ?></span>
            </div>
        </div>

    </div>
</main>

<footer class="footer">
    <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; Plateforme de révision pour les élèves d'Haïti</p>
</footer>

<script>
    document.getElementById('navToggle').addEventListener('click',()=>{
        document.getElementById('navMenu').classList.toggle('show');
    });
    document.addEventListener('click',(e)=>{
        if(!document.querySelector('.navbar').contains(e.target)){
            document.getElementById('navMenu').classList.remove('show');
        }
    });
</script>
</body>
</html>