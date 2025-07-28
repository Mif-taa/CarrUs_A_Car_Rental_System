<?php
session_start();
header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

include("db.php");

if (!isset($_SESSION['admin_id'])) {
    echo json_encode(["error" => "Unauthorized"]);
    exit;
}

$admin = ["username" => $_SESSION['username']];

// Fetch stats
$totalUsers = $conn->query("SELECT COUNT(*) AS c FROM users")->fetch_assoc()['c'];
$totalBookings = $conn->query("SELECT COUNT(*) AS c FROM bookings")->fetch_assoc()['c'];
$activeAdmins = $conn->query("SELECT COUNT(*) AS c FROM admins")->fetch_assoc()['c'];
$carsAvailable = $conn->query("SELECT COUNT(*) AS c FROM cars WHERE is_rented = 0")->fetch_assoc()['c'];

// Pie chart data by car category
$chartLabels = [];
$chartValues = [];
$res = $conn->query("SELECT category, COUNT(*) AS c FROM cars GROUP BY category");
while ($row = $res->fetch_assoc()) {
    $chartLabels[] = $row['category'];
    $chartValues[] = $row['c'];
}

echo json_encode([
    "admin" => $admin,
    "statistics" => [
        "total_users" => $totalUsers,
        "total_bookings" => $totalBookings,
        "active_admins" => $activeAdmins,
        "cars_available" => $carsAvailable,
        "chartLabels" => $chartLabels,
        "chartData" => $chartValues
    ]
]);
?>
