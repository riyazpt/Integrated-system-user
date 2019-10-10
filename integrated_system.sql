-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2019 at 11:31 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `integrated_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `asset_id` int(10) UNSIGNED NOT NULL,
  `asset_name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`asset_id`, `asset_name`, `created_at`, `updated_at`) VALUES
(1, 'Stations', '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(2, 'Branches', '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(3, 'School', '2019-10-09 18:30:00', '2019-10-09 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_10_09_134530_create_table_users', 1),
(2, '2019_10_10_055444_create_table_roless', 2),
(4, '2019_10_10_055532_create_table_role_assets', 2),
(5, '2019_10_10_055513_create_table_assets', 3);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `role_name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(2, 'Super Transport', '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(3, 'Branch Admin', '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(4, 'Station Admin	', '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(5, 'School Admin', '2019-10-09 18:30:00', '2019-10-09 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_assets`
--

CREATE TABLE `role_assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_assets`
--

INSERT INTO `role_assets` (`id`, `role_id`, `asset_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(2, 1, 2, '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(3, 1, 3, '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(4, 2, 1, '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(5, 2, 2, '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(6, 3, 2, '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(7, 4, 1, '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(8, 5, 3, '2019-10-09 18:30:00', '2019-10-09 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', '$2y$12$T7MQUpizjfwVC4Y4q1ZdROn4yNuRSbt3fNRDXzabXn7PJcWA83LE2', 1, '2019-10-09 18:30:00', '2019-10-09 18:30:00'),
(2, 'fayas', '$2y$10$XBTQGM7UkhtBA0/KI1R8B.q3V49/ZbEutz44WLL/PvlU4YZ/Qf69m', 0, '2019-10-10 07:40:41', '2019-10-10 09:15:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`asset_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `role_assets`
--
ALTER TABLE `role_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_name_unique` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `asset_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_assets`
--
ALTER TABLE `role_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
