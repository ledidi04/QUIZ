<?php
/**
 * API de questions - Quiz Ayiti
 * 
 * Retourne un JSON des questions pour une classe et une matière données
 * 
 * GET /api/questions.php?classe=9e&matiere=maths
 * GET /api/questions.php?classe=9e&matiere=espagnol
 * GET /api/questions.php?classe=ns4&matiere=physique
 * 
 * @version 2.0
 */

// ═══════════════════════════════════════
// HEADERS
// ═══════════════════════════════════════
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Gérer les requêtes OPTIONS (CORS preflight)
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

// ═══════════════════════════════════════
// CONFIGURATION
// ═══════════════════════════════════════
require_once __DIR__ . '/../config/connexion.php';

// ═══════════════════════════════════════
// VALIDATION DES PARAMÈTRES
// ═══════════════════════════════════════
$classe  = $_GET['classe']  ?? '';
$matiere = $_GET['matiere'] ?? '';
$limit   = isset($_GET['limit']) ? (int)$_GET['limit'] : 50; // max 50 questions par défaut
$random  = isset($_GET['random']) ? filter_var($_GET['random'], FILTER_VALIDATE_BOOLEAN) : false;

// Nettoyage basique
$classe  = trim(strtolower($classe));
$matiere = trim(strtolower($matiere));

// Classes et matières valides
$classesValides = ['9e', 'ns4'];

$matieresValides = [
    '9e'  => [
        'creole', 'francais', 'maths', 'sciences_exp', 
        'sciences_soc', 'anglais', 'espagnol'
    ],
    'ns4' => [
        'francais', 'maths', 'physique', 'chimie', 
        'svt', 'histoire_geo', 'anglais'
    ],
];

// Vérifier si la classe est valide
if (!in_array($classe, $classesValides)) {
    http_response_code(400);
    echo json_encode([
        'success' => false,
        'error'   => 'Classe invalide',
        'valid_classes' => $classesValides
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

// Vérifier si la matière est valide pour cette classe
if (!in_array($matiere, $matieresValides[$classe] ?? [])) {
    http_response_code(400);
    echo json_encode([
        'success' => false,
        'error'   => 'Matière invalide pour cette classe',
        'valid_matieres' => $matieresValides[$classe] ?? []
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

// Limiter le nombre de questions (sécurité)
if ($limit < 1) $limit = 1;
if ($limit > 100) $limit = 100;

// ═══════════════════════════════════════
// REQUÊTE À LA BASE DE DONNÉES
// ═══════════════════════════════════════
try {
    $pdo = getDB();

    // Requête principale avec ORDER BY RAND() si demandé
    $orderBy = $random ? 'RAND()' : 'q.id ASC';
    
    $sql = "
        SELECT 
            q.id,
            t.code AS type_code,
            t.nom   AS type_nom,
            q.enonce,
            q.explication,
            q.difficulte,
            q.source,
            q.reponse_attendue,
            r.id    AS reponse_id,
            r.texte AS reponse_texte,
            r.est_correcte,
            r.ordre
        FROM questions q
        JOIN types_exercice t ON q.type_id = t.id
        JOIN matieres m ON q.matiere_id = m.id
        JOIN classes c ON m.classe_id = c.id
        LEFT JOIN reponses r ON q.id = r.question_id
        WHERE c.nom = :classe 
          AND m.nom = :matiere
        ORDER BY {$orderBy}, r.ordre ASC
    ";

    // Si limit est défini, on limite le nombre de questions
    if ($limit > 0) {
        $sql .= " LIMIT :limit";
    }

    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':classe', $classe, PDO::PARAM_STR);
    $stmt->bindParam(':matiere', $matiere, PDO::PARAM_STR);
    if ($limit > 0) {
        $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
    }
    $stmt->execute();
    
    $rows = $stmt->fetchAll();

    // Si aucune question trouvée
    if (empty($rows)) {
        echo json_encode([
            'success' => true,
            'classe'  => $classe,
            'matiere' => $matiere,
            'total'   => 0,
            'message' => 'Aucune question trouvée pour cette matière. Reviens bientôt !',
            'questions' => []
        ], JSON_UNESCAPED_UNICODE);
        exit;
    }

    // ═══════════════════════════════════════
    // REGROUPEMENT PAR QUESTION
    // ═══════════════════════════════════════
    $questions = [];
    
    foreach ($rows as $row) {
        $qid = $row['id'];
        
        // Si la question n'existe pas encore dans le tableau, on l'initialise
        if (!isset($questions[$qid])) {
            $questions[$qid] = [
                'id'               => (int) $qid,
                'type'             => $row['type_code'],
                'type_nom'         => $row['type_nom'],
                'enonce'           => $row['enonce'],
                'explication'      => $row['explication'],
                'difficulte'       => (int) $row['difficulte'],
                'source'           => $row['source'],
                'reponse_attendue' => $row['reponse_attendue'],
                'options'          => [],
            ];
        }
        
        // Ajouter l'option si elle existe (pour QCM, V/F, appariement...)
        if ($row['reponse_id']) {
            $questions[$qid]['options'][] = [
                'id'      => (int) $row['reponse_id'],
                'texte'   => $row['reponse_texte'],
                'correct' => (bool) $row['est_correcte'],
                'ordre'   => (int) $row['ordre'],
            ];
        }
    }

    // Mélanger les options pour chaque question (éviter la mémorisation de l'ordre)
    if ($random) {
        foreach ($questions as &$question) {
            if (!empty($question['options'])) {
                shuffle($question['options']);
            }
        }
        // Mélanger aussi l'ordre des questions
        $questions = array_values($questions);
        shuffle($questions);
    } else {
        $questions = array_values($questions);
    }

    // ═══════════════════════════════════════
    // RÉPONSE JSON
    // ═══════════════════════════════════════
    echo json_encode([
        'success'   => true,
        'classe'    => $classe,
        'matiere'   => $matiere,
        'total'     => count($questions),
        'questions' => $questions,
    ], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

} catch (PDOException $e) {
    // Erreur de connexion à la base de données
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'error'   => 'Erreur de base de données',
        'message' => 'Impossible de se connecter à la base de données. Vérifiez la configuration.',
        // En production, ne pas afficher le message d'erreur détaillé
        // 'debug' => $e->getMessage()
    ], JSON_UNESCAPED_UNICODE);
    
    // Logger l'erreur en production
    error_log('Quiz API Error: ' . $e->getMessage());
}