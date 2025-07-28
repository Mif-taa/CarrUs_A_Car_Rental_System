<?php
if (session_status() === PHP_SESSION_NONE) session_start();

$conn = new mysqli("localhost", "root", "", "carrus");

if ($conn->connect_error) {
  echo "<p>Error fetching subscriptions.</p>";
  exit;
}

$userId = $_SESSION['user_id'] ?? null;
if (!$userId) {
  echo "<p>Please log in to view subscriptions.</p>";
  exit;
}

$sql = "SELECT s.*, c.registrationNumber, c.model 
        FROM subscriptions s 
        JOIN cars c ON s.car_id = c.id 
        WHERE s.user_id = ?
        ORDER BY s.start_date DESC";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $userId);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
  echo "<p>No subscriptions found.</p>";
} else {
  echo "<table class='subscription-table'>
          <tr>
            <th>Car</th>
            <th>Start Date</th>
            <th>Duration</th>
            <th>Driver</th>
            <th>Price</th>
            <th>Transaction</th>
          </tr>";
  while ($row = $result->fetch_assoc()) {
    echo "<tr>
            <td>{$row['registrationNumber']} - {$row['model']}</td>
            <td>{$row['start_date']}</td>
            <td>{$row['duration_months']} Months</td>
            <td>" . ($row['driver_required'] === 'yes' ? 'Yes' : 'No') . "</td>
            <td>৳{$row['price']}</td>
            <td>{$row['transaction_number']}</td>
          </tr>";
  }
  echo "</table>";
}

$stmt->close();
$conn->close();
?>
