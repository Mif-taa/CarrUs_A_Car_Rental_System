-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2025 at 07:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123'),
(2, 'admin1', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `driver` varchar(20) NOT NULL,
  `days` int(11) NOT NULL,
  `offer_code` varchar(20) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `booking_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `address`, `driver`, `days`, `offer_code`, `total_amount`, `payment_method`, `booking_time`) VALUES
(1, 6, 'Agrabad', 'self-drive', 1, 'OFF20', 800.00, 'bikash', '2025-05-04 03:01:42'),
(5, 8, 'Cuet', 'self-drive', 3, 'OFF20', 2400.00, 'cash', '2025-05-09 16:39:14'),
(7, 8, 'New Market', 'yes', 1, 'OFF20', 1200.00, 'bikash', '2025-05-09 16:43:43'),
(8, 5, 'Boropol', 'yes', 7, 'OFF20', 6000.00, 'bikash', '2025-05-19 18:31:35'),
(11, 5, 'Chawkbazar,Chittagong', 'yes', 6, 'OFF10', 5850.00, 'card', '2025-05-19 18:35:46'),
(12, 5, 'Boropol', 'self-drive', 1, 'OFF20', 800.00, 'bikash', '2025-06-27 07:52:48'),
(13, 5, 'Chawkbazar,Chittagong', 'yes', 2, 'OFF20', 2000.00, 'bikash', '2025-06-30 13:01:10'),
(14, 5, 'Boropol', 'yes', 1, 'OFF20', 1200.00, 'bikash', '2025-06-30 13:20:56');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `registrationNumber` varchar(50) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `seatCapacity` int(11) DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_rented` tinyint(1) DEFAULT 0,
  `rented_by` int(11) DEFAULT NULL,
  `fixed_rate` decimal(10,2) NOT NULL DEFAULT 1000.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `registrationNumber`, `category`, `seatCapacity`, `make`, `year`, `model`, `created_at`, `is_rented`, `rented_by`, `fixed_rate`) VALUES
(1, 'MH12AB1234', 'SUV', 7, 'Toyota', '2022', 'Fortuner', '2025-05-03 12:33:11', 1, 6, 1000.00),
(2, 'KA05CD6789', 'Sedan', 5, 'Honda', '2021', 'City', '2025-05-03 12:35:15', 1, NULL, 1000.00),
(3, ' DL01EF4321', 'Hatchback', 4, 'Maruti Suzuki', '2020', 'Swift', '2025-05-03 12:36:39', 1, 8, 1000.00),
(4, ' TN10GH2468', 'SUV', 7, 'Hyundai', '2023', 'Alcazar', '2025-05-03 12:38:15', 1, 8, 1000.00),
(5, ' RJ14IJ9753', ' Convertible', 2, 'BMW', '2019', 'Z4', '2025-05-03 12:39:26', 1, 8, 1000.00),
(6, 'ABC1234', 'SUV', 5, 'Toyota', '2021', 'Fortuner', '2025-05-03 13:27:50', 1, 5, 1000.00),
(7, 'DHA-5678', 'SUV', 5, 'Toyota', '2022', 'Corolla', '2025-05-04 04:15:59', 1, 8, 1000.00),
(8, 'ABC123', 'Luxury', 2, 'Sedan', '2020', 'CR-V', '2025-05-09 16:35:50', 1, 8, 1000.00),
(9, 'FGH123', 'Luxury', 2, 'Honda', '2020', 'RAV4', '2025-05-11 06:37:33', 1, 5, 1000.00),
(10, 'aghjws12y829', 'Sports', 2, 'Toyota', '2020', 'Camry', '2025-05-11 07:19:04', 1, 5, 1000.00),
(11, 'QRS12621781', 'Luxury', 5, 'Ferrari', '2020', '488 GTB', '2025-05-11 07:19:36', 0, NULL, 1000.00),
(12, 'WER34512856', 'Luxury', 3, 'Ferrari', '2020', 'Toyota', '2025-05-18 14:50:22', 0, NULL, 1000.00),
(13, 'eoprt9q8', 'SUV', 2, 'Ferrari', '2020', '488 GTB', '2025-05-19 16:50:01', 0, NULL, 1000.00),
(14, 'abc4850930', 'Luxury', 3, 'SUV', '1971', 'Fortuner', '2025-06-30 13:10:43', 1, 5, 1000.00),
(15, 'qwe1113920', 'SUV', 4, 'Toyota', '2022', 'Fortuner', '2025-06-30 14:35:27', 0, NULL, 1000.00),
(16, 'ABZ12332', 'Luxury', 3, 'SUV', '2002', 'Corolla', '2025-06-30 14:35:50', 0, NULL, 1000.00),
(17, 'qwe12ui3u2', 'Luxury', 3, 'Toyota', '2022', 'Fortuner', '2025-07-21 14:02:15', 0, NULL, 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `submitted_at`) VALUES
(1, 'Anika', 'anika@email.com', 'asdf', '2025-05-05 13:04:01'),
(2, 'Jannat', 'jannat@gmail.com', 'any offer available now?', '2025-05-05 13:23:38'),
(3, 'Mifta', 'mifta@gmail.com', 'Any offer available now?', '2025-05-09 16:34:24'),
(4, 'Jannat', 'jannat@gamil.com', 'Hi', '2025-05-11 07:11:31'),
(5, 'Mifta', 'mifta@gmail.com', 'hello', '2025-05-19 16:48:59'),
(6, 'Anika', 'anika@email.com', 'How can I rent a car?', '2025-06-27 07:51:22'),
(7, 'Miftahul Jannat', 'mifta@gmail.com', 'hello', '2025-06-30 13:12:17'),
(8, 'Miftahul Jannat', 'jannat@gmail.com', 'wiuhqdqwd', '2025-07-15 02:28:35');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `license_number` varchar(50) NOT NULL,
  `license_class` varchar(50) NOT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `license_number`, `license_class`, `registered_at`) VALUES
