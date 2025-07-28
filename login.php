<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
ini_set('session.cookie_httponly', 1);
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "carrus";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $email = trim($_POST['email']);
  $password = $_POST['password'];
  $stmt = $conn->prepare("SELECT id, name, password FROM users WHERE email = ?");
  $stmt->bind_param("s", $email);
  $stmt->execute();
  $stmt->store_result();
  if ($stmt->num_rows === 1) {
    $stmt->bind_result($userId, $name, $hashedPassword);
    $stmt->fetch();
    if (password_verify($password, $hashedPassword)) {
      $_SESSION['user_id'] = $userId;
      $_SESSION['username'] = $name;
      $log_stmt = $conn->prepare("INSERT INTO login_log (user_id) VALUES (?)");
      $log_stmt->bind_param("i", $userId);
      $log_stmt->execute();
      $log_stmt->close();
      // ✅ REDIRECT WORKS HERE
      header("Location: profile.php");
      exit();
    } else {
      // Redirect back with error message
      header("Location: login.html?error=InvalidPassword");
      exit();
    }
  } else {
    header("Location: login.html?error=UserNotFound");
    exit();
  }
  $stmt->close();
}
$conn->close();
?>
