<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Profile</title>
  <link rel="stylesheet" href="carrusCSS/profile.css" />
</head>
<body>
  <!-- Navigation Bar -->
  <nav class="navbar">
    <div class="navbar-logo">
      <h1 style="margin-left: 10px; font-family: 'Underdog', system-ui; font-weight: 700; font-size: 2.5rem; color: #9fc2e7; letter-spacing: 0.05em; text-transform: uppercase;">
        Carr<span style="color: #335778;">Us</span>
      </h1>
    </div>
    <div class="nav-links">
      <a href="./home.html">Home</a>
      <a href="./login.html">Logout</a>
    </div>
  </nav>

  <div class="container">
    <h2 id="profile-title">User Profile</h2>

    <div class="profile-section">
      <img src="profile icon.png" alt="Default Profile" class="default-profile-img">
      <div id="user-info">
        <p><strong>Name:</strong> <span id="profile-name">Loading...</span></p>
        <p><strong>Email:</strong> <span id="profile-email"></span></p>
        <p><strong>Phone:</strong> <span id="profile-phone"></span></p>
        <p><strong>NID:</strong> <span id="profile-nid"></span></p>
      </div>
    </div>

    <!-- <div class="stats-summary"> 
      <h3>Booking Statistics</h3>
      <p>Total Bookings: <span id="total-bookings">0</span></p>
      <p>Active: <span id="active-bookings">0</span></p>
      <p>Cancelled: <span id="cancelled-bookings">0</span></p>
    </div>

    <div class="bookings-history">
      <h3>Your Bookings</h3>
      <div id="bookings-container"></div>
    </div>
  </div> -->

  <script src="profile.js"></script>
</body>
</html>