(1, 'MH14AB1234', 'LMV', '2025-05-06 01:19:08'),
(7, 'KA05CD6789', 'MCWG', '2025-05-06 01:23:25'),
(9, 'RJ10IJ2468', 'TR', '2025-05-06 01:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `favourite_cars`
--

CREATE TABLE `favourite_cars` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favourite_cars`
--

INSERT INTO `favourite_cars` (`id`, `user_id`, `car_id`) VALUES
(8, 1, 1),
(5, 1, 9),
(9, 1, 12),
(20, 5, 5),
(15, 5, 9),
(3, 8, 2),
(2, 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `login_log`
--

CREATE TABLE `login_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_log`
--

INSERT INTO `login_log` (`id`, `user_id`, `login_time`) VALUES
(1, 2, '2025-05-18 19:30:45'),
(2, 2, '2025-05-18 19:31:21'),
(3, 9, '2025-05-18 20:05:42'),
(4, 9, '2025-05-18 20:48:46'),
(5, 9, '2025-05-19 22:00:37'),
(6, 9, '2025-05-19 22:19:48'),
(7, 9, '2025-05-19 22:20:02'),
(8, 9, '2025-05-19 22:20:40'),
(9, 9, '2025-05-19 22:23:36'),
(10, 9, '2025-05-19 22:23:44'),
(11, 9, '2025-05-19 22:47:25'),
(12, 9, '2025-05-19 22:48:30'),
(13, 9, '2025-05-19 23:14:32'),
(14, 9, '2025-05-19 23:21:53'),
(15, 8, '2025-05-19 23:23:36'),
(16, 2, '2025-05-20 00:01:27'),
(17, 2, '2025-05-20 00:13:36'),
(18, 2, '2025-05-20 00:15:07'),
(19, 2, '2025-05-20 00:18:25'),
(20, 5, '2025-05-20 00:26:12'),
(21, 5, '2025-05-20 00:31:00'),
(22, 5, '2025-05-20 00:35:09'),
(23, 5, '2025-05-20 01:20:32'),
(24, 5, '2025-06-16 03:16:29'),
(25, 5, '2025-06-16 03:16:36'),
(26, 11, '2025-06-16 03:18:04'),
(27, 11, '2025-06-16 03:18:11'),
(28, 11, '2025-06-16 03:19:35'),
(29, 11, '2025-06-16 03:20:35'),
(30, 11, '2025-06-16 03:21:37'),
(31, 11, '2025-06-16 03:22:20'),
(32, 11, '2025-06-16 03:27:11'),
(33, 11, '2025-06-16 03:27:24'),
(34, 5, '2025-06-16 03:27:41'),
(35, 5, '2025-06-16 03:28:25'),
(36, 5, '2025-06-16 03:31:19'),
(37, 5, '2025-06-26 15:01:27'),
(38, 5, '2025-06-26 15:08:55'),
(39, 5, '2025-06-26 15:11:04'),
(40, 5, '2025-06-26 15:15:10'),
(41, 5, '2025-06-26 15:15:12'),
(42, 5, '2025-06-26 15:17:33'),
(43, 5, '2025-06-26 15:19:59'),
(44, 6, '2025-06-26 15:28:06'),
(45, 6, '2025-06-26 15:28:11'),
(46, 6, '2025-06-26 15:28:16'),
(47, 6, '2025-06-26 15:28:21'),
(48, 12, '2025-06-26 15:29:45'),
(49, 12, '2025-06-26 15:29:58'),
(50, 12, '2025-06-26 15:40:33'),
(51, 12, '2025-06-26 15:40:50'),
(52, 12, '2025-06-26 15:45:49'),
(53, 12, '2025-06-26 15:48:26'),
(54, 12, '2025-06-26 15:53:29'),
(55, 12, '2025-06-26 15:55:12'),
(56, 12, '2025-06-26 15:56:38'),
(57, 12, '2025-06-26 16:04:08'),
(58, 8, '2025-06-26 16:04:38'),
(59, 8, '2025-06-26 16:05:09'),
(60, 8, '2025-06-26 16:05:13'),
(61, 8, '2025-06-26 16:05:13'),
(62, 8, '2025-06-26 16:12:26'),
(63, 8, '2025-06-26 16:12:28'),
(64, 8, '2025-06-26 16:12:29'),
(65, 8, '2025-06-26 16:12:30'),
(66, 8, '2025-06-26 16:12:30'),
(67, 12, '2025-06-26 16:14:00'),
(68, 12, '2025-06-26 16:14:39'),
(69, 12, '2025-06-26 16:18:02'),
(70, 12, '2025-06-26 16:18:08'),
(71, 12, '2025-06-26 16:18:17'),
(72, 12, '2025-06-26 16:19:49'),
(73, 12, '2025-06-26 16:19:59'),
(74, 12, '2025-06-26 16:20:16'),
(75, 12, '2025-06-26 16:20:28'),
(76, 12, '2025-06-26 16:20:41'),
(77, 5, '2025-06-26 16:20:54'),
(78, 5, '2025-06-26 16:21:07'),
(79, 5, '2025-06-26 16:21:43'),
(80, 5, '2025-06-26 16:22:40'),
(81, 5, '2025-06-26 16:23:02'),
(82, 5, '2025-06-26 16:24:02'),
(83, 5, '2025-06-26 16:25:32'),
(84, 5, '2025-06-27 13:50:32'),
(85, 5, '2025-06-27 13:50:38'),
(86, 5, '2025-06-27 14:00:39'),
(87, 5, '2025-06-30 18:58:13'),
(88, 5, '2025-06-30 19:57:03'),
(89, 11, '2025-06-30 20:56:49'),
(90, 11, '2025-07-15 08:26:39'),
(91, 5, '2025-07-15 08:26:53'),
(92, 5, '2025-07-15 09:59:12'),
(93, 5, '2025-07-21 19:52:01'),
(94, 5, '2025-07-22 15:55:06');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `reviewText` text NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `userId`, `reviewText`, `rating`, `created_at`) VALUES
(2, 'Anonymous', '⭐⭐⭐⭐☆\n\"Smooth booking and great interface. Got all the car details clearly and the process was quick. Would love to see online payment added!\"', 4, '2025-05-01 16:15:32'),
(3, 'Anonymous', '⭐⭐⭐⭐⭐\n\"Excellent service! Easy to book, great UI, and the car was in perfect condition.\"', 5, '2025-05-01 16:22:01'),
(4, '6', '⭐☆☆☆☆\n\"Not satisfied. Booking failed and no support response. Needs improvement.\"', 1, '2025-05-01 16:35:01'),
(5, '6', '⭐⭐⭐⭐⭐\n\"Best rental experience ever!\"\n“The booking process was super easy and transparent. The car was clean, well-maintained, and exactly what I expected. Highly recommend CARRUS!”\n— Amit Roy', 5, '2025-05-04 04:08:46'),
(8, '9', '⭐⭐⭐⭐⭐\n“Excellent Service and Clean Cars!”\nby Priya S. – April 2025\n\nI recently used CARRUS to subscribe to a car for 6 months, and I’m genuinely impressed. The registration process was smooth, and I loved how easy it was to choose a car with or without a driver. The vehicle I received (Hyundai Creta) was spotless, well-maintained, and exactly as described. I also appreciated the flexibility of the subscription model — much better than traditional rentals!\n\nCustomer support was responsive, and my questions about insurance and early cancellation were answered clearly. I even applied a promo code and got a decent discount. Definitely recommending this to friends!\n\n', 5, '2025-05-11 07:13:52'),
(11, '5', 'Excellent', 3, '2025-06-30 13:12:46'),
(12, '11', 'sakdnj', 2, '2025-07-15 02:29:08');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `duration_months` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `driver_required` enum('yes','no') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `transaction_number` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `car_id`, `start_date`, `duration_months`, `address`, `driver_required`, `price`, `transaction_number`, `created_at`) VALUES
(1, 5, 10, '2023-02-02', 1, 'Agrabad', 'no', 8000.00, 'khsadkwu2941', '2025-06-30 14:32:15'),
(2, 5, 10, '2025-02-02', 1, 'Boropol', 'yes', 11000.00, 'ASD312392', '2025-06-30 14:34:06'),
(3, 5, 10, '2025-03-02', 1, 'Boropol', 'no', 8000.00, 'trx3027300087', '2025-07-15 02:31:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nid` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `nid`, `password`, `created_at`) VALUES
(2, 'RISHTA', '0192379284', 'rishta@gmail.com', '392159046', '$2y$10$ZWKQ8d/Z0puux3t5V6mkdOfZgn94a7Vkwj1dX231dLkk9ijpIS.Q2', '2025-05-01 09:40:08'),
(4, 'Anika', '012473922', 'anika@gmail.com', '52394354392', '$2y$10$NHkNb3jFh8YejrXfpHdFDOu51eoG0EwfCKGN.N34Y/KmapRj7atCe', '2025-05-01 09:46:02'),
(5, 'Jannat', '012374384', 'jannat@gmail.com', '545934782', '$2y$10$AcJecm1NFN0FxtKhYROLterZm2JKU8BNTtmNAh/huIf/PlzV3Xjk6', '2025-05-01 10:53:37'),
(6, 'Anika Rahman', '0156217821', 'rahman@gmail.com', '3249352312', '$2y$10$TJuuYc0sNV9FvVygJhN15ei3UmlnLSdf8Yexlxm8yad.5X1uD3GwG', '2025-05-01 16:19:12'),
(8, 'Mahin', '01243835943', 'mahin@gmail.com', '2132t64723', '$2y$10$VASJ9oVcTBxdHW.ADA4GCOseyDMvvlu9S2nYTwE6ONPw4bxuae4WC', '2025-05-09 13:02:59'),
(9, 'Mifta', '012394321', 'mifta@gmail.com', '378519032', '$2y$10$m21Y/qMnLYxdPRZs2yG5VOThXHz3PLGh9NBPudNbDl4rpb4.ZLZwO', '2025-05-09 16:11:11'),
(10, 'Tasfia', '0132498732', 'tasfia@gmail.com', '3509293841', '$2y$10$J8X.IOE1aVPIJjiSMcGeRuKvHNxil7z7gayAIlegNr8H24eKZK2pm', '2025-05-09 17:36:51'),
(11, 'ABC', '781924872', 'abc@gmail.com', '438591345819', '$2y$10$6V7CGYMnIM1.dpzv5MNgQ.z46qp.a1Te/sapowdno4hg0SzVT7Qqi', '2025-06-15 21:17:33'),
(12, 'xyz', '2627788198', 'xyz@gmail.com', '783809302', '$2y$10$yy02IV96A740POQUK2nDxOpD9XmS9NimfAmWpCiLRvr.su8q1lX7S', '2025-06-26 09:18:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rented_by` (`rented_by`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `license_number` (`license_number`);

--
-- Indexes for table `favourite_cars`
--
ALTER TABLE `favourite_cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_fav` (`user_id`,`car_id`);

--
-- Indexes for table `login_log`
--
ALTER TABLE `login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `favourite_cars`
--
ALTER TABLE `favourite_cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `login_log`
--
ALTER TABLE `login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `fk_rented_by` FOREIGN KEY (`rented_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `login_log`
--
ALTER TABLE `login_log`
  ADD CONSTRAINT `login_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `subscriptions_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
