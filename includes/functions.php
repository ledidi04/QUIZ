<?php
/**
 * Fonctions utilitaires pour le site
 */

/**
 * Nettoie une chaîne pour éviter les failles XSS
 */
function e(?string $value): string {
    return htmlspecialchars($value ?? '', ENT_QUOTES, 'UTF-8');
}

/**
 * Récupère le nom de l'élève depuis la session
 */
function getStudentName(): ?string {
    return $_SESSION['student_name'] ?? null;
}

/**
 * Récupère la classe choisie depuis la session
 */
function getStudentClass(): ?string {
    return $_SESSION['student_class'] ?? null;
}

/**
 * Retourne le libellé complet d'une classe
 */
function getClassLabel(?string $code): string {
    return match($code) {
        '9e'  => '9ème Année Fondamentale',
        'ns4' => 'NS4 (Secondaire IV)',
        default => 'Classe inconnue'
    };
}