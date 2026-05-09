<?php
$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <title>À propos — Quiz Ayiti & Di-Enilson Etienne</title>
    <meta name="description" content="Découvre Quiz Ayiti, la plateforme éducative haïtienne gratuite pour préparer les examens NS4 et 9ème AF, et son créateur Di-Enilson Etienne, développeur full-stack.">
    <meta name="robots" content="index, follow">
    <link rel="shortcut icon" href="<?= $basePath ?>/images/logo.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --blue:#002395; --red:#d21034; --gold:#f1c40f; --green:#10b981;
            --purple:#7c3aed; --orange:#f59e0b;
            --gray-50:#f8fafc; --gray-100:#f1f5f9; --gray-200:#e2e8f0;
            --gray-300:#cbd5e1; --gray-400:#94a3b8; --gray-500:#64748b;
            --gray-600:#475569; --gray-700:#334155; --gray-800:#1e293b;
            --gray-900:#0f172a; --white:#ffffff;
            --shadow-sm:0 1px 2px rgba(0,0,0,.05);
            --shadow-md:0 4px 6px rgba(0,0,0,.07);
            --shadow-lg:0 10px 25px rgba(0,0,0,.08);
            --radius:12px; --radius-lg:16px; --radius-xl:24px;
            --transition:0.2s cubic-bezier(.4,0,.2,1);
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
            /* Padding horizontal augmenté pour donner plus d'air */
            padding:0 1.5rem;
            height:70px;position:sticky;top:0;z-index:1000;
            border-bottom:1px solid var(--gray-200);box-shadow:var(--shadow-sm);
        }
        .nav-brand{display:flex;align-items:center;gap:.75rem;text-decoration:none;}
        .nav-brand img{height:44px;width:44px;object-fit:contain;border-radius:var(--radius);}
        .nav-brand-text{font-size:1.35rem;font-weight:800;color:var(--gray-900);}
        .nav-brand-text span{color:var(--red);}
        .nav-brand:hover .nav-brand-text{color:var(--blue);}
        
        /* MENU : gap augmenté pour espacer les éléments */
        .nav-menu{
            display:flex;list-style:none;
            gap: 0.35rem; /* Était 0.5rem, légèrement réduit pour desktop mais plus large sur mobile */
            align-items:center;
        }
        
        /* Liens du menu : padding horizontal légèrement réduit pour éviter le débordement */
        .nav-menu a{
            color:var(--gray-600);text-decoration:none;font-weight:500;font-size:.9rem;
            padding: 0.5rem 0.9rem; /* Était .6rem 1.1rem */
            border-radius:var(--radius);transition:all var(--transition);
            white-space: nowrap; /* Empêche le texte de passer à la ligne */
        }
        .nav-menu a:hover{color:var(--blue);background:#eff6ff;}
        .nav-menu a.active{color:var(--white);background:var(--blue);font-weight:600;}
        .nav-menu a.btn-apk{
            background:linear-gradient(135deg,var(--green),#059669);color:var(--white);
            font-weight:600;box-shadow:0 3px 10px rgba(16,185,129,.3);
            padding: 0.5rem 0.9rem; /* Uniformiser le padding */
        }
        .nav-menu a.btn-apk:hover{transform:translateY(-1px);box-shadow:0 5px 14px rgba(16,185,129,.4);}
        
        .nav-toggle{display:none;flex-direction:column;background:none;border:none;cursor:pointer;gap:5px;}
        .nav-toggle .bar{width:26px;height:2.5px;background:var(--gray-700);border-radius:2px;}

        /* ===== CONTENU ===== */
        .container{flex:1;width:100%;max-width:900px;margin:0 auto;padding:2.5rem 1.5rem;}

        /* ===== HERO SITE ===== */
        .hero-site{
            text-align:center;margin-bottom:3rem;
            background:linear-gradient(135deg,#eff6ff,#fdf4ff);
            border-radius:var(--radius-xl);padding:2.5rem 2rem;
            border:1px solid #ddd6fe;
        }
        .hero-site img.site-logo{
            width:110px;height:110px;object-fit:contain;
            margin-bottom:1.25rem;
            filter:drop-shadow(0 6px 16px rgba(0,0,0,.2));
            animation:floatLogo 3s ease-in-out infinite;
        }
        @keyframes floatLogo{
            0%,100%{transform:translateY(0);}
            50%{transform:translateY(-10px);}
        }
        .hero-site h1{font-size:clamp(1.8rem,5vw,2.6rem);font-weight:800;color:var(--gray-900);line-height:1.2;margin-bottom:.5rem;}
        .hero-site h1 .hl-blue{background:linear-gradient(135deg,var(--blue),#1e40af);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;}
        .hero-site h1 .hl-red{background:linear-gradient(135deg,var(--red),#e11d48);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;}
        .hero-site .tagline{color:var(--gray-500);font-size:1.05rem;margin-bottom:1.5rem;}
        .badges{display:flex;flex-wrap:wrap;justify-content:center;gap:.5rem;}
        .badge{display:inline-flex;align-items:center;gap:.4rem;padding:.4rem 1rem;border-radius:50px;font-size:.82rem;font-weight:600;}
        .badge-blue{background:#eff6ff;color:var(--blue);border:1px solid #bfdbfe;}
        .badge-green{background:#f0fdf4;color:#166534;border:1px solid #bbf7d0;}
        .badge-purple{background:#fdf4ff;color:var(--purple);border:1px solid #ddd6fe;}
        .badge-red{background:#fff1f2;color:var(--red);border:1px solid #fecdd3;}

        /* ===== CARD GENERALE ===== */
        .card{background:var(--white);border-radius:var(--radius-xl);padding:2rem;box-shadow:var(--shadow-lg);margin-bottom:1.5rem;border:1px solid var(--gray-100);}
        .card-header{display:flex;align-items:center;gap:.75rem;margin-bottom:1.5rem;padding-bottom:1rem;border-bottom:2px solid var(--gray-100);}
        .card-icon{font-size:1.5rem;}
        .card-header h2{font-size:1.15rem;font-weight:700;color:var(--gray-900);}
        .card-header p{font-size:.85rem;color:var(--gray-500);}

        /* ===== STATS ===== */
        .stats-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(130px,1fr));gap:1rem;}
        .stat-item{text-align:center;background:var(--gray-50);border-radius:var(--radius-lg);padding:1.25rem 1rem;border:1px solid var(--gray-100);}
        .stat-value{font-size:1.8rem;font-weight:800;color:var(--blue);display:block;}
        .stat-label{font-size:.8rem;color:var(--gray-500);font-weight:500;margin-top:.25rem;}

        /* ===== AUTEUR ===== */
        .author-section{display:grid;grid-template-columns:auto 1fr;gap:2rem;align-items:start;}
        .author-photo-wrap{position:relative;width:160px;flex-shrink:0;}
        .author-photo-wrap img{
            width:160px;height:160px;object-fit:cover;object-position:top;
            border-radius:50%;border:4px solid var(--blue);
            display:block;
            box-shadow:0 0 0 6px #bfdbfe, 0 8px 24px rgba(0,35,149,.2);
            animation:pulseAuthor 3s ease-in-out infinite;
        }
        @keyframes pulseAuthor{
            0%,100%{box-shadow:0 0 0 6px #bfdbfe,0 8px 24px rgba(0,35,149,.2);}
            50%{box-shadow:0 0 0 10px #ddd6fe,0 12px 32px rgba(124,58,237,.25);}
        }
        .author-status{
            position:absolute;bottom:6px;right:6px;
            width:22px;height:22px;background:var(--green);
            border-radius:50%;border:3px solid var(--white);
            animation:blink 2s ease-in-out infinite;
        }
        @keyframes blink{0%,100%{opacity:1;}50%{opacity:.4;}}
        .author-info h2{font-size:1.5rem;font-weight:800;color:var(--gray-900);margin-bottom:.25rem;}
        .author-role{display:inline-flex;align-items:center;gap:.4rem;background:linear-gradient(135deg,#eff6ff,#fdf4ff);color:var(--purple);font-weight:600;font-size:.85rem;padding:.4rem 1rem;border-radius:50px;border:1px solid #ddd6fe;margin-bottom:1rem;}
        .author-bio{color:var(--gray-600);font-size:.95rem;margin-bottom:1.25rem;line-height:1.8;}
        .skills-list{display:flex;flex-wrap:wrap;gap:.4rem;margin-bottom:1.25rem;}
        .skill-tag{background:var(--gray-100);color:var(--gray-700);padding:.3rem .75rem;border-radius:50px;font-size:.78rem;font-weight:600;border:1px solid var(--gray-200);}
        .author-links{display:flex;flex-wrap:wrap;gap:.5rem;}
        .author-link{display:inline-flex;align-items:center;gap:.4rem;padding:.5rem 1rem;border-radius:var(--radius);font-size:.85rem;font-weight:600;text-decoration:none;transition:all var(--transition);}
        .link-primary{background:var(--blue);color:var(--white);box-shadow:0 3px 10px rgba(0,35,149,.25);}
        .link-primary:hover{transform:translateY(-2px);box-shadow:0 5px 14px rgba(0,35,149,.35);}
        .link-gh{background:var(--gray-800);color:var(--white);}
        .link-gh:hover{background:var(--gray-900);transform:translateY(-2px);}
        .link-wa{background:#25d366;color:var(--white);}
        .link-wa:hover{background:#1ebe5d;transform:translateY(-2px);}
        .link-li{background:#0077b5;color:var(--white);}
        .link-li:hover{transform:translateY(-2px);}

        /* ===== MATIÈRES ===== */
        .subjects-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(160px,1fr));gap:.75rem;}
        .subject-item{display:flex;align-items:center;gap:.6rem;background:var(--gray-50);border:1px solid var(--gray-100);border-radius:var(--radius);padding:.75rem 1rem;font-size:.9rem;font-weight:500;color:var(--gray-700);}

        /* ===== FOOTER ===== */
        .footer{text-align:center;padding:1.5rem;font-size:.8rem;color:var(--gray-400);border-top:1px solid var(--gray-200);background:var(--white);}

        /* ===== RESPONSIVE ===== */
        @media(max-width:640px){
            .navbar{padding:0 1rem;}
            
            /* Menu mobile : gap plus grand pour espacer les liens verticaux */
            .nav-menu{
                display:none;position:absolute;top:70px;left:0;right:0;
                background:rgba(255,255,255,.98);flex-direction:column;
                padding:1rem;
                gap: 0.5rem; /* Espacement vertical entre les liens du menu hamburger */
                border-bottom:1px solid var(--gray-200);box-shadow:var(--shadow-md);
            }
            .nav-menu.show{display:flex;}
            .nav-toggle{display:flex;}
            
            /* En mobile, les liens prennent toute la largeur avec plus de padding */
            .nav-menu a{
                padding: 0.75rem 1rem; /* Plus d'espace tactile sur mobile */
                font-size: 0.95rem; /* Légèrement plus grand pour faciliter la lecture */
                width: 100%; /* Prend toute la largeur */
            }
            
            .author-section{grid-template-columns:1fr;justify-items:center;text-align:center;}
            .author-links{justify-content:center;}
            .skills-list{justify-content:center;}
            .author-photo-wrap{width:140px;}
            .author-photo-wrap img{width:140px;height:140px;}
        }
        
        /* Pour les écrans intermédiaires (tablettes) */
        @media(min-width:641px) and (max-width:900px){
            .nav-menu a{
                padding: 0.5rem 0.7rem;
                font-size: 0.85rem;
            }
            .nav-menu{gap: 0.25rem;}
        }
    </style>
</head>
<body>

<!-- ===== NAVBAR ===== -->
<nav class="navbar">
    <a href="<?= $basePath ?>/index.php" class="nav-brand">
        <img src="<?= $basePath ?>/images/logo.png" alt="Quiz Ayiti">
        <span class="nav-brand-text">Quiz<span>.</span>Ayiti</span>
    </a>
    <button class="nav-toggle" id="navToggle" aria-label="Menu">
        <span class="bar"></span><span class="bar"></span><span class="bar"></span>
    </button>
    <ul class="nav-menu" id="navMenu">
        <li><a href="<?= $basePath ?>/index.php"> Accueil</a></li>
        <li><a href="<?= $basePath ?>/9e/index.php"> 9ème AF</a></li>
        <li><a href="<?= $basePath ?>/ns4/index.php"> NS4</a></li>
        <li><a href="<?= $basePath ?>/about/index.php" > À propos</a></li>
        <li><a href="<?= $basePath ?>/download.php" > Télécharger l'app</a></li>
    </ul>
</nav>

<!-- ===== CONTENU ===== -->
<main class="container">

    <!-- Hero site -->
    <div class="hero-site">
        <img src="<?= $basePath ?>/images/logo.png" alt="Logo Quiz Ayiti" class="site-logo">
        <h1>À propos de <span class="hl-blue">Quiz</span> <span class="hl-red">Ayiti</span></h1>
        <p class="tagline">La plateforme éducative haïtienne — Apprendre en s'amusant 🇭🇹</p>
        <div class="badges">
            <span class="badge badge-blue"> 9ème AF & NS4</span>
            <span class="badge badge-green"> 100 % Gratuit</span>
            <span class="badge badge-purple"> Conforme MENFP</span>
           
        </div>
    </div>

    <!-- Statistiques -->
    <div class="card">
        <div class="card-header">
            <div class="card-icon">📊</div>
            <div>
                <h2>Quiz Ayiti en chiffres</h2>
                <p>Une plateforme construite pour les élèves haïtiens</p>
            </div>
        </div>
        <div class="stats-grid">
            <div class="stat-item"><span class="stat-value">4 000+</span><span class="stat-label">Questions</span></div>
            <div class="stat-item"><span class="stat-value">10+</span><span class="stat-label">Matières</span></div>
            <div class="stat-item"><span class="stat-value">2</span><span class="stat-label">Niveaux (9e & NS4)</span></div>
            <div class="stat-item"><span class="stat-value">100%</span><span class="stat-label">Gratuit</span></div>
        </div>
    </div>

    <!-- Mission -->
    <div class="card">
        <div class="card-header">
         
            <div>
                <h2>Notre mission</h2>
                <p>Pourquoi Quiz Ayiti existe?</p>
            </div>
        </div>
        <p style="color:var(--gray-600);font-size:.97rem;line-height:1.9;">
            <strong>Quiz Ayiti</strong> est une plateforme éducative 100 % gratuite, conçue pour aider les élèves haïtiens à 
            préparer leurs examens officiels du <strong>MENFP</strong>. En proposant des QCM interactifs, des exercices 
            de complétion et des examens chronométrés calqués sur les épreuves réelles, Quiz Ayiti permet à chaque élève — 
            qu'il soit en <strong>9ème Année Fondamentale</strong> ou en <strong>NS4 (Terminale)</strong> — de réviser 
            efficacement, même sans connexion continue. L'objectif : <em>apprendre en s'amusant</em>, 
            démocratiser l'accès à l'éducation de qualité, et soutenir la réussite scolaire en Haïti. 🇭🇹
        </p>
    </div>

    <!-- Auteur -->
    <div class="card">
        <div class="card-header">
            <div>
                <h2>Le créateur</h2>
                <p>L'esprit derrière Quiz Ayiti</p>
            </div>
        </div>
        <div class="author-section">
            <div class="author-photo-wrap">
                <img src="<?= $basePath ?>/images/auteur.jpeg" alt="Di-Enilson Etienne">
                <div class="author-status" title="Disponible"></div>
            </div>
            <div class="author-info">
                <h2>Di-Enilson Etienne</h2>
                <div class="author-role">💻 Développeur Full-Stack · Étudiant expert</div>
                <p class="author-bio">
                    Brillant, discipline exemplaire, travailleur acharné et prêt à coopérer sur des projets d'envergure.
                    Spécialisé en <strong>développement sécurisé</strong>, <strong>réseaux</strong> et <strong>hacking éthique</strong> 
                    avec une soif d'apprendre et d'innover. C'est avec cette passion qu'il a créé <strong>Quiz Ayiti</strong> —
                    pour rendre l'éducation accessible et interactive à tous les élèves haïtiens.
                </p>
                <div class="skills-list">
                    <span class="skill-tag">PHP 8</span>
                    <span class="skill-tag">Python</span>
                    <span class="skill-tag">Java</span>
                    <span class="skill-tag">Node.js</span>
                    <span class="skill-tag">React</span>
                    <span class="skill-tag">MySQL</span>
                    <span class="skill-tag">Cybersécurité</span>
                    <span class="skill-tag">CCNP</span>
                    <span class="skill-tag">Kali Linux</span>
                    <span class="skill-tag">Flutter</span>
                </div>
                <div class="author-links">
                    <a href="https://enilsonetienne.me" target="_blank" class="author-link "> Portfolio</a>
                    <a href="https://github.com/ledidi04" target="_blank" class="author-link "> GitHub</a>
                    <a href="https://wa.me/50942682839" target="_blank" class="author-link "> WhatsApp</a>
                    <a href="https://www.linkedin.com/in/di-enilson-etienne/" target="_blank" class="author-link ">🔗 LinkedIn</a>
                </div>
            </div>
        </div>
    </div>

</main>

<!-- ===== FOOTER ===== -->
<footer class="footer">
    <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> — Créé par <strong>Di-Enilson Etienne</strong> &mdash; Plateforme éducative haïtienne · Gratuit pour tous</p>
</footer>

<script>
    document.getElementById('navToggle').addEventListener('click', () => {
        document.getElementById('navMenu').classList.toggle('show');
    });
    document.addEventListener('click', (e) => {
        if (!document.querySelector('.navbar').contains(e.target))
            document.getElementById('navMenu').classList.remove('show');
    });
</script>
</body>
</html>