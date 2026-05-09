<?php
$basePath = rtrim(dirname($_SERVER['SCRIPT_NAME']), '/');

// ─── Téléchargement direct de l'APK ───────────────────────────────────────
if (isset($_GET['dl']) && $_GET['dl'] === 'apk') {
    $apkPath = __DIR__ . '/Quiz Ayiti.apk';
    if (file_exists($apkPath)) {
        header('Content-Type: application/vnd.android.package-archive');
        header('Content-Disposition: attachment; filename="Quiz Ayiti.apk"');
        header('Content-Length: ' . filesize($apkPath));
        header('Cache-Control: no-cache, must-revalidate');
        readfile($apkPath);
        exit;
    } else {
        $dlError = true;
    }
}

// Taille APK (affichée si disponible)
$apkFile = __DIR__ . '/Quiz Ayiti.apk';
$apkSize = file_exists($apkFile) ? round(filesize($apkFile) / 1048576, 1) . ' Mo' : '—';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <title>Télécharger Quiz Ayiti — Application Android</title>
    <meta name="description" content="Télécharge l'application Quiz Ayiti pour Android et révise tes examens NS4 et 9ème AF où que tu sois, même sans internet.">
    <link rel="shortcut icon" href="<?= $basePath ?>/images/logo.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root{
            --blue:#002395;--red:#d21034;--gold:#f1c40f;--green:#10b981;
            --purple:#7c3aed;--orange:#f59e0b;
            --gray-50:#f8fafc;--gray-100:#f1f5f9;--gray-200:#e2e8f0;
            --gray-300:#cbd5e1;--gray-400:#94a3b8;--gray-500:#64748b;
            --gray-600:#475569;--gray-700:#334155;--gray-800:#1e293b;
            --gray-900:#0f172a;--white:#ffffff;
            --shadow-sm:0 1px 2px rgba(0,0,0,.05);
            --shadow-md:0 4px 6px rgba(0,0,0,.07);
            --shadow-lg:0 10px 25px rgba(0,0,0,.08);
            --radius:12px;--radius-lg:16px;--radius-xl:24px;
            --transition:0.2s cubic-bezier(.4,0,.2,1);
        }
        *{margin:0;padding:0;box-sizing:border-box;}
        html{font-size:16px;scroll-behavior:smooth;-webkit-font-smoothing:antialiased;}
        body{
            font-family:'Inter',sans-serif;line-height:1.7;color:var(--gray-800);
            background:linear-gradient(180deg,#f0fdf4 0%,var(--gray-50) 30%);
            display:flex;flex-direction:column;min-height:100vh;
        }

        /* ===== NAVBAR ===== */
        .navbar{
            display:flex;justify-content:space-between;align-items:center;
            background:rgba(255,255,255,.95);backdrop-filter:blur(10px);
            padding:0 2rem;height:70px;position:sticky;top:0;z-index:1000;
            border-bottom:1px solid var(--gray-200);box-shadow:var(--shadow-sm);
        }
        .nav-brand{display:flex;align-items:center;gap:.75rem;text-decoration:none;}
        .nav-brand img{height:44px;width:44px;object-fit:contain;border-radius:var(--radius);}
        .nav-brand-text{font-size:1.35rem;font-weight:800;color:var(--gray-900);}
        .nav-brand-text span{color:var(--red);}
        .nav-menu{display:flex;list-style:none;gap:.5rem;align-items:center;}
        .nav-menu a{color:var(--gray-600);text-decoration:none;font-weight:500;font-size:.95rem;padding:.6rem 1.1rem;border-radius:var(--radius);transition:all var(--transition);}
        .nav-menu a:hover{color:var(--blue);background:#eff6ff;}
        .nav-menu a.active{color:var(--white);background:var(--green);font-weight:600;}
        .nav-menu a.btn-apk{background:linear-gradient(135deg,var(--green),#059669);color:var(--white);font-weight:600;box-shadow:0 3px 10px rgba(16,185,129,.3);}
        .nav-menu a.btn-apk:hover{transform:translateY(-1px);}
        .nav-toggle{display:none;flex-direction:column;background:none;border:none;cursor:pointer;gap:5px;}
        .nav-toggle .bar{width:26px;height:2.5px;background:var(--gray-700);border-radius:2px;}

        /* ===== CONTENU ===== */
        .container{flex:1;width:100%;max-width:760px;margin:0 auto;padding:3rem 1.5rem;}

        /* ===== HERO DOWNLOAD ===== */
        .hero-download{
            text-align:center;background:linear-gradient(135deg,#f0fdf4,#dcfce7);
            border-radius:var(--radius-xl);padding:3rem 2rem;margin-bottom:2rem;
            border:1px solid #bbf7d0;position:relative;overflow:hidden;
        }
        .hero-download::before{
            content:'';position:absolute;top:-40px;right:-40px;
            width:200px;height:200px;background:radial-gradient(circle,rgba(16,185,129,.12),transparent 70%);
            border-radius:50%;
        }
        .app-logo-wrap{position:relative;display:inline-block;margin-bottom:1.5rem;}
        .app-logo-wrap img{
            width:120px;height:120px;object-fit:contain;
            filter:drop-shadow(0 8px 20px rgba(0,0,0,.2));
            animation:floatApp 3s ease-in-out infinite;
        }
        @keyframes floatApp{
            0%,100%{transform:translateY(0) rotate(0deg);}
            50%{transform:translateY(-12px) rotate(2deg);}
        }
        .app-badge-android{
            position:absolute;bottom:-4px;right:-10px;
            background:#3ddc84;color:#0d3818;
            font-size:.7rem;font-weight:800;padding:.25rem .6rem;
            border-radius:50px;border:2px solid var(--white);
        }
        .hero-download h1{font-size:clamp(1.7rem,5vw,2.5rem);font-weight:800;color:var(--gray-900);margin-bottom:.5rem;}
        .hero-download h1 em{font-style:normal;color:var(--green);}
        .hero-download .tagline{color:var(--gray-600);font-size:1rem;margin-bottom:1.5rem;}

        /* Infos APK */
        .apk-meta{
            display:flex;justify-content:center;flex-wrap:wrap;gap:1rem;
            margin-bottom:2rem;
        }
        .apk-meta-item{display:flex;align-items:center;gap:.4rem;background:var(--white);padding:.5rem 1rem;border-radius:50px;font-size:.85rem;font-weight:600;color:var(--gray-700);border:1px solid var(--gray-200);}

        /* Bouton principal */
        .btn-download{
            display:inline-flex;align-items:center;gap:.75rem;
            background:linear-gradient(135deg,var(--green),#059669);
            color:var(--white);text-decoration:none;
            padding:1rem 2.5rem;border-radius:var(--radius-lg);
            font-size:1.1rem;font-weight:700;
            box-shadow:0 6px 20px rgba(16,185,129,.4);
            transition:all var(--transition);
            border:none;cursor:pointer;
        }
        .btn-download:hover{
            transform:translateY(-3px);
            box-shadow:0 10px 28px rgba(16,185,129,.5);
        }
        .btn-download:active{transform:translateY(0);}
        .btn-download .dl-arrow{font-size:1.3rem;}

        /* Barre de progression simulée */
        .dl-progress{display:none;margin-top:1.5rem;}
        .dl-progress.active{display:block;}
        .progress-bar{height:6px;background:var(--gray-200);border-radius:50px;overflow:hidden;margin-bottom:.5rem;}
        .progress-fill{height:100%;background:linear-gradient(90deg,var(--green),#34d399);border-radius:50px;width:0;transition:width .1s linear;}
        .progress-label{font-size:.8rem;color:var(--gray-500);text-align:center;}

        /* ===== CARD ===== */
        .card{background:var(--white);border-radius:var(--radius-xl);padding:2rem;box-shadow:var(--shadow-lg);margin-bottom:1.5rem;border:1px solid var(--gray-100);}
        .card-header{display:flex;align-items:center;gap:.75rem;margin-bottom:1.5rem;padding-bottom:1rem;border-bottom:2px solid var(--gray-100);}
        .card-icon{font-size:1.5rem;}
        .card-header h2{font-size:1.1rem;font-weight:700;color:var(--gray-900);}
        .card-header p{font-size:.85rem;color:var(--gray-500);}

        /* Steps d'installation */
        .steps{display:flex;flex-direction:column;gap:1rem;}
        .step{display:flex;align-items:flex-start;gap:1rem;}
        .step-num{
            min-width:36px;height:36px;background:linear-gradient(135deg,var(--blue),#1e40af);
            color:var(--white);font-weight:800;font-size:.9rem;
            border-radius:50%;display:flex;align-items:center;justify-content:center;
            flex-shrink:0;
        }
        .step-body h3{font-size:.95rem;font-weight:700;color:var(--gray-800);margin-bottom:.2rem;}
        .step-body p{font-size:.88rem;color:var(--gray-500);}

        /* Features */
        .features-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(200px,1fr));gap:1rem;}
        .feature-item{background:var(--gray-50);border-radius:var(--radius-lg);padding:1.1rem;border:1px solid var(--gray-100);}
        .feature-icon{font-size:1.6rem;margin-bottom:.5rem;display:block;}
        .feature-name{font-weight:700;font-size:.9rem;color:var(--gray-800);margin-bottom:.25rem;}
        .feature-desc{font-size:.8rem;color:var(--gray-500);}

        /* Alerte erreur */
        .alert-error{
            background:#fff1f2;border:1px solid #fecdd3;color:var(--red);
            border-radius:var(--radius);padding:1rem 1.25rem;margin-bottom:1.5rem;
            display:flex;align-items:center;gap:.75rem;font-weight:600;
        }

        /* ===== FOOTER ===== */
        .footer{text-align:center;padding:1.5rem;font-size:.8rem;color:var(--gray-400);border-top:1px solid var(--gray-200);background:var(--white);}

        @media(max-width:640px){
            .navbar{padding:0 1rem;}
            .nav-menu{display:none;position:absolute;top:70px;left:0;right:0;background:rgba(255,255,255,.98);flex-direction:column;padding:1rem;gap:.25rem;border-bottom:1px solid var(--gray-200);box-shadow:var(--shadow-md);}
            .nav-menu.show{display:flex;}
            .nav-toggle{display:flex;}
            .btn-download{width:100%;justify-content:center;}
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
        <li><a href="<?= $basePath ?>/index.php"> Accueil</a></li>
        <li><a href="<?= $basePath ?>/9e/index.php"> 9ème AF</a></li>
        <li><a href="<?= $basePath ?>/ns4/index.php"> NS4</a></li>
        <li><a href="<?= $basePath ?>/about/index.php"> À propos</a></li>
        <li><a href="<?= $basePath ?>/download.php" > Télécharger l'app</a></li>
    </ul>
</nav>

<!-- ===== CONTENU ===== -->
<main class="container">

    <?php if (!empty($dlError)): ?>
    <div class="alert-error">⚠️ Le fichier APK est introuvable sur le serveur. Contacte l'administrateur.</div>
    <?php endif; ?>

    <!-- Hero -->
    <div class="hero-download">
        <div class="app-logo-wrap">
            <img src="<?= $basePath ?>/images/logo.png" alt="Quiz Ayiti App">
            <span class="app-badge-android">Android</span>
        </div>
        <h1>Quiz <em>Ayiti</em> — App Android</h1>
        <p class="tagline">Révise partout · Conforme MENFP</p>

        <div class="apk-meta">
            <span class="apk-meta-item"> Android 5.0+</span>
            <span class="apk-meta-item"> Gratuit</span>
            <span class="apk-meta-item"> Sans pub</span>
        </div>

        <a href="?dl=apk" class="btn-download" id="dlBtn">
            <span class="dl-arrow">⬇️</span> Télécharger l'APK
        </a>

        <div class="dl-progress" id="dlProgress">
            <div class="progress-bar"><div class="progress-fill" id="progressFill"></div></div>
            <div class="progress-label" id="progressLabel">Préparation du téléchargement…</div>
        </div>
    </div>

    <!-- Installation -->
    <div class="card">
        <div class="card-header">
            <div class="card-icon">📋</div>
            <div>
                <h2>Comment installer l'application</h2>
                <p>Suis ces étapes simples pour installer Quiz Ayiti sur ton téléphone</p>
            </div>
        </div>
        <div class="steps">
            <div class="step">
                <div class="step-num">1</div>
                <div class="step-body">
                    <h3>Télécharge le fichier APK</h3>
                    <p>Clique sur le bouton vert ci-dessus. Le téléchargement démarre automatiquement.</p>
                </div>
            </div>
            <div class="step">
                <div class="step-num">2</div>
                <div class="step-body">
                    <h3>Autorise les sources inconnues</h3>
                    <p>Va dans <strong>Paramètres → Sécurité</strong> et active <em>« Sources inconnues »</em> ou <em>« Installer des apps inconnues »</em>.</p>
                </div>
            </div>
            <div class="step">
                <div class="step-num">3</div>
                <div class="step-body">
                    <h3>Ouvre le fichier téléchargé</h3>
                    <p>Dans tes notifications ou dans le dossier <strong>Téléchargements</strong>, ouvre <code>Quiz Ayiti.apk</code>.</p>
                </div>
            </div>
            <div class="step">
                <div class="step-num">4</div>
                <div class="step-body">
                    <h3>Installe et lance l'app !</h3>
                    <p>Clique sur <strong>Installer</strong>, puis ouvre Quiz Ayiti et commence à réviser </p>
                </div>
            </div>
        </div>
    </div>

   
    

</main>

<!-- ===== FOOTER ===== -->
<footer class="footer">
    <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> — Créé par <strong>Di-Enilson Etienne</strong> &mdash; Application Android gratuite pour les élèves haïtiens</p>
</footer>

<script>
    // Menu hamburger
    document.getElementById('navToggle').addEventListener('click', () => {
        document.getElementById('navMenu').classList.toggle('show');
    });
    document.addEventListener('click', (e) => {
        if (!document.querySelector('.navbar').contains(e.target))
            document.getElementById('navMenu').classList.remove('show');
    });

    // Animation de progression lors du clic sur téléchargement
    document.getElementById('dlBtn').addEventListener('click', function(e) {
        const progress = document.getElementById('dlProgress');
        const fill     = document.getElementById('progressFill');
        const label    = document.getElementById('progressLabel');
        progress.classList.add('active');
        let pct = 0;
        const msgs = ['Connexion au serveur…','Préparation du fichier…','Téléchargement en cours…','Finalisation…'];
        const interval = setInterval(() => {
            pct = Math.min(pct + Math.random() * 12, 100);
            fill.style.width = pct + '%';
            label.textContent = msgs[Math.floor(pct / 25)] || 'Téléchargement en cours…';
            if (pct >= 100) {
                clearInterval(interval);
                label.textContent = ' Téléchargement terminé ! Ouvre le fichier pour installer.';
                fill.style.background = 'linear-gradient(90deg,#10b981,#34d399)';
            }
        }, 180);
    });
</script>
</body>
</html>