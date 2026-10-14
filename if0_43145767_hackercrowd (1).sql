-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql105.infinityfree.com
-- Waktu pembuatan: 14 Okt 2026 pada 02.10
-- Versi server: 11.4.13-MariaDB
-- Versi PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_43145767_hackercrowd`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `description`, `created_at`) VALUES
(1, 2, 'AI_REPORT_GEN', 'Hacker menggunakan AI Bug Report Assistant untuk: payment bypass', '2026-10-14 04:46:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ai_logs`
--

CREATE TABLE `ai_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feature_type` enum('assistant','payload','mitigation') NOT NULL,
  `input_prompt` text NOT NULL,
  `ai_response` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `report_id` int(11) DEFAULT NULL,
  `message_text` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `programs`
--

CREATE TABLE `programs` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `bounty_min` varchar(100) DEFAULT '$0',
  `bounty_max` varchar(100) DEFAULT '$0',
  `verification_status` enum('Verified','Active','Paused','Closed','Rejected') DEFAULT 'Verified',
  `scope_rules` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `hacker_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `vuln_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `severity` enum('Low','Medium','High','Critical') DEFAULT 'Medium',
  `status` enum('Pending','Triaged','Resolved','Closed','Rejected') DEFAULT 'Pending',
  `reward` varchar(100) DEFAULT '$0.00',
  `tax_deduction` decimal(10,2) DEFAULT 0.00,
  `payout_status` enum('Unpaid','Processing','Paid') DEFAULT 'Unpaid',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `verification_status` varchar(50) DEFAULT 'Pending',
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_comments`
--

CREATE TABLE `report_comments` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(150) NOT NULL,
  `role` enum('hacker','company','owner') NOT NULL DEFAULT 'hacker',
  `full_name` varchar(150) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `avatar` varchar(255) DEFAULT 'default.png',
  `total_earnings` decimal(10,2) DEFAULT 0.00,
  `reputation_score` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `profile_pic` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT '',
  `ptkp_status` varchar(20) DEFAULT 'TK/0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `full_name`, `bio`, `avatar`, `total_earnings`, `reputation_score`, `created_at`, `profile_pic`, `fullname`, `ptkp_status`) VALUES
(1, 'Joseaja.py', '$2y$12$F4Ncrm7prY/UyObbKEXR.ONbIbjL0FFoEnqFmWrY.E0gHRFRD/jI.', 'migeljose33@gmail.com', 'owner', NULL, NULL, 'default.png', '0.00', 0, '2026-10-14 04:39:44', NULL, '', 'TK/0'),
(2, 'Downfall', '$2y$12$t29.2KRFbmLNYPhdMihuJe3cRh5h6PQMS2N3Ym6veHzM5WnE5c6Ru', 'exam@gmail.com', 'hacker', NULL, NULL, 'default.png', '0.00', 0, '2026-10-14 04:44:04', NULL, '', 'TK/0'),
(3, 'examservices', '$2y$12$CRP5/veoOB0LUCyMSfoebeG6P4/zHZ07pNx10dL73Yx8aBtf4uQ/2', 'examservices@wearehackerone.com', 'company', NULL, NULL, 'default.png', '0.00', 0, '2026-10-14 05:19:03', NULL, '', 'TK/0');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ai_logs`
--
ALTER TABLE `ai_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indeks untuk tabel `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indeks untuk tabel `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hacker_id` (`hacker_id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indeks untuk tabel `report_comments`
--
ALTER TABLE `report_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role` (`role`),
  ADD KEY `role_2` (`role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ai_logs`
--
ALTER TABLE `ai_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `report_comments`
--
ALTER TABLE `report_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
