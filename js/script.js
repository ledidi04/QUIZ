// ===== GESTION COMMUNE (menu hamburger, validation formulaire, redirection) =====

document.addEventListener('DOMContentLoaded', () => {

    // --- Menu toggle mobile ---
    const navToggle = document.getElementById('navToggle');
    const navMenu = document.getElementById('navMenu');

    if (navToggle && navMenu) {
        navToggle.addEventListener('click', () => {
            navMenu.classList.toggle('show');
        });

        // Fermer le menu si on clique en dehors
        document.addEventListener('click', (e) => {
            if (!e.target.closest('.navbar')) {
                navMenu.classList.remove('show');
            }
        });
    }

    // --- Formulaire d'accueil ---
    const startForm = document.getElementById('startForm');
    if (startForm) {
        startForm.addEventListener('submit', (e) => {
            e.preventDefault();

            const nameInput = document.getElementById('studentName');
            const classSelect = document.getElementById('classSelect');
            const name = nameInput.value.trim();
            const classe = classSelect.value;

            if (!name) {
                nameInput.focus();
                alert('Veuillez entrer ton prénom ou pseudo.');
                return;
            }

            if (!classe) {
                classSelect.focus();
                alert('Veuillez choisir ta classe.');
                return;
            }

            // Stockage du nom dans sessionStorage (accessible depuis les autres pages)
            sessionStorage.setItem('studentName', name);
            sessionStorage.setItem('studentClass', classe);

            // Redirection vers la page de la classe choisie
            window.location.href = `${classe}/index.html`;
        });
    }

    // --- Affichage du message de bienvenue sur les pages quiz ---
    const welcomeMsg = document.getElementById('welcomeMessage');
    if (welcomeMsg) {
        const storedName = sessionStorage.getItem('studentName');
        const storedClass = sessionStorage.getItem('studentClass');
        if (storedName) {
            const classeAff = storedClass === '9e' ? '9ème AF' : 'NS4';
            welcomeMsg.textContent = `Bon travail, ${storedName} (${classeAff}) !`;
        } else {
            welcomeMsg.textContent = `Bienvenue !`;
        }
    }

});