-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2021 pada 05.18
-- Versi server: 10.4.16-MariaDB
-- Versi PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hris`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `check_in` varchar(50) NOT NULL,
  `check_out` varchar(50) NOT NULL,
  `shift` varchar(50) NOT NULL,
  `hour_production` varchar(50) NOT NULL,
  `break` varchar(50) NOT NULL,
  `overtime` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `departement`
--

CREATE TABLE `departement` (
  `departement_id` int(11) NOT NULL,
  `departement_name` varchar(50) NOT NULL,
  `head_of_departement` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `departement`
--

INSERT INTO `departement` (`departement_id`, `departement_name`, `head_of_departement`) VALUES
(1, 'HRD', 'Human Resources Department'),
(9, 'FAT', 'Finance Accounting & Tax'),
(10, 'GA', 'General Affair'),
(11, 'ENG', 'Engineering'),
(12, 'PRO', 'Production'),
(13, 'SVY', 'Surveyor'),
(14, 'LOG', 'Logistik'),
(15, 'PLA', 'Plant and Maintenance'),
(16, 'SEC', 'Security'),
(17, 'HSE', 'Health Safety & Environment'),
(18, 'CS', 'Customer Service');

-- --------------------------------------------------------

--
-- Struktur dari tabel `education_information`
--

CREATE TABLE `education_information` (
  `education_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `school_name` varchar(50) NOT NULL,
  `major` varchar(50) NOT NULL,
  `start_year` date NOT NULL,
  `end_year` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `nik` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `departemen` varchar(100) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `place_of_birth` varchar(50) NOT NULL,
  `join_date` date DEFAULT NULL,
  `addres_line` text DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `wn` varchar(50) DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `pph_status` varchar(50) DEFAULT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `npwp` varchar(50) DEFAULT NULL,
  `bpjs_healt_number` varchar(50) DEFAULT NULL,
  `bpjs_employment_number` varchar(50) DEFAULT NULL,
  `bpjs_pension_number` varchar(50) DEFAULT NULL,
  `bank_account_name` varchar(50) DEFAULT NULL,
  `bank_account_number` int(11) DEFAULT NULL,
  `remaining_days_off` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `employee`
--

