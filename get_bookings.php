<?php
include 'db.php';
if (session_status() === PHP_SESSION_NONE) session_start();

header('Content-Type: application/json');

// Validate userId
$userId = filter_var($_GET['user_id'] ?? null, FILTER_VALIDATE_INT);
if (!$userId) {
    echo json_encode(["error" => "Invalid or missing user ID"]);
    exit;
}

// Optional filters
$status = trim($_GET['status'] ?? '');
$date = trim($_GET['date'] ?? '');

// Query
$query = "SELECT b.*, c.make, c.model, c.year, d.name AS driver_name 
          FROM bookings b
          JOIN cars c ON b.car_id = c.id
          LEFT JOIN drivers d ON b.driver_id = d.id
          WHERE b.user_id = ?";

$params = [$user_id];
$types = 'i';

if ($status !== '') {
    $query .= " AND b.status = ?";
    $params[] = $status;
    $types .= 's';
}

if ($date !== '') {
    $query .= " AND DATE(b.booking_date) = ?";
    $params[] = $date;
    $types .= 's';
}

$stmt = $conn->prepare($query);
if (!$stmt) {
    http_response_code(500);
    echo json_encode(["error" => "Database error: " . $conn->error]);
    exit;
}

$stmt->bind_param($types, ...$params);
$stmt->execute();
$result = $stmt->get_result();

$bookings = [];
while ($row = $result->fetch_assoc()) {
    $bookings[] = $row;
}

echo json_encode($bookings);
?>
