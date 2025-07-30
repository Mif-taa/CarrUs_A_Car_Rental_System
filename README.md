# 🚗 CARRUS – Car Rental Website Project

This is a car rental website developed as a **Versity Mini Project**. It allows users to sign up, browse available cars, book(daily basis) or subscribe(long time duration) with/without drivers, and manage their profile,mark their favourite cars,join as a driver ,lend cars to earn profit  while the admin can manage through a React-powered dashboard.

---

## 📑 Table of Contents

- [Introduction](#introduction)
- [Requirements](#requirements)
- [Installation](#installation)
- [Database](#database)
- [Database Tables](#database-tables)
- [Key Features](#key-features)
- [User Stories](#user-stories)
- [Admin Panel](#admin-panel)
- [License](#license)
- [Demo](#demo)
- [Author](#author)
- [Show Your Support](#show-your-support)

---

## 📌 Introduction

**CARRUS** is a full-featured **Car Rental Website** that supports user login, dynamic car listing, car reservations, subscriptions, and an admin dashboard.  
It includes car browsing, driver selection, lend cars, join as driver and profile management.

---

## ⚙️ Requirements

- [XAMPP](https://www.apachefriends.org/) (Apache + MySQL)
- PHP 7+
- MySQL
- Web Browser (Chrome/Firefox)
- Node.js (for admin panel, optional)

---

## 🛠️ Installation

1. Install and run **XAMPP**.
2. Clone or download the project into the `htdocs` directory:
   ```bash
   git clone https://github.com/Mif-taa/CarrUs_A_Car_Rental-System.git
   ```
3. Import the SQL file from the `database/` folder (`carrus.sql`) into **phpMyAdmin**.
4. Update your database credentials in `includes/db.php`.
5. Start Apache and MySQL from the XAMPP Control Panel.
6. Open your browser and go to:
   ```
   http://localhost/CarrUs_A_Car_Rental-System/
   ```
7. (Optional) To run the React admin panel:
   ```bash
   cd admin
   npm install
   npm start
   ```

---

## 🗃️ Database

- **Database Name:** `carproject`
- **SQL File:** `database/carrus.sql`
- **Connection File:** `includes/db.php`

---

## 📋 Database Tables

### `users`
- `id`, `name`, `email`, `password`, `nid`, `created_at`,`phone`

### `cars`
- `id`, `make`, `model`, `year`, `seatCapacity`, `fixed_rate`, `registrationNumber`, `is_rented`, `rented_by`

### `bookings`
- `id`, `user_id`, `address`, `days`, `offer_code`, `driver`, `booking_time`, `payment_method` ,`total_amount`

### `subscriptions`
- `id`, `user_id`, `car_id`, `start_date`, `duration_months`, `driver_required`, `price`, `transaction_number`

### `admins`
- `id`, `username`, `password`

### `reviews`
- `id`, `userId`, `reviewText` ,`rating`, `created_at`

### `favourite_cars`
- `id`, `user_id`, `car_id`
---

## ✨ Key Features

### User-Side
- Signup/Login system
- Browse available cars with filters
- Book cars with or without driver
- Simulated payment system
- Rent cars for daily purpose
- Subscribe cars for long time duration
- Profile management with statistics
- Join as a driver
- Lend own cars and earn profit
- Mark favourite cars
- Contact us with any issues

### Admin-Side (React + PHP)
- Secure admin login
- Dashboard with animated stats

---

## 👤 User Stories

- As a user, I can register and log in securely.
- As a user, I can view available cars and subscribe or rent.
- As a user, I can see my booking history.
- As a user, I can join as a driver.
- As a user, I can lend my cars and earn profit.
- As an admin, I can manage users, cars, and bookings.

---

## 📄 Admin Panel

Admin Panel built with **React.js**:
- Login system
- Animated stats (Chart.js)
---

## 🎥 Demo

- 📸 Screenshots: See `assets/screenshots/`

---

## 👨‍💻 Author

**Miftahul Jannat Rishta**  
- 🔗 GitHub: [github.com/Mif-taa](https://github.com/Mif-taa)  
- 📧 Email: miftahuljannatrishta@gmail.com  
- 🎓 CSE 3rd Year Student | Passionate about ML & Web Dev

---

## 🙌 Show Your Support

If you like this project:
- ⭐ Star the repository

---