INSERT INTO `employee` (`employee_id`, `nik`, `name`, `gender`, `departemen`, `position`, `date_of_birth`, `place_of_birth`, `join_date`, `addres_line`, `city`, `province`, `zip`, `religion`, `wn`, `marital_status`, `pph_status`, `blood_group`, `email`, `phone`, `npwp`, `bpjs_healt_number`, `bpjs_employment_number`, `bpjs_pension_number`, `bank_account_name`, `bank_account_number`, `remaining_days_off`) VALUES
(3, 123, '123123', 'M', 'Engineering', 'IT DEVELOPER', '2001-10-22', 'Tasikmalaya', '2021-06-22', 'Kp Jantake', 'tasikmalaya', 'Jawa Barat', 46153, 'Islam', 'Indonesia', 'TK', 'TK', 'A', 'hidayatsarip2210@gmail.com', '087771565213', '0', '0', '0', '0', 'BCA', 123123, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee_leave`
--

CREATE TABLE `employee_leave` (
  `employee_leave_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_type` varchar(50) NOT NULL,
  `from` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `number_of_days` int(11) NOT NULL,
  `remaining_leave` varchar(50) NOT NULL,
  `leave_reason` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `approved_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee_overtime`
--

CREATE TABLE `employee_overtime` (
  `employee_overtime_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `overtime_type` varchar(50) NOT NULL,
  `overtime_description` text NOT NULL,
  `overtime_hour` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `approved_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `experience_information`
--

CREATE TABLE `experience_information` (
  `experience_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `location` text NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `family_information`
--

CREATE TABLE `family_information` (
  `family_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `leave`
--

CREATE TABLE `leave` (
  `leave_id` int(11) NOT NULL,
  `leave_type` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `number_of_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `leave`
--

INSERT INTO `leave` (`leave_id`, `leave_type`, `description`, `number_of_days`) VALUES
(1, 'A', 'AB', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `overtime`
--

CREATE TABLE `overtime` (
  `overtime_id` int(11) NOT NULL,
  `overtime_type` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `overtime_hours` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `overtime`
--

INSERT INTO `overtime` (`overtime_id`, `overtime_type`, `description`, `overtime_hours`) VALUES
(2, '123', '123', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `resignation`
--

CREATE TABLE `resignation` (
  `resignation_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `departement_name` varchar(50) NOT NULL,
  `reason` text NOT NULL,
  `notice_date` date NOT NULL,
  `resignation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `shift`
--

CREATE TABLE `shift` (
  `shift_id` int(11) NOT NULL,
  `shift_name` varchar(50) NOT NULL,
  `hour_production` varchar(50) NOT NULL,
  `start` varchar(50) NOT NULL,
  `end` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `shift`
--

INSERT INTO `shift` (`shift_id`, `shift_name`, `hour_production`, `start`, `end`) VALUES
(8, 'TES', '1.17', '09:10', '10:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `termination`
--

CREATE TABLE `termination` (
  `termination_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `termination_date` date NOT NULL,
  `departement_name` varchar(50) NOT NULL,
  `reason` text NOT NULL,
  `notice_date` date NOT NULL,
  `resignation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `position` varchar(50) NOT NULL,
  `created_date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `username`, `fullname`, `password`, `position`, `created_date`, `status`, `avatar`, `role`) VALUES
(1, 'admin', 'Admin', '$2y$10$LlgjxVsOPktq.rns0B8AuuUhSdwZsNWDUJgZx/Ado0GpchI4FFs3e', 'admin', '2021-06-17', 'active', '', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indeks untuk tabel `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`departement_id`);

--
-- Indeks untuk tabel `education_information`
--
ALTER TABLE `education_information`
  ADD PRIMARY KEY (`education_id`);

--
-- Indeks untuk tabel `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indeks untuk tabel `employee_leave`
--
ALTER TABLE `employee_leave`
  ADD PRIMARY KEY (`employee_leave_id`);

--
-- Indeks untuk tabel `employee_overtime`
--
ALTER TABLE `employee_overtime`
  ADD PRIMARY KEY (`employee_overtime_id`);

--
-- Indeks untuk tabel `experience_information`
--
ALTER TABLE `experience_information`
  ADD PRIMARY KEY (`experience_id`);

--
-- Indeks untuk tabel `family_information`
--
ALTER TABLE `family_information`
  ADD PRIMARY KEY (`family_id`);

--
-- Indeks untuk tabel `leave`
--
ALTER TABLE `leave`
  ADD PRIMARY KEY (`leave_id`);

--
-- Indeks untuk tabel `overtime`
--
ALTER TABLE `overtime`
  ADD PRIMARY KEY (`overtime_id`);

--
-- Indeks untuk tabel `resignation`
--
ALTER TABLE `resignation`
  ADD PRIMARY KEY (`resignation_id`);

--
-- Indeks untuk tabel `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shift_id`);

--
-- Indeks untuk tabel `termination`
--
ALTER TABLE `termination`
  ADD PRIMARY KEY (`termination_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `departement`
--
ALTER TABLE `departement`
  MODIFY `departement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `education_information`
--
ALTER TABLE `education_information`
  MODIFY `education_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `employee_leave`
--
ALTER TABLE `employee_leave`
  MODIFY `employee_leave_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `employee_overtime`
--
ALTER TABLE `employee_overtime`
  MODIFY `employee_overtime_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `experience_information`
--
ALTER TABLE `experience_information`
  MODIFY `experience_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `family_information`
--
ALTER TABLE `family_information`
  MODIFY `family_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `leave`
--
ALTER TABLE `leave`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `overtime`
--
ALTER TABLE `overtime`
  MODIFY `overtime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `resignation`
--
ALTER TABLE `resignation`
  MODIFY `resignation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `shift`
--
ALTER TABLE `shift`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `termination`
--
ALTER TABLE `termination`
  MODIFY `termination_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
