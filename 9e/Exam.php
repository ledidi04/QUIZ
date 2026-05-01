<?php
$pageTitle = 'Mode Examen - 9ème AF';
$classeActive = '9e';
$quizType = 'examen';
require_once __DIR__ . '/../includes/functions.php';
$basePath = rtrim(dirname(dirname($_SERVER['SCRIPT_NAME'])), '/');
$name = getStudentName();
require_once __DIR__ . '/quiz_template.php';