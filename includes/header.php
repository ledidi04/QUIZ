<?php
// Démarre la session si pas déjà fait
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
    <meta name="description" content="Plateforme de quiz éducatif pour les élèves de 9ème année et NS4 en Haïti">
    <title>Quiz Ayiti - <?= $pageTitle ?? '9ème & NS4' ?></title>
    <link rel="stylesheet" href="/assets/css/style.css">
</head>
<body>
    <nav class="navbar" role="navigation" aria-label="Navigation principale">
        <div class="nav-brand">Quiz Ayiti</div>
        <button class="nav-toggle" id="navToggle" aria-label="Menu">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </button>
        <ul class="nav-menu" id="navMenu">
            <li><a href="/index.php" <?= basename($_SERVER['PHP_SELF']) === 'index.php' && !isset($classeActive) ? 'class="active"' : '' ?>>Accueil</a></li>
            <li><a href="/9e/index.php" <?= ($classeActive ?? '') === '9e' ? 'class="active"' : '' ?>>9ème AF</a></li>
            <li><a href="/ns4/index.php" <?= ($classeActive ?? '') === 'ns4' ? 'class="active"' : '' ?>>NS4</a></li>
        </ul>
    </nav>
    <main class="container">