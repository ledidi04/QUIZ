<?php
$pageTitle = 'Quiz NS4';
$classeActive = 'ns4';
require_once __DIR__ . '/../includes/functions.php';
require_once __DIR__ . '/../includes/header.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_SESSION['student_name']  = trim($_POST['student_name'] ?? '');
    $_SESSION['student_class'] = $_POST['student_class'] ?? 'ns4';
}

$name = getStudentName();
?>

<div class="card" style="text-align:center;">
    <h2>Révisions &mdash; NS4</h2>
    <?php if ($name): ?>
        <p class="welcome-message">Bon travail, <strong><?= e($name) ?></strong> !</p>
    <?php endif; ?>
    <p style="margin-top:1rem;">🚧 Module en construction. Les quiz arrivent bientôt.</p>
</div>

<?php require_once __DIR__ . '/../includes/footer.php'; ?>