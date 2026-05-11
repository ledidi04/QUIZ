<?php
if (!isset($basePath)) {
    $basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <link rel="icon" href="../images/logo.png" type="image/png">
    <title><?= $pageTitle ?> - Quiz Ayiti</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --blue: #002395; --red: #d21034; --gold: #f1c40f; --green: #10b981;
            --purple: #7c3aed;
            --gray-50: #f8fafc; --gray-100: #f1f5f9; --gray-200: #e2e8f0;
            --gray-300: #cbd5e1; --gray-400: #94a3b8; --gray-500: #64748b;
            --gray-600: #475569; --gray-700: #334155; --gray-800: #1e293b;
            --gray-900: #0f172a; --white: #ffffff;
            --shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
            --shadow-md: 0 4px 6px rgba(0,0,0,0.07);
            --shadow-lg: 0 10px 25px rgba(0,0,0,0.08);
            --radius: 12px; --radius-lg: 16px; --radius-xl: 24px;
            --transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html { font-size: 16px; scroll-behavior: smooth; -webkit-font-smoothing: antialiased; }
        body {
            font-family: 'Inter', sans-serif; line-height: 1.7; color: var(--gray-800);
            background: linear-gradient(180deg, #fdf4ff 0%, var(--gray-50) 100%);
            display: flex; flex-direction: column; min-height: 100vh;
        }

        /* ===== NAVBAR UNIFIÉE ===== */
        .navbar {
            display: flex; justify-content: space-between; align-items: center;
            background: rgba(255,255,255,0.95); backdrop-filter: blur(10px);
            padding: 0 1.5rem;
            height: 70px; position: sticky; top: 0; z-index: 1000;
            border-bottom: 1px solid var(--gray-200); box-shadow: var(--shadow-sm);
        }
        .nav-brand { display: flex; align-items: center; gap: .75rem; text-decoration: none; }
        .nav-brand img { height: 44px; width: 44px; object-fit: contain; border-radius: var(--radius); }
        .nav-brand-text { font-size: 1.35rem; font-weight: 800; color: var(--gray-900); }
        .nav-brand-text span { color: var(--red); }
        .nav-brand:hover .nav-brand-text { color: var(--blue); }

        .nav-menu {
            display: flex; list-style: none;
            gap: 0.35rem;
            align-items: center;
        }
        .nav-menu a {
            color: var(--gray-600); text-decoration: none; font-weight: 500; font-size: .9rem;
            padding: 0.5rem 0.9rem;
            border-radius: var(--radius); transition: all var(--transition);
            white-space: nowrap;
        }
        .nav-menu a:hover { color: var(--blue); background: #eff6ff; }
        .nav-menu a.active { color: var(--white); background: var(--purple); font-weight: 600; }
        .nav-menu a.btn-apk {
            background: linear-gradient(135deg, var(--green), #059669); color: var(--white);
            font-weight: 600; box-shadow: 0 3px 10px rgba(16,185,129,.3);
            padding: 0.5rem 0.9rem;
        }
        .nav-menu a.btn-apk:hover { transform: translateY(-1px); box-shadow: 0 5px 14px rgba(16,185,129,.4); }

        .nav-toggle { display: none; flex-direction: column; background: none; border: none; cursor: pointer; gap: 5px; }
        .nav-toggle .bar { width: 26px; height: 2.5px; background: var(--gray-700); border-radius: 2px; }

        .container { flex: 1; width: 100%; max-width: 800px; margin: 0 auto; padding: 2rem 1.5rem; }
        .card { background: var(--white); border-radius: var(--radius-xl); padding: 2rem; box-shadow: 0 10px 25px rgba(0,0,0,0.07); margin-bottom: 1.5rem; border: 1px solid var(--gray-100); }
        .card-header { display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.5rem; padding-bottom: 1rem; border-bottom: 2px solid var(--gray-100); }
        .card-header .card-icon { width: 44px; height: 44px; background: linear-gradient(135deg, #fdf4ff, #ede9fe); border-radius: var(--radius); display: flex; align-items: center; justify-content: center; font-size: 1.3rem; }
        .card-header h2 { font-size: 1.3rem; font-weight: 700; color: var(--gray-900); margin: 0; }
        
        /* Matières NS4 */
        .subject-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(140px, 1fr)); gap: 0.85rem; }
        .subject-btn { display: flex; flex-direction: column; align-items: center; gap: 0.6rem; padding: 1.5rem 1rem; background: var(--gray-50); border: 2px solid var(--gray-200); border-radius: var(--radius-lg); cursor: pointer; transition: all var(--transition); text-align: center; font-family: inherit; }
        .subject-btn:hover { border-color: var(--purple); background: #fdf4ff; transform: translateY(-3px); box-shadow: 0 10px 25px rgba(124,58,237,0.12); }
        .subject-btn.active { border-color: var(--purple); background: linear-gradient(135deg, #fdf4ff, #ede9fe); }
        .subject-btn .subject-icon { font-size: 2rem; }
        .subject-btn .subject-name { font-weight: 600; font-size: 0.9rem; color: var(--gray-700); }
        
        /* Quiz */
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
        .completion-input { width: 100%; padding: 0.9rem 1rem; border: 2px solid var(--gray-200); border-radius: var(--radius); font-size: 1rem; font-family: inherit; }
        .completion-input:focus { border-color: var(--purple); outline: none; box-shadow: 0 0 0 4px rgba(124,58,237,0.1); }
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

        /* ===== RESPONSIVE ===== */
        @media (max-width: 640px) {
            .navbar { padding: 0 1rem; }
            .nav-menu {
                display: none; position: absolute; top: 70px; left: 0; right: 0;
                background: rgba(255,255,255,.98); flex-direction: column;
                padding: 1rem;
                gap: 0.5rem;
                border-bottom: 1px solid var(--gray-200); box-shadow: var(--shadow-md);
            }
            .nav-menu.show { display: flex; }
            .nav-toggle { display: flex; }
            .nav-menu a {
                padding: 0.75rem 1rem;
                font-size: 0.95rem;
                width: 100%;
            }
            .container { padding: 1.25rem 1rem; }
            .card { padding: 1.25rem; }
        }
        @media (min-width: 641px) and (max-width: 900px) {
            .nav-menu a { padding: 0.5rem 0.7rem; font-size: 0.85rem; }
            .nav-menu { gap: 0.25rem; }
        }
    </style>
</head>
<body>
    <!-- ===== NAVBAR UNIFIÉE ===== -->
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
            <li><a href="<?= $basePath ?>/9e/index.php">9ème AF</a></li>
            <li><a href="<?= $basePath ?>/ns4/index.php" >NS4</a></li>
            <li><a href="<?= $basePath ?>/about/index.php">À propos</a></li>
            <li><a href="<?= $basePath ?>/download.php" >Télécharger l'app</a></li>
        </ul>
    </nav>

    <main class="container">
        <div class="card">
            <div class="card-header">
                <div class="card-icon">⏱️</div>
                <div><h2><?= $pageTitle ?></h2></div>
            </div>

            <!-- Matières NS4 -->
            <div class="subject-grid" id="subjectGrid">
                <button class="subject-btn" data-matiere="philosophie"><span class="subject-icon">📖</span><span class="subject-name">Philosophie</span></button>
                <button class="subject-btn" data-matiere="maths"><span class="subject-icon">➗</span><span class="subject-name">Mathématiques</span></button>
                <button class="subject-btn" data-matiere="physique"><span class="subject-icon">⚡</span><span class="subject-name">Physique</span></button>
                <button class="subject-btn" data-matiere="chimie"><span class="subject-icon">🧪</span><span class="subject-name">Chimie</span></button>
                <button class="subject-btn" data-matiere="svt"><span class="subject-icon">🌿</span><span class="subject-name">SVT</span></button>
                <button class="subject-btn" data-matiere="histoire_geo"><span class="subject-icon">🗺️</span><span class="subject-name">Histoire-Géo</span></button>
                <button class="subject-btn" data-matiere="anglais"><span class="subject-icon">🇬🇧</span><span class="subject-name">Anglais</span></button>
            </div>

            <div id="quizContainer" style="margin-top:1.5rem;"></div>
        </div>

        <a href="<?= $basePath ?>/ns4/index.php" class="btn-back">⬅️ Retour aux exercices NS4</a>
    </main>

    <footer class="footer">
        <p>&copy; <?= date('Y') ?> <strong>Quiz Ayiti</strong> &mdash; NS4 — Programmes officiels MENFP</p>
    </footer>

    <script>
        const API_URL   = '<?= $basePath ?>/api/questions.php';
        const CLASSE    = 'ns4';
        const QUIZ_TYPE = '<?= $quizType ?? "entrainement" ?>';

        /**
         * Convertit les caractères mathématiques Unicode en HTML lisible.
         */
        function formatMath(text) {
            if (!text) return text;

            const REPLACEMENTS = [
                ['√', '&radic;'], ['∫', '&int;'], ['∞', '&infin;'],
                ['≈', '&asymp;'], ['≠', '&ne;'], ['≤', '&le;'],
                ['≥', '&ge;'], ['×', '&times;'], ['·', '&middot;'],
                ['°', '&deg;'], ['→', '&rarr;'], ['←', '&larr;'],
                ['↔', '&harr;'], ['⇒', '&rArr;'], ['⇔', '&hArr;'],
                ['Δ', '&Delta;'], ['π', '&pi;'], ['Π', '&Pi;'],
                ['σ', '&sigma;'], ['Σ', '&Sigma;'], ['ε', '&epsilon;'],
                ['α', '&alpha;'], ['β', '&beta;'], ['γ', '&gamma;'],
                ['θ', '&theta;'], ['λ', '&lambda;'], ['μ', '&mu;'],
                ['ω', '&omega;'], ['Ω', '&Omega;'], ['ρ', '&rho;'],
                ['φ', '&phi;'], ['δ', '&delta;'],
                ['ℝ', '&#8477;'], ['ℕ', '&#8469;'], ['ℤ', '&#8484;'],
                ['ℚ', '&#8474;'], ['ℂ', '&#8450;'], ['∅', '&empty;'],
                ['∈', '&isin;'], ['∉', '&notin;'], ['⊂', '&sub;'],
                ['⊆', '&sube;'], ['∪', '&cup;'], ['∩', '&cap;'],
                ['∀', '&forall;'], ['∃', '&exist;'],
                ['⁰', '<sup>0</sup>'], ['¹', '<sup>1</sup>'], ['²', '<sup>2</sup>'],
                ['³', '<sup>3</sup>'], ['⁴', '<sup>4</sup>'], ['⁵', '<sup>5</sup>'],
                ['⁶', '<sup>6</sup>'], ['⁷', '<sup>7</sup>'], ['⁸', '<sup>8</sup>'],
                ['⁹', '<sup>9</sup>'], ['ⁿ', '<sup>n</sup>'], ['⁺', '<sup>+</sup>'],
                ['⁻', '<sup>-</sup>'], ['ˣ', '<sup>x</sup>'],
                ['₀', '<sub>0</sub>'], ['₁', '<sub>1</sub>'], ['₂', '<sub>2</sub>'],
                ['₃', '<sub>3</sub>'], ['₄', '<sub>4</sub>'], ['₅', '<sub>5</sub>'],
                ['₆', '<sub>6</sub>'], ['₇', '<sub>7</sub>'], ['₈', '<sub>8</sub>'],
                ['₉', '<sub>9</sub>'], ['ₙ', '<sub>n</sub>'], ['ₓ', '<sub>x</sub>'],
                ['₊', '<sub>+</sub>'], ['₋', '<sub>-</sub>'],
                ['½', '&frac12;'], ['⅓', '&frac13;'], ['¼', '&frac14;'],
                ['¾', '&frac34;'],
            ];

            for (const [from, to] of REPLACEMENTS) {
                text = text.split(from).join(to);
            }

            text = text.replace(/<\/sup><sup>/g, '');
            text = text.replace(/<\/sub><sub>/g, '');

            return text;
        }

        let currentQuestions = [], currentIndex = 0, score = 0, userAnswers = [];
        let timerInterval = null, timeLeft = 0, examStarted = false;

        document.getElementById('navToggle').addEventListener('click', () => document.getElementById('navMenu').classList.toggle('show'));
        document.addEventListener('click', e => { if (!document.querySelector('.navbar').contains(e.target)) document.getElementById('navMenu').classList.remove('show'); });

        document.querySelectorAll('.subject-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                document.querySelectorAll('.subject-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                loadQuiz(this.dataset.matiere);
            });
        });

        async function loadQuiz(matiere) {
            const container = document.getElementById('quizContainer');
            container.innerHTML = '<p style="text-align:center;">⏳ Chargement...</p>';
            let limit = (QUIZ_TYPE === 'examen') ? 60 : 20;
            let url = `${API_URL}?classe=${CLASSE}&matiere=${matiere}&random=true&limit=${limit}`;
            if (QUIZ_TYPE !== 'examen') url += `&type=${QUIZ_TYPE}`;
            try {
                const r = await fetch(url);
                const d = await r.json();
                if (d.error) throw new Error(d.error);
                currentQuestions = d.questions || [];
                currentIndex = 0; score = 0; userAnswers = [];
                if (currentQuestions.length === 0) { container.innerHTML = '<p style="text-align:center;">⚠️ Aucune question disponible.</p>'; return; }
                if (QUIZ_TYPE === 'examen') { timeLeft = 60 * 60; examStarted = true; startTimer(); }
                renderQuestion();
            } catch(e) { container.innerHTML = `<p style="color:#dc3545;">Erreur : ${e.message}</p>`; }
        }

        function startTimer() {
            if (timerInterval) clearInterval(timerInterval);
            updateTimerDisplay();
            timerInterval = setInterval(() => { timeLeft--; updateTimerDisplay(); if (timeLeft <= 0) { clearInterval(timerInterval); showScore(); } }, 1000);
        }

        function updateTimerDisplay() {
            let el = document.getElementById('examTimer');
            if (!el) {
                el = document.createElement('div');
                el.id = 'examTimer';
                el.style.cssText = 'text-align:center;font-size:1.2rem;font-weight:700;color:var(--red);margin-bottom:1rem;padding:0.75rem;background:#fff1f2;border-radius:var(--radius);border:2px solid #fecdd3;';
                document.getElementById('quizContainer').prepend(el);
            }
            el.textContent = `⏱️ Temps restant : ${Math.floor(timeLeft/60)}:${(timeLeft%60).toString().padStart(2,'0')}`;
        }

        function renderQuestion() {
            const c = document.getElementById('quizContainer');
            if (currentIndex >= currentQuestions.length) { if (timerInterval) clearInterval(timerInterval); showScore(); return; }
            const q = currentQuestions[currentIndex];
            const pct = (currentIndex / currentQuestions.length) * 100;
            let h = `<div class="question-progress"><span>${currentIndex+1}/${currentQuestions.length}</span><div class="progress-bar"><div class="progress-fill" style="width:${pct}%"></div></div></div>`;
            h += `<p class="question-text">${formatMath(q.enonce)}</p>`;
            if (q.type === 'qcm' || !q.type || q.type !== 'completion') {
                (q.options||[]).forEach((o,i) => h += `<button class="option-btn" data-correct="${o.correct}">${String.fromCharCode(65+i)}. ${formatMath(o.texte)}</button>`);
            } else {
                h += `<input class="completion-input" id="compInput" placeholder="Ta réponse..."><button class="btn-next" id="compBtn" style="margin-top:0.75rem;">Valider</button><div id="compFb" style="margin-top:0.5rem;"></div>`;
            }
            c.innerHTML = h;
            if (QUIZ_TYPE === 'examen' && examStarted) updateTimerDisplay();

            document.querySelectorAll('.option-btn').forEach(b => b.addEventListener('click', function(){
                document.querySelectorAll('.option-btn').forEach(x => { x.disabled = true; if(x.dataset.correct==='true') x.classList.add('correct'); });
                if(this.dataset.correct!=='true') this.classList.add('wrong');
                const ok = this.dataset.correct === 'true';
                userAnswers.push({ question: q.enonce, correct: ok });
                handleAnswer(q, ok);
            }));
            const compBtn = document.getElementById('compBtn');
            if(compBtn) compBtn.addEventListener('click', ()=>{
                const inp = document.getElementById('compInput'); if (!inp.value.trim()) return;
                inp.disabled = true; compBtn.disabled = true;
                const att = (q.reponse_attendue||'').split('|').map(s=>s.trim().toLowerCase());
                const user = (inp.value||'').trim().toLowerCase();
                const ok = att.some(a=>user.includes(a)||a.includes(user));
                document.getElementById('compFb').innerHTML = ok ? '<p style="color:#28a745;font-weight:600;">✅ Correct !</p>' : `<p style="color:#dc3545;font-weight:600;">❌ Bonne réponse : <em>${formatMath(q.reponse_attendue)}</em></p>`;
                userAnswers.push({ question: q.enonce, correct: ok });
                handleAnswer(q, ok);
            });
        }

        function handleAnswer(q, ok) {
            if(ok) score++;
            if(q.explication) { const d = document.createElement('div'); d.className='explication'; d.innerHTML='<strong>💡 Explication :</strong> '+formatMath(q.explication); document.getElementById('quizContainer').appendChild(d); }
            const btn = document.createElement('button'); btn.className='btn-next';
            btn.textContent = currentIndex < currentQuestions.length-1 ? '⏭️ Suivant' : '🎯 Voir le résultat';
            btn.addEventListener('click', ()=>{ currentIndex++; renderQuestion(); document.getElementById('quizContainer').scrollIntoView({behavior:'smooth'}); });
            document.getElementById('quizContainer').appendChild(btn);
            setTimeout(()=>btn.scrollIntoView({behavior:'smooth',block:'center'}), 150);
        }

        function showScore() {
            if (timerInterval) clearInterval(timerInterval);
            const pct = Math.round((score/currentQuestions.length)*100);
            const emoji = pct>=90?'🏆':pct>=70?'👏':pct>=50?'💪':'📚';
            const msg = pct>=90?'Excellent !':pct>=70?'Très bien !':pct>=50?'Continue !':'Révise encore !';
            let h = `<div class="score-final"><div class="score-emoji">${emoji}</div><div class="score-circle"><span class="score-number">${score}</span><span class="score-total">/${currentQuestions.length}</span></div><div class="score-percent">${pct}%</div><p class="score-message">${msg}</p><button class="btn-next" onclick="location.reload()">🔄 Recommencer</button><a href="<?= $basePath ?>/ns4/index.php" class="btn-back" style="margin-top:0.5rem;">⬅️ Retour aux exercices</a></div>`;
            if (userAnswers.length > 0) {
                h += `<div style="margin-top:1.5rem;"><h3 style="text-align:center;margin-bottom:1rem;">📋 Résumé</h3><table class="summary-table"><thead><tr><th>#</th><th>Question</th><th>Résultat</th></tr></thead><tbody>`;
                userAnswers.forEach((a,i) => h += `<tr class="${a.correct?'row-correct':'row-wrong'}"><td style="text-align:center;">${i+1}</td><td>${a.question.length>60?a.question.substring(0,60)+'...':a.question}</td><td style="text-align:center;">${a.correct?'✅':'❌'}</td></tr>`);
                h += `</tbody></table></div>`;
            }
            document.getElementById('quizContainer').innerHTML = h;
            document.getElementById('quizContainer').scrollIntoView({behavior:'smooth'});
        }
    </script>
</body>
</html>