<?php
/**
 * API de questions - Quiz Ayiti
 * Version corrigée - Gère correctement QCM vs Completion
 */
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') { http_response_code(200); exit; }

$classe  = trim(strtolower($_GET['classe']  ?? '9e'));
$matiere = trim(strtolower($_GET['matiere'] ?? 'maths'));
$type    = trim(strtolower($_GET['type']    ?? ''));
$limit   = isset($_GET['limit']) ? (int)$_GET['limit'] : 20;
$random  = isset($_GET['random']) && $_GET['random'] !== 'false';

// Validation
$classesValides = ['9e', 'ns4'];
$matieresValides = [
    '9e'  => ['creole','francais','maths','sciences_exp','sciences_soc','anglais','espagnol'],
    'ns4' => ['francais','maths','physique','chimie','svt','histoire_geo','anglais'],
];
// Mapping des types
$typesValides = [
    'qcm'        => 2,  // type_id = 2 dans la DB
    'completion' => 1,  // type_id = 1 dans la DB
    'vf'         => 2,  // pas de type VF séparé, inclus dans QCM
];

if (!in_array($classe, $classesValides)) {
    http_response_code(400);
    echo json_encode(['success'=>false,'error'=>'Classe invalide']);
    exit;
}
if (!in_array($matiere, $matieresValides[$classe]??[])) {
    http_response_code(400);
    echo json_encode(['success'=>false,'error'=>'Matière invalide : '.$matiere]);
    exit;
}
if ($limit < 1) $limit = 1;
if ($limit > 100) $limit = 100;

try {
    require_once __DIR__ . '/../config/connexion.php';
    $pdo = getDB();
    
    // Récupérer les IDs
    $stmt = $pdo->prepare("SELECT id FROM classes WHERE nom = ?");
    $stmt->execute([$classe]);
    $classeId = $stmt->fetchColumn();
    
    $stmt = $pdo->prepare("SELECT id FROM matieres WHERE classe_id = ? AND nom = ?");
    $stmt->execute([$classeId, $matiere]);
    $matiereId = $stmt->fetchColumn();
    
    // Construire la requête
    $sql = "SELECT q.id, t.code AS type_code, q.enonce, q.explication, q.reponse_attendue
            FROM questions q
            JOIN types_exercice t ON q.type_id = t.id
            WHERE q.matiere_id = ?";
    $params = [$matiereId];
    
    // Filtrer par type
    if (!empty($type) && isset($typesValides[$type])) {
        $sql .= " AND q.type_id = ?";
        $params[] = $typesValides[$type];
    }
    
    if ($random) {
        $sql .= " ORDER BY RAND()";
    }
    $sql .= " LIMIT ?";
    $params[] = $limit;
    
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    if (empty($rows)) {
        echo json_encode(['success'=>true, 'questions'=>[], 'total'=>0, 'message'=>'Aucune question trouvée']);
        exit;
    }
    
    $questions = [];
    foreach ($rows as $row) {
        $q = [
            'id' => (int)$row['id'],
            'type' => ($row['type_code'] === 'completion') ? 'completion' : 'qcm',
            'enonce' => $row['enonce'],
            'explication' => $row['explication'] ?? null,
            'reponse_attendue' => $row['reponse_attendue'] ?? null,
            'options' => []
        ];
        
        // Pour les QCM, récupérer les options
        if ($q['type'] === 'qcm') {
            $optStmt = $pdo->prepare("SELECT texte, est_correcte FROM reponses WHERE question_id = ? ORDER BY ordre ASC");
            $optStmt->execute([$row['id']]);
            $options = $optStmt->fetchAll(PDO::FETCH_ASSOC);
            
            foreach ($options as $opt) {
                $q['options'][] = [
                    'texte' => $opt['texte'],
                    'correct' => (bool)$opt['est_correcte']
                ];
            }
            
            // Mélanger les options pour plus de variété
            if (!empty($q['options'])) {
                shuffle($q['options']);
            }
        }
        
        $questions[] = $q;
    }
    
    echo json_encode([
        'success' => true,
        'total' => count($questions),
        'questions' => $questions
    ], JSON_UNESCAPED_UNICODE);
    
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success'=>false, 'error'=>$e->getMessage()]);
}