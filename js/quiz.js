/**
 * Quiz Ayiti - Moteur de quiz interactif
 * Compatible avec tous les types d'exercices : QCM, V/F, completion, appariement
 * Version 2.0 - Design moderne
 */
(function() {
    'use strict';

    // ═══════════════════════════════════════
    // CONFIGURATION
    // ═══════════════════════════════════════
    const config = window.QUIZ_CONFIG || {};
    const API_URL = config.apiUrl || '/quiz/api/questions.php';
    const CLASSE = config.classe || '9e';

    let currentQuestions = [];
    let currentIndex = 0;
    let score = 0;
    let currentMatiere = '';

    // ═══════════════════════════════════════
    // ÉLÉMENTS DOM
    // ═══════════════════════════════════════
    const subjectBtns = document.querySelectorAll('.subject-btn');
    const quizContainer = document.getElementById('quizContainer');

    // ═══════════════════════════════════════
    // SÉLECTION D'UNE MATIÈRE
    // ═══════════════════════════════════════
    if (subjectBtns.length > 0) {
        subjectBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                // Retirer la classe active de tous les boutons
                subjectBtns.forEach(b => b.classList.remove('active'));
                // Ajouter la classe active au bouton cliqué
                this.classList.add('active');

                // Récupérer la matière sélectionnée
                currentMatiere = this.dataset.matiere;

                // Charger le quiz
                loadQuiz(currentMatiere);
            });
        });
    }

    /**
     * Charge les questions depuis l'API
     */
    // Dans quiz.js, remplace la fonction loadQuiz() par celle-ci :

    async function loadQuiz(matiereParam) {
        const matiere = matiereParam || (typeof getSelectedMatiere === 'function' ? getSelectedMatiere() : '');
        const type = typeof getSelectedType === 'function' ? getSelectedType() : '';

        if (!matiere) return;
        if (!quizContainer) return;

        quizContainer.innerHTML = `<div style="text-align:center;padding:2rem;"><span style="font-size:2rem;">⏳</span><p>Chargement...</p></div>`;

        // Construire l'URL avec le type
        let url = `${API_URL}?classe=${encodeURIComponent(CLASSE)}&matiere=${encodeURIComponent(matiere)}`;
        if (type && type !== 'examen') {
            url += `&type=${encodeURIComponent(type)}`; // type = qcm, vf, completion, appariement
        }
        url += '&random=true'; // Toujours aléatoire pour varier les questions

        if (type === 'examen') {
            url += '&limit=60'; // 60 questions pour le mode examen
        }

        console.log('Chargement:', url);

        try {
            const response = await fetch(url);
            if (!response.ok) throw new Error(`HTTP ${response.status}`);
            const data = await response.json();
            if (data.error) throw new Error(data.error);

            currentQuestions = data.questions || [];
            currentIndex = 0;
            score = 0;

            if (currentQuestions.length === 0) {
                quizContainer.innerHTML = `<p>Aucune question pour ${matiere} (type: ${type})</p>`;
                return;
            }

            renderQuestion();
        } catch (err) {
            quizContainer.innerHTML = `<p>Erreur : ${err.message}</p>`;
            console.error(err);
        }
    }

    /**
     * Affiche la question courante
     */
    function renderQuestion() {
        if (!quizContainer) return;

        // Si plus de questions, afficher le score final
        if (currentIndex >= currentQuestions.length) {
            showFinalScore();
            return;
        }

        const q = currentQuestions[currentIndex];
        const progress = ((currentIndex) / currentQuestions.length) * 100;

        let html = '<div class="question-block">';

        // Barre de progression
        html += `
      <div class="question-progress">
        <span>Question ${currentIndex + 1}/${currentQuestions.length}</span>
        <div class="progress-bar">
          <div class="progress-fill" style="width: ${progress}%"></div>
        </div>
      </div>
    `;

        // Énoncé
        html += `<p class="question-text">${q.enonce}</p>`;

        // Affichage selon le type
        switch (q.type) {
            case 'qcm':
            case 'vf':
                html += renderOptions(q);
                break;
            case 'completion':
                html += renderCompletion(q);
                break;
            case 'appariement':
                html += renderAppariement(q);
                break;
            default:
                html += renderOptions(q);
        }

        html += '</div>';
        quizContainer.innerHTML = html;

        // Attacher les événements
        attachEvents(q);
    }

    /**
     * Affiche les options pour QCM / Vrai-Faux
     */
    function renderOptions(q) {
        if (!q.options || q.options.length === 0) {
            return '<p style="color:#94a3b8;">Aucune option disponible.</p>';
        }

        // Mélanger les options pour éviter la mémorisation
        const options = [...q.options].sort(() => Math.random() - 0.5);

        return options
            .map((opt, idx) => `
        <button class="option-btn" 
                data-correct="${opt.correct}" 
                data-option-id="${opt.id}"
                data-index="${idx}">
          ${String.fromCharCode(65 + idx)}. ${opt.texte}
        </button>
      `)
            .join('');
    }

    /**
     * Affiche un champ texte pour les questions à compléter
     */
    function renderCompletion(q) {
        return `
      <input type="text" 
             id="completionInput" 
             class="completion-input" 
             placeholder="Tape ta réponse ici..."
             autocomplete="off">
      <div id="completionFeedback" style="margin-top: 0.5rem;"></div>
    `;
    }

    /**
     * Affiche un exercice d'appariement (simplifié)
     */
    function renderAppariement(q) {
        if (!q.options || q.options.length === 0) {
            return '<p style="color:#94a3b8;">Aucune option disponible.</p>';
        }
        return q.options
            .map(opt => `
        <button class="option-btn" 
                data-correct="${opt.correct}" 
                data-option-id="${opt.id}">
          ${opt.texte}
        </button>
      `)
            .join('');
    }

    /**
     * Attache les événements de réponse
     */
    function attachEvents(q) {
        // QCM / VF / Appariement
        const optionBtns = document.querySelectorAll('.option-btn');

        if (optionBtns.length > 0) {
            optionBtns.forEach(btn => {
                btn.addEventListener('click', function() {
                    // Empêcher les doubles clics
                    if (this.disabled) return;

                    const isCorrect = this.dataset.correct === 'true';

                    // Désactiver tous les boutons
                    optionBtns.forEach(b => b.disabled = true);

                    // Marquer visuellement
                    optionBtns.forEach(b => {
                        if (b.dataset.correct === 'true') {
                            b.classList.add('correct');
                        }
                    });

                    if (!isCorrect) {
                        this.classList.add('wrong');
                    }

                    handleAnswer(q, isCorrect);
                });
            });
        }

        // Completion
        const completionInput = document.getElementById('completionInput');
        if (completionInput) {
            completionInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    e.preventDefault();
                    checkCompletion(q);
                }
            });

            // Ajouter un bouton de validation
            const feedback = document.getElementById('completionFeedback');
            if (feedback) {
                const submitBtn = document.createElement('button');
                submitBtn.className = 'btn-next';
                submitBtn.textContent = '✅ Valider';
                submitBtn.style.marginTop = '0.75rem';
                submitBtn.addEventListener('click', () => checkCompletion(q));
                feedback.parentNode.insertBefore(submitBtn, feedback.nextSibling);
            }
        }
    }

    /**
     * Vérifie une réponse de type completion
     */
    function checkCompletion(q) {
        const input = document.getElementById('completionInput');
        if (!input || input.disabled) return;

        input.disabled = true;

        const reponsesAttendues = (q.reponse_attendue || '')
            .split('|')
            .map(s => s.trim().toLowerCase());
        const reponseUser = (input.value || '').trim().toLowerCase();
        const isCorrect = reponsesAttendues.some(r => reponseUser.includes(r) || r.includes(reponseUser));

        // Feedback visuel
        const feedback = document.getElementById('completionFeedback');
        if (feedback) {
            if (isCorrect) {
                feedback.innerHTML = '<p style="color:#28a745;font-weight:600;">✅ Bonne réponse !</p>';
            } else {
                feedback.innerHTML = `<p style="color:#dc3545;font-weight:600;">❌ Réponse incorrecte. La bonne réponse est : <strong>${q.reponse_attendue}</strong></p>`;
            }
        }

        // Désactiver le bouton de validation
        const submitBtns = document.querySelectorAll('.btn-next');
        submitBtns.forEach(b => b.disabled = true);

        handleAnswer(q, isCorrect);
    }

    /**
     * Gère une réponse (correcte ou non) et affiche la suite
     */
    function handleAnswer(q, isCorrect) {
        if (isCorrect) {
            score++;
        }

        // Afficher l'explication
        if (q.explication) {
            const explDiv = document.createElement('div');
            explDiv.className = 'explication';
            explDiv.innerHTML = `<strong>💡 Explication :</strong> ${q.explication}`;
            quizContainer.appendChild(explDiv);
        }

        // Bouton "Suivant" ou "Résultat"
        const nextBtn = document.createElement('button');
        nextBtn.className = 'btn-next';
        nextBtn.textContent = currentIndex < currentQuestions.length - 1 ?
            '⏭️ Question suivante' :
            '🎯 Voir le résultat';

        nextBtn.addEventListener('click', () => {
            currentIndex++;
            renderQuestion();
            // Scroll en haut du quiz
            quizContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
        });

        quizContainer.appendChild(nextBtn);

        // Scroll automatique vers le bouton suivant
        setTimeout(() => {
            nextBtn.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }, 100);
    }

    /**
     * Affiche le score final
     */
    function showFinalScore() {
        const pourcentage = Math.round((score / currentQuestions.length) * 100);

        let emoji, message;
        if (pourcentage >= 90) {
            emoji = '🏆';
            message = 'Excellent travail ! Tu maîtrises parfaitement cette matière.';
        } else if (pourcentage >= 70) {
            emoji = '👏';
            message = 'Très bien ! Continue comme ça.';
        } else if (pourcentage >= 50) {
            emoji = '💪';
            message = 'Pas mal ! Mais tu peux encore t\'améliorer.';
        } else {
            emoji = '📚';
            message = 'Continue à réviser, tu vas progresser !';
        }

        quizContainer.innerHTML = `
      <div class="score-final">
        <div class="score-emoji">${emoji}</div>
        <div class="score-circle">
          <span class="score-number">${score}</span>
          <span class="score-total">/ ${currentQuestions.length}</span>
        </div>
        <div class="score-percent">${pourcentage}%</div>
        <p class="score-message">${message}</p>
        <button class="btn-next" onclick="location.reload()" style="max-width:300px;margin:0 auto;">
          🔄 Recommencer
        </button>
      </div>
    `;

        // Scroll vers le résultat
        quizContainer.scrollIntoView({ behavior: 'smooth', block: 'center' });
    }

    /**
     * Mélange un tableau (algorithme Fisher-Yates)
     */
    function shuffleArray(array) {
        const arr = [...array];
        for (let i = arr.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [arr[i], arr[j]] = [arr[j], arr[i]];
        }
        return arr;
    }

})();