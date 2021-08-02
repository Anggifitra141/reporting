-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Agu 2021 pada 11.30
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
-- Database: `reporting`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `campaign`
--

CREATE TABLE `campaign` (
  `campaign_id` int(11) NOT NULL,
  `campaign` varchar(50) NOT NULL,
  `is_active` enum('Y','N') NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `campaign`
--

INSERT INTO `campaign` (`campaign_id`, `campaign`, `is_active`, `created_date`) VALUES
(1, 'DUMMY', 'Y', '2021-08-02 05:26:27'),
(2, 'ROLLBACK', 'Y', '2021-08-02 05:31:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `source`
--

CREATE TABLE `source` (
  `source_id` int(11) NOT NULL,
  `trxdate` varchar(50) NOT NULL,
  `sendercountry` int(11) NOT NULL,
  `sendercity` int(11) NOT NULL,
  `receiptcountry` int(11) NOT NULL,
  `receiptcity` int(11) NOT NULL,
  `sendername` varchar(50) NOT NULL,
  `receiptname` varchar(50) NOT NULL,
  `senderphone` varchar(50) NOT NULL,
  `receiptphone` varchar(50) NOT NULL,
  `senderwn` int(11) NOT NULL,
  `receiptwn` int(11) NOT NULL,
  `description` text NOT NULL,
  `nominal` int(11) NOT NULL,
  `date_input` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `source`
--

INSERT INTO `source` (`source_id`, `trxdate`, `sendercountry`, `sendercity`, `receiptcountry`, `receiptcity`, `sendername`, `receiptname`, `senderphone`, `receiptphone`, `senderwn`, `receiptwn`, `description`, `nominal`, `date_input`) VALUES
(26, '20210101', 86, 10, 86, 6, 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 86, 86, 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', 891500, '2021-06-28 01:46:36'),
(27, '20210101', 86, 10, 86, 6, 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', 86, 86, 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', 190000, '2021-06-28 01:46:36'),
(28, '20210101', 86, 10, 86, 6, 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', 86, 86, 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', 100000, '2021-06-28 01:46:36'),
(29, '20210101', 86, 10, 86, 6, 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 86, 86, 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', 7517500, '2021-06-28 01:46:36'),
(30, '20210101', 86, 10, 86, 6, 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 86, 86, 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', 1796500, '2021-06-28 01:46:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbackup`
--

CREATE TABLE `tbackup` (
  `id` int(50) NOT NULL,
  `datestamp` varchar(100) NOT NULL,
  `filedata` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbackup`
--

INSERT INTO `tbackup` (`id`, `datestamp`, `filedata`) VALUES
(2, '2021-06-16 20:48:30', 'backup-210616204830-db.zip');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tcalendar`
--

CREATE TABLE `tcalendar` (
  `id` int(50) NOT NULL,
  `uid` int(10) NOT NULL,
  `trepid` varchar(50) NOT NULL,
  `tcal_date` varchar(50) NOT NULL,
  `tcal_message` varchar(225) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tcalendar`
--

INSERT INTO `tcalendar` (`id`, `uid`, `trepid`, `tcal_date`, `tcal_message`, `status`) VALUES
(1, 1, '1', '2021-03-21', 'QRISM', 'verified'),
(2, 1, '4', '2021-03-21', 'PPATKD', 'unverified'),
(3, 1, '4', '2021-03-01', 'PPATKD', 'printed'),
(4, 1, '4', '2021-03-02', 'PPATKD', 'printed'),
(5, 1, '4', '2021-03-03', 'PPATKD', 'printed'),
(6, 1, '4', '2021-03-04', 'PPATKD', 'printed'),
(7, 1, '4', '2021-03-05', 'PPATKD', 'printed'),
(8, 1, '4', '2021-03-08', 'PPATKD', 'printed'),
(9, 1, '4', '2021-03-09', 'PPATKD', 'printed'),
(10, 1, '4', '2021-03-10', 'PPATKD', 'printed'),
(11, 1, '4', '2021-03-11', 'PPATKD', 'printed'),
(12, 1, '4', '2021-03-12', 'PPATKD', 'printed'),
(13, 1, '4', '2021-03-15', 'PPATKD', 'unverified'),
(14, 1, '4', '2021-03-16', 'PPATKD', 'unverified'),
(15, 1, '4', '2021-03-17', 'PPATKD', 'unverified'),
(16, 1, '4', '2021-03-18', 'PPATKD', 'unverified'),
(17, 1, '4', '2021-03-19', 'PPATKD', 'unverified'),
(18, 1, '4', '2021-03-22', 'PPATKD', 'unverified'),
(19, 1, '4', '2021-03-23', 'PPATKD', 'unverified'),
(20, 1, '4', '2021-03-24', 'PPATKD', 'unverified'),
(21, 1, '4', '2021-03-25', 'PPATKD', 'unverified'),
(22, 1, '4', '2021-03-26', 'PPATKD', 'unverified'),
(23, 1, '4', '2021-03-29', 'PPATKD', 'unverified'),
(24, 1, '4', '2021-03-30', 'PPATKD', 'unverified'),
(25, 1, '4', '2021-03-31', 'PPATKD', 'unverified'),
(26, 1, '4', '2021-04-01', 'PPATKD', 'unverified'),
(27, 1, '4', '2021-04-02', 'PPATKD', 'unverified'),
(28, 1, '5', '2021-03-01', 'QRISW', 'printed'),
(29, 1, '5', '2021-03-08', 'QRISW', 'unverified'),
(30, 1, '5', '2021-03-26', 'QRISW', 'unverified'),
(31, 1, '5', '2021-03-29', 'QRISW', 'unverified'),
(32, 1, '1', '2021-03-24', 'G0001', 'unverified'),
(33, 1, '2', '2021-03-25', 'G0002', 'unverified'),
(34, 1, '3', '2021-03-26', 'G0003', 'unverified');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tcleandatasource1`
--

CREATE TABLE `tcleandatasource1` (
  `id` int(11) NOT NULL,
  `id_data_source` int(11) NOT NULL,
  `campaign` varchar(50) NOT NULL,
  `trxdate` varchar(20) NOT NULL,
  `sendercity` varchar(200) NOT NULL,
  `sendercountry` varchar(200) NOT NULL,
  `receiptcity` varchar(200) NOT NULL,
  `receiptcountry` varchar(200) NOT NULL,
  `sendername` varchar(200) NOT NULL,
  `receiptname` varchar(200) NOT NULL,
  `senderphone` varchar(200) NOT NULL,
  `receiptphone` varchar(200) NOT NULL,
  `senderwn` varchar(200) NOT NULL,
  `receiptwn` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `nominal` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL,
  `datestamp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tcleandatasource1`
--

INSERT INTO `tcleandatasource1` (`id`, `id_data_source`, `campaign`, `trxdate`, `sendercity`, `sendercountry`, `receiptcity`, `receiptcountry`, `sendername`, `receiptname`, `senderphone`, `receiptphone`, `senderwn`, `receiptwn`, `description`, `nominal`, `status`, `datestamp`) VALUES
(38, 123, 'ROLLBACK', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'unverified', '20210802'),
(39, 124, 'ROLLBACK', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'unverified', '20210802'),
(41, 1, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(42, 2, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(43, 3, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(44, 4, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(45, 5, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(46, 6, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(47, 7, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(48, 8, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(49, 9, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(50, 10, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(51, 11, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(52, 12, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(53, 13, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(54, 14, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(55, 15, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(56, 16, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(57, 17, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(58, 18, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(59, 19, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(60, 20, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(61, 21, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(62, 22, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(63, 23, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(64, 24, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(65, 25, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(66, 26, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(67, 27, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(68, 28, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(69, 29, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(70, 30, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(71, 31, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(72, 32, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(73, 33, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(74, 34, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(75, 35, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(76, 36, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(77, 37, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(78, 38, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(79, 39, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(80, 41, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(81, 42, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(82, 43, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(83, 44, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(84, 45, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(85, 46, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(86, 47, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(87, 48, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(88, 49, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(89, 50, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(90, 51, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(91, 52, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(92, 53, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(93, 54, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(94, 55, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(95, 56, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(96, 57, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(97, 58, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(98, 59, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(99, 60, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(100, 61, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(101, 62, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(102, 63, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(103, 64, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(104, 65, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(105, 66, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(106, 67, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(107, 68, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(108, 69, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(109, 70, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(110, 71, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(111, 72, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(112, 73, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(113, 74, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(114, 75, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(115, 76, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(116, 77, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(117, 78, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(118, 79, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(119, 80, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(120, 81, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(121, 82, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(122, 83, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(123, 84, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(124, 85, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(125, 86, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(126, 87, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(127, 88, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(128, 89, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(129, 90, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(130, 91, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(131, 92, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(132, 93, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(133, 94, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(134, 95, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(135, 96, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(136, 97, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(137, 98, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(138, 99, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(139, 100, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(140, 101, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(141, 102, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(142, 103, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(143, 104, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(144, 105, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(145, 106, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(146, 107, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(147, 108, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(148, 109, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(149, 110, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(150, 111, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(151, 112, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(152, 113, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(153, 114, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(154, 115, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802'),
(155, 116, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', 'verified', '20210802'),
(156, 117, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'JOHNY ANDRIANA', '62123456781', '628121170002', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', 'verified', '20210802'),
(157, 118, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'NASRIYANDI', 'MASDERI', '62123456781', '6281219422248', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', 'verified', '20210802'),
(158, 119, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', 'verified', '20210802'),
(159, 120, 'DUMMY', '20210101', '0114 - Kab. Garut ', 'ID-Indonesia', '0110 - Kab. Cianjur ', 'ID-Indonesia', 'PURWO AGUS SUSILO', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', 'ID-Indonesia', 'ID-Indonesia', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', 'verified', '20210802');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tcountrycode`
--

CREATE TABLE `tcountrycode` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tcountrycode`
--

INSERT INTO `tcountrycode` (`id`, `code`, `name`, `description`) VALUES
(1, '62', 'ID-Indonesia', 'Indonesia'),
(2, '852', 'HK-Hongkong', 'Hongkong'),
(3, '82', 'KP-Korea, Democratic Peoples Republic ', 'South Korea'),
(4, '886', 'TW-Taiwan Province Of China', 'Taiwan'),
(5, '81', 'JP-Japan', 'Japan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tdatasource1`
--

CREATE TABLE `tdatasource1` (
  `id` int(11) NOT NULL,
  `campaign` varchar(50) NOT NULL,
  `trxdate` varchar(20) NOT NULL,
  `sendercountry` varchar(200) NOT NULL,
  `sendercity` varchar(200) NOT NULL,
  `receiptcountry` varchar(200) NOT NULL,
  `receiptcity` varchar(200) NOT NULL,
  `sendername` varchar(200) NOT NULL,
  `receiptname` varchar(200) NOT NULL,
  `senderphone` varchar(200) NOT NULL,
  `receiptphone` varchar(200) NOT NULL,
  `senderwn` varchar(200) NOT NULL,
  `receiptwn` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `nominal` varchar(200) NOT NULL,
  `datestamp` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tdatasource1`
--

INSERT INTO `tdatasource1` (`id`, `campaign`, `trxdate`, `sendercountry`, `sendercity`, `receiptcountry`, `receiptcity`, `sendername`, `receiptname`, `senderphone`, `receiptphone`, `senderwn`, `receiptwn`, `description`, `nominal`, `datestamp`, `status`) VALUES
(1, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(2, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(3, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(4, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(5, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(6, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(7, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(8, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(9, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(10, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(11, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(12, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(13, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(14, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(15, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(16, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(17, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(18, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(19, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(20, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(21, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(22, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(23, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(24, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(25, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(26, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(27, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(28, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(29, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(30, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(31, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(32, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(33, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(34, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(35, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(36, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(37, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(38, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(39, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(40, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'rollback'),
(41, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(42, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(43, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(44, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(45, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(46, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(47, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(48, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(49, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(50, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(51, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(52, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(53, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(54, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(55, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(56, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(57, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(58, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(59, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(60, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(61, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(62, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(63, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(64, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(65, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(66, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(67, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(68, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(69, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(70, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(71, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(72, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(73, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(74, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(75, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(76, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(77, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(78, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(79, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(80, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(81, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(82, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(83, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(84, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(85, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(86, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(87, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(88, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(89, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(90, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(91, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(92, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(93, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(94, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(95, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(96, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(97, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(98, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(99, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(100, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(101, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(102, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(103, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(104, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(105, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(106, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(107, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(108, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(109, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(110, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(111, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(112, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(113, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(114, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(115, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(116, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(117, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(118, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(119, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(120, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(121, 'ROLLBACK', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'old'),
(122, 'ROLLBACK', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'old'),
(123, 'ROLLBACK', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'old'),
(124, 'ROLLBACK', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'old'),
(125, 'ROLLBACK', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'old'),
(126, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(127, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(128, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(129, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(130, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(131, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(132, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(133, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(134, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(135, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(136, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(137, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(138, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(139, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(140, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(141, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(142, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(143, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(144, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(145, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(146, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(147, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(148, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(149, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(150, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(151, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(152, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(153, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(154, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(155, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(156, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(157, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(158, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(159, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(160, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(161, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(162, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(163, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(164, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(165, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(166, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(167, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(168, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(169, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(170, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(171, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(172, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(173, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(174, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(175, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(176, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(177, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(178, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(179, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(180, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(181, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(182, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(183, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(184, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(185, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(186, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(187, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(188, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(189, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(190, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(191, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(192, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(193, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(194, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(195, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(196, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(197, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(198, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(199, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(200, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(201, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(202, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(203, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(204, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new');
INSERT INTO `tdatasource1` (`id`, `campaign`, `trxdate`, `sendercountry`, `sendercity`, `receiptcountry`, `receiptcity`, `sendername`, `receiptname`, `senderphone`, `receiptphone`, `senderwn`, `receiptwn`, `description`, `nominal`, `datestamp`, `status`) VALUES
(205, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(206, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(207, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(208, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(209, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(210, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(211, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(212, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(213, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(214, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(215, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(216, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(217, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(218, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(219, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(220, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(221, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(222, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(223, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(224, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(225, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(226, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(227, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(228, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(229, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(230, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(231, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(232, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(233, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(234, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(235, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(236, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(237, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(238, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(239, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(240, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new'),
(241, 'DUMMY', '20210101', '86', '10', '86', '6', 'BUNGA SUCIANTI', 'BUNGA SUCIANTI', '62123456781', '6281213812244', '86', '86', 'Anda mendapat kiriman sebesar 891500 dari BUNGA SUCIANTI ke no rek.1520014288753', '891500', '20210802', 'new'),
(242, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'JOHNY ANDRIANA', '62123456781', '628121170002', '86', '86', 'Anda mendapat kiriman sebesar 190000 dari Nasriyandi ke no rek.5720368350', '190000', '20210802', 'new'),
(243, 'DUMMY', '20210101', '86', '10', '86', '6', 'Nasriyandi', 'MASDERI', '62123456781', '6281219422248', '86', '86', 'Anda mendapat kiriman sebesar 100000 dari Nasriyandi ke no rek.080401004468507', '100000', '20210802', 'new'),
(244, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo AGUS Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6285222098176', '86', '86', 'Anda mendapat kiriman sebesar 7517500 dari Purwo AGUS Susilo ke no rek.059301003933508', '7517500', '20210802', 'new'),
(245, 'DUMMY', '20210101', '86', '10', '86', '6', 'Purwo Agus Susilo', 'PURWO AGUS SUSILO B.', '62123456781', '6281299899162', '86', '86', 'Anda mendapat kiriman sebesar 1796500 dari Purwo Agus Susilo ke no rek.059301003933508', '1796500', '20210802', 'new');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlogact`
--

CREATE TABLE `tlogact` (
  `id` int(11) NOT NULL,
  `uid` varchar(20) NOT NULL,
  `actlevel` varchar(20) NOT NULL,
  `actcategory` varchar(20) NOT NULL,
  `actcode` varchar(20) NOT NULL,
  `actlog` text NOT NULL,
  `datestamp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tlogact`
--

INSERT INTO `tlogact` (`id`, `uid`, `actlevel`, `actcategory`, `actcode`, `actlog`, `datestamp`) VALUES
(1, '1', '999', 'Information', '000001', 'Upload data source', '2021-07-20 21:34:00'),
(2, '1', '999', 'Information', '000001', 'Cleaning source (Manual)', '2021-07-20 21:35:00'),
(3, '1', '999', 'Information', '000001', 'QIRSW Report - Printed', '2021-07-20 21:36:00'),
(4, '1', '999', 'Information', '000001', 'QIRSW Report - Generated', '2021-07-20 21:37:00'),
(5, '1', '999', 'Information', '000001', 'PPATKD Report - Printed', '2021-07-20 21:38:00'),
(6, '1', '999', 'Information', '000001', 'PPATKD Report - Generated', '2021-07-20 21:39:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_01_subtype`
--

CREATE TABLE `tltkl_01_subtype` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_01_subtype`
--

INSERT INTO `tltkl_01_subtype` (`id`, `code`, `description`, `status`) VALUES
(1, 'E', 'Elektronis', 'active'),
(2, 'M', 'Manual', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_02_fundtype`
--

CREATE TABLE `tltkl_02_fundtype` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_02_fundtype`
--

INSERT INTO `tltkl_02_fundtype` (`id`, `code`, `description`, `status`) VALUES
(1, 'UT', 'Uang Tunai', 'active'),
(2, 'REK', 'Rekening', 'active'),
(3, 'CEK', 'Cek', 'active'),
(4, 'BG', 'Bilyet Giro', 'active'),
(5, 'BD', 'Bank Draft', 'active'),
(6, 'TCQ', 'Travellers Cheque', 'active'),
(7, 'UE', 'Uang Elektronik', 'active'),
(8, 'EFK', 'Rekening Efek', 'active'),
(9, 'WSL', 'Wesel', 'active'),
(10, 'OBL', 'Obligasi', 'active'),
(11, 'VA', 'Virtual Aset', 'active'),
(12, 'MAS', 'Emas', 'active'),
(13, 'OTH', 'Lainnya', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_03_acctype`
--

CREATE TABLE `tltkl_03_acctype` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_03_acctype`
--

INSERT INTO `tltkl_03_acctype` (`id`, `code`, `description`, `status`) VALUES
(1, 'TEN', 'Tabungan Korporasi', 'active'),
(2, 'TPE', 'Tabungan Perseorangan', 'active'),
(3, 'GEN', 'Giro Entitas', 'active'),
(4, 'GPE', 'Giro Perorangan', 'active'),
(5, 'ELA', 'Lainnya Entitas', 'active'),
(6, 'PLA', 'Lainnya Perorangan', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_04_accstat`
--

CREATE TABLE `tltkl_04_accstat` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_04_accstat`
--

INSERT INTO `tltkl_04_accstat` (`id`, `code`, `description`, `status`) VALUES
(1, 'AKT', 'Aktif', 'active'),
(2, 'DOR', 'Dormant', 'active'),
(3, 'TTP', 'Tutup', 'active'),
(4, 'BLK', 'Blokir', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_05_idtype`
--

CREATE TABLE `tltkl_05_idtype` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_05_idtype`
--

INSERT INTO `tltkl_05_idtype` (`id`, `code`, `description`, `status`) VALUES
(1, 'KTP', 'Kartu Tanda Penduduk', 'active'),
(2, 'SIM', 'Surat Izin Mengemudi', 'active'),
(3, 'PAS', 'Paspor', 'active'),
(4, 'KTM', 'Kartu Pelajar/Mahasiswa', 'active'),
(5, 'KITAP', 'Kartu Izin Tinggal Tetap', 'active'),
(6, 'KITAS', 'Kartu Izin Tinggal Terbatas', 'active'),
(7, 'SUKET', 'Surat Keterangan Kependudukan', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_06_trxmode`
--

CREATE TABLE `tltkl_06_trxmode` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_06_trxmode`
--

INSERT INTO `tltkl_06_trxmode` (`id`, `code`, `description`, `status`) VALUES
(1, 'TMLN', 'Transfer Masuk - LN Swift', 'active'),
(2, 'TMLNS', 'Transfer Masuk - LN Non Swift', 'active'),
(3, 'TMDN', 'Transfer Masuk - DN', 'active'),
(4, 'TKLN', 'Transfer Keluar - LN Swift', 'active'),
(5, 'TKLNS', 'Transfer Keluar - LN Non Swift', 'active'),
(6, 'TKDN', 'Transfer Keluar - DN', 'active'),
(7, 'SETOR', 'Penyetoran Tunai', 'active'),
(8, 'STRNT', 'Penyetoran Non Tunai', 'active'),
(9, 'PJVAL', 'Penjualan Valas', 'active'),
(10, 'JKMDT', 'Penjualan Komoditi', 'active'),
(11, 'JEFEK', 'Penjualan Efek', 'active'),
(12, 'PJBRG', 'Penjualan Barang', 'active'),
(13, 'KRM', 'Pengiriman Uang', 'active'),
(14, 'TRM', 'Penerimaan Uang', 'active'),
(15, 'TARIK', 'Penarikan Tunai', 'active'),
(16, 'PNJM', 'Peminjaman', 'active'),
(17, 'PBK', 'Pemindahbukuan', 'active'),
(18, 'PBVAL', 'Pembelian Valas', 'active'),
(19, 'BKMDT', 'Pembelian Komoditi', 'active'),
(20, 'BEFEK', 'Pembelian Efek', 'active'),
(21, 'PBBRG', 'Pembelian Barang', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_07_trxtype`
--

CREATE TABLE `tltkl_07_trxtype` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_07_trxtype`
--

INSERT INTO `tltkl_07_trxtype` (`id`, `code`, `description`, `status`) VALUES
(1, 'JUAL', 'Penjualan', 'active'),
(2, 'PBL', 'Pembelian', 'active'),
(3, 'KSY', 'Konsinyasi', 'active'),
(4, 'SEWA', 'Sewa Menyewa', 'active'),
(5, 'LM', 'Pengolahan dan Pemurnian Logam Mulia (Refining)', 'active'),
(6, 'TAM', 'Tukar Tambah', 'active'),
(7, 'LLG', 'Lelang', 'active'),
(8, 'HIB', 'Hibah', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_08_reporttype`
--

CREATE TABLE `tltkl_08_reporttype` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_08_reporttype`
--

INSERT INTO `tltkl_08_reporttype` (`id`, `code`, `description`, `status`) VALUES
(1, 'LTKTM', 'LTKT -  Kas Masuk', 'active'),
(2, 'LTKTK', 'LTKT -  Kas Keluar', 'active'),
(3, 'LTKMT', 'LTKM - Terkait Transaksi Pendanaan Terorisme', 'active'),
(4, 'LAPT', 'LTKM - Terkait Aktivitas Pendanaan Terorisme', 'active'),
(5, 'LTKMH', 'LTKM - Sebagai Akibat Pemutusan Hubungan Usaha', 'active'),
(6, 'LTKM', 'LTKM - Laporan Transaksi Keuangan Mencurigakan', 'active'),
(7, 'LTKMP', 'LTKM - Atas Permintaan PPATK', 'active'),
(8, 'TKLOP', 'LTKL - Outgoing PTD', 'active'),
(9, 'TKLOB', 'LTKL - Outgoing Bank', 'active'),
(10, 'TKLIP', 'LTKL - Incoming PTD', 'active'),
(11, 'TKLIB', 'LTKL - Incoming Bank', 'active'),
(12, 'PITP', 'Penyampaian Informasi Permintaan PPATK', 'active'),
(13, 'PDTP', 'Penyampaian Data Transaksi Permintaan PPATK', 'active'),
(14, 'TUNDA', 'Penyampaian BA Penundaan Transaksi', 'active'),
(15, 'HENTI', 'Penyampaian BA Penghentian Sementara Transaksi', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_09_contactcat`
--

CREATE TABLE `tltkl_09_contactcat` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_09_contactcat`
--

INSERT INTO `tltkl_09_contactcat` (`id`, `code`, `description`, `status`) VALUES
(1, 'K', 'Kantor', 'active'),
(2, 'R', 'Rumah', 'active'),
(3, 'D', 'Domisili', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_10_commtype`
--

CREATE TABLE `tltkl_10_commtype` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_10_commtype`
--

INSERT INTO `tltkl_10_commtype` (`id`, `code`, `description`, `status`) VALUES
(1, 'PSTN', 'PSTN', 'active'),
(2, 'FAX', 'Fax', 'active'),
(3, 'MOB', 'Mobile', 'active'),
(4, 'SAT', 'Satelit', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_11_companytype`
--

CREATE TABLE `tltkl_11_companytype` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_11_companytype`
--

INSERT INTO `tltkl_11_companytype` (`id`, `code`, `description`, `status`) VALUES
(1, 'PT', 'Perseroan Terbatas', 'active'),
(2, 'YAY', 'Yayasan', 'active'),
(3, 'PKP', 'Perkumpulan', 'active'),
(4, 'KOP', 'Koperasi', 'active'),
(5, 'CV', 'Persekutuan Komanditer', 'active'),
(6, 'PFI', 'Persekutuan Firma', 'active'),
(7, 'FTR', 'Foreign Trust', 'active'),
(8, 'PDG', 'Perusahaan Dagang atau Usaha Dagang', 'active'),
(9, 'ORM', 'Organisasi Masyarakat', 'active'),
(10, 'LP', 'Lembaga Pemerintah', 'active'),
(11, 'PD', 'Perusahaan Daerah', 'active'),
(12, 'BHA', 'Badan Hukum Asing', 'active'),
(13, 'OTH', 'Lainnya', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_12_stufftype`
--

CREATE TABLE `tltkl_12_stufftype` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_12_stufftype`
--

INSERT INTO `tltkl_12_stufftype` (`id`, `code`, `description`, `status`) VALUES
(1, 'PPL', 'Permata, Perhiasan, Logam Mulia', 'active'),
(2, 'BAS', 'Barang Antik atau Seni', 'active'),
(3, 'BL', 'Barang Lelang', 'active'),
(4, 'P', 'Properti', 'active'),
(5, 'V', 'Kendaraan Bermotor', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_13_currency`
--

CREATE TABLE `tltkl_13_currency` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_13_currency`
--

INSERT INTO `tltkl_13_currency` (`id`, `code`, `description`, `status`) VALUES
(1, 'AFN', 'Afghan afghani', 'active'),
(2, 'DZD', 'Algerian Dinar', 'active'),
(3, 'AOA', 'Angolan kwanza', 'active'),
(4, 'ARS', 'Argentinean Nuevo Peso', 'active'),
(5, 'AWG', 'Aruban Guilder', 'active'),
(6, 'AUD', 'Australian Dollar', 'active'),
(7, 'AZN', 'Azerbaijani manat', 'active'),
(8, 'BSD', 'Bahamian Dollar', 'active'),
(9, 'BHD', 'Bahraini Dinar', 'active'),
(10, 'THB', 'Baht', 'active'),
(11, 'PAB', 'Balboa', 'active'),
(12, 'BBD', 'Barbados Dollar', 'active'),
(13, 'BYR', 'Belarussian Rouble', 'active'),
(14, 'BZD', 'Belize Dollar', 'active'),
(15, 'BMD', 'Bermudian Dollar', 'active'),
(16, 'BOB', 'Boliviano', 'active'),
(17, 'BND', 'Brunei Dollar', 'active'),
(18, 'BGN', 'Bulgarian lev', 'active'),
(19, 'BIF', 'Burundi Franc', 'active'),
(20, 'CAD', 'Canadian Dollar', 'active'),
(21, 'KYD', 'Cayman Islands Dollar', 'active'),
(22, 'CLP', 'Chilean Peso', 'active'),
(23, 'XTS', 'Code reserved for testing purposes', 'active'),
(24, 'COP', 'Colombian Peso', 'active'),
(25, 'KMF', 'Comorian Franc', 'active'),
(26, 'CDF', 'Congolese franc', 'active'),
(27, 'BEC', 'Convertible Belgian Franc (no longer in use)', 'active'),
(28, 'BAM', 'Convertible Mark', 'active'),
(29, 'NIO', 'Cordoba oro', 'active'),
(30, 'CRC', 'Costa Rican Colón', 'active'),
(31, 'HRK', 'Croatian Kuna', 'active'),
(32, 'CUP', 'Cuban Peso', 'active'),
(33, 'CZK', 'Czech Koruna', 'active'),
(34, 'GMD', 'Dalasi', 'active'),
(35, 'DKK', 'Danish Krone', 'active'),
(36, 'KPW', 'Democratic Peoples Republic of Korean Won', 'active'),
(37, 'DJF', 'Djibouti Franc', 'active'),
(38, 'STD', 'Dobra', 'active'),
(39, 'DOP', 'Dominican Republic Peso', 'active'),
(40, 'AMD', 'Dram', 'active'),
(41, 'XCD', 'East Caribbean Dollar', 'active'),
(42, 'EGP', 'Egyptian Pound', 'active'),
(43, 'ERN', 'Eritrean Nakfa', 'active'),
(44, 'CVE', 'Escudo Caboverdiano', 'active'),
(45, 'ETB', 'Ethiopian Birr', 'active'),
(46, 'EUR', 'Euro (replacement name for the ECU)', 'active'),
(47, 'XBA', 'European Composite Unit', 'active'),
(48, 'XBB', 'European Monetary Unit', 'active'),
(49, 'XBD', 'European Unit of Account 17', 'active'),
(50, 'XBC', 'European Unit of Account 9', 'active'),
(51, 'FKP', 'Falkland Pound', 'active'),
(52, 'FJD', 'Fiji Dollar', 'active'),
(53, 'BEL', 'Financial Belgian Franc (no longer in use)', 'active'),
(54, 'HUF', 'Forint', 'active'),
(55, 'XAF', 'Franc de la Communauté financière africaine', 'active'),
(56, 'XPF', 'Franc des Comptoirs français du Pacifique', 'active'),
(57, 'GHS', 'Ghanaian cedi', 'active'),
(58, 'GIP', 'Gibraltar Pound', 'active'),
(59, 'XAU', 'Gold', 'active'),
(60, 'HTG', 'Gourde', 'active'),
(61, 'PYG', 'Guarani', 'active'),
(62, 'GNF', 'Guinean franc', 'active'),
(63, 'GYD', 'Guyana Dollar', 'active'),
(64, 'HKD', 'Hong Kong Dollar', 'active'),
(65, 'UAH', 'Hryvna', 'active'),
(66, 'ISK', 'Icelandic Króna', 'active'),
(67, 'UKP', 'Incorrectly used for GBP', 'active'),
(68, 'INR', 'Indian Rupee', 'active'),
(69, 'XDR', 'International Monetary Fund Special Drawing Rights', 'active'),
(70, 'IRR', 'Iranian Rial', 'active'),
(71, 'IQD', 'Iraqi Dinar', 'active'),
(72, 'JMD', 'Jamaican Dollar', 'active'),
(73, 'JOD', 'Jordanian Dinar', 'active'),
(74, 'KES', 'Kenyan Shilling', 'active'),
(75, 'PGK', 'Kina', 'active'),
(76, 'LAK', 'Kip', 'active'),
(77, 'EEK', 'Kroon', 'active'),
(78, 'KWD', 'Kuwaiti Dinar', 'active'),
(79, 'AOK', 'Kwanza', 'active'),
(80, 'MMK', 'Kyat', 'active'),
(81, 'KGS', 'Kyrgyzstani Som', 'active'),
(82, 'GEL', 'Lari', 'active'),
(83, 'LVL', 'Lats', 'active'),
(84, 'LBP', 'Lebanese Pound', 'active'),
(85, 'ALL', 'Lek', 'active'),
(86, 'HNL', 'Lempira', 'active'),
(87, 'SLL', 'Leone', 'active'),
(88, 'LRD', 'Liberian Dollar', 'active'),
(89, 'LYD', 'Libyan Dinar', 'active'),
(90, 'SZL', 'Lilangeni', 'active'),
(91, 'LTL', 'Litas', 'active'),
(92, 'LSL', 'Loti', 'active'),
(93, 'MKD', 'Macedonian Dinar', 'active'),
(94, 'MGA', 'Malagasy ariary', 'active'),
(95, 'MWK', 'Malawian Kwacha', 'active'),
(96, 'LSM', 'Maloti', 'active'),
(97, 'MTP', 'Maltese Pound, replaced by Maltese Lira', 'active'),
(98, 'MUR', 'Mauritius Rupee', 'active'),
(99, 'MXN', 'Mexican New Peso (replacement for Mexican Peso)', 'active'),
(100, 'MDL', 'Moldavian Leu', 'active'),
(101, 'MAD', 'Moroccan Dirham', 'active'),
(102, 'MZN', 'Mozambican metical', 'active'),
(103, 'NGN', 'Naira', 'active'),
(104, 'NAD', 'Namibian Dollar', 'active'),
(105, 'NPR', 'Nepalese Rupee', 'active'),
(106, 'ANG', 'Netherlands Antilles Guilder', 'active'),
(107, 'PEN', 'New Sol', 'active'),
(108, 'CDZ', 'New Zaïre', 'active'),
(109, 'NZD', 'New Zealand Dollar', 'active'),
(110, 'PLN', 'New Zloty', 'active'),
(111, 'BTN', 'Ngultrum', 'active'),
(112, 'XXX', 'No currency', 'active'),
(113, 'NOK', 'Norwegian Krone', 'active'),
(114, 'OMR', 'Omani Rial', 'active'),
(115, 'MRO', 'Ouguiya', 'active'),
(116, 'TOP', 'Pa anga', 'active'),
(117, 'PKR', 'Pakistani Rupee', 'active'),
(118, 'XPD', 'Palladium (one troy ounce)', 'active'),
(119, 'MOP', 'Pataca', 'active'),
(120, 'PHP', 'Philippines Peso', 'active'),
(121, 'XPT', 'Platinum (one troy ounce)', 'active'),
(122, 'GBP', 'Pound Sterling (United Kingdom Pound)', 'active'),
(123, 'BWP', 'Pula', 'active'),
(124, 'QAR', 'Qatari Riyal', 'active'),
(125, 'GTQ', 'Quetzal', 'active'),
(126, 'ZAR', 'Rand', 'active'),
(127, 'BRL', 'Real', 'active'),
(128, 'BUK', 'Replaced by MMK', 'active'),
(129, 'KRW', 'Republic of Korean Won', 'active'),
(130, 'KHR', 'Riel', 'active'),
(131, 'MYR', 'Ringgit (also known as Malaysian Dollar)', 'active'),
(132, 'RON', 'Romanian new leu', 'active'),
(133, 'MVR', 'Rufiyaa', 'active'),
(134, 'IDR', 'Rupiah', 'active'),
(135, 'RUB', 'Russian Federation Rouble (formerly RUR)', 'active'),
(136, 'RWF', 'Rwandan Franc', 'active'),
(137, 'SAR', 'Saudi Riyal', 'active'),
(138, 'RSD', 'Serbian dinar', 'active'),
(139, 'SCR', 'Seychelles Rupee', 'active'),
(140, 'ILS', 'Shekel', 'active'),
(141, 'XAG', 'Silver (one troy ounce)', 'active'),
(142, 'SGD', 'Singapore Dollar', 'active'),
(143, 'PES', 'Sol (replaced by New Sol [PEN])', 'active'),
(144, 'SBD', 'Solomon Islands Dollar', 'active'),
(145, 'SOS', 'Somali Shilling', 'active'),
(146, 'SSP', 'South Sudanese Pound', 'active'),
(147, 'LKR', 'Sri Lankan Rupee', 'active'),
(148, 'SHP', 'St Helena Pound', 'active'),
(149, 'SDG', 'Sudanese pound', 'active'),
(150, 'SRD', 'Surinamese dollar', 'active'),
(151, 'SEK', 'Swedish Krona', 'active'),
(152, 'CHF', 'Swiss Franc', 'active'),
(153, 'GNS', 'Syli (also known as Guinea Franc)', 'active'),
(154, 'SYP', 'Syrian Pound', 'active'),
(155, 'TWD', 'Taiwan Dollar', 'active'),
(156, 'TJS', 'Tajikistani somoni', 'active'),
(157, 'BDT', 'Taka', 'active'),
(158, 'WST', 'Tala', 'active'),
(159, 'TZS', 'Tanzanian Shilling', 'active'),
(160, 'KZT', 'Tenge', 'active'),
(161, 'TPE', 'Timorian Escudo', 'active'),
(162, 'TTD', 'Trinidad and Tobago Dollar', 'active'),
(163, 'MNT', 'Tugrik', 'active'),
(164, 'TND', 'Tunisian Dinar', 'active'),
(165, 'TRY', 'Turkish lira', 'active'),
(166, 'TMT', 'Turkmenistani manat', 'active'),
(167, 'UGX', 'Ugandan shilling', 'active'),
(168, 'XFU', 'UIC franc (special settlement currency)', 'active'),
(169, 'COU', 'Unidad de Valor Real', 'active'),
(170, 'CLF', 'Unidades de Fomento', 'active'),
(171, 'AED', 'United Arab Emirates Dirham', 'active'),
(172, 'USD', 'United States Dollar', 'active'),
(173, 'USN', 'United States Dollar (Next day)', 'active'),
(174, 'USS', 'United States Dollar (Same day)', 'active'),
(175, '-', 'UNKNOWN', 'active'),
(176, 'UYU', 'Uruguayan New Peso', 'active'),
(177, 'UYP', 'Uruguayan Peso, replaced by Uruguayan New Peso (UYU)', 'active'),
(178, 'UZS', 'Uzbekistani Som', 'active'),
(179, 'VUV', 'Vatu', 'active'),
(180, 'VEF', 'Venezuelan bolívar fuerte', 'active'),
(181, 'VND', 'Viet Nam Dông', 'active'),
(182, 'XOF', 'West African Franc', 'active'),
(183, 'CHW', 'WIR Bank (complementary currency)', 'active'),
(184, 'CHE', 'WIR Bank (complementary currency)', 'active'),
(185, 'YER', 'Yemeni Riyal', 'active'),
(186, 'JPY', 'Yen', 'active'),
(187, 'CNY', 'Yuan Renminbi', 'active'),
(188, 'ZMW', 'Zambian Kwacha', 'active'),
(189, 'ZMK', 'Zambian Kwacha (obsolete)', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_14_country`
--

CREATE TABLE `tltkl_14_country` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_14_country`
--

INSERT INTO `tltkl_14_country` (`id`, `code`, `description`, `status`) VALUES
(1, 'AF', 'AFGHANISTAN', 'active'),
(2, 'AX', 'ÅLAND ISLANDS', 'active'),
(3, 'AL', 'ALBANIA', 'active'),
(4, 'DZ', 'ALGERIA', 'active'),
(5, 'AS', 'AMERICAN SAMOA', 'active'),
(6, 'AD', 'ANDORRA', 'active'),
(7, 'AO', 'ANGOLA', 'active'),
(8, 'AI', 'ANGUILLA', 'active'),
(9, 'AQ', 'ANTARCTICA', 'active'),
(10, 'AG', 'ANTIGUA AND BARBUDA', 'active'),
(11, 'AR', 'ARGENTINA', 'active'),
(12, 'AM', 'ARMENIA', 'active'),
(13, 'AW', 'ARUBA', 'active'),
(14, 'AU', 'AUSTRALIA', 'active'),
(15, 'AT', 'AUSTRIA', 'active'),
(16, 'AZ', 'AZERBAIJAN', 'active'),
(17, 'BS', 'BAHAMAS', 'active'),
(18, 'BH', 'BAHRAIN', 'active'),
(19, 'BD', 'BANGLADESH', 'active'),
(20, 'BB', 'BARBADOS', 'active'),
(21, 'BY', 'BELARUS', 'active'),
(22, 'BE', 'BELGIUM', 'active'),
(23, 'BZ', 'BELIZE', 'active'),
(24, 'BJ', 'BENIN', 'active'),
(25, 'BM', 'BERMUDA', 'active'),
(26, 'BT', 'BHUTAN', 'active'),
(27, 'BO', 'BOLIVIA', 'active'),
(28, 'BQ', 'Bonaire,  Saint Eustatius and Saba', 'active'),
(29, 'BA', 'BOSNIA AND HERZEGOVINA', 'active'),
(30, 'BW', 'BOTSWANA', 'active'),
(31, 'BV', 'BOUVET ISLAND', 'active'),
(32, 'BR', 'BRAZIL', 'active'),
(33, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'active'),
(34, 'BN', 'BRUNEI DARUSSALAM', 'active'),
(35, 'BG', 'BULGARIA', 'active'),
(36, 'BF', 'BURKINA FASO', 'active'),
(37, 'BI', 'BURUNDI', 'active'),
(38, 'KH', 'CAMBODIA', 'active'),
(39, 'CM', 'CAMEROON', 'active'),
(40, 'CA', 'CANADA', 'active'),
(41, 'CV', 'CAPE VERDE', 'active'),
(42, 'KY', 'CAYMAN ISLANDS', 'active'),
(43, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'active'),
(44, 'TD', 'CHAD', 'active'),
(45, 'CL', 'CHILE', 'active'),
(46, 'CN', 'CHINA', 'active'),
(47, 'CX', 'CHRISTMAS ISLAND', 'active'),
(48, 'CC', 'COCOS (KEELING) ISLANDS', 'active'),
(49, 'CO', 'COLOMBIA', 'active'),
(50, 'KM', 'COMOROS', 'active'),
(51, 'CG', 'CONGO', 'active'),
(52, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'active'),
(53, 'CK', 'COOK ISLANDS', 'active'),
(54, 'CR', 'COSTA RICA', 'active'),
(55, 'CI', 'COTE D IVOIRE', 'active'),
(56, 'HR', 'CROATIA', 'active'),
(57, 'CU', 'CUBA', 'active'),
(58, 'CW', 'Curaçao', 'active'),
(59, 'CY', 'CYPRUS', 'active'),
(60, 'CZ', 'CZECH REPUBLIC', 'active'),
(61, 'DK', 'DENMARK', 'active'),
(62, 'DJ', 'DJIBOUTI', 'active'),
(63, 'DM', 'DOMINICA', 'active'),
(64, 'DO', 'DOMINICAN REPUBLIC', 'active'),
(65, 'EC', 'ECUADOR', 'active'),
(66, 'EG', 'EGYPT', 'active'),
(67, 'SV', 'EL SALVADOR', 'active'),
(68, 'GQ', 'EQUATORIAL GUINEA', 'active'),
(69, 'ER', 'ERITREA', 'active'),
(70, 'EE', 'ESTONIA', 'active'),
(71, 'ET', 'ETHIOPIA', 'active'),
(72, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'active'),
(73, 'FO', 'FAROE ISLANDS', 'active'),
(74, 'FJ', 'FIJI', 'active'),
(75, 'FI', 'FINLAND', 'active'),
(76, 'FR', 'FRANCE', 'active'),
(77, 'GF', 'FRENCH GUIANA', 'active'),
(78, 'PF', 'FRENCH POLYNESIA', 'active'),
(79, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'active'),
(80, 'GA', 'GABON', 'active'),
(81, 'GM', 'GAMBIA', 'active'),
(82, 'GE', 'GEORGIA', 'active'),
(83, 'DE', 'GERMANY', 'active'),
(84, 'GH', 'GHANA', 'active'),
(85, 'GI', 'GIBRALTAR', 'active'),
(86, 'GR', 'GREECE', 'active'),
(87, 'GL', 'GREENLAND', 'active'),
(88, 'GD', 'GRENADA', 'active'),
(89, 'GP', 'GUADELOUPE', 'active'),
(90, 'GU', 'GUAM', 'active'),
(91, 'GT', 'GUATEMALA', 'active'),
(92, 'GG', 'GUERNSEY', 'active'),
(93, 'GN', 'GUINEA', 'active'),
(94, 'GW', 'GUINEA-BISSAU', 'active'),
(95, 'GY', 'GUYANA', 'active'),
(96, 'HT', 'HAITI', 'active'),
(97, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'active'),
(98, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'active'),
(99, 'HN', 'HONDURAS', 'active'),
(100, 'HK', 'HONG KONG', 'active'),
(101, 'HU', 'HUNGARY', 'active'),
(102, 'IS', 'ICELAND', 'active'),
(103, 'IN', 'INDIA', 'active'),
(104, 'ID', 'INDONESIA', 'active'),
(105, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'active'),
(106, 'IQ', 'IRAQ', 'active'),
(107, 'IE', 'IRELAND', 'active'),
(108, 'IM', 'ISLE OF MAN', 'active'),
(109, 'IL', 'ISRAEL', 'active'),
(110, 'IT', 'ITALY', 'active'),
(111, 'JM', 'JAMAICA', 'active'),
(112, 'JP', 'JAPAN', 'active'),
(113, 'JE', 'JERSEY', 'active'),
(114, 'JO', 'JORDAN', 'active'),
(115, 'KZ', 'KAZAKHSTAN', 'active'),
(116, 'KE', 'KENYA', 'active'),
(117, 'KI', 'KIRIBATI', 'active'),
(118, 'KP', 'KOREA, DEMOCRATIC PEOPLES REPUBLIC OF', 'active'),
(119, 'KR', 'KOREA, REPUBLIC OF', 'active'),
(120, 'XK', 'KOSOVO', 'active'),
(121, 'KS', 'KOSOVO (Old - KS)', 'active'),
(122, 'KW', 'KUWAIT', 'active'),
(123, 'KG', 'KYRGYZSTAN', 'active'),
(124, 'LA', 'LAO PEOPLES DEMOCRATIC REPUBLIC', 'active'),
(125, 'LV', 'LATVIA', 'active'),
(126, 'LB', 'LEBANON', 'active'),
(127, 'LS', 'LESOTHO', 'active'),
(128, 'LR', 'LIBERIA', 'active'),
(129, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'active'),
(130, 'LI', 'LIECHTENSTEIN', 'active'),
(131, 'LT', 'LITHUANIA', 'active'),
(132, 'LU', 'LUXEMBOURG', 'active'),
(133, 'MO', 'MACAO', 'active'),
(134, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'active'),
(135, 'MG', 'MADAGASCAR', 'active'),
(136, 'MW', 'MALAWI', 'active'),
(137, 'MY', 'MALAYSIA', 'active'),
(138, 'MV', 'MALDIVES', 'active'),
(139, 'ML', 'MALI', 'active'),
(140, 'MT', 'MALTA', 'active'),
(141, 'MH', 'MARSHALL ISLANDS', 'active'),
(142, 'MQ', 'MARTINIQUE', 'active'),
(143, 'MR', 'MAURITANIA', 'active'),
(144, 'MU', 'MAURITIUS', 'active'),
(145, 'YT', 'MAYOTTE', 'active'),
(146, 'MX', 'MEXICO', 'active'),
(147, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'active'),
(148, 'MD', 'MOLDOVA, REPUBLIC OF', 'active'),
(149, 'MC', 'MONACO', 'active'),
(150, 'MN', 'MONGOLIA', 'active'),
(151, 'ME', 'Montenegro', 'active'),
(152, 'MS', 'MONTSERRAT', 'active'),
(153, 'MA', 'MOROCCO', 'active'),
(154, 'MZ', 'MOZAMBIQUE', 'active'),
(155, 'MM', 'MYANMAR', 'active'),
(156, 'NA', 'NAMIBIA', 'active'),
(157, 'NR', 'NAURU', 'active'),
(158, 'NP', 'NEPAL', 'active'),
(159, 'NL', 'NETHERLANDS', 'active'),
(160, 'AN', 'NETHERLANDS ANTILLES', 'active'),
(161, 'NC', 'NEW CALEDONIA', 'active'),
(162, 'NZ', 'NEW ZEALAND', 'active'),
(163, 'NI', 'NICARAGUA', 'active'),
(164, 'NE', 'NIGER', 'active'),
(165, 'NG', 'NIGERIA', 'active'),
(166, 'NU', 'NIUE', 'active'),
(167, 'NF', 'NORFOLK ISLAND', 'active'),
(168, 'MP', 'NORTHERN MARIANA ISLANDS', 'active'),
(169, 'NO', 'NORWAY', 'active'),
(170, 'OM', 'OMAN', 'active'),
(171, 'PK', 'PAKISTAN', 'active'),
(172, 'PW', 'PALAU', 'active'),
(173, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'active'),
(174, 'PA', 'PANAMA', 'active'),
(175, 'PG', 'PAPUA NEW GUINEA', 'active'),
(176, 'PY', 'PARAGUAY', 'active'),
(177, 'PE', 'PERU', 'active'),
(178, 'PH', 'PHILIPPINES', 'active'),
(179, 'PN', 'PITCAIRN', 'active'),
(180, 'PL', 'POLAND', 'active'),
(181, 'PT', 'PORTUGAL', 'active'),
(182, 'PR', 'PUERTO RICO', 'active'),
(183, 'QA', 'QATAR', 'active'),
(184, 'RE', 'REUNION', 'active'),
(185, 'RO', 'ROMANIA', 'active'),
(186, 'RU', 'RUSSIAN FEDERATION', 'active'),
(187, 'RW', 'RWANDA', 'active'),
(188, 'BL', 'SAINT BARTHÉLEMY', 'active'),
(189, 'SH', 'SAINT HELENA', 'active'),
(190, 'KN', 'SAINT KITTS AND NEVIS', 'active'),
(191, 'LC', 'SAINT LUCIA', 'active'),
(192, 'MF', 'SAINT MARTIN (FRENCH PART)', 'active'),
(193, 'PM', 'SAINT PIERRE AND MIQUELON', 'active'),
(194, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'active'),
(195, 'WS', 'SAMOA', 'active'),
(196, 'SM', 'SAN MARINO', 'active'),
(197, 'ST', 'SAO TOME AND PRINCIPE', 'active'),
(198, 'SA', 'SAUDI ARABIA', 'active'),
(199, 'SN', 'SENEGAL', 'active'),
(200, 'RS', 'Serbia', 'active'),
(201, 'SC', 'SEYCHELLES', 'active'),
(202, 'SL', 'SIERRA LEONE', 'active'),
(203, 'SG', 'SINGAPORE', 'active'),
(204, 'SX', 'Sint  Maarten (Dutch part)', 'active'),
(205, 'SK', 'SLOVAKIA', 'active'),
(206, 'SI', 'SLOVENIA', 'active'),
(207, 'SB', 'SOLOMON ISLANDS', 'active'),
(208, 'SO', 'SOMALIA', 'active'),
(209, 'ZA', 'SOUTH AFRICA', 'active'),
(210, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'active'),
(211, 'SS', 'South Sudan', 'active'),
(212, 'ES', 'SPAIN', 'active'),
(213, 'LK', 'SRI LANKA', 'active'),
(214, 'SD', 'SUDAN', 'active'),
(215, 'SR', 'SURINAME', 'active'),
(216, 'SJ', 'SVALBARD AND JAN MAYEN', 'active'),
(217, 'SZ', 'SWAZILAND', 'active'),
(218, 'SE', 'SWEDEN', 'active'),
(219, 'CH', 'SWITZERLAND', 'active'),
(220, 'SY', 'SYRIAN ARAB REPUBLIC', 'active'),
(221, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'active'),
(222, 'TJ', 'TAJIKISTAN', 'active'),
(223, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'active'),
(224, 'TH', 'THAILAND', 'active'),
(225, 'TL', 'TIMOR-LESTE', 'active'),
(226, 'TG', 'TOGO', 'active'),
(227, 'TK', 'TOKELAU', 'active'),
(228, 'TO', 'TONGA', 'active'),
(229, 'TT', 'TRINIDAD AND TOBAGO', 'active'),
(230, 'TN', 'TUNISIA', 'active'),
(231, 'TR', 'TURKEY', 'active'),
(232, 'TM', 'TURKMENISTAN', 'active'),
(233, 'TC', 'TURKS AND CAICOS ISLANDS', 'active'),
(234, 'TV', 'TUVALU', 'active'),
(235, 'UG', 'UGANDA', 'active'),
(236, 'UA', 'UKRAINE', 'active'),
(237, 'AE', 'UNITED ARAB EMIRATES', 'active'),
(238, 'GB', 'UNITED KINGDOM', 'active'),
(239, 'US', 'UNITED STATES', 'active'),
(240, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'active'),
(241, '-', 'UNKNOWN', 'active'),
(242, 'UY', 'URUGUAY', 'active'),
(243, 'UZ', 'UZBEKISTAN', 'active'),
(244, 'VU', 'VANUATU', 'active'),
(245, 'VE', 'VENEZUELA', 'active'),
(246, 'VN', 'VIET NAM', 'active'),
(247, 'VG', 'VIRGIN ISLANDS, BRITISH', 'active'),
(248, 'VI', 'VIRGIN ISLANDS, U.S.', 'active'),
(249, 'WF', 'WALLIS AND FUTUNA', 'active'),
(250, 'EH', 'WESTERN SAHARA', 'active'),
(251, 'YE', 'YEMEN', 'active'),
(252, 'ZM', 'ZAMBIA', 'active'),
(253, 'ZW', 'ZIMBABWE', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_15_personacc`
--

CREATE TABLE `tltkl_15_personacc` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_15_personacc`
--

INSERT INTO `tltkl_15_personacc` (`id`, `code`, `description`, `status`) VALUES
(1, 'PR', 'Pemilik Rekening', 'active'),
(2, 'BO', 'Beneficial Owner', 'active'),
(3, 'HOLD', 'Pemegang Kuasa Rekening (untuk korporasi)', 'active'),
(4, 'PRE', ' Penandatangan Rekening (untuk korporasi)', 'active'),
(5, 'CHO', 'Card Holders (Pemegang Kartu)', 'active'),
(6, 'PPO', 'Pemegang Polis', 'active'),
(7, 'TTG', 'Tertanggung', 'active'),
(8, 'PPR', 'Pembayar Premi', 'active'),
(9, 'TRU', 'Pengelola Rekening (Trustee)', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_16_personentity`
--

CREATE TABLE `tltkl_16_personentity` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_16_personentity`
--

INSERT INTO `tltkl_16_personentity` (`id`, `code`, `description`, `status`) VALUES
(1, 'PSH', 'Pemilik atau Pemegang Saham', 'active'),
(2, 'KOM', 'Komisaris', 'active'),
(3, 'DIR', 'Direksi', 'active'),
(4, 'UBO', 'Ultimate Beneficial Owner', 'active'),
(5, 'PGR', 'Pengurus', 'active'),
(6, 'MAN', 'Manager', 'active'),
(7, 'KHU', 'Kuasa Hukum', 'active'),
(8, 'AKU', 'Akuntan', 'active'),
(9, 'AUD', 'Auditor', 'active'),
(10, 'OTH', 'Lainnya', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_17_partyrole`
--

CREATE TABLE `tltkl_17_partyrole` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_17_partyrole`
--

INSERT INTO `tltkl_17_partyrole` (`id`, `code`, `description`, `status`) VALUES
(1, 'PJS', 'Pengguna Jasa', 'active'),
(2, 'PPO', 'Pemegang Polis', 'active'),
(3, 'TTG', 'Tertanggung', 'active'),
(4, 'PBY', 'Pembayar', 'active'),
(5, 'PMF', 'Penerima Manfaat', 'active'),
(6, 'PBL', 'Pembeli', 'active'),
(7, 'PJL', 'Penjual', 'active'),
(8, 'BRO', 'Perantara', 'active'),
(9, 'REK', 'Rekening Terkait', 'active'),
(10, 'OTH', 'Lainnya', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_18_reportind`
--

CREATE TABLE `tltkl_18_reportind` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_18_reportind`
--

INSERT INTO `tltkl_18_reportind` (`id`, `code`, `description`, `status`) VALUES
(1, 'AAA001', 'Korupsi', 'active'),
(2, 'AAA002', 'Penyuapan', 'active'),
(3, 'AAA003', 'Narkotika', 'active'),
(4, 'AAA004', 'Psikotropika', 'active'),
(5, 'AAA005', 'Penyelundupan Tenaga Kerja', 'active'),
(6, 'AAA006', 'Penyelundupan Migran', 'active'),
(7, 'AAA007', 'Di Bidang Perbankan', 'active'),
(8, 'AAA008', 'Di Bidang Pasar Modal', 'active'),
(9, 'AAA009', 'Di Bidang Perasuransian', 'active'),
(10, 'AAA010', 'Kepabeanan', 'active'),
(11, 'AAA011', 'Cukai', 'active'),
(12, 'AAA012', 'Perdagangan Orang', 'active'),
(13, 'AAA013', 'Perdagangan Senjata Gelap', 'active'),
(14, 'AAA014', 'Terorisme', 'active'),
(15, 'AAA015', 'Penculikan', 'active'),
(16, 'AAA016', 'Pencurian', 'active'),
(17, 'AAA017', 'Penggelapan', 'active'),
(18, 'AAA018', 'Penipuan', 'active'),
(19, 'AAA019', 'Pemalsuan Uang', 'active'),
(20, 'AAA020', 'Perjudian', 'active'),
(21, 'AAA021', 'Prostitusi', 'active'),
(22, 'AAA022', 'Di Bidang Perpajakan', 'active'),
(23, 'AAA023', 'Di Bidang Kehutanan', 'active'),
(24, 'AAA024', 'Di Bidang Lingkungan Hidup', 'active'),
(25, 'AAA025', 'Di Bidang Kelautan dan Perikanan', 'active'),
(26, 'AAA026', 'Tindak Pidana lain yang diancam pidana 4 tahun', 'active'),
(27, 'BBB001', 'Transaksi yang dilakukan oleh PEP', 'active'),
(28, 'BBB002', 'Adanya peningkatan aliran dana masuk dan/atau transaksi yang tidak dapat dijelaskan sumber asal dananya', 'active'),
(29, 'BBB003', 'Transaksi tampak tidak sesuai atau tidak konsisten dengan aktivitas atau kegiatan Pengguna Jasa', 'active'),
(30, 'BBB004', 'Transaksi yang dilakukan secara tunai dalam jumlah di luar kebiasaan yang dilakukan Pengguna Jasa', 'active'),
(31, 'BBB005', 'Pertukaran atau pembelian mata uang asing dalam jumlah relatif besar', 'active'),
(32, 'BBB006', 'Transaksi yang dilakukan bertentangan dengan latar belakang kondisi ekonomi pengguna jasa', 'active'),
(33, 'BBB007', 'Rekening tidak aktif bertransaksi kemudian menerima dana masuk dalam jumlah nominal besar', 'active'),
(34, 'BBB008', 'Rekening Pengguna Jasa menerima setoran/transfer masuk dengan frekuensi tinggi dari pihak ketiga yang tidak memiliki hubungan dengan Pengguna Jasa', 'active'),
(35, 'BBB009', 'Penggunaan akun nominee baik oleh Pengguna Jasa perorangan ataupun Pengguna Jasa perusahaan, dimana konfirmasi atas transaksi ditujukan kepada pihak lain.', 'active'),
(36, 'BBB010', 'Transaksi pelunasan dipercepat pada kredit/pembiayaan dalam jumlah relatif besar', 'active'),
(37, 'BBB011', 'Pengguna Jasa menggunakan uang muka (down payment) dengan nilai yang hampir mencapai nilai objek pembiayaan sehingga tidak sesuai dengan tujuan menggunakan fasilitas pembiayaan', 'active'),
(38, 'BBB012', 'Pembayaran angsuran atau uang muka (down payment) dilakukan oleh pihak lain yang tidak memiliki hubungan yang jelas dengan Pengguna Jasa', 'active'),
(39, 'BBB013', 'Pembayaran uang muka (down payment)  dalam jumlah besar secara tunai yang tidak sesuai dengan profil nasabah', 'active'),
(40, 'BBB014', 'Pembayaran premi tambahan (top up) asuransi dari rekening pihak lain yang tidak tercantum dalam polis.', 'active'),
(41, 'BBB015', 'Pembelian beberapa produk asuransi secara tunai  dalam jangka waktu berdekatan atau bersamaan dengan pembayaran premi sekaligus dalam jumlah besar yang kemudian diikuti pencairan polis sebelum jatuh tempo', 'active'),
(42, 'BBB016', 'Pencairan premi asuransi dan pembayaran klaim ditransfer ke rekening milik orang lain di luar pihak-pihak yang tercantum dalam polis', 'active'),
(43, 'BBB017', 'Pengguna Jasa yang melakukan pencairan dini (early termination) atas produk unit link yang baru saja dibeli.', 'active'),
(44, 'BBB018', 'Pengguna Jasa melakukan redemption unit penyertaan yang baru saja dibeli tanpa memperhatikan kerugian atau tidak mempunyai tujuan yang jelas atas redemption tersebut.', 'active'),
(45, 'BBB019', 'Pencairan premi unit link dengan memanfaatkan masa percobaan (free look period). ', 'active'),
(46, 'BBB020', 'Pembayaran premi asuransi dalam nominal besar dari beberapa rekening bank.', 'active'),
(47, 'BBB021', 'Transaksi efek dengan menggunakan uang tunai, transfer, atau cek atas nama orang lain tanpa memberitahukan kepada perusahaan efek', 'active'),
(48, 'BBB022', 'Pengguna Jasa yang aktif melakukan transaksi pada satu jenis saham terutama saham-saham yang berkapitalisasi kecil atau tidak likuid', 'active'),
(49, 'BBB023', 'Transaksi dana masuk ke Rekening Dana Investor (RDI) dari pihak ketiga yang bukan pemilik Rekening Dana Investor (RDI)', 'active'),
(50, 'BBB024', 'Transaksi perpindahan saham dari pihak ketiga yang tidak jelas hubungannya', 'active'),
(51, 'BBB025', 'Transaksi di pasar negosiasi pada saham-saham yang tidak umum (saham memiliki indikasi Unusual Market Activity/UMA)', 'active'),
(52, 'BBB026', 'Pengguna Jasa yang aktif melakukan transaksi pada satu jenis saham terutama saham-saham yang berkapitalisasi kecil atau tidak likuid', 'active'),
(53, 'BBB027', 'Transaksi tutup sendiri (crossing) yang pembayarannya dilakukan langsung antara buyer dan seller', 'active'),
(54, 'BBB028', 'Pengguna Jasa/calon Pengguna Jasa menggunakan dokumen identitas yang diragukan kebenarannya atau diduga palsu', 'active'),
(55, 'BBB029', 'Pengguna Jasa cenderung menyimpan dana tunai pada rekening dana investor yang dikelola oleh perusahaan efek dalam waktu relatif lama tanpa melakukan transaksi', 'active'),
(56, 'BBB030', 'Pengguna Jasa sering melakukan transaksi atas saham-saham yang tidak aktif dengan tidak memperhatikan keuntungan/ kerugiannya', 'active'),
(57, 'BBB031', 'Transaksi pemindahan atau penerimaan efek dari atau ke beberapa sekuritas dalam waktu yang simultan atau berdekatan', 'active'),
(58, 'BBB032', 'Rekening efek yang pasif atau tidak sering melakukan transaksi efek namun sering digunakan untuk melakukan pengiriman dana. ', 'active'),
(59, 'BBB033', 'Pengguna Jasa menyetorkan dana yang jauh lebih besar dari pembayaran nilai transaksinya', 'active'),
(60, 'BBB034', 'Pengguna Jasa meminta pembayaran hasil penjualan/pembelian valuta asing ditransfer ke rekening bank yang bersangkutan atau pihak lain', 'active'),
(61, 'BBB035', 'Pengguna Jasa meminta pembayaran hasil penjualan valuta asing dengan menggunakan cek.', 'active'),
(62, 'BBB036', 'Transaksi deposit payment Alat Pembayaran Menggunakan Kartu (APMK) dalam jumlah besar.', 'active'),
(63, 'BBB037', 'Penyetoran (pelunasan tagihan) APMK dilakukan oleh pihak lain (bukan Pemegang Kartu). ', 'active'),
(64, 'BBB038', 'Pembayaran iuran koperasi oleh pihak lain yang tidak ada hubungannya dengan Pengguna Jasa', 'active'),
(65, 'BBB039', 'Pembayaran pinjaman pada koperasi oleh pihak lain di luar anggota ', 'active'),
(66, 'BBB040', 'Pencairan dana iuran koperasi yang dikirimkan ke pihak lain', 'active'),
(67, 'BBB041', 'Pelunasan pinjaman dipercepat pada koperasi sebelum jatuh tempo.', 'active'),
(68, 'BBB042', 'Pengguna Jasa melakukan percepatan pelunasan barang gadai dengan uang dalam jumlah besar', 'active'),
(69, 'BBB043', 'Pengguna Jasa tidak merasa khawatir barang gadainya akan disita oleh pihak Pegadaian.', 'active'),
(70, 'BBB044', 'Pelunasan barang gadai dilakukan oleh pihak lain yang tidak jelas hubungannya dengan Pengguna Jasa.', 'active'),
(71, 'BBB045', 'Penyetoran dana pada rekening komoditi atas nama orang lain.', 'active'),
(72, 'BBB046', 'Penyetoran yang dipecah melalui beberapa bank dan disetor ke rekening segregate account pialang komoditi.', 'active'),
(73, 'BBB047', 'Tidak terdapat hubungan yang jelas antara Pengguna Jasa dengan pemegang Bukti Kepemilikan Kendaraan Bermotor', 'active'),
(74, 'BBB048', 'Besaran jumlah uang tunai dan/atau nilai instrumen pembayaran lain paling sedikit Rp1,000,000,000 (satu miliar rupiah) atau dengan mata uang asing yang nilainya setara dilakukan oleh pihak yang tidak memiliki ijin dari otoritas', 'active'),
(75, 'BBB049', 'Pembawaan uang tunai berulang dalam 1 (satu) hari', 'active'),
(76, 'BBB050', 'Pembawaan uang tunai berulang yang terpola dalam periode tertentu', 'active'),
(77, 'BBB051', 'Profil dan perilaku pembawa uang tunai memiliki hubungan dengan negara atau yuridiksi berisiko tinggi', 'active'),
(78, 'BBB052', 'Profil dan perilaku pembawa uang tunai memiliki hubungan dengan pembawaan barang impor/ekspor yang tidak wajar,  yang berisiko tinnggi atau yang pernah ditegah sebelumnya', 'active'),
(79, 'BBB053', 'Profil dan perilaku pembawaan uang tunai memilki riwayat catatan kriminal, riwayat kehilangan dokumen perjalanan yang tidak wajar', 'active'),
(80, 'BBB054', 'Pembawaan uang tunai dan/atau instrumen pembayaran lain yang ditempatkan secara tidak wajar atau tidak diberitahukan', 'active'),
(81, 'BBB055', 'Transaksi untuk kepentingan atau untuk dan atas nama pengguna jasa dalam pembelian dan penjualan properti ', 'active'),
(82, 'BBB056', 'Transaksi untuk kepentingan atau untuk dan atas nama pengguna jasa dalam pengelolaan terhadap uang, efek, dan/atau prooduk jasa keuangan lainnya', 'active'),
(83, 'BBB057', 'Transaksi untuk kepentingan atau untuk dan atas nama pengguna jasa dalam pengelolaan rekening giro, rekening tabungan, rekening deposito dan/atau rekening efek', 'active'),
(84, 'BBB058', 'Transaksi untuk kepentingan atau untuk dan atas nama pengguna jasa dalam pengoperasian dan pengelolaan perusahaan', 'active'),
(85, 'BBB059', 'Transaksi untuk kepentingan atau untuk dan atas nama pengguna jasa dalam pendirian, pembelian dan penjualan badan hukum', 'active'),
(86, 'CCC001', 'Transaksi yang dilakukan dalam jumlah relatif kecil namun dengan frekuensi yang tinggi (structuring)', 'active'),
(87, 'CCC002', 'Transaksi dilakukan dengan menggunakan beberapa rekening atas nama individu yang berbeda-beda untuk kepentingan satu orang tertentu (smurfing)', 'active'),
(88, 'CCC003', 'Pengguna Jasa atau kuasanya mencoba mempengaruhi petugas PJK untuk tidak melaporkan sebagai Transaksi Keuangan Mencurigakan  dengan berbagai cara.', 'active'),
(89, 'CCC004', 'Pengguna Jasa melakukan transaksi di berbagai daerah yang berbeda untuk menghindari deteksi', 'active'),
(90, 'CCC005', 'Pengguna jasa bertindak sebagai pihak ketiga', 'active'),
(91, 'CCC006', 'Pengguna Jasa menunjukkan keingintahuan yang tidak biasa tentang sistem internal, pengawasan, dan kebijakan-kebijakan yang berlaku', 'active'),
(92, 'CCC007', 'Ditemukan ketidakkonsistenan data pengguna jasa saat proses  identifikasi atau verifikasi dan tidak dapat dijelaskan', 'active'),
(93, 'CCC008', 'Membuka rekening dengan nama yang sangat mirip dengan nama orang/entitas bisnis yang sudah dikenal publik', 'active'),
(94, 'CCC009', 'Pengguna Jasa melakukan transaksi tunai dalam beberapa hari berturut-turut dengan nominal transaksi kurang dari Rp500.000.000,00 per harinya (upaya untuk menghindari threshold transaksi tunai per hari)', 'active'),
(95, 'CCC010', 'Beberapa transaksi dilakukan pada hari yang sama di cabang yang sama tetapi dengan menggunakan teller yang berbeda.', 'active'),
(96, 'CCC011', 'Penolakan atau menyamarkan dari pengungkapan pemilik manfaat (beneficiary ownership)', 'active'),
(97, 'DDD001', 'Pengguna Jasa merupakan subyek dari pencucian uang atau penyelidikan/penyidikan terorisme dan pendanaan terorisme', 'active'),
(98, 'DDD002', 'Adanya informasi dari sumber yang dapat dipercaya (PPATK, Lembaga Pengawas dan Pengatur, aparat penegak hukum, media massa, atau sumber lainnya) bahwa Pengguna Jasa diduga terlibat dalam aktivitas ilegal dan/atau memiliki latar belakang tindak kriminal.', 'active'),
(99, 'DDD003', 'Pengguna Jasa mengubah atau membatalkan transaksi setelah Penyedia Jasa meminta dokumen identitas Pengguna Jasa', 'active'),
(100, 'DDD004', 'Transaksi yang melibatkan negara high risk country  pencucian uang dan pendanaan terorisme', 'active'),
(101, 'DDD005', 'Transaksi melibatkan perusahaan fiktif atau paper company', 'active'),
(102, 'EEE001', 'Transaksi Keuangan yang diminta oleh PPATK karena Pengguna Jasa telah ditetapkan sebagai tersangka/terdakwa dalam kasus tindak pidana.', 'active'),
(103, 'EEE002', 'Transaksi Keuangan yang diminta oleh PPATK karena keterkaitannya dengan Transaksi lain yang sedang dalam proses analisis maupun pemeriksaan oleh PPATK.', 'active'),
(104, 'EEE003', 'Transaksi Keuangan yang diminta oleh PPATK atas dasar penyelidikan atau penyidikan yang sedang dilakukan oleh aparat penegak hukum.', 'active'),
(105, 'EEE004', 'Transaksi Keuangan melibatkan pengguna jasa yang terkena Sanction List', 'active'),
(106, 'EEE005', 'Transaksi Keuangan melibatkan pengguna jasa yang masuk kedalam  Daftar Hitam Nasional  atau Daftar Pencarian Orang (DPO) atau Office of Foreign Asset Control (OFAC  List). ', 'active'),
(107, 'FFF001', 'Pengguna Jasa/calon Pengguna Jasa memberikan informasi yang tidak benar mengenai hal-hal yang berkaitan dengan identitas, sumber penghasilan atau usahanya.', 'active'),
(108, 'FFF002', 'Pengguna Jasa/calon Pengguna Jasa menggunakan dokumen identitas yang diragukan kebenarannya atau diduga palsu seperti tanda tangan yang berbeda atau foto yang tidak sama.', 'active'),
(109, 'FFF003', 'Pengguna Jasa/calon Pengguna Jasa enggan atau menolak untuk memberikan informasi/dokumen yang diminta oleh petugas PJK tanpa alasan yang jelas.', 'active'),
(110, 'FFF004', 'Pengguna Jasa tidak bersedia memberikan informasi yang benar atau segera memutuskan hubungan usaha/menutup rekening pada saat petugas PJK meminta informasi atas transaksi yang dilakukannya.', 'active'),
(111, 'FFF005', 'Pengguna Jasa enggan memberikan informasi sumber dana dan tujuan transaksi secara lengkap kepada PJK.', 'active'),
(112, 'FFF006', 'Pengguna Jasa menggunakan nama yang berbeda (ejaan yang berbeda) dari satu transaksi ke transaksi yang lain.', 'active'),
(113, 'FFF007', 'Transaksi melibatkan perusahaan fiktif dengan indikasi menggunakan dokumen palsu. ', 'active'),
(114, 'FFF008', 'Pengguna Jasa berupaya untuk meyakinkan pegawai PJK untuk tidak melengkapi dokumentasi apapun yang diperlukan untuk melakukan transaksi.', 'active'),
(115, 'FFF009', 'Pengguna Jasa memberikan informasi yang diragukan atau tidak jelas.', 'active'),
(116, 'FFF010', 'Pengguna Jasa menolak untuk memberikan dokumen identitas pribadi.', 'active'),
(117, 'FFF011', 'Semua identitas yang disajikan tidak dapat diperiksa kebenarannya karena alasan tertentu.', 'active'),
(118, 'FFF012', 'Pengguna Jasa menyajikan dokumen identitas yang berbeda setiap kali transaksi dilakukan.', 'active'),
(119, 'FFF013', 'Pengguna Jasa diduga terkait dengan pendanaan terorisme berdasarkan analisis yang dilakukan oleh PJK terhadap potensi risiko dari hubungan usaha dengan Pengguna Jasa.', 'active'),
(120, 'GGG001', 'Penundaan transaksi yang dilakukan atas inisiatif PJK', 'active'),
(121, 'GGG002', 'Penundaan transaksi berdasarkan perintah penyidik, penuntut umum, atau hakim', 'active'),
(122, 'GGG003', 'Penghentian sementara berdasarkan permintaan PPATK', 'active'),
(123, 'HHH001', 'Transaksi keuangan dengan maksud untuk digunakan dan/atau yang diketahui akan digunakan untuk melakukan tindak pidana terorisme;', 'active'),
(124, 'HHH002', 'Transkasi keuangan yang melibatkan para pihak yang diduga terlibat atau terkait dengan kegiatan terorisme berdasarkan Daftar Terduga Terorisme dan Organisasi Terorisme (DTTOT)', 'active'),
(125, 'HHH003', 'Bendahara atau karyawan NPO menarik uang dari rekening NPO dan memasukannya ke rekening pribadi yang bersangkutan, kemudian mengirimkan sebagian dananya ke rekening tersangka teroris', 'active'),
(126, 'HHH004', 'NPO dilaporan dalam berita/media karena terkait dengan organisasi teroris atau entitas yang diduga melakukan aksi terorisme.', 'active'),
(127, 'HHH005', 'Terdapat pihak terkait transaksi NPO (misalnya: pemilik rekening, pengirim, penerima atau pemilik manfaat) berasal dari negara yang dikenal sebagai negara yang mendukung kegiatan teroris atau organisasi teroris', 'active'),
(128, 'HHH006', 'Terdapat aliran dana dari kantor utama NPO asing yang berada di negara berisiko tinggi kasus terorisme, kepada cabang NPO asing yang berada di Indonesia kemudian dana tersebut masuk ke rekening NPO lokal yang berlokasi di daerah konflik di Indonesia.', 'active'),
(129, 'HHH007', 'Adanya instruksi transaksi yang tidak wajar dan mengandung kata/istilah yang berkaitan dengan ekstrimisme dan ideologi teroris serta indikasi tindak pidana lainnya', 'active'),
(130, 'HHH008', 'NPO tidak dapat menjelaskan dan/atau minim dokumen pendukung ketika pihak bank menanyakan alasan/tujuan NPO tersebut mentransferkan dananya ke wilayah atau kepada pihak berisiko tinggi terorisme', 'active'),
(131, 'HHH009', 'Terdapat penggunaan rekening NPO untuk menampung dana milik terduga teroris dan asosiasinya', 'active'),
(132, 'HHH010', 'Transaksi yang melibatkan Setiap Orang yang terindikasi proliferasi', 'active'),
(133, 'III001', 'Laporan Transaksi yang dilakukan oleh Pengguna Jasa dengan mata uang rupiah dan/atau mata uang asing yang nilainya paling sedikit atau setara dengan Rp500.000.000,00 (lima ratus juta rupiah) dengan pembelian tunai bertahap.', 'active'),
(134, 'III002', 'Laporan Transaksi yang dilakukan oleh Pengguna Jasa dengan mata uang rupiah dan/atau mata uang asing yang nilainya paling sedikit atau setara dengan Rp 500.000.000,00 (lima ratus juta rupiah) dengan menggunakan uang tunai, cek atau giro maupun pentransferan, pemindahbukuan atau metode pembayaran lainnya.', 'active'),
(135, 'III003', 'Laporan Transaksi yang dilakukan oleh Pengguna Jasa yang menggantikan kedudukan Pengguna Jasa lain yang telah dilaporkan sebelumnya dengan nilai paling sedikit Rp 500.000.000,00 (lima ratus juta rupiah) atau dengan mata uang asing yang nilainya setara.', 'active'),
(136, 'III004', 'Laporan Transaksi hibah oleh Pengguna Jasa dengan nilai paling sedikit Rp 500.000.000,00 (lima ratus juta rupiah).', 'active'),
(137, 'JJJ001', 'Hasil Audit Kepatuhan dan Audit Khusus yang Dilakukan oleh PPATK', 'active'),
(138, 'JJJ002', 'Hasil Audit Kepatuhan yang dilakukan oleh LPP', 'active'),
(139, 'KKK001', 'Penanganan perkara tindak pidana pencucian uang', 'active'),
(140, 'KKK002', 'Penanganan perkara tindak pidana pendanaan terorisme', 'active'),
(141, 'KKK003', 'Pemenuhan bantuan hukum timbal balik dalam masalah pidana', 'active'),
(142, 'KKK004', 'Penelusuran aset, dalam rangka pemulihan aset', 'active'),
(143, 'KKK005', 'Pemeriksaan Laporan Harta Kekayaan Penyelenggara Negara ', 'active'),
(144, 'KKK006', 'Optimalisasi penerimaan negara dari sektor perpajakan', 'active'),
(145, 'KKK007', 'Pengawasan kepatuhan penyedia jasa keuangan dalam penerapan prinsip mengenali pengguna jasa dan pelaksanaan kewajiban pelaporan ke PPATK', 'active'),
(146, 'KKK008', 'Pemeriksaan investigatif guna mengungkap adanya indikasi kerugian negara/daerah dan/atau unsur pidana (khusus BPK RI) ', 'active'),
(147, 'KKK009', 'Seleksi pengangkatan pejabat strategis', 'active'),
(148, 'KKK010', 'Penanganan tindak pidana oleh selain penyidik tindak pidana pencucian uang ', 'active'),
(149, 'KKK011', 'Audit investigasi  (Itjen, BPKP, audit internal dsb)', 'active'),
(150, 'KKK012', 'Membahayakan keamanan nasional', 'active'),
(151, 'KKK013', 'Organisasi atau lembaga internasional di bidang pencegahan dan pemberantasan tindak pidana pencucian uang atau tindak pidana lain terkait dengan tindak pidana pencucian uang.', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltkl_19_gender`
--

CREATE TABLE `tltkl_19_gender` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tltkl_19_gender`
--

INSERT INTO `tltkl_19_gender` (`id`, `code`, `description`, `status`) VALUES
(1, 'L', 'Laki-laki', 'active'),
(2, 'P', 'Perempuan', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tqris_mcc`
--

CREATE TABLE `tqris_mcc` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(500) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `mdr` varchar(20) NOT NULL,
  `datestamp` varchar(20) NOT NULL,
  `datestamuid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tqris_mcc`
--

INSERT INTO `tqris_mcc` (`id`, `code`, `name`, `category`, `description`, `mdr`, `datestamp`, `datestamuid`) VALUES
(1, '9399', 'Government Services - Not Elsewhere Classified', 'G2P', 'Bansos', '0', '44281.5778446759', 'admin'),
(2, '9211', 'Court Costs (including Alimony and Child Support)', 'P2G Nasional & Daera', 'Pajak, Imigrasi (Paspor)', '0', '44281.5778446759', 'admin'),
(3, '9222', 'Fines', 'P2G Nasional & Daera', 'Pajak, Imigrasi (Paspor)', '0', '44281.5778446759', 'admin'),
(4, '9311', 'Tax Payments', 'P2G Nasional & Daera', 'Pajak, Imigrasi (Paspor)', '0', '44281.5778446759', 'admin'),
(5, '9399', 'Government Services - Not Elsewhere Classified', 'P2G Nasional & Daera', 'Pajak, Imigrasi (Paspor)', '0', '44281.5778446759', 'admin'),
(6, '8398', 'Charitable and Social Service Organizations', 'Donasi Sosial', 'Khusus Donasi Non Profit', '0', '44281.5778446759', 'admin'),
(7, '8661', 'Religious Organizations', 'Donasi Sosial', 'Khusus Donasi Non Profit', '0', '44281.5778446759', 'admin'),
(8, '5541', 'Service Stations', 'SPBU', '', '0.004', '44281.5778446759', 'admin'),
(9, '5542', 'Automated Fuel Dispensers (with or without Ancillary Services)', 'SPBU', '', '0.004', '44281.5778446759', 'admin'),
(10, '5172', 'Petroleum  and Petroleum Products', 'SPBU', '', '0.004', '44281.5778446759', 'admin'),
(11, '5983', 'Fuel Dealer - Coal, Fuel Oil, Liquefied Petroleum', 'SPBU', '', '0.004', '44281.5778446759', 'admin'),
(12, '8211', 'Elementary and Secondary Schools', 'Pendidikan', 'Sekolah, Universitas, Kursus', '0.006', '44281.5778446759', 'admin'),
(13, '8220', 'Colleges, Universities, Professional Schools, and Junior Colleges', 'Pendidikan', 'Sekolah, Universitas, Kursus', '0.006', '44281.5778446759', 'admin'),
(14, '8241', 'Correspondence Schools', 'Pendidikan', 'Sekolah, Universitas, Kursus', '0.006', '44281.5778446759', 'admin'),
(15, '8244', 'Business and Secretarial Schools', 'Pendidikan', 'Sekolah, Universitas, Kursus', '0.006', '44281.5778446759', 'admin'),
(16, '8249', 'Trade and Vocational Schools', 'Pendidikan', 'Sekolah, Universitas, Kursus', '0.006', '44281.5778446759', 'admin'),
(17, '8299', 'Schools and Educational Services - Not Elsewhere Classified', 'Pendidikan', 'Sekolah, Universitas, Kursus', '0.006', '44281.5778446759', 'admin'),
(18, '742', 'VETERINARY SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(19, '763', 'AGRICULTURAL CO-OPERATIVE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(20, '780', 'LANDSCAPING & HORTICULTURAL SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(21, '1520', 'GENERAL CONTRACTORS - RESIDENTIAL & COMMERCIAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(22, '1711', 'HEATING, PLUMBING, & AIR CONDITIONING CONTRACTORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(23, '1731', 'ELECTRICAL CONTRACTORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(24, '1740', 'MASONRY, STONEWORK, TILE SETTING, PLASTERING & INSULATION CONTRACTORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(25, '1750', 'CARPENTRY CONTRACTORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(26, '1761', 'ROOFING, SIDING, AND SHEET METAL WORK CONTRANTORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(27, '1771', 'CONTRACTORS-CONCRETE WORK', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(28, '1799', 'SPECIAL TRADE CONTRACTORS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(29, '2222', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(30, '2741', 'MISCELLANEOUS PUBLISHING & PRINTING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(31, '2791', 'TYPESETTING, PLATE MAKING, & RELATED SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(32, '2842', 'SPECIALTY CLEANING, POLISHING, & SANITATION PREPARATIONS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(33, '3000', 'UNITED AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(34, '3001', 'AMERICAN AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(35, '3002', 'PAN AMERICAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(36, '3003', 'EUROFLY AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(37, '3004', 'DRAGON AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(38, '3005', 'BRITISH AIRWAYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(39, '3006', 'Japan Air Lines--JAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(40, '3007', 'AIR FRANCE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(41, '3008', 'LUFTHANSA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(42, '3009', 'AIR CANADA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(43, '3010', 'KLM (ROYAL DUTCH AIRLINES)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(44, '3011', 'AEROFLOT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(45, '3012', 'QANTAS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(46, '3013', 'ALITALIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(47, '3014', 'SAUDI ARABIAN AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(48, '3015', 'Swiss International Air Lines--SWISS AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(49, '3016', 'Scandinavian Airline System (SAS)--SAS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(50, '3017', 'South African Airways--SAFRICAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(51, '3018', 'VARIG (BRAZIL)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(52, '3019', 'Germanwings--GRMNWGAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(53, '3020', 'AIR-INDIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(54, '3021', 'Air Algerie--AIRALGER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(55, '3022', 'Philippine Airlines--PAL AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(56, '3023', 'MEXICANA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(57, '3024', 'PAKISTAN INTERNATIONAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(58, '3025', 'Air New Zealand Limited International--AIR NZ', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(59, '3026', 'Emirates Airlines--EMIRATES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(60, '3027', 'Union de Transports Aeriens--UTAAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(61, '3028', 'Air Malta--AIRMALTA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(62, '3029', 'SN Brussels Airlines--SNBRU AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(63, '3030', 'Aerolineas Argentinas--AERO ARG', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(64, '3031', 'Olympic Airways--OLYMPICA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(65, '3032', 'EL AL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(66, '3033', 'Ansett Airlines--ANSETT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(67, '3034', 'etihad airways - etihadair', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(68, '3035', 'TAP (PORTUGAL)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(69, '3036', 'VASP (BRAZIL)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(70, '3037', 'EgyptAir--EGYPTAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(71, '3037', 'Kuwait Airways--KUWAIT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(72, '3037', 'AVIANCA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(73, '3037', 'Gulf Air (Bahrain)--GULF AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(74, '3037', 'Balkan--Bulgarian Airlines--BALKAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(75, '3037', 'FINNAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(76, '3037', 'Aer Lingus--AERLING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(77, '3037', 'AIR LANKA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(78, '3045', 'Nigeria Airways--NIGERIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(79, '3046', 'Cruzerio do Sul (Brazil)--CRUZERIO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(80, '3047', 'THY (Turkey)--THY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(81, '3048', 'Royal Air Maroc--AIRMARO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(82, '3049', 'Tunis Air--TUNIS AI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(83, '3050', 'Icelandair--ICELANDA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(84, '3051', 'Austrian Airlines--AUSTRIAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(85, '3052', 'LAN Airlines--LAN AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(86, '3053', 'AVIACO (Spain)--AVIACO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(87, '3054', 'LADECO (Chile)--LADECO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(88, '3055', 'LAB (BOLIVIA)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(89, '3056', 'JET AIRWAYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(90, '3057', 'VIRGIN AMERICA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(91, '3058', 'DELTA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(92, '3059', 'DBA Airlines--DBA AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(93, '3060', 'Northwest Airlines--NWA AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(94, '3061', 'Continental--CONTINEN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(95, '3062', 'Hapag-Lloyd Express--HLX', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(96, '3063', 'U.S. Airways--USAIRWYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(97, '3064', 'Adria Airways--ADRIA AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(98, '3065', 'Air Inter--AIRINTER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(99, '3066', 'Southwest Airlines--SOUTHWES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(100, '3067', 'Vanguard Airlines--VANGUARD', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(101, '3068', 'Air Astana--AIRSTANA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(102, '3069', 'SUN COUNTRY AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(103, '3070', 'Pacific Southwest Airlines (PSA)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(104, '3071', 'Air British Columbia--AIR B R C', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(105, '3072', 'Cebu Pacific--CEBU PAC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(106, '3073', 'Air Cal', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(107, '3075', 'Singapore Airlines--SINGAPOR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(108, '3076', 'Aeromexico--AEROMEXI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(109, '3077', 'Thai Airways--THAIAIRW', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(110, '3078', 'China Airlines--CHINAAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(111, '3079', 'Jetstar Airways--JETSTAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(112, '3081', 'NORDAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(113, '3082', 'Korean Airlines--KOREAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(114, '3083', 'Air Afrique--AIR AFRIQ', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(115, '3084', 'Eva Airways--EVA AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(116, '3085', 'Midwest Express Airlines--MIDWEST', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(117, '3086', 'CARNIVAL AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(118, '3087', 'Metro Airlines--METROAI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(119, '3088', 'Croatia Air--CROATIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(120, '3089', 'Transaero--TRANSAERO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(121, '3090', 'Uni Airways--UNIAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(122, '3092', 'MIDWAY AIRLINE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(123, '3094', 'Zambia Airways--ZAMBIA A', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(124, '3095', 'WARDAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(125, '3096', 'Air Zimbabwe--AIRZIMBA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(126, '3097', 'Spanair--SPANAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(127, '3098', 'Asiana Airlines--ASIANA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(128, '3098', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(129, '3099', 'Cathay Pacific--CATHAYPA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(130, '3100', 'Malaysian Airline System--MALAY AI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(131, '3102', 'Iberia--IBERIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(132, '3103', 'Garuda (Indonesia)--GARUDA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(133, '3105', 'Piedmont', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(134, '3106', 'Braathens S.A.F.E. (Norway)--BRAATHEN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(135, '3110', 'WINGS AIRWAYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(136, '3111', 'British Midland--BRITISH M', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(137, '3112', 'Windward Island--WINDWARD', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(138, '3115', 'TOWER AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(139, '3117', 'Venezolana International de Aviacion--VIASA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(140, '3118', 'VALLEY AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(141, '3125', 'Tan Airlines--TAN AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(142, '3126', 'TALAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(143, '3127', 'Taca International--TACA INT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(144, '3129', 'Surinam Airways--SURINAM', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(145, '3130', 'Sunworld International Airways--SUNWORLD', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(146, '3131', 'VLM Airlines--VLM', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(147, '3132', 'Frontier Airlines--FRONTIER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(148, '3133', 'SUNBELT AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(149, '3135', 'Sudan Airways--SUDANAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(150, '3136', 'Qatar Airways Company W.L.L.--QATAR AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(151, '3137', 'SINGLETON', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(152, '3138', 'SIMMONS AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(153, '3141', 'Seair Alaska', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(154, '3143', 'SCENIC AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(155, '3144', 'Virgin Atlantic--VIR ATL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(156, '3145', 'SAN JUAN AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(157, '3146', 'Luxair--LUXAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(158, '3148', 'Air Littoral, S.A.--LITTORAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(159, '3151', 'Air Zaire--AIRZAIRE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(160, '3154', 'PRINCEVILLE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(161, '3156', 'GO FLY Ltd.--GOFLY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(162, '3159', 'Provincetown-Boston Airways--PBA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(163, '3161', 'All Nippon Airways--ANAAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(164, '3164', 'Norontair--NORONTAI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(165, '3165', 'NEW YORK HELICOPTER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(166, '3167', 'Aero Continente--AERO CONT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(167, '3170', 'MOUNT COOK', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(168, '3171', 'Canadian Airlines--CANADIAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(169, '3172', 'Nation Air--NATIONAI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(170, '3174', 'JetBlue Airways--JETBLUE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(171, '3175', 'Middle East Air--MIDEASTA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(172, '3176', 'METROFLIGHT AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(173, '3177', 'AirTran Airways--AIRTRAN A', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(174, '3178', 'Mesa Air--MESA AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(175, '3180', 'Westjet Airlines--WESTJET', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(176, '3181', 'Malev Hungarian Airlines--MALEV', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(177, '3182', 'LOT â€“ Polish Airlines--LOT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(178, '3183', 'Oman Aviation Services--OMAN AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(179, '3184', 'LIAT--LIAT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(180, '3185', 'LAV Linea Aeropostal Venezolana--LAV', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(181, '3186', 'LAP Lineas Aereas Paraguayas--LAP', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(182, '3187', 'LACSA (Costa Rica)--LACSA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(183, '3188', 'Virgin Express--VIR EXP', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(184, '3190', 'Jugoslav Air--JUGOSLAV', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(185, '3191', 'Island Airlines--ISLANDAI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(186, '3192', 'Iran Air--IRANAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(187, '3193', 'Indian Airlines--INDIAN A', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(188, '3195', 'Holiday Airlines', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(189, '3196', 'Hawaiian Air--HAWAIIAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(190, '3197', 'Havasu Airlines--HAVASUAI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(191, '3198', 'Harbor Airlines', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(192, '3199', 'Servicios Aereos Militares', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(193, '3200', 'Guyana Airways--GUYANA A', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(194, '3203', 'GOLDEN PACIFIC AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(195, '3204', 'Freedom Airlines--FREEDOM', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(196, '3206', 'China Eastern Airlines--CHINAEAST', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(197, '3207', 'Empresa Ecuatoriana', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(198, '3211', 'Norwegian Air Shuttle--NORWEGIAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(199, '3212', 'Dominicana de Aviacion--DOMINICA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(200, '3213', 'Malmo Aviation--MALMO AV', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(201, '3215', 'DAN AIR SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(202, '3216', 'CUMBERLAND AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(203, '3217', 'CSA Ceskoslovenske Aerolinie--CSA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(204, '3218', 'CROWN AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(205, '3219', 'Compania Panamena de Aviacion (Copa)--COPA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(206, '3220', 'Compania Faucett--COMPANIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(207, '3221', 'Transportes Aeros Militares Ecuatorianos--TAME AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(208, '3222', 'Command Airways--COMMAND', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(209, '3223', 'Comair--COMAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(210, '3226', 'Skyways--SKYWAYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(211, '3228', 'Cayman Airways--CAYMANAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(212, '3229', 'SAETA (Sociedad Ecuatorianas De Transportes Aereo)--SAETAAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(213, '3231', 'SAHSA (Servicio Aero de Honduras)--SAHSA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(214, '3233', 'CAPITOL AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(215, '3234', 'Caribbean Airlines--CARIBBEAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(216, '3235', 'BROCKWAY AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(217, '3236', 'Air Arabia Airline--AIR ARAB', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(218, '3238', 'BEMIDJI AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(219, '3239', 'Bar Harbor Airlines--BARHARBO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(220, '3240', 'Bahamasair--BAHAMASA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(221, '3241', 'Aviateca (Guatemala)--AVIATECA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(222, '3242', 'Avensa--AVENSA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(223, '3243', 'Austrian Air Service--AUSTRAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(224, '3245', 'EasyJet--EASYJET', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(225, '3246', 'Ryanair--RYANAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(226, '3247', 'Gol Airlines--GOL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(227, '3248', 'Tam Airlines--TAM', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(228, '3251', 'Aloha Airlines--ALOH AI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(229, '3252', 'ALM Antilean Airlines--ALM', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(230, '3253', 'America West--AMERWEST', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(231, '3254', 'US AIR SHUTTLE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(232, '3256', 'Alaska Airlines Inc.--ALASKA A', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(233, '3259', 'American Trans Air--ATA AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(234, '3260', 'Spirit Airlines--SPIRIT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(235, '3261', 'Air China--AIR CHINA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(236, '3262', 'RENO AIR, INC.', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(237, '3263', 'Aero Servicio Carabobo--ASERCA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(238, '3266', 'Air Seychelles--AIR SEYC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(239, '3267', 'Air Panama International--AIR PANA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(240, '3268', 'Air Pacific', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(241, '3275', 'Air Nevada', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(242, '3276', 'Air Midwest', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(243, '3277', 'Air Madagascar', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(244, '3279', 'Air LA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(245, '3280', 'Air Jamaica--AIR JAMA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(246, '3282', 'Air Djibouti--AIR DJIB', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(247, '3284', 'AERO VIRGIN ISLANDS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(248, '3285', 'Aero Peru--AEROPERU', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(249, '3286', 'Aero Nicaraguenses--AERO NIC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(250, '3287', 'Aero Coach Aviation--AEROCOAC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(251, '3291', 'Ariana Afghan', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(252, '3292', 'Cyprus Airways--CYPRUSA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(253, '3293', 'Ecuatoriana--ECUATORI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(254, '3294', 'Ethiopian Airlines--ETHIOPIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(255, '3295', 'Kenya Airways--KENYAAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(256, '3296', 'Air Berlin--AIRBERLIN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(257, '3297', 'Tarom Romanian Air Transport--TAROM AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(258, '3298', 'AIR MAURITIUS--AIRMAURI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(259, '3299', 'WIDEROES FLYVESELSKAP--WIDEROES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(260, '3333', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(261, '3351', 'AFFILIATED AUTO RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(262, '3352', 'AMERICAN INTL RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(263, '3353', 'BROOKS RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(264, '3354', 'ACTION AUTO RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(265, '3355', 'SIXT CAR RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(266, '3357', 'HERTZ', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(267, '3359', 'PAYLESS CAR RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(268, '3361', 'AIRWAYS RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(269, '3362', 'ALTRA AUTO RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(270, '3364', 'AGENCY RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(271, '3366', 'BUDGET RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(272, '3368', 'HOLIDAY RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(273, '3370', 'RENT A WRECK', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(274, '3374', 'ACCENT RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(275, '3376', 'AJAX RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(276, '3380', 'TRIANGLE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(277, '3381', 'EUROP CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(278, '3385', 'TROPICAL RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(279, '3386', 'SHOWCASE RENTAL CARS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(280, '3387', 'ALAMO RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(281, '3388', 'MERCHANTS RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(282, '3389', 'AVIS RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(283, '3390', 'DOLLAR RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(284, '3391', 'EUROPE BY CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(285, '3393', 'NATIONAL CAR RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(286, '3394', 'KEMWELL GROUP RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(287, '3395', 'THRIFTY CAR RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(288, '3396', 'TILDEN RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(289, '3398', 'ECONO-CAR RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(290, '3399', 'AMEREX RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(291, '3400', 'AUTO HOST CAR RENTALS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(292, '3405', 'ENTERPRISE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(293, '3409', 'GENERAL RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(294, '3411', 'ATLANTA RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(295, '3412', 'A1 RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(296, '3414', 'GODFREY NATL RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(297, '3419', 'ALPHA RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(298, '3420', 'ANSA INTL RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(299, '3421', 'ALLSTATE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(300, '3423', 'AVCAR RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(301, '3425', 'AUTOMATE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(302, '3427', 'AVON RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(303, '3428', 'CAREY RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(304, '3429', 'INSURANCE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(305, '3430', 'MAJOR RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(306, '3431', 'REPLACEMENT RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(307, '3432', 'RESERVE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(308, '3433', 'UGLY DUCKLING RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(309, '3434', 'USA RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(310, '3435', 'VALUE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(311, '3436', 'AUTOHANSA RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(312, '3437', 'CITE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(313, '3438', 'INTERENT RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(314, '3439', 'MILLEVILLE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(315, '3440', 'VIA ROUTE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(316, '3441', 'ADVANTAGE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(317, '3501', 'HOLIDAY INN EXPRESS # HOLIDAY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(318, '3502', 'BEST WESTERN HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(319, '3503', 'SHERATON HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(320, '3504', 'HILTON HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(321, '3505', 'FORTE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(322, '3506', 'GOLDEN TULIP HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(323, '3507', 'FRIENDSHIP INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(324, '3508', 'QUALITY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(325, '3509', 'MARRIOTT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(326, '3510', 'DAYS INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(327, '3511', 'ARABELLA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(328, '3512', 'INTER-CONTINENTAL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(329, '3513', 'WESTIN (WESTIN HOTELS)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(330, '3514', 'AMERISUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(331, '3515', 'RODEWAY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(332, '3516', 'LA QUINTA MOTOR INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(333, '3517', 'AMERICANA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(334, '3518', 'SOL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(335, '3519', 'PULLMAN INTERNATIONAL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(336, '3520', 'MERIDIEN HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(337, '3521', 'ROYAL LAHAINA RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(338, '3522', 'TOKYO HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(339, '3523', 'PENINSULA HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(340, '3524', 'WELCOMGROUP HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(341, '3525', 'DUNFEY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(342, '3526', 'PRINCE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(343, '3527', 'DOWNTOWNER-PASSPORT HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(344, '3529', 'CP (CANADIAN PACIFIC) HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(345, '3530', 'RENAISSANCE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(346, '3531', 'KAUAI COCONUT BEACH RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(347, '3532', 'ROYAL KONA RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(348, '3533', 'HOTEL IBIS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(349, '3534', 'SOUTHERN PACIFIC HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(350, '3535', 'HILTON INTERNATIONALS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(351, '3536', 'AMFAC HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(352, '3537', 'ANA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(353, '3538', 'CONCORDE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(354, '3539', 'SUMMERFIELD SUITES HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(355, '3540', 'IBEROTEL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(356, '3541', 'HOTEL OKURA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(357, '3542', 'ROYAL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(358, '3543', 'FOUR SEASONS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(359, '3544', 'CIGA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(360, '3545', 'SHANGRI-LA INTERNATIONAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(361, '3546', 'SIERRA SUITES HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(362, '3547', 'BREAKERS RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(363, '3548', 'HOTELS MELIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(364, '3549', 'AUBERGE DES GOVERNEURS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(365, '3550', 'REGAL 8 INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(366, '3551', 'MIRAGE HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(367, '3552', 'COAST HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(368, '3553', 'PARK INNS INTERNATIONAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(369, '3554', 'PINEHURST RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(370, '3555', 'TREASURE ISLAND HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(371, '3556', 'BARTON CREEK RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(372, '3557', 'MANHATTAN EAST SUITE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(373, '3558', 'JOLLY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(374, '3559', 'CANDLEWOOD SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(375, '3560', 'ALADDIN RESORT AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(376, '3561', 'GOLDEN NUGGET', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(377, '3562', 'COMFORT INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(378, '3563', 'JOURNEY’S END MOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(379, '3564', 'SAM’S TOWN HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(380, '3565', 'RELAX INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(381, '3565', 'RELAX INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(382, '3566', 'GARDEN PLACE HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(383, '3567', 'SOHO GRAND HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(384, '3568', 'LADBROKE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(385, '3569', 'TRIBECA GRAND HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(386, '3570', 'FORUM HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(387, '3571', 'GRAND WAILEA RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(388, '3572', 'MIYAKO HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(389, '3573', 'SANDMAN HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(390, '3574', 'VENTURE INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(391, '3575', 'VAGABOND HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(392, '3576', 'LA QUINTA RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(393, '3577', 'MANDARIN ORIENTAL HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(394, '3578', 'FRANKENMUTH BAVARIAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(395, '3579', 'HOTEL MERCURE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(396, '3580', 'HOTEL DEL CORONADO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(397, '3581', 'DELTA HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(398, '3582', 'CALIFORNIA HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(399, '3583', 'RADISSON BLU', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(400, '3583', 'SAS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(401, '3584', 'PRINCESS HOTELS INTERNATIONAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(402, '3585', 'HUNGAR HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(403, '3586', 'SOKOS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(404, '3587', 'DORAL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(405, '3588', 'HELMSLEY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(406, '3589', 'DORAL GOLF RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(407, '3590', 'FAIRMONT HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(408, '3591', 'SONESTA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(409, '3592', 'OMNI HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(410, '3593', 'CUNARD HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(411, '3594', 'ARIZONA BILTMORE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(412, '3595', 'HOSPITALITY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(413, '3596', 'WYNN LAS VEGAS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(414, '3597', 'RIVERSIDE RESORT HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(415, '3598', 'REGENT INTERNATIONAL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(416, '3599', 'PANNONIA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(417, '3600', 'SADDLEBROOK RESORT TAMPA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(418, '3601', 'TRADEWINDS RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(419, '3602', 'HUDSON HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(420, '3603', 'NOAH’S HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(421, '3604', 'HILTON GARDEN INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(422, '3605', 'JURYS DOYLE HOTEL GROUP', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(423, '3606', 'JEFFERSON HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(424, '3607', 'FONTAINEBLEAU RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(425, '3608', 'GAYLORD OPRYLAND', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(426, '3609', 'GAYLORD PALMS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(427, '3610', 'GAYLORD TEXAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(428, '3611', 'C MON INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(429, '3612', 'MOEVENPICK HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(430, '3613', 'MICROTEL INNS & SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(431, '3614', 'AMERICINN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(432, '3615', 'TRAVELODGE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(433, '3616', 'HERMITAGE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(434, '3617', 'AMERICA’S BEST VALUE INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(435, '3618', 'GREAT WOLF', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(436, '3619', 'ALOFT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(437, '3620', 'BINION’S HORSESHOE CLUB', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(438, '3621', 'EXTENDED STAY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(439, '3622', 'MERLIN HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(440, '3623', 'DORINT HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(441, '3624', 'LADY LUCK HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(442, '3625', 'HOTEL UNIVERSALE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(443, '3626', 'STUDIO PLUS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(444, '3627', 'EXTENDED STAY AMERICA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(445, '3628', 'EXCALIBUR HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(446, '3629', 'DAN HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(447, '3630', 'EXTENDED STAY DELUXE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(448, '3631', 'SLEEP INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(449, '3632', 'THE PHOENICIAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(450, '3633', 'RANK HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(451, '3634', 'SWISSOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(452, '3635', 'RESO HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(453, '3636', 'SAROVA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(454, '3637', 'RAMADA INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(455, '3638', 'HOWARD JOHNSON', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(456, '3639', 'MOUNT CHARLOTTE THISTLE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(457, '3640', 'Hyatt Hotels', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(458, '3641', 'SOFITEL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(459, '3642', 'NOVOTEL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(460, '3643', 'STEIGENBERGER HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(461, '3644', 'ECONO LODGES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(462, '3645', 'QUEENS MOAT HOUSES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(463, '3646', 'SWALLOW HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(464, '3647', 'HUSA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(465, '3648', 'DE VERE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(466, '3649', 'RADISSON HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(467, '3650', 'RED ROOF INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(468, '3651', 'IMPERIAL LONDON HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(469, '3652', 'EMBASSY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(470, '3653', 'PENTA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(471, '3654', 'LOEWS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(472, '3655', 'SCANDIC HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(473, '3656', 'SARA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(474, '3657', 'OBEROI HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(475, '3658', 'NEW OTANI HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(476, '3659', 'TAJ HOTELS INTERNATIONAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(477, '3660', 'KNIGHTS INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(478, '3661', 'METROPOLE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(479, '3662', 'CIRCUS CIRCUS HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(480, '3663', 'HOTELES EL PRESIDENTE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(481, '3664', 'FLAG INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(482, '3665', 'HAMPTON INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(483, '3666', 'STAKIS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(484, '3667', 'LUXOR HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(485, '3668', 'MARITIM HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(486, '3669', 'ELDORADO HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(487, '3670', 'ARCADE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(488, '3671', 'ARCTIA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(489, '3672', 'CAMPANILE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(490, '3673', 'IBUSZ HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(491, '3674', 'RANTASIPI HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(492, '3675', 'INTERHOTEL CEDOK', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(493, '3676', 'MONTE CARLO HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(494, '3677', 'CLIMAT DE FRANCE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(495, '3678', 'CUMULUS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(496, '3679', 'SILVER LEGACY HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(497, '3680', 'HOTEIS OTHAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(498, '3681', 'ADAMS MARK HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(499, '3682', 'SAHARA HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(500, '3683', 'BRADBURY SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(501, '3684', 'BUDGET HOST INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(502, '3685', 'BUDGETEL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(503, '3686', 'SUSSE CHALET', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(504, '3687', 'CLARION HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(505, '3688', 'COMPRI HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(506, '3690', 'COURTYARD BY MARRIOTT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(507, '3691', 'DILLON INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(508, '3692', 'DOUBLETREE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(509, '3693', 'DRURY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(510, '3694', 'ECONOMY INNS OF AMERICA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(511, '3695', 'EMBASSY SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(512, '3696', 'EXEL INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(513, '3697', 'FAIRFIELD HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(514, '3698', 'HARLEY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(515, '3699', 'MIDWAY MOTOR LODGE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(516, '3700', 'MOTEL 6', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(517, '3701', 'LA MANSION DEL RIO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(518, '3702', 'THE REGISTRY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(519, '3703', 'RESIDENCE INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(520, '3704', 'ROYCE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(521, '3705', 'SANDMAN INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(522, '3706', 'SHILO INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(523, '3707', 'SHONEYS INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(524, '3708', 'VIRGIN RIVER HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(525, '3709', 'SUPER 8 MOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(526, '3710', 'THE RITZ-CARLTON', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(527, '3711', 'FLAG INNS (AUSTRALIA)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(528, '3712', 'BUFFALO BILL’S HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(529, '3713', 'QUALITY PACIFIC HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(530, '3714', 'FOUR SEASONS HOTEL (AUSTRALIA)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(531, '3715', 'FAIRFIELD INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(532, '3716', 'CARLTON HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(533, '3717', 'CITY LODGE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(534, '3718', 'KAROS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(535, '3719', 'PROTEA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(536, '3720', 'SOUTHERN SUN HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(537, '3721', 'HILTON CONRAD', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(538, '3722', 'WYNDHAM', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(539, '3723', 'RICA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(540, '3724', 'INTER NOR HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(541, '3725', 'SEA PINES RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(542, '3726', 'RIO SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(543, '3727', 'BROADMOOR HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(544, '3728', 'BALLY’S HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(545, '3729', 'JOHN ASCUAGA’S NUGGET', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(546, '3730', 'MGM GRAND HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(547, '3731', 'HARRAHS HOTELS / CASINOS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(548, '3732', 'OPRYLAND HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(549, '3733', 'BOCA RATON RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(550, '3734', 'HARVEY/BRISTOL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(551, '3735', 'MASTERS ECONOMY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin');
INSERT INTO `tqris_mcc` (`id`, `code`, `name`, `category`, `description`, `mdr`, `datestamp`, `datestamuid`) VALUES
(552, '3736', 'COLORADO BELLE/EDGEWATER RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(553, '3737', 'RIVIERA HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(554, '3738', 'TROPICANA RESORT & CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(555, '3739', 'WOODSIDE HOTELS & RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(556, '3740', 'TOWNEPLACE SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(557, '3741', 'MILLENNIUM HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(558, '3742', 'CLUB MED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(559, '3743', 'BILTMORE HOTEL & SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(560, '3744', 'CAREFREE RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(561, '3745', 'ST. REGIS HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(562, '3746', 'THE ELIOT HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(563, '3747', 'CLUB CORP / CLUB RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(564, '3748', 'WELLESLEY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(565, '3749', 'THE BEVERLY HILLS HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(566, '3750', 'CROWNE PLAZA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(567, '3751', 'HOMEWOOD SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(568, '3752', 'PEABODY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(569, '3753', 'GREENBRIAR RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(570, '3754', 'AMELIA ISLAND PLANTATION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(571, '3755', 'THE HOMESTEAD', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(572, '3756', 'SOUTH SEAS RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(573, '3757', 'CANYON RANCH', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(574, '3758', 'KAHALA MANDARIN ORIENTAL HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(575, '3759', 'THE ORCHID AT MAUNA LANI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(576, '3760', 'HALEKULANI HOTEL/WAIKIKI PARC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(577, '3761', 'PRIMADONNA HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(578, '3762', 'WHISKEY PETE’S HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(579, '3763', 'CHATEAU ELAN WINERY AND RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(580, '3764', 'BEAU RIVAGE HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(581, '3765', 'BELLAGIO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(582, '3766', 'FREMONT HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(583, '3767', 'MAIN STREET STATION HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(584, '3768', 'SILVER STAR HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(585, '3769', 'STRATOSPHERE HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(586, '3770', 'SPRINGHILL SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(587, '3771', 'CAESAR’S HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(588, '3772', 'NEMACOLIN WOODLANDS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(589, '3773', 'THE VENETIAN RESORT HOTEL CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(590, '3774', 'NEW YORK-NEW YORK HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(591, '3775', 'SANDS RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(592, '3776', 'NEVELE GRAND RESORT AND COUNTRY CLUB', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(593, '3777', 'MANDALAY BAY RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(594, '3778', 'FOUR POINTS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(595, '3779', 'W HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(596, '3780', 'DISNEY RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(597, '3781', 'PATRICIA GRAND RESORT HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(598, '3782', 'ROSEN HOTELS AND RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(599, '3783', 'TOWN AND COUNTRY RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(600, '3784', 'FIRST HOSPITALITY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(601, '3785', 'OUTRIGGER HOTELS AND RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(602, '3786', 'OHANA HOTELS OF HAWAII', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(603, '3787', 'CARIBE ROYALE RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(604, '3788', 'ALA MOANA HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(605, '3789', 'SMUGGLER’S NOTCH RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(606, '3790', 'RAFFLES HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(607, '3791', 'STAYBRIDGE SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(608, '3792', 'CLARIDGE CASINO HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(609, '3793', 'FLAMINGO HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(610, '3794', 'GRAND CASINO HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(611, '3795', 'PARIS LAS VEGAS HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(612, '3796', 'PEPPERMILL HOTEL CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(613, '3797', 'ATLANTIC CITY HILTON RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(614, '3798', 'EMBASSY VACATION RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(615, '3799', 'HALE KOA HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(616, '3800', 'HOMESTEAD SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(617, '3801', 'WILDERNESS HOTEL AND RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(618, '3802', 'THE PALACE HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(619, '3803', 'THE WIGMAM GOLF RESORT AND SPA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(620, '3804', 'THE DIPLOMAT COUNTRY CLUB SPA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(621, '3805', 'THE ATLANTIC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(622, '3806', 'PRINCEVILLE RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(623, '3807', 'ELEMENT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(624, '3808', 'LXR (Luxury Resorts)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(625, '3809', 'SETTLE INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(626, '3810', 'LA COSTA RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(627, '3811', 'PREMIER INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(628, '3812', 'HYATT PLACE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(629, '3813', 'HOTEL INDIGO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(630, '3814', 'THE ROOSEVELT HOTEL NY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(631, '3815', 'NICKELODEON FAMILY SUITES BY HOLIDAY INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(632, '3817', 'AFFINIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(633, '3818', 'MAINSTAY SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(634, '3819', 'OXFORD SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(635, '3820', 'JUMEIRAH ESSEX HOUSE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(636, '3821', 'CARIBE ROYALE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(637, '3822', 'CROSSLAND', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(638, '3823', 'GRAND SIERRA RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(639, '3824', 'ARIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(640, '3825', 'VDARA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(641, '3826', 'AUTOGRAPH', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(642, '3827', 'GALT HOUSE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(643, '3828', 'COSMOPOLITAN OF LAS VEGAS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(644, '4011', 'RAILROADS – FREIGHT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(645, '4111', 'LOCAL AND SUBURBAN COMMUTER PASSENGER TRANSPORTATION, INCLUDING FERRIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(646, '4112', 'PASSENGER RAILWAYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(647, '4119', 'AMBULANCE SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(648, '4121', 'TAXICABS & LIMOUSINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(649, '4131', 'BUS LINES, INCLUDING CHARTERS, TOUR BUSES # TOUR BUSES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(650, '4214', 'MOTOR FREIGHT CARRIERS & TRUCKING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(651, '4215', 'COURIER SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(652, '4225', 'PUBLIC WAREHOUSING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(653, '4225', 'PUBLIC WAREHOUSING & STORAGE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(654, '4411', 'STEAMSHIP & CRUISE LINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(655, '4457', 'BOAT RENTALS & LEASES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(656, '4468', 'MARINAS MARINE SERVICE & SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(657, '4511', 'AIRLINES & AIR CARRIERS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(658, '4582', 'AIRPORTS, FLYING FIELDS, & AIRPORT TERMINALS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(659, '4722', 'TRAVEL AGENCIES & TOUR OPERATORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(660, '4723', 'PACKAGE TOUR OPERATORS - GERMANY ONLY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(661, '4761', 'TELEMARKETING OF TRAVEL RELATED SERVICES AND V', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(662, '4784', 'TOLL AND BRIDGE FEES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(663, '4789', 'TRANSPORTATION SERVICES (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(664, '4812', 'TELECOMMUNICATION EQUIPMENT & TELEPHONE SALES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(665, '4813', 'SPECIAL TELECOM MERCHANT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(666, '4814', 'TELECOMMUNICATION SERVICES, INCLUDING LOCAL AND LONG DISTANCE CALLS, CREDIT CARD CALLS, CALLS THROUGH USE OF MAGNETIC STRIPE READING TELEPHONES AND FAX SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(667, '4815', 'VISAPHONE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(668, '4816', 'COMPUTER NETWORK / INFORMATION SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(669, '4821', 'TELEGRAPH SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(670, '4829', 'WIRE TRANSFER MONEY ORDERS (WTMOs)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(671, '4899', 'CABLE SATELLITE & OTHER PAY TELEVISION & RADIO SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(672, '4900', 'UTILITIES-ELECTRIC, GAS, WATER, SANITARY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(673, '5013', 'MOTOR VEHICLE SUPPPLIES & NEW PARTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(674, '5021', 'OFFICE & COMMERCIAL FURNITURE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(675, '5039', 'CONSTRUCTION MATERIALS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(676, '5044', 'PHOTOGRAPHIC PHOTOCOPY MICROFILM EQUIPMENT & SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(677, '5045', 'COMPUTERS & COMPUTER PERIPHERAL EQUIPMENT & SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(678, '5046', 'COMMERCIAL EQUIPMENT (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(679, '5047', 'MEDICAL DENTAL OPHTHALMIC & HOSPITAL EQUIPMENT & SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(680, '5051', 'METAL SERVICE CENTERS & OFFICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(681, '5065', 'ELECTRICAL PARTS AND EQUIPMENT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(682, '5072', 'HARDWARE, EQUIPMNT AND SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(683, '5074', 'PLUMBING AND HEATING EQUIPMENT & SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(684, '5085', 'INDUSTRIAL SUPPLIES (NOT ELSEWHERE CLSSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(685, '5094', 'PRECIOUS STONES, METALS, WATCHES, & JEWELRY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(686, '5099', 'DURABLE GOODS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(687, '5111', 'STATIONERY STORES OFFICE & SCHOOL SUPPLY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(688, '5122', 'DRUGS DRUG PROPRIETARIES & DRUGGIST SUNDRIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(689, '5131', 'PIECE GOODS, NOTIONS, AND OTHER DRY GOODS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(690, '5137', 'MENS, WOMENS, & CHILDRENS UNIFORMS, & COMMERCIAL CLOTHING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(691, '5139', 'COMMERCIAL FOOTWEAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(692, '5169', 'CHEMICALS & ALLIED PRODUCTS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(693, '5192', 'BOOKS, PERIODICALS, & NEWSPAPERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(694, '5193', 'FLORIST SUPPLIES, NURSERY STOCK, & FLOWERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(695, '5198', 'PAINT, VARNISHES, & SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(696, '5199', 'NONDURABLE GOODS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(697, '5200', 'HOME SUPPLY WAREHOUSE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(698, '5211', 'LUMBER & BUILDING MATERIALS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(699, '5231', 'GLASS, PAINT, & WALLPAPER STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(700, '5251', 'HARDWARE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(701, '5261', 'NURSERIES & LAWN & GARDEN SUPPLY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(702, '5271', 'MOBILE HOME DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(703, '5300', 'WHOLESALE CLUB', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(704, '5309', 'DUTY FREE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(705, '5310', 'DISCOUNT STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(706, '5311', 'DEPARTMENT STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(707, '5331', 'VARIETY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(708, '5399', 'MISCELLANEOUS GENERAL MERCHANDISE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(709, '5407', 'SECURITY CREDIT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(710, '5411', 'GROCERY STORES & SUPERMARKETS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(711, '5422', 'FREEZER & LOCKER MEAT PROVISIONERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(712, '5441', 'CANDY, NUT, & CONFECTIONERY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(713, '5451', 'DAIRY PRODUCTS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(714, '5462', 'BAKERIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(715, '5499', 'MISCELLANEOUS FOOD STORES-CONVENIENCE STORES & SPECIALTY MARKETS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(716, '5511', 'CAR & TRUCK DEALERS (NEW & USED) SALES SERVICE REPAIRS PARTS & LEASING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(717, '5521', 'CAR & TRUCK DEALERS (USED ONLY) SALES SERVICE REPAIRS PARTS & LEASING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(718, '5531', 'AUTO & HOME SUPPLY STORES (NO LONGER VALID MCC)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(719, '5532', 'AUTOMOTIVE TIRE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(720, '5533', 'AUTOMOTIVE PARTS & ACCESSORIES STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(721, '5537', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(722, '5551', 'BOAT DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(723, '5555', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(724, '5561', 'CAMPER, RECREATIONAL & UTILITY TRAILER DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(725, '5571', 'MOTORCYCLE DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(726, '5592', 'MOTOR HOMES DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(727, '5598', 'SNOWMOBILE DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(728, '5599', 'MISCELLANEOUS AUTOMOTIVE , AIRCRAFT, & FARM EQUIPMENT DEALERS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(729, '5611', 'MENS & BOYS CLOTHING & ACCESSORIES STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(730, '5612', 'WOMENS READY-TO-WEAR STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(731, '5621', 'WOMENS READY-TO-WEAR STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(732, '5631', 'WOMENS ACCESSORY & SPECIALTY SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(733, '5641', 'CHILDRENS AND INFANTS WEAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(734, '5651', 'FAMILY CLOTHING STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(735, '5655', 'SPORTS & RIDING APPAREL STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(736, '5661', 'SHOE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(737, '5681', 'FURRIERS & FUR SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(738, '5691', 'MENS & BOYS CLOTHING & ACCESSORIES STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(739, '5697', 'TAILORS SEAMSTRESSES MENDING & ALTERATIONS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(740, '5698', 'WIG AND TOUPEE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(741, '5699', 'MISCELLANEOUS APPAREL & ACCESSORY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(742, '5712', 'FURNITURE HOME FURNISHINGS & EQUIPMENT STORES EXCEPTING APPLIANCES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(743, '5713', 'FLOOR COVERING STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(744, '5714', 'DRAPERY, WINDOW COVERING, & UPHOLSTERY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(745, '5718', 'FIREPLACE, FIREPLACE SCREENS & ACCESSORIES STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(746, '5719', 'MISCELLANEOUS HOME FURNISHING SPECIALTY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(747, '5722', 'HOUSEHOLD APPLIANCE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(748, '5732', 'ELECTRONICS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(749, '5733', 'MUSIC STORES - MUSICAL INSTRUMENTS PIANOS & SHEET MUSIC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(750, '5734', 'COMPUTER SOFTWARE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(751, '5735', 'RECORD STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(752, '5811', 'CATERERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(753, '5812', 'EATING PLACES & RESTAURANTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(754, '5813', 'DRINKING PLACES - BARS TAVERNS NIGHTCLUBS COCKTAIL LOUNGES & DISCOTHEQUES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(755, '5814', 'FAST FOOD RESTAURANTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(756, '5821', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(757, '5912', 'DRUG STORES & PHARMACIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(758, '5921', 'PACKAGE STORES - BEER, WINE & LIQUOR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(759, '5931', 'USED MERCHANDISE & SECONDHAND STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(760, '5932', 'ANTIQUE SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(761, '5932', 'ANTIQUE SHOPS - SALES REPAIRS & RESTORATION SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(762, '5933', 'PAWN SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(763, '5935', 'WRECKING AND SALVAGE YARDS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(764, '5937', 'ANTIQUE REPRODUCTIONS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(765, '5940', 'BICYCLE SHOPS-SALES & SERVICE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(766, '5941', 'SPORTING GOODS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(767, '5942', 'BOOK STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(768, '5943', 'STATIONERY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(769, '5944', 'JEWELRY STORES WATCHES CLOCKS & SILVERWARE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(770, '5945', 'HOBBY TOY & GAME SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(771, '5946', 'CAMERA & PHOTOGRAPHIC SUPPLY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(772, '5947', 'GIFT CARD NOVELTY & SOUVENIR SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(773, '5948', 'LUGGAGE & LEATHER GOODS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(774, '5949', 'SEWING NEEDLEWORK, FABRIC, & PIECE GOODS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(775, '5950', 'GLASSWARE / CRYSTAL STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(776, '5960', 'DIRECT MARKETING - INSURANCE SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(777, '5961', 'MAIL ORDER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(778, '5962', 'DIRECT MARKETING - TRAVEL-RELATED ARRANGEMENT SERVICES  (HIGH RISK MCC)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(779, '5963', 'DOOR-TO-DOOR SALES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(780, '5964', 'DIRECT MARKETING - CATALOG MERCHANT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(781, '5965', 'DIRECT MARKETING - COMBINATION CATALOG AND RETAIL MERCHANT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(782, '5966', 'DIRECT MARKETING - OUTBOUND TELEMARKETING MERCHANT  (HIGH RISK MCC)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(783, '5967', 'DIRECT MARKETING - INBOUND TELESERVICES MERCHANT  (HIGH RISK MCC)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(784, '5968', 'DIRECT MARKETING - CONTINUITY/SUBSCRIPTION MERCH', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(785, '5969', 'DIRECT MARKETING - OTHER DIRECT MARKETERS  (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(786, '5970', 'ARTISTS SUPPLY & CRAFT SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(787, '5971', 'ART DEALERS & GALLERIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(788, '5972', 'STAMP AND COIN STORES - PHILATELIC AND NUMISMATIC SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(789, '5973', 'RELIGIOUS GOODS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(790, '5975', 'HEARING AIDS - SALES SERVICE & SUPPLY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(791, '5976', 'ORTHOPEDIC GOODS - PROSTHETIC DEVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(792, '5977', 'COSMETIC STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(793, '5978', 'TYPEWRITER STORE-SALES, RENTALS, SERVICE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(794, '5992', 'FLORISTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(795, '5993', 'CIGAR STORES AND STANDS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(796, '5994', 'NEWS DEALERS & NEWS STANDS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(797, '5995', 'PET SHOPS, PET FOODS & SUPPLY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(798, '5996', 'SWIMMING POOLS - SALES & SERVICE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(799, '5997', 'ELECTRIC RAZOR STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(800, '5998', 'TENT AND AWNING SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(801, '5999', 'MISCELLANEOUS AND SPECIALTY RETAIL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(802, '6010', 'FINANCIAL INSTITUTIONS - MANUAL CASH DISBURSEMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(803, '6011', 'FINANCIAL INSTITUTIONS AUTOMATED CASH DISBURSEMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(804, '6012', 'FINANCIAL INSTITUTIONS MERCHANDISE & SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(805, '6050', 'QUASI CASH - MEMBER FINANCIAL INSTITUTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(806, '6051', 'NON-FINANCIAL INSTITUTIONS-FOREIGN CURRENCY, MONEY ORDERS (NOT WIRE TRANSFER) AND TRAVELERS CHEQUE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(807, '6211', 'SECURITY BROKERS / DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(808, '6300', 'INSURANCE SALES UNDERWRITING & PREMIUMS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(809, '6381', 'INSURANCE PREMIUMS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(810, '6399', 'INSURANCE NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(811, '6513', 'REAL ESTATE AGENTS, MANAGER & RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(812, '6529', 'QUASI CASH - REMOTE STORED VALUE LOAD - FINANCIAL INSTITUTE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(813, '6530', 'QUASI CASH - REMOTE STORED VALUE LOAD - MERCHANT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(814, '6531', 'PAYMENT SERVICE PROVIDER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(815, '6532', 'MEMBER FINANCIAL INSTITUTION--PAYMENT SERVICE PROVIDER-- PAYMENT TRANSACTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(816, '6533', 'MERCHANT--PAYMENT SERVICE PROVIDER--PAYMENT TRANSACTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(817, '6534', 'QUASI CASH - MONEY TRANSFER - MEMBER FINANCIAL INSTITUTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(818, '6535', 'VALUE PURCHASE--MEMBER FINANCIAL INSTITUTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(819, '6611', 'OVERPAYMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(820, '6760', 'SAVINGS BONDS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(821, '7011', 'LODGING - HOTELS MOTELS RESORTS & CENTRAL RESERVATION SERVICES (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(822, '7012', 'TIMESHARES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(823, '7032', 'SPORTING & RECREATIONAL CAMPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(824, '7033', 'TRAILER PARKS & CAMP SITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(825, '7210', 'LAUNDRY, CLEANING, & GARMENT SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(826, '7211', 'LAUNDRIES - FAMILY & COMMERCIAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(827, '7216', 'DRY CLEANERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(828, '7217', 'CARPET AND UPHOLSTERY CLEANING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(829, '7221', 'PHOTOGRAPHIC STUDIOS-PORTRAITS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(830, '7230', 'BEAUTY & BARBER SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(831, '7251', 'SHOE REPAIR SHOPS SHOE SHINE PARLORS & HAT CLEANING SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(832, '7261', 'FUNERAL SERVICE & CREMATORIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(833, '7273', 'DATING AND ESCORT SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(834, '7276', 'TAX PREPARATION SERVICE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(835, '7277', 'COUNSELING SERVICE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(836, '7278', 'BUYING & SHOPPING SERVICES AND CLUBS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(837, '7295', 'NO LONGER USED - VISA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(838, '7296', 'CLOTHING RENTAL - COSTUMES UNIFORMS & FORMAL WEAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(839, '7296', 'COSTUME RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(840, '7297', 'MASSAGE PARLORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(841, '7298', 'HEALTH & BEAUTY SPA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(842, '7299', 'MISCELLANEOUS PERSONAL SERVICES (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(843, '7311', 'ADVERTISING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(844, '7321', 'CONSUMER CREDIT REPORTING AGENCIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(845, '7322', 'DEBT COLLECTION AGENCIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(846, '7332', 'BLUEPRINTING AND PHOTOCOPYING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(847, '7333', 'COMMERCIAL PHOTOGRAPHY ART & GRAPHICS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(848, '7338', 'QUICK COPY REPRODUCTION & BLUEPRINTING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(849, '7339', 'STENOGRAPHIC & SECRETARIAL SUPPORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(850, '7341', 'WINDOW CLEANING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(851, '7342', 'EXTERMINATING & DISINFECTING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(852, '7349', 'CLEANING MAINTENANCE & JANITORIAL SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(853, '7361', 'EMPLOYMENT AGENCIES & TEMPORARY HELP SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(854, '7372', 'COMPUTER PROGRAMMING  DATA PROCESSING & INTEGRATED SYSTEMS DESIGN SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(855, '7375', 'INFORMATION RETRIEVAL SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(856, '7379', 'COMPUTER MAINTENANCE, REPAIR, & SERVICES  (NOT ELSEWHERE CLASSFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(857, '7392', 'MANAGEMENT, CONSULTING, & PUBLIC RELATIONS SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(858, '7393', 'PROTECTIVE AND SECURITY SERVICES - INCLUDING ARMORED CARS AND GUARD DOGS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(859, '7394', 'EQUIPMENT, TOOL, FURNITURE, & APPLIANCE RENTAL AND LEASING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(860, '7395', 'PHOTOFINISHING LABORATORIES & PHOTO DEVELOPING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(861, '7399', 'BUSINESS SERVICES (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(862, '7511', 'QUASI CASH - TRUCK STOP TRANSACTIONS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(863, '7512', 'AUTOMOBILE RENTAL AGENCY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(864, '7513', 'TRUCK AND UTILITY TRAILER RENTALS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(865, '7519', 'MOTOR HOME & RECREATIONAL VEHICLE RENTALS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(866, '7523', 'PARKING LOTS & GARAGES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(867, '7524', 'EXPRESS PAYMENT SERVICE MERCHANTS - PARKING LOTS AND GARAGES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(868, '7531', 'AUTOMOTIVE TOP AND BODY REPAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(869, '7534', 'TIRE RETREADING & REPAIR SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(870, '7535', 'PAINT SHOPS-AUTOMOTIVE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(871, '7538', 'AUTOMOTIVE SERVICE SHOPS (NON-DEALER)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(872, '7542', 'CAR WASHES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(873, '7549', 'TOWING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(874, '7622', 'ELECTRONICS REPAIR SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(875, '7623', 'AIR CONDITIONING & REFRIGERATION REPAIR SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(876, '7629', 'ELECTRICAL & SMALL APPLIANCE REPAIR SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(877, '7631', 'WATCH, CLOCK & JEWELRY REPAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(878, '7641', 'FURNITURE - REUPHOLSTERY, REPAIR, & REFINISHING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(879, '7692', 'WELDING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(880, '7699', 'MISCELLANEOUS REPAIR SHOPS & RELATED SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(881, '7778', 'CITISHARE CASH ADVANCE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(882, '7829', 'MOTION PICTURE & VIDEO TAPE PRODUCTION & DISTRIBUTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(883, '7832', 'MOTION PICTURE THEATERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(884, '7833', 'EXPRESS PAYMENT SERVICE MERCHANTS--MOTION PICT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(885, '7841', 'MOTION PICTURE & VIDEO TAPE PRODUCTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(886, '7911', 'DANCE HALLS, STUDIOS AND SCHOOLS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(887, '7922', 'THEATRICAL PRODUCERS (EXCEPT MOTION PICTURES) AND TICKET AGENCIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(888, '7929', 'BANDS, ORCHESTRAS, AND MISCELLANEOUS ENTERTAINERS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(889, '7932', 'BILLARD AND POOL ESTABLISHMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(890, '7933', 'BOWLING ALLEYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(891, '7941', 'COMMERCIAL SPORTS PROFESSIONAL SPORTS CLUBS ATHLETIC FIELDS & SPORTS PROMOTERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(892, '7991', 'TOURIST ATTRACTIONS & EXHIBITS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(893, '7992', 'GOLF COURSES - PUBLIC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(894, '7993', 'VIDEO AMUSEMENT GAME SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(895, '7994', 'VIDEO GAME ARCADES / ESTABLISHMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(896, '7995', 'BETTING, INCLUDING LOTTERY TICKETS, CASINO GAMING CHIPS, OFF- TRACK BETTING & WAGERS AT RACE TRACKS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(897, '7996', 'AMUSEMENT PARKS, CARNIVALS, CIRCUSES, FORTUNE TELLERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(898, '7997', 'MEMBERSHIP CLUBS COUNTRY CLUBS & PRIVATE GOLF COURSES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(899, '7998', 'AQUARIUMS, SEA-AQUARIUMS, DOLPHINARIUMS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(900, '7999', 'AMUSEMENT & RECREATION SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(901, '8011', 'DOCTORS & PHYSICIANS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(902, '8021', 'DENTISTS & ORTHODONTISTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(903, '8031', 'OSTEOPATHS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(904, '8041', 'CHIROPRACTORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(905, '8042', 'OPTOMETRISTS & OPHTHALMOLOGISTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(906, '8043', 'OPTICIANS OPTICAL GOODS & EYEGLASSES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(907, '8044', 'OPTICAL GOODS AND EYEGLASSES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(908, '8049', 'CHIROPODISTS, PODIATRISTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(909, '8050', 'NURSING & PERSONAL CARE FACILITIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(910, '8062', 'HOSPITALS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(911, '8071', 'MEDICAL & DENTAL LABORATORIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(912, '8099', 'MEDICAL SERVICES AND HEALTH PRACTITIONERS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(913, '8111', 'LEGAL SERVICES & ATTORNEYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(914, '8351', 'CHILD CARE SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(915, '8602', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(916, '8641', 'CIVIC, SOCIAL, & FRATERNAL ASSOC.', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(917, '8651', 'POLITICAL ORGANIZATIONS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(918, '8675', 'AUTOMOBILE ASSOCIATIONS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(919, '8699', 'MEMBERSHIP ORGANIZATIONS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(920, '8734', 'TESTING LABORATORIES (NON-MEDICAL TESTING)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(921, '8911', 'ARCHITECTURAL, ENGINEERING, & SURVEYING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(922, '8931', 'ACCOUNTING, AUDITING, & BOOKKEEPING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(923, '8999', 'PROFESSIONAL SEVICES  (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(924, '9223', 'BAIL AND BOND PAYMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(925, '9401', 'I-PURCHASING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(926, '9402', 'POSTAL SERVICES - GOVERNMENT ONLY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(927, '9405', 'U.S. FEDERAL GOVERNMENT AGENCIES OR DEPARTMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(928, '9411', 'GOVERNMENT LOAN PAYMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(929, '9700', 'AUTOMATED REFERRAL SERVICE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(930, '9701', 'COOPERATION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(931, '9701', 'VISA CREDENTIAL SERVER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(932, '9702', 'EMERGENCY SERVICES (GCAS)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(933, '9703', 'BPR/RURAL BANK', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(934, '9704', 'PYRAMID OR MULTI LEVEL MARKETING DISTRIBUTION COMPANIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(935, '9705', 'THIRD PARTY PROCESSORS (AGGREGATORS)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(936, '9751', 'U.K. SUPERMARKETS ELECTRONIC HOT FILE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(937, '9752', 'U.K. PETROL STATIONS, ELECTRONIC HOT FILE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(938, '9753', 'INTRA-COMPANY PURCHASES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(939, '9754', 'QUASI CASH - GAMBLING - HORSE RACING, DOG RACING, STATE LOTTERIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(940, '9950', 'INTRA-COMPANY PURCHASES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(941, '9399', 'Government Services - Not Elsewhere Classified', 'G2P', 'Bansos', '0', '44281.5778446759', 'admin'),
(942, '9211', 'Court Costs (including Alimony and Child Support)', 'P2G Nasional & Daerah', 'Pajak, Imigrasi (Paspor)', '0', '44281.5778446759', 'admin'),
(943, '9222', 'Fines', 'P2G Nasional & Daerah', 'Pajak, Imigrasi (Paspor)', '0', '44281.5778446759', 'admin'),
(944, '9311', 'Tax Payments', 'P2G Nasional & Daerah', 'Pajak, Imigrasi (Paspor)', '0', '44281.5778446759', 'admin'),
(945, '9399', 'Government Services - Not Elsewhere Classified', 'P2G Nasional & Daerah', 'Pajak, Imigrasi (Paspor)', '0', '44281.5778446759', 'admin'),
(946, '8398', 'Charitable and Social Service Organizations', 'Donasi Sosial', 'Khusus Donasi Non Profit', '0', '44281.5778446759', 'admin'),
(947, '8661', 'Religious Organizations', 'Donasi Sosial', 'Khusus Donasi Non Profit', '0', '44281.5778446759', 'admin'),
(948, '5541', 'Service Stations', 'SPBU', '', '0.004', '44281.5778446759', 'admin'),
(949, '5542', 'Automated Fuel Dispensers (with or without Ancillary Services)', 'SPBU', '', '0.004', '44281.5778446759', 'admin'),
(950, '5172', 'Petroleum  and Petroleum Products', 'SPBU', '', '0.004', '44281.5778446759', 'admin'),
(951, '5983', 'Fuel Dealer - Coal, Fuel Oil, Liquefied Petroleum', 'SPBU', '', '0.004', '44281.5778446759', 'admin'),
(952, '8211', 'Elementary and Secondary Schools', 'Pendidikan', 'Sekolah, Universitas, Kursus', '0.006', '44281.5778446759', 'admin'),
(953, '8220', 'Colleges, Universities, Professional Schools, and Junior Colleges', 'Pendidikan', 'Sekolah, Universitas, Kursus', '0.006', '44281.5778446759', 'admin'),
(954, '8241', 'Correspondence Schools', 'Pendidikan', 'Sekolah, Universitas, Kursus', '0.006', '44281.5778446759', 'admin'),
(955, '8244', 'Business and Secretarial Schools', 'Pendidikan', 'Sekolah, Universitas, Kursus', '0.006', '44281.5778446759', 'admin'),
(956, '8249', 'Trade and Vocational Schools', 'Pendidikan', 'Sekolah, Universitas, Kursus', '0.006', '44281.5778446759', 'admin'),
(957, '8299', 'Schools and Educational Services - Not Elsewhere Classified', 'Pendidikan', 'Sekolah, Universitas, Kursus', '0.006', '44281.5778446759', 'admin'),
(958, '742', 'VETERINARY SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(959, '763', 'AGRICULTURAL CO-OPERATIVE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(960, '780', 'LANDSCAPING & HORTICULTURAL SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(961, '1520', 'GENERAL CONTRACTORS - RESIDENTIAL & COMMERCIAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(962, '1711', 'HEATING, PLUMBING, & AIR CONDITIONING CONTRACTORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(963, '1731', 'ELECTRICAL CONTRACTORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(964, '1740', 'MASONRY, STONEWORK, TILE SETTING, PLASTERING & INSULATION CONTRACTORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(965, '1750', 'CARPENTRY CONTRACTORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(966, '1761', 'ROOFING, SIDING, AND SHEET METAL WORK CONTRANTORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(967, '1771', 'CONTRACTORS-CONCRETE WORK', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(968, '1799', 'SPECIAL TRADE CONTRACTORS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(969, '2222', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(970, '2741', 'MISCELLANEOUS PUBLISHING & PRINTING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(971, '2791', 'TYPESETTING, PLATE MAKING, & RELATED SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(972, '2842', 'SPECIALTY CLEANING, POLISHING, & SANITATION PREPARATIONS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(973, '3000', 'UNITED AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(974, '3001', 'AMERICAN AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(975, '3002', 'PAN AMERICAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(976, '3003', 'EUROFLY AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(977, '3004', 'DRAGON AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(978, '3005', 'BRITISH AIRWAYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(979, '3006', 'Japan Air Lines--JAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(980, '3007', 'AIR FRANCE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(981, '3008', 'LUFTHANSA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(982, '3009', 'AIR CANADA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(983, '3010', 'KLM (ROYAL DUTCH AIRLINES)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(984, '3011', 'AEROFLOT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(985, '3012', 'QANTAS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(986, '3013', 'ALITALIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(987, '3014', 'SAUDI ARABIAN AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(988, '3015', 'Swiss International Air Lines--SWISS AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(989, '3016', 'Scandinavian Airline System (SAS)--SAS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(990, '3017', 'South African Airways--SAFRICAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(991, '3018', 'VARIG (BRAZIL)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(992, '3019', 'Germanwings--GRMNWGAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(993, '3020', 'AIR-INDIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(994, '3021', 'Air Algerie--AIRALGER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(995, '3022', 'Philippine Airlines--PAL AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(996, '3023', 'MEXICANA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(997, '3024', 'PAKISTAN INTERNATIONAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(998, '3025', 'Air New Zealand Limited International--AIR NZ', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(999, '3026', 'Emirates Airlines--EMIRATES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1000, '3027', 'Union de Transports Aeriens--UTAAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1001, '3028', 'Air Malta--AIRMALTA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1002, '3029', 'SN Brussels Airlines--SNBRU AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1003, '3030', 'Aerolineas Argentinas--AERO ARG', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1004, '3031', 'Olympic Airways--OLYMPICA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1005, '3032', 'EL AL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1006, '3033', 'Ansett Airlines--ANSETT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1007, '3034', 'etihad airways - etihadair', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1008, '3035', 'TAP (PORTUGAL)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1009, '3036', 'VASP (BRAZIL)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1010, '3037', 'EgyptAir--EGYPTAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1011, '3037', 'Kuwait Airways--KUWAIT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1012, '3037', 'AVIANCA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1013, '3037', 'Gulf Air (Bahrain)--GULF AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1014, '3037', 'Balkan--Bulgarian Airlines--BALKAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1015, '3037', 'FINNAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1016, '3037', 'Aer Lingus--AERLING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1017, '3037', 'AIR LANKA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1018, '3045', 'Nigeria Airways--NIGERIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1019, '3046', 'Cruzerio do Sul (Brazil)--CRUZERIO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1020, '3047', 'THY (Turkey)--THY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1021, '3048', 'Royal Air Maroc--AIRMARO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1022, '3049', 'Tunis Air--TUNIS AI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1023, '3050', 'Icelandair--ICELANDA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1024, '3051', 'Austrian Airlines--AUSTRIAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1025, '3052', 'LAN Airlines--LAN AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1026, '3053', 'AVIACO (Spain)--AVIACO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1027, '3054', 'LADECO (Chile)--LADECO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1028, '3055', 'LAB (BOLIVIA)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1029, '3056', 'JET AIRWAYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1030, '3057', 'VIRGIN AMERICA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1031, '3058', 'DELTA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1032, '3059', 'DBA Airlines--DBA AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1033, '3060', 'Northwest Airlines--NWA AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1034, '3061', 'Continental--CONTINEN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1035, '3062', 'Hapag-Lloyd Express--HLX', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1036, '3063', 'U.S. Airways--USAIRWYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1037, '3064', 'Adria Airways--ADRIA AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1038, '3065', 'Air Inter--AIRINTER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1039, '3066', 'Southwest Airlines--SOUTHWES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1040, '3067', 'Vanguard Airlines--VANGUARD', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1041, '3068', 'Air Astana--AIRSTANA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1042, '3069', 'SUN COUNTRY AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1043, '3070', 'Pacific Southwest Airlines (PSA)', 'Regular', '', '0.007', '44281.5778446759', 'admin');
INSERT INTO `tqris_mcc` (`id`, `code`, `name`, `category`, `description`, `mdr`, `datestamp`, `datestamuid`) VALUES
(1044, '3071', 'Air British Columbia--AIR B R C', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1045, '3072', 'Cebu Pacific--CEBU PAC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1046, '3073', 'Air Cal', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1047, '3075', 'Singapore Airlines--SINGAPOR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1048, '3076', 'Aeromexico--AEROMEXI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1049, '3077', 'Thai Airways--THAIAIRW', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1050, '3078', 'China Airlines--CHINAAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1051, '3079', 'Jetstar Airways--JETSTAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1052, '3081', 'NORDAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1053, '3082', 'Korean Airlines--KOREAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1054, '3083', 'Air Afrique--AIR AFRIQ', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1055, '3084', 'Eva Airways--EVA AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1056, '3085', 'Midwest Express Airlines--MIDWEST', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1057, '3086', 'CARNIVAL AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1058, '3087', 'Metro Airlines--METROAI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1059, '3088', 'Croatia Air--CROATIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1060, '3089', 'Transaero--TRANSAERO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1061, '3090', 'Uni Airways--UNIAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1062, '3092', 'MIDWAY AIRLINE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1063, '3094', 'Zambia Airways--ZAMBIA A', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1064, '3095', 'WARDAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1065, '3096', 'Air Zimbabwe--AIRZIMBA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1066, '3097', 'Spanair--SPANAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1067, '3098', 'Asiana Airlines--ASIANA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1068, '3098', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1069, '3099', 'Cathay Pacific--CATHAYPA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1070, '3100', 'Malaysian Airline System--MALAY AI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1071, '3102', 'Iberia--IBERIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1072, '3103', 'Garuda (Indonesia)--GARUDA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1073, '3105', 'Piedmont', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1074, '3106', 'Braathens S.A.F.E. (Norway)--BRAATHEN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1075, '3110', 'WINGS AIRWAYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1076, '3111', 'British Midland--BRITISH M', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1077, '3112', 'Windward Island--WINDWARD', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1078, '3115', 'TOWER AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1079, '3117', 'Venezolana International de Aviacion--VIASA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1080, '3118', 'VALLEY AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1081, '3125', 'Tan Airlines--TAN AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1082, '3126', 'TALAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1083, '3127', 'Taca International--TACA INT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1084, '3129', 'Surinam Airways--SURINAM', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1085, '3130', 'Sunworld International Airways--SUNWORLD', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1086, '3131', 'VLM Airlines--VLM', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1087, '3132', 'Frontier Airlines--FRONTIER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1088, '3133', 'SUNBELT AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1089, '3135', 'Sudan Airways--SUDANAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1090, '3136', 'Qatar Airways Company W.L.L.--QATAR AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1091, '3137', 'SINGLETON', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1092, '3138', 'SIMMONS AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1093, '3141', 'Seair Alaska', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1094, '3143', 'SCENIC AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1095, '3144', 'Virgin Atlantic--VIR ATL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1096, '3145', 'SAN JUAN AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1097, '3146', 'Luxair--LUXAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1098, '3148', 'Air Littoral, S.A.--LITTORAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1099, '3151', 'Air Zaire--AIRZAIRE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1100, '3154', 'PRINCEVILLE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1101, '3156', 'GO FLY Ltd.--GOFLY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1102, '3159', 'Provincetown-Boston Airways--PBA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1103, '3161', 'All Nippon Airways--ANAAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1104, '3164', 'Norontair--NORONTAI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1105, '3165', 'NEW YORK HELICOPTER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1106, '3167', 'Aero Continente--AERO CONT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1107, '3170', 'MOUNT COOK', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1108, '3171', 'Canadian Airlines--CANADIAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1109, '3172', 'Nation Air--NATIONAI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1110, '3174', 'JetBlue Airways--JETBLUE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1111, '3175', 'Middle East Air--MIDEASTA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1112, '3176', 'METROFLIGHT AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1113, '3177', 'AirTran Airways--AIRTRAN A', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1114, '3178', 'Mesa Air--MESA AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1115, '3180', 'Westjet Airlines--WESTJET', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1116, '3181', 'Malev Hungarian Airlines--MALEV', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1117, '3182', 'LOT â€“ Polish Airlines--LOT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1118, '3183', 'Oman Aviation Services--OMAN AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1119, '3184', 'LIAT--LIAT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1120, '3185', 'LAV Linea Aeropostal Venezolana--LAV', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1121, '3186', 'LAP Lineas Aereas Paraguayas--LAP', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1122, '3187', 'LACSA (Costa Rica)--LACSA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1123, '3188', 'Virgin Express--VIR EXP', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1124, '3190', 'Jugoslav Air--JUGOSLAV', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1125, '3191', 'Island Airlines--ISLANDAI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1126, '3192', 'Iran Air--IRANAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1127, '3193', 'Indian Airlines--INDIAN A', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1128, '3195', 'Holiday Airlines', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1129, '3196', 'Hawaiian Air--HAWAIIAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1130, '3197', 'Havasu Airlines--HAVASUAI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1131, '3198', 'Harbor Airlines', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1132, '3199', 'Servicios Aereos Militares', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1133, '3200', 'Guyana Airways--GUYANA A', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1134, '3203', 'GOLDEN PACIFIC AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1135, '3204', 'Freedom Airlines--FREEDOM', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1136, '3206', 'China Eastern Airlines--CHINAEAST', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1137, '3207', 'Empresa Ecuatoriana', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1138, '3211', 'Norwegian Air Shuttle--NORWEGIAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1139, '3212', 'Dominicana de Aviacion--DOMINICA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1140, '3213', 'Malmo Aviation--MALMO AV', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1141, '3215', 'DAN AIR SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1142, '3216', 'CUMBERLAND AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1143, '3217', 'CSA Ceskoslovenske Aerolinie--CSA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1144, '3218', 'CROWN AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1145, '3219', 'Compania Panamena de Aviacion (Copa)--COPA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1146, '3220', 'Compania Faucett--COMPANIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1147, '3221', 'Transportes Aeros Militares Ecuatorianos--TAME AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1148, '3222', 'Command Airways--COMMAND', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1149, '3223', 'Comair--COMAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1150, '3226', 'Skyways--SKYWAYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1151, '3228', 'Cayman Airways--CAYMANAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1152, '3229', 'SAETA (Sociedad Ecuatorianas De Transportes Aereo)--SAETAAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1153, '3231', 'SAHSA (Servicio Aero de Honduras)--SAHSA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1154, '3233', 'CAPITOL AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1155, '3234', 'Caribbean Airlines--CARIBBEAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1156, '3235', 'BROCKWAY AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1157, '3236', 'Air Arabia Airline--AIR ARAB', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1158, '3238', 'BEMIDJI AIRLINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1159, '3239', 'Bar Harbor Airlines--BARHARBO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1160, '3240', 'Bahamasair--BAHAMASA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1161, '3241', 'Aviateca (Guatemala)--AVIATECA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1162, '3242', 'Avensa--AVENSA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1163, '3243', 'Austrian Air Service--AUSTRAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1164, '3245', 'EasyJet--EASYJET', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1165, '3246', 'Ryanair--RYANAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1166, '3247', 'Gol Airlines--GOL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1167, '3248', 'Tam Airlines--TAM', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1168, '3251', 'Aloha Airlines--ALOH AI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1169, '3252', 'ALM Antilean Airlines--ALM', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1170, '3253', 'America West--AMERWEST', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1171, '3254', 'US AIR SHUTTLE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1172, '3256', 'Alaska Airlines Inc.--ALASKA A', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1173, '3259', 'American Trans Air--ATA AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1174, '3260', 'Spirit Airlines--SPIRIT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1175, '3261', 'Air China--AIR CHINA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1176, '3262', 'RENO AIR, INC.', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1177, '3263', 'Aero Servicio Carabobo--ASERCA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1178, '3266', 'Air Seychelles--AIR SEYC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1179, '3267', 'Air Panama International--AIR PANA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1180, '3268', 'Air Pacific', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1181, '3275', 'Air Nevada', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1182, '3276', 'Air Midwest', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1183, '3277', 'Air Madagascar', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1184, '3279', 'Air LA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1185, '3280', 'Air Jamaica--AIR JAMA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1186, '3282', 'Air Djibouti--AIR DJIB', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1187, '3284', 'AERO VIRGIN ISLANDS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1188, '3285', 'Aero Peru--AEROPERU', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1189, '3286', 'Aero Nicaraguenses--AERO NIC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1190, '3287', 'Aero Coach Aviation--AEROCOAC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1191, '3291', 'Ariana Afghan', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1192, '3292', 'Cyprus Airways--CYPRUSA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1193, '3293', 'Ecuatoriana--ECUATORI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1194, '3294', 'Ethiopian Airlines--ETHIOPIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1195, '3295', 'Kenya Airways--KENYAAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1196, '3296', 'Air Berlin--AIRBERLIN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1197, '3297', 'Tarom Romanian Air Transport--TAROM AIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1198, '3298', 'AIR MAURITIUS--AIRMAURI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1199, '3299', 'WIDEROES FLYVESELSKAP--WIDEROES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1200, '3333', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1201, '3351', 'AFFILIATED AUTO RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1202, '3352', 'AMERICAN INTL RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1203, '3353', 'BROOKS RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1204, '3354', 'ACTION AUTO RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1205, '3355', 'SIXT CAR RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1206, '3357', 'HERTZ', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1207, '3359', 'PAYLESS CAR RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1208, '3361', 'AIRWAYS RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1209, '3362', 'ALTRA AUTO RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1210, '3364', 'AGENCY RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1211, '3366', 'BUDGET RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1212, '3368', 'HOLIDAY RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1213, '3370', 'RENT A WRECK', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1214, '3374', 'ACCENT RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1215, '3376', 'AJAX RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1216, '3380', 'TRIANGLE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1217, '3381', 'EUROP CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1218, '3385', 'TROPICAL RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1219, '3386', 'SHOWCASE RENTAL CARS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1220, '3387', 'ALAMO RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1221, '3388', 'MERCHANTS RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1222, '3389', 'AVIS RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1223, '3390', 'DOLLAR RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1224, '3391', 'EUROPE BY CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1225, '3393', 'NATIONAL CAR RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1226, '3394', 'KEMWELL GROUP RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1227, '3395', 'THRIFTY CAR RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1228, '3396', 'TILDEN RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1229, '3398', 'ECONO-CAR RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1230, '3399', 'AMEREX RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1231, '3400', 'AUTO HOST CAR RENTALS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1232, '3405', 'ENTERPRISE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1233, '3409', 'GENERAL RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1234, '3411', 'ATLANTA RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1235, '3412', 'A1 RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1236, '3414', 'GODFREY NATL RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1237, '3419', 'ALPHA RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1238, '3420', 'ANSA INTL RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1239, '3421', 'ALLSTATE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1240, '3423', 'AVCAR RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1241, '3425', 'AUTOMATE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1242, '3427', 'AVON RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1243, '3428', 'CAREY RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1244, '3429', 'INSURANCE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1245, '3430', 'MAJOR RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1246, '3431', 'REPLACEMENT RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1247, '3432', 'RESERVE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1248, '3433', 'UGLY DUCKLING RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1249, '3434', 'USA RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1250, '3435', 'VALUE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1251, '3436', 'AUTOHANSA RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1252, '3437', 'CITE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1253, '3438', 'INTERENT RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1254, '3439', 'MILLEVILLE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1255, '3440', 'VIA ROUTE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1256, '3441', 'ADVANTAGE RENT-A-CAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1257, '3501', 'HOLIDAY INN EXPRESS # HOLIDAY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1258, '3502', 'BEST WESTERN HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1259, '3503', 'SHERATON HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1260, '3504', 'HILTON HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1261, '3505', 'FORTE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1262, '3506', 'GOLDEN TULIP HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1263, '3507', 'FRIENDSHIP INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1264, '3508', 'QUALITY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1265, '3509', 'MARRIOTT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1266, '3510', 'DAYS INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1267, '3511', 'ARABELLA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1268, '3512', 'INTER-CONTINENTAL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1269, '3513', 'WESTIN (WESTIN HOTELS)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1270, '3514', 'AMERISUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1271, '3515', 'RODEWAY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1272, '3516', 'LA QUINTA MOTOR INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1273, '3517', 'AMERICANA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1274, '3518', 'SOL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1275, '3519', 'PULLMAN INTERNATIONAL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1276, '3520', 'MERIDIEN HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1277, '3521', 'ROYAL LAHAINA RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1278, '3522', 'TOKYO HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1279, '3523', 'PENINSULA HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1280, '3524', 'WELCOMGROUP HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1281, '3525', 'DUNFEY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1282, '3526', 'PRINCE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1283, '3527', 'DOWNTOWNER-PASSPORT HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1284, '3529', 'CP (CANADIAN PACIFIC) HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1285, '3530', 'RENAISSANCE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1286, '3531', 'KAUAI COCONUT BEACH RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1287, '3532', 'ROYAL KONA RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1288, '3533', 'HOTEL IBIS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1289, '3534', 'SOUTHERN PACIFIC HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1290, '3535', 'HILTON INTERNATIONALS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1291, '3536', 'AMFAC HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1292, '3537', 'ANA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1293, '3538', 'CONCORDE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1294, '3539', 'SUMMERFIELD SUITES HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1295, '3540', 'IBEROTEL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1296, '3541', 'HOTEL OKURA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1297, '3542', 'ROYAL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1298, '3543', 'FOUR SEASONS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1299, '3544', 'CIGA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1300, '3545', 'SHANGRI-LA INTERNATIONAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1301, '3546', 'SIERRA SUITES HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1302, '3547', 'BREAKERS RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1303, '3548', 'HOTELS MELIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1304, '3549', 'AUBERGE DES GOVERNEURS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1305, '3550', 'REGAL 8 INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1306, '3551', 'MIRAGE HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1307, '3552', 'COAST HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1308, '3553', 'PARK INNS INTERNATIONAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1309, '3554', 'PINEHURST RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1310, '3555', 'TREASURE ISLAND HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1311, '3556', 'BARTON CREEK RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1312, '3557', 'MANHATTAN EAST SUITE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1313, '3558', 'JOLLY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1314, '3559', 'CANDLEWOOD SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1315, '3560', 'ALADDIN RESORT AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1316, '3561', 'GOLDEN NUGGET', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1317, '3562', 'COMFORT INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1318, '3563', 'JOURNEY’S END MOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1319, '3564', 'SAM’S TOWN HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1320, '3565', 'RELAX INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1321, '3565', 'RELAX INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1322, '3566', 'GARDEN PLACE HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1323, '3567', 'SOHO GRAND HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1324, '3568', 'LADBROKE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1325, '3569', 'TRIBECA GRAND HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1326, '3570', 'FORUM HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1327, '3571', 'GRAND WAILEA RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1328, '3572', 'MIYAKO HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1329, '3573', 'SANDMAN HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1330, '3574', 'VENTURE INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1331, '3575', 'VAGABOND HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1332, '3576', 'LA QUINTA RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1333, '3577', 'MANDARIN ORIENTAL HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1334, '3578', 'FRANKENMUTH BAVARIAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1335, '3579', 'HOTEL MERCURE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1336, '3580', 'HOTEL DEL CORONADO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1337, '3581', 'DELTA HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1338, '3582', 'CALIFORNIA HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1339, '3583', 'RADISSON BLU', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1340, '3583', 'SAS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1341, '3584', 'PRINCESS HOTELS INTERNATIONAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1342, '3585', 'HUNGAR HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1343, '3586', 'SOKOS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1344, '3587', 'DORAL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1345, '3588', 'HELMSLEY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1346, '3589', 'DORAL GOLF RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1347, '3590', 'FAIRMONT HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1348, '3591', 'SONESTA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1349, '3592', 'OMNI HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1350, '3593', 'CUNARD HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1351, '3594', 'ARIZONA BILTMORE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1352, '3595', 'HOSPITALITY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1353, '3596', 'WYNN LAS VEGAS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1354, '3597', 'RIVERSIDE RESORT HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1355, '3598', 'REGENT INTERNATIONAL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1356, '3599', 'PANNONIA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1357, '3600', 'SADDLEBROOK RESORT TAMPA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1358, '3601', 'TRADEWINDS RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1359, '3602', 'HUDSON HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1360, '3603', 'NOAH’S HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1361, '3604', 'HILTON GARDEN INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1362, '3605', 'JURYS DOYLE HOTEL GROUP', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1363, '3606', 'JEFFERSON HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1364, '3607', 'FONTAINEBLEAU RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1365, '3608', 'GAYLORD OPRYLAND', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1366, '3609', 'GAYLORD PALMS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1367, '3610', 'GAYLORD TEXAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1368, '3611', 'C MON INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1369, '3612', 'MOEVENPICK HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1370, '3613', 'MICROTEL INNS & SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1371, '3614', 'AMERICINN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1372, '3615', 'TRAVELODGE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1373, '3616', 'HERMITAGE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1374, '3617', 'AMERICA’S BEST VALUE INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1375, '3618', 'GREAT WOLF', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1376, '3619', 'ALOFT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1377, '3620', 'BINION’S HORSESHOE CLUB', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1378, '3621', 'EXTENDED STAY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1379, '3622', 'MERLIN HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1380, '3623', 'DORINT HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1381, '3624', 'LADY LUCK HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1382, '3625', 'HOTEL UNIVERSALE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1383, '3626', 'STUDIO PLUS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1384, '3627', 'EXTENDED STAY AMERICA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1385, '3628', 'EXCALIBUR HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1386, '3629', 'DAN HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1387, '3630', 'EXTENDED STAY DELUXE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1388, '3631', 'SLEEP INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1389, '3632', 'THE PHOENICIAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1390, '3633', 'RANK HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1391, '3634', 'SWISSOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1392, '3635', 'RESO HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1393, '3636', 'SAROVA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1394, '3637', 'RAMADA INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1395, '3638', 'HOWARD JOHNSON', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1396, '3639', 'MOUNT CHARLOTTE THISTLE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1397, '3640', 'Hyatt Hotels', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1398, '3641', 'SOFITEL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1399, '3642', 'NOVOTEL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1400, '3643', 'STEIGENBERGER HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1401, '3644', 'ECONO LODGES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1402, '3645', 'QUEENS MOAT HOUSES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1403, '3646', 'SWALLOW HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1404, '3647', 'HUSA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1405, '3648', 'DE VERE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1406, '3649', 'RADISSON HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1407, '3650', 'RED ROOF INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1408, '3651', 'IMPERIAL LONDON HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1409, '3652', 'EMBASSY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1410, '3653', 'PENTA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1411, '3654', 'LOEWS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1412, '3655', 'SCANDIC HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1413, '3656', 'SARA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1414, '3657', 'OBEROI HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1415, '3658', 'NEW OTANI HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1416, '3659', 'TAJ HOTELS INTERNATIONAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1417, '3660', 'KNIGHTS INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1418, '3661', 'METROPOLE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1419, '3662', 'CIRCUS CIRCUS HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1420, '3663', 'HOTELES EL PRESIDENTE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1421, '3664', 'FLAG INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1422, '3665', 'HAMPTON INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1423, '3666', 'STAKIS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1424, '3667', 'LUXOR HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1425, '3668', 'MARITIM HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1426, '3669', 'ELDORADO HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1427, '3670', 'ARCADE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1428, '3671', 'ARCTIA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1429, '3672', 'CAMPANILE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1430, '3673', 'IBUSZ HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1431, '3674', 'RANTASIPI HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1432, '3675', 'INTERHOTEL CEDOK', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1433, '3676', 'MONTE CARLO HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1434, '3677', 'CLIMAT DE FRANCE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1435, '3678', 'CUMULUS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1436, '3679', 'SILVER LEGACY HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1437, '3680', 'HOTEIS OTHAN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1438, '3681', 'ADAMS MARK HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1439, '3682', 'SAHARA HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1440, '3683', 'BRADBURY SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1441, '3684', 'BUDGET HOST INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1442, '3685', 'BUDGETEL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1443, '3686', 'SUSSE CHALET', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1444, '3687', 'CLARION HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1445, '3688', 'COMPRI HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1446, '3690', 'COURTYARD BY MARRIOTT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1447, '3691', 'DILLON INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1448, '3692', 'DOUBLETREE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1449, '3693', 'DRURY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1450, '3694', 'ECONOMY INNS OF AMERICA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1451, '3695', 'EMBASSY SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1452, '3696', 'EXEL INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1453, '3697', 'FAIRFIELD HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1454, '3698', 'HARLEY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1455, '3699', 'MIDWAY MOTOR LODGE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1456, '3700', 'MOTEL 6', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1457, '3701', 'LA MANSION DEL RIO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1458, '3702', 'THE REGISTRY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1459, '3703', 'RESIDENCE INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1460, '3704', 'ROYCE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1461, '3705', 'SANDMAN INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1462, '3706', 'SHILO INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1463, '3707', 'SHONEYS INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1464, '3708', 'VIRGIN RIVER HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1465, '3709', 'SUPER 8 MOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1466, '3710', 'THE RITZ-CARLTON', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1467, '3711', 'FLAG INNS (AUSTRALIA)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1468, '3712', 'BUFFALO BILL’S HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1469, '3713', 'QUALITY PACIFIC HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1470, '3714', 'FOUR SEASONS HOTEL (AUSTRALIA)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1471, '3715', 'FAIRFIELD INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1472, '3716', 'CARLTON HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1473, '3717', 'CITY LODGE HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1474, '3718', 'KAROS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1475, '3719', 'PROTEA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1476, '3720', 'SOUTHERN SUN HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1477, '3721', 'HILTON CONRAD', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1478, '3722', 'WYNDHAM', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1479, '3723', 'RICA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1480, '3724', 'INTER NOR HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1481, '3725', 'SEA PINES RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1482, '3726', 'RIO SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1483, '3727', 'BROADMOOR HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1484, '3728', 'BALLY’S HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1485, '3729', 'JOHN ASCUAGA’S NUGGET', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1486, '3730', 'MGM GRAND HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1487, '3731', 'HARRAHS HOTELS / CASINOS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1488, '3732', 'OPRYLAND HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1489, '3733', 'BOCA RATON RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1490, '3734', 'HARVEY/BRISTOL HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1491, '3735', 'MASTERS ECONOMY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1492, '3736', 'COLORADO BELLE/EDGEWATER RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1493, '3737', 'RIVIERA HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1494, '3738', 'TROPICANA RESORT & CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1495, '3739', 'WOODSIDE HOTELS & RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1496, '3740', 'TOWNEPLACE SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1497, '3741', 'MILLENNIUM HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1498, '3742', 'CLUB MED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1499, '3743', 'BILTMORE HOTEL & SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1500, '3744', 'CAREFREE RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1501, '3745', 'ST. REGIS HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1502, '3746', 'THE ELIOT HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1503, '3747', 'CLUB CORP / CLUB RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1504, '3748', 'WELLESLEY INNS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1505, '3749', 'THE BEVERLY HILLS HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1506, '3750', 'CROWNE PLAZA HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1507, '3751', 'HOMEWOOD SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1508, '3752', 'PEABODY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1509, '3753', 'GREENBRIAR RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1510, '3754', 'AMELIA ISLAND PLANTATION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1511, '3755', 'THE HOMESTEAD', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1512, '3756', 'SOUTH SEAS RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1513, '3757', 'CANYON RANCH', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1514, '3758', 'KAHALA MANDARIN ORIENTAL HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1515, '3759', 'THE ORCHID AT MAUNA LANI', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1516, '3760', 'HALEKULANI HOTEL/WAIKIKI PARC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1517, '3761', 'PRIMADONNA HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1518, '3762', 'WHISKEY PETE’S HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1519, '3763', 'CHATEAU ELAN WINERY AND RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1520, '3764', 'BEAU RIVAGE HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1521, '3765', 'BELLAGIO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1522, '3766', 'FREMONT HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1523, '3767', 'MAIN STREET STATION HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1524, '3768', 'SILVER STAR HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1525, '3769', 'STRATOSPHERE HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1526, '3770', 'SPRINGHILL SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1527, '3771', 'CAESAR’S HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1528, '3772', 'NEMACOLIN WOODLANDS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1529, '3773', 'THE VENETIAN RESORT HOTEL CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1530, '3774', 'NEW YORK-NEW YORK HOTEL AND CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1531, '3775', 'SANDS RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1532, '3776', 'NEVELE GRAND RESORT AND COUNTRY CLUB', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1533, '3777', 'MANDALAY BAY RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1534, '3778', 'FOUR POINTS HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1535, '3779', 'W HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1536, '3780', 'DISNEY RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1537, '3781', 'PATRICIA GRAND RESORT HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1538, '3782', 'ROSEN HOTELS AND RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1539, '3783', 'TOWN AND COUNTRY RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1540, '3784', 'FIRST HOSPITALITY HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1541, '3785', 'OUTRIGGER HOTELS AND RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1542, '3786', 'OHANA HOTELS OF HAWAII', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1543, '3787', 'CARIBE ROYALE RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1544, '3788', 'ALA MOANA HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1545, '3789', 'SMUGGLER’S NOTCH RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1546, '3790', 'RAFFLES HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1547, '3791', 'STAYBRIDGE SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1548, '3792', 'CLARIDGE CASINO HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1549, '3793', 'FLAMINGO HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1550, '3794', 'GRAND CASINO HOTELS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1551, '3795', 'PARIS LAS VEGAS HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1552, '3796', 'PEPPERMILL HOTEL CASINO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1553, '3797', 'ATLANTIC CITY HILTON RESORTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1554, '3798', 'EMBASSY VACATION RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1555, '3799', 'HALE KOA HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1556, '3800', 'HOMESTEAD SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1557, '3801', 'WILDERNESS HOTEL AND RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1558, '3802', 'THE PALACE HOTEL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1559, '3803', 'THE WIGMAM GOLF RESORT AND SPA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1560, '3804', 'THE DIPLOMAT COUNTRY CLUB SPA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1561, '3805', 'THE ATLANTIC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1562, '3806', 'PRINCEVILLE RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1563, '3807', 'ELEMENT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1564, '3808', 'LXR (Luxury Resorts)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1565, '3809', 'SETTLE INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1566, '3810', 'LA COSTA RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1567, '3811', 'PREMIER INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1568, '3812', 'HYATT PLACE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1569, '3813', 'HOTEL INDIGO', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1570, '3814', 'THE ROOSEVELT HOTEL NY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1571, '3815', 'NICKELODEON FAMILY SUITES BY HOLIDAY INN', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1572, '3817', 'AFFINIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1573, '3818', 'MAINSTAY SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1574, '3819', 'OXFORD SUITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1575, '3820', 'JUMEIRAH ESSEX HOUSE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1576, '3821', 'CARIBE ROYALE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1577, '3822', 'CROSSLAND', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1578, '3823', 'GRAND SIERRA RESORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1579, '3824', 'ARIA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1580, '3825', 'VDARA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1581, '3826', 'AUTOGRAPH', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1582, '3827', 'GALT HOUSE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1583, '3828', 'COSMOPOLITAN OF LAS VEGAS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1584, '4011', 'RAILROADS – FREIGHT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1585, '4111', 'LOCAL AND SUBURBAN COMMUTER PASSENGER TRANSPORTATION, INCLUDING FERRIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1586, '4112', 'PASSENGER RAILWAYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1587, '4119', 'AMBULANCE SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1588, '4121', 'TAXICABS & LIMOUSINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1589, '4131', 'BUS LINES, INCLUDING CHARTERS, TOUR BUSES # TOUR BUSES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1590, '4214', 'MOTOR FREIGHT CARRIERS & TRUCKING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1591, '4215', 'COURIER SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1592, '4225', 'PUBLIC WAREHOUSING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1593, '4225', 'PUBLIC WAREHOUSING & STORAGE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1594, '4411', 'STEAMSHIP & CRUISE LINES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1595, '4457', 'BOAT RENTALS & LEASES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1596, '4468', 'MARINAS MARINE SERVICE & SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin');
INSERT INTO `tqris_mcc` (`id`, `code`, `name`, `category`, `description`, `mdr`, `datestamp`, `datestamuid`) VALUES
(1597, '4511', 'AIRLINES & AIR CARRIERS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1598, '4582', 'AIRPORTS, FLYING FIELDS, & AIRPORT TERMINALS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1599, '4722', 'TRAVEL AGENCIES & TOUR OPERATORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1600, '4723', 'PACKAGE TOUR OPERATORS - GERMANY ONLY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1601, '4761', 'TELEMARKETING OF TRAVEL RELATED SERVICES AND V', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1602, '4784', 'TOLL AND BRIDGE FEES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1603, '4789', 'TRANSPORTATION SERVICES (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1604, '4812', 'TELECOMMUNICATION EQUIPMENT & TELEPHONE SALES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1605, '4813', 'SPECIAL TELECOM MERCHANT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1606, '4814', 'TELECOMMUNICATION SERVICES, INCLUDING LOCAL AND LONG DISTANCE CALLS, CREDIT CARD CALLS, CALLS THROUGH USE OF MAGNETIC STRIPE READING TELEPHONES AND FAX SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1607, '4815', 'VISAPHONE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1608, '4816', 'COMPUTER NETWORK / INFORMATION SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1609, '4821', 'TELEGRAPH SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1610, '4829', 'WIRE TRANSFER MONEY ORDERS (WTMOs)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1611, '4899', 'CABLE SATELLITE & OTHER PAY TELEVISION & RADIO SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1612, '4900', 'UTILITIES-ELECTRIC, GAS, WATER, SANITARY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1613, '5013', 'MOTOR VEHICLE SUPPPLIES & NEW PARTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1614, '5021', 'OFFICE & COMMERCIAL FURNITURE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1615, '5039', 'CONSTRUCTION MATERIALS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1616, '5044', 'PHOTOGRAPHIC PHOTOCOPY MICROFILM EQUIPMENT & SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1617, '5045', 'COMPUTERS & COMPUTER PERIPHERAL EQUIPMENT & SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1618, '5046', 'COMMERCIAL EQUIPMENT (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1619, '5047', 'MEDICAL DENTAL OPHTHALMIC & HOSPITAL EQUIPMENT & SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1620, '5051', 'METAL SERVICE CENTERS & OFFICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1621, '5065', 'ELECTRICAL PARTS AND EQUIPMENT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1622, '5072', 'HARDWARE, EQUIPMNT AND SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1623, '5074', 'PLUMBING AND HEATING EQUIPMENT & SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1624, '5085', 'INDUSTRIAL SUPPLIES (NOT ELSEWHERE CLSSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1625, '5094', 'PRECIOUS STONES, METALS, WATCHES, & JEWELRY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1626, '5099', 'DURABLE GOODS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1627, '5111', 'STATIONERY STORES OFFICE & SCHOOL SUPPLY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1628, '5122', 'DRUGS DRUG PROPRIETARIES & DRUGGIST SUNDRIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1629, '5131', 'PIECE GOODS, NOTIONS, AND OTHER DRY GOODS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1630, '5137', 'MENS, WOMENS, & CHILDRENS UNIFORMS, & COMMERCIAL CLOTHING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1631, '5139', 'COMMERCIAL FOOTWEAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1632, '5169', 'CHEMICALS & ALLIED PRODUCTS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1633, '5192', 'BOOKS, PERIODICALS, & NEWSPAPERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1634, '5193', 'FLORIST SUPPLIES, NURSERY STOCK, & FLOWERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1635, '5198', 'PAINT, VARNISHES, & SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1636, '5199', 'NONDURABLE GOODS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1637, '5200', 'HOME SUPPLY WAREHOUSE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1638, '5211', 'LUMBER & BUILDING MATERIALS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1639, '5231', 'GLASS, PAINT, & WALLPAPER STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1640, '5251', 'HARDWARE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1641, '5261', 'NURSERIES & LAWN & GARDEN SUPPLY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1642, '5271', 'MOBILE HOME DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1643, '5300', 'WHOLESALE CLUB', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1644, '5309', 'DUTY FREE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1645, '5310', 'DISCOUNT STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1646, '5311', 'DEPARTMENT STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1647, '5331', 'VARIETY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1648, '5399', 'MISCELLANEOUS GENERAL MERCHANDISE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1649, '5407', 'SECURITY CREDIT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1650, '5411', 'GROCERY STORES & SUPERMARKETS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1651, '5422', 'FREEZER & LOCKER MEAT PROVISIONERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1652, '5441', 'CANDY, NUT, & CONFECTIONERY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1653, '5451', 'DAIRY PRODUCTS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1654, '5462', 'BAKERIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1655, '5499', 'MISCELLANEOUS FOOD STORES-CONVENIENCE STORES & SPECIALTY MARKETS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1656, '5511', 'CAR & TRUCK DEALERS (NEW & USED) SALES SERVICE REPAIRS PARTS & LEASING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1657, '5521', 'CAR & TRUCK DEALERS (USED ONLY) SALES SERVICE REPAIRS PARTS & LEASING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1658, '5531', 'AUTO & HOME SUPPLY STORES (NO LONGER VALID MCC)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1659, '5532', 'AUTOMOTIVE TIRE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1660, '5533', 'AUTOMOTIVE PARTS & ACCESSORIES STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1661, '5537', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1662, '5551', 'BOAT DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1663, '5555', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1664, '5561', 'CAMPER, RECREATIONAL & UTILITY TRAILER DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1665, '5571', 'MOTORCYCLE DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1666, '5592', 'MOTOR HOMES DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1667, '5598', 'SNOWMOBILE DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1668, '5599', 'MISCELLANEOUS AUTOMOTIVE , AIRCRAFT, & FARM EQUIPMENT DEALERS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1669, '5611', 'MENS & BOYS CLOTHING & ACCESSORIES STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1670, '5612', 'WOMENS READY-TO-WEAR STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1671, '5621', 'WOMENS READY-TO-WEAR STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1672, '5631', 'WOMENS ACCESSORY & SPECIALTY SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1673, '5641', 'CHILDRENS AND INFANTS WEAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1674, '5651', 'FAMILY CLOTHING STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1675, '5655', 'SPORTS & RIDING APPAREL STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1676, '5661', 'SHOE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1677, '5681', 'FURRIERS & FUR SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1678, '5691', 'MENS & BOYS CLOTHING & ACCESSORIES STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1679, '5697', 'TAILORS SEAMSTRESSES MENDING & ALTERATIONS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1680, '5698', 'WIG AND TOUPEE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1681, '5699', 'MISCELLANEOUS APPAREL & ACCESSORY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1682, '5712', 'FURNITURE HOME FURNISHINGS & EQUIPMENT STORES EXCEPTING APPLIANCES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1683, '5713', 'FLOOR COVERING STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1684, '5714', 'DRAPERY, WINDOW COVERING, & UPHOLSTERY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1685, '5718', 'FIREPLACE, FIREPLACE SCREENS & ACCESSORIES STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1686, '5719', 'MISCELLANEOUS HOME FURNISHING SPECIALTY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1687, '5722', 'HOUSEHOLD APPLIANCE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1688, '5732', 'ELECTRONICS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1689, '5733', 'MUSIC STORES - MUSICAL INSTRUMENTS PIANOS & SHEET MUSIC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1690, '5734', 'COMPUTER SOFTWARE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1691, '5735', 'RECORD STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1692, '5811', 'CATERERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1693, '5812', 'EATING PLACES & RESTAURANTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1694, '5813', 'DRINKING PLACES - BARS TAVERNS NIGHTCLUBS COCKTAIL LOUNGES & DISCOTHEQUES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1695, '5814', 'FAST FOOD RESTAURANTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1696, '5821', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1697, '5912', 'DRUG STORES & PHARMACIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1698, '5921', 'PACKAGE STORES - BEER, WINE & LIQUOR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1699, '5931', 'USED MERCHANDISE & SECONDHAND STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1700, '5932', 'ANTIQUE SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1701, '5932', 'ANTIQUE SHOPS - SALES REPAIRS & RESTORATION SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1702, '5933', 'PAWN SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1703, '5935', 'WRECKING AND SALVAGE YARDS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1704, '5937', 'ANTIQUE REPRODUCTIONS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1705, '5940', 'BICYCLE SHOPS-SALES & SERVICE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1706, '5941', 'SPORTING GOODS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1707, '5942', 'BOOK STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1708, '5943', 'STATIONERY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1709, '5944', 'JEWELRY STORES WATCHES CLOCKS & SILVERWARE STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1710, '5945', 'HOBBY TOY & GAME SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1711, '5946', 'CAMERA & PHOTOGRAPHIC SUPPLY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1712, '5947', 'GIFT CARD NOVELTY & SOUVENIR SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1713, '5948', 'LUGGAGE & LEATHER GOODS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1714, '5949', 'SEWING NEEDLEWORK, FABRIC, & PIECE GOODS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1715, '5950', 'GLASSWARE / CRYSTAL STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1716, '5960', 'DIRECT MARKETING - INSURANCE SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1717, '5961', 'MAIL ORDER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1718, '5962', 'DIRECT MARKETING - TRAVEL-RELATED ARRANGEMENT SERVICES  (HIGH RISK MCC)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1719, '5963', 'DOOR-TO-DOOR SALES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1720, '5964', 'DIRECT MARKETING - CATALOG MERCHANT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1721, '5965', 'DIRECT MARKETING - COMBINATION CATALOG AND RETAIL MERCHANT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1722, '5966', 'DIRECT MARKETING - OUTBOUND TELEMARKETING MERCHANT  (HIGH RISK MCC)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1723, '5967', 'DIRECT MARKETING - INBOUND TELESERVICES MERCHANT  (HIGH RISK MCC)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1724, '5968', 'DIRECT MARKETING - CONTINUITY/SUBSCRIPTION MERCH', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1725, '5969', 'DIRECT MARKETING - OTHER DIRECT MARKETERS  (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1726, '5970', 'ARTISTS SUPPLY & CRAFT SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1727, '5971', 'ART DEALERS & GALLERIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1728, '5972', 'STAMP AND COIN STORES - PHILATELIC AND NUMISMATIC SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1729, '5973', 'RELIGIOUS GOODS STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1730, '5975', 'HEARING AIDS - SALES SERVICE & SUPPLY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1731, '5976', 'ORTHOPEDIC GOODS - PROSTHETIC DEVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1732, '5977', 'COSMETIC STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1733, '5978', 'TYPEWRITER STORE-SALES, RENTALS, SERVICE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1734, '5992', 'FLORISTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1735, '5993', 'CIGAR STORES AND STANDS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1736, '5994', 'NEWS DEALERS & NEWS STANDS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1737, '5995', 'PET SHOPS, PET FOODS & SUPPLY STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1738, '5996', 'SWIMMING POOLS - SALES & SERVICE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1739, '5997', 'ELECTRIC RAZOR STORES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1740, '5998', 'TENT AND AWNING SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1741, '5999', 'MISCELLANEOUS AND SPECIALTY RETAIL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1742, '6010', 'FINANCIAL INSTITUTIONS - MANUAL CASH DISBURSEMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1743, '6011', 'FINANCIAL INSTITUTIONS AUTOMATED CASH DISBURSEMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1744, '6012', 'FINANCIAL INSTITUTIONS MERCHANDISE & SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1745, '6050', 'QUASI CASH - MEMBER FINANCIAL INSTITUTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1746, '6051', 'NON-FINANCIAL INSTITUTIONS-FOREIGN CURRENCY, MONEY ORDERS (NOT WIRE TRANSFER) AND TRAVELERS CHEQUE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1747, '6211', 'SECURITY BROKERS / DEALERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1748, '6300', 'INSURANCE SALES UNDERWRITING & PREMIUMS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1749, '6381', 'INSURANCE PREMIUMS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1750, '6399', 'INSURANCE NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1751, '6513', 'REAL ESTATE AGENTS, MANAGER & RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1752, '6529', 'QUASI CASH - REMOTE STORED VALUE LOAD - FINANCIAL INSTITUTE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1753, '6530', 'QUASI CASH - REMOTE STORED VALUE LOAD - MERCHANT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1754, '6531', 'PAYMENT SERVICE PROVIDER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1755, '6532', 'MEMBER FINANCIAL INSTITUTION--PAYMENT SERVICE PROVIDER-- PAYMENT TRANSACTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1756, '6533', 'MERCHANT--PAYMENT SERVICE PROVIDER--PAYMENT TRANSACTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1757, '6534', 'QUASI CASH - MONEY TRANSFER - MEMBER FINANCIAL INSTITUTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1758, '6535', 'VALUE PURCHASE--MEMBER FINANCIAL INSTITUTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1759, '6611', 'OVERPAYMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1760, '6760', 'SAVINGS BONDS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1761, '7011', 'LODGING - HOTELS MOTELS RESORTS & CENTRAL RESERVATION SERVICES (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1762, '7012', 'TIMESHARES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1763, '7032', 'SPORTING & RECREATIONAL CAMPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1764, '7033', 'TRAILER PARKS & CAMP SITES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1765, '7210', 'LAUNDRY, CLEANING, & GARMENT SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1766, '7211', 'LAUNDRIES - FAMILY & COMMERCIAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1767, '7216', 'DRY CLEANERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1768, '7217', 'CARPET AND UPHOLSTERY CLEANING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1769, '7221', 'PHOTOGRAPHIC STUDIOS-PORTRAITS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1770, '7230', 'BEAUTY & BARBER SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1771, '7251', 'SHOE REPAIR SHOPS SHOE SHINE PARLORS & HAT CLEANING SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1772, '7261', 'FUNERAL SERVICE & CREMATORIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1773, '7273', 'DATING AND ESCORT SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1774, '7276', 'TAX PREPARATION SERVICE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1775, '7277', 'COUNSELING SERVICE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1776, '7278', 'BUYING & SHOPPING SERVICES AND CLUBS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1777, '7295', 'NO LONGER USED - VISA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1778, '7296', 'CLOTHING RENTAL - COSTUMES UNIFORMS & FORMAL WEAR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1779, '7296', 'COSTUME RENTAL', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1780, '7297', 'MASSAGE PARLORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1781, '7298', 'HEALTH & BEAUTY SPA', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1782, '7299', 'MISCELLANEOUS PERSONAL SERVICES (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1783, '7311', 'ADVERTISING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1784, '7321', 'CONSUMER CREDIT REPORTING AGENCIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1785, '7322', 'DEBT COLLECTION AGENCIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1786, '7332', 'BLUEPRINTING AND PHOTOCOPYING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1787, '7333', 'COMMERCIAL PHOTOGRAPHY ART & GRAPHICS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1788, '7338', 'QUICK COPY REPRODUCTION & BLUEPRINTING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1789, '7339', 'STENOGRAPHIC & SECRETARIAL SUPPORT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1790, '7341', 'WINDOW CLEANING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1791, '7342', 'EXTERMINATING & DISINFECTING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1792, '7349', 'CLEANING MAINTENANCE & JANITORIAL SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1793, '7361', 'EMPLOYMENT AGENCIES & TEMPORARY HELP SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1794, '7372', 'COMPUTER PROGRAMMING  DATA PROCESSING & INTEGRATED SYSTEMS DESIGN SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1795, '7375', 'INFORMATION RETRIEVAL SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1796, '7379', 'COMPUTER MAINTENANCE, REPAIR, & SERVICES  (NOT ELSEWHERE CLASSFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1797, '7392', 'MANAGEMENT, CONSULTING, & PUBLIC RELATIONS SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1798, '7393', 'PROTECTIVE AND SECURITY SERVICES - INCLUDING ARMORED CARS AND GUARD DOGS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1799, '7394', 'EQUIPMENT, TOOL, FURNITURE, & APPLIANCE RENTAL AND LEASING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1800, '7395', 'PHOTOFINISHING LABORATORIES & PHOTO DEVELOPING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1801, '7399', 'BUSINESS SERVICES (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1802, '7511', 'QUASI CASH - TRUCK STOP TRANSACTIONS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1803, '7512', 'AUTOMOBILE RENTAL AGENCY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1804, '7513', 'TRUCK AND UTILITY TRAILER RENTALS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1805, '7519', 'MOTOR HOME & RECREATIONAL VEHICLE RENTALS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1806, '7523', 'PARKING LOTS & GARAGES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1807, '7524', 'EXPRESS PAYMENT SERVICE MERCHANTS - PARKING LOTS AND GARAGES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1808, '7531', 'AUTOMOTIVE TOP AND BODY REPAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1809, '7534', 'TIRE RETREADING & REPAIR SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1810, '7535', 'PAINT SHOPS-AUTOMOTIVE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1811, '7538', 'AUTOMOTIVE SERVICE SHOPS (NON-DEALER)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1812, '7542', 'CAR WASHES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1813, '7549', 'TOWING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1814, '7622', 'ELECTRONICS REPAIR SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1815, '7623', 'AIR CONDITIONING & REFRIGERATION REPAIR SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1816, '7629', 'ELECTRICAL & SMALL APPLIANCE REPAIR SHOPS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1817, '7631', 'WATCH, CLOCK & JEWELRY REPAIR', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1818, '7641', 'FURNITURE - REUPHOLSTERY, REPAIR, & REFINISHING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1819, '7692', 'WELDING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1820, '7699', 'MISCELLANEOUS REPAIR SHOPS & RELATED SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1821, '7778', 'CITISHARE CASH ADVANCE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1822, '7829', 'MOTION PICTURE & VIDEO TAPE PRODUCTION & DISTRIBUTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1823, '7832', 'MOTION PICTURE THEATERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1824, '7833', 'EXPRESS PAYMENT SERVICE MERCHANTS--MOTION PICT', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1825, '7841', 'MOTION PICTURE & VIDEO TAPE PRODUCTION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1826, '7911', 'DANCE HALLS, STUDIOS AND SCHOOLS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1827, '7922', 'THEATRICAL PRODUCERS (EXCEPT MOTION PICTURES) AND TICKET AGENCIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1828, '7929', 'BANDS, ORCHESTRAS, AND MISCELLANEOUS ENTERTAINERS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1829, '7932', 'BILLARD AND POOL ESTABLISHMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1830, '7933', 'BOWLING ALLEYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1831, '7941', 'COMMERCIAL SPORTS PROFESSIONAL SPORTS CLUBS ATHLETIC FIELDS & SPORTS PROMOTERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1832, '7991', 'TOURIST ATTRACTIONS & EXHIBITS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1833, '7992', 'GOLF COURSES - PUBLIC', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1834, '7993', 'VIDEO AMUSEMENT GAME SUPPLIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1835, '7994', 'VIDEO GAME ARCADES / ESTABLISHMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1836, '7995', 'BETTING, INCLUDING LOTTERY TICKETS, CASINO GAMING CHIPS, OFF- TRACK BETTING & WAGERS AT RACE TRACKS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1837, '7996', 'AMUSEMENT PARKS, CARNIVALS, CIRCUSES, FORTUNE TELLERS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1838, '7997', 'MEMBERSHIP CLUBS COUNTRY CLUBS & PRIVATE GOLF COURSES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1839, '7998', 'AQUARIUMS, SEA-AQUARIUMS, DOLPHINARIUMS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1840, '7999', 'AMUSEMENT & RECREATION SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1841, '8011', 'DOCTORS & PHYSICIANS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1842, '8021', 'DENTISTS & ORTHODONTISTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1843, '8031', 'OSTEOPATHS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1844, '8041', 'CHIROPRACTORS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1845, '8042', 'OPTOMETRISTS & OPHTHALMOLOGISTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1846, '8043', 'OPTICIANS OPTICAL GOODS & EYEGLASSES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1847, '8044', 'OPTICAL GOODS AND EYEGLASSES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1848, '8049', 'CHIROPODISTS, PODIATRISTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1849, '8050', 'NURSING & PERSONAL CARE FACILITIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1850, '8062', 'HOSPITALS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1851, '8071', 'MEDICAL & DENTAL LABORATORIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1852, '8099', 'MEDICAL SERVICES AND HEALTH PRACTITIONERS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1853, '8111', 'LEGAL SERVICES & ATTORNEYS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1854, '8351', 'CHILD CARE SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1855, '8602', 'OTHERS-NOT ELSEWHERE CLASSIFIED', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1856, '8641', 'CIVIC, SOCIAL, & FRATERNAL ASSOC.', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1857, '8651', 'POLITICAL ORGANIZATIONS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1858, '8675', 'AUTOMOBILE ASSOCIATIONS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1859, '8699', 'MEMBERSHIP ORGANIZATIONS (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1860, '8734', 'TESTING LABORATORIES (NON-MEDICAL TESTING)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1861, '8911', 'ARCHITECTURAL, ENGINEERING, & SURVEYING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1862, '8931', 'ACCOUNTING, AUDITING, & BOOKKEEPING SERVICES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1863, '8999', 'PROFESSIONAL SEVICES  (NOT ELSEWHERE CLASSIFIED)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1864, '9223', 'BAIL AND BOND PAYMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1865, '9401', 'I-PURCHASING', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1866, '9402', 'POSTAL SERVICES - GOVERNMENT ONLY', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1867, '9405', 'U.S. FEDERAL GOVERNMENT AGENCIES OR DEPARTMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1868, '9411', 'GOVERNMENT LOAN PAYMENTS', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1869, '9700', 'AUTOMATED REFERRAL SERVICE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1870, '9701', 'COOPERATION', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1871, '9701', 'VISA CREDENTIAL SERVER', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1872, '9702', 'EMERGENCY SERVICES (GCAS)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1873, '9703', 'BPR/RURAL BANK', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1874, '9704', 'PYRAMID OR MULTI LEVEL MARKETING DISTRIBUTION COMPANIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1875, '9705', 'THIRD PARTY PROCESSORS (AGGREGATORS)', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1876, '9751', 'U.K. SUPERMARKETS ELECTRONIC HOT FILE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1877, '9752', 'U.K. PETROL STATIONS, ELECTRONIC HOT FILE', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1878, '9753', 'INTRA-COMPANY PURCHASES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1879, '9754', 'QUASI CASH - GAMBLING - HORSE RACING, DOG RACING, STATE LOTTERIES', 'Regular', '', '0.007', '44281.5778446759', 'admin'),
(1880, '9950', 'INTRA-COMPANY PURCHASES', 'Regular', '', '0.007', '44281.5778446759', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tqris_merchcriteria`
--

CREATE TABLE `tqris_merchcriteria` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `datestamp` varchar(20) NOT NULL,
  `datestampuid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tqris_merchcriteria`
--

INSERT INTO `tqris_merchcriteria` (`id`, `code`, `description`, `datestamp`, `datestampuid`) VALUES
(5, 'UMI', 'Usaha Mikro ', '44281.5760998843', 'admin'),
(6, 'UKE', 'Usaha Kecil ', '44281.5760998843', 'admin'),
(7, 'UME', 'Usaha Menengah', '44281.5760998843', 'admin'),
(8, 'UBE', 'Usaha Besar ', '44281.5760998843', 'admin'),
(9, 'URE', 'Usaha Reguler', '44281.5760998843', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tqris_nns`
--

CREATE TABLE `tqris_nns` (
  `id` int(11) NOT NULL,
  `nns` varchar(20) NOT NULL,
  `description` varchar(500) NOT NULL,
  `priority` varchar(20) NOT NULL,
  `datestamp` varchar(20) NOT NULL,
  `datestampuid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tqris_nns`
--

INSERT INTO `tqris_nns` (`id`, `nns`, `description`, `priority`, `datestamp`, `datestampuid`) VALUES
(1, '93600777', 'Finpay Money', '1', '44281.5917304398', 'admin'),
(2, '93600911', 'LinkAja', '2', '44281.5917304398', 'admin'),
(3, '93600898', 'TMoney', '3', '44281.5917304398', 'admin'),
(4, '93600914', 'GOPAY', '4', '44281.5917304398', 'admin'),
(5, '93600912', 'OVO', '5', '44281.5917304398', 'admin'),
(6, '93600915', 'Dana', '6', '44281.5917304398', 'admin'),
(7, '93600917', 'Paytren', '7', '44281.5917304398', 'admin'),
(8, '93600013', 'Permata', '8', '44281.5917304398', 'admin'),
(9, '93600014', 'BCA', '9', '44281.5917304398', 'admin'),
(10, '93600451', 'BSM', '10', '44281.5917304398', 'admin'),
(11, '93600503', 'Nobu', '11', '44281.5917304398', 'admin'),
(12, '93600011', 'Danamon', '12', '44281.5917304398', 'admin'),
(13, '93600022', 'CIMB', '13', '44281.5917304398', 'admin'),
(14, '93600110', 'Bank BJB', '14', '44281.5917304398', 'admin'),
(15, '93600111', 'Bank DKI', '15', '44281.5917304398', 'admin'),
(16, '93600118', 'Bank Nagari', '16', '44281.5917304398', 'admin'),
(17, '93600129', 'BPDBali', '17', '44281.5917304398', 'admin'),
(18, '93600426', 'MEGA', '18', '44281.5917304398', 'admin'),
(19, '93600016', 'Maybank', '19', '44281.5917304398', 'admin'),
(20, '93600153', 'Sinarmas', '20', '44281.5917304398', 'admin'),
(21, '93600002', 'BRI', '21', '44281.5917304398', 'admin'),
(22, '93600009', 'BNI', '22', '44281.5917304398', 'admin'),
(23, '93600811', 'Ottocash', '23', '44281.5917304398', 'admin'),
(24, '93600918', 'Airpay', '24', '44281.5917304398', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tregioncode`
--

CREATE TABLE `tregioncode` (
  `id` int(11) NOT NULL,
  `ltdb` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `alto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tregioncode`
--

INSERT INTO `tregioncode` (`id`, `ltdb`, `name`, `alto`) VALUES
(1, '102', 'Kab. Bekasi', '0102 - Kab. Bekasi '),
(2, '103', 'Purwakarta', '0103 - Kab. Purwakarta '),
(3, '106', 'Karawang', '0106 - Kab. Karawang'),
(4, '108', 'Kab. Bogor', '0108 - Kab. Bogor '),
(5, '109', 'Kab. Sukabumi', '0109 - Kab. Sukabumi '),
(6, '110', 'Cianjur', '0110 - Kab. Cianjur '),
(7, '111', 'Kab. Bandung', '0111 - Kab. Bandung '),
(8, '112', 'Sumedang', '0112 - Kab. Sumedang'),
(9, '113', 'Kab. Tasikmalaya', '0113 - Kab. Tasikmalaya'),
(10, '114', 'Garut', '0114 - Kab. Garut '),
(11, '115', 'Ciamis', '0115 - Kab. Ciamis '),
(12, '116', 'Kab. Cirebon', '0116 - Kab. Cirebon '),
(13, '117', 'Kuningan', '0117 - Kab. Kuningan '),
(14, '118', 'Indramayu', '0118 - Kab. Indramayu '),
(15, '119', 'Majalengka', '0119 - Kab. Majalengka '),
(16, '121', 'Subang', '0121 - Kab. Subang '),
(17, '122', 'Bandung Barat', '0122 - Kab. Bandung Barat'),
(18, '123', 'Pangandaran', '0123 - Kab. Pangandaran'),
(19, '175', 'Gunung Sitoli', '0123 - Gunung Sitoli'),
(20, '180', 'Banjar', '0180 - Kota Banjar'),
(21, '188', 'Jawa Barat', '0188 - Kab/Kota Lainnya di Jabar'),
(22, '191', 'Bandung', '0191 - Kota Bandung '),
(23, '192', 'Bogor', '0192 - Kota Bogor '),
(24, '193', 'Sukabumi', '0193 - Kota Sukabumi '),
(25, '194', 'Cirebon', '0194 - Kota Cirebon '),
(26, '195', 'Tasikmalaya', '0195 - Kota Tasikmalaya '),
(27, '196', 'Cimahi', '0196 - Kota Cimahi '),
(28, '197', 'Depok', '0197 - Kota Depok '),
(29, '198', 'Bekasi', '0198 - Kota Bekasi '),
(30, '201', 'Lebak', '0201 - Kab. Lebak '),
(31, '202', 'Pandeglang', '0202 - Kab. Pandeglang '),
(32, '203', 'Kab. Serang', '0203 - Kab. Serang'),
(33, '204', 'Kab. Tangerang', '0204 - Kab. Tangerang '),
(34, '288', 'Banten', '0288 - Kab./Kota Lainnya di Banten'),
(35, '291', 'Cilegon', '0291 - Kota Cilegon'),
(36, '292', 'Tangerang', '0292 - Kota Tangerang '),
(37, '293', 'Serang', '0293 - Kota Serang'),
(38, '294', 'Tangerang Selatan', '0294 - Kota Tangerang Selatan'),
(39, '391', 'Jakarta Pusat', '0391 - Wil. Kota Jakarta Pusat '),
(40, '392', 'Jakarta Utara', '0392 - Wil. Kota Jakarta Utara '),
(41, '393', 'Jakarta Barat', '0393 - Wil. Kota Jakarta Barat '),
(42, '394', 'Jakarta', '0394-Wil. Kota Jakarta Selatan'),
(43, '394', 'Jakarta Selatan', '0394 - Wil. Kota Jakarta Selatan'),
(44, '395', 'Jakarta Timur', '0395 - Wil. Kota Jakarta Timur '),
(45, '396', 'Kepulauan Seribu', '0396 - Wil. Kepulauan Seribu'),
(46, '501', 'Bantul', '0501 - Kab. Bantul'),
(47, '502', 'Sleman', '0502 - Kab. Sleman '),
(48, '503', 'Gunung Kidul', '0503 - Kab. Gunung Kidul '),
(49, '504', 'Kulon Progo', '0504 - Kab. Kulon Progo '),
(50, '588', 'Lainnya', '0588 - Kab./Kota Lainnya'),
(51, '591', 'Yogyakarta', '0591 - Kota Yogyakarta'),
(52, '901', 'Kab. Semarang', '0901 - Kab. Semarang'),
(53, '902', 'Kendal', '0902 - Kab. Kendal '),
(54, '903', 'Demak', '0903 - Kab. Demak '),
(55, '904', 'Grobogan', '0904 - Kab. Grobogan '),
(56, '905', 'Kab. Pekalongan', '0905 - Kab. Pekalongan '),
(57, '906', 'Kab. Tegal', '0906 - Kab. Tegal '),
(58, '907', 'Brebes', '0907 - Kab. Brebes '),
(59, '908', 'Pati', '0908 - Kab. Pati '),
(60, '909', 'Kudus', '0909 - Kab. Kudus '),
(61, '910', 'Pemalang', '0910 - Kab. Pemalang '),
(62, '911', 'Jepara', '0911 - Kab. Jepara '),
(63, '912', 'Rembang', '0912 - Kab. Rembang '),
(64, '913', 'Blora', '0913 - Kab. Blora '),
(65, '914', 'Banyumas', '0914 - Kab. Banyumas '),
(66, '915', 'Cilacap', '0915 - Kab. Cilacap '),
(67, '916', 'Purbalingga', '0916 - Kab. Purbalingga '),
(68, '917', 'Banjarnegara', '0917 - Kab. Banjarnegara '),
(69, '918', 'Kab. Magelang', '0918 - Kab. Magelang '),
(70, '919', 'Temanggung', '0919 - Kab. Temanggung '),
(71, '920', 'Wonosobo', '0920 - Kab. Wonosobo '),
(72, '921', 'Purworejo', '0921 - Kab. Purworejo '),
(73, '922', 'Kebumen', '0922 - Kab. Kebumen '),
(74, '923', 'Klaten', '0923 - Kab. Klaten '),
(75, '924', 'Boyolali', '0924 - Kab. Boyolali '),
(76, '925', 'Sragen', '0925 - Kab. Sragen '),
(77, '926', 'Sukoharjo', '0926 - Kab. Sukoharjo '),
(78, '927', 'Karanganyar', '0927 - Kab. Karanganyar '),
(79, '928', 'Wonogiri', '0928 - Kab. Wonogiri '),
(80, '929', 'Batang', '0929 - Kab. Batang '),
(81, '988', 'Jawa Tengah', '0988 - Kab./Kota Lainnya di Jateng'),
(82, '991', 'Semarang', '0991 - Kota Semarang '),
(83, '992', 'Salatiga', '0992 - Kota Salatiga '),
(84, '993', 'Pekalongan', '0993 - Kota Pekalongan '),
(85, '994', 'Tegal', '0994 - Kota Tegal '),
(86, '995', 'Magelang', '0995 - Kota Magelang '),
(87, '996', 'Solo', '0996 - Kota Surakarta/Solo '),
(88, '996', 'Surakarta', '0996 - Kota Surakarta/Solo '),
(89, '1201', 'Gresik', '1201 - Kab. Gresik'),
(90, '1202', 'Sidoarjo', '1202 - Kab. Sidoarjo '),
(91, '1203', 'Kab. Mojokerto', '1203 - Kab. Mojokerto '),
(92, '1204', 'Jombang', '1204 - Kab. Jombang '),
(93, '1205', 'Sampang', '1205 - Kab. Sampang '),
(94, '1206', 'Pamekasan', '1206 - Kab. Pamekasan '),
(95, '1207', 'Sumenep', '1207 - Kab. Sumenep '),
(96, '1208', 'Bangkalan', '1208 - Kab. Bangkalan '),
(97, '1209', 'Bondowoso', '1209 - Kab. Bondowoso '),
(98, '1211', 'Banyuwangi', '1211 - Kab. Banyuwangi '),
(99, '1212', 'Jember', '1212 - Kab. Jember'),
(100, '1213', 'Kab. Malang', '1213 - Kab. Malang '),
(101, '1214', 'Kab. Pasuruan', '1214 - Kab. Pasuruan '),
(102, '1215', 'Kab. Probolinggo', '1215 - Kab. Probolinggo '),
(103, '1216', 'Lumajang', '1216 - Kab. Lumajang '),
(104, '1217', 'Kab. Kediri', '1217 - Kab. Kediri '),
(105, '1218', 'Nganjuk', '1218 - Kab. Nganjuk '),
(106, '1219', 'Tulungagung', '1219 - Kab. Tulungagung '),
(107, '1220', 'Trenggalek', '1220 - Kab. Trenggalek '),
(108, '1221', 'Kab. Blitar', '1221 - Kab. Blitar '),
(109, '1222', 'Kab. Madiun', '1222 - Kab. Madiun '),
(110, '1223', 'Ngawi', '1223 - Kab. Ngawi '),
(111, '1224', 'Magetan', '1224 - Kab. Magetan '),
(112, '1225', 'Ponorogo', '1225 - Kab. Ponorogo '),
(113, '1226', 'Pacitan', '1226 - Kab. Pacitan '),
(114, '1227', 'Bojonegoro', '1227 - Kab. Bojonegoro '),
(115, '1228', 'Tuban', '1228 - Kab. Tuban '),
(116, '1229', 'Lamongan', '1229 - Kab. Lamongan '),
(117, '1230', 'Situbondo', '1230 - Kab. Situbondo '),
(118, '1271', 'Batu', '1271 - Kota Batu'),
(119, '1288', 'Jawa Timur', '1288 - Kab./Kota Lainnya di Jatim'),
(120, '1291', 'Surabaya', '1291 - Kota Surabaya '),
(121, '1292', 'Mojokerto', '1292 - Kota Mojokerto '),
(122, '1293', 'Malang', '1293 - Kota Malang '),
(123, '1294', 'Pasuruan', '1294 - Kota Pasuruan '),
(124, '1295', 'Probolinggo', '1295 - Kota Probolinggo '),
(125, '1296', 'Blitar', '1296 - Kota Blitar '),
(126, '1297', 'Kediri', '1297 - Kota Kediri '),
(127, '1298', 'Madiun', '1298 - Kota Madiun '),
(128, '2301', 'Bengkulu Selatan', '2301 - Kab. Bengkulu Selatan'),
(129, '2302', 'Bengkulu Utara', '2302 - Kab. Bengkulu Utara '),
(130, '2303', 'Rejang Lebong', '2303 - Kab. Rejang Lebong '),
(131, '2304', 'Lebong', '2304 - Kab. Lebong'),
(132, '2305', 'Kepahiang', '2305 - Kab. Kepahiang'),
(133, '2306', 'Mukomuko', '2306 - Kab. Mukomuko'),
(134, '2307', 'Seluma', '2307 - Kab. Seluma'),
(135, '2308', 'Kaur', '2308 - Kab. Kaur'),
(136, '2309', 'Bengkulu Tengah', '2309 - Kab. Bengkulu Tengah'),
(137, '2388', 'Curup', '2388 - Kab./Kota Lainnya di Bengkulu'),
(138, '2391', 'Bengkulu', '2391 - Kota Bengkulu '),
(139, '3101', 'Batanghari', '3101 - Kab. Batanghari '),
(140, '3104', 'Sarolangun', '3104 - Kab. Sarolangun'),
(141, '3105', 'Kerinci', '3105 - Kab. Kerinci '),
(142, '3106', 'Muaro Jambi', '3106 - Kab. Muaro Jambi'),
(143, '3107', 'Tanjung Jabung Barat', '3107 - Kab. Tanjung Jabung Barat'),
(144, '3108', 'Tanjung Jabung Timur', '3108 - Kab. Tanjung Jabung Timur'),
(145, '3109', 'Tebo', '3109 - Kab. Tebo'),
(146, '3111', 'Merangin', '3111 - Kab. Merangin'),
(147, '3112', 'Bungo', '3112 - Kab. Bungo'),
(148, '3188', 'Jambi Lainnya', '3188 - Kab./Kota Lainnya di Jambi'),
(149, '3191', 'Jambi', '3191 - Kota Jambi '),
(150, '3192', 'Sungai Penuh', '3192 - Kota Sungai Penuh'),
(151, '3201', 'Aceh Besar', '3201 - Kab. Aceh Besar '),
(152, '3202', 'Pidie', '3202 - Kab. Pidie '),
(153, '3203', 'Aceh Utara', '3203 - Kab. Aceh Utara '),
(154, '3204', 'Aceh Timur', '3204 - Kab. Aceh Timur '),
(155, '3205', 'Aceh Selatan', '3205 - Kab. Aceh Selatan '),
(156, '3206', 'Aceh Barat', '3206 - Kab. Aceh Barat '),
(157, '3207', 'Aceh Tengah', '3207 - Kab. Aceh Tengah '),
(158, '3208', 'Aceh Tenggara', '3208 - Kab. Aceh Tenggara '),
(159, '3209', 'Aceh Singkil', '3209 - Kab. Aceh Singkil'),
(160, '3210', 'Aceh Jeumpa', '3210 - Kab. Aceh Jeumpa/Bireuen'),
(161, '3210', 'Bireuen', '3210 - Kab. Aceh Jeumpa/Bireuen'),
(162, '3211', 'Aceh Tamiang', '3211 - Kab. Aceh Tamiang'),
(163, '3212', 'Gayo Luwes', '3212 - Kab. Gayo Luwes'),
(164, '3213', 'Aceh Barat Daya', '3213 - Kab. Aceh Barat Daya'),
(165, '3214', 'Aceh Jaya', '3214 - Kab. Aceh Jaya'),
(166, '3215', 'Nagan Raya', '3215 - Kab. Nagan Raya'),
(167, '3216', 'Simeuleu', '3216 - Kab. Simeuleu'),
(168, '3217', 'Bener Meriah', '3217 - Kab. Bener Meriah'),
(169, '3218', 'Pidie Jaya', '3218 - Kab. Pidie Jaya'),
(170, '3219', 'Subulussalam', '3219 - Kab. Subulussalam'),
(171, '3288', 'Aceh', '3288 - Kab./Kota Lainnya di Aceh'),
(172, '3291', 'Banda Aceh', '3291 - Kota Banda Aceh '),
(173, '3292', 'Sabang', '3292 - Kota Sabang'),
(174, '3293', 'Lhokseumawe', '3293 - Kota Lhokseumawe '),
(175, '3294', 'Langsa', '3294 - Kota Langsa'),
(176, '3301', 'Deli Serdang', '3301 - Kab. Deli Serdang '),
(177, '3302', 'Langkat', '3302 - Kab. Langkat '),
(178, '3303', 'Karo', '3303 - Kab. Karo '),
(179, '3304', 'Simalungun', '3304 - Kab. Simalungun'),
(180, '3305', 'Labuhan Batu', '3305 - Kab. Labuhan Batu '),
(181, '3306', 'Asahan', '3306 - Kab. Asahan '),
(182, '3307', 'Dairi', '3307 - Kab. Dairi '),
(183, '3308', 'Tapanuli Utara', '3308 - Kab. Tapanuli Utara '),
(184, '3309', 'Tapanuli Tengah', '3309 - Kab. Tapanuli Tengah '),
(185, '3310', 'Tapanuli Selatan', '3310 - Kab. Tapanuli Selatan '),
(186, '3311', 'Nias', '3311 - Kab. Nias '),
(187, '3313', 'Toba Samosir', '3313 - Kab. Toba Samosir'),
(188, '3314', 'Mandailing Natal', '3314 - Kab. Mandailing Natal'),
(189, '3315', 'Nias Selatan', '3315 - Kab. Nias Selatan'),
(190, '3316', 'Humbang Hasundutan', '3316 - Kab. Humbang Hasundutan'),
(191, '3317', 'Pakpak Bharat', '3317 - Kab. Pakpak Bharat'),
(192, '3318', 'Samosir', '3318 - Kab. Samosir'),
(193, '3319', 'Serdang Bedagai', '3319 - Kab. Serdang Bedagai'),
(194, '3321', 'Batu Bara', '3321 - Kab. Batu Bara'),
(195, '3322', 'Padang Lawas', '3322 - Kab. Padang Lawas'),
(196, '3323', 'Padang Lawas Utara', '3323 - Kab. Padang Lawas Utara'),
(197, '3324', 'Labuanbatu Selatan', '3324 - Kab. Labuanbatu Selatan'),
(198, '3325', 'Labuanbatu Utara', '3325 - Kab. Labuanbatu Utara'),
(199, '3326', 'Nias Barat', '3326 - Kab. Nias Barat'),
(200, '3327', 'Nias Utara', '3327 - Kab. Nias Utara'),
(201, '3388', 'Sumatera Utara', '3388 - Kab/Kota Lainnya di Sumut'),
(202, '3391', 'Tebing Tinggi', '3391 - Kota Tebing Tinggi '),
(203, '3392', 'Binjai', '3392 - Kota Binjai '),
(204, '3393', 'Pematang Siantar', '3393 - Kota Pematang Siantar '),
(205, '3394', 'Tanjung Balai', '3394 - Kota Tanjung Balai '),
(206, '3395', 'Sibolga', '3395 - Kota Sibolga'),
(207, '3396', 'Medan', '3396 - Kota Medan '),
(208, '3397', 'Gunung Sitoli', '3397 - Kota Gunung Sitoli'),
(209, '3399', 'Padang Sidempuan', '3399 - Kota Padang Sidempuan '),
(210, '3401', 'Agam', '3401 - Kab. Agam '),
(211, '3402', 'Pasaman', '3402 - Kab. Pasaman '),
(212, '3403', 'Lima Puluh Kota', '3403 - Kab. Lima Puluh Kota'),
(213, '3404', 'Solok Selatan', '3404 - Kab. Solok Selatan'),
(214, '3405', 'Padang Pariaman', '3405 - Kab. Padang Pariaman '),
(215, '3406', 'Pesisir Selatan', '3406 - Kab. Pesisir Selatan '),
(216, '3407', 'Tanah Datar', '3407 - Kab. Tanah Datar '),
(217, '3408', 'Kab. Sijunjung', '3408 - Kab. Sawahlunto/Sijunjung'),
(218, '3408', 'Kab. Sawahlunto', '3408 - Kab. Sawahlunto/Sijunjung'),
(219, '3408', 'Sijunjung', '3408 - Kab. Sawahlunto/Sijunjung'),
(220, '3409', 'Kepulauan Mentawai', '3409 - Kab. Kepulauan Mentawai'),
(221, '3410', 'Pasaman Barat', '3410 - Kab. Pasaman Barat'),
(222, '3411', 'Dharmasraya', '3411 - Kab. Dharmasraya'),
(223, '3412', 'Kab. Solok', '3412 - Kab. Solok'),
(224, '3488', 'Sumatera Barat', '3488 - Kab./Kota Lainnya di Sumbar'),
(225, '3491', 'Bukittinggi', '3491 - Kota Bukittinggi '),
(226, '3492', 'Padang', '3492 - Kota Padang'),
(227, '3493', 'Sawahlunto', '3493 - Kota Sawahlunto'),
(228, '3494', 'Padang Panjang', '3494 - Kota Padang Panjang '),
(229, '3495', 'Solok', '3495 - Kota Solok '),
(230, '3496', 'Payakumbuh', '3496 - Kota Payakumbuh '),
(231, '3497', 'Pariaman', '3497 - Kota Pariaman '),
(232, '3501', 'Kampar', '3501 - Kab. Kampar'),
(233, '3502', 'Bengkalis', '3502 - Kab. Bengkalis '),
(234, '3504', 'Indragiri Hulu', '3504 - Kab. Indragiri Hulu '),
(235, '3505', 'Indragiri Hilir', '3505 - Kab. Indragiri Hilir'),
(236, '3508', 'Rokan Hulu', '3508 - Kab. Rokan Hulu'),
(237, '3509', 'Rokan Hilir', '3509 - Kab. Rokan Hilir'),
(238, '3510', 'Pelalawan', '3510 - Kab. Pelalawan  '),
(239, '3511', 'Siak', '3511 - Kab. Siak '),
(240, '3512', 'Kuantan Singingi', '3512 - Kab. Kuantan Singingi   '),
(241, '3513', 'Kepulauan Meranti', '3513 - Kab. Kepulauan Meranti'),
(242, '3588', 'Riau', '3588 - Kab./Kota Lainnya di Riau'),
(243, '3591', 'Pekanbaru', '3591 - Kota Pekanbaru '),
(244, '3592', 'Dumai', '3592 - Kota Dumai '),
(245, '3606', 'Musi Banyuasin', '3606 - Kab. Musi Banyuasin '),
(246, '3607', 'Ogan Komering Ulu', '3607 - Kab. Ogan Komering Ulu '),
(247, '3608', 'Lematang Ilir Ogan Tengah', '3608 - Kab. Lematang Ilir Ogan Tengah (Muara Enim) '),
(248, '3608', 'Muara Enim', '3608 - Kab. Lematang Ilir Ogan Tengah (Muara Enim) '),
(249, '3609', 'Lahat', '3609 - Kab. Lahat'),
(250, '3610', 'Musi Rawas', '3610 - Kab. Musi Rawas '),
(251, '3611', 'Ogan Komering Ilir', '3611 - Kab. Ogan Komering Ilir '),
(252, '3613', 'Banyuasin', '3613 - Kab. Banyuasin'),
(253, '3614', 'Ogan Komering Ulu Selatan', '3614 - Kab. Ogan Komering Ulu Selatan'),
(254, '3615', 'Ogan Komering Ulu Timur', '3615 - Kab. Ogan Komering Ulu Timur'),
(255, '3616', 'Ogan Ilir', '3616 - Kab. Ogan Ilir'),
(256, '3617', 'Empat Lawang', '3617 - Kab. Empat Lawang'),
(257, '3618', 'Musi Rawas Utara', '3618 - Kab. Musi Rawas Utara'),
(258, '3619', 'Penukal Abab Lematang Ilir', '3619 - Kab. Penukal Abab Lematang Ilir'),
(259, '3688', 'Sumatera Selatan', '3688 - Kab./Kota Lainnya di Sumsel'),
(260, '3691', 'Palembang', '3691 - Kota Palembang '),
(261, '3693', 'Lubuklinggau', '3693 - Kota Lubuklinggau '),
(262, '3694', 'Prabumulih', '3694 - Kota Prabumulih '),
(263, '3697', 'Pagar Alam', '3697 - Kota Pagar Alam   '),
(264, '3701', 'Bangka', '3701 - Kab. Bangka '),
(265, '3702', 'Belitung', '3702 - Kab. Belitung'),
(266, '3703', 'Bangka Barat', '3703 - Kab. Bangka Barat'),
(267, '3704', 'Bangka Selatan', '3704 - Kab. Bangka Selatan'),
(268, '3705', 'Bangka Tengah', '3705 - Kab. Bangka Tengah'),
(269, '3706', 'Belitung Timur', '3706 - Kab. Belitung Timur '),
(270, '3788', 'Bangka Belitung', '3788 - Kab./Kota Lainnya di Kep. Bangka'),
(271, '3791', 'Pangkal Pinang', '3791 - Kota Pangkal Pinang '),
(272, '3801', 'Karimun', '3801 - Kab. Karimun'),
(273, '3802', 'Lingga', '3802 - Kab. Lingga'),
(274, '3803', 'Natuna', '3803 - Kab. Natuna'),
(275, '3804', 'Bintan', '3804 - Kab. Bintan (d/h Kab. Kepulauan Riau)'),
(276, '3804', 'Kepulauan Riau', '3804 - Kab. Bintan (d/h Kab. Kepulauan Riau)'),
(277, '3805', 'Kepulauan Anambas', '3805 - Kab. Kepulauan Anambas'),
(278, '3888', 'Kepulauan Riau', '3888 - Kab./Kota Lainnya di Kepulauan Riau'),
(279, '3891', 'Tanjung Pinang', '3891 - Kota Tanjung Pinang '),
(280, '3892', 'Batam', '3892 - Kota Batam'),
(281, '3901', 'Lampung Selatan', '3901 - Kab. Lampung Selatan '),
(282, '3902', 'Lampung Tengah', '3902 - Kab. Lampung Tengah '),
(283, '3903', 'Lampung Utara', '3903 - Kab. Lampung Utara '),
(284, '3904', 'Lampung Barat', '3904 - Kab. Lampung Barat '),
(285, '3905', 'Tulang Bawang', '3905 - Kab. Tulang Bawang '),
(286, '3906', 'Tanggamus', '3906 - Kab. Tanggamus '),
(287, '3907', 'Lampung Timur', '3907 - Kab. Lampung Timur'),
(288, '3908', 'Way Kanan', '3908 - Kab. Way Kanan'),
(289, '3909', 'Pesawaran', '3909 - Kab. Pesawaran'),
(290, '3910', 'Pringsewu', '3910 - Kab. Pringsewu'),
(291, '3911', 'Tulang Bawang Barat', '3911 - Kab. Tulang Bawang Barat'),
(292, '3912', 'Mesuji', '3912 - Kab. Mesuji'),
(293, '3913', 'Pesisir Barat', '3913 - Kab. Pesisir Barat'),
(294, '3988', 'Lampung', '3988 - Kab./Kota Lainnya di Lampung'),
(295, '3991', 'Bandar Lampung', '3991 - Kota Bandar Lampung '),
(296, '3992', 'Metro', '3992 - Kota Metro '),
(297, '5101', 'Kab. Banjar', '5101 - Kab. Banjar '),
(298, '5102', 'Tanah Laut', '5102 - Kab. Tanah Laut '),
(299, '5103', 'Tapin', '5103 - Kab. Tapin '),
(300, '5104', 'Hulu Sungai Selatan', '5104 - Kab. Hulu Sungai Selatan'),
(301, '5105', 'Hulu Sungai Tengah', '5105 - Kab. Hulu Sungai Tengah '),
(302, '5106', 'Hulu Sungai Utara', '5106 - Kab. Hulu Sungai Utara '),
(303, '5107', 'Barito Kuala', '5107 - Kab. Barito Kuala '),
(304, '5108', 'Baru', '5108 - Kab. Kota Baru '),
(305, '5109', 'Tabalong', '5109 - Kab. Tabalong'),
(306, '5110', 'Tanah Bumbu', '5110 - Kab.Tanah Bumbu'),
(307, '5111', 'Balangan', '5111 - Kab. Balangan'),
(308, '5188', 'Kalimantan Selatan', '5188 - Kab./Kota Lainnya di Kalsel'),
(309, '5188', 'Mempawah', '5188 - Kab./Kota Lainnya di Kalsel'),
(310, '5191', 'Banjarmasin', '5191 - Kota Banjarmasin '),
(311, '5192', 'Banjarbaru', '5192 - Kota Banjarbaru '),
(312, '5301', 'Kab. Mempawah (d/h Kab. Pontianak)', '5301 - Kab. Mempawah (d/h Kab. Pontianak)'),
(313, '5301', 'Kab. Pontianak', '5301 - Kab. Mempawah (d/h Kab. Pontianak)'),
(314, '5302', 'Sambas', '5302 - Kab. Sambas '),
(315, '5303', 'Ketapang', '5303 - Kab. Ketapang '),
(316, '5304', 'Sanggau', '5304 - Kab. Sanggau '),
(317, '5305', 'Sintang', '5305 - Kab. Sintang '),
(318, '5306', 'Kapuas Hulu', '5306 - Kab. Kapuas Hulu '),
(319, '5307', 'Bengkayang', '5307 - Kab. Bengkayang    '),
(320, '5308', 'Landak', '5308 - Kab. Landak   '),
(321, '5309', 'Sekadau', '5309 - Kab. Sekadau'),
(322, '5310', 'Melawi', '5310 - Kab. Melawi'),
(323, '5311', 'Kayong Utara', '5311 - Kab. Kayong Utara'),
(324, '5312', 'Kubu Raya', '5312 - Kab. Kubu Raya'),
(325, '5388', 'Kalimantan Barat', '5388 - Kab./Kota Lainnya di Kalbar'),
(326, '5391', 'Pontianak', '5391 - Kota Pontianak '),
(327, '5392', 'Singkawang', '5392 - Kota Singkawang '),
(328, '5401', 'Kutai Kartanegara', '5401 - Kab. Kutai Kartanegara'),
(329, '5402', 'Berau', '5402 - Kab. Berau '),
(330, '5403', 'Paser', '5403 - Kab. Paser'),
(331, '5404', 'Bulungan', '5404 - Kab. Bulungan '),
(332, '5405', 'Kutai Barat', '5405 - Kab. Kutai Barat   '),
(333, '5406', 'Kutai Timur', '5406 - Kab. Kutai Timur '),
(334, '5409', 'Nunukan', '5409 - Kab. Nunukan '),
(335, '5410', 'Malinau', '5410 - Kab. Malinau '),
(336, '5411', 'Penajam Paser Utara', '5411 - Kab. Penajam Paser Utara'),
(337, '5412', 'Tana Tidung', '5412 - Kab. Tana Tidung '),
(338, '5413', 'Mahakam Ulu', '5413 - Kab. Mahakam Ulu'),
(339, '5488', 'Kalimantan Timur', '5488 - Kab./Kota Lainnya di Kaltim'),
(340, '5491', 'Samarinda', '5491 - Kota Samarinda '),
(341, '5492', 'Balikpapan', '5492 - Kota Balikpapan '),
(342, '5493', 'Tarakan', '5493 - Kota Tarakan '),
(343, '5494', 'Bontang', '5494 - Kota Bontang '),
(344, '5588', 'Kalimantan Utara', '5588 - Kab./Kota Lainnya di Kaltara'),
(345, '5801', 'Kapuas', '5801 - Kab. Kapuas '),
(346, '5802', 'Kotawaringin Barat', '5802 - Kab. Kotawaringin Barat '),
(347, '5803', 'Kotawaringin Timur', '5803 - Kab. Kotawaringin Timur'),
(348, '5804', 'Murung Raya', '5804 - Kab. Murung Raya'),
(349, '5805', 'Barito Timur', '5805 - Kab. Barito Timur'),
(350, '5806', 'Barito Selatan', '5806 - Kab. Barito Selatan '),
(351, '5807', 'Gunung Mas', '5807 - Kab. Gunung Mas'),
(352, '5808', 'Barito Utara', '5808 - Kab. Barito Utara'),
(353, '5809', 'Pulang Pisau', '5809 - Kab. Pulang Pisau'),
(354, '5810', 'Seruyan', '5810 - Kab. Seruyan'),
(355, '5811', 'Katingan', '5811 - Kab. Katingan'),
(356, '5812', 'Sukamara', '5812 - Kab. Sukamara'),
(357, '5813', 'Lamandau', '5813 - Kab. Lamandau'),
(358, '5888', 'Kalimantan Tengah', '5888 - Kab./Kota Lainnya di Kalteng'),
(359, '5892', 'Palangkaraya', '5892 - Kota Palangkaraya '),
(360, '6001', 'Donggala', '6001 - Kab. Donggala '),
(361, '6002', 'Poso', '6002 - Kab. Poso '),
(362, '6003', 'Banggai', '6003 - Kab. Banggai '),
(363, '6004', 'Toli-Toli', '6004 - Kab. Toli-Toli'),
(364, '6005', 'Banggai Kepulauan', '6005 - Kab. Banggai Kepulauan   '),
(365, '6006', 'Morowali', '6006 - Kab. Morowali  '),
(366, '6007', 'Buol', '6007 - Kab. Buol    '),
(367, '6008', 'Tojo Una-Una', '6008 - Kab. Tojo Una-Una'),
(368, '6009', 'Parigi Moutong', '6009 - Kab. Parigi Moutong'),
(369, '6010', 'Sigi', '6010 - Kab. Sigi'),
(370, '6011', 'Banggai Laut', '6011 - Kab. Banggai Laut'),
(371, '6012', 'Morowali Utara', '6012 - Kab. Morowali Utara'),
(372, '6088', 'Sulawesi Tengah', '6088 - Kab./Kota Lainnya di Sulteng'),
(373, '6091', 'Palu', '6091 - Kota Palu '),
(374, '6101', 'Pinrang', '6101 - Kab. Pinrang '),
(375, '6102', 'Gowa', '6102 - Kab. Gowa '),
(376, '6103', 'Wajo', '6103 - Kab. Wajo '),
(377, '6105', 'Bone', '6105 - Kab. Bone '),
(378, '6106', 'Tana Toraja', '6106 - Kab. Tana Toraja '),
(379, '6107', 'Maros', '6107 - Kab. Maros '),
(380, '6109', 'Luwu', '6109 - Kab. Luwu'),
(381, '6110', 'Sinjai', '6110 - Kab. Sinjai '),
(382, '6111', 'Bulukumba', '6111 - Kab. Bulukumba '),
(383, '6112', 'Bantaeng', '6112 - Kab. Bantaeng '),
(384, '6113', 'Jeneponto', '6113 - Kab. Jeneponto '),
(385, '6114', 'Kepulauan Selayar', '6114 - Kab. Kepualauan Selayar (d/h Kab. Selayar)'),
(386, '6114', 'Selayar', '6114 - Kab. Kepualauan Selayar (d/h Kab. Selayar)'),
(387, '6115', 'Takalar', '6115 - Kab. Takalar '),
(388, '6116', 'Barru', '6116 - Kab. Barru '),
(389, '6117', 'Sidenreng Rappang', '6117 - Kab. Sidenreng Rappang '),
(390, '6118', 'Pangkajene Kepulauan', '6118 - Kab. Pangkajene Kepulauan '),
(391, '6119', 'Soppeng', '6119 - Kab. Soppeng (d/h Kab. Watansoppeng)'),
(392, '6119', 'Watansoppeng', '6119 - Kab. Soppeng (d/h Kab. Watansoppeng)'),
(393, '6121', 'Enrekang', '6121 - Kab. Enrekang '),
(394, '6122', 'Luwu Selatan', '6122 - Kab. Luwu Timur (d/h Kab. Luwu Selatan)'),
(395, '6122', 'Luwu Timur', '6122 - Kab. Luwu Timur (d/h Kab. Luwu Selatan)'),
(396, '6124', 'Luwu Utara', '6124 - Kab. Luwu Utara  '),
(397, '6125', 'Toraja Utara', '6125 - Kab. Toraja Utara'),
(398, '6188', 'Sulawesi Selatan', '6188 - Kab./Kota Lainnya di Sulsel'),
(399, '6191', 'Makassar', '6191 - Kota Makassar'),
(400, '6192', 'Pare-Pare', '6192 - Kota Pare-Pare '),
(401, '6193', 'Palopo', '6193 - Kota Palopo'),
(402, '6202', 'Minahasa', '6202 - Kab. Minahasa '),
(403, '6203', 'Bolaang Mongondow', '6203 - Kab. Bolaang Mongondow '),
(404, '6204', 'Kepulauan Sangihe', '6204 - Kab. Kepulauan Sangihe '),
(405, '6205', 'Kepulauan Talaud', '6205 - Kab. Kepulauan Talaud '),
(406, '6206', 'Minahasa Selatan', '6206 - Kab. Minahasa Selatan '),
(407, '6207', 'Minahasa Utara', '6207 - Kab. Minahasa Utara'),
(408, '6209', 'Minahasa Tenggara', '6209 - Kab. Minahasa Tenggara'),
(409, '6210', 'Bolaang Mongondow Utara', '6210 - Kab. Bolaang Mongondow Utara'),
(410, '6211', 'Kepulauan Siau Tagulandang Biaro', '6211 - Kab. Kepulauan Siau Tagulandang Biaro'),
(411, '6212', 'Bolaang Mongondow Selatan', '6212 - Kab. Bolaang Mongondow Selatan'),
(412, '6213', 'Bolaang Mongondow Timur', '6213 - Kab. Bolaang Mongondow Timur'),
(413, '6288', 'Sulawesi Utara', '6288 - Kab./Kota Lainnya di Sulut'),
(414, '6291', 'Manado', '6291 - Kota Manado '),
(415, '6292', 'Kotamobagu', '6292 - Kota Kotamobagu'),
(416, '6293', 'Bitung', '6293 - Kota Bitung '),
(417, '6294', 'Tomohon', '6294 - Kota. Tomohon'),
(418, '6301', 'Kab. Gorontalo', '6301 - Kab. Gorontalo '),
(419, '6302', 'Bualemo', '6302 - Kab. Bualemo   '),
(420, '6303', 'Bonebolango', '6303 - Kab. Bonebolango'),
(421, '6304', 'Pohuwato', '6304 - Kab. Pohuwato'),
(422, '6305', 'Gorontalo Utara', '6305 - Kab. Gorontalo Utara'),
(423, '6388', 'Gorontalo Selatan', '6388 - Kab./Kota Lainnya di Gorontalo'),
(424, '6391', 'Gorontalo', '6391 - Kota Gorontalo '),
(425, '6401', 'Polewali Mandar', '6401 - Kab. Polewali Mandar'),
(426, '6402', 'Majene', '6402 - Kab. Majene '),
(427, '6403', 'Mamasa', '6403 - Kab. Mamasa '),
(428, '6404', 'Mamuju Utara', '6404 - Kab. Mamuju Utara'),
(429, '6405', 'Mamuju Tengah', '6405 - Kab. Mamuju Tengah'),
(430, '6488', 'Sulawesi Barat', '6488 - Kab./Kota Lainnya di Sulbar'),
(431, '6491', 'Mamuju', '6491 - Kota Mamuju'),
(432, '6901', 'Buton', '6901 - Kab. Buton '),
(433, '6903', 'Muna', '6903 - Kab. Muna '),
(434, '6904', 'Kolaka', '6904 - Kab. Kolaka '),
(435, '6905', 'Wakatobi', '6905 - Kab. Wakatobi'),
(436, '6906', 'Konawe', '6906 - Kab. Konawe'),
(437, '6907', 'Konawe Selatan', '6907 - Kab. Konawe Selatan '),
(438, '6908', 'Bombana', '6908 - Kab. Bombana'),
(439, '6909', 'Kolaka Utara', '6909 - Kab. Kolaka Utara'),
(440, '6910', 'Buton Utara', '6910 - Kab. Buton Utara'),
(441, '6911', 'Konawe Utara', '6911 - Kab. Konawe Utara'),
(442, '6912', 'Kolaka Timur', '6912 - Kab. Kolaka Timur'),
(443, '6913', 'Konawe Kepulauan', '6913 - Kab. Konawe Kepulauan'),
(444, '6914', 'Buton Selatan', '6914 - Kab. Buton Selatan'),
(445, '6915', 'Buton Tengah', '6915 - Kab. Buton Tengah'),
(446, '6916', 'Muna Barat', '6916 - Kab. Muna Barat'),
(447, '6988', 'Sulawesi Tenggara', '6988 - Kab./Kota Lainnya di Sulteng'),
(448, '6990', 'Bau-Bau', '6990 - Kota Bau-Bau '),
(449, '6991', 'Kendari', '6991 - Kota Kendari '),
(450, '7101', 'Lombok Barat', '7101 - Kab. Lombok Barat '),
(451, '7102', 'Lombok Tengah', '7102 - Kab. Lombok Tengah '),
(452, '7103', 'Lombok Timur', '7103 - Kab. Lombok Timur '),
(453, '7104', 'Sumbawa', '7104 - Kab. Sumbawa '),
(454, '7105', 'Kab. Bima', '7105 - Kab. Bima '),
(455, '7106', 'Dompu', '7106 - Kab. Dompu '),
(456, '7107', 'Sumbawa Barat', '7107 - Kab. Sumbawa Barat'),
(457, '7108', 'Lombok Utara', '7108 - Kab. Lombok Utara'),
(458, '7188', 'Nusa Tenggara Barat', '7188 - Kab./Kota Lainnya di NTB'),
(459, '7191', 'Mataram', '7191 - Kota Mataram '),
(460, '7192', 'Bima', '7192 - Kota Bima'),
(461, '7201', 'Buleleng', '7201 - Kab. Buleleng '),
(462, '7202', 'Jembrana', '7202 - Kab. Jembrana '),
(463, '7203', 'Tabanan', '7203 - Kab. Tabanan '),
(464, '7204', 'Badung', '7204 - Kab. Badung'),
(465, '7205', 'Gianyar', '7205 - Kab. Gianyar '),
(466, '7206', 'Klungkung', '7206 - Kab. Klungkung '),
(467, '7207', 'Bangli', '7207 - Kab. Bangli '),
(468, '7208', 'Karangasem', '7208 - Kab. Karangasem '),
(469, '7288', 'Bali', '7288 - Kab./Kota Lainnya di Bali'),
(470, '7291', 'Denpasar', '7291 - Kota Denpasar '),
(471, '7401', 'Kab. Kupang', '7401 - Kab. Kupang '),
(472, '7402', 'Timor-Tengah Selatan', '7402 - Kab. Timor-Tengah Selatan '),
(473, '7403', 'Timor-Tengah Utara', '7403 - Kab. Timor-Tengah Utara '),
(474, '7404', 'Belu', '7404 - Kab. Belu '),
(475, '7405', 'Alor', '7405 - Kab. Alor '),
(476, '7406', 'Flores Timur', '7406 - Kab. Flores Timur '),
(477, '7407', 'Sikka', '7407 - Kab. Sikka '),
(478, '7408', 'Ende', '7408 - Kab. Ende '),
(479, '7409', 'Ngada', '7409 - Kab. Ngada '),
(480, '7410', 'Manggarai', '7410 - Kab. Manggarai '),
(481, '7411', 'Sumba Timur', '7411 - Kab. Sumba Timur'),
(482, '7412', 'Sumba Barat', '7412 - Kab. Sumba Barat '),
(483, '7413', 'Lembata', '7413 - Kab. Lembata'),
(484, '7414', 'Rote Ndao', '7414 - Kab. Rote Ndao'),
(485, '7415', 'Manggarai Barat', '7415 - Kab. Manggarai Barat'),
(486, '7416', 'Sumba Tengah', '7416 - Kab. Sumba Tengah'),
(487, '7417', 'Sumba Barat Daya', '7417 - Kab. Sumba Barat Daya'),
(488, '7418', 'Manggarai Timur', '7418 - Kab. Manggarai Timur'),
(489, '7419', 'Nagekeo', '7419 - Kab. Nagekeo'),
(490, '7420', 'Sab Raijua', '7420 - Kab. Sab Raijua'),
(491, '7421', 'Malaka', '7421 - Kab. Malaka'),
(492, '7488', 'Maluku Tengah', '7488 - Kab./Kota Lainnya di NTT'),
(493, '7488', 'Nusa Tenggara Timur', '7488 - Kab./Kota Lainnya di NTT'),
(494, '7491', 'Kupang', '7491 - Kota Kupang '),
(495, '8102', 'Maluku Tenggara', '8102 - Kab. Maluku Tenggara '),
(496, '8103', 'Maluku Tenggara Barat', '8103 - Kab. Maluku Tenggara Barat'),
(497, '8104', 'Buru', '8104 - Kab. Buru'),
(498, '8105', 'Seram Bagian Barat', '8105 - Kota Seram Bagian Barat'),
(499, '8106', 'Seram Bagian Timur', '8106 - Kota Seram Bagian Timur'),
(500, '8107', 'Kepulauan Aru', '8107 - Kota Kepulauan Aru'),
(501, '8108', 'Maluku Barat Daya', '8108 - Kab. Maluku Barat Daya'),
(502, '8109', 'Buru Selatan', '8109 - Kab. Buru Selatan'),
(503, '8188', 'Maluku', '8188 - Kab./Kota Lainnya di Maluku'),
(504, '8191', 'Ambon', '8191 - Kota Ambon '),
(505, '8192', 'Tual', '8192 - Kota Tual'),
(506, '8201', 'Kab. Jayapura', '8201 - Kab. Jayapura '),
(507, '8202', 'Biak Numfor', '8202 - Kab. Biak Numfor '),
(508, '8210', 'Kepulauan Yapen', '8210 - Kab. Kepulauan Yapen '),
(509, '8211', 'Merauke', '8211 - Kab. Merauke '),
(510, '8212', 'Paniai', '8212 - Kab. Paniai '),
(511, '8213', 'Jayawijaya', '8213 - Kab. Jayawijaya '),
(512, '8214', 'Nabire', '8214 - Kab. Nabire'),
(513, '8215', 'Mimika', '8215 - Kab. Mimika'),
(514, '8216', 'Puncak Jaya', '8216 - Kab. Puncak Jaya'),
(515, '8217', 'Sarmi', '8217 - Kab. Sarmi'),
(516, '8218', 'Keerom', '8218 - Kab. Keerom'),
(517, '8221', 'Pegunungan Bintang', '8221 - Kab. Pegunungan Bintang'),
(518, '8222', 'Yahukimo', '8222 - Kab. Yahukimo'),
(519, '8223', 'Tolikara', '8223 - Kab. Tolikara'),
(520, '8224', 'Waropen', '8224 - Kab. Waropen'),
(521, '8226', 'Boven Digoel', '8226 - Kab. Boven Digoel'),
(522, '8227', 'Mappi', '8227 - Kab. Mappi'),
(523, '8228', 'Asmat', '8228 - Kab. Asmat'),
(524, '8231', 'Supiori', '8231 - Kab. Supiori'),
(525, '8232', 'Mamberamo Raya', '8232 - Kab. Mamberamo Raya'),
(526, '8233', 'Dogiyai', '8233 - Kab. Dogiyai'),
(527, '8234', 'Lanny Jaya', '8234 - Kab. Lanny Jaya'),
(528, '8235', 'Mamberamo Tengah', '8235 - Kab. Mamberamo Tengah'),
(529, '8236', 'Nduga', '8236 - Kab. Nduga '),
(530, '8237', 'Yalimo', '8237 - Kab. Yalimo'),
(531, '8238', 'Puncak', '8238 - Kab. Puncak'),
(532, '8239', 'Intan Jaya', '8239 - Kab. Intan Jaya'),
(533, '8241', 'Deiyai', '8241 - Kab. Deiyai'),
(534, '8288', 'Papua', '8288 - Kab./Kota Lainnya di Papua'),
(535, '8291', 'Jayapura', '8291 - Kota Jayapura '),
(536, '8302', 'Halmahera Tengah', '8302 - Kab. Halmahera Tengah  '),
(537, '8303', 'Halmahera Utara', '8303 - Kab. Halmahera Utara'),
(538, '8304', 'Halmahera Timur', '8304 - Kab. Halmahera Timur'),
(539, '8305', 'Halmahera Barat', '8305 - Kab. Halmahera Barat'),
(540, '8306', 'Halmahera Selatan', '8306 - Kab. Halmahera Selatan'),
(541, '8307', 'Kepulauan Sula', '8307 - Kab. Kepulauan Sula'),
(542, '8308', 'Pulau Morotai', '8308 - Kab. Pulau Morotai'),
(543, '8309', 'Pulau Taliabu', '8309 - Kab. Pulau Taliabu'),
(544, '8388', 'Maluku Utara', '8388 - Kab./Kota Lainnya di Maluku Utara'),
(545, '8390', 'Ternate', '8390 - Kota Ternate   '),
(546, '8391', 'Tidore Kepulauan', '8391 - Kota Tidore Kepulauan'),
(547, '8401', 'Kab. Sorong', '8401 - Kab. Sorong '),
(548, '8402', 'Fak-Fak', '8402 - Kab. Fak-Fak '),
(549, '8403', 'Manokwari', '8403 - Kab. Manokwari '),
(550, '8404', 'Sorong Selatan', '8404 - Kab. Sorong Selatan'),
(551, '8405', 'Raja Ampat', '8405 - Kab. Raja Ampat'),
(552, '8406', 'Kaimana', '8406 - Kab. Kaimana'),
(553, '8407', 'Teluk Bintuni', '8407 - Kab. Teluk Bintuni'),
(554, '8408', 'Teluk Wondama', '8408 - Kab. Teluk Wondama'),
(555, '8409', 'Tembrauw', '8409 - Kab. Tembrauw'),
(556, '8410', 'Maybrat', '8410 - Kab. Maybrat'),
(557, '8411', 'Pegunungan Arfak', '8411 - Kab. Pegunungan Arfak '),
(558, '8412', 'Manokwari Selatan', '8412 - Kab. Manokwari Selatan'),
(559, '8488', 'Papua Barat', '8488 - Kab./Kota Lainnya di Papua Barat'),
(560, '8491', 'Sorong', '8491 - Kota Sorong');

-- --------------------------------------------------------

--
-- Struktur dari tabel `treportperiod`
--

CREATE TABLE `treportperiod` (
  `id` int(11) NOT NULL,
  `periodcode` varchar(20) NOT NULL,
  `periodname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `treportperiod`
--

INSERT INTO `treportperiod` (`id`, `periodcode`, `periodname`) VALUES
(1, '1D', 'Daily'),
(2, '1M', 'Montly'),
(3, '1W', 'Weekly'),
(4, '3M', '3 Monthly');

-- --------------------------------------------------------

--
-- Struktur dari tabel `treportsettings`
--

CREATE TABLE `treportsettings` (
  `id` int(11) NOT NULL,
  `code` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `period` varchar(20) NOT NULL,
  `days` varchar(20) NOT NULL,
  `regulator` varchar(200) NOT NULL,
  `format` varchar(20) NOT NULL,
  `header1` varchar(200) NOT NULL,
  `header2` varchar(200) NOT NULL,
  `header3` varchar(200) NOT NULL,
  `header4` varchar(200) NOT NULL,
  `header5` varchar(200) NOT NULL,
  `picupdate` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `datestamp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `treportsettings`
--

INSERT INTO `treportsettings` (`id`, `code`, `name`, `period`, `days`, `regulator`, `format`, `header1`, `header2`, `header3`, `header4`, `header5`, `picupdate`, `status`, `link`, `datestamp`) VALUES
(1, 'G0001', 'Laporan LTDBB Transfer Dana (laporan Pengiriman Uang dari Indonesia ke luar negeri Form G0001)', '1M', '1', 'Bank Indonesia', 'X001', 'Transaksi Pengiriman Uang dari Indonesia ke Luar Negeri', '777930008', '', '', '', '1', 'active', 'cetakg1', '20210101'),
(2, 'G0002', 'Laporan LTDBB Transfer Dana (laporan Pengiriman Uang dari Luar negeri ke Indonesia Form G0002)', '1M', '5', 'Bank Indonesia', 'X002', 'Transaksi Pengiriman Uang dari Luar Negeri ke Indonesia', '777930008', '', '', '', '1', 'active', 'cetakg2', '20210101'),
(3, 'G0003', 'Laporan LTDBB Transfer Dana (laporan Pengiriman Uang di Dalam Wilayah Republik Indonesia Form G0003)', '1M', '5', 'Bank Indonesia', 'X003', 'Transaksi Pengiriman Uang di dalam Wilayah Republik Indonesia', '777930008', '', '', '', '1', 'active', 'cetakg3', '20210101'),
(4, 'PPATKD', 'Laporan LTKL Transfer Dana (Laporan Transaksi Ke dan Dari Luar Negeri)', '1D', '1', 'PPATK', 'X004', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(5, 'QRISW', 'Laporan Kegiatan QRIS', '1W', '1', 'Bank Indonesia', 'X005', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(6, 'QRISM', 'Laporan Kegiatan QRIS', '1M', '3', 'Bank Indonesia', 'X006', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(7, '', 'Laporan Dana Float Uang Elektronik', '1D', '1', 'Bank Indonesia', 'X007', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(8, '', 'Laporan Dana Float Uang Elektronik', '1W', '1', 'Bank Indonesia', 'X008', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(9, '', 'Laporan Payment Gateway', '1M', '1', 'Bank Indonesia', 'X009', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(10, '', 'Laporan SIPESAT (Sistem Informasi Pengguna Jasa Terpadu) (Data Pelanggan Uang Elektronik)', '3M', '1', 'PPATK', 'X010', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(11, '', 'Laporan LKPBU Uang Elektronik (Form 302 Laporan Penerbit Selain Kartu Kredit)', '1M', '1', 'Bank Indonesia', 'X011', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(12, '', 'Laporan LKPBU Uang Elektronik (Form 303 Laporan Bulanan Acquirer)', '1M', '1', 'Bank Indonesia', 'X012', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(13, '', 'Laporan LKPBU Uang Elektronik (Form 304 Laporan Bulanan Infrastruktur)', '1M', '1', 'Bank Indonesia', 'X013', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(14, '', 'Laporan LKPBU Uang Elektronik (Form 306 Laporan Bulanan Fraud APMK dan Instrumen Prabayar)', '1M', '1', 'Bank Indonesia', 'X014', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(15, '', 'Laporan LKPBU Uang Elektronik (Form 309 Laporan Triwulan Jenis Produk dan Permasalahan yang Diadukan)', '3M', '1', 'Bank Indonesia', 'X015', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(16, '', 'Laporan LKPBU Uang Elektronik (Form 310 Laporan Triwulan Pengaduan yang Diselesaikan dalam Masa Laporan)', '3M', '1', 'Bank Indonesia', 'X016', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(17, '', 'Laporan LKPBU Uang Elektronik (Form 311 Laporan Triwulan Penyebab Pengaduan)', '3M', '1', 'Bank Indonesia', 'X017', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(18, '', 'Laporan LKPBU Uang Elektronik (Form 312 Laporan Triwulan Publikasi Negatif)', '3M', '1', 'Bank Indonesia', 'X018', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(19, '', 'Laporan LKPBU Uang Elektronik (Form 313 Laporan Triwulan Penyelesaian Sengketa)', '3M', '1', 'Bank Indonesia', 'X019', '', '', '', '', '', '1', 'inactive', '', '20210101'),
(20, '', 'Laporan Gangguan Availability Sistem', '1M', '1', 'Bank Indonesia', 'X020', '', '', '', '', '', '1', 'inactive', '', '20210101');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tswiftcode`
--

CREATE TABLE `tswiftcode` (
  `id` int(11) NOT NULL,
  `swiftcodemaster` varchar(20) NOT NULL,
  `swiftcode` varchar(20) NOT NULL,
  `company` varchar(200) NOT NULL,
  `comptype` varchar(200) NOT NULL,
  `branch` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tswiftcode`
--

INSERT INTO `tswiftcode` (`id`, `swiftcodemaster`, `swiftcode`, `company`, `comptype`, `branch`, `address`, `city`, `phone`, `status`) VALUES
(1, 'GOJKIDJA', 'GOJKIDJA', 'APLIKASI KARYA ANAK BANGSA, PT', '', '', '', 'JAKARTA', '', 'active'),
(2, 'BKKBIDJA', 'BKKBIDJA', 'BANGKOK BANK PUBLIC COMPANY LIMITED', 'Kantor Cabang Bank Asing', 'BANGKOK BANK KC JAKARTA', '', 'JAKARTA', '(021) 231-1008', 'active'),
(3, 'ANZBIDJX', 'ANZBIDJX', 'BANK ANZ INDONESIA, P.T.', 'Bank Campuran', 'ANZ PANIN KANTOR PUSAT', '', 'JAKARTA', '(021) 575-0300', 'active'),
(4, 'ARTGIDJA', 'ARTGIDJA', 'BANK ARTHA GRAHA INTERNASIONAL TBK, PT', 'Bank Devisa', 'BAG KPO SUDIRMAN', '', 'JAKARTA', '(021) 515-2168', 'active'),
(5, 'BNPAIDJA', 'BNPAIDJA', 'BANK BNP PARIBAS INDONESIA, PT', 'Bank Devisa', 'BNP PARIBAS KANTOR PUSAT', '', 'JAKARTA', '(021) 2358-6262', 'active'),
(6, 'CENAIDJA', 'CENAIDJA', 'BANK CENTRAL ASIA', 'Bank Devisa', 'BCA KANTOR PUSAT OPERASIONAL', '', 'JAKARTA', '(021) 2358-8000', 'active'),
(7, 'CTCBIDJA', 'CTCBIDJABDG', 'BANK CTBC INDONESIA, PT', 'Bank Campuran', '(BANDUNG BRANCH)', '', 'BANDUNG', '(021) 2557-8787', 'active'),
(8, 'CTCBIDJA', 'CTCBIDJA', 'BANK CTBC INDONESIA, PT', 'Bank Campuran', 'CHINATRUST KANTOR PUSAT', '', 'JAKARTA', '(021) 2557-8787', 'active'),
(9, 'CTCBIDJA', 'CTCBIDJASBY', 'BANK CTBC INDONESIA, PT', 'Bank Campuran', '(SURABAYA BRANCH)', '', 'SURABAYA', '(021) 2557-8787', 'active'),
(10, 'DBSBIDJA', 'DBSBIDJAIBD', 'BANK DBS INDONESIA, PT', 'Bank Campuran', '(JAKARTA BRANCH)', '', 'JAKARTA', '(021) 2988-5000', 'active'),
(11, 'DBSBIDJA', 'DBSBIDJA', 'BANK DBS INDONESIA, PT', 'Bank Campuran', 'DBS KANTOR PUSAT OPERASIONAL', '', 'JAKARTA', '(021) 2988-5000', 'active'),
(12, 'DBSBIDJA', 'DBSBIDJASBY', 'BANK DBS INDONESIA, PT', 'Bank Campuran', '(SYRABAYA BRANCH)', '', 'SURABAYA', '(021) 2988-5000', 'active'),
(13, 'BDKIIDJA', 'BDKIIDJA', 'BANK DKI, PT.', '', 'BANK DKI KC SYARIAH WAHID HASYIM', '', 'JAKARTA', '', 'active'),
(14, 'IAPTIDJA', 'IAPTIDJA', 'BANK INA', '', 'BANK INA KANTOR PUSAT', '', 'JAKARTA', '', 'active'),
(15, 'INDOIDJ2', 'INDOIDJ2', 'BANK INDONESIA', '', '', '', 'JAKARTA', '', 'active'),
(16, 'INDOIDJ2', 'INDOIDJ2BLN', 'BANK INDONESIA', '', '(BANK DEVISA LUAR NEGERI)', '', 'JAKARTA', '', 'active'),
(17, 'INDOIDJA', 'INDOIDJA', 'BANK INDONESIA', '', 'HEAD OFFICE', '', 'JAKARTA', '', 'active'),
(18, 'PDJGIDJA', 'PDJGIDJA', 'BANK JATENG', '', '', '', 'SEMARANG', '', 'active'),
(19, 'BMRIIDJA', 'BMRIIDJA852', 'BANK MANDIRI (PERSERO), PT', 'Bank Persero', '(BILLS PROCESSING CENTER BANDUNG)', '', 'BANDUNG', '(021) 524-5006, 524-5858, 5299-7777', 'active'),
(20, 'BMRIIDJA', 'BMRIIDJA107', 'BANK MANDIRI (PERSERO), PT', 'Bank Persero', '(BILLS PROCESSING CENTER JAKARTA)', '', 'JAKARTA', '(021) 524-5006, 524-5858, 5299-7777', 'active'),
(21, 'BMRIIDJA', 'BMRIIDJACUS', 'BANK MANDIRI (PERSERO), PT', 'Bank Persero', '(HEAD OFFICE-CUSTODIAL SERVICES)', '', 'JAKARTA', '(021) 524-5006, 524-5858, 5299-7777', 'active'),
(22, 'BMRIIDJA', 'BMRIIDJAEXM', 'BANK MANDIRI (PERSERO), PT', 'Bank Persero', '(HEAD OFFICE-EXPORT/IMPORT DEPT)', '', 'JAKARTA', '(021) 524-5006, 524-5858, 5299-7777', 'active'),
(23, 'BMRIIDJA', 'BMRIIDJASTL', 'BANK MANDIRI (PERSERO), PT', 'Bank Persero', '(HEAD OFFICE-SETTLEMENT DEPT)', '', 'JAKARTA', '(021) 524-5006, 524-5858, 5299-7777', 'active'),
(24, 'BMRIIDJA', 'BMRIIDJA', 'BANK MANDIRI (PERSERO), PT', 'Bank Persero', 'BANK MANDIRI KC JAKARTA GEDUNG PATRAJASA', '', 'JAKARTA', '(021) 524-5006, 524-5858, 5299-7777', 'active'),
(25, 'BMRIIDJA', 'BMRIIDJA853', 'BANK MANDIRI (PERSERO), PT', 'Bank Persero', '(BILLS PROCESSING CENTER MEDAN)', '', 'MEDAN', '(021) 524-5006, 524-5858, 5299-7777', 'active'),
(26, 'BMRIIDJA', 'BMRIIDJA854', 'BANK MANDIRI (PERSERO), PT', 'Bank Persero', '(BILLS PROCESSING CENTER SEMARANG)', '', 'SEMARANG', '(021) 524-5006, 524-5858, 5299-7777', 'active'),
(27, 'BMRIIDJA', 'BMRIIDJA851', 'BANK MANDIRI (PERSERO), PT', 'Bank Persero', '(BILLS PROCESSING CENTER SURABAYA)', '', 'SURABAYA', '(021) 524-5006, 524-5858, 5299-7777', 'active'),
(28, 'MEGAIDJA', 'MEGAIDJA', 'BANK MEGA PT', 'Bank Devisa', 'BANK MEGA KC JAKARTA TENDEAN', '', 'JAKARTA', '(021) 791-7500', 'active'),
(29, 'MHCCIDJA', 'MHCCIDJA', 'BANK MIZUHO INDONESIA, PT.', 'Bank Campuran', 'BANK MIZUHO KANTOR PUSAT', '', 'JAKARTA', '(021) 392-5222', 'active'),
(30, 'BNINIDJA', 'BNINIDJAABN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(AMBON BRANCH)', '', 'AMBON', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(31, 'BNINIDJA', 'BNINIDJABLG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BALIGE BRANCH)', '', 'BALIGE', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(32, 'BNINIDJA', 'BNINIDJABPN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BALIKPAPAN BRANCH)', '', 'BALIKPAPAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(33, 'BNINIDJA', 'BNINIDJAPSB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PANDANSARI BRANCH)', '', 'BALIKPAPAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(34, 'BNINIDJA', 'BNINIDJABDA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BANDA ACEH BRANCH)', '', 'BANDA ACEH', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(35, 'BNINIDJA', 'BNINIDJABDL', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BANDAR LAMPUNG BRANCH)', '', 'BANDAR LAMPUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(36, 'BNINIDJA', 'BNINIDJAAYI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(AHMAD YANI BRANCH)', '', 'BANDUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(37, 'BNINIDJA', 'BNINIDJABDG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BANDUNG BRANCH)', '', 'BANDUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(38, 'BNINIDJA', 'BNINIDJAIKB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(IKIP BANDUNG BRANCH)', '', 'BANDUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(39, 'BNINIDJA', 'BNINIDJAITB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(ITB BRANCH)', '', 'BANDUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(40, 'BNINIDJA', 'BNINIDJAJJS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JALAN JENDRAL SUDIRMAN BRANCH)', '', 'BANDUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(41, 'BNINIDJA', 'BNINIDJAJPK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JALAN PERINTIS KEMERDEKAAN BANDUNG BRANCH)', '', 'BANDUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(42, 'BNINIDJA', 'BNINIDJAUPB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(UNPAD BR. BDG.)', '', 'BANDUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(43, 'BNINIDJA', 'BNINIDJABKO', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BANGKO BRANCH)', '', 'BANGKO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(44, 'BNINIDJA', 'BNINIDJABJR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BANJAR BRANCH)', '', 'BANJAR', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(45, 'BNINIDJA', 'BNINIDJABBR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BANJARBARU BRANCH)', '', 'BANJARBARU', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(46, 'BNINIDJA', 'BNINIDJABMS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BANJARMASIN BRANCH)', '', 'BANJARMASIN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(47, 'BNINIDJA', 'BNINIDJAPAB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PANGERAN ANTASARI BRANCH)', '', 'BANJARMASIN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(48, 'BNINIDJA', 'BNINIDJABWI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BANYUWANGI BRANCH)', '', 'BANYUWANGI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(49, 'BNINIDJA', 'BNINIDJABBI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BARABAI BRANCH)', '', 'BARABAI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(50, 'BNINIDJA', 'BNINIDJABTM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BATAM BRANCH)', '', 'BATAM', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(51, 'BNINIDJA', 'BNINIDJABTR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BATURAJA BRANCH)', '', 'BATURAJA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(52, 'BNINIDJA', 'BNINIDJABAU', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BAU-BAU BRANCH)', '', 'BAU-BAU', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(53, 'BNINIDJA', 'BNINIDJABKS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BEKASI BRANCH)', '', 'BEKASI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(54, 'BNINIDJA', 'BNINIDJABLW', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BELAWAN BRANCH)', '', 'BELAWAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(55, 'BNINIDJA', 'BNINIDJABKL', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BENGKULU BRANCH)', '', 'BENGKULU', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(56, 'BNINIDJA', 'BNINIDJABIK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BIAK BRANCH)', '', 'BIAK', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(57, 'BNINIDJA', 'BNINIDJABMA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BIMA BRANCH)', '', 'BIMA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(58, 'BNINIDJA', 'BNINIDJABRN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BIREUN BRANCH)', '', 'BIREUN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(59, 'BNINIDJA', 'BNINIDJABIT', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BITUNG BRANCH)', '', 'BITUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(60, 'BNINIDJA', 'BNINIDJABLT', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BLITAR BRANCH)', '', 'BLITAR', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(61, 'BNINIDJA', 'BNINIDJABGR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BOGOR BRANCH)', '', 'BOGOR', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(62, 'BNINIDJA', 'BNINIDJABRO', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BOJONEGORO BRANCH)', '', 'BOJONEGORO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(63, 'BNINIDJA', 'BNINIDJABDO', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BONDOWOSO BRANCH)', '', 'BONDOWOSO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(64, 'BNINIDJA', 'BNINIDJABTG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BUKITTINGGI BRANCH)', '', 'BUKITTINGGI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(65, 'BNINIDJA', 'BNINIDJACPU', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(CEPU BRANCH)', '', 'CEPU', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(66, 'BNINIDJA', 'BNINIDJACAM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(CIAMIS BRANCH)', '', 'CIAMIS', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(67, 'BNINIDJA', 'BNINIDJACJR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(CIANJUR BRANCH)', '', 'CIANJUR', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(68, 'BNINIDJA', 'BNINIDJACKP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(CIKAMPEK BRANCH)', '', 'CIKAMPEK', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(69, 'BNINIDJA', 'BNINIDJACLP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(CILACAP BRANCH)', '', 'CILACAP', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(70, 'BNINIDJA', 'BNINIDJACLG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(CILEGON BRANCH)', '', 'CILEGON', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(71, 'BNINIDJA', 'BNINIDJACMI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(CIMAHI BDG. BRANCH)', '', 'CIMAHI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(72, 'BNINIDJA', 'BNINIDJACRB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(CIREBON BRANCH)', '', 'CIREBON', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(73, 'BNINIDJA', 'BNINIDJADPS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(DENPASAR BRANCH)', '', 'DENPASAR', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(74, 'BNINIDJA', 'BNINIDJARNN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(RENON BRANCH)', '', 'DENPASAR', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(75, 'BNINIDJA', 'BNINIDJAMGD', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MARGONDA BRANCH)', '', 'DEPOK', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(76, 'BNINIDJA', 'BNINIDJADLI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(DILI-EAST TIM)', '', 'DILI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(77, 'BNINIDJA', 'BNINIDJADMI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(DUMAI BRANCH)', '', 'DUMAI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(78, 'BNINIDJA', 'BNINIDJAEND', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(ENDE BR. NTT.)', '', 'ENDE', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(79, 'BNINIDJA', 'BNINIDJAGRT', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(GARUT BRANCH)', '', 'GARUT', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(80, 'BNINIDJA', 'BNINIDJAGTL', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(GORONTALO BRANCH)', '', 'GORONTALO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(81, 'BNINIDJA', 'BNINIDJAGRK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(GRESIK BRANCH)', '', 'GRESIK', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(82, 'BNINIDJA', 'BNINIDJAGST', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(GUNUNG SITOLI BRANCH)', '', 'GUNUNG SITOLI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(83, 'BNINIDJA', 'BNINIDJAIDR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(INDRAMAYU BRANCH)', '', 'INDRAMAYU', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(84, 'BNINIDJA', 'BNINIDJAHII', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(85, 'BNINIDJA', 'BNINIDJABSH', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BANDARA SUKARNO HATTA BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(86, 'BNINIDJA', 'BNINIDJADMG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(DAAN MOGOT BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(87, 'BNINIDJA', 'BNINIDJADKB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(DUKUH BAWAH LANDMARK BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(88, 'BNINIDJA', 'BNINIDJAFMI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(FATMAWATI BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(89, 'BNINIDJA', 'BNINIDJAGBR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(GAMBIR BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(90, 'BNINIDJA', 'BNINIDJAGNS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(GUNUNG SAHARI BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(91, 'BNINIDJA', 'BNINIDJAHMN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(HARMONI BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(92, 'BNINIDJA', 'BNINIDJAAPK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(HEAD OFFICE FINANCIAL ANALYSIS AND CONTROL DIVISION)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(93, 'BNINIDJA', 'BNINIDJADLN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(HEAD OFFICE INTERNATIONAL DIVISION)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(94, 'BNINIDJA', 'BNINIDJAJKT', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JAKARTA KOTA BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(95, 'BNINIDJA', 'BNINIDJAJPU', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JAKARTA PUSAT BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(96, 'BNINIDJA', 'BNINIDJAJRS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JALAN RASUNA SAID BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(97, 'BNINIDJA', 'BNINIDJAJNG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JATINEGARA BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(98, 'BNINIDJA', 'BNINIDJAKBY', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KEBAYORAN BARU BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(99, 'BNINIDJA', 'BNINIDJAKRM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KRAMAT BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(100, 'BNINIDJA', 'BNINIDJAKRK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KREKOT BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(101, 'BNINIDJA', 'BNINIDJAMDA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MANGGA DUA BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(102, 'BNINIDJA', 'BNINIDJAMTR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MATRAMAN BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(103, 'BNINIDJA', 'BNINIDJAMDT', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MEDAN MERDEKA TIMUR BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(104, 'BNINIDJA', 'BNINIDJAMTG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MENTENG BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(105, 'BNINIDJA', 'BNINIDJAMDS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MERDEKA SELATAN BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(106, 'BNINIDJA', 'BNINIDJAMHT', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MH THAMRIN BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(107, 'BNINIDJA', 'BNINIDJAPBU', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PASAR BARU BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(108, 'BNINIDJA', 'BNINIDJAPKJ', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PASAR KOJA BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(109, 'BNINIDJA', 'BNINIDJAPMK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PASAR MAYESTIK BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(110, 'BNINIDJA', 'BNINIDJAPSM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PASAR MINGGU BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(111, 'BNINIDJA', 'BNINIDJAPCG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PECENONGAN BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(112, 'BNINIDJA', 'BNINIDJAPTJ', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PETOJO BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(113, 'BNINIDJA', 'BNINIDJAPIM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PONDOK INDAH MALL BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(114, 'BNINIDJA', 'BNINIDJARPZ', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(RATU PLAZA)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(115, 'BNINIDJA', 'BNINIDJARWM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(RAWAMANGUN BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(116, 'BNINIDJA', 'BNINIDJARMA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(ROA MALAKA BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(117, 'BNINIDJA', 'BNINIDJASGI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SEMANGGI BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(118, 'BNINIDJA', 'BNINIDJASNY', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SENAYAN BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(119, 'BNINIDJA', 'BNINIDJASNN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SENEN BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(120, 'BNINIDJA', 'BNINIDJASJK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SYNDICATION DIVISION)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(121, 'BNINIDJA', 'BNINIDJATAB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TANAH ABANG BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(122, 'BNINIDJA', 'BNINIDJATPR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TANJUNG PRIOK BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(123, 'BNINIDJA', 'BNINIDJATEB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TEBET BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(124, 'BNINIDJA', 'BNINIDJATRS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TREASURY DIVISION)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(125, 'BNINIDJA', 'BNINIDJAUID', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(UI DEPOK BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(126, 'BNINIDJA', 'BNINIDJAWAM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(WISMA ARGO MANUNGGAL BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(127, 'BNINIDJA', 'BNINIDJAWEN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(WISMA EMPAT NAM BRANCH)', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(128, 'BNINIDJA', 'BNINIDJA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', 'BANK BNI KANTOR PUSAT OPERASIONAL', '', 'JAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(129, 'BNINIDJA', 'BNINIDJAJBI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JAMBI BRANCH)', '', 'JAMBI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(130, 'BNINIDJA', 'BNINIDJAJPA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JAYAPURA BRANCH)', '', 'JAYAPURA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(131, 'BNINIDJA', 'BNINIDJAJBR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JEMBER BRANCH)', '', 'JEMBER', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(132, 'BNINIDJA', 'BNINIDJAJPR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JEPARA BRANCH)', '', 'JEPARA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(133, 'BNINIDJA', 'BNINIDJAJBG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JOMBANG BRANCH)', '', 'JOMBANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(134, 'BNINIDJA', 'BNINIDJAKJH', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KABANJAHE BRANCH)', '', 'KABANJAHE', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(135, 'BNINIDJA', 'BNINIDJAKWG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KARAWANG BRANCH)', '', 'KARAWANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(136, 'BNINIDJA', 'BNINIDJAKYA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KAYU AGUNG BRANCH)', '', 'KAYU AGUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(137, 'BNINIDJA', 'BNINIDJAKBM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KEBUMEN BRANCH)', '', 'KEBUMEN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(138, 'BNINIDJA', 'BNINIDJAKDI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KEDIRI BRANCH)', '', 'KEDIRI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(139, 'BNINIDJA', 'BNINIDJAKDR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KENDARI BRANCH)', '', 'KENDARI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(140, 'BNINIDJA', 'BNINIDJAKPG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KETAPANG BRANCH)', '', 'KETAPANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(141, 'BNINIDJA', 'BNINIDJAKLA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KLATEN BRANCH)', '', 'KLATEN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(142, 'BNINIDJA', 'BNINIDJAKTU', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KOTABARU P. LAUT BRANCH)', '', 'KOTABARU PULAU LAUT', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(143, 'BNINIDJA', 'BNINIDJAKTI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KOTA BUMI BANCH)', '', 'KOTABUMI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(144, 'BNINIDJA', 'BNINIDJAKTM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KOTAMOBAGU BRANCH)', '', 'KOTAMOBAGU', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(145, 'BNINIDJA', 'BNINIDJAKTJ', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KUALA TANJUNG BRANCH)', '', 'KUALA TANJUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(146, 'BNINIDJA', 'BNINIDJAKKP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KUALAKAPUAS BRANCH)', '', 'KUALAKAPUAS', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(147, 'BNINIDJA', 'BNINIDJAKLT', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KUALATUNGKAL BRANCH)', '', 'KUALATUNGKAL', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(148, 'BNINIDJA', 'BNINIDJAKDS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KUDUS BRANCH)', '', 'KUDUS', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(149, 'BNINIDJA', 'BNINIDJAKNG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KUNINGAN BRANCH)', '', 'KUNINGAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(150, 'BNINIDJA', 'BNINIDJAKPA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KUPANG BRANCH - EAST NUSATENGGARA)', '', 'KUPANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(151, 'BNINIDJA', 'BNINIDJALGS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(LANGSA BRANCH)', '', 'LANGSA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(152, 'BNINIDJA', 'BNINIDJALGA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(LEGIAN BRANCH)', '', 'LEGIAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(153, 'BNINIDJA', 'BNINIDJALSW', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(LHOKSEUMAWE BRANCH)', '', 'LHOKSEUMAWE', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(154, 'BNINIDJA', 'BNINIDJALLG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(LUBUKLINGGAU BRANCH)', '', 'LUBUKLINGGAU', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(155, 'BNINIDJA', 'BNINIDJALMJ', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(LUMAJANG BRANCH)', '', 'LUMAJANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(156, 'BNINIDJA', 'BNINIDJALWK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(LUWUK BRANCH)', '', 'LUWUK', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(157, 'BNINIDJA', 'BNINIDJAMAD', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MADIUN BRANCH)', '', 'MADIUN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(158, 'BNINIDJA', 'BNINIDJAMGL', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MAGELANG BRANCH)', '', 'MAGELANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(159, 'BNINIDJA', 'BNINIDJAMJL', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MAJALAYA BRANCH)', '', 'MAJALAYA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(160, 'BNINIDJA', 'BNINIDJAMLG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MALANG BRANCH)', '', 'MALANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(161, 'BNINIDJA', 'BNINIDJAUBM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(UNIBRAW BR. MLG.)', '', 'MALANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(162, 'BNINIDJA', 'BNINIDJAMDO', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MANADO BRANCH)', '', 'MANADO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(163, 'BNINIDJA', 'BNINIDJAKNK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PS. KANAKA BRANCH)', '', 'MANADO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(164, 'BNINIDJA', 'BNINIDJAMWI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MANOKWARI BRANCH)', '', 'MANOKWARI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(165, 'BNINIDJA', 'BNINIDJAMTA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MATARAM BRANCH)', '', 'MATARAM', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(166, 'BNINIDJA', 'BNINIDJAMRE', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MAUMERE BRANCH)', '', 'MAUMERE', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(167, 'BNINIDJA', 'BNINIDJAJSM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JL. SUTOMO MEDAN BRANCH)', '', 'MEDAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(168, 'BNINIDJA', 'BNINIDJAMDN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MEDAN BRANCH)', '', 'MEDAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(169, 'BNINIDJA', 'BNINIDJAUSU', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(UNIV. SUMUT BRANCH)', '', 'MEDAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(170, 'BNINIDJA', 'BNINIDJAMET', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(METRO BRANCH)', '', 'METRO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(171, 'BNINIDJA', 'BNINIDJAMBO', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MEULABOH BRANCH)', '', 'MEULABOH', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(172, 'BNINIDJA', 'BNINIDJANNK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(NUNUKAN BRANCH)', '', 'NUNUKAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(173, 'BNINIDJA', 'BNINIDJAAYP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(AHMAD YANI PADANG BRANCH)', '', 'PADANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(174, 'BNINIDJA', 'BNINIDJAIBP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(IMAM BONJOL BRANCH)', '', 'PADANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(175, 'BNINIDJA', 'BNINIDJAPDG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PADANG BRANCH)', '', 'PADANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(176, 'BNINIDJA', 'BNINIDJAPDS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PADANG SIDEMPUAN BRANCH)', '', 'PADANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(177, 'BNINIDJA', 'BNINIDJAPRY', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PALANGKARAYA BRANCH)', '', 'PALANGKARAYA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(178, 'BNINIDJA', 'BNINIDJABBP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(BOOM BARU BRANCH)', '', 'PALEMBANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(179, 'BNINIDJA', 'BNINIDJAJAP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JEMBATAN AMPERA PALEMBANG BRANCH)', '', 'PALEMBANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(180, 'BNINIDJA', 'BNINIDJAMSP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MUSI PALEMBANG BRANCH)', '', 'PALEMBANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(181, 'BNINIDJA', 'BNINIDJAPBG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PALEMBANG BRANCH)', '', 'PALEMBANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(182, 'BNINIDJA', 'BNINIDJAPLP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PALOPO BRANCH)', '', 'PALOPO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(183, 'BNINIDJA', 'BNINIDJAPLU', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PALU BRANCH)', '', 'PALU', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(184, 'BNINIDJA', 'BNINIDJAPKN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PAMEKASAN BRANCH)', '', 'PAMEKASAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(185, 'BNINIDJA', 'BNINIDJAPKP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PANGKAL PINANG BRANCH)', '', 'PANGKAL PINANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(186, 'BNINIDJA', 'BNINIDJAPKB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PANGKALAN BUN BRANCH)', '', 'PANGKALAN BUN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(187, 'BNINIDJA', 'BNINIDJAPJG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PANJANG BRANCH)', '', 'PANJANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(188, 'BNINIDJA', 'BNINIDJAPRE', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PARE-PARE BRANCH)', '', 'PARE-PARE', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(189, 'BNINIDJA', 'BNINIDJAPSN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PASURUAN BRANCH)', '', 'PASURUAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(190, 'BNINIDJA', 'BNINIDJAPTI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PATI BRANCH)', '', 'PATI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(191, 'BNINIDJA', 'BNINIDJAPYK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PAYAKUMBUH BRANCH)', '', 'PAYAKUMBUH', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(192, 'BNINIDJA', 'BNINIDJAPKL', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PEKALONGAN BRANCH)', '', 'PEKALONGAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(193, 'BNINIDJA', 'BNINIDJAPPP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PASAR PUSAT PEKANBARU BRANCH)', '', 'PEKANBARU', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(194, 'BNINIDJA', 'BNINIDJAPBR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PEKANBARU BRANCH)', '', 'PEKANBARU', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(195, 'BNINIDJA', 'BNINIDJAPMT', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PEMANGKAT BRANCH)', '', 'PEMANGKAT', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(196, 'BNINIDJA', 'BNINIDJAPMS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PEMATANG SIANTAR BRANCH)', '', 'PEMATANG SIANTAR', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(197, 'BNINIDJA', 'BNINIDJAPLW', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(POLEWALI BRANCH)', '', 'POLEWALI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(198, 'BNINIDJA', 'BNINIDJAPON', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PONOROGO BRANCH)', '', 'PONOROGO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(199, 'BNINIDJA', 'BNINIDJAPNK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PONTIANAK BRANCH)', '', 'PONTIANAK', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(200, 'BNINIDJA', 'BNINIDJAPSO', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(POSO BRANCH)', '', 'POSO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(201, 'BNINIDJA', 'BNINIDJAPBM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PRABUMULIH BRANCH)', '', 'PRABUMULIH', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(202, 'BNINIDJA', 'BNINIDJAPRB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PROBOLINGGO BRANCH)', '', 'PROBOLINGGO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(203, 'BNINIDJA', 'BNINIDJAPBL', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PURBALINGGA BRANCH)', '', 'PURBALINGGA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(204, 'BNINIDJA', 'BNINIDJAPWK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PURWAKARTA BRANCH)', '', 'PURWAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(205, 'BNINIDJA', 'BNINIDJAPWO', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PURWOKERTO BRANCH)', '', 'PURWOKERTO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(206, 'BNINIDJA', 'BNINIDJAPWR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PURWOREJO BRANCH)', '', 'PURWOKERTO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(207, 'BNINIDJA', 'BNINIDJARKB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(RANGKASBITUNG BRANCH)', '', 'RANGKAS BIBITUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(208, 'BNINIDJA', 'BNINIDJARGT', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(RENGAT BRANCH)', '', 'RENGAT', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(209, 'BNINIDJA', 'BNINIDJASLG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SALATIGA BRANCH)', '', 'SALATIGA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(210, 'BNINIDJA', 'BNINIDJASMD', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SAMARINDA BRANCH)', '', 'SAMARINDA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(211, 'BNINIDJA', 'BNINIDJASPT', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SAMPIT BRANCH)', '', 'SAMPIT', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(212, 'BNINIDJA', 'BNINIDJASLP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SELAT PANJANG BRANCH)', '', 'SELAT PANJANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(213, 'BNINIDJA', 'BNINIDJAKRU', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KARANGAYU BRANCH)', '', 'SEMARANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(214, 'BNINIDJA', 'BNINIDJASMG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SEMARANG BRANCH)', '', 'SEMARANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(215, 'BNINIDJA', 'BNINIDJAUDS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(UNDIP BR. SMG.)', '', 'SEMARANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(216, 'BNINIDJA', 'BNINIDJASKG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SENGKANG BRANCH)', '', 'SENGKANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(217, 'BNINIDJA', 'BNINIDJASRG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SERANG BRANCH)', '', 'SERANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(218, 'BNINIDJA', 'BNINIDJASBG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SIBOLGA BRANCH)', '', 'SIBOLGA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(219, 'BNINIDJA', 'BNINIDJASDA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SIDOARJO BRANCH)', '', 'SIDOARJO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(220, 'BNINIDJA', 'BNINIDJASGL', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SIGLI BRANCH)', '', 'SIGLI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(221, 'BNINIDJA', 'BNINIDJASGR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SINGARAJA BRANCH)', '', 'SINGARAJA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(222, 'BNINIDJA', 'BNINIDJASKW', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SINGKAWANG BRANCH)', '', 'SINGKAWANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(223, 'BNINIDJA', 'BNINIDJASTB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SITUBONDO BRANCH)', '', 'SITUBONDO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(224, 'BNINIDJA', 'BNINIDJASOR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SORONG BRANCH)', '', 'SORONG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(225, 'BNINIDJA', 'BNINIDJASUB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SUBANG BRANCH)', '', 'SUBANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(226, 'BNINIDJA', 'BNINIDJASKM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SUKABUMI BRANCH)', '', 'SUKABUMI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(227, 'BNINIDJA', 'BNINIDJASBW', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SUMBAWA BESAR BRANCH)', '', 'SUMBAWA BESAR', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(228, 'BNINIDJA', 'BNINIDJASDG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SUMEDANG BRANCH)', '', 'SUMEDANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(229, 'BNINIDJA', 'BNINIDJASMP', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SUMENEP BRANCH)', '', 'SUMENEP', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(230, 'BNINIDJA', 'BNINIDJASPN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SUNGAIPENUH BRANCH)', '', 'SUNGAIPENUH', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(231, 'BNINIDJA', 'BNINIDJAUAS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(AIRLANGGA UNIVERSITY BRANCH)', '', 'SURABAYA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(232, 'BNINIDJA', 'BNINIDJAJTM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(JEMBATAN MERAH BRANCH)', '', 'SURABAYA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(233, 'BNINIDJA', 'BNINIDJAKBS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(KUSUMA BANGSA BRANCH)', '', 'SURABAYA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(234, 'BNINIDJA', 'BNINIDJASBY', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SURABAYA BRANCH)', '', 'SURABAYA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(235, 'BNINIDJA', 'BNINIDJATPK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TANJUNG PERAK BRANCH)', '', 'SURABAYA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(236, 'BNINIDJA', 'BNINIDJAUSM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(URIP SUMOHARJO BRANCH)', '', 'SURABAYA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(237, 'BNINIDJA', 'BNINIDJAPKS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(PASAR KLEWER SURAKARTA BRANCH)', '', 'SURAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(238, 'BNINIDJA', 'BNINIDJASLO', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(SURAKARTA BRANCH)', '', 'SURAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(239, 'BNINIDJA', 'BNINIDJASMR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(UNIV.SEBELAS MARET BRANCH)', '', 'SURAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(240, 'BNINIDJA', 'BNINIDJATHN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TAHUNA BRANCH)', '', 'TAHUNA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(241, 'BNINIDJA', 'BNINIDJATRG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TANGERANG BRANCH)', '', 'TANGERANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(242, 'BNINIDJA', 'BNINIDJATKR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TANJUNG KARANG BRANCH)', '', 'TANJUNG KARANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(243, 'BNINIDJA', 'BNINIDJATPN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TANJUNG PINANG BRANCH)', '', 'TANJUNG PINANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(244, 'BNINIDJA', 'BNINIDJATRB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TANJUNGREDEB BRANCH)', '', 'TANJUNGREDEB', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(245, 'BNINIDJA', 'BNINIDJATRN', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TARAKAN BRANCH)', '', 'TARAKAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(246, 'BNINIDJA', 'BNINIDJATMA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TASIKMALAYA BRANCH)', '', 'TASIKMALAYA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(247, 'BNINIDJA', 'BNINIDJATTI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TEBINGTINGGI BRANCH)', '', 'TEBING TINGGI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(248, 'BNINIDJA', 'BNINIDJATGL', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TEGAL BRANCH)', '', 'TEGAL', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(249, 'BNINIDJA', 'BNINIDJATMG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TEMANGGUNG BRANCH)', '', 'TEMANGGUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(250, 'BNINIDJA', 'BNINIDJATBH', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TEMBILAHAN BRANCH)', '', 'TEMBILAHAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(251, 'BNINIDJA', 'BNINIDJATNT', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TERNATE BRANCH)', '', 'TERNATE', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(252, 'BNINIDJA', 'BNINIDJATBK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TANJUNG BALAI KARIMUN BRANCH)', '', 'TG. BALAI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(253, 'BNINIDJA', 'BNINIDJATBA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TG. BALAI ASAHAN)', '', 'TG. BALAI ASAHAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(254, 'BNINIDJA', 'BNINIDJATBL', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TOBELO BRANCH)', '', 'TOBELO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(255, 'BNINIDJA', 'BNINIDJATLI', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TOLI-TOLI BRANCH)', '', 'TOLI-TOLI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(256, 'BNINIDJA', 'BNINIDJATUB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TUBAN BRANCH - EAST JAVA)', '', 'TUBAN', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(257, 'BNINIDJA', 'BNINIDJATLA', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(TULUNGAGUNG)', '', 'TULUNGAGUNG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(258, 'BNINIDJA', 'BNINIDJAMAT', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(MATTOANGIN BRANCH)', '', 'UJUNG PANDANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(259, 'BNINIDJA', 'BNINIDJAUPG', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(UJUNG PANDANG BRANCH)', '', 'UJUNG PANDANG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(260, 'BNINIDJA', 'BNINIDJAWTS', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(WATANSOPPENG BRANCH)', '', 'WATANSOPPENG', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(261, 'BNINIDJA', 'BNINIDJAWGR', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(WONOGIRI BRANCH)', '', 'WONOGIRI', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(262, 'BNINIDJA', 'BNINIDJAWNK', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(WONOKROMO BRANCH)', '', 'WONOKROMO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(263, 'BNINIDJA', 'BNINIDJAWSB', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(WONOSOBO BRANCH)', '', 'WONOSOBO', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(264, 'BNINIDJA', 'BNINIDJAUGM', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(UGM BRANCH)', '', 'YOGYAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(265, 'BNINIDJA', 'BNINIDJAYGY', 'BANK NEGARA INDONESIA - PT (PERSERO)', 'Bank Persero', '(YOGYAKARTA BRANCH)', '', 'YOGYAKARTA', '(021) 251-1218/19/20/22/24/25/26/29', 'active'),
(266, 'BOFAID2X', 'BOFAID2XGRC', 'BANK OF AMERICA, N.A. JAKARTA BRANCH', 'Kantor Cabang Bank Asing', '', '', 'JAKARTA', '(021) 2955-3700', 'active'),
(267, 'BOFAID2X', 'BOFAID2X', 'BANK OF AMERICA, N.A. JAKARTA BRANCH', 'Kantor Cabang Bank Asing', 'BOA KC JAKARTA', '', 'JAKARTA', '(021) 2955-3700', 'active'),
(268, 'BKCHIDJA', 'BKCHIDJA', 'BANK OF CHINA, JAKARTA BRANCH', 'Kantor Cabang Bank Asing', '', '', 'JAKARTA', '(021) 520-5502', 'active'),
(269, 'BPIAIDJA', 'BPIAIDJA', 'BANK RESONA PERDANIA PT.', 'Bank Devisa', 'BANK RESONA KANTOR PUSAT', '', 'JAKARTA', '(021) 570-1958', 'active'),
(270, 'SBJKIDJA', 'SBJKIDJA', 'BANK SINARMAS', 'Bank Devisa', 'KANTOR PUSAT', '', 'JAKARTA', '(021) 3199-0101', 'active'),
(271, 'BTANIDJA', 'BTANIDJA', 'BANK TABUNGAN NEGARA (PERSERO), PT.', 'Bank Persero', '(HEAD OFFICE)', '', 'JAKARTA', '(021) 231-0490, 633-6789, 2653-3555', 'active'),
(272, 'CITIIDJX', 'CITIIDJXBDG', 'CITIBANK, N.A.', 'Kantor Cabang Bank Asing', 'CITIBANK KC BANDUNG', '', 'BANDUNG', '(021) 5290-8327', 'active'),
(273, 'CITIIDJX', 'CITIIDJX', 'CITIBANK, N.A.', 'Kantor Cabang Bank Asing', 'CITIBANK KC JAKARTA', '', 'JAKARTA', '(021) 5290-8327', 'active'),
(274, 'CITIIDJX', 'CITIIDJXMDN', 'CITIBANK, N.A.', 'Kantor Cabang Bank Asing', 'CITIBANK KC MEDAN', '', 'MEDAN', '(021) 5290-8327', 'active'),
(275, 'CITIIDJX', 'CITIIDJXSBY', 'CITIBANK, N.A.', 'Kantor Cabang Bank Asing', 'CITIBANK KC SURABAYA', '', 'SURABAYA', '(021) 5290-8327', 'active'),
(276, 'DEUTIDJA', 'DEUTIDJAIBO', 'DEUTSCHE BANK AG', 'Kantor Cabang Bank Asing', '(DBJK INVESTMENT BANKING OPS)', '', 'JAKARTA', '(021) 2964-4401', 'active'),
(277, 'DEUTIDJA', 'DEUTIDJADSI', 'DEUTSCHE BANK AG', 'Kantor Cabang Bank Asing', '(DEUTSCHE SECURITIES INDONESIA)', '', 'JAKARTA', '(021) 2964-4401', 'active'),
(278, 'DEUTIDJA', 'DEUTIDJA', 'DEUTSCHE BANK AG', 'Kantor Cabang Bank Asing', 'DEUTSCHE BANK KC JAKARTA', '', 'JAKARTA', '(021) 2964-4401', 'active'),
(279, 'BEXIIDJA', 'BEXIIDJA', 'INDONESIA EXIMBANK', '', 'BEI KANTOR PUSAT', '', 'JAKARTA', '', 'active'),
(280, 'CHASIDJX', 'CHASIDJXENQ', 'JPMORGAN CHASE BANK, N.A., JAKARTA BRANCH', 'Kantor Cabang Bank Asing', '(TELEX AND S.W.I.F.T. MESSAGE ENQUIRIES)', '', 'JAKARTA', '(021) 5291-8000', 'active'),
(281, 'CHASIDJX', 'CHASIDJX', 'JPMORGAN CHASE BANK, N.A., JAKARTA BRANCH', 'Kantor Cabang Bank Asing', 'JPMORGAN BANK KC JAKARTA', '', 'JAKARTA', '(021) 5291-8000', 'active'),
(282, 'KSEIIDJA', 'KSEIIDJA', 'KUSTODIAN SENTRAL EFEK INDONESIA PT', '', '', '', 'JAKARTA', '', 'active'),
(283, 'BOTKIDJX', 'BOTKIDJX', 'MUFG BANK, LTD. JAKARTA BRANCH', 'Kantor Cabang Bank Asing', '(JAKARTA BRANCH)', '', 'JAKARTA', '(021) 570-6185, 570-5177, 570-3955', 'active'),
(284, 'BMSEIDJA', 'BMSEIDJA', 'P.T. BANK MULTI ARTA SENTOSA', '', 'MULTIARTA KANTOR PUSAT', '', 'JAKARTA', '', 'active'),
(285, 'DADIIDJA', 'DADIIDJA', 'P.T. MERCEDES-BENZ DISTRIBUTION INDONESIA', '', '', '', 'JAKARTA', '', 'active'),
(286, 'DABEIDJA', 'DABEIDJA', 'P.T. MERCEDES-BENZ INDONESIA', '', '', '', 'JAKARTA', '', 'active'),
(287, 'PINBIDJA', 'PINBIDJA', 'PAN INDONESIA BANK PT.', 'Bank Devisa', 'PANIN BANK KANTOR PUSAT OPERASIONAL', '', 'JAKARTA', '(021) 270-0545, 573-5555, 539-5066', 'active'),
(288, 'AIACIDJA', 'AIACIDJA', 'PT AIA FINANCIAL', '', '', '', 'JAKARTA', '', 'active'),
(289, 'BRISIDJA', 'BRISIDJA', 'PT BANK BRISYARIAH', 'Bank Non Devisa', 'JASA ARTHA KANTOR PUSAT', '', 'JAKARTA', '(021) 345-0226, 345-0227', 'active'),
(290, 'SUNIIDJA', 'SUNIIDJA', 'PT BANK BTPN TBK', 'Bank Campuran', 'SUMITOMO KC JAKARTA', '', 'JAKARTA', '(021) 522-7011', 'active'),
(291, 'BBAIIDJA', 'BBAIIDJA', 'PT BANK BUMI ARTA TBK', 'Bank Devisa', 'BBA KANTOR PUSAT', '', 'JAKARTA', '(021) 230-0893, 230-0455', 'active'),
(292, 'BCIAIDJA', 'BCIAIDJA', 'PT BANK CAPITAL INDONESIA, TBK', 'Bank Devisa', 'BANK CAPITAL KANTOR PUSAT', '', 'JAKARTA', '(021) 252-0234, 252-0345, 250-6768', 'active'),
(293, 'BWKIIDJA', 'BWKIIDJA', 'PT BANK CHINA CONSTRUCTION BANK INDONESIA TBK', 'Bank Devisa', 'BWK KANTOR PUSAT', '', 'JAKARTA', '(021) 5140-1707', 'active'),
(294, 'HSBCIDJA', 'HSBCIDJABAN', 'PT BANK HSBC INDONESIA', 'Kantor Cabang Bank Asing', 'HSBC KC BANDUNG', '', 'BANDUNG', '(021) 5246-2222', 'active'),
(295, 'HSBCIDJA', 'HSBCIDJABAT', 'PT BANK HSBC INDONESIA', 'Kantor Cabang Bank Asing', 'HSBC KC BATAM', '', 'BATAM', '(021) 5246-2222', 'active');
INSERT INTO `tswiftcode` (`id`, `swiftcodemaster`, `swiftcode`, `company`, `comptype`, `branch`, `address`, `city`, `phone`, `status`) VALUES
(296, 'HSBCIDJA', 'HSBCIDJADCC', 'PT BANK HSBC INDONESIA', 'Kantor Cabang Bank Asing', '(HSS DCC INDONESIA)', '', 'JAKARTA', '(021) 5246-2222', 'active'),
(297, 'HSBCIDJA', 'HSBCIDJAWBS', 'PT BANK HSBC INDONESIA', 'Kantor Cabang Bank Asing', '(WEALTH BUSINESS SERVICES)', '', 'JAKARTA', '(021) 5246-2222', 'active'),
(298, 'HSBCIDJA', 'HSBCIDJA', 'PT BANK HSBC INDONESIA', 'Kantor Cabang Bank Asing', 'BANK EKONOMI KANTOR PUSAT', '', 'JAKARTA', '(021) 5246-2222', 'active'),
(299, 'HSBCIDJA', 'HSBCIDJAMDN', 'PT BANK HSBC INDONESIA', 'Kantor Cabang Bank Asing', 'HSBC KC MEDAN', '', 'MEDAN', '(021) 5246-2222', 'active'),
(300, 'HSBCIDJA', 'HSBCIDJASEM', 'PT BANK HSBC INDONESIA', 'Kantor Cabang Bank Asing', 'HSBC KC SEMARANG', '', 'SEMARANG', '(021) 5246-2222', 'active'),
(301, 'HSBCIDJA', 'HSBCIDJASBA', 'PT BANK HSBC INDONESIA', 'Kantor Cabang Bank Asing', 'HSBC KC SURABAYA', '', 'SURABAYA', '(021) 5246-2222', 'active'),
(302, 'IBKOIDJA', 'IBKOIDJA', 'PT BANK IBK INDONESIA TBK', '', '', '', 'JAKARTA', '', 'active'),
(303, 'ICBKIDJA', 'ICBKIDJA', 'PT BANK ICBC INDONESIA', 'Bank Devisa', 'KC THE CITY TOWER', '', 'JAKARTA', '(021) 2355-6000', 'active'),
(304, 'BIDXIDJA', 'BIDXIDJA', 'PT BANK INDEX SELINDO', 'Bank Devisa', 'BANK INDEX KC BOGOR', '', 'JAKARTA', '(021) 392-2328', 'active'),
(305, 'IBBKIDJA', 'IBBKIDJADEX', 'PT BANK MAYBANK INDONESIA TBK', 'Bank Devisa', '(EXPEND CONTROL DEPT.)', '', 'JAKARTA', '(021) 2922-8888', 'active'),
(306, 'IBBKIDJA', 'IBBKIDJA138', 'PT BANK MAYBANK INDONESIA TBK', 'Bank Devisa', '(JUANDA BRANCH)', '', 'JAKARTA', '(021) 2922-8888', 'active'),
(307, 'IBBKIDJA', 'IBBKIDJA001', 'PT BANK MAYBANK INDONESIA TBK', 'Bank Devisa', '(KALIBESAR BRANCH)', '', 'JAKARTA', '(021) 2922-8888', 'active'),
(308, 'IBBKIDJA', 'IBBKIDJA008', 'PT BANK MAYBANK INDONESIA TBK', 'Bank Devisa', '(PANGLIMA POLIM BRANCH)', '', 'JAKARTA', '(021) 2922-8888', 'active'),
(309, 'IBBKIDJA', 'IBBKIDJA003', 'PT BANK MAYBANK INDONESIA TBK', 'Bank Devisa', '(THAMRIN BRANCH)', '', 'JAKARTA', '(021) 2922-8888', 'active'),
(310, 'IBBKIDJA', 'IBBKIDJATRS', 'PT BANK MAYBANK INDONESIA TBK', 'Bank Devisa', '(UUS TREASURY)', '', 'JAKARTA', '(021) 2922-8888', 'active'),
(311, 'IBBKIDJA', 'IBBKIDJA', 'PT BANK MAYBANK INDONESIA TBK', 'Bank Devisa', 'BII KANTOR PUSAT OPERASIONAL', '', 'JAKARTA', '(021) 2922-8888', 'active'),
(312, 'BMDMIDJA', 'BMDMIDJA', 'PT BANK MESTIKA DHARMA TBK', 'Bank Devisa', 'BANK MESTIKA KANTOR PUSAT', '', 'MEDAN', '(061) 452-5800, 456-0991/5500', 'active'),
(313, 'NISPIDJA', 'NISPIDJA', 'PT BANK OCBC NISP TBK', 'Bank Devisa', 'BANK NISP KC SEMARANG', '', 'JAKARTA', '(021) 2553-3888', 'active'),
(314, 'PNBSIDJA', 'PNBSIDJA', 'PT BANK PANIN DUBAI SYARIAH, TBK', '', '', '', 'JAKARTA', '', 'active'),
(315, 'BBBAIDJA', 'BBBAIDJA', 'PT BANK PERMATA, TBK', 'Bank Devisa', 'BANK PERMATA KC BINTARO - TANGERANG', '', 'JAKARTA', '(021) 523-7788', 'active'),
(316, 'AWANIDJA', 'AWANIDJA', 'PT BANK QNB INDONESIA TBK', 'Bank Devisa', 'BANK KESAWAN KANTOR PUSAT OPERASIONAL', '', 'JAKARTA', '(021) 515-5155', 'active'),
(317, 'PDRIIDJA', 'PDRIIDJA', 'PT BANK RIAU KEPRI', '', '', '', 'PEKANBARU', '', 'active'),
(318, 'PDWSIDJA', 'PDWSIDJA', 'PT BANK SULSELBAR', '', '', '', 'MAKASSAR', '', 'active'),
(319, 'BSMDIDJA', 'BSMDIDJA', 'PT BANK SYARIAH MANDIRI', 'Bank Devisa', 'BSM KANTOR PUSAT', '', 'JAKARTA', '(021) 230-0509, 3983-9000', 'active'),
(320, 'BBIJIDJA', 'BBIJIDJA004', 'PT BANK UOB INDONESIA', 'Bank Devisa', 'BANK UOB KC BANDUNG', '', 'BANDUNG', '(021) 2350-6000', 'active'),
(321, 'BBIJIDJA', 'BBIJIDJA', 'PT BANK UOB INDONESIA', 'Bank Devisa', 'BANK UOB KANTOR PUSAT', '', 'JAKARTA', '(021) 2350-6000', 'active'),
(322, 'BBIJIDJA', 'BBIJIDJA002', 'PT BANK UOB INDONESIA', 'Bank Devisa', 'BANK UOB KC MEDAN', '', 'MEDAN', '(021) 2350-6000', 'active'),
(323, 'BBIJIDJA', 'BBIJIDJA003', 'PT BANK UOB INDONESIA', 'Bank Devisa', 'BANK UOB KC SURABAYA', '', 'SURABAYA', '(021) 2350-6000', 'active'),
(324, 'GOPYIDJA', 'GOPYIDJA', 'PT DOMPET ANAK BANGSA', '', '', '', 'JAKARTA', '', 'active'),
(325, 'KISIIDJ2', 'KISIIDJ2', 'PT KOREA INVESTMENT AND SEKURITAS INDONESIA', '', '', '', 'JAKARTA', '', 'active'),
(326, 'TRVIIDJA', 'TRVIIDJA', 'PT TRAVELOKA INDONESIA', '', '', '', 'JAKARTA', '', 'active'),
(327, 'SBWIIDJ2', 'SBWIIDJ2', 'PT UBS SECURITIES INDONESIA', '', '', '', 'JAKARTA', '', 'active'),
(328, 'AMTAIDJ2', 'AMTAIDJ2', 'PT. AMANAH ANTAR ARTA', '', '', '', 'CIREBON', '', 'active'),
(329, 'SYNIIDJA', 'SYNIIDJA', 'PT. BANK BNI SYARIAH', '', 'Fatmawati', '', 'JAKARTA', '', 'active'),
(330, 'BBUKIDJA', 'BBUKIDJA', 'PT. BANK BUKOPIN, TBK', 'Bank Devisa', 'BUKOPIN KANTOR PUSAT OPERASI', '', 'JAKARTA', '(021) 798-9837, 798-8266', 'active'),
(331, 'BNIAIDJA', 'BNIAIDJAGMA', 'PT. BANK CIMB NIAGA, TBK.', 'Bank Devisa', '(GAJAH MADA REGIONAL OFFICE)', '', 'JAKARTA', '(021) 250-5151, 250-5252, 250-5353', 'active'),
(332, 'BNIAIDJA', 'BNIAIDJA', 'PT. BANK CIMB NIAGA, TBK.', 'Bank Devisa', '(HEAD OFFICE OPERATION)', '', 'JAKARTA', '(021) 250-5151, 250-5252, 250-5353', 'active'),
(333, 'BNIAIDJA', 'BNIAIDJATHM', 'PT. BANK CIMB NIAGA, TBK.', 'Bank Devisa', '(THAMRIN BRANCH)', '', 'JAKARTA', '(021) 250-5151, 250-5252, 250-5353', 'active'),
(334, 'BNIAIDJA', 'BNIAIDJASMG', 'PT. BANK CIMB NIAGA, TBK.', 'Bank Devisa', '(SEMARANG BRANCH)', '', 'SEMARANG', '(021) 250-5151, 250-5252, 250-5353', 'active'),
(335, 'BNIAIDJA', 'BNIAIDJATUN', 'PT. BANK CIMB NIAGA, TBK.', 'Bank Devisa', '(TUNUNGAN BRANCH)', '', 'SURABAYA', '(021) 250-5151, 250-5252, 250-5353', 'active'),
(336, 'BICNIDJA', 'BICNIDJA', 'PT. BANK COMMONWEALTH', 'Bank Devisa', 'COMMENWEALTH KANTOR PUSAT', '', 'JAKARTA', '(021) 2554-9500', 'active'),
(337, 'BDINIDJA', 'BDINIDJABPN', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(L/C DEPARTMENT)', '', 'BALIKPAPAN', '(021) 5799-1001 s/d 1003', 'active'),
(338, 'BDINIDJA', 'BDINIDJAOTI', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(BANDUNG OTISTA BRANCH)', '', 'BANDUNG', '(021) 5799-1001 s/d 1003', 'active'),
(339, 'BDINIDJA', 'BDINIDJACLC', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(CORPORATE LC PROCESSING CENTRE)', '', 'JAKARTA', '(021) 5799-1001 s/d 1003', 'active'),
(340, 'BDINIDJA', 'BDINIDJACUS', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(CUSTODIAL SERVICES)', '', 'JAKARTA', '(021) 5799-1001 s/d 1003', 'active'),
(341, 'BDINIDJA', 'BDINIDJAIFI', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(FINANCIAL INSTITUTIONS CORRESPONDENT BANKING)', '', 'JAKARTA', '(021) 5799-1001 s/d 1003', 'active'),
(342, 'BDINIDJA', 'BDINIDJARMT', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(INTERNATIONAL REMITTANCE)', '', 'JAKARTA', '(021) 5799-1001 s/d 1003', 'active'),
(343, 'BDINIDJA', 'BDINIDJAMKS', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(L/C PROCESSING CENTER - MAKASSAR)', '', 'JAKARTA', '(021) 5799-1001 s/d 1003', 'active'),
(344, 'BDINIDJA', 'BDINIDJALCC', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(LC CENTRE)', '', 'JAKARTA', '(021) 5799-1001 s/d 1003', 'active'),
(345, 'BDINIDJA', 'BDINIDJATPC', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(TRANSACTIONS PROCESSING CENTRE)', '', 'JAKARTA', '(021) 5799-1001 s/d 1003', 'active'),
(346, 'BDINIDJA', 'BDINIDJATRS', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(TREASURY OPERATIONS)', '', 'JAKARTA', '(021) 5799-1001 s/d 1003', 'active'),
(347, 'BDINIDJA', 'BDINIDJA', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', 'BANK DANAMON KC JKT-RASUNA SAID', '', 'JAKARTA', '(021) 5799-1001 s/d 1003', 'active'),
(348, 'BDINIDJA', 'BDINIDJAMIM', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(MEDAN-ISKANDARMUDA BRANCH)', '', 'MEDAN', '(021) 5799-1001 s/d 1003', 'active'),
(349, 'BDINIDJA', 'BDINIDJAMRK', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(L/C DEPARTMENT-MEARUKE)', '', 'MERAUKE', '(021) 5799-1001 s/d 1003', 'active'),
(350, 'BDINIDJA', 'BDINIDJASPM', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(SEMARANG PEMUDA BRANCH)', '', 'SEMARANG', '(021) 5799-1001 s/d 1003', 'active'),
(351, 'BDINIDJA', 'BDINIDJASSR', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(SOLO SRATEN BRANCH)', '', 'SOLO', '(021) 5799-1001 s/d 1003', 'active'),
(352, 'BDINIDJA', 'BDINIDJASBY', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(L/C PROCESSING CENTRE SURABAYA)', '', 'SURABAYA', '(021) 5799-1001 s/d 1003', 'active'),
(353, 'BDINIDJA', 'BDINIDJATJP', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(LC DEPARTMENT)', '', 'TANJUNG PINANG', '(021) 5799-1001 s/d 1003', 'active'),
(354, 'BDINIDJA', 'BDINIDJAYGY', 'PT. BANK DANAMON INDONESIA, TBK', 'Bank Devisa', '(L/C DEPARTMENT-YOGYAKARTA)', '', 'YOGYAKARTA', '(021) 5799-1001 s/d 1003', 'active'),
(355, 'GNESIDJA', 'GNESIDJA', 'PT. BANK GANESHA', 'Bank Devisa', 'BANK GANESHA KPO', '', 'JAKARTA', '(021) 385-5345, 385-5888', 'active'),
(356, 'BJTMIDJA', 'BJTMIDJA', 'PT. BANK JATIM', 'Bank Pembangunan Daerah dan Bank Devisa', 'BANK JATIM KC UTAMA SBY', '', 'SURABAYA', '(031) 531-0090 s/d 99', 'active'),
(357, 'CICTIDJA', 'CICTIDJA', 'PT. BANK JTRUST INDONESIA TBK', 'Bank Devisa', '', '', 'JAKARTA', '(021) 2926-1111', 'active'),
(358, 'HNBNIDJA', 'HNBNIDJA', 'PT. BANK KEB HANA INDONESIA', 'Bank Devisa', '', '', 'JAKARTA', '(021) 522-0222, 522-0223', 'active'),
(359, 'MASDIDJS', 'MASDIDJS', 'PT. BANK MASPION INDONESIA', '', 'BANK MASPION KANTOR PUSAT', '', 'SURABAYA', '', 'active'),
(360, 'MAYAIDJA', 'MAYAIDJA', 'PT. BANK MAYAPADA INTERNATIONAL TBK', 'Bank Devisa', 'BANK MAYAPADA KANTOR PUSAT', '', 'JAKARTA', '(021) 521-2288, 521-2300', 'active'),
(361, 'MAYOIDJA', 'MAYOIDJA', 'PT. BANK MAYORA', 'Bank Non Devisa', 'BANK MAYORA KANTOR PUSAT', '', 'JAKARTA', '(021) 565-5287/88', 'active'),
(362, 'BMSIIDJA', 'BMSIIDJA', 'PT. BANK MEGA SYARIAH', '', 'BANK SYARIAH MEGA KC UTAMA', '', 'JAKARTA', '', 'active'),
(363, 'MUABIDJA', 'MUABIDJA', 'PT. BANK MUAMALAT INDONESIA , TBK', 'Bank Devisa', 'BANK MUAMALAT KANTOR PUSAT', '', 'JAKARTA', '(021) 251-1414, 251-1451, 251-1465', 'active'),
(364, 'NOBUIDJA', 'NOBUIDJA', 'PT. BANK NATIONALNOBU', 'Bank Devisa', 'BANK ALFINDO KANTOR PUSAT', '', 'JAKARTA', '(021) 2553-5128', 'active'),
(365, 'BKIDIDJA', 'BKIDIDJA', 'PT. BANK OF INDIA INDONESIA,TBK', 'Bank Devisa', 'BANK SWADESI KANTOR PUSAT', '', 'JAKARTA', '(021) 350-0007', 'active'),
(366, 'ABALIDBS', 'ABALIDBS', 'PT. BANK PEMBANGUNAN DAERAH BALI', 'Bank Pembangunan Daerah dan Bank Devisa', 'KANTOR PUSAT', '', 'DENPASAR', '(0361) 223-301 s/d 05', 'active'),
(367, 'PDJBIDJA', 'PDJBIDJA', 'PT. BANK PEMBANGUNAN DAERAH JAWA BARAT DAN BANTEN, TBK', 'Bank Pembangunan Daerah dan Bank Devisa', '', '', 'BANDUNG', '(022) 423-4868, 423-0223', 'active'),
(368, 'PDKTIDJA', 'PDKTIDJA', 'PT. BANK PEMBANGUNAN DAERAH KALIMANTAN TIMUR DAN KALIMANTAN UTARA', 'Bank Pembangunan Daerah dan Bank Devisa', '', '', 'SAMARINDA', '(0541) 735-500, 739-563 s/d 567', 'active'),
(369, 'BSSPIDSP', 'BSSPIDSP', 'PT. BANK PEMBANGUNAN DAERAH SUMATERA SELATAN', 'Bank Pembangunan Daerah dan Bank Devisa', '', '', 'PALEMBANG', '(0711) 522-8080', 'active'),
(370, 'BRINIDJA', 'BRINIDJA001', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(AMBON BRANCH)', '', 'AMBON', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(371, 'BRINIDJA', 'BRINIDJA002', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(BAGAN SIAPI-API BRANCH)', '', 'BAGAN SIAPI-API', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(372, 'BRINIDJA', 'BRINIDJA037', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(BANDA ACEH BRANCH)', '', 'BANDA ACEH', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(373, 'BRINIDJA', 'BRINIDJA005', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(ASIA AFRIKA BRANCH)', '', 'BANDUNG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(374, 'BRINIDJA', 'BRINIDJA286', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(DEWI SARTIKA BRANCH)', '', 'BANDUNG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(375, 'BRINIDJA', 'BRINIDJA003', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(BANJARMASIN BRANCH)', '', 'BANJARMASIN', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(376, 'BRINIDJA', 'BRINIDJA331', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(BATAM BRANCH)', '', 'BATAM', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(377, 'BRINIDJA', 'BRINIDJA189', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(BENGKALIS BRANCH)', '', 'BENGKALIS', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(378, 'BRINIDJA', 'BRINIDJA308', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(BIAK BRANCH)', '', 'BIAK', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(379, 'BRINIDJA', 'BRINIDJA333', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(BONTANG BRANCH)', '', 'BONTANG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(380, 'BRINIDJA', 'BRINIDJA107', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(CIREBON BRANCH)', '', 'CIREBON', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(381, 'BRINIDJA', 'BRINIDJA317', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(DILI BRANCH)', '', 'DILI', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(382, 'BRINIDJA', 'BRINIDJA159', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(DUMAI BRANCH)', '', 'DUMAI', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(383, 'BRINIDJA', 'BRINIDJA026', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(GRESIK BRANCH)', '', 'GRESIK', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(384, 'BRINIDJA', 'BRINIDJATRY', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(385, 'BRINIDJA', 'BRINIDJACUS', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(CUSTODIAN BRI)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(386, 'BRINIDJA', 'BRINIDJA230', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(CUT MUTIAH BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(387, 'BRINIDJA', 'BRINIDJA330', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(FATMAWATI BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(388, 'BRINIDJA', 'BRINIDJA359', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(GATOT SUBROTO BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(389, 'BRINIDJA', 'BRINIDJA332', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(HAYAM WURUK BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(390, 'BRINIDJA', 'BRINIDJA019', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(JAKARTA KOTA BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(391, 'BRINIDJA', 'BRINIDJA122', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(JATINEGARA BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(392, 'BRINIDJA', 'BRINIDJA206', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(KCK - SPECIAL BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(393, 'BRINIDJA', 'BRINIDJA193', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(KEBAYORAN BARU BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(394, 'BRINIDJA', 'BRINIDJA335', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(KRAMAT BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(395, 'BRINIDJA', 'BRINIDJA261', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(KREKOT BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(396, 'BRINIDJA', 'BRINIDJA340', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(OTISTA BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(397, 'BRINIDJA', 'BRINIDJA346', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(PASAR PAGI BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(398, 'BRINIDJA', 'BRINIDJA338', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(ROXI BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(399, 'BRINIDJA', 'BRINIDJA018', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TANAH ABANG BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(400, 'BRINIDJA', 'BRINIDJA186', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TANJUNG PRIOK BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(401, 'BRINIDJA', 'BRINIDJA370', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TRADE FINANCE PROCESSING CENTRE JAKARTA I)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(402, 'BRINIDJA', 'BRINIDJA329', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(VETERAN BRANCH)', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(403, 'BRINIDJA', 'BRINIDJA', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', 'BRI KANTOR PUSAT', '', 'JAKARTA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(404, 'BRINIDJA', 'BRINIDJA020', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(JAMBI BRANCH)', '', 'JAMBI', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(405, 'BRINIDJA', 'BRINIDJA021', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(JEMBER BRANCH)', '', 'JEMBER', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(406, 'BRINIDJA', 'BRINIDJA033', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(KEDIRI BRANCH)', '', 'KEDIRI', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(407, 'BRINIDJA', 'BRINIDJA192', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(KENDARI BRANCH)', '', 'KENDARI', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(408, 'BRINIDJA', 'BRINIDJA127', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(KOTABARU BRANCH)', '', 'KOTABARU', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(409, 'BRINIDJA', 'BRINIDJA038', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(KUDUS BRANCH)', '', 'KUDUS', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(410, 'BRINIDJA', 'BRINIDJA039', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(KUPANG BRANCH)', '', 'KUPANG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(411, 'BRINIDJA', 'BRINIDJA042', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(LANGSA BRANCH)', '', 'LANGSA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(412, 'BRINIDJA', 'BRINIDJA043', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(LHOKSEUMAWE BRANCH)', '', 'LHOKSEUMAWE', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(413, 'BRINIDJA', 'BRINIDJA167', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(LUWUK BRANCH)', '', 'LUWUK', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(414, 'BRINIDJA', 'BRINIDJA051', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(MALANG BRANCH)', '', 'MALANG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(415, 'BRINIDJA', 'BRINIDJA054', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(MANADO BRANCH)', '', 'MANADO', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(416, 'BRINIDJA', 'BRINIDJA052', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(MATARAM BRANCH)', '', 'MATARAM', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(417, 'BRINIDJA', 'BRINIDJA336', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(MEDAN PEMUDA BRANCH)', '', 'MEDAN', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(418, 'BRINIDJA', 'BRINIDJA053', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(MEDAN PUTRI HIJAU BRANCH)', '', 'MEDAN', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(419, 'BRINIDJA', 'BRINIDJA130', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(METRO BRANCH)', '', 'METRO', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(420, 'BRINIDJA', 'BRINIDJA058', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(PADANG BRANCH)', '', 'PADANG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(421, 'BRINIDJA', 'BRINIDJA059', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(PALEMBANG BRANCH)', '', 'PALEMBANG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(422, 'BRINIDJA', 'BRINIDJA063', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(PANGKAL PINANG BRANCH)', '', 'PANGKAL PINANG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(423, 'BRINIDJA', 'BRINIDJA282', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(PANGKALAN BUN BRANCH)', '', 'PANGKALAN BUN', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(424, 'BRINIDJA', 'BRINIDJA170', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(PEKANBARU BRANCH)', '', 'PEKANBARU', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(425, 'BRINIDJA', 'BRINIDJA113', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(PEMATANG SIANTAR BRANCH)', '', 'PEMATANG SIANTAR', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(426, 'BRINIDJA', 'BRINIDJA071', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(PONTIANAK BRANCH)', '', 'PONTIANAK', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(427, 'BRINIDJA', 'BRINIDJA079', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(RABA-BIMA BRANCH)', '', 'RABA-BIMA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(428, 'BRINIDJA', 'BRINIDJA284', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(RENGAT BRANCH)', '', 'RENGAT', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(429, 'BRINIDJA', 'BRINIDJA082', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(SAMARINDA BRANCH)', '', 'SAMARINDA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(430, 'BRINIDJA', 'BRINIDJA163', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(SAMPIT BRANCH)', '', 'SAMPIT', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(431, 'BRINIDJA', 'BRINIDJA083', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(PATTIMURA BRANCH)', '', 'SEMARANG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(432, 'BRINIDJA', 'BRINIDJA086', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(SIDOARJO BRANCH)', '', 'SIDOARJO', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(433, 'BRINIDJA', 'BRINIDJA097', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(SLAMET RIYADI BRANCH)', '', 'SOLO', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(434, 'BRINIDJA', 'BRINIDJA092', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(SUKABUMI BRANCH)', '', 'SUKABUMI', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(435, 'BRINIDJA', 'BRINIDJA096', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(KALIASIN BRANCH)', '', 'SURABAYA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(436, 'BRINIDJA', 'BRINIDJA211', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(PAHLAWAN BRANCH)', '', 'SURABAYA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(437, 'BRINIDJA', 'BRINIDJA172', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(RAJAWALI BRANCH)', '', 'SURABAYA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(438, 'BRINIDJA', 'BRINIDJA328', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TANJUNG PERAK BRANCH)', '', 'SURABAYA', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(439, 'BRINIDJA', 'BRINIDJA120', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TANGERANG BRANCH)', '', 'TANGERANG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(440, 'BRINIDJA', 'BRINIDJA098', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TANJUNG KARANG BRANCH)', '', 'TANJUNG KARANG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(441, 'BRINIDJA', 'BRINIDJA131', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TANJUNG PANDAN BRANCH)', '', 'TANJUNG PANDAN', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(442, 'BRINIDJA', 'BRINIDJA174', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TANJUNG PINANG BRANCH)', '', 'TANJUNG PINANG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(443, 'BRINIDJA', 'BRINIDJA283', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TEBINGTINGGI BRANCH)', '', 'TEBING TINGGI', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(444, 'BRINIDJA', 'BRINIDJA101', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TEGAL BRANCH)', '', 'TEGAL', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(445, 'BRINIDJA', 'BRINIDJA285', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TELUK BETUNG BRANCH)', '', 'TELUK BETUNG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(446, 'BRINIDJA', 'BRINIDJA175', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TEMBILAHAN BRANCH)', '', 'TEMBILAHAN', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(447, 'BRINIDJA', 'BRINIDJA103', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(TERNATE BRANCH)', '', 'TERNATE', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(448, 'BRINIDJA', 'BRINIDJA050', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(ACHMAD YANI BRANCH)', '', 'UJUNG PANDANG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(449, 'BRINIDJA', 'BRINIDJA343', 'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', 'Bank Persero', '(SOMBA OPU BRANCH)', '', 'UJUNG PANDANG', '(021) 251-0244, 251-0254, 251-0269', 'active'),
(450, 'AGTBIDJA', 'AGTBIDJA', 'PT. BANK RAKYAT INDONESIA AGRONIAGA TBK', 'Bank Devisa', 'BANK AGRO KANTOR PUSAT OPERASIONAL JAKARTA', '', 'JAKARTA', '(021) 526-2570', 'active'),
(451, 'SBIDIDJA', 'SBIDIDJA', 'PT. BANK SBI INDONESIA', '', '', '', 'JAKARTA', '', 'active'),
(452, 'SHBKIDJA', 'SHBKIDJA', 'PT. BANK SHINHAN INDONESIA', '', '', '', 'JAKARTA', '', 'active'),
(453, 'PDSUIDSA', 'PDSUIDSA', 'PT. BANK SUMUT', '', '', '', 'MEDAN', '', 'active'),
(454, 'BVICIDJA', 'BVICIDJA', 'PT. BANK VICTORIA INTERNATIONAL, TBK', 'Bank Non Devisa', 'BANK VICTORIA KANTOR PUSAT', '', 'JAKARTA', '(021) 7278-1800', 'active'),
(455, 'PDSBIDSP', 'PDSBIDSP', 'PT. BPD SUMATERA BARAT (BANK NAGARI)', 'Bank Pembangunan Daerah dan Bank Devisa', 'BANK NAGARI KANTOR PUSAT', '', 'PADANG', '(0751) 25055, 31577, 31578', 'active'),
(456, 'BUMIIDJA', 'BUMIIDJA', 'PT.BANK MNC INTERNASIONAL TBK.', 'Bank Devisa', 'BANK BUMIPUTERA KANTOR PUSAT', '', 'JAKARTA', '(021) 391-9898', 'active'),
(457, 'HVBKIDJA', 'HVBKIDJA', 'PT.BANK WOORI SAUDARA INDONESIA 1906 TBK', 'Bank Devisa', 'BOC KANTOR PUSAT', '', 'BANDUNG', '(022) 8783-1906, 878-1900', 'active'),
(458, 'SCBLIDJX', 'SCBLIDJXBDG', 'STANDARD CHARTERED BANK', 'Kantor Cabang Bank Asing', '(BANDUNG BRANCH)', '', 'BANDUNG', '(021) 255-0000, 5799-9988', 'active'),
(459, 'SCBLIDJX', 'SCBLIDJXIDX', 'STANDARD CHARTERED BANK', 'Kantor Cabang Bank Asing', '(PT SCSI)', '', 'JAKARTA', '(021) 255-0000, 5799-9988', 'active'),
(460, 'SCBLIDJX', 'SCBLIDJX', 'STANDARD CHARTERED BANK', 'Kantor Cabang Bank Asing', 'STANDCHARD KC JAKARTA', '', 'JAKARTA', '(021) 255-0000, 5799-9988', 'active'),
(461, 'SCBLIDJX', 'SCBLIDJXMDN', 'STANDARD CHARTERED BANK', 'Kantor Cabang Bank Asing', '(MEDAN BRANCH)', '', 'MEDAN', '(021) 255-0000, 5799-9988', 'active'),
(462, 'SCBLIDJX', 'SCBLIDJXSMG', 'STANDARD CHARTERED BANK', 'Kantor Cabang Bank Asing', '(SEMARANG BRANCH)', '', 'SEMARANG', '(021) 255-0000, 5799-9988', 'active'),
(463, 'SCBLIDJX', 'SCBLIDJXSBY', 'STANDARD CHARTERED BANK', 'Kantor Cabang Bank Asing', '(SURABAYA BRANCH)', '', 'SURABAYA', '(021) 255-0000, 5799-9988', 'active'),
(464, 'PDACIDJ1', 'PDACIDJ1', 'PT Bank Aceh', 'Bank Pembangunan Daerah', '', '', 'ACEH', '(0651) 32598', 'active'),
(465, 'PDBKIDJ1', 'PDBKIDJ1', 'PT BPD Bengkulu', 'Bank Pembangunan Daerah', '', '', 'Bengkulu', '(0736) 22144, 341170', 'active'),
(466, 'PDJMIDJ1', 'PDJMIDJ1', 'PT BPD Jambi', 'Bank Pembangunan Daerah', '', '', 'JAMBI', '(0741) 60416, 60665, 62790, 64628', 'active'),
(467, 'PDKGIDJ1', 'PDKGIDJ1', 'PT BPD Kalimantan Tengah (Bank Kalteng)', 'Bank Pembangunan Daerah', '', '', 'KALTENG', '(0536) 322-6812', 'active'),
(468, 'PDKBIDJ1', 'PDKBIDJ1', 'PT BPD Kalimantan Barat (Bank Kalbar)', 'Bank Pembangunan Daerah', '', '', 'KALBAR', '(0561) 732-148, 734-713, 736-723', 'active'),
(469, 'PDKSIDJ1', 'PDKSIDJ1', 'PT BPD Kalimantan Selatan (Bank Kalsel)', 'Bank Pembangunan Daerah', '', '', 'KALSEL', '(0511) 335-0726 s/d 28', 'active'),
(470, 'PDLPIDJ1', 'PDLPIDJ1', 'PT BPD Lampung', 'Bank Pembangunan Daerah', '', '', 'LAMPUNG', '(0721) 487-175, 482-237', 'active'),
(471, 'PDMLIDJ1', 'PDMLIDJ1', 'PT BPD Maluku dan Maluku Utara (Bank Maluku)', 'Bank Pembangunan Daerah', '', '', 'MALUKU', '(0911) 354-214, 353-144, 310-696', 'active'),
(472, 'PDNBIDJ1', 'PDNBIDJ1', 'PT BPD Nusa Tenggara Barat (Bank NTB)', 'Bank Pembangunan Daerah', '', '', 'NTB', '(0370) 636-331, 635-332, 632-177', 'active'),
(473, 'PDNTIDJ1', 'PDNTIDJ1', 'PT BPD Nusa Tenggara Timur (Bank NTT)', 'Bank Pembangunan Daerah', '', '', 'NTT', '(0380) 840-555', 'active'),
(474, 'PDIJIDJ1', 'PDIJIDJ1', 'PT BPD Papua', 'Bank Pembangunan Daerah', '', '', 'PAPUA', '(0967) 532-011', 'active'),
(475, 'PDWRIDJ1', 'PDWRIDJ1', 'PT BPD Sulawesi Tenggara (Bank Sultra)', 'Bank Pembangunan Daerah', '', '', 'SULTRA', '(0401) 312-1526, 312-2104, 312-3163', 'active'),
(476, 'PDWSIDJ1', 'PDWSIDJ1', 'PT BPD Sulawesi Selatan dan Barat (Bank Sulselbar)', 'Bank Pembangunan Daerah', '', '', 'SULSELBAR', '(0411) 859-171 s/d 74, 859-176/181', 'active'),
(477, 'PDWGIDJ1', 'PDWGIDJ1', 'PT BPD Sulawesi Tengah (Bank Sulteng)', 'Bank Pembangunan Daerah', '', '', 'SULTENG', '(0451) 421-780', 'active'),
(478, 'PDWUIDJ1', 'PDWUIDJ1', 'PT BPD Sulawesi Utara (Bank Sulut)', 'Bank Pembangunan Daerah', '', '', 'SULUT', '(0431) 861-759, 851-451', 'active'),
(479, 'PDYKIDJ1', 'PDYKIDJ1', 'PT BPD Daerah Istimewa Yogyakarta (Bank BPD DIY)', 'Bank Pembangunan Daerah', '', '', 'DIY', '(0274) 561-614', 'active'),
(480, 'BDKIIDJ1', 'BDKIIDJ1', 'PT BPD DKI (Bank DKI)', 'Bank Pembangunan Daerah dan Bank Devisa', '', '', 'DKI', '(021) 231-4567', 'active'),
(481, 'PDJGIDJ1', 'PDJGIDJ1', 'PT BPD Jawa Tengah', 'Bank Pembangunan Daerah dan Bank Devisa', '', '', 'JAWA TENGAH', '(024) 355-4025 s/d 40, 3547541 s/d 45', 'active'),
(482, 'PDRIIDJ1', 'PDRIIDJ1', 'PT BPD Riau Kepri', 'Bank Pembangunan Daerah dan Bank Devisa', '', '', 'KEPRI', '(0761) 37050, 37060, 38370', 'active'),
(483, 'PDSUIDJ1', 'PDSUIDJ1', 'PT BPD Sumatera Utara (Bank Sumut)', 'Bank Pembangunan Daerah dan Bank Devisa', '', '', 'SUMUT', '(061) 415-5100, 451-5100', 'active'),
(484, 'ABNAIDJA', 'ABNAIDJA', 'The Royal Bank Of Scotland N.V', 'Kantor Cabang Bank Asing', '', '', '', '(021) 231-2777', 'active'),
(485, 'ANTDIDJD', 'ANTDIDJD', 'PT Bank Antar Daerah', 'Bank Devisa', '', '', '', '(031) 354-0909', 'active'),
(486, 'BNIDJA', 'BNIDJA', 'PT Bank BNI Syariah', 'Bank Devisa', '', '', '', '(021) 2970-1946', 'active'),
(487, 'EKONIDJA', 'EKONIDJA', 'PT Bank Ekonomi Raharja Tbk (BAEK)', 'Bank Devisa', '', '', '', '(021) 2554-5800', 'active'),
(488, 'IDMOIDJ1', 'IDMOIDJ1', 'PT Bank SBI Indonesia', 'Bank Devisa', '', '', '', '(021) 3983-8747', 'active'),
(489, 'MASDIDJ5', 'MASDIDJ5', 'PT Bank Maspion Indonesia Tbk (BMAS)', 'Bank Devisa', '', '', '', '(031) 531-9818, 545-6334, 535-6123', 'active'),
(490, 'BUTGIDJ1', 'BUTGIDJ1', 'PT Bank Mega Syariah', 'Bank Devisa', '', '', '', '(021) 2985-2000', 'active'),
(491, 'MEEKIDJ1', 'MEEKIDJ1', 'PT Bank Metro Ekspress', 'Bank Devisa', '', '', '', '(021) 231-1888', 'active'),
(492, 'NUPAIDJ6', 'NUPAIDJ6', 'PT Bank Nusantara Parahyangan Tbk (BBNP)', 'Bank Devisa', '', '', '', '(022) 8256-0100', 'active'),
(493, 'RABOIDJA', 'RABOIDJA', 'PT Bank Rabobank International Indonesia', 'Bank Devisa', '', '', '', '(021) 252-0876', 'active'),
(494, 'AGSSIDJA', 'AGSSIDJA', 'PT Bank Agris Tbk (AGRS)', 'Bank Devisa', '', '', '', '(021) 5790-8888', 'active'),
(495, 'MBBEIDJA', 'MBBEIDJA', 'PT Bank Maybank Syariah Indonesia', 'Bank Devisa', '', '', '', '(021) 250-6446', 'active'),
(496, 'TAPEIDJ1', 'TAPEIDJ1', 'PT Bank Tabungan Pensiunan Nasional Tbk (BTPN)', 'Bank Devisa', '', '', '', '(021) 3002-6200', 'active'),
(497, 'LOMAIDJ1', 'LOMAIDJ1', 'PT Bank Amar Indonesia', 'Bank Non Devisa', '', '', '', '(031) 535-5339', 'active'),
(498, 'ATOSIDJ1', 'ATOSIDJ1', 'PT Bank Artos Indonesia Tbk (ARTO)', 'Bank Non Devisa', '', '', '', '(022) 420-0202, 420-0303', 'active'),
(499, 'SYCAIDJ1', 'SYCAIDJ1', 'PT Bank BCA Syariah', 'Bank Non Devisa', '', '', '', '(021) 819-0072, 850-5030, 850-5035', 'active'),
(500, 'JSABIDJ1', 'JSABIDJ1', 'PT Bank Jasa Jakarta', 'Bank Non Devisa', '', '', 'JAKARTA', '(021) 690-2611, 690-6950', 'active'),
(501, 'KSEBIDJ1', 'KSEBIDJ1', 'PT Bank Kesejahteraan Ekonomi', 'Bank Non Devisa', '', '', '', '(021) 310-0422/448', 'active'),
(502, 'INPBIDJ1', 'INPBIDJ1', 'PT Bank Ina Perdana Tbk (BINA)', 'Bank Non Devisa', '', '', '', '(021) 385-9050', 'active'),
(503, 'HRDAIDJ1', 'HRDAIDJ1', 'PT Bank Harda Internasional Tbk (BBHI)', 'Bank Non Devisa', '', '', '', '(021) 384-1178', 'active'),
(504, 'FAMAIDJ1', 'FAMAIDJ1', 'PT Bank Fama Internasional', 'Bank Non Devisa', '', '', '', '(022) 4200-808', 'active'),
(505, 'BDIPIDJ1', 'BDIPIDJ1', 'PT Bank Sahabat Sampoerna', 'Bank Non Devisa', '', '', '', '(021) 5795-1515', 'active'),
(506, 'CNBAIDJ1', 'CNBAIDJ1', 'PT Centratama Nasional Bank', 'Bank Non Devisa', '', '', '', '(031) 531-9001, 545-8522', 'active'),
(507, 'LMANIDJ1', 'LMANIDJ1', 'PT Bank Dinar Indonesia Tbk (DNAR)', 'Bank Non Devisa', '', '', '', '(021) 231-2633', 'active'),
(508, 'MGABIDJ1', 'MGABIDJ1', 'PT Bank Mitraniaga Tbk (NAGA)', 'Bank Non Devisa', '', '', '', '(021) 548-1877', 'active'),
(509, 'MASBIDJ1', 'MASBIDJ1', 'PT Bank Multiarta Sentosa (Bank Mas)', 'Bank Non Devisa', '', '', '', '(021) 5790-6006', 'active'),
(510, 'BDABCDJA', 'BDABCDJA', 'PT Bank Panin Syariah Tbk (PNBS)', 'Bank Non Devisa', '', '', '', '(021) 5695-6100', 'active'),
(511, 'PMASIDJ1', 'PMASIDJ1', 'PT Prima Master Bank', 'Bank Non Devisa', '', '', '', '(031) 353-1253', 'active'),
(512, 'EKSTIDJ1', 'EKSTIDJ1', 'PT Bank Pundi Indonesia Tbk (BEKS)', 'Bank Non Devisa', '', '', '', '(021) 723-4666', 'active'),
(513, 'ROYBIDJ1', 'ROYBIDJ1', 'PT Bank Royal Indonesia', 'Bank Non Devisa', '', '', '', '(021) 638-4472', 'active'),
(514, 'PUBAIDJ1', 'PUBAIDJ1', 'PT Bank Tabungan Pensiunan Nasional Syariah', 'Bank Non Devisa', '', '', '', '(021) 3002-6400', 'active'),
(515, 'SIHBIDJ1', 'SIHBIDJ1', 'PT Bank Sinar Harapan Bali', 'Bank Non Devisa', '', '', '', '(0361) 227-076, 227-887', 'active'),
(516, 'RIPAIDJ1', 'RIPAIDJ1', 'PT Bank Andara', 'Bank Non Devisa', '', '', '', '(021) 526-0707', 'active'),
(517, 'SDOBIDJ1', 'SDOBIDJ1', 'PT Bank Syariah Bukopin', 'Bank Non Devisa', '', '', '', '(021) 230-0912', 'active'),
(518, 'SWAGIDJ1', 'SWAGIDJ1', 'PT Bank Victoria Syariah', 'Bank Non Devisa', '', '', '', '(021) 560-0467', 'active'),
(519, 'YUDBIDJ1', 'YUDBIDJ1', 'PT Bank Yudha Bhakti Tbk (BBYB)', 'Bank Non Devisa', '', '', '', '(021) 351-7523, 351-7533', 'active'),
(520, 'SYJBIDJ1', 'SYJBIDJ1', 'PT Bank Jabar Banten Syariah', 'Bank Non Devisa', '', '', '', '(022) 420-2599', 'active'),
(521, 'BUSTIDJ1', 'BUSTIDJ1', 'PT Bank Bisnis Internasional', 'Bank Non Devisa', '', '', '', '(022) 250-1787, 251-1900, 423-3458', 'active'),
(522, 'BTPNIDJA', 'BTPNIDJA', 'BTPN', '', '', '', '', '', 'active'),
(523, 'AEIBPKK1', 'AEIBPKK1', 'American Express', '', '', '', '', '', 'active'),
(524, 'WIKEIDJ1', 'WIKEIDJ1', 'BANK WINDU KENCANA', '', '', '', '', '', 'active'),
(525, 'SWBAIDJA', 'SWBAIDJA', 'Bank Swadesi', '', '', '', '', '', 'active'),
(526, 'BARCGBKB', 'BARCGBKB', 'Bank BARCLAYS', '', '', '', '', '', 'active'),
(527, 'PDBBIDJ1', 'PDBBIDJ1', 'BANK EKSEKUTIF INTERNASIONAL', '', '', '', '', '', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `user_group` varchar(200) NOT NULL,
  `avatar` varchar(250) NOT NULL,
  `activation_date` date NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `fullname`, `user_group`, `avatar`, `activation_date`, `status`) VALUES
(1, 'admin', '$2y$10$LlgjxVsOPktq.rns0B8AuuUhSdwZsNWDUJgZx/Ado0GpchI4FFs3e', 'Admin', 'admin', '', '2021-06-23', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_group`
--

CREATE TABLE `user_group` (
  `user_group_id` int(11) NOT NULL,
  `group_name` varchar(250) NOT NULL,
  `access` text NOT NULL,
  `action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_group`
--

INSERT INTO `user_group` (`user_group_id`, `group_name`, `access`, `action`) VALUES
(1, 'admin', 'dashboard_regulator#verification#report_legulator#archive#user_activity_regulator#upload_source#raw_data#data_clean#dashboard_document#document#report_document#version#user_activity_document#user#user_group#master_data', 'add#update#delete#view#download'),
(2, 'tes', 'dashboard_regulator#verification', 'add#update');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`campaign_id`);

--
-- Indeks untuk tabel `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`source_id`);

--
-- Indeks untuk tabel `tbackup`
--
ALTER TABLE `tbackup`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tcalendar`
--
ALTER TABLE `tcalendar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tcleandatasource1`
--
ALTER TABLE `tcleandatasource1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_data_source` (`id_data_source`);

--
-- Indeks untuk tabel `tcountrycode`
--
ALTER TABLE `tcountrycode`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tdatasource1`
--
ALTER TABLE `tdatasource1`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tlogact`
--
ALTER TABLE `tlogact`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_01_subtype`
--
ALTER TABLE `tltkl_01_subtype`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_02_fundtype`
--
ALTER TABLE `tltkl_02_fundtype`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_03_acctype`
--
ALTER TABLE `tltkl_03_acctype`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_04_accstat`
--
ALTER TABLE `tltkl_04_accstat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_05_idtype`
--
ALTER TABLE `tltkl_05_idtype`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_06_trxmode`
--
ALTER TABLE `tltkl_06_trxmode`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_07_trxtype`
--
ALTER TABLE `tltkl_07_trxtype`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_08_reporttype`
--
ALTER TABLE `tltkl_08_reporttype`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_09_contactcat`
--
ALTER TABLE `tltkl_09_contactcat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_10_commtype`
--
ALTER TABLE `tltkl_10_commtype`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_11_companytype`
--
ALTER TABLE `tltkl_11_companytype`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_12_stufftype`
--
ALTER TABLE `tltkl_12_stufftype`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_13_currency`
--
ALTER TABLE `tltkl_13_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_14_country`
--
ALTER TABLE `tltkl_14_country`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_15_personacc`
--
ALTER TABLE `tltkl_15_personacc`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_16_personentity`
--
ALTER TABLE `tltkl_16_personentity`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_17_partyrole`
--
ALTER TABLE `tltkl_17_partyrole`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_18_reportind`
--
ALTER TABLE `tltkl_18_reportind`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltkl_19_gender`
--
ALTER TABLE `tltkl_19_gender`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tqris_mcc`
--
ALTER TABLE `tqris_mcc`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tqris_merchcriteria`
--
ALTER TABLE `tqris_merchcriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tqris_nns`
--
ALTER TABLE `tqris_nns`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tregioncode`
--
ALTER TABLE `tregioncode`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `treportperiod`
--
ALTER TABLE `treportperiod`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `treportsettings`
--
ALTER TABLE `treportsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tswiftcode`
--
ALTER TABLE `tswiftcode`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_groups` (`user_group`);

--
-- Indeks untuk tabel `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`user_group_id`),
  ADD KEY `group_name` (`group_name`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `campaign`
--
ALTER TABLE `campaign`
  MODIFY `campaign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `source`
--
ALTER TABLE `source`
  MODIFY `source_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `tbackup`
--
ALTER TABLE `tbackup`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tcalendar`
--
ALTER TABLE `tcalendar`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `tcleandatasource1`
--
ALTER TABLE `tcleandatasource1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT untuk tabel `tcountrycode`
--
ALTER TABLE `tcountrycode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tdatasource1`
--
ALTER TABLE `tdatasource1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT untuk tabel `tlogact`
--
ALTER TABLE `tlogact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tltkl_01_subtype`
--
ALTER TABLE `tltkl_01_subtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tltkl_02_fundtype`
--
ALTER TABLE `tltkl_02_fundtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tltkl_03_acctype`
--
ALTER TABLE `tltkl_03_acctype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tltkl_04_accstat`
--
ALTER TABLE `tltkl_04_accstat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tltkl_05_idtype`
--
ALTER TABLE `tltkl_05_idtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tltkl_06_trxmode`
--
ALTER TABLE `tltkl_06_trxmode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `tltkl_07_trxtype`
--
ALTER TABLE `tltkl_07_trxtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tltkl_08_reporttype`
--
ALTER TABLE `tltkl_08_reporttype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tltkl_09_contactcat`
--
ALTER TABLE `tltkl_09_contactcat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tltkl_10_commtype`
--
ALTER TABLE `tltkl_10_commtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tltkl_11_companytype`
--
ALTER TABLE `tltkl_11_companytype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tltkl_12_stufftype`
--
ALTER TABLE `tltkl_12_stufftype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tltkl_13_currency`
--
ALTER TABLE `tltkl_13_currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT untuk tabel `tltkl_14_country`
--
ALTER TABLE `tltkl_14_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT untuk tabel `tltkl_15_personacc`
--
ALTER TABLE `tltkl_15_personacc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tltkl_16_personentity`
--
ALTER TABLE `tltkl_16_personentity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tltkl_17_partyrole`
--
ALTER TABLE `tltkl_17_partyrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tltkl_18_reportind`
--
ALTER TABLE `tltkl_18_reportind`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT untuk tabel `tltkl_19_gender`
--
ALTER TABLE `tltkl_19_gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tqris_mcc`
--
ALTER TABLE `tqris_mcc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1881;

--
-- AUTO_INCREMENT untuk tabel `tqris_merchcriteria`
--
ALTER TABLE `tqris_merchcriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tqris_nns`
--
ALTER TABLE `tqris_nns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `tregioncode`
--
ALTER TABLE `tregioncode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=561;

--
-- AUTO_INCREMENT untuk tabel `treportperiod`
--
ALTER TABLE `treportperiod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `treportsettings`
--
ALTER TABLE `treportsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `tswiftcode`
--
ALTER TABLE `tswiftcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;

--
-- AUTO_INCREMENT untuk tabel `user_group`
--
ALTER TABLE `user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
