<?php
/**
 * API de questions - Quiz Ayiti
 * Version finale corrigée
 * 
 * Types dans la DB :
 *   type_id = 1 -> completion
 *   type_id = 2 -> qcm
 */
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') { http_response_code(200); exit; }

// Paramètres
$classe  = trim(strtolower($_GET['classe']  ?? '9e'));
$matiere = trim(strtolower($_GET['matiere'] ?? 'maths'));
$type    = trim(strtolower($_GET['type']    ?? ''));  // 'qcm' ou 'completion'
$limit   = isset($_GET['limit']) ? (int)$_GET['limit'] : 20;
$random  = isset($_GET['random']) && $_GET['random'] !== 'false';

// Validation
$classesValides = ['9e', 'ns4'];
$matieresValides = [
    '9e'  => ['creole','francais','maths','sciences_exp','sciences_soc','anglais','espagnol'],
    'ns4' => ['philosophie','maths','physique','chimie','svt','histoire_geo','anglais'],
];

// Mapping type -> type_id dans la base de données
$typeMapping = [
    'qcm'        => 2,  // type_id = 2 dans types_exercice
    'completion' => 1,  // type_id = 1 dans types_exercice
    'vf'         => 2,  // Vrai/Faux inclus dans QCM
];

if (!in_array($classe, $classesValides)) {
    http_response_code(400);
    echo json_encode(['success' => false, 'error' => 'Classe invalide']);
    exit;
}
if (!in_array($matiere, $matieresValides[$classe] ?? [])) {
    http_response_code(400);
    echo json_encode(['success' => false, 'error' => 'Matière invalide : ' . $matiere]);
    exit;
}
if ($limit < 1) $limit = 1;
if ($limit > 100) $limit = 100;

try {
    // Connexion à la base de données
    require_once __DIR__ . '/../config/connexion.php';
    $pdo = getDB();

    // 1. Récupérer l'ID de la classe
    $stmt = $pdo->prepare("SELECT id FROM classes WHERE nom = ?");
    $stmt->execute([$classe]);
    $classeId = $stmt->fetchColumn();
    
    if (!$classeId) {
        throw new Exception("Classe '$classe' non trouvée dans la base de données");
    }

    // 2. Récupérer l'ID de la matière
    $stmt = $pdo->prepare("SELECT id FROM matieres WHERE classe_id = ? AND nom = ?");
    $stmt->execute([$classeId, $matiere]);
    $matiereId = $stmt->fetchColumn();
    
    if (!$matiereId) {
        throw new Exception("Matière '$matiere' non trouvée pour la classe '$classe'");
    }

    // 3. Construire la requête pour récupérer les questions
    $sql = "SELECT q.id, t.code AS type_code, q.enonce, q.explication, q.reponse_attendue
            FROM questions q
            JOIN types_exercice t ON q.type_id = t.id
            WHERE q.matiere_id = :matiere_id";
    
    $params = [':matiere_id' => $matiereId];

    // 4. Filtrer par type si spécifié
    if (!empty($type) && isset($typeMapping[$type])) {
        $sql .= " AND q.type_id = :type_id";
        $params[':type_id'] = $typeMapping[$type];
    }

    // 5. Ordre aléatoire ou non
    if ($random) {
        $sql .= " ORDER BY RAND()";
    } else {
        $sql .= " ORDER BY q.id ASC";
    }

    $sql .= " LIMIT :limit";
    $params[':limit'] = $limit;

    // 6. Exécuter la requête
    $stmt = $pdo->prepare($sql);
    foreach ($params as $key => $value) {
        if ($key === ':limit') {
            $stmt->bindValue($key, (int)$value, PDO::PARAM_INT);
        } else {
            $stmt->bindValue($key, $value);
        }
    }
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // 7. Formater les résultats
    $questions = [];
    foreach ($rows as $row) {
        $q = [
            'id'               => (int)$row['id'],
            'type'             => ($row['type_code'] === 'completion') ? 'completion' : 'qcm',
            'enonce'           => $row['enonce'],
            'explication'      => $row['explication'] ?? null,
            'reponse_attendue' => $row['reponse_attendue'] ?? null,
            'options'          => []
        ];

        // 8. Pour les QCM, récupérer les 4 options
        if ($q['type'] === 'qcm') {
            $optStmt = $pdo->prepare(
                "SELECT texte, est_correcte FROM reponses WHERE question_id = ? ORDER BY ordre ASC"
            );
            $optStmt->execute([$row['id']]);
            $options = $optStmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($options as $opt) {
                $q['options'][] = [
                    'texte'   => $opt['texte'],
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

    // 9. Retourner la réponse JSON
    echo json_encode([
        'success'   => true,
        'classe'    => $classe,
        'matiere'   => $matiere,
        'type'      => $type,
        'total'     => count($questions),
        'questions' => $questions
    ], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'error'   => $e->getMessage()
    ], JSON_UNESCAPED_UNICODE);
}