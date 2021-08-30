-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Agu 2021 pada 18.31
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
-- Database: `regulatory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t0source_danafloat`
--

CREATE TABLE `t0source_danafloat` (
  `id` int(12) NOT NULL,
  `wallet_code` varchar(30) NOT NULL,
  `trx_code` varchar(30) NOT NULL,
  `trx_id` varchar(30) NOT NULL,
  `trx_type` varchar(30) NOT NULL,
  `trx_value` varchar(20) NOT NULL,
  `description` varchar(250) NOT NULL,
  `credit` varchar(20) NOT NULL,
  `debit` varchar(20) NOT NULL,
  `syslogno` varchar(30) NOT NULL,
  `channel_id` varchar(20) NOT NULL,
  `srac` varchar(30) NOT NULL,
  `dsac` varchar(30) NOT NULL,
  `trx_datetime` varchar(20) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table source for Dana Float report';

--
-- Dumping data untuk tabel `t0source_danafloat`
--

INSERT INTO `t0source_danafloat` (`id`, `wallet_code`, `trx_code`, `trx_id`, `trx_type`, `trx_value`, `description`, `credit`, `debit`, `syslogno`, `channel_id`, `srac`, `dsac`, `trx_datetime`, `datestamp`, `status`) VALUES
(1, '195101437000', 'WS_TRX_TRANSFER', '111890372,', 'Top Up', '475500', 'Top Up melalui Mandiri dengan nomor transaksi 0819000509088287614743008', '475500', '0', '2108190176004033', '4', '+628177019032716552298813', '+6288287614743', '2021-08-19 00:02:31', '2021-08-19', 'old'),
(2, '195101416720', 'WS_TRX_TRANSFER', '111890392,', 'PULSA', '10223', 'Topup Pulsa THREE denom 10000 ke 08970339354', '0', '10223', '2108190176004059', '1', '+628814681591', '+62813212989695', '2021-08-19 00:02:48', '2021-08-19', 'old'),
(3, '195101437000', 'WS_TRX_TRANSFER', '111890412,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657655 amount 55000', '0', '55500', '2108190176004088', '1', '+6288287614743', '+6282110454751', '2021-08-19 00:03:09', '2021-08-19', 'old'),
(4, '195101422579', 'WS_TRX_TRANSFER', '111890432,', 'PULSADATA', '17675', 'Pembelian PULSA - INDOSAT', '0', '17675', '2108190176004161', '34', '+6285758217161', '+62811996932005', '2021-08-19 00:04:30', '2021-08-19', 'old'),
(5, '195101437626', 'WS_TRX_TRANSFER', '111890452,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657687 amount 55000', '0', '55500', '2108190176004397', '1', '+6289652945369', '+6282110454751', '2021-08-19 00:08:31', '2021-08-19', 'old'),
(6, '195101315022', 'WS_TRX_TRANSFER', '111890472,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657691 amount 724500', '0', '725000', '2108190176004466', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:09:09', '2021-08-19', 'old'),
(7, '195101291593', 'WS_TRX_TRANSFER', '111890492,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657697 amount 419500', '0', '420000', '2108190176004489', '1', '+6281287939124', '+6282110454751', '2021-08-19 00:09:31', '2021-08-19', 'old'),
(8, '195101339878', 'WS_TRX_TRANSFER', '111890512,', 'BILLER', '389000', 'Bayar Telkom nomor 021119657688 amount 388500', '0', '389000', '2108190176004513', '1', '+6281367659893', '+6282110454751', '2021-08-19 00:09:58', '2021-08-19', 'old'),
(9, '195101375661', 'WS_TRX_TRANSFER', '111890532,', 'BILLER', '40000', 'Bayar Telkom nomor 021119657709 amount 39500', '0', '40000', '2108190176004588', '1', '+6285811301689', '+6282110454751', '2021-08-19 00:11:11', '2021-08-19', 'old'),
(10, '195101275570', 'WS_TRX_TRANSFER', '111890552,', 'Top Up', '269000', 'Top Up melalui BCA dengan nomor transaksi 210819001053', '269000', '0', '2108190176004589', '4', '+628177019032716552298813', '+6285295090673', '2021-08-19 00:11:11', '2021-08-19', 'old'),
(11, '195101275570', 'WS_TRX_TRANSFER', '111890572,', 'BILLER', '269000', 'Bayar Telkom nomor 021119657706 amount 268500', '0', '269000', '2108190176004623', '1', '+6285295090673', '+6282110454751', '2021-08-19 00:11:38', '2021-08-19', 'old'),
(12, '195101216635', 'WS_TRX_TRANSFER', '111890574,', 'Bayar/Beli', '100000', 'Telkomsel Reguler NGRS nomor 081368624440 Nominal 100000', '0', '100000', '2108190176004629', '19', '+6281366342466', '+6282110762368', '2021-08-19 00:11:45', '2021-08-19', 'old'),
(13, '195101315022', 'WS_TRX_TRANSFER', '111890592,', 'Top Up', '1450000', 'Top Up melalui BCA dengan nomor transaksi 210819001303', '1450000', '0', '2108190176004714', '4', '+628177019032716552298813', '+6282183079380', '2021-08-19 00:13:13', '2021-08-19', 'old'),
(14, '195101315022', 'WS_TRX_TRANSFER', '111890612,', 'BILLER', '757000', 'Bayar Telkom nomor 021119657720 amount 756500', '0', '757000', '2108190176004744', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:13:39', '2021-08-19', 'old'),
(15, '195101416720', 'WS_TRX_TRANSFER', '111890632,', 'DATA', '16500', 'Topup  denom 15000 ke 081246285559', '0', '16500', '2108190176004765', '1', '+628814681591', '+6200000001271', '2021-08-19 00:13:54', '2021-08-19', 'old'),
(16, '195101339878', 'WS_TRX_TRANSFER', '111890652,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657726 amount 419500', '0', '420000', '2108190176004805', '1', '+6281367659893', '+6282110454751', '2021-08-19 00:14:29', '2021-08-19', 'old'),
(17, '195101315022', 'WS_TRX_TRANSFER', '111890672,', 'BILLER', '757000', 'Bayar Telkom nomor 021119657738 amount 756500', '0', '757000', '2108190176004859', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:15:33', '2021-08-19', 'old'),
(18, '195101318458', 'WS_TRX_TRANSFER', '111890692,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657747 amount 419500', '0', '420000', '2108190176004967', '1', '+6282117004177', '+6282110454751', '2021-08-19 00:17:10', '2021-08-19', 'old'),
(19, '195101315022', 'WS_TRX_TRANSFER', '111890712,', 'Top Up', '1314000', 'Top Up melalui BCA dengan nomor transaksi 210819001718', '1314000', '0', '2108190176004985', '4', '+628177019032716552298813', '+6282183079380', '2021-08-19 00:17:30', '2021-08-19', 'old'),
(20, '195101275570', 'WS_TRX_TRANSFER', '111890732,', 'Top Up', '269000', 'Top Up melalui BCA dengan nomor transaksi 210819001707', '269000', '0', '2108190176004987', '4', '+628177019032716552298813', '+6285295090673', '2021-08-19 00:17:32', '2021-08-19', 'old'),
(21, '195101442914', 'WS_TRX_TRANSFER', '111890752,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657755 amount 419500', '0', '420000', '2108190176005029', '1', '+6281287129285', '+6282110454751', '2021-08-19 00:18:07', '2021-08-19', 'old'),
(22, '195101275570', 'WS_TRX_TRANSFER', '111890772,', 'BILLER', '269000', 'Bayar Telkom nomor 021119657767 amount 268500', '0', '269000', '2108190176005378', '1', '+6285295090673', '+6282110454751', '2021-08-19 00:23:48', '2021-08-19', 'old'),
(23, '195101462384', 'WS_TRX_TRANSFER', '111890792,', 'Top Up', '420000', 'Top Up melalui BCA dengan nomor transaksi 210819002801', '420000', '0', '2108190176005558', '4', '+628177019032716552298813', '+6281274401478', '2021-08-19 00:28:24', '2021-08-19', 'old'),
(24, '195101221479', 'WS_TRX_TRANSFER', '111890812,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657828 amount 55000', '0', '55500', '2108190176005615', '1', '+6285281458719', '+6282110454751', '2021-08-19 00:30:38', '2021-08-19', 'old'),
(25, '195101429571', 'WS_TRX_TRANSFER', '111890832,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657843 amount 55000', '0', '55500', '2108190176005668', '1', '+6282273580276', '+6282110454751', '2021-08-19 00:32:36', '2021-08-19', 'old'),
(26, '195101437000', 'WS_TRX_TRANSFER', '111890852,', 'BILLER', '96000', 'Bayar Telkom nomor 021119657845 amount 95500', '0', '96000', '2108190176005673', '1', '+6288287614743', '+6282110454751', '2021-08-19 00:32:39', '2021-08-19', 'old'),
(27, '195101251949', 'WS_TRX_TRANSFER', '111890872,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657855 amount 55000', '0', '55500', '2108190176005707', '1', '+6287874603635', '+6282110454751', '2021-08-19 00:33:32', '2021-08-19', 'old'),
(28, '195101454460', 'WS_TRX_TRANSFER', '111890892,', 'DATA', '76500', 'Topup  denom 75000 ke 081284253815', '0', '76500', '2108190176005713', '1', '+6281541552654', '+6200000001271', '2021-08-19 00:34:07', '2021-08-19', 'old'),
(29, '195101251949', 'WS_TRX_TRANSFER', '111890912,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657878 amount 55000', '0', '55500', '2108190176005738', '1', '+6287874603635', '+6282110454751', '2021-08-19 00:35:30', '2021-08-19', 'old'),
(30, '195101291593', 'WS_TRX_TRANSFER', '111890932,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657882 amount 419500', '0', '420000', '2108190176005775', '1', '+6281287939124', '+6282110454751', '2021-08-19 00:36:06', '2021-08-19', 'old'),
(31, '195101454460', 'WS_TRX_TRANSFER', '111890952,', 'DATA', '51500', 'Topup  denom 50000 ke 082164588354', '0', '51500', '2108190176005798', '1', '+6281541552654', '+6200000001271', '2021-08-19 00:36:33', '2021-08-19', 'old'),
(32, '195101315022', 'WS_TRX_TRANSFER', '111890972,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657887 amount 724500', '0', '725000', '2108190176005803', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:36:35', '2021-08-19', 'old'),
(33, '195101251949', 'WS_TRX_TRANSFER', '111890992,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657893 amount 55000', '0', '55500', '2108190176005859', '1', '+6287874603635', '+6282110454751', '2021-08-19 00:38:05', '2021-08-19', 'old'),
(34, '195101310390', 'WS_TRX_TRANSFER', '111891012,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657903 amount 55000', '0', '55500', '2108190176005931', '1', '+628111277110', '+6282110454751', '2021-08-19 00:39:52', '2021-08-19', 'old'),
(35, '195101460880', 'WS_TRX_TRANSFER', '111891032,', 'PULSADATA', '15575', 'Pembelian PAKET DATA - THREE', '0', '15575', '2108190176005994', '34', '+62895352814252', '+62811996932005', '2021-08-19 00:42:12', '2021-08-19', 'old'),
(36, '195101433576', 'WS_TRX_TRANSFER', '111891052,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657917 amount 419500', '0', '420000', '2108190176006023', '1', '+6281291518790', '+6282110454751', '2021-08-19 00:42:27', '2021-08-19', 'old'),
(37, '195101461941', 'WS_TRX_TRANSFER', '111891072,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657919 amount 419500', '0', '420000', '2108190176006024', '1', '+6285283436167', '+6282110454751', '2021-08-19 00:42:28', '2021-08-19', 'old'),
(38, '195101315022', 'WS_TRX_TRANSFER', '111891092,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657924 amount 724500', '0', '725000', '2108190176006061', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:43:23', '2021-08-19', 'old'),
(39, '195101315022', 'WS_TRX_TRANSFER', '111891112,', 'Top Up', '1650000', 'Top Up melalui BCA dengan nomor transaksi 210819004353', '1650000', '0', '2108190176006090', '4', '+628177019032716552298813', '+6282183079380', '2021-08-19 00:44:04', '2021-08-19', 'old'),
(40, '195101315022', 'WS_TRX_TRANSFER', '111891132,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657923 amount 724500', '0', '725000', '2108190176006124', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:44:39', '2021-08-19', 'old'),
(41, '195101315022', 'WS_TRX_TRANSFER', '111891152,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657936 amount 724500', '0', '725000', '2108190176006176', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:46:09', '2021-08-19', 'old'),
(42, '195101461941', 'WS_TRX_TRANSFER', '111891172,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657952 amount 419500', '0', '420000', '2108190176006248', '1', '+6285283436167', '+6282110454751', '2021-08-19 00:48:36', '2021-08-19', 'old'),
(43, '195101461941', 'WS_TRX_TRANSFER', '111891192,', 'Top Up', '830000', 'Top Up melalui BCA dengan nomor transaksi 210819005031', '830000', '0', '2108190176006314', '4', '+628177019032716552298813', '+6285283436167', '2021-08-19 00:50:48', '2021-08-19', 'old'),
(44, '195101461941', 'WS_TRX_TRANSFER', '111891212,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657964 amount 419500', '0', '420000', '2108190176006338', '1', '+6285283436167', '+6282110454751', '2021-08-19 00:51:17', '2021-08-19', 'old'),
(45, '195101461941', 'WS_TRX_TRANSFER', '111891232,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657989 amount 419500', '0', '420000', '2108190176006511', '1', '+6285283436167', '+6282110454751', '2021-08-19 00:55:56', '2021-08-19', 'old'),
(46, '195101450962', 'WS_TRX_TRANSFER', '111891252,', 'BILLER', '55500', 'Bayar Telkom nomor 021119658002 amount 55000', '0', '55500', '2108190176006592', '1', '+6285841909202', '+6282110454751', '2021-08-19 00:57:56', '2021-08-19', 'old'),
(47, '195101461941', 'WS_TRX_TRANSFER', '111891272,', 'Top Up', '715000', 'Top Up melalui BCA dengan nomor transaksi 210819005841', '715000', '0', '2108190176006632', '4', '+628177019032716552298813', '+6285283436167', '2021-08-19 00:58:57', '2021-08-19', 'old'),
(48, '195101429571', 'WS_TRX_TRANSFER', '111891292,', 'BILLER', '55500', 'Bayar Telkom nomor 021119658019 amount 55000', '0', '55500', '2108190176006696', '1', '+6282273580276', '+6282110454751', '2021-08-19 01:00:17', '2021-08-19', 'old'),
(49, '195101315022', 'WS_TRX_TRANSFER', '111891312,', 'Top Up', '686000', 'Top Up melalui BCA dengan nomor transaksi 210819010050', '686000', '0', '2108190176006731', '4', '+628177019032716552298813', '+6282183079380', '2021-08-19 01:01:00', '2021-08-19', 'old'),
(50, '195101315022', 'WS_TRX_TRANSFER', '111891332,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657997 amount 724500', '0', '725000', '2108190176006771', '1', '+6282183079380', '+6282110454751', '2021-08-19 01:01:33', '2021-08-19', 'old');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t0source_ltdbb`
--

CREATE TABLE `t0source_ltdbb` (
  `id` int(12) NOT NULL,
  `sender_country` varchar(100) NOT NULL,
  `sender_city` varchar(100) NOT NULL,
  `recept_country` varchar(100) NOT NULL,
  `recept_city` varchar(100) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `recept_name` varchar(100) NOT NULL,
  `sender_phone` varchar(100) NOT NULL,
  `recept_phone` varchar(100) NOT NULL,
  `sender_wn` varchar(100) NOT NULL,
  `recept_wn` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `trx_freq` varchar(20) NOT NULL,
  `trx_amount` varchar(20) NOT NULL,
  `trx_traffic` varchar(30) NOT NULL,
  `trx_type` varchar(30) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table source for LTDBB report (G001, G002, G003)';

--
-- Dumping data untuk tabel `t0source_ltdbb`
--

INSERT INTO `t0source_ltdbb` (`id`, `sender_country`, `sender_city`, `recept_country`, `recept_city`, `sender_name`, `recept_name`, `sender_phone`, `recept_phone`, `sender_wn`, `recept_wn`, `description`, `trx_freq`, `trx_amount`, `trx_traffic`, `trx_type`, `trx_date`, `datestamp`, `status`) VALUES
(1, '86', '10', '86', '6', 'ADRIAN ALIMINSAH', 'Sdr ADRIAN ALIMINSAH', '+62123456781', '+6281310061906', '86', '86', 'Anda mendapat kiriman sebesar 600000 dari ADRIAN ALIMINSAH ke no rek.0178745292', '1', '600000', 'LOKAL', 'C2B', '2021-08-19', '2021-08-19', 'old'),
(2, '86', '10', '86', '6', 'Heru Sucahyo', 'HENI', '+62123456781', '+6285346565773', '86', '86', 'Anda mendapat kiriman sebesar 800000 dari Heru Sucahyo ke no rek.1480017881858', '1', '800000', 'LOKAL', 'C2B', '2021-08-20', '2021-08-20', 'old'),
(3, '86', '10', '86', '6', 'PRATAMA ADHE PUTRA', 'ARRAHMAN', '+62123456781', '+6288225643969', '86', '86', 'Anda mendapat kiriman sebesar 200000 dari PRATAMA ADHE PUTRA ke no rek.2910696541', '1', '200000', 'LOKAL', 'C2B', '2021-08-21', '2021-08-21', 'old'),
(4, '86', '105', '86', '6', 'Muchamad Akbar Fajar Ramadhan', 'MUCHAMAD AKBAR FAJAR', '+62123456781', '+6285155018933', '86', '86', 'Anda mendapat kiriman sebesar 1215192 dari Muchamad Akbar Fajar Ramadhan ke no rek.1430018820967', '1', '1215192', 'LOKAL', 'C2B', '2021-08-22', '2021-08-22', 'new'),
(5, '86', '20', '86', '6', 'MUJOKO', 'MUJOKO', '+62123456781', '+6282115518708', '86', '86', 'Anda mendapat kiriman sebesar 3000000 dari MUJOKO ke no rek.1250002318426', '1', '3000000', 'LOKAL', 'C2B', '2021-08-23', '2021-08-23', 'new'),
(6, '86', '21', '86', '6', 'Mochamad Dwi Syafriadi', 'MOCHAMAD DWI SYAFRIADI', '+62123456781', '+6281214827906', '86', '86', 'Anda mendapat kiriman sebesar 600000 dari Mochamad Dwi Syafriadi ke no rek.0551215988', '1', '600000', 'LOKAL', 'C2B', '2021-08-24', '2021-08-24', 'new'),
(7, '86', '233', '86', '6', 'Gian juliansyah pratama', 'GIAN JULIANSYAH PRATAMA', '+62123456781', '+6281368848613', '86', '86', 'Anda mendapat kiriman sebesar 602600 dari Gian juliansyah pratama ke no rek.3370238749', '1', '602600', 'LOKAL', 'C2B', '2021-08-25', '2021-08-25', 'new'),
(8, '86', '26', '86', '6', 'M Khanafi', 'M KHANAFI', '+62123456781', '+6281152500500', '86', '86', 'Anda mendapat kiriman sebesar 19000 dari M Khanafi ke no rek.459601024792537', '1', '19000', 'LOKAL', 'C2B', '2021-08-26', '2021-08-26', 'new'),
(9, '86', '261', '86', '6', 'Pendi Iriansyah', 'ZEFRIYANSYAH', '+62123456781', '+62895609703444', '86', '86', 'Anda mendapat kiriman sebesar 50000 dari Pendi Iriansyah ke no rek.0231295584', '1', '50000', 'LOKAL', 'C2B', '2021-08-27', '2021-08-27', 'new'),
(10, '86', '272', '86', '6', 'MUHAMMAD THORIQ HAFIZ', 'M THORIQ HAFIZ', '+62123456781', '+628118082202', '86', '86', 'Anda mendapat kiriman sebesar 241500 dari MUHAMMAD THORIQ HAFIZ ke no rek.1140005174514', '1', '241500', 'LOKAL', 'C2B', '2021-08-28', '2021-08-28', 'new'),
(11, '86', '31', '86', '6', 'DANDIT HARDIARTO', 'Ibu WIWIN SARWILIYANTI', '+62123456781', '+6281319911553', '86', '86', 'Anda mendapat kiriman sebesar 5000000 dari DANDIT HARDIARTO ke no rek.0141037019', '1', '5000000', 'LOKAL', 'C2B', '2021-08-29', '2021-08-29', 'new'),
(12, '86', '31', '86', '6', 'GATOT ARDIANTO', 'GATOT ARDIANTO', '+62123456781', '+628119301671', '86', '86', 'Anda mendapat kiriman sebesar 450000 dari GATOT ARDIANTO ke no rek.0700005147462', '1', '450000', 'LOKAL', 'C2B', '2021-08-30', '2021-08-30', 'new'),
(13, '86', '31', '86', '6', 'GATOT ARDIANTO', 'REBBY PUTRA ALLYANSYAH', '+62123456781', '+6282125062466', '86', '86', 'Anda mendapat kiriman sebesar 500000 dari GATOT ARDIANTO ke no rek.6281441849', '1', '500000', 'LOKAL', 'C2B', '2021-08-31', '2021-08-31', 'new'),
(14, '86', '320', '86', '6', 'Muhammad Yanis', 'MUHAMMAD YANIS', '+62123456781', '+6281345152465', '86', '86', 'Anda mendapat kiriman sebesar 1000000 dari Muhammad Yanis ke no rek.056301032520501', '1', '1000000', 'LOKAL', 'C2B', '2021-09-01', '2021-09-01', 'new'),
(15, '86', '322', '86', '6', 'Titis putri Herliyani', 'TITIS PUTRI HERLIYAN', '+62123456781', '+6285246211772', '86', '86', 'Anda mendapat kiriman sebesar 180000 dari Titis putri Herliyani ke no rek.111301016816500', '1', '180000', 'LOKAL', 'C2B', '2021-09-02', '2021-09-02', 'new'),
(16, '86', '323', '86', '6', 'FADLIANSYAH', 'FADLIANSYAH', '+62123456781', '+6285247768283', '86', '86', 'Anda mendapat kiriman sebesar 332000 dari FADLIANSYAH ke no rek.458101001039509', '1', '332000', 'LOKAL', 'C2B', '2021-09-03', '2021-09-03', 'new'),
(17, '86', '324', '86', '6', 'ABDUL MUIS', 'DARA PARAMITA', '+62123456781', '+6281295137122', '86', '86', 'Anda mendapat kiriman sebesar 50000 dari ABDUL MUIS ke no rek.012101076422501', '1', '50000', 'LOKAL', 'C2B', '2021-09-04', '2021-09-04', 'new'),
(18, '86', '324', '86', '6', 'Sholeha', 'SHOLEHA', '+62123456781', '+628125837046', '86', '86', 'Anda mendapat kiriman sebesar 1200000 dari Sholeha ke no rek.9000042942095', '1', '1200000', 'LOKAL', 'C2B', '2021-09-05', '2021-09-05', 'new'),
(19, '86', '326', '86', '6', 'Abdi Rahman', 'ROSLINA', '+62123456781', '+6281347188391', '86', '86', 'Anda mendapat kiriman sebesar 2651500 dari Abdi Rahman ke no rek.008201058456504', '1', '2651500', 'LOKAL', 'C2B', '2021-09-06', '2021-09-06', 'new'),
(20, '86', '326', '86', '6', 'Khoirun Nisya', 'ARTI NUR ANUGRAHANIN', '+62123456781', '+6282281444027', '86', '86', 'Anda mendapat kiriman sebesar 404000 dari Khoirun Nisya ke no rek.062901018705501', '1', '404000', 'LOKAL', 'C2B', '2021-09-07', '2021-09-07', 'new'),
(21, '86', '326', '86', '6', 'Muhammad Said Irawan', 'DWI NOOR ANGGRAINI', '+62123456781', '+6282251116717', '86', '86', 'Anda mendapat kiriman sebesar 1201500 dari Muhammad Said Irawan ke no rek.344101002577503', '1', '1201500', 'LOKAL', 'C2B', '2021-09-08', '2021-09-08', 'new'),
(22, '86', '338', '86', '6', 'Ginanjar Wirakusumah', 'MARLINDA RANNY MALAR', '+62123456781', '+628984593382', '86', '86', 'Anda mendapat kiriman sebesar 1860000 dari Ginanjar Wirakusumah ke no rek.016801058958502', '1', '1860000', 'LOKAL', 'C2B', '2021-09-09', '2021-09-09', 'new'),
(23, '86', '338', '86', '6', 'Juniarti Andries', 'JUNIARTI ANDRIES', '+62123456781', '+6285240069993', '86', '86', 'Anda mendapat kiriman sebesar 131500 dari Juniarti Andries ke no rek.1500005150733', '1', '131500', 'LOKAL', 'C2B', '2021-09-10', '2021-09-10', 'new'),
(24, '86', '338', '86', '6', 'Marlyn Christina Kasiaha', 'MARLYN CRISTINA KASI', '+62123456781', '+6285256389329', '86', '86', 'Anda mendapat kiriman sebesar 590000 dari Marlyn Christina Kasiaha ke no rek.1500016029702', '1', '590000', 'LOKAL', 'C2B', '2021-09-11', '2021-09-11', 'new'),
(25, '86', '338', '86', '6', 'Mutmainna Palamani', 'MUTMAINNA PALAMANI', '+62123456781', '+6285241855345', '86', '86', 'Anda mendapat kiriman sebesar 500000 dari Mutmainna Palamani ke no rek.1700000416184', '1', '500000', 'LOKAL', 'C2B', '2021-09-12', '2021-09-12', 'new'),
(26, '86', '338', '86', '6', 'Ridho Akbar Fachrianto', 'DESNY NATALIA SRIJON', '+62123456781', '+6285240487778', '86', '86', 'Anda mendapat kiriman sebesar 141500 dari Ridho Akbar Fachrianto ke no rek.515301006298500', '1', '141500', 'LOKAL', 'C2B', '2021-09-13', '2021-09-13', 'new'),
(27, '86', '339', '86', '6', 'Mona Valentin Kumendong', 'Ibu MONA VALENTIN KUMENDONG', '+62123456781', '+6285256452653', '86', '86', 'Anda mendapat kiriman sebesar 1070000 dari Mona Valentin Kumendong ke no rek.0842173044', '1', '1070000', 'LOKAL', 'C2B', '2021-09-14', '2021-09-14', 'new'),
(28, '86', '36', '86', '6', 'Diah Ayu Oktaviani', 'Sdri DIAH AYU OKTAVIANI', '+62123456781', '+6282122037781', '86', '86', 'Anda mendapat kiriman sebesar 246000 dari Diah Ayu Oktaviani ke no rek.0685642290', '1', '246000', 'LOKAL', 'C2B', '2021-09-15', '2021-09-15', 'new'),
(29, '86', '36', '86', '6', 'Diah Ayu Oktaviani', 'Sdri DIAH AYU OKTAVIANI', '+62123456781', '+6282122037781', '86', '86', 'Anda mendapat kiriman sebesar 290000 dari Diah Ayu Oktaviani ke no rek.0712987418', '1', '290000', 'LOKAL', 'C2B', '2021-09-16', '2021-09-16', 'new'),
(30, '86', '36', '86', '6', 'SYAIFUL ARIFIN', 'EMI ZAKIA', '+62123456781', '+6281310118422', '86', '86', 'Anda mendapat kiriman sebesar 591500 dari SYAIFUL ARIFIN ke no rek.8010599611', '1', '591500', 'LOKAL', 'C2B', '2021-09-17', '2021-09-17', 'new'),
(31, 'INDONESIA', 'BANYUMAS', 'INDONESIA', 'KEDIRI', 'YOGI PERMADANI', 'DANI JANU PRATAMA', '+62812223334445', '+6285731155692', 'INDONESIA', 'INDONESIA', 'Anda mendapat kiriman sebesar 700000 dari YOGI PERMADANI melalui FinChannel', '1', '700000', 'LOKAL', 'C2C', '2021-09-18', '2021-09-18', 'new'),
(32, 'INDONESIA', 'TOLITOLI', 'INDONESIA', 'TOLITOLI', 'ANHAR', 'AMBOTUWO', '+62812223334445', '+628135436495', 'INDONESIA', 'INDONESIA', 'Anda mendapat kiriman sebesar 1500000 dari ANHAR melalui FinChannel', '1', '1500000', 'LOKAL', 'C2C', '2021-09-19', '2021-09-19', 'new'),
(33, 'HKG', 'Hong Kong', 'Indonesia', 'Badung', 'AYUNIK SULASTRI', 'SDR MADE  BAGIADA', '+628132129896986', '+6281558030298', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 7000000 dari AYUNIK SULASTRI ke no rek.0507018865', '1', '7000000', 'INTERNASIONAL', 'C2B', '2021-09-20', '2021-09-20', 'new'),
(34, 'HKG', 'Hong Kong', 'Indonesia', 'Balikpapan', 'NITA CAROLINA', 'NITA CAROLINA', '+628132129896986', '+6282112258888', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 600000 dari NITA CAROLINA ke no rek.1912494696', '1', '600000', 'INTERNASIONAL', 'C2B', '2021-09-21', '2021-09-21', 'new'),
(35, 'HKG', 'Hong Kong', 'Indonesia', 'Balikpapan', 'YUNI PURWATI', 'FRIANDY INDRAWAN MASKUR', '+628132129896986', '+628563645555', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 5030000 dari YUNI PURWATI ke no rek.1400761112', '1', '5030000', 'INTERNASIONAL', 'C2B', '2021-09-22', '2021-09-22', 'new'),
(36, 'HKG', 'Hong Kong', 'Indonesia', 'Bandar Lampung', 'Isnaini Muhimah', 'M YUSUF', '+628132129896986', '+6281362751335', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 4162000 dari Isnaini Muhimah ke no rek.581601009446506', '1', '4162000', 'INTERNASIONAL', 'C2B', '2021-09-23', '2021-09-23', 'new'),
(37, 'HKG', 'Hong Kong', 'Indonesia', 'Bandar Lampung', 'Isnaini Muhimah', 'M YUSUF', '+628132129896986', '+6281362751335', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 5630000 dari Isnaini Muhimah ke no rek.581601009446506', '1', '5630000', 'INTERNASIONAL', 'C2B', '2021-09-24', '2021-09-24', 'new'),
(38, 'HKG', 'Hong Kong', 'Indonesia', 'Bandar Lampung', 'MARNI PAMELA', 'IBU MARNI  PAMELA', '+628132129896986', '+628984277129', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 3800000 dari MARNI PAMELA ke no rek.0716741016', '1', '3800000', 'INTERNASIONAL', 'C2B', '2021-09-25', '2021-09-25', 'new'),
(39, 'HKG', 'Hong Kong', 'Indonesia', 'Bandar Lampung', 'Selvia Gusti warni', 'DILA DAMAYANTI', '+628132129896986', '+628521142343', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 1209472 dari Selvia Gusti warni ke no rek.0201578239', '1', '1209472', 'INTERNASIONAL', 'C2B', '2021-09-26', '2021-09-26', 'new'),
(40, 'HKG', 'Hong Kong', 'Indonesia', 'Bandar Lampung', 'Suryo harsono Haridadi', 'ESTERINE SUSIANA', '+628132129896986', '+6281367037590', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 9377168 dari Suryo harsono Haridadi ke no rek.028501073850503', '1', '9377168', 'INTERNASIONAL', 'C2B', '2021-09-27', '2021-09-27', 'new'),
(41, 'HKG', 'Hong Kong', 'Indonesia', 'Bandung', 'JAMROAH BT KANIO CARSIYAN', 'SUHERMAN', '+628132129896986', '+6281383072102', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 7200000 dari JAMROAH BT KANIO CARSIYAN ke no rek.9000026849902', '1', '7200000', 'INTERNASIONAL', 'C2B', '2021-09-28', '2021-09-28', 'new'),
(42, 'HKG', 'Hong Kong', 'Indonesia', 'Bandung', 'Siti rohayati bt madrawi darpin', 'IBU KASIH  BT SADIAN', '+628132129896986', '+6285642002376', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 5000700 dari Siti rohayati bt madrawi darpin ke no rek.0718297917', '1', '5000700', 'INTERNASIONAL', 'C2B', '2021-09-29', '2021-09-29', 'new'),
(43, 'HKG', 'Hong Kong', 'Indonesia', 'Bandung', 'TURISEM', '-   TURISEM', '+628132129896986', '+6287837866725', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 9380000 dari TURISEM ke no rek.0288509858', '1', '9380000', 'INTERNASIONAL', 'C2B', '2021-09-30', '2021-09-30', 'new'),
(44, 'HKG', 'Hong Kong', 'Indonesia', 'Bangkalan', 'IKA FITRIANINGSIH', 'M MUSTAIN', '+628132129896986', '+6287853464404', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 9000000 dari IKA FITRIANINGSIH ke no rek.1030639223', '1', '9000000', 'INTERNASIONAL', 'C2B', '2021-10-01', '2021-10-01', 'new'),
(45, 'HKG', 'Hong Kong', 'Indonesia', 'Bangkalan', 'MEGAWATI DEWI BUDIONO', 'SDRI MEGAWATI DEWI BUDIONO', '+628132129896986', '+628520211293', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 5616035 dari MEGAWATI DEWI BUDIONO ke no rek.0983918986', '1', '5616035', 'INTERNASIONAL', 'C2B', '2021-10-02', '2021-10-02', 'new'),
(46, 'HKG', 'Hong Kong', 'Indonesia', 'Banjar', 'HARTINI SUNARTO', 'ANISA HIZEKRIYAH', '+628132129896986', '+6287860026385', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 6000000 dari HARTINI SUNARTO ke no rek.635101009255530', '1', '6000000', 'INTERNASIONAL', 'C2B', '2021-10-03', '2021-10-03', 'new'),
(47, 'HKG', 'Hong Kong', 'Indonesia', 'Banjar', 'HARTINI SUNARTO', 'ANISA HIZEKRIYAH', '+628132129896986', '+6287860026385', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 9000000 dari HARTINI SUNARTO ke no rek.635101009255530', '1', '9000000', 'INTERNASIONAL', 'C2B', '2021-10-04', '2021-10-04', 'new'),
(48, 'HKG', 'Hong Kong', 'Indonesia', 'Banjar', 'fitriani', 'JONI WILIANTO', '+628132129896986', '+6289515988516', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 510000 dari fitriani ke no rek.2030585405', '1', '510000', 'INTERNASIONAL', 'C2B', '2021-10-05', '2021-10-05', 'new'),
(49, 'HKG', 'Hong Kong', 'Indonesia', 'Banjarbaru', 'FITRI   RAHMAWATI SHINTYA', 'MIRA', '+628132129896986', '+6282339938882', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 3000000 dari FITRI   RAHMAWATI SHINTYA ke no rek.0310006855004', '1', '3000000', 'INTERNASIONAL', 'C2B', '2021-10-06', '2021-10-06', 'new'),
(50, 'HKG', 'Hong Kong', 'Indonesia', 'Banjarnegara', 'Daryanti Ali Sareat', 'AMALIA NUR FITRIANA', '+628132129896986', '+6282136730308', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 9038000 dari Daryanti Ali Sareat ke no rek.662601025641536', '1', '9038000', 'INTERNASIONAL', 'C2B', '2021-10-07', '2021-10-07', 'new'),
(51, 'HKG', 'Hong Kong', 'Indonesia', 'Banjarnegara', 'HARTATI', 'SDRI   HARTATI', '+628132129896986', '+6285729686386', 'HKG', 'Indonesia', 'Anda mendapat kiriman sebesar 469000 dari HARTATI ke no rek.0417667904', '1', '469000', 'INTERNASIONAL', 'C2B', '2021-10-08', '2021-10-08', 'new');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t0source_ltkl`
--

CREATE TABLE `t0source_ltkl` (
  `id` int(12) NOT NULL,
  `sender_name` varchar(50) NOT NULL,
  `sender_country` varchar(50) NOT NULL,
  `sender_addr` varchar(250) NOT NULL,
  `sender_id` varchar(50) NOT NULL,
  `destbankacc` varchar(30) NOT NULL,
  `notes` varchar(50) NOT NULL,
  `recept_name` varchar(50) NOT NULL,
  `recept_addr` varchar(250) NOT NULL,
  `recept_city` varchar(50) NOT NULL,
  `recept_city1` varchar(50) NOT NULL,
  `recept_province` varchar(50) NOT NULL,
  `recept_province1` varchar(50) NOT NULL,
  `recept_id` varchar(30) NOT NULL,
  `destamount` varchar(20) NOT NULL,
  `sender_aiming` varchar(100) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table source for LTKL report';

--
-- Dumping data untuk tabel `t0source_ltkl`
--

INSERT INTO `t0source_ltkl` (`id`, `sender_name`, `sender_country`, `sender_addr`, `sender_id`, `destbankacc`, `notes`, `recept_name`, `recept_addr`, `recept_city`, `recept_city1`, `recept_province`, `recept_province1`, `recept_id`, `destamount`, `sender_aiming`, `trx_date`, `datestamp`, `status`) VALUES
(1, 'CALVIN', 'JAPAN', 'TAGAWA-SHI OOAZANARA 1551-112', 'LD37081123RB', '737921123', 'BNI46', 'IBU WANIWA', 'JALAN KRAMAT RT 01 RW 02 NO 15', 'LUBANG BUAYA  INDONE', 'LUBANG BUAYA  INDONE', 'DKI JAKARTA', 'DKI JAKARTA', '', '1125796', 'FAMILY MAINTENA', '2021-06-09', '2021-06-09', 'new'),
(2, 'WANTO', 'JAPAN', 'TSU-SHI KUMOZU HONGOCHO 1216-3', 'PN11964123JA', '294480123', 'BNI46', 'IBU NUR IS', 'LANGUT RT 18 RW 04 KEC LOHBENE', 'INDRAMAYU JAWA BARAT', 'INDRAMAYU JAWA BARAT', 'SULAWESI SELATAN', 'SULAWESI SELATAN', '', '6495381', 'FAMILY MAINTENA', '2021-06-09', '2021-06-09', 'new'),
(3, 'MAEMUNAH', 'JAPAN', 'TSU-SHI KAWAKATACHO 501-14 HAI', 'HE43224123JA', '229640123', 'BNI46', 'IBU KARINA', 'PRAPAGKIDUL RT5 RW2 KEL PRAPA', 'KAB. BREBES JATENG', 'KAB. BREBES JA TENG', 'JAWA TENGAH', 'JAWA TENGAH', '', '491563', 'FAMILY MAINTENA', '2021-06-09', '2021-06-09', 'new'),
(4, 'ROSI', 'JAPAN', 'FUKUOKA-SHI NISHI-KU KUWABARA', 'HE99265123RD', '504901123', 'BNI46', 'IBU LINA', 'JL DAMANHURI PERUM BUKIT TEMIN', 'KALTIM', 'KALTIM', 'JAWA BARAT', 'JAWA BARAT', '', '40685594', 'FAMILY MAINTENA', '2021-06-09', '2021-06-09', 'new'),
(5, 'YANTO', 'JAPAN', 'SAMBU-GUN KUJUKURI MACHI KATAK', 'LD83108123EE', '757352123', 'BNI46', 'BAPAK YUWONO', 'PENJAJAP TIMUR RT 001 07573525', 'PEMANGKAT', 'PEMANGKAT', 'SUMATERA UTARA', 'SUMATERA UTARA', '', '3734066', 'FAMILY MAINTENA', '2021-06-09', '2021-06-09', 'new'),
(6, 'SRI YULIANTI', 'JAPAN', 'TAKARAZUKA-SHI KUCHITANI HIGAS', 'HE81960123LA', '604257123', 'BNI46', 'IBU SRI SUSANTI', '12740 KALIBATA TIMUR RT RW 008', 'KALIBATA', 'KALIBATA', 'JAKARTA SELATAN', 'JAKARTA SELATAN', '', '1140063', 'PERSONAL SAVING', '2021-06-09', '2021-06-09', 'new'),
(7, 'NUR CAHYO', 'JAPAN', 'ORA-GUN ITAKURA MACHI ITAKURA', 'DX76011123EA', '363586123', 'BNI46', 'SDR MULYADI', 'PEDUKUHAN VII KREMBANGAN RT027', 'DIY', 'DIY', 'JAKARTA TIMUR', 'JAKARTA TIMUR', '', '12877923', 'FAMILY MAINTENA', '2021-06-09', '2021-06-09', 'new'),
(8, 'EGI BARA', 'JAPAN', 'MATSUDO-SHI NISHIMABASHIKURAMO', 'LD97692123FA', '3480443123', 'BCA', 'LISA', 'KP CIBINONG PS SIRNAGAIH RT RW', 'INDONESIA', 'INDONESIA', 'JAWA BARAT', 'JAWA BARAT', '', '19193021', 'PERSONAL SAVING', '2021-06-09', '2021-06-09', 'new'),
(9, 'LUMIYANTI', 'JAPAN', 'NAGOYA-SHI MIDORI-KU NANRYO 20', 'HE24524123JA', '5012017123', 'PANIN', 'LINA', 'JIN BAWEAN NO.27/29 KACAMATAN', 'INDONESIA', 'INDONESIA', 'KALIMANTAN BARAT', 'KALIMANTAN BARAT', '', '1788564', 'FAMILY MAINTENA', '2021-06-09', '2021-06-09', 'new');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t0source_sipesat`
--

CREATE TABLE `t0source_sipesat` (
  `id` int(12) NOT NULL,
  `customer_code` varchar(20) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `birth_place` varchar(100) NOT NULL,
  `birth_date` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `id_card_number` varchar(50) NOT NULL,
  `id_card_number_other` varchar(20) NOT NULL,
  `customer_cif` varchar(50) NOT NULL,
  `register_date` varchar(10) NOT NULL,
  `customer_type` varchar(20) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table source for SIPESAT report';

--
-- Dumping data untuk tabel `t0source_sipesat`
--

INSERT INTO `t0source_sipesat` (`id`, `customer_code`, `customer_name`, `birth_place`, `birth_date`, `address`, `id_card_number`, `id_card_number_other`, `customer_cif`, `register_date`, `customer_type`, `trx_date`, `datestamp`, `status`) VALUES
(1, '1', 'Eko suprapti', 'PONOROGO', '1962-10-17', 'Jl Karang Anyar 3 No 04', '6372012345620105', '6285247850196', '195101327393', '', '', '', '2021-08-19', 'old'),
(2, '1', 'Rangga Diva Saputra', 'depok', '1994-01-05', 'JL.KAKAP.NO.54KAV.BLOK.C', '3672123456780203', '6281386755495', '195101327452', '', '', '', '2021-08-19', 'old'),
(3, '1', 'Christoffel Harefa', 'Madula', '1955-06-18', 'Jalan Robert', '1271234567890001', '628127804790', '195101327746', '', '', '', '2021-08-19', 'old'),
(4, '1', 'INDRI SETIAWATI', 'Jakarta', '1980-02-15', 'Jl. LURUS III NO. 6', '3172123456780011', '6281385216565', '195101327878', '', '', '', '2021-08-19', 'old'),
(5, '1', 'Gusti ngurah bagus arta bangun', 'Gilimanuk', '1991-01-06', 'Jl Raya Denpasar Gilimanuk', '911234567452', '6287741357571', '195101329158', '', '', '', '2021-08-19', 'old'),
(6, '1', 'Benediktus M. Steven', 'Waingapu', '1995-05-25', 'Jln Erlangga Padadita', '16123456780027', '6282247721074', '195101331063', '', '', '', '2021-08-19', 'old'),
(7, '1', 'Zaenal Arifin', 'Surabaya', '1978-06-06', 'JL DUKUH MENANGGAL 28-B ', '780123456707', '6281231217581', '195101331076', '', '', '', '2021-08-19', 'old'),
(8, '1', 'Trimadiawaty', 'Jakarta', '1989-04-05', 'TOKO IBRA', '6372055123420001', '6285247851234', '195101321234', '', '', '', '2021-08-19', 'old'),
(9, '1', 'Muhamad faisal', 'Jakarta', '1966-11-30', 'Kp. Sompok Girang', '3672080512340003', '6281386751234', '195101321234', '', '', '', '2021-08-19', 'old'),
(10, '1', 'Wulandari', 'Bandung', '1964-08-03', 'Perum Wale Pineleng Blok A2 No 1', '1278041812340001', '628127801234', '195101321234', '', '', '', '2021-08-19', 'old'),
(11, '1', 'ERNAWATI SH', 'Praya', '1982-03-14', 'Desa Waybaru Bakauheni Lampung S', '3172025512340011', '6281385211234', '195101321234', '', '', '', '2021-08-19', 'old'),
(12, '1', 'Zaenal Arifin', 'Serang', '1972-05-12', 'Kp Pabuaran Gg Mesjid II', '3175036312340008', '6287773391234', '195101321234', '', '', '', '2021-08-19', 'old'),
(13, '1', 'wahyuni nengsih', 'Seririt', '1983-03-29', 'Jln Erlangga Padadita', '3174095312340004', '6285216471234', '195101321234', '', '', '', '2021-08-19', 'old'),
(14, '1', 'Komaryanto', 'Tulung Selapan', '2000-08-19', 'Jl Jend Sudirman Gg Karya 3', '3273256912340003', '6289656111234', '195101321234', '', '', '', '2021-08-19', 'old'),
(15, '1', 'Jong Visanty', 'Samarinda', '1988-01-31', 'Jl Gunung Simanukmanuk GG Angrek', '5202016512340003', '6287743241234', '195101321234', '', '', '', '2021-08-19', 'old'),
(16, '1', 'Irianti Bohang', '-', '1971-07-01', 'Jalan P Flores No 35', '3672032212340001', '6285158171234', '195101321234', '', '', '', '2021-08-19', 'old');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t1clean_danafloat`
--

CREATE TABLE `t1clean_danafloat` (
  `id` int(12) NOT NULL,
  `id_source` int(12) NOT NULL,
  `wallet_code` varchar(30) NOT NULL,
  `trx_code` varchar(30) NOT NULL,
  `trx_id` varchar(30) NOT NULL,
  `trx_type` varchar(30) NOT NULL,
  `trx_value` varchar(20) NOT NULL,
  `description` varchar(250) NOT NULL,
  `credit` varchar(20) NOT NULL,
  `debit` varchar(20) NOT NULL,
  `syslogno` varchar(30) NOT NULL,
  `channel_id` varchar(20) NOT NULL,
  `srac` varchar(30) NOT NULL,
  `dsac` varchar(30) NOT NULL,
  `trx_datetime` varchar(20) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table clean for Dana Float report';

--
-- Dumping data untuk tabel `t1clean_danafloat`
--

INSERT INTO `t1clean_danafloat` (`id`, `id_source`, `wallet_code`, `trx_code`, `trx_id`, `trx_type`, `trx_value`, `description`, `credit`, `debit`, `syslogno`, `channel_id`, `srac`, `dsac`, `trx_datetime`, `datestamp`, `status`) VALUES
(1, 1, '195101437000', 'WS_TRX_TRANSFER', '111890372,', 'Top Up', '475500', 'Top Up melalui Mandiri dengan nomor transaksi 0819000509088287614743008', '475500', '0', '2108190176004033', '4', '+628177019032716552298813', '', '2021-08-19 00:02:31', '2021083011', 'new'),
(2, 2, '195101416720', 'WS_TRX_TRANSFER', '111890392,', 'PULSA', '10223', 'Topup Pulsa THREE denom 10000 ke 08970339354', '0', '10223', '2108190176004059', '1', '+628814681591', '', '2021-08-19 00:02:48', '2021083011', 'new'),
(3, 3, '195101437000', 'WS_TRX_TRANSFER', '111890412,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657655 amount 55000', '0', '55500', '2108190176004088', '1', '+6288287614743', '', '2021-08-19 00:03:09', '2021083011', 'new'),
(4, 4, '195101422579', 'WS_TRX_TRANSFER', '111890432,', 'PULSADATA', '17675', 'Pembelian PULSA - INDOSAT', '0', '17675', '2108190176004161', '34', '+6285758217161', '', '2021-08-19 00:04:30', '2021083011', 'new'),
(5, 5, '195101437626', 'WS_TRX_TRANSFER', '111890452,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657687 amount 55000', '0', '55500', '2108190176004397', '1', '+6289652945369', '', '2021-08-19 00:08:31', '2021083011', 'new'),
(6, 6, '195101315022', 'WS_TRX_TRANSFER', '111890472,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657691 amount 724500', '0', '725000', '2108190176004466', '1', '+6282183079380', '', '2021-08-19 00:09:09', '2021083011', 'new'),
(7, 7, '195101291593', 'WS_TRX_TRANSFER', '111890492,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657697 amount 419500', '0', '420000', '2108190176004489', '1', '+6281287939124', '', '2021-08-19 00:09:31', '2021083011', 'new'),
(8, 8, '195101339878', 'WS_TRX_TRANSFER', '111890512,', 'BILLER', '389000', 'Bayar Telkom nomor 021119657688 amount 388500', '0', '389000', '2108190176004513', '1', '+6281367659893', '', '2021-08-19 00:09:58', '2021083011', 'new'),
(9, 9, '195101375661', 'WS_TRX_TRANSFER', '111890532,', 'BILLER', '40000', 'Bayar Telkom nomor 021119657709 amount 39500', '0', '40000', '2108190176004588', '1', '+6285811301689', '', '2021-08-19 00:11:11', '2021083011', 'new'),
(10, 10, '195101275570', 'WS_TRX_TRANSFER', '111890552,', 'Top Up', '269000', 'Top Up melalui BCA dengan nomor transaksi 210819001053', '269000', '0', '2108190176004589', '4', '+628177019032716552298813', '', '2021-08-19 00:11:11', '2021083011', 'new'),
(11, 11, '195101275570', 'WS_TRX_TRANSFER', '111890572,', 'BILLER', '269000', 'Bayar Telkom nomor 021119657706 amount 268500', '0', '269000', '2108190176004623', '1', '+6285295090673', '', '2021-08-19 00:11:38', '2021083011', 'new'),
(12, 12, '195101216635', 'WS_TRX_TRANSFER', '111890574,', 'Bayar/Beli', '100000', 'Telkomsel Reguler NGRS nomor 081368624440 Nominal 100000', '0', '100000', '2108190176004629', '19', '+6281366342466', '', '2021-08-19 00:11:45', '2021083011', 'new'),
(13, 13, '195101315022', 'WS_TRX_TRANSFER', '111890592,', 'Top Up', '1450000', 'Top Up melalui BCA dengan nomor transaksi 210819001303', '1450000', '0', '2108190176004714', '4', '+628177019032716552298813', '', '2021-08-19 00:13:13', '2021083011', 'new'),
(14, 14, '195101315022', 'WS_TRX_TRANSFER', '111890612,', 'BILLER', '757000', 'Bayar Telkom nomor 021119657720 amount 756500', '0', '757000', '2108190176004744', '1', '+6282183079380', '', '2021-08-19 00:13:39', '2021083011', 'new'),
(15, 15, '195101416720', 'WS_TRX_TRANSFER', '111890632,', 'DATA', '16500', 'Topup  denom 15000 ke 081246285559', '0', '16500', '2108190176004765', '1', '+628814681591', '', '2021-08-19 00:13:54', '2021083011', 'new'),
(16, 16, '195101339878', 'WS_TRX_TRANSFER', '111890652,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657726 amount 419500', '0', '420000', '2108190176004805', '1', '+6281367659893', '', '2021-08-19 00:14:29', '2021083011', 'new'),
(17, 17, '195101315022', 'WS_TRX_TRANSFER', '111890672,', 'BILLER', '757000', 'Bayar Telkom nomor 021119657738 amount 756500', '0', '757000', '2108190176004859', '1', '+6282183079380', '', '2021-08-19 00:15:33', '2021083011', 'new'),
(18, 18, '195101318458', 'WS_TRX_TRANSFER', '111890692,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657747 amount 419500', '0', '420000', '2108190176004967', '1', '+6282117004177', '', '2021-08-19 00:17:10', '2021083011', 'new'),
(19, 19, '195101315022', 'WS_TRX_TRANSFER', '111890712,', 'Top Up', '1314000', 'Top Up melalui BCA dengan nomor transaksi 210819001718', '1314000', '0', '2108190176004985', '4', '+628177019032716552298813', '', '2021-08-19 00:17:30', '2021083011', 'new'),
(20, 20, '195101275570', 'WS_TRX_TRANSFER', '111890732,', 'Top Up', '269000', 'Top Up melalui BCA dengan nomor transaksi 210819001707', '269000', '0', '2108190176004987', '4', '+628177019032716552298813', '', '2021-08-19 00:17:32', '2021083011', 'new'),
(21, 21, '195101442914', 'WS_TRX_TRANSFER', '111890752,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657755 amount 419500', '0', '420000', '2108190176005029', '1', '+6281287129285', '', '2021-08-19 00:18:07', '2021083011', 'new'),
(22, 22, '195101275570', 'WS_TRX_TRANSFER', '111890772,', 'BILLER', '269000', 'Bayar Telkom nomor 021119657767 amount 268500', '0', '269000', '2108190176005378', '1', '+6285295090673', '', '2021-08-19 00:23:48', '2021083011', 'new'),
(23, 23, '195101462384', 'WS_TRX_TRANSFER', '111890792,', 'Top Up', '420000', 'Top Up melalui BCA dengan nomor transaksi 210819002801', '420000', '0', '2108190176005558', '4', '+628177019032716552298813', '', '2021-08-19 00:28:24', '2021083011', 'new'),
(24, 24, '195101221479', 'WS_TRX_TRANSFER', '111890812,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657828 amount 55000', '0', '55500', '2108190176005615', '1', '+6285281458719', '', '2021-08-19 00:30:38', '2021083011', 'new'),
(25, 25, '195101429571', 'WS_TRX_TRANSFER', '111890832,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657843 amount 55000', '0', '55500', '2108190176005668', '1', '+6282273580276', '', '2021-08-19 00:32:36', '2021083011', 'new'),
(26, 26, '195101437000', 'WS_TRX_TRANSFER', '111890852,', 'BILLER', '96000', 'Bayar Telkom nomor 021119657845 amount 95500', '0', '96000', '2108190176005673', '1', '+6288287614743', '', '2021-08-19 00:32:39', '2021083011', 'new'),
(27, 27, '195101251949', 'WS_TRX_TRANSFER', '111890872,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657855 amount 55000', '0', '55500', '2108190176005707', '1', '+6287874603635', '', '2021-08-19 00:33:32', '2021083011', 'new'),
(28, 28, '195101454460', 'WS_TRX_TRANSFER', '111890892,', 'DATA', '76500', 'Topup  denom 75000 ke 081284253815', '0', '76500', '2108190176005713', '1', '+6281541552654', '', '2021-08-19 00:34:07', '2021083011', 'new'),
(29, 29, '195101251949', 'WS_TRX_TRANSFER', '111890912,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657878 amount 55000', '0', '55500', '2108190176005738', '1', '+6287874603635', '', '2021-08-19 00:35:30', '2021083011', 'new'),
(30, 30, '195101291593', 'WS_TRX_TRANSFER', '111890932,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657882 amount 419500', '0', '420000', '2108190176005775', '1', '+6281287939124', '', '2021-08-19 00:36:06', '2021083011', 'new'),
(31, 31, '195101454460', 'WS_TRX_TRANSFER', '111890952,', 'DATA', '51500', 'Topup  denom 50000 ke 082164588354', '0', '51500', '2108190176005798', '1', '+6281541552654', '', '2021-08-19 00:36:33', '2021083011', 'new'),
(32, 32, '195101315022', 'WS_TRX_TRANSFER', '111890972,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657887 amount 724500', '0', '725000', '2108190176005803', '1', '+6282183079380', '', '2021-08-19 00:36:35', '2021083011', 'new'),
(33, 33, '195101251949', 'WS_TRX_TRANSFER', '111890992,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657893 amount 55000', '0', '55500', '2108190176005859', '1', '+6287874603635', '', '2021-08-19 00:38:05', '2021083011', 'new'),
(34, 34, '195101310390', 'WS_TRX_TRANSFER', '111891012,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657903 amount 55000', '0', '55500', '2108190176005931', '1', '+628111277110', '', '2021-08-19 00:39:52', '2021083011', 'new'),
(35, 35, '195101460880', 'WS_TRX_TRANSFER', '111891032,', 'PULSADATA', '15575', 'Pembelian PAKET DATA - THREE', '0', '15575', '2108190176005994', '34', '+62895352814252', '', '2021-08-19 00:42:12', '2021083011', 'new'),
(36, 36, '195101433576', 'WS_TRX_TRANSFER', '111891052,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657917 amount 419500', '0', '420000', '2108190176006023', '1', '+6281291518790', '', '2021-08-19 00:42:27', '2021083011', 'new'),
(37, 37, '195101461941', 'WS_TRX_TRANSFER', '111891072,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657919 amount 419500', '0', '420000', '2108190176006024', '1', '+6285283436167', '', '2021-08-19 00:42:28', '2021083011', 'new'),
(38, 38, '195101315022', 'WS_TRX_TRANSFER', '111891092,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657924 amount 724500', '0', '725000', '2108190176006061', '1', '+6282183079380', '', '2021-08-19 00:43:23', '2021083011', 'new'),
(39, 39, '195101315022', 'WS_TRX_TRANSFER', '111891112,', 'Top Up', '1650000', 'Top Up melalui BCA dengan nomor transaksi 210819004353', '1650000', '0', '2108190176006090', '4', '+628177019032716552298813', '', '2021-08-19 00:44:04', '2021083011', 'new'),
(40, 40, '195101315022', 'WS_TRX_TRANSFER', '111891132,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657923 amount 724500', '0', '725000', '2108190176006124', '1', '+6282183079380', '', '2021-08-19 00:44:39', '2021083011', 'new'),
(41, 41, '195101315022', 'WS_TRX_TRANSFER', '111891152,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657936 amount 724500', '0', '725000', '2108190176006176', '1', '+6282183079380', '', '2021-08-19 00:46:09', '2021083011', 'new'),
(42, 42, '195101461941', 'WS_TRX_TRANSFER', '111891172,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657952 amount 419500', '0', '420000', '2108190176006248', '1', '+6285283436167', '', '2021-08-19 00:48:36', '2021083011', 'new'),
(43, 43, '195101461941', 'WS_TRX_TRANSFER', '111891192,', 'Top Up', '830000', 'Top Up melalui BCA dengan nomor transaksi 210819005031', '830000', '0', '2108190176006314', '4', '+628177019032716552298813', '', '2021-08-19 00:50:48', '2021083011', 'new'),
(44, 44, '195101461941', 'WS_TRX_TRANSFER', '111891212,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657964 amount 419500', '0', '420000', '2108190176006338', '1', '+6285283436167', '', '2021-08-19 00:51:17', '2021083011', 'new'),
(45, 45, '195101461941', 'WS_TRX_TRANSFER', '111891232,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657989 amount 419500', '0', '420000', '2108190176006511', '1', '+6285283436167', '', '2021-08-19 00:55:56', '2021083011', 'new'),
(46, 46, '195101450962', 'WS_TRX_TRANSFER', '111891252,', 'BILLER', '55500', 'Bayar Telkom nomor 021119658002 amount 55000', '0', '55500', '2108190176006592', '1', '+6285841909202', '', '2021-08-19 00:57:56', '2021083011', 'new'),
(47, 47, '195101461941', 'WS_TRX_TRANSFER', '111891272,', 'Top Up', '715000', 'Top Up melalui BCA dengan nomor transaksi 210819005841', '715000', '0', '2108190176006632', '4', '+628177019032716552298813', '', '2021-08-19 00:58:57', '2021083011', 'new'),
(48, 48, '195101429571', 'WS_TRX_TRANSFER', '111891292,', 'BILLER', '55500', 'Bayar Telkom nomor 021119658019 amount 55000', '0', '55500', '2108190176006696', '1', '+6282273580276', '', '2021-08-19 01:00:17', '2021083011', 'new'),
(49, 49, '195101315022', 'WS_TRX_TRANSFER', '111891312,', 'Top Up', '686000', 'Top Up melalui BCA dengan nomor transaksi 210819010050', '686000', '0', '2108190176006731', '4', '+628177019032716552298813', '', '2021-08-19 01:01:00', '2021083011', 'new'),
(50, 50, '195101315022', 'WS_TRX_TRANSFER', '111891332,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657997 amount 724500', '0', '725000', '2108190176006771', '1', '+6282183079380', '', '2021-08-19 01:01:33', '2021083011', 'new'),
(51, 1, '195101437000', 'WS_TRX_TRANSFER', '111890372,', 'Top Up', '475500', 'Top Up melalui Mandiri dengan nomor transaksi 0819000509088287614743008', '475500', '0', '2108190176004033', '4', '+628177019032716552298813', '+6288287614743', '2021-08-19 00:02:31', '20210830', 'new'),
(52, 2, '195101416720', 'WS_TRX_TRANSFER', '111890392,', 'PULSA', '10223', 'Topup Pulsa THREE denom 10000 ke 08970339354', '0', '10223', '2108190176004059', '1', '+628814681591', '+62813212989695', '2021-08-19 00:02:48', '20210830', 'new'),
(53, 3, '195101437000', 'WS_TRX_TRANSFER', '111890412,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657655 amount 55000', '0', '55500', '2108190176004088', '1', '+6288287614743', '+6282110454751', '2021-08-19 00:03:09', '20210830', 'new'),
(54, 4, '195101422579', 'WS_TRX_TRANSFER', '111890432,', 'PULSADATA', '17675', 'Pembelian PULSA - INDOSAT', '0', '17675', '2108190176004161', '34', '+6285758217161', '+62811996932005', '2021-08-19 00:04:30', '20210830', 'new'),
(55, 5, '195101437626', 'WS_TRX_TRANSFER', '111890452,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657687 amount 55000', '0', '55500', '2108190176004397', '1', '+6289652945369', '+6282110454751', '2021-08-19 00:08:31', '20210830', 'new'),
(56, 6, '195101315022', 'WS_TRX_TRANSFER', '111890472,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657691 amount 724500', '0', '725000', '2108190176004466', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:09:09', '20210830', 'new'),
(57, 7, '195101291593', 'WS_TRX_TRANSFER', '111890492,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657697 amount 419500', '0', '420000', '2108190176004489', '1', '+6281287939124', '+6282110454751', '2021-08-19 00:09:31', '20210830', 'new'),
(58, 8, '195101339878', 'WS_TRX_TRANSFER', '111890512,', 'BILLER', '389000', 'Bayar Telkom nomor 021119657688 amount 388500', '0', '389000', '2108190176004513', '1', '+6281367659893', '+6282110454751', '2021-08-19 00:09:58', '20210830', 'new'),
(59, 9, '195101375661', 'WS_TRX_TRANSFER', '111890532,', 'BILLER', '40000', 'Bayar Telkom nomor 021119657709 amount 39500', '0', '40000', '2108190176004588', '1', '+6285811301689', '+6282110454751', '2021-08-19 00:11:11', '20210830', 'new'),
(60, 10, '195101275570', 'WS_TRX_TRANSFER', '111890552,', 'Top Up', '269000', 'Top Up melalui BCA dengan nomor transaksi 210819001053', '269000', '0', '2108190176004589', '4', '+628177019032716552298813', '+6285295090673', '2021-08-19 00:11:11', '20210830', 'new'),
(61, 11, '195101275570', 'WS_TRX_TRANSFER', '111890572,', 'BILLER', '269000', 'Bayar Telkom nomor 021119657706 amount 268500', '0', '269000', '2108190176004623', '1', '+6285295090673', '+6282110454751', '2021-08-19 00:11:38', '20210830', 'new'),
(62, 12, '195101216635', 'WS_TRX_TRANSFER', '111890574,', 'Bayar/Beli', '100000', 'Telkomsel Reguler NGRS nomor 081368624440 Nominal 100000', '0', '100000', '2108190176004629', '19', '+6281366342466', '+6282110762368', '2021-08-19 00:11:45', '20210830', 'new'),
(63, 13, '195101315022', 'WS_TRX_TRANSFER', '111890592,', 'Top Up', '1450000', 'Top Up melalui BCA dengan nomor transaksi 210819001303', '1450000', '0', '2108190176004714', '4', '+628177019032716552298813', '+6282183079380', '2021-08-19 00:13:13', '20210830', 'new'),
(64, 14, '195101315022', 'WS_TRX_TRANSFER', '111890612,', 'BILLER', '757000', 'Bayar Telkom nomor 021119657720 amount 756500', '0', '757000', '2108190176004744', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:13:39', '20210830', 'new'),
(65, 15, '195101416720', 'WS_TRX_TRANSFER', '111890632,', 'DATA', '16500', 'Topup  denom 15000 ke 081246285559', '0', '16500', '2108190176004765', '1', '+628814681591', '+6200000001271', '2021-08-19 00:13:54', '20210830', 'new'),
(66, 16, '195101339878', 'WS_TRX_TRANSFER', '111890652,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657726 amount 419500', '0', '420000', '2108190176004805', '1', '+6281367659893', '+6282110454751', '2021-08-19 00:14:29', '20210830', 'new'),
(67, 17, '195101315022', 'WS_TRX_TRANSFER', '111890672,', 'BILLER', '757000', 'Bayar Telkom nomor 021119657738 amount 756500', '0', '757000', '2108190176004859', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:15:33', '20210830', 'new'),
(68, 18, '195101318458', 'WS_TRX_TRANSFER', '111890692,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657747 amount 419500', '0', '420000', '2108190176004967', '1', '+6282117004177', '+6282110454751', '2021-08-19 00:17:10', '20210830', 'new'),
(69, 19, '195101315022', 'WS_TRX_TRANSFER', '111890712,', 'Top Up', '1314000', 'Top Up melalui BCA dengan nomor transaksi 210819001718', '1314000', '0', '2108190176004985', '4', '+628177019032716552298813', '+6282183079380', '2021-08-19 00:17:30', '20210830', 'new'),
(70, 20, '195101275570', 'WS_TRX_TRANSFER', '111890732,', 'Top Up', '269000', 'Top Up melalui BCA dengan nomor transaksi 210819001707', '269000', '0', '2108190176004987', '4', '+628177019032716552298813', '+6285295090673', '2021-08-19 00:17:32', '20210830', 'new'),
(71, 21, '195101442914', 'WS_TRX_TRANSFER', '111890752,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657755 amount 419500', '0', '420000', '2108190176005029', '1', '+6281287129285', '+6282110454751', '2021-08-19 00:18:07', '20210830', 'new'),
(72, 22, '195101275570', 'WS_TRX_TRANSFER', '111890772,', 'BILLER', '269000', 'Bayar Telkom nomor 021119657767 amount 268500', '0', '269000', '2108190176005378', '1', '+6285295090673', '+6282110454751', '2021-08-19 00:23:48', '20210830', 'new'),
(73, 23, '195101462384', 'WS_TRX_TRANSFER', '111890792,', 'Top Up', '420000', 'Top Up melalui BCA dengan nomor transaksi 210819002801', '420000', '0', '2108190176005558', '4', '+628177019032716552298813', '+6281274401478', '2021-08-19 00:28:24', '20210830', 'new'),
(74, 24, '195101221479', 'WS_TRX_TRANSFER', '111890812,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657828 amount 55000', '0', '55500', '2108190176005615', '1', '+6285281458719', '+6282110454751', '2021-08-19 00:30:38', '20210830', 'new'),
(75, 25, '195101429571', 'WS_TRX_TRANSFER', '111890832,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657843 amount 55000', '0', '55500', '2108190176005668', '1', '+6282273580276', '+6282110454751', '2021-08-19 00:32:36', '20210830', 'new'),
(76, 26, '195101437000', 'WS_TRX_TRANSFER', '111890852,', 'BILLER', '96000', 'Bayar Telkom nomor 021119657845 amount 95500', '0', '96000', '2108190176005673', '1', '+6288287614743', '+6282110454751', '2021-08-19 00:32:39', '20210830', 'new'),
(77, 27, '195101251949', 'WS_TRX_TRANSFER', '111890872,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657855 amount 55000', '0', '55500', '2108190176005707', '1', '+6287874603635', '+6282110454751', '2021-08-19 00:33:32', '20210830', 'new'),
(78, 28, '195101454460', 'WS_TRX_TRANSFER', '111890892,', 'DATA', '76500', 'Topup  denom 75000 ke 081284253815', '0', '76500', '2108190176005713', '1', '+6281541552654', '+6200000001271', '2021-08-19 00:34:07', '20210830', 'new'),
(79, 29, '195101251949', 'WS_TRX_TRANSFER', '111890912,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657878 amount 55000', '0', '55500', '2108190176005738', '1', '+6287874603635', '+6282110454751', '2021-08-19 00:35:30', '20210830', 'new'),
(80, 30, '195101291593', 'WS_TRX_TRANSFER', '111890932,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657882 amount 419500', '0', '420000', '2108190176005775', '1', '+6281287939124', '+6282110454751', '2021-08-19 00:36:06', '20210830', 'new'),
(81, 31, '195101454460', 'WS_TRX_TRANSFER', '111890952,', 'DATA', '51500', 'Topup  denom 50000 ke 082164588354', '0', '51500', '2108190176005798', '1', '+6281541552654', '+6200000001271', '2021-08-19 00:36:33', '20210830', 'new'),
(82, 32, '195101315022', 'WS_TRX_TRANSFER', '111890972,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657887 amount 724500', '0', '725000', '2108190176005803', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:36:35', '20210830', 'new'),
(83, 33, '195101251949', 'WS_TRX_TRANSFER', '111890992,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657893 amount 55000', '0', '55500', '2108190176005859', '1', '+6287874603635', '+6282110454751', '2021-08-19 00:38:05', '20210830', 'new'),
(84, 34, '195101310390', 'WS_TRX_TRANSFER', '111891012,', 'BILLER', '55500', 'Bayar Telkom nomor 021119657903 amount 55000', '0', '55500', '2108190176005931', '1', '+628111277110', '+6282110454751', '2021-08-19 00:39:52', '20210830', 'new'),
(85, 35, '195101460880', 'WS_TRX_TRANSFER', '111891032,', 'PULSADATA', '15575', 'Pembelian PAKET DATA - THREE', '0', '15575', '2108190176005994', '34', '+62895352814252', '+62811996932005', '2021-08-19 00:42:12', '20210830', 'new'),
(86, 36, '195101433576', 'WS_TRX_TRANSFER', '111891052,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657917 amount 419500', '0', '420000', '2108190176006023', '1', '+6281291518790', '+6282110454751', '2021-08-19 00:42:27', '20210830', 'new'),
(87, 37, '195101461941', 'WS_TRX_TRANSFER', '111891072,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657919 amount 419500', '0', '420000', '2108190176006024', '1', '+6285283436167', '+6282110454751', '2021-08-19 00:42:28', '20210830', 'new'),
(88, 38, '195101315022', 'WS_TRX_TRANSFER', '111891092,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657924 amount 724500', '0', '725000', '2108190176006061', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:43:23', '20210830', 'new'),
(89, 39, '195101315022', 'WS_TRX_TRANSFER', '111891112,', 'Top Up', '1650000', 'Top Up melalui BCA dengan nomor transaksi 210819004353', '1650000', '0', '2108190176006090', '4', '+628177019032716552298813', '+6282183079380', '2021-08-19 00:44:04', '20210830', 'new'),
(90, 40, '195101315022', 'WS_TRX_TRANSFER', '111891132,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657923 amount 724500', '0', '725000', '2108190176006124', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:44:39', '20210830', 'new'),
(91, 41, '195101315022', 'WS_TRX_TRANSFER', '111891152,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657936 amount 724500', '0', '725000', '2108190176006176', '1', '+6282183079380', '+6282110454751', '2021-08-19 00:46:09', '20210830', 'new'),
(92, 42, '195101461941', 'WS_TRX_TRANSFER', '111891172,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657952 amount 419500', '0', '420000', '2108190176006248', '1', '+6285283436167', '+6282110454751', '2021-08-19 00:48:36', '20210830', 'new'),
(93, 43, '195101461941', 'WS_TRX_TRANSFER', '111891192,', 'Top Up', '830000', 'Top Up melalui BCA dengan nomor transaksi 210819005031', '830000', '0', '2108190176006314', '4', '+628177019032716552298813', '+6285283436167', '2021-08-19 00:50:48', '20210830', 'new'),
(94, 44, '195101461941', 'WS_TRX_TRANSFER', '111891212,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657964 amount 419500', '0', '420000', '2108190176006338', '1', '+6285283436167', '+6282110454751', '2021-08-19 00:51:17', '20210830', 'new'),
(95, 45, '195101461941', 'WS_TRX_TRANSFER', '111891232,', 'BILLER', '420000', 'Bayar Telkom nomor 021119657989 amount 419500', '0', '420000', '2108190176006511', '1', '+6285283436167', '+6282110454751', '2021-08-19 00:55:56', '20210830', 'new'),
(96, 46, '195101450962', 'WS_TRX_TRANSFER', '111891252,', 'BILLER', '55500', 'Bayar Telkom nomor 021119658002 amount 55000', '0', '55500', '2108190176006592', '1', '+6285841909202', '+6282110454751', '2021-08-19 00:57:56', '20210830', 'new'),
(97, 47, '195101461941', 'WS_TRX_TRANSFER', '111891272,', 'Top Up', '715000', 'Top Up melalui BCA dengan nomor transaksi 210819005841', '715000', '0', '2108190176006632', '4', '+628177019032716552298813', '+6285283436167', '2021-08-19 00:58:57', '20210830', 'new'),
(98, 48, '195101429571', 'WS_TRX_TRANSFER', '111891292,', 'BILLER', '55500', 'Bayar Telkom nomor 021119658019 amount 55000', '0', '55500', '2108190176006696', '1', '+6282273580276', '+6282110454751', '2021-08-19 01:00:17', '20210830', 'new'),
(99, 49, '195101315022', 'WS_TRX_TRANSFER', '111891312,', 'Top Up', '686000', 'Top Up melalui BCA dengan nomor transaksi 210819010050', '686000', '0', '2108190176006731', '4', '+628177019032716552298813', '+6282183079380', '2021-08-19 01:01:00', '20210830', 'new'),
(100, 50, '195101315022', 'WS_TRX_TRANSFER', '111891332,', 'BILLER', '725000', 'Bayar Telkom nomor 021119657997 amount 724500', '0', '725000', '2108190176006771', '1', '+6282183079380', '+6282110454751', '2021-08-19 01:01:33', '20210830', 'new');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t1clean_lkpbu_309_310_311`
--

CREATE TABLE `t1clean_lkpbu_309_310_311` (
  `id` int(12) NOT NULL,
  `ticket_no` varchar(20) NOT NULL,
  `ticket_status` varchar(10) NOT NULL,
  `service` varchar(30) NOT NULL,
  `segname` varchar(100) NOT NULL,
  `opentime` varchar(20) NOT NULL,
  `closetime` varchar(20) NOT NULL,
  `code_309` varchar(3) NOT NULL,
  `code_310` varchar(3) NOT NULL,
  `code_311` varchar(3) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table clean for LKPBU (form 309, 310, 311)';

--
-- Dumping data untuk tabel `t1clean_lkpbu_309_310_311`
--

INSERT INTO `t1clean_lkpbu_309_310_311` (`id`, `ticket_no`, `ticket_status`, `service`, `segname`, `opentime`, `closetime`, `code_309`, `code_310`, `code_311`, `datestamp`, `status`) VALUES
(1, 'F2021040128887', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 00:10:06', '2021-04-01 00:38:30', '999', '201', '999', '2021-08-19', 'new'),
(2, 'F2021040128891', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 00:19:59', '2021-04-01 01:18:18', '999', '201', '999', '2021-08-20', 'new'),
(3, 'F2021040128980', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 05:20:18', '2021-04-01 20:50:36', '999', '201', '999', '2021-08-21', 'new'),
(4, 'F2021040129009', 'Close', 'Finpay Money', 'Registrasi', '2021-04-01 06:16:01', '2021-04-01 06:37:26', '999', '201', '999', '2021-08-22', 'new'),
(5, 'F2021040129034', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 07:24:24', '2021-04-01 17:53:42', '999', '201', '999', '2021-08-23', 'new'),
(6, 'F2021040129093', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-01 08:40:06', '2021-04-01 08:40:16', '999', '201', '999', '2021-08-24', 'new'),
(7, 'F2021040129099', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 08:45:49', '2021-04-01 20:54:07', '999', '201', '999', '2021-08-25', 'new'),
(8, 'F2021040129110', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 08:55:43', '2021-04-01 20:55:25', '999', '201', '999', '2021-08-26', 'new'),
(9, 'F2021040129159', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 09:48:42', '2021-04-01 10:38:29', '999', '201', '999', '2021-08-27', 'new'),
(10, 'F2021040129163', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 09:54:01', '2021-04-01 10:33:08', '999', '201', '999', '2021-08-28', 'new'),
(11, 'F2021040129200', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-01 10:34:18', '2021-04-01 11:40:25', '999', '201', '999', '2021-08-29', 'new'),
(12, 'F2021040129213', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 10:53:18', '2021-04-01 21:00:23', '999', '201', '999', '2021-08-30', 'new'),
(13, 'F2021040129239', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 11:23:43', '2021-04-05 15:23:40', '999', '201', '999', '2021-08-31', 'new'),
(14, 'F2021040129245', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-01 11:29:55', '2021-04-01 12:50:42', '999', '201', '999', '2021-09-01', 'new'),
(15, 'F2021040129266', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-01 11:56:02', '2021-04-01 13:23:19', '999', '201', '999', '2021-09-02', 'new'),
(16, 'F2021040129289', 'Close', 'Finpay Money', 'Registrasi', '2021-04-01 12:18:44', '2021-04-01 15:15:20', '999', '201', '999', '2021-09-03', 'new'),
(17, 'F2021040129297', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 12:27:51', '2021-04-01 13:55:37', '999', '201', '999', '2021-09-04', 'new'),
(18, 'F2021040129302', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 12:37:03', '2021-04-01 21:01:57', '999', '201', '999', '2021-09-05', 'new'),
(19, 'F2021040129342', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-01 13:36:58', '2021-04-01 15:59:56', '999', '201', '999', '2021-09-06', 'new'),
(20, 'F2021040129372', 'Close', 'Finpay Money', 'Informasi produk', '2021-04-01 14:11:18', '2021-04-01 14:12:15', '999', '201', '999', '2021-09-07', 'new'),
(21, 'F2021040129395', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-01 14:39:02', '2021-04-01 14:39:44', '999', '201', '999', '2021-09-08', 'new'),
(22, 'F2021040129399', 'Close', 'Finpay Money', 'Pengecekan Transaksi', '2021-04-01 14:45:06', '2021-04-01 15:07:41', '999', '201', '999', '2021-09-09', 'new'),
(23, 'F2021040129432', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 15:12:04', '2021-04-01 18:26:49', '999', '201', '999', '2021-09-10', 'new'),
(24, 'F2021040129463', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-01 15:52:41', '2021-04-01 15:57:32', '999', '201', '999', '2021-09-11', 'new'),
(25, 'F2021040129480', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 16:02:17', '2021-04-01 22:13:10', '999', '201', '999', '2021-09-12', 'new'),
(26, 'F2021040129486', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 16:10:28', '2021-04-01 16:10:41', '999', '201', '999', '2021-09-13', 'new'),
(27, 'F2021040129487', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 16:11:41', '2021-04-01 16:11:52', '999', '201', '999', '2021-09-14', 'new'),
(28, 'F2021040129489', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 16:13:08', '2021-04-01 16:13:22', '999', '201', '999', '2021-09-15', 'new'),
(29, 'F2021040129615', 'Close', 'Finpay Money', 'Pengecekan Transaksi', '2021-04-01 20:18:59', '2021-04-01 20:19:05', '999', '201', '999', '2021-09-16', 'new'),
(30, 'F2021040129617', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-01 20:20:49', '2021-04-01 23:43:43', '999', '201', '999', '2021-09-17', 'new'),
(31, 'F2021040129618', 'Close', 'Finpay Money', 'Pengecekan Transaksi', '2021-04-01 20:22:13', '2021-04-01 20:22:37', '999', '201', '999', '2021-09-18', 'new'),
(32, 'F2021040129627', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-01 20:35:51', '2021-04-01 20:36:00', '999', '201', '999', '2021-09-19', 'new'),
(33, 'F2021040129640', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 20:53:06', '2021-04-22 14:00:37', '999', '201', '999', '2021-09-20', 'new'),
(34, 'F2021040129652', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-01 21:04:18', '2021-04-06 14:37:29', '999', '201', '999', '2021-09-21', 'new'),
(35, 'F2021040129654', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-01 21:08:37', '2021-04-01 21:45:06', '999', '201', '999', '2021-09-22', 'new'),
(36, 'F2021040129655', 'Close', 'Finpay Money', 'Informasi produk', '2021-04-01 21:15:09', '2021-04-02 14:33:53', '999', '201', '999', '2021-09-23', 'new'),
(37, 'F2021040129713', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-01 23:00:20', '2021-04-01 23:00:30', '999', '201', '999', '2021-09-24', 'new'),
(38, 'F2021040129733', 'Close', 'Finpay Money', 'Pengecekan transaksi', '2021-04-01 23:49:53', '2021-04-06 08:00:37', '999', '201', '999', '2021-09-25', 'new'),
(39, 'F2021040229744', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 00:02:19', '2021-04-02 02:18:49', '999', '201', '999', '2021-09-26', 'new'),
(40, 'F2021040229777', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 02:10:43', '2021-04-02 02:26:17', '999', '201', '999', '2021-09-27', 'new'),
(41, 'F2021040229806', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 03:44:18', '2021-04-02 04:20:51', '999', '201', '999', '2021-09-28', 'new'),
(42, 'F2021040229828', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 04:32:56', '2021-04-02 04:43:56', '999', '201', '999', '2021-09-29', 'new'),
(43, 'F2021040229846', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 05:05:14', '2021-04-02 05:29:45', '999', '201', '999', '2021-09-30', 'new'),
(44, 'F2021040229914', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 07:36:31', '2021-04-02 07:58:45', '999', '201', '999', '2021-10-01', 'new'),
(45, 'F2021040229920', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 07:48:52', '2021-04-02 08:02:43', '999', '201', '999', '2021-10-02', 'new'),
(46, 'F2021040229925', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 07:58:46', '2021-04-02 08:11:31', '999', '201', '999', '2021-10-03', 'new'),
(47, 'F2021040229937', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 08:10:01', '2021-04-02 19:49:38', '999', '201', '999', '2021-10-04', 'new'),
(48, 'F2021040229984', 'Close', 'Finpay Money', 'Gagal Aktivasi', '2021-04-02 09:28:37', '2021-04-02 09:34:59', '999', '201', '999', '2021-10-05', 'new'),
(49, 'F2021040229997', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 09:47:12', '2021-04-03 01:23:32', '999', '201', '999', '2021-10-06', 'new'),
(50, 'F2021040230004', 'Close', 'Finpay Money', 'Gagal Aktivasi', '2021-04-02 09:58:11', '2021-04-02 10:03:20', '999', '201', '999', '2021-10-07', 'new'),
(51, 'F2021040230005', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 09:59:04', '2021-04-02 10:47:45', '999', '201', '999', '2021-10-08', 'new'),
(52, 'F2021040230025', 'Close', 'Finpay Money', 'Registrasi', '2021-04-02 10:26:42', '2021-04-02 15:04:06', '999', '201', '999', '2021-10-09', 'new'),
(53, 'F2021040230040', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 10:52:29', '2021-04-03 01:25:55', '999', '201', '999', '2021-10-10', 'new'),
(54, 'F2021040230058', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-02 11:36:37', '2021-04-05 16:19:23', '999', '201', '999', '2021-10-11', 'new'),
(55, 'F2021040230063', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 11:52:29', '2021-04-03 09:59:03', '999', '201', '999', '2021-10-12', 'new'),
(56, 'F2021040230080', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 12:17:40', '2021-04-02 12:24:53', '999', '201', '999', '2021-10-13', 'new'),
(57, 'F2021040230082', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 12:25:40', '2021-04-03 22:55:15', '999', '201', '999', '2021-10-14', 'new'),
(58, 'F2021040230123', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 13:57:00', '2021-04-02 13:57:10', '999', '201', '999', '2021-10-15', 'new'),
(59, 'F2021040230132', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 14:13:23', '2021-04-03 10:01:40', '999', '201', '999', '2021-10-16', 'new'),
(60, 'F2021040230138', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 14:27:55', '2021-04-03 10:05:30', '999', '201', '999', '2021-10-17', 'new'),
(61, 'F2021040230148', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 14:59:30', '2021-04-03 10:06:18', '999', '201', '999', '2021-10-18', 'new'),
(62, 'F2021040230160', 'Close', 'Finpay Money', 'Registrasi', '2021-04-02 15:05:00', '2021-04-02 15:22:47', '999', '201', '999', '2021-10-19', 'new'),
(63, 'F2021040230167', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 15:18:35', '2021-04-03 10:09:17', '999', '201', '999', '2021-10-20', 'new'),
(64, 'F2021040230169', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 15:22:19', '2021-04-03 10:09:59', '999', '201', '999', '2021-10-21', 'new'),
(65, 'F2021040230180', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-02 15:38:44', '2021-04-05 15:25:16', '999', '201', '999', '2021-10-22', 'new'),
(66, 'F2021040230185', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 15:48:01', '2021-04-03 10:11:00', '999', '201', '999', '2021-10-23', 'new'),
(67, 'F2021040230188', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 15:52:26', '2021-04-03 10:12:02', '999', '201', '999', '2021-10-24', 'new'),
(68, 'F2021040230191', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 15:55:47', '2021-04-02 15:55:53', '999', '201', '999', '2021-10-25', 'new'),
(69, 'F2021040230193', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 16:00:18', '2021-04-02 16:00:31', '999', '201', '999', '2021-10-26', 'new'),
(70, 'F2021040230210', 'Close', 'Finpay Money', 'Registrasi', '2021-04-02 16:26:06', '2021-04-22 12:17:49', '999', '201', '999', '2021-10-27', 'new'),
(71, 'F2021040230218', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 16:54:15', '2021-04-02 17:15:37', '999', '201', '999', '2021-10-28', 'new'),
(72, 'F2021040230226', 'Close', 'Finpay Money', 'Registrasi', '2021-04-02 17:02:06', '2021-04-02 17:18:45', '999', '201', '999', '2021-10-29', 'new'),
(73, 'F2021040230236', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 17:18:35', '2021-04-02 17:32:17', '999', '201', '999', '2021-10-30', 'new'),
(74, 'F2021040230244', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 17:34:41', '2021-04-02 17:36:32', '999', '201', '999', '2021-10-31', 'new'),
(75, 'F2021040230270', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 18:24:23', '2021-04-05 08:15:03', '999', '201', '999', '2021-11-01', 'new'),
(76, 'F2021040230288', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 19:27:10', '2021-04-02 19:27:18', '999', '201', '999', '2021-11-02', 'new'),
(77, 'F2021040230290', 'Close', 'Finpay Money', 'Pengecekan Transaksi', '2021-04-02 19:29:12', '2021-04-02 19:29:19', '999', '201', '999', '2021-11-03', 'new'),
(78, 'F2021040230371', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 23:19:51', '2021-04-02 23:26:45', '999', '201', '999', '2021-11-04', 'new'),
(79, 'F2021040230380', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 23:33:37', '2021-04-04 10:14:43', '999', '201', '999', '2021-11-05', 'new'),
(80, 'F2021040230382', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-02 23:34:16', '2021-04-03 00:00:46', '999', '201', '999', '2021-11-06', 'new'),
(81, 'F2021040330407', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 00:45:42', '2021-04-03 01:06:30', '999', '201', '999', '2021-11-07', 'new'),
(82, 'F2021040330409', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-03 00:56:20', '2021-04-05 15:26:35', '999', '201', '999', '2021-11-08', 'new'),
(83, 'F2021040330418', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 01:10:31', '2021-04-03 01:18:10', '999', '201', '999', '2021-11-09', 'new'),
(84, 'F2021040330427', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 01:35:44', '2021-04-03 10:18:23', '999', '201', '999', '2021-11-10', 'new'),
(85, 'F2021040330434', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 01:55:18', '2021-04-03 02:14:02', '999', '201', '999', '2021-11-11', 'new'),
(86, 'F2021040330436', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 02:00:09', '2021-04-03 02:22:49', '999', '201', '999', '2021-11-12', 'new'),
(87, 'F2021040330444', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 02:04:29', '2021-04-03 02:25:09', '999', '201', '999', '2021-11-13', 'new'),
(88, 'F2021040330515', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 06:18:16', '2021-04-03 06:49:59', '999', '201', '999', '2021-11-14', 'new'),
(89, 'F2021040330516', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 06:19:17', '2021-04-03 07:03:53', '999', '201', '999', '2021-11-15', 'new'),
(90, 'F2021040330556', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 08:03:08', '2021-04-03 08:03:19', '999', '201', '999', '2021-11-16', 'new'),
(91, 'F2021040330560', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 08:10:00', '2021-04-03 22:58:30', '999', '201', '999', '2021-11-17', 'new'),
(92, 'F2021040330579', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 08:30:19', '2021-04-03 08:43:56', '999', '201', '999', '2021-11-18', 'new'),
(93, 'F2021040330668', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-03 10:50:45', '2021-04-03 11:01:49', '999', '201', '999', '2021-11-19', 'new'),
(94, 'F2021040330685', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 11:27:44', '2021-04-03 11:27:58', '999', '201', '999', '2021-11-20', 'new'),
(95, 'F2021040330690', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 11:43:20', '2021-04-03 12:00:50', '999', '201', '999', '2021-11-21', 'new'),
(96, 'F2021040330691', 'Close', 'Finpay Money', 'Akun FM TerBlok', '2021-04-03 11:43:38', '2021-04-03 11:58:57', '999', '201', '999', '2021-11-22', 'new'),
(97, 'F2021040330710', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-03 12:19:06', '2021-04-03 12:54:37', '999', '201', '999', '2021-11-23', 'new'),
(98, 'F2021040330711', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-03 12:23:25', '2021-04-03 12:55:49', '999', '201', '999', '2021-11-24', 'new'),
(99, 'F2021040330712', 'Close', 'Finpay Money', 'Cash in Belum masuk', '2021-04-03 12:29:45', '2021-04-03 12:59:38', '999', '201', '999', '2021-11-25', 'new'),
(100, 'F2021040330721', 'Close', 'Finpay Money', 'Pengecekan transaksi', '2021-04-03 12:56:51', '2021-04-03 12:57:01', '999', '201', '999', '2021-11-26', 'new');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t1clean_lkpbu_312`
--

CREATE TABLE `t1clean_lkpbu_312` (
  `id` int(12) NOT NULL,
  `publication_code` varchar(5) NOT NULL,
  `description` varchar(250) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table clean for LKPBU 312';

-- --------------------------------------------------------

--
-- Struktur dari tabel `t1clean_lkpbu_313`
--

CREATE TABLE `t1clean_lkpbu_313` (
  `id` int(12) NOT NULL,
  `publication_code` varchar(5) NOT NULL,
  `description` varchar(250) NOT NULL,
  `file_location` varchar(250) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table clean for LKPBU 313';

-- --------------------------------------------------------

--
-- Struktur dari tabel `t1clean_ltdbb`
--

CREATE TABLE `t1clean_ltdbb` (
  `id` int(12) NOT NULL,
  `id_source` int(12) NOT NULL,
  `sender_country` varchar(100) NOT NULL,
  `sender_city` varchar(100) NOT NULL,
  `recept_country` varchar(100) NOT NULL,
  `recept_city` varchar(100) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `recept_name` varchar(100) NOT NULL,
  `sender_phone` varchar(100) NOT NULL,
  `recept_phone` varchar(100) NOT NULL,
  `sender_wn` varchar(100) NOT NULL,
  `recept_wn` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `trx_freq` varchar(20) NOT NULL,
  `trx_amount` varchar(20) NOT NULL,
  `trx_traffic` varchar(30) NOT NULL,
  `trx_type` varchar(30) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table clean for LTDBB report (G001, G002, G003)';

--
-- Dumping data untuk tabel `t1clean_ltdbb`
--

INSERT INTO `t1clean_ltdbb` (`id`, `id_source`, `sender_country`, `sender_city`, `recept_country`, `recept_city`, `sender_name`, `recept_name`, `sender_phone`, `recept_phone`, `sender_wn`, `recept_wn`, `description`, `trx_freq`, `trx_amount`, `trx_traffic`, `trx_type`, `trx_date`, `datestamp`, `status`) VALUES
(19, 1, 'INDONESIA', '108 - Bogor', 'INDONESIA', '1201 - Gresik', 'ADRIAN ALIMINSAH', 'SDR ADRIAN ALIMINSAH', '', '+6281310061906', '', '', 'Anda mendapat kiriman sebesar 600000 dari ADRIAN ALIMINSAH ke no rek.0178745292', '1', '600000', '', 'C2B', '2021-08-19', '20210830211453', 'cleaned'),
(20, 2, 'INDONESIA', '108 - Bogor', 'INDONESIA', '1201 - Gresik', 'HERU SUCAHYO', 'HENI', '', '+6285346565773', '', '', 'Anda mendapat kiriman sebesar 800000 dari Heru Sucahyo ke no rek.1480017881858', '1', '800000', '', 'C2B', '2021-08-20', '20210830211453', 'cleaned'),
(21, 3, 'INDONESIA', '108 - Bogor', 'INDONESIA', '1201 - Gresik', 'PRATAMA ADHE PUTRA', 'ARRAHMAN', '', '+6288225643969', '', '', 'Anda mendapat kiriman sebesar 200000 dari PRATAMA ADHE PUTRA ke no rek.2910696541', '1', '200000', '', 'C2B', '2021-08-21', '20210830211453', 'cleaned');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t1clean_ltkl`
--

CREATE TABLE `t1clean_ltkl` (
  `id` int(12) NOT NULL,
  `id_source` int(12) NOT NULL,
  `sender_name` varchar(50) NOT NULL,
  `sender_country` varchar(50) NOT NULL,
  `sender_addr` varchar(250) NOT NULL,
  `sender_id` varchar(50) NOT NULL,
  `destbankacc` varchar(30) NOT NULL,
  `notes` varchar(50) NOT NULL,
  `recept_name` varchar(50) NOT NULL,
  `recept_addr` varchar(250) NOT NULL,
  `recept_city` varchar(50) NOT NULL,
  `recept_city1` varchar(50) NOT NULL,
  `recept_province` varchar(50) NOT NULL,
  `recept_province1` varchar(50) NOT NULL,
  `recept_id` varchar(30) NOT NULL,
  `destamount` varchar(20) NOT NULL,
  `sender_aiming` varchar(100) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table clean for LTKL report';

-- --------------------------------------------------------

--
-- Struktur dari tabel `t1clean_sipesat`
--

CREATE TABLE `t1clean_sipesat` (
  `id` int(12) NOT NULL,
  `id_source` int(12) NOT NULL,
  `customer_code` varchar(20) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `birth_place` varchar(100) NOT NULL,
  `birth_date` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `id_card_number` varchar(50) NOT NULL,
  `id_card_number_other` varchar(20) NOT NULL,
  `customer_cif` varchar(50) NOT NULL,
  `register_date` varchar(10) NOT NULL,
  `customer_type` varchar(20) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table clean for SIPESAT report';

--
-- Dumping data untuk tabel `t1clean_sipesat`
--

INSERT INTO `t1clean_sipesat` (`id`, `id_source`, `customer_code`, `customer_name`, `birth_place`, `birth_date`, `address`, `id_card_number`, `id_card_number_other`, `customer_cif`, `register_date`, `customer_type`, `trx_date`, `datestamp`, `status`) VALUES
(65, 1, '1', 'Eko suprapti', 'PONOROGO', '1962-10-17', 'Jl Karang Anyar 3 No 04', '6372012345620105', '6285247850196', '195101327393', '', '', '', '20210830113205', 'new'),
(66, 2, '1', 'Rangga Diva Saputra', 'depok', '1994-01-05', 'JL.KAKAP.NO.54KAV.BLOK.C', '3672123456780203', '6281386755495', '195101327452', '', '', '', '20210830113205', 'new'),
(67, 3, '1', 'Christoffel Harefa', 'Madula', '1955-06-18', 'Jalan Robert', '1271234567890001', '628127804790', '195101327746', '', '', '', '20210830113205', 'new'),
(68, 4, '1', 'INDRI SETIAWATI', 'Jakarta', '1980-02-15', 'Jl. LURUS III NO. 6', '3172123456780011', '6281385216565', '195101327878', '', '', '', '20210830113205', 'new'),
(69, 5, '1', 'Gusti ngurah bagus arta bangun', 'Gilimanuk', '1991-01-06', 'Jl Raya Denpasar Gilimanuk', '911234567452', '6287741357571', '195101329158', '', '', '', '20210830113205', 'new'),
(70, 6, '1', 'Benediktus M. Steven', 'Waingapu', '1995-05-25', 'Jln Erlangga Padadita', '16123456780027', '6282247721074', '195101331063', '', '', '', '20210830113205', 'new'),
(71, 7, '1', 'Zaenal Arifin', 'Surabaya', '1978-06-06', 'JL DUKUH MENANGGAL 28-B ', '780123456707', '6281231217581', '195101331076', '', '', '', '20210830113205', 'new'),
(72, 8, '1', 'Trimadiawaty', 'Jakarta', '1989-04-05', 'TOKO IBRA', '6372055123420001', '6285247851234', '195101321234', '', '', '', '20210830113205', 'new'),
(73, 9, '1', 'Muhamad faisal', 'Jakarta', '1966-11-30', 'Kp. Sompok Girang', '3672080512340003', '6281386751234', '195101321234', '', '', '', '20210830113205', 'new'),
(74, 10, '1', 'Wulandari', 'Bandung', '1964-08-03', 'Perum Wale Pineleng Blok A2 No 1', '1278041812340001', '628127801234', '195101321234', '', '', '', '20210830113205', 'new'),
(75, 11, '1', 'ERNAWATI SH', 'Praya', '1982-03-14', 'Desa Waybaru Bakauheni Lampung S', '3172025512340011', '6281385211234', '195101321234', '', '', '', '20210830113205', 'new'),
(76, 12, '1', 'Zaenal Arifin', 'Serang', '1972-05-12', 'Kp Pabuaran Gg Mesjid II', '3175036312340008', '6287773391234', '195101321234', '', '', '', '20210830113205', 'new'),
(77, 13, '1', 'wahyuni nengsih', 'Seririt', '1983-03-29', 'Jln Erlangga Padadita', '3174095312340004', '6285216471234', '195101321234', '', '', '', '20210830113205', 'new'),
(78, 14, '1', 'Komaryanto', 'Tulung Selapan', '2000-08-19', 'Jl Jend Sudirman Gg Karya 3', '3273256912340003', '6289656111234', '195101321234', '', '', '', '20210830113205', 'new'),
(79, 15, '1', 'Jong Visanty', 'Samarinda', '1988-01-31', 'Jl Gunung Simanukmanuk GG Angrek', '5202016512340003', '6287743241234', '195101321234', '', '', '', '20210830113205', 'new'),
(80, 16, '1', 'Irianti Bohang', '-', '1971-07-01', 'Jalan P Flores No 35', '3672032212340001', '6285158171234', '195101321234', '', '', '', '20210830113205', 'new'),
(81, 1, '1', 'Eko suprapti', 'PONOROGO', '1962-10-17', 'Jl Karang Anyar 3 No 04', '6372012345620105', '6285247850196', '195101327393', '', '', '', '20210830', 'new'),
(82, 2, '1', 'Rangga Diva Saputra', 'depok', '1994-01-05', 'JL.KAKAP.NO.54KAV.BLOK.C', '3672123456780203', '6281386755495', '195101327452', '', '', '', '20210830', 'new'),
(83, 3, '1', 'Christoffel Harefa', 'Madula', '1955-06-18', 'Jalan Robert', '1271234567890001', '628127804790', '195101327746', '', '', '', '20210830', 'new'),
(84, 4, '1', 'INDRI SETIAWATI', 'Jakarta', '1980-02-15', 'Jl. LURUS III NO. 6', '3172123456780011', '6281385216565', '195101327878', '', '', '', '20210830', 'new'),
(85, 5, '1', 'Gusti ngurah bagus arta bangun', 'Gilimanuk', '1991-01-06', 'Jl Raya Denpasar Gilimanuk', '911234567452', '6287741357571', '195101329158', '', '', '', '20210830', 'new'),
(86, 6, '1', 'Benediktus M. Steven', 'Waingapu', '1995-05-25', 'Jln Erlangga Padadita', '16123456780027', '6282247721074', '195101331063', '', '', '', '20210830', 'new'),
(87, 7, '1', 'Zaenal Arifin', 'Surabaya', '1978-06-06', 'JL DUKUH MENANGGAL 28-B ', '780123456707', '6281231217581', '195101331076', '', '', '', '20210830', 'new'),
(88, 8, '1', 'Trimadiawaty', 'Jakarta', '1989-04-05', 'TOKO IBRA', '6372055123420001', '6285247851234', '195101321234', '', '', '', '20210830', 'new'),
(89, 9, '1', 'Muhamad faisal', 'Jakarta', '1966-11-30', 'Kp. Sompok Girang', '3672080512340003', '6281386751234', '195101321234', '', '', '', '20210830', 'new'),
(90, 10, '1', 'Wulandari', 'Bandung', '1964-08-03', 'Perum Wale Pineleng Blok A2 No 1', '1278041812340001', '628127801234', '195101321234', '', '', '', '20210830', 'new'),
(91, 11, '1', 'ERNAWATI SH', 'Praya', '1982-03-14', 'Desa Waybaru Bakauheni Lampung S', '3172025512340011', '6281385211234', '195101321234', '', '', '', '20210830', 'new'),
(92, 12, '1', 'Zaenal Arifin', 'Serang', '1972-05-12', 'Kp Pabuaran Gg Mesjid II', '3175036312340008', '6287773391234', '195101321234', '', '', '', '20210830', 'new'),
(93, 13, '1', 'wahyuni nengsih', 'Seririt', '1983-03-29', 'Jln Erlangga Padadita', '3174095312340004', '6285216471234', '195101321234', '', '', '', '20210830', 'new'),
(94, 14, '1', 'Komaryanto', 'Tulung Selapan', '2000-08-19', 'Jl Jend Sudirman Gg Karya 3', '3273256912340003', '6289656111234', '195101321234', '', '', '', '20210830', 'new'),
(95, 15, '1', 'Jong Visanty', 'Samarinda', '1988-01-31', 'Jl Gunung Simanukmanuk GG Angrek', '5202016512340003', '6287743241234', '195101321234', '', '', '', '20210830', 'new'),
(96, 16, '1', 'Irianti Bohang', '-', '1971-07-01', 'Jalan P Flores No 35', '3672032212340001', '6285158171234', '195101321234', '', '', '', '20210830', 'new');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t1clean_syscrash`
--

CREATE TABLE `t1clean_syscrash` (
  `id` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t2archive_danafloat`
--

CREATE TABLE `t2archive_danafloat` (
  `id` int(12) NOT NULL,
  `id_clean` int(12) NOT NULL,
  `wallet_code` varchar(30) NOT NULL,
  `trx_code` varchar(30) NOT NULL,
  `trx_id` varchar(30) NOT NULL,
  `trx_type` varchar(30) NOT NULL,
  `trx_value` varchar(20) NOT NULL,
  `description` varchar(250) NOT NULL,
  `credit` varchar(20) NOT NULL,
  `debit` varchar(20) NOT NULL,
  `syslogno` varchar(30) NOT NULL,
  `channel_id` varchar(20) NOT NULL,
  `srac` varchar(30) NOT NULL,
  `dsac` varchar(30) NOT NULL,
  `trx_datetime` varchar(20) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table archive for Dana Float report';

-- --------------------------------------------------------

--
-- Struktur dari tabel `t2archive_lkpbu_309_310_311`
--

CREATE TABLE `t2archive_lkpbu_309_310_311` (
  `id` int(12) NOT NULL,
  `id_clean` int(12) NOT NULL,
  `ticket_no` varchar(20) NOT NULL,
  `ticket_status` varchar(10) NOT NULL,
  `service` varchar(30) NOT NULL,
  `segname` varchar(100) NOT NULL,
  `opentime` varchar(20) NOT NULL,
  `closetime` varchar(20) NOT NULL,
  `code_309` varchar(3) NOT NULL,
  `code_310` varchar(3) NOT NULL,
  `code_311` varchar(3) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table archive for LKPBU (form 309, 310, 311)';

-- --------------------------------------------------------

--
-- Struktur dari tabel `t2archive_lkpbu_312`
--

CREATE TABLE `t2archive_lkpbu_312` (
  `id` int(12) NOT NULL,
  `id_clean` int(12) NOT NULL,
  `publication_code` varchar(5) NOT NULL,
  `description` varchar(250) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table archive for LKPBU 312';

-- --------------------------------------------------------

--
-- Struktur dari tabel `t2archive_lkpbu_313`
--

CREATE TABLE `t2archive_lkpbu_313` (
  `id` int(12) NOT NULL,
  `id_clean` int(12) NOT NULL,
  `publication_code` varchar(5) NOT NULL,
  `description` varchar(250) NOT NULL,
  `file_location` varchar(250) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table archive for LKPBU 313';

-- --------------------------------------------------------

--
-- Struktur dari tabel `t2archive_ltdbb`
--

CREATE TABLE `t2archive_ltdbb` (
  `id` int(12) NOT NULL,
  `id_clean` int(12) NOT NULL,
  `sender_country` varchar(100) NOT NULL,
  `sender_city` varchar(100) NOT NULL,
  `recept_country` varchar(100) NOT NULL,
  `recept_city` varchar(100) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `recept_name` varchar(100) NOT NULL,
  `sender_phone` varchar(100) NOT NULL,
  `recept_phone` varchar(100) NOT NULL,
  `sender_wn` varchar(100) NOT NULL,
  `recept_wn` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `trx_freq` varchar(20) NOT NULL,
  `trx_amount` varchar(20) NOT NULL,
  `trx_traffic` varchar(30) NOT NULL,
  `trx_type` varchar(30) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table archive for LTDBB report (G001, G002, G003)';

-- --------------------------------------------------------

--
-- Struktur dari tabel `t2archive_ltkl`
--

CREATE TABLE `t2archive_ltkl` (
  `id` int(12) NOT NULL,
  `id_clean` int(12) NOT NULL,
  `sender_name` varchar(50) NOT NULL,
  `sender_country` varchar(50) NOT NULL,
  `sender_addr` varchar(250) NOT NULL,
  `sender_id` varchar(50) NOT NULL,
  `destbankacc` varchar(30) NOT NULL,
  `notes` varchar(50) NOT NULL,
  `recept_name` varchar(50) NOT NULL,
  `recept_addr` varchar(250) NOT NULL,
  `recept_city` varchar(50) NOT NULL,
  `recept_city1` varchar(50) NOT NULL,
  `recept_province` varchar(50) NOT NULL,
  `recept_province1` varchar(50) NOT NULL,
  `recept_id` varchar(30) NOT NULL,
  `destamount` varchar(20) NOT NULL,
  `sender_aiming` varchar(100) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table archive for LTKL report';

-- --------------------------------------------------------

--
-- Struktur dari tabel `t2archive_sipesat`
--

CREATE TABLE `t2archive_sipesat` (
  `id` int(12) NOT NULL,
  `id_clean` int(12) NOT NULL,
  `customer_code` varchar(20) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `birth_place` varchar(100) NOT NULL,
  `birth_date` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `id_card_number` varchar(50) NOT NULL,
  `id_card_number_other` varchar(20) NOT NULL,
  `customer_cif` varchar(50) NOT NULL,
  `register_date` varchar(10) NOT NULL,
  `customer_type` varchar(20) NOT NULL,
  `trx_date` varchar(10) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table archive for SIPESAT report';

-- --------------------------------------------------------

--
-- Struktur dari tabel `t3calendar`
--

CREATE TABLE `t3calendar` (
  `id` int(12) NOT NULL,
  `id_user` varchar(20) NOT NULL,
  `trepid` varchar(50) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `tcal_message` varchar(225) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table Master';

--
-- Dumping data untuk tabel `t3calendar`
--

INSERT INTO `t3calendar` (`id`, `id_user`, `trepid`, `datestamp`, `tcal_message`, `status`) VALUES
(1, '1', '1', '2021-03-21', 'QRISM', 'verified'),
(2, '1', '4', '2021-03-21', 'PPATKD', 'unverified'),
(3, '1', '4', '2021-03-01', 'PPATKD', 'printed'),
(4, '1', '4', '2021-03-02', 'PPATKD', 'printed'),
(5, '1', '4', '2021-03-03', 'PPATKD', 'printed'),
(6, '1', '4', '2021-03-04', 'PPATKD', 'printed'),
(7, '1', '4', '2021-03-05', 'PPATKD', 'printed'),
(8, '1', '4', '2021-03-08', 'PPATKD', 'printed'),
(9, '1', '4', '2021-03-09', 'PPATKD', 'printed'),
(10, '1', '4', '2021-03-10', 'PPATKD', 'printed'),
(11, '1', '4', '2021-03-11', 'PPATKD', 'printed'),
(12, '1', '4', '2021-03-12', 'PPATKD', 'printed'),
(13, '1', '4', '2021-03-15', 'PPATKD', 'unverified'),
(14, '1', '4', '2021-03-16', 'PPATKD', 'unverified'),
(15, '1', '4', '2021-03-17', 'PPATKD', 'unverified'),
(16, '1', '4', '2021-03-18', 'PPATKD', 'unverified'),
(17, '1', '4', '2021-03-19', 'PPATKD', 'unverified'),
(18, '1', '4', '2021-03-22', 'PPATKD', 'unverified'),
(19, '1', '4', '2021-03-23', 'PPATKD', 'unverified'),
(20, '1', '4', '2021-03-24', 'PPATKD', 'unverified'),
(21, '1', '4', '2021-03-25', 'PPATKD', 'unverified'),
(22, '1', '4', '2021-03-26', 'PPATKD', 'unverified'),
(23, '1', '4', '2021-03-29', 'PPATKD', 'unverified'),
(24, '1', '4', '2021-03-30', 'PPATKD', 'unverified'),
(25, '1', '4', '2021-03-31', 'PPATKD', 'unverified'),
(26, '1', '4', '2021-04-01', 'PPATKD', 'unverified'),
(27, '1', '4', '2021-04-02', 'PPATKD', 'unverified'),
(28, '1', '5', '2021-03-01', 'QRISW', 'printed'),
(29, '1', '5', '2021-03-08', 'QRISW', 'unverified'),
(30, '1', '5', '2021-03-26', 'QRISW', 'unverified'),
(31, '1', '5', '2021-03-29', 'QRISW', 'unverified'),
(32, '1', '1', '2021-03-24', 'G0001', 'unverified'),
(33, '1', '2', '2021-03-25', 'G0002', 'unverified'),
(34, '1', '3', '2021-03-26', 'G0003', 'unverified');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t3report_period`
--

CREATE TABLE `t3report_period` (
  `id` int(11) NOT NULL,
  `period_code` varchar(20) NOT NULL,
  `period_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table Master';

--
-- Dumping data untuk tabel `t3report_period`
--

INSERT INTO `t3report_period` (`id`, `period_code`, `period_name`) VALUES
(1, '1D', 'Daily'),
(2, '1M', 'Montly'),
(3, '1W', 'Weekly'),
(4, '3M', '3 Monthly');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t3report_settings`
--

CREATE TABLE `t3report_settings` (
  `id` int(12) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `period` varchar(20) NOT NULL,
  `days` varchar(3) NOT NULL,
  `regulator` varchar(100) NOT NULL,
  `format` varchar(20) NOT NULL,
  `header1` varchar(200) NOT NULL,
  `header2` varchar(200) NOT NULL,
  `header3` varchar(200) NOT NULL,
  `header4` varchar(200) NOT NULL,
  `header5` varchar(200) NOT NULL,
  `picupdate` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `datestamp` varchar(10) NOT NULL,
  `last_generate` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table Master';

--
-- Dumping data untuk tabel `t3report_settings`
--

INSERT INTO `t3report_settings` (`id`, `code`, `name`, `period`, `days`, `regulator`, `format`, `header1`, `header2`, `header3`, `header4`, `header5`, `picupdate`, `status`, `link`, `datestamp`, `last_generate`) VALUES
(1, 'G001', 'Laporan LTDBB Transfer Dana (laporan Pengiriman Uang dari Indonesia ke luar negeri Form G0001)', '1M', '1', 'Bank Indonesia', 'X001', 'Transaksi Pengiriman Uang dari Indonesia ke Luar Negeri', '777930008', '', '', '', '1', 'active', 'cetakg1', '20210101', ''),
(2, 'G002', 'Laporan LTDBB Transfer Dana (laporan Pengiriman Uang dari Luar negeri ke Indonesia Form G0002)', '1M', '5', 'Bank Indonesia', 'X002', 'Transaksi Pengiriman Uang dari Luar Negeri ke Indonesia', '777930008', '', '', '', '1', 'active', 'cetakg2', '20210101', ''),
(3, 'G003', 'Laporan LTDBB Transfer Dana (laporan Pengiriman Uang di Dalam Wilayah Republik Indonesia Form G0003)', '1M', '5', 'Bank Indonesia', 'X003', 'Transaksi Pengiriman Uang di dalam Wilayah Republik Indonesia', '777930008', '', '', '', '1', 'active', 'cetakg3', '20210101', ''),
(4, 'PPATKD', 'Laporan LTKL Transfer Dana (Laporan Transaksi Ke dan Dari Luar Negeri)', '1D', '1', 'PPATK', 'X004', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(5, 'QRISW', 'Laporan Kegiatan QRIS', '1W', '1', 'Bank Indonesia', 'X005', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(6, 'QRISM', 'Laporan Kegiatan QRIS', '1M', '3', 'Bank Indonesia', 'X006', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(7, '', 'Laporan Dana Float Uang Elektronik', '1D', '1', 'Bank Indonesia', 'X007', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(8, '', 'Laporan Dana Float Uang Elektronik', '1W', '1', 'Bank Indonesia', 'X008', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(9, '', 'Laporan Payment Gateway', '1M', '1', 'Bank Indonesia', 'X009', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(10, '', 'Laporan SIPESAT (Sistem Informasi Pengguna Jasa Terpadu) (Data Pelanggan Uang Elektronik)', '3M', '1', 'PPATK', 'X010', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(11, '', 'Laporan LKPBU Uang Elektronik (Form 302 Laporan Penerbit Selain Kartu Kredit)', '1M', '1', 'Bank Indonesia', 'X011', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(12, '', 'Laporan LKPBU Uang Elektronik (Form 303 Laporan Bulanan Acquirer)', '1M', '1', 'Bank Indonesia', 'X012', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(13, '', 'Laporan LKPBU Uang Elektronik (Form 304 Laporan Bulanan Infrastruktur)', '1M', '1', 'Bank Indonesia', 'X013', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(14, '', 'Laporan LKPBU Uang Elektronik (Form 306 Laporan Bulanan Fraud APMK dan Instrumen Prabayar)', '1M', '1', 'Bank Indonesia', 'X014', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(15, '', 'Laporan LKPBU Uang Elektronik (Form 309 Laporan Triwulan Jenis Produk dan Permasalahan yang Diadukan)', '3M', '1', 'Bank Indonesia', 'X015', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(16, '', 'Laporan LKPBU Uang Elektronik (Form 310 Laporan Triwulan Pengaduan yang Diselesaikan dalam Masa Laporan)', '3M', '1', 'Bank Indonesia', 'X016', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(17, '', 'Laporan LKPBU Uang Elektronik (Form 311 Laporan Triwulan Penyebab Pengaduan)', '3M', '1', 'Bank Indonesia', 'X017', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(18, '', 'Laporan LKPBU Uang Elektronik (Form 312 Laporan Triwulan Publikasi Negatif)', '3M', '1', 'Bank Indonesia', 'X018', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(19, '', 'Laporan LKPBU Uang Elektronik (Form 313 Laporan Triwulan Penyelesaian Sengketa)', '3M', '1', 'Bank Indonesia', 'X019', '', '', '', '', '', '1', 'inactive', '', '20210101', ''),
(20, '', 'Laporan Gangguan Availability Sistem', '1M', '1', 'Bank Indonesia', 'X020', '', '', '', '', '', '1', 'inactive', '', '20210101', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t3role_model`
--

CREATE TABLE `t3role_model` (
  `id` int(12) NOT NULL,
  `report_code` varchar(20) NOT NULL,
  `table` varchar(50) NOT NULL,
  `field` varchar(50) NOT NULL,
  `from` varchar(100) NOT NULL,
  `to` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table Master';

--
-- Dumping data untuk tabel `t3role_model`
--

INSERT INTO `t3role_model` (`id`, `report_code`, `table`, `field`, `from`, `to`) VALUES
(1, 'G001', 'tltdbb', 'sender_country', '86', 'INDONESIA'),
(2, 'G001', 'tltdbb', 'recept_country', '86', 'INDONESIA'),
(3, 'G001', 'tltdbb', 'sender_city', '10', '108 - Bogor'),
(4, 'G001', 'tltdbb', 'recept_city', '6', '1201 - Gresik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t4log_sys`
--

CREATE TABLE `t4log_sys` (
  `id` int(12) NOT NULL,
  `event_time` varchar(20) NOT NULL,
  `event_modul` varchar(50) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `event_notes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t4log_trx`
--

CREATE TABLE `t4log_trx` (
  `id` int(12) NOT NULL,
  `event_time` varchar(20) NOT NULL,
  `id_user` varchar(20) NOT NULL,
  `event_modul` varchar(50) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `record_id` varchar(50) NOT NULL,
  `event_notes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t4log_user`
--

CREATE TABLE `t4log_user` (
  `id` int(12) NOT NULL,
  `event_time` varchar(20) NOT NULL,
  `id_user` varchar(20) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `event_modul` varchar(50) NOT NULL,
  `event_type` enum('ADD','MODIFY','DELETE','SEARCH','LOGIN','LOGOUT','EXPORT','IMPORT','UPLOAD','DOWNLOAD','OTHER') NOT NULL,
  `record_id` varchar(20) NOT NULL,
  `event_notes` varchar(100) NOT NULL,
  `event_sql` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t4log_user`
--

INSERT INTO `t4log_user` (`id`, `event_time`, `id_user`, `ip_address`, `event_modul`, `event_type`, `record_id`, `event_notes`, `event_sql`) VALUES
(1, '20210830122001', '1', '::1', 'LOGOUT', 'LOGOUT', '', 'User Logout', ''),
(2, '20210830122003', '1', '::1', 'LOGIN', 'LOGIN', '', 'Successfuly user login', ''),
(3, '20210830122004', '1', '::1', 'LOGIN', 'LOGIN', '', 'Successfuly user login', ''),
(4, '20210830140437', '1', '::1', 'LOGIN', 'LOGIN', '', 'Successfuly user login', ''),
(5, '20210830140437', '1', '::1', 'LOGIN', 'LOGIN', '', 'Successfuly user login', ''),
(6, '20210830210752', '1', '::1', 'LOGIN', 'LOGIN', '', 'Successfuly user login', ''),
(7, '20210830210753', '1', '::1', 'LOGIN', 'LOGIN', '', 'Successfuly user login', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t4user`
--

CREATE TABLE `t4user` (
  `id` int(12) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `user_group` varchar(20) NOT NULL,
  `avatar` varchar(250) NOT NULL,
  `activation_date` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t4user`
--

INSERT INTO `t4user` (`id`, `username`, `password`, `fullname`, `user_group`, `avatar`, `activation_date`, `status`) VALUES
(1, 'admin', '$2y$10$LlgjxVsOPktq.rns0B8AuuUhSdwZsNWDUJgZx/Ado0GpchI4FFs3e', 'Admin', 'admin', '', '2021-06-23', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t4user_group`
--

CREATE TABLE `t4user_group` (
  `id` int(11) NOT NULL,
  `group_name` varchar(250) NOT NULL,
  `access` text NOT NULL,
  `action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t4user_group`
--

INSERT INTO `t4user_group` (`id`, `group_name`, `access`, `action`) VALUES
(1, 'admin', 'dashboard_regulator#verification#report_legulator#archive#user_activity_regulator#upload_source#raw_data#data_clean#dashboard_document#document#report_document#version#user_activity_document#user#user_group#master_data', 'add#update#delete#view#download'),
(2, 'tes', 'dashboard_regulator#verification', 'add#update');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlkpbu_312_publication_type`
--

CREATE TABLE `tlkpbu_312_publication_type` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `publication` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tlkpbu_312_publication_type`
--

INSERT INTO `tlkpbu_312_publication_type` (`id`, `code`, `publication`) VALUES
(1, '110', 'Pengaduan nasabah pada media massa'),
(2, '120', 'Artikel media cetak'),
(3, '130', 'Liputan media elektronis'),
(4, '140', 'Publikasi/tulisan di tempat umum'),
(5, '999', 'Lainnya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tlkpbu_313_publication_type`
--

CREATE TABLE `tlkpbu_313_publication_type` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `publication` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tlkpbu_313_publication_type`
--

INSERT INTO `tlkpbu_313_publication_type` (`id`, `code`, `publication`) VALUES
(1, '110', 'Penyelesaian sengketa melalui Mediasi yang diselenggarakan Bank Indonesia'),
(2, '120', 'Penyelesaian sengketa melalui Mediasi yang diselenggarakan Lembaga Selain Bank Indonesia'),
(3, '200', 'Penyelesaian sengketa melalui arbitrase'),
(4, '300', 'Penyelesaian sengketa melalui jalur pengadilan'),
(5, '999', 'Penyelesaian sengketa melalui cara lainnya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltdbb_alto_city`
--

CREATE TABLE `tltdbb_alto_city` (
  `id` int(12) NOT NULL,
  `province_id` varchar(10) NOT NULL,
  `subprovince_id` varchar(10) NOT NULL,
  `id_alto` varchar(10) NOT NULL,
  `subprovince_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tltdbb_alto_city`
--

INSERT INTO `tltdbb_alto_city` (`id`, `province_id`, `subprovince_id`, `id_alto`, `subprovince_name`) VALUES
(1, '1', '1', '396', 'Kepulauan Seribu'),
(2, '1', '2', '391', 'Jakarta Pusat'),
(3, '1', '3', '392', 'Jakarta Utara'),
(4, '1', '4', '393', 'Jakarta Barat'),
(5, '1', '5', '394', 'Jakarta Selatan'),
(6, '1', '6', '395', 'Jakarta Timur'),
(7, '2', '8', '122', 'Bandung Barat'),
(8, '2', '10', '108', 'Bogor'),
(9, '2', '11', '115', 'Ciamis'),
(10, '2', '12', '110', 'Cianjur'),
(11, '2', '13', '116', 'Cirebon'),
(12, '2', '14', '114', 'Garut'),
(13, '2', '15', '118', 'Indramayu'),
(14, '2', '16', '106', 'Karawang'),
(15, '2', '17', '117', 'Kuningan'),
(16, '2', '18', '119', 'Majalengka'),
(17, '2', '20', '103', 'Purwakarta'),
(18, '2', '21', '121', 'Subang'),
(19, '2', '22', '109', 'Sukabumi'),
(20, '2', '23', '112', 'Sumedang'),
(21, '2', '24', '113', 'Tasikmalaya'),
(22, '2', '25', '111', 'Bandung'),
(23, '2', '26', '180', 'Banjar'),
(24, '2', '27', '102', 'Bekasi'),
(25, '2', '29', '196', 'Cimahi'),
(26, '2', '31', '197', 'Depok'),
(27, '3', '34', '202', 'Pandeglang'),
(28, '3', '35', '201', 'Lebak'),
(29, '3', '36', '204', 'Tangerang'),
(30, '3', '37', '203', 'Serang'),
(31, '3', '38', '291', 'Cilegon'),
(32, '3', '41', '294', 'Tangerang Selatan'),
(33, '4', '42', '915', 'Cilacap'),
(34, '4', '43', '914', 'Banyumas'),
(35, '4', '44', '916', 'Purbalingga'),
(36, '4', '45', '917', 'Banjarnegara'),
(37, '4', '46', '922', 'Kebumen'),
(38, '4', '47', '921', 'Purworejo'),
(39, '4', '48', '920', 'Wonosobo'),
(40, '4', '50', '924', 'Boyolali'),
(41, '4', '51', '923', 'Klaten'),
(42, '4', '52', '926', 'Sukoharjo'),
(43, '4', '53', '928', 'Wonogiri'),
(44, '4', '54', '927', 'Karanganyar'),
(45, '4', '55', '925', 'Sragen'),
(46, '4', '56', '904', 'Grobogan'),
(47, '4', '57', '913', 'Blora'),
(48, '4', '58', '912', 'Rembang'),
(49, '4', '59', '908', 'Pati'),
(50, '4', '60', '909', 'Kudus'),
(51, '4', '61', '911', 'Jepara'),
(52, '4', '62', '903', 'Demak'),
(53, '4', '64', '919', 'Temanggung'),
(54, '4', '65', '902', 'Kendal'),
(55, '4', '66', '929', 'Batang'),
(56, '4', '68', '910', 'Pemalang'),
(57, '4', '70', '907', 'Brebes'),
(58, '4', '71', '918', 'Magelang'),
(59, '4', '72', '996', 'Surakarta'),
(60, '4', '73', '992', 'Salatiga'),
(61, '4', '74', '901', 'Semarang'),
(62, '4', '75', '905', 'Pekalongan'),
(63, '4', '76', '906', 'Tegal'),
(64, '5', '77', '501', 'Bantul'),
(65, '5', '78', '502', 'Sleman'),
(66, '5', '79', '503', 'Gunung Kidul'),
(67, '5', '80', '504', 'Kulon Progo'),
(68, '5', '81', '591', 'Yogyakarta'),
(69, '6', '82', '1201', 'Gresik'),
(70, '6', '83', '1202', 'Sidoarjo'),
(71, '6', '85', '1204', 'Jombang'),
(72, '6', '86', '1227', 'Bojonegoro'),
(73, '6', '87', '1228', 'Tuban'),
(74, '6', '88', '1229', 'Lamongan'),
(75, '6', '90', '1223', 'Ngawi'),
(76, '6', '91', '1224', 'Magetan'),
(77, '6', '92', '1225', 'Ponorogo'),
(78, '6', '93', '1226', 'Pacitan'),
(79, '6', '95', '1218', 'Nganjuk'),
(80, '6', '96', '1221', 'Blitar'),
(81, '6', '97', '1219', 'Tulungagung'),
(82, '6', '98', '1220', 'Trenggalek'),
(83, '6', '102', '1216', 'Lumajang'),
(84, '6', '103', '1209', 'Bondowoso'),
(85, '6', '104', '1230', 'Situbondo'),
(86, '6', '105', '1212', 'Jember'),
(87, '6', '106', '1211', 'Banyuwangi'),
(88, '6', '107', '1206', 'Pamekasan'),
(89, '6', '108', '1205', 'Sampang'),
(90, '6', '109', '1207', 'Sumenep'),
(91, '6', '110', '1208', 'Bangkalan'),
(92, '6', '111', '1291', 'Surabaya'),
(93, '6', '112', '1213', 'Malang'),
(94, '6', '113', '1222', 'Madiun'),
(95, '6', '114', '1217', 'Kediri'),
(96, '6', '115', '1203', 'Mojokerto'),
(97, '6', '117', '1214', 'Pasuruan'),
(98, '6', '118', '1215', 'Probolinggo'),
(99, '6', '119', '1271', 'Batu'),
(100, '7', '120', '3201', 'Aceh Besar'),
(101, '7', '121', '3202', 'Pidie'),
(102, '7', '122', '3203', 'Aceh Utara'),
(103, '7', '123', '3204', 'Aceh Timur'),
(104, '7', '124', '3207', 'Aceh Tengah'),
(105, '7', '125', '3206', 'Aceh Barat'),
(106, '7', '126', '3205', 'Aceh Selatan'),
(107, '7', '127', '3208', 'Aceh Tenggara'),
(108, '7', '129', '3210', 'Bireuen'),
(109, '7', '130', '3209', 'Aceh Singkil'),
(110, '7', '131', '3211', 'Aceh Tamiang'),
(111, '7', '132', '3215', 'Nagan Raya'),
(112, '7', '133', '3214', 'Aceh Jaya'),
(113, '7', '134', '3213', 'Aceh Barat Daya'),
(114, '7', '135', '3212', 'Gayo Lues'),
(115, '7', '136', '3217', 'Bener Meriah'),
(116, '7', '137', '3218', 'Pidie Jaya'),
(117, '7', '138', '3292', 'Sabang'),
(118, '7', '139', '3291', 'Banda Aceh'),
(119, '7', '140', '3293', 'Lhokseumawe'),
(120, '7', '141', '3294', 'Langsa'),
(121, '7', '142', '3219', 'Subulussalam'),
(122, '8', '143', '3301', 'Deli Serdang'),
(123, '8', '144', '3302', 'Langkat'),
(124, '8', '145', '3303', 'Karo'),
(125, '8', '146', '3304', 'Simalungun'),
(126, '8', '147', '3307', 'Dairi'),
(127, '8', '148', '3306', 'Asahan'),
(128, '8', '149', '3305', 'Labuhan Batu'),
(129, '8', '150', '3308', 'Tapanuli Utara'),
(130, '8', '151', '3309', 'Tapanuli Tengah'),
(131, '8', '152', '3310', 'Tapanuli Selatan'),
(132, '8', '153', '3311', 'Nias'),
(133, '8', '154', '3314', 'Mandailing Natal'),
(134, '8', '155', '3313', 'Toba Samosir'),
(135, '8', '156', '3315', 'Nias Selatan'),
(136, '8', '157', '3317', 'Pak pak Bharat'),
(137, '8', '158', '3316', 'Humbang Hasundutan'),
(138, '8', '159', '3318', 'Samosir'),
(139, '8', '160', '3319', 'Serdang Bedagai'),
(140, '8', '161', '3321', 'Batu Bara'),
(141, '8', '162', '3323', 'Padang Lawas Utara'),
(142, '8', '163', '3322', 'Padang Lawas'),
(143, '8', '166', '3326', 'Nias Barat'),
(144, '8', '167', '3327', 'Nias Utara'),
(145, '8', '168', '3396', 'Medan'),
(146, '8', '169', '3392', 'Binjai'),
(147, '8', '170', '3391', 'Tebing Tinggi'),
(148, '8', '171', '3393', 'Pematang Siantar'),
(149, '8', '172', '3394', 'Tanjung Balai'),
(150, '8', '173', '3395', 'Sibolga'),
(151, '8', '174', '3399', 'Padang Sidempuan'),
(152, '8', '175', '3377', 'Gunung Sitoli'),
(153, '9', '176', '3401', 'Agam'),
(154, '9', '177', '3402', 'Pasaman'),
(155, '9', '178', '3403', 'Lima Puluh Koto'),
(156, '9', '179', '3412', 'Solok'),
(157, '9', '180', '3405', 'Padang Pariaman'),
(158, '9', '181', '3406', 'Pesisir Selatan'),
(159, '9', '182', '3407', 'Tanah Datar'),
(160, '9', '183', '3408', 'Sijunjung'),
(161, '9', '184', '3409', 'Kepulauan Mentawai'),
(162, '9', '185', '3404', 'Solok Selatan'),
(163, '9', '186', '3411', 'Dharmas Raya'),
(164, '9', '187', '3410', 'Pasaman Barat'),
(165, '9', '188', '3491', 'Bukittinggi'),
(166, '9', '189', '3492', 'Padang'),
(167, '9', '190', '3494', 'Padang Panjang'),
(168, '9', '191', '3493', 'Sawah Lunto'),
(169, '9', '193', '3496', 'Payakumbuh'),
(170, '9', '194', '3497', 'Pariaman'),
(171, '10', '195', '3501', 'Kampar'),
(172, '10', '196', '3502', 'Bengkalis'),
(173, '10', '197', '3504', 'Indragiri Hulu'),
(174, '10', '198', '3505', 'Indragiri Hilir'),
(175, '10', '199', '3510', 'Pelalawan'),
(176, '10', '200', '3511', 'Siak'),
(177, '10', '201', '3512', 'Kuantan Singingi'),
(178, '10', '202', '3508', 'Rokan Hulu'),
(179, '10', '203', '3509', 'Rokan Hilir'),
(180, '10', '204', '3513', 'Kep. Meranti'),
(181, '10', '205', '3591', 'Pekanbaru'),
(182, '10', '206', '3592', 'Dumai'),
(183, '11', '207', '3804', 'Bintan'),
(184, '11', '208', '3801', 'Karimun'),
(185, '11', '209', '3803', 'Natuna'),
(186, '11', '210', '3802', 'Lingga'),
(187, '11', '211', '3805', 'Kep. Anambas'),
(188, '11', '212', '3892', 'Batam'),
(189, '11', '213', '3891', 'Tanjungpinang'),
(190, '12', '214', '3101', 'Batang Hari'),
(191, '12', '215', '3112', 'Bungo'),
(192, '12', '216', '3104', 'Sarolangun'),
(193, '12', '217', '3107', 'Tanjung Jabung Barat'),
(194, '12', '218', '3105', 'Kerinci'),
(195, '12', '219', '3109', 'Tebo'),
(196, '12', '220', '3106', 'Muaro Jambi'),
(197, '12', '221', '3108', 'Tanjung Jabung Timur'),
(198, '12', '222', '3111', 'Merangin'),
(199, '12', '223', '3191', 'Jambi'),
(200, '12', '224', '3192', 'Kota. Sungai Penuh'),
(201, '13', '225', '3613', 'Banyuasin'),
(202, '13', '226', '3617', 'Empat Lawang'),
(203, '13', '227', '3609', 'Lahat'),
(204, '13', '228', '3608', 'Muara Enim'),
(205, '13', '229', '3606', 'Musi Banyuasin'),
(206, '13', '230', '3610', 'Musi Rawas'),
(207, '13', '232', '3616', 'Ogan Ilir'),
(208, '13', '233', '3611', 'Ogan Komering Ilir'),
(209, '13', '234', '3607', 'Ogan Komering Ulu'),
(210, '13', '235', '3614', 'Ogan Komering Ulu Selatan'),
(211, '13', '236', '3615', 'Ogan Komering Ulu Timur'),
(212, '13', '238', '3693', 'Lubuklinggau'),
(213, '13', '239', '3697', 'Pagar Alam'),
(214, '13', '240', '3691', 'Palembang'),
(215, '13', '241', '3694', 'Prabumulih'),
(216, '14', '242', '3701', 'Bangka'),
(217, '14', '243', '3702', 'Belitung'),
(218, '14', '244', '3705', 'Bangka Tengah'),
(219, '14', '245', '3703', 'Bangka Barat'),
(220, '14', '246', '3704', 'Bangka Selatan'),
(221, '14', '247', '3706', 'Belitung Timur'),
(222, '14', '248', '3791', 'Pangkalpinang'),
(223, '15', '249', '2302', 'Bengkulu Utara'),
(224, '15', '250', '2303', 'Rejang Lebong'),
(225, '15', '251', '2301', 'Bengkulu Selatan'),
(226, '15', '252', '2306', 'Muko-muko'),
(227, '15', '253', '2305', 'Kepahiang'),
(228, '15', '254', '2304', 'Lebong'),
(229, '15', '255', '2308', 'Kaur'),
(230, '15', '256', '2307', 'Seluma'),
(231, '15', '257', '2309', 'Bengkulu Tengah'),
(232, '15', '258', '2391', 'Bengkulu'),
(233, '16', '259', '3902', 'Lampung Tengah'),
(234, '16', '260', '3903', 'Lampung Utara'),
(235, '16', '261', '3901', 'Lampung Selatan'),
(236, '16', '262', '3904', 'Lampung Barat'),
(237, '16', '263', '3907', 'Lampung Timur'),
(238, '16', '264', '3912', 'Mesuji'),
(239, '16', '265', '3909', 'Pesawaran'),
(240, '16', '266', '3913', 'Pesisir Barat'),
(241, '16', '267', '3910', 'Pringsewu'),
(242, '16', '268', '3905', 'Tulang Bawang'),
(243, '16', '269', '3911', 'Tulang Bawang Barat'),
(244, '16', '270', '3906', 'Tanggamus'),
(245, '16', '271', '3908', 'Way Kanan'),
(246, '16', '272', '3991', 'Bandar Lampung'),
(247, '16', '275', '3992', 'Metro'),
(248, '17', '276', '5302', 'Sambas'),
(249, '17', '278', '5304', 'Sanggau'),
(250, '17', '279', '5305', 'Sintang'),
(251, '17', '280', '5306', 'Kapuas Hulu'),
(252, '17', '281', '5303', 'Ketapang'),
(253, '17', '282', '5307', 'Bengkayang'),
(254, '17', '283', '5308', 'Landak'),
(255, '17', '284', '5309', 'Sekadau'),
(256, '17', '285', '5310', 'Melawi'),
(257, '17', '286', '5311', 'Kayong Utara'),
(258, '17', '287', '5312', 'Kubu Raya'),
(259, '17', '288', '5301', 'Pontianak'),
(260, '17', '289', '5392', 'Singkawang'),
(261, '18', '290', '5801', 'Kapuas'),
(262, '18', '291', '5806', 'Barito Selatan'),
(263, '18', '292', '5808', 'Barito Utara'),
(264, '18', '293', '5803', 'Kotawaringin Timur'),
(265, '18', '294', '5802', 'Kotawaringin Barat'),
(266, '18', '295', '5811', 'Katingan'),
(267, '18', '296', '5810', 'Seruyan'),
(268, '18', '297', '5812', 'Sukamara'),
(269, '18', '298', '5813', 'Lamandau'),
(270, '18', '299', '5807', 'Gunung Mas'),
(271, '18', '300', '5809', 'Pulang Pisau'),
(272, '18', '301', '5804', 'Murung Raya'),
(273, '18', '302', '5805', 'Barito Timur'),
(274, '18', '303', '5892', 'Palangka Raya'),
(275, '19', '305', '5102', 'Tanah Laut'),
(276, '19', '306', '5107', 'Barito Kuala'),
(277, '19', '307', '5103', 'Tapin'),
(278, '19', '308', '5104', 'Hulu Sungai Selatan'),
(279, '19', '309', '5105', 'Hulu Sungai Tengah'),
(280, '19', '310', '5106', 'Hulu Sungai Utara'),
(281, '19', '311', '5109', 'Tabalong'),
(282, '19', '312', '5108', 'Baru'),
(283, '19', '313', '5111', 'Balangan'),
(284, '19', '314', '5110', 'Tanah Bumbu'),
(285, '19', '315', '5191', 'Banjarmasin'),
(286, '19', '316', '5192', 'Banjarbaru'),
(287, '20', '317', '5402', 'Berau'),
(288, '20', '318', '5405', 'Kutai Barat'),
(289, '20', '319', '5401', 'Kutai Kartanegara'),
(290, '20', '320', '5406', 'Kutai Timur'),
(291, '20', '321', '5413', 'Mahakam Ulu'),
(292, '20', '322', '5403', 'Paser'),
(293, '20', '323', '5411', 'Penajam Paser Utara'),
(294, '20', '324', '5492', 'Balikpapan'),
(295, '20', '325', '5494', 'Bontang'),
(296, '20', '326', '5491', 'Samarinda'),
(297, '21', '328', '6202', 'Minahasa'),
(298, '21', '329', '6204', 'Kepulauan Sangihe'),
(299, '21', '330', '6205', 'Kepulauan Talaud'),
(300, '21', '331', '6206', 'Minahasa Selatan'),
(301, '21', '332', '6207', 'Minahasa Utara'),
(302, '21', '333', '6210', 'Bolaang Mongondow Utara'),
(303, '21', '335', '6209', 'Minahasa Tenggara'),
(304, '21', '336', '6213', 'Bolaang Mongondow Timur'),
(305, '21', '337', '6212', 'Bolaang Mongondow Selatan'),
(306, '21', '338', '6291', 'Manado'),
(307, '21', '339', '6293', 'Bitung'),
(308, '21', '340', '6294', 'Tomohon'),
(309, '21', '341', '6292', 'Kotamobagu'),
(310, '22', '342', '6302', 'Boalemo'),
(311, '22', '344', '6304', 'Pohuwato'),
(312, '22', '345', '6303', 'Bone Bolango'),
(313, '22', '346', '6305', 'Gorontalo Utara'),
(314, '22', '347', '6301', 'Gorontalo'),
(315, '23', '348', '6003', 'Banggai'),
(316, '23', '350', '6011', 'Banggai Laut'),
(317, '23', '351', '6007', 'Buol'),
(318, '23', '352', '6001', 'Donggala'),
(319, '23', '353', '6006', 'Morowali'),
(320, '23', '354', '6012', 'Morowali Utara'),
(321, '23', '355', '6009', 'Parigi Moutong'),
(322, '23', '356', '6002', 'Poso'),
(323, '23', '357', '6010', 'Sigi'),
(324, '23', '358', '6008', 'Tojo Una-Una'),
(325, '23', '359', '6004', 'Toli-Toli'),
(326, '23', '360', '6091', 'Palu'),
(327, '24', '363', '6102', 'Gowa'),
(328, '24', '364', '6115', 'Takalar'),
(329, '24', '365', '6113', 'Jeneponto'),
(330, '24', '366', '6116', 'Barru'),
(331, '24', '367', '6105', 'Bone'),
(332, '24', '368', '6103', 'Wajo'),
(333, '24', '369', '6119', 'Soppeng'),
(334, '24', '370', '6112', 'Bantaeng'),
(335, '24', '371', '6111', 'Bulukumba'),
(336, '24', '372', '6110', 'Sinjai'),
(337, '24', '373', '6114', 'Selayar'),
(338, '24', '374', '6101', 'Pinrang'),
(339, '24', '375', '6117', 'Sidenreng Rappang'),
(340, '24', '376', '6121', 'Enrekang'),
(341, '24', '377', '6109', 'Luwu'),
(342, '24', '378', '6106', 'Tana Toraja'),
(343, '24', '379', '6125', 'Tana Toraja Utara'),
(344, '24', '380', '6124', 'Luwu Utara'),
(345, '24', '381', '6122', 'Luwu Timur'),
(346, '24', '382', '6191', 'Makassar'),
(347, '24', '383', '6192', 'Pare-Pare'),
(348, '24', '384', '6193', 'Palopo'),
(349, '25', '385', '6402', 'Majene'),
(350, '25', '386', '6403', 'Mamasa'),
(351, '25', '387', '6491', 'Mamuju'),
(352, '25', '388', '6405', 'Mamuju Tengah'),
(353, '25', '389', '6404', 'Mamuju Utara'),
(354, '25', '390', '6401', 'Polewali Mandar'),
(355, '26', '391', '6908', 'Bombana'),
(356, '26', '392', '6901', 'Buton'),
(357, '26', '393', '6910', 'Buton Utara'),
(358, '26', '394', '6904', 'Kolaka'),
(359, '26', '395', '6912', 'Kolaka Timur'),
(360, '26', '396', '6909', 'Kolaka Utara'),
(361, '26', '397', '6906', 'Konawe'),
(362, '26', '398', '6913', 'Konawe Kepulauan'),
(363, '26', '399', '6907', 'Konawe Selatan'),
(364, '26', '400', '6911', 'Konawe Utara'),
(365, '26', '401', '6903', 'Muna'),
(366, '26', '402', '6905', 'Wakatobi'),
(367, '26', '403', '6990', 'Bau-Bau'),
(368, '26', '404', '6991', 'Kendari'),
(369, '27', '407', '8104', 'Buru'),
(370, '27', '408', '8103', 'Maluku Tenggara Barat'),
(371, '27', '409', '8105', 'Seram Bagian Barat'),
(372, '27', '410', '8106', 'Seram Bagian Timur'),
(373, '27', '411', '8107', 'Kepulauan Aru'),
(374, '27', '412', '8108', 'Maluku Barat Daya'),
(375, '27', '413', '8109', 'Buru Selatan'),
(376, '27', '414', '8191', 'Ambon'),
(377, '27', '415', '8192', 'Tual'),
(378, '28', '416', '8305', 'Halmahera Barat'),
(379, '28', '417', '8302', 'Halmahera Tengah'),
(380, '28', '418', '8303', 'Halmahera Utara'),
(381, '28', '419', '8306', 'Halmahera Selatan'),
(382, '28', '420', '8307', 'Kepulauan Sula'),
(383, '28', '421', '8304', 'Halmahera Timur'),
(384, '28', '422', '8308', 'Pulau Morotai'),
(385, '28', '423', '8309', 'Pulau Taliabu'),
(386, '28', '424', '8390', 'Ternate'),
(387, '28', '425', '8391', 'Tidore Kepulauan'),
(388, '29', '426', '7201', 'Buleleng'),
(389, '29', '427', '7202', 'Jembrana'),
(390, '29', '428', '7203', 'Tabanan'),
(391, '29', '429', '7204', 'Badung'),
(392, '29', '430', '7205', 'Gianyar'),
(393, '29', '431', '7206', 'Klungkung'),
(394, '29', '432', '7207', 'Bangli'),
(395, '29', '433', '7208', 'Karang Asem'),
(396, '29', '434', '7291', 'Denpasar'),
(397, '30', '435', '7101', 'Lombok Barat'),
(398, '30', '436', '7102', 'Lombok Tengah'),
(399, '30', '437', '7103', 'Lombok Timur'),
(400, '30', '438', '7104', 'Sumbawa'),
(401, '30', '439', '7106', 'Dompu'),
(402, '30', '440', '7105', 'Bima'),
(403, '30', '441', '7107', 'Sumbawa Barat'),
(404, '30', '442', '7108', 'Lombok Utara'),
(405, '30', '443', '7191', 'Mataram'),
(406, '31', '445', '7405', 'Alor'),
(407, '31', '446', '7404', 'Belu'),
(408, '31', '447', '7408', 'Ende'),
(409, '31', '448', '7406', 'Flores Timur'),
(410, '31', '450', '7413', 'Lembata'),
(411, '31', '451', '7421', 'Malaka'),
(412, '31', '452', '7410', 'Manggarai'),
(413, '31', '453', '7415', 'Manggarai Barat'),
(414, '31', '454', '7418', 'Manggarai Timur'),
(415, '31', '455', '7409', 'Ngada'),
(416, '31', '456', '7419', 'Nagekeo'),
(417, '31', '457', '7414', 'Rote Ndao'),
(418, '31', '458', '7420', 'Sabu Raijua'),
(419, '31', '459', '7407', 'Sikka'),
(420, '31', '460', '7412', 'Sumba Barat'),
(421, '31', '461', '7417', 'Sumba Barat Daya'),
(422, '31', '462', '7416', 'Sumba Tengah'),
(423, '31', '463', '7411', 'Sumba Timur'),
(424, '31', '464', '7402', 'Timor Tengah Selatan'),
(425, '31', '465', '7403', 'Timor Tengah Utara'),
(426, '31', '466', '7401', 'Kupang'),
(427, '32', '467', '8201', 'Jayapura'),
(428, '32', '468', '8202', 'Biak Numfor'),
(429, '32', '469', '8210', 'Yapen Waropen'),
(430, '32', '470', '8211', 'Merauke'),
(431, '32', '471', '8213', 'Jayawijaya'),
(432, '32', '472', '8214', 'Nabire'),
(433, '32', '473', '8212', 'Paniai'),
(434, '32', '474', '8216', 'Puncak Jaya'),
(435, '32', '475', '8215', 'Mimika'),
(436, '32', '476', '8226', 'Boven Digoel'),
(437, '32', '477', '8227', 'Mappi'),
(438, '32', '478', '8228', 'Asmat'),
(439, '32', '479', '8222', 'Yahukimo'),
(440, '32', '480', '8221', 'Pegunungan Bintang'),
(441, '32', '481', '8223', 'Tolikara'),
(442, '32', '482', '8217', 'Sarmi'),
(443, '32', '483', '8218', 'Keerom'),
(444, '32', '484', '8224', 'Waropen'),
(445, '32', '485', '8231', 'Supiori'),
(446, '32', '487', '8236', 'Nduga Tengah'),
(447, '32', '488', '8234', 'Lanny Jaya'),
(448, '32', '489', '8235', 'Mamberamo Tengah'),
(449, '32', '490', '8237', 'Yalimo'),
(450, '32', '491', '8238', 'Puncak'),
(451, '32', '492', '8233', 'Dogiyai'),
(452, '32', '493', '8241', 'Deiyai'),
(453, '32', '494', '8239', 'Intan Jaya'),
(454, '34', '496', '5404', 'Bulungan'),
(455, '34', '497', '5410', 'Malinau'),
(456, '34', '498', '5409', 'Nunukan'),
(457, '34', '499', '5412', 'Tana Tidung'),
(458, '33', '500', '8402', 'Fakfak'),
(459, '33', '501', '8406', 'Kaimana'),
(460, '33', '502', '8403', 'Manokwari'),
(461, '33', '503', '8412', 'Manokwari Selatan'),
(462, '33', '504', '8410', 'Maybrat'),
(463, '33', '505', '8411', 'Pegunungan Arfak'),
(464, '33', '506', '8405', 'Raja Ampat'),
(465, '33', '507', '8401', 'Sorong'),
(466, '33', '508', '8404', 'Sorong Selatan'),
(467, '33', '510', '8407', 'Teluk Bintuni'),
(468, '34', '511', '5493', 'Tarakan'),
(469, '33', '512', '8408', 'Teluk Wondama'),
(470, '29', '9999', '7288', 'Others Bali'),
(471, '14', '9999', '3788', 'Others Bangka Belitung'),
(472, '3', '9999', '288', 'Others Banten'),
(473, '15', '9999', '2388', 'Others Bengkulu'),
(474, '5', '9999', '588', 'Others D.I. Yogyakarta'),
(475, '22', '9999', '6388', 'Others Gorontalo'),
(476, '12', '9999', '3188', 'Others jambi'),
(477, '2', '9999', '188', 'Others Jawa Barat'),
(478, '4', '9999', '988', 'Others Jawa Tengah'),
(479, '6', '9999', '1288', 'Others Jawa Timur'),
(480, '17', '9999', '5388', 'Others Kalimantan Barat'),
(481, '19', '9999', '5188', 'Others Kalimantan Selatan'),
(482, '18', '9999', '5888', 'Others Kalimantan Tengah'),
(483, '20', '9999', '5488', 'Others Kalimantan Timur'),
(484, '34', '9999', '5588', 'Others Kalimantan Utara'),
(485, '16', '9999', '3988', 'Others Lampung'),
(486, '27', '9999', '8188', 'Others Maluku'),
(487, '28', '9999', '8388', 'Others Maluku Utara'),
(488, '7', '9999', '3288', 'Others Nanggroe Aceh Darussalam'),
(489, '30', '9999', '7188', 'Others Nusa Tenggara Barat'),
(490, '31', '9999', '7488', 'Others Nusa Tenggara Timur'),
(491, '32', '9999', '8288', 'Others Papua'),
(492, '33', '9999', '8488', 'Others Papua Barat'),
(493, '10', '9999', '3588', 'Others Riau'),
(494, '25', '9999', '6488', 'Others Sulawesi Barat'),
(495, '24', '9999', '6188', 'Others Sulawesi Selatan'),
(496, '23', '9999', '6088', 'Others Sulawesi Tengah'),
(497, '26', '9999', '6988', 'Others Sulawesi Tenggara'),
(498, '21', '9999', '6288', 'Others Sulawesi Utara'),
(499, '9', '9999', '3488', 'Others Sumatera Barat'),
(500, '13', '9999', '3688', 'Others Sumatera Selatan'),
(501, '8', '9999', '3388', 'Others Sumatera Utara'),
(502, '2', '7', '191', 'Bandung'),
(503, '2', '9', '198', 'Bekasi'),
(504, '2', '10', '192', 'Bogor'),
(505, '2', '13', '194', 'Cirebon'),
(506, '2', '22', '193', 'Sukabumi'),
(507, '2', '24', '195', 'Tasikmalaya'),
(508, '3', '36', '292', 'Tangerang'),
(509, '3', '37', '293', 'Serang'),
(510, '4', '49', '995', 'Magelang'),
(511, '4', '63', '991', 'Semarang'),
(512, '4', '67', '993', 'Pekalongan'),
(513, '4', '69', '994', 'Tegal'),
(514, '6', '84', '1292', 'Mojokerto'),
(515, '6', '89', '1298', 'Madiun'),
(516, '6', '94', '1297', 'Kediri'),
(517, '6', '96', '1296', 'Blitar'),
(518, '6', '99', '1293', 'Malang'),
(519, '6', '100', '1294', 'Pasuruan'),
(520, '6', '101', '1295', 'Probolinggo'),
(521, '9', '179', '3495', 'Solok'),
(522, '17', '277', '5391', 'Pontianak'),
(523, '22', '343', '6391', 'Gorontalo'),
(524, '31', '449', '7491', 'Kupang'),
(525, '32', '467', '8291', 'Jayapura'),
(526, '33', '507', '8491', 'Sorong');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltdbb_bi_city`
--

CREATE TABLE `tltdbb_bi_city` (
  `id` int(12) NOT NULL,
  `bi_code` varchar(10) NOT NULL,
  `city` varchar(100) NOT NULL,
  `bi_city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tltdbb_bi_city`
--

INSERT INTO `tltdbb_bi_city` (`id`, `bi_code`, `city`, `bi_city`) VALUES
(1, '0180', 'Banjar', 'Kota Banjar'),
(2, '5101', 'Kab. Banjar', 'Kab. Banjar'),
(3, '0102', 'Kab. Bekasi', 'Kab. Bekasi'),
(4, '0198', 'Bekasi', 'Kota Bekasi'),
(5, '7105', 'Kab. Bima', 'Kab. Bima'),
(6, '7192', 'Bima', 'Kota Bima'),
(7, '1221', 'Kab. Blitar', 'Kab. Blitar'),
(8, '1296', 'Blitar', 'Kota Blitar'),
(9, '0108', 'Kab. Bogor', 'Kab. Bogor'),
(10, '0192', 'Bogor', 'Kota Bogor'),
(11, '0116', 'Kab. Cirebon', 'Kab. Cirebon'),
(12, '0194', 'Cirebon', 'Kota Cirebon'),
(13, '6301', 'Kab. Gorontalo', 'Kab. Gorontalo'),
(14, '6391', 'Gorontalo', 'Kota Gorontalo'),
(15, '8201', 'Kab. Jayapura', 'Kab. Jayapura'),
(16, '8291', 'Jayapura', 'Kota Jayapura'),
(17, '1217', 'Kab. Kediri', 'Kab. Kediri'),
(18, '1297', 'Kediri', 'Kota Kediri'),
(19, '7401', 'Kab. Kupang', 'Kab. Kupang'),
(20, '7491', 'Kupang', 'Kota Kupang'),
(21, '1222', 'Kab. Madiun', 'Kab. Madiun'),
(22, '1298', 'Madiun', 'Kota Madiun'),
(23, '0918', 'Kab. Magelang', 'Kab. Magelang'),
(24, '0995', 'Magelang', 'Kota Magelang'),
(25, '1213', 'Kab. Malang', 'Kab. Malang'),
(26, '1293', 'Malang', 'Kota Malang'),
(27, '1203', 'Kab. Mojokerto', 'Kab. Mojokerto'),
(28, '1292', 'Mojokerto', 'Kota Mojokerto'),
(29, '1214', 'Kab. Pasuruan', 'Kab. Pasuruan'),
(30, '1294', 'Pasuruan', 'Kota Pasuruan'),
(31, '0905', 'Kab. Pekalongan', 'Kab. Pekalongan'),
(32, '0993', 'Pekalongan', 'Kota Pekalongan'),
(33, '5301', 'Kab. Mempawah (d/h Kab. Pontianak)', 'Kab. Mempawah (d/h Kab. Pontianak)'),
(34, '5301', 'Kab. Pontianak', 'Kab. Mempawah (d/h Kab. Pontianak)'),
(35, '5391', 'Pontianak', 'Kota Pontianak'),
(36, '1215', 'Kab. Probolinggo', 'Kab. Probolinggo'),
(37, '1295', 'Probolinggo', 'Kota Probolinggo'),
(38, '3588', 'Riau', 'Kab./Kota Lainnya di Riau'),
(39, '3888', 'Kepulauan Riau', 'Kab./Kota Lainnya di Kepulauan Riau'),
(40, '3408', 'Kab. Sijunjung', 'Kab. Sawahlunto/Sijunjung'),
(41, '3408', 'Kab. Sawahlunto', 'Kab. Sawahlunto/Sijunjung'),
(42, '3493', 'Sawahlunto', 'Kota Sawahlunto'),
(43, '0901', 'Kab. Semarang', 'Kab. Semarang'),
(44, '0991', 'Semarang', 'Kota Semarang'),
(45, '0203', 'Kab. Serang', 'Kab. Serang'),
(46, '0293', 'Serang', 'Kota Serang'),
(47, '3412', 'Kab. Solok', 'Kab. Solok'),
(48, '3495', 'Solok', 'Kota Solok'),
(49, '8401', 'Kab. Sorong', 'Kab. Sorong'),
(50, '8491', 'Sorong', 'Kota Sorong'),
(51, '0109', 'Kab. Sukabumi', 'Kab. Sukabumi'),
(52, '0193', 'Sukabumi', 'Kota Sukabumi'),
(53, '0204', 'Kab. Tangerang', 'Kab. Tangerang'),
(54, '0292', 'Tangerang', 'Kota Tangerang'),
(55, '0113', 'Kab. Tasikmalaya', 'Kab. Tasikmalaya'),
(56, '0195', 'Tasikmalaya', 'Kota Tasikmalaya'),
(57, '0906', 'Kab. Tegal', 'Kab. Tegal'),
(58, '0994', 'Tegal', 'Kota Tegal'),
(59, '3288', 'Aceh', 'Kab./Kota Lainnya di Aceh'),
(60, '3206', 'Aceh Barat', 'Kab. Aceh Barat'),
(61, '3213', 'Aceh Barat Daya', 'Kab. Aceh Barat Daya'),
(62, '3201', 'Aceh Besar', 'Kab. Aceh Besar'),
(63, '3214', 'Aceh Jaya', 'Kab. Aceh Jaya'),
(64, '3210', 'Aceh Jeumpa', 'Kab. Aceh Jeumpa/Bireuen'),
(65, '3205', 'Aceh Selatan', 'Kab. Aceh Selatan'),
(66, '3209', 'Aceh Singkil', 'Kab. Aceh Singkil'),
(67, '3211', 'Aceh Tamiang', 'Kab. Aceh Tamiang'),
(68, '3207', 'Aceh Tengah', 'Kab. Aceh Tengah'),
(69, '3208', 'Aceh Tenggara', 'Kab. Aceh Tenggara'),
(70, '3204', 'Aceh Timur', 'Kab. Aceh Timur'),
(71, '3203', 'Aceh Utara', 'Kab. Aceh Utara'),
(72, '3401', 'Agam', 'Kab. Agam'),
(73, '7405', 'Alor', 'Kab. Alor'),
(74, '8191', 'Ambon', 'Kota Ambon'),
(75, '3306', 'Asahan', 'Kab. Asahan'),
(76, '8228', 'Asmat', 'Kab. Asmat'),
(77, '7204', 'Badung', 'Kab. Badung'),
(78, '5111', 'Balangan', 'Kab. Balangan'),
(79, '7288', 'Bali', 'Kab./Kota Lainnya di Bali'),
(80, '5492', 'Balikpapan', 'Kota Balikpapan'),
(81, '3291', 'Banda Aceh', 'Kota Banda Aceh'),
(82, '3991', 'Bandar Lampung', 'Kota Bandar Lampung'),
(83, '0111', 'Kab. Bandung', 'Kab. Bandung'),
(84, '0122', 'Bandung Barat', 'Kab. Bandung Barat'),
(85, '6003', 'Banggai', 'Kab. Banggai'),
(86, '6005', 'Banggai Kepulauan', 'Kab. Banggai Kepulauan'),
(87, '6011', 'Banggai Laut', 'Kab. Banggai Laut'),
(88, '3701', 'Bangka', 'Kab. Bangka'),
(89, '3703', 'Bangka Barat', 'Kab. Bangka Barat'),
(90, '3788', 'Bangka Belitung', 'Kab./Kota Lainnya di Kep. Bangka'),
(91, '3704', 'Bangka Selatan', 'Kab. Bangka Selatan'),
(92, '3705', 'Bangka Tengah', 'Kab. Bangka Tengah'),
(93, '1208', 'Bangkalan', 'Kab. Bangkalan'),
(94, '7207', 'Bangli', 'Kab. Bangli'),
(95, '5192', 'Banjarbaru', 'Kota Banjarbaru'),
(96, '5191', 'Banjarmasin', 'Kota Banjarmasin'),
(97, '0917', 'Banjarnegara', 'Kab. Banjarnegara'),
(98, '6112', 'Bantaeng', 'Kab. Bantaeng'),
(99, '0288', 'Banten', 'Kab./Kota Lainnya di Banten'),
(100, '0501', 'Bantul', 'Kab. Bantul'),
(101, '3613', 'Banyuasin', 'Kab. Banyuasin'),
(102, '0914', 'Banyumas', 'Kab. Banyumas'),
(103, '1211', 'Banyuwangi', 'Kab. Banyuwangi'),
(104, '5107', 'Barito Kuala', 'Kab. Barito Kuala'),
(105, '5806', 'Barito Selatan', 'Kab. Barito Selatan'),
(106, '5805', 'Barito Timur', 'Kab. Barito Timur'),
(107, '5808', 'Barito Utara', 'Kab. Barito Utara'),
(108, '6116', 'Barru', 'Kab. Barru'),
(109, '5108', 'Baru', 'Kab. Kota Baru'),
(110, '3892', 'Batam', 'Kota Batam'),
(111, '0929', 'Batang', 'Kab. Batang'),
(112, '3101', 'Batanghari', 'Kab. Batanghari'),
(113, '1271', 'Batu', 'Kota Batu'),
(114, '3321', 'Batu Bara', 'Kab. Batu Bara'),
(115, '6990', 'Bau-Bau', 'Kota Bau-Bau'),
(116, '3702', 'Belitung', 'Kab. Belitung'),
(117, '3706', 'Belitung Timur', 'Kab. Belitung Timur'),
(118, '7404', 'Belu', 'Kab. Belu'),
(119, '3217', 'Bener Meriah', 'Kab. Bener Meriah'),
(120, '3502', 'Bengkalis', 'Kab. Bengkalis'),
(121, '5307', 'Bengkayang', 'Kab. Bengkayang'),
(122, '2391', 'Bengkulu', 'Kota Bengkulu'),
(123, '2301', 'Bengkulu Selatan', 'Kab. Bengkulu Selatan'),
(124, '2309', 'Bengkulu Tengah', 'Kab. Bengkulu Tengah'),
(125, '2302', 'Bengkulu Utara', 'Kab. Bengkulu Utara'),
(126, '5402', 'Berau', 'Kab. Berau'),
(127, '8202', 'Biak Numfor', 'Kab. Biak Numfor'),
(128, '3392', 'Binjai', 'Kota Binjai'),
(129, '3804', 'Bintan', 'Kab. Bintan (d/h Kab. Kepulauan Riau)'),
(130, '3210', 'Bireuen', 'Kab. Aceh Jeumpa/Bireuen'),
(131, '6293', 'Bitung', 'Kota Bitung'),
(132, '0913', 'Blora', 'Kab. Blora'),
(133, '1227', 'Bojonegoro', 'Kab. Bojonegoro'),
(134, '6203', 'Bolaang Mongondow', 'Kab. Bolaang Mongondow'),
(135, '6212', 'Bolaang Mongondow Selatan', 'Kab. Bolaang Mongondow Selatan'),
(136, '6213', 'Bolaang Mongondow Timur', 'Kab. Bolaang Mongondow Timur'),
(137, '6210', 'Bolaang Mongondow Utara', 'Kab. Bolaang Mongondow Utara'),
(138, '6908', 'Bombana', 'Kab. Bombana'),
(139, '1209', 'Bondowoso', 'Kab. Bondowoso'),
(140, '6105', 'Bone', 'Kab. Bone'),
(141, '6303', 'Bonebolango', 'Kab. Bonebolango'),
(142, '5494', 'Bontang', 'Kota Bontang'),
(143, '8226', 'Boven Digoel', 'Kab. Boven Digoel'),
(144, '0924', 'Boyolali', 'Kab. Boyolali'),
(145, '0907', 'Brebes', 'Kab. Brebes'),
(146, '6302', 'Bualemo', 'Kab. Bualemo'),
(147, '3491', 'Bukittinggi', 'Kota Bukittinggi'),
(148, '7201', 'Buleleng', 'Kab. Buleleng'),
(149, '6111', 'Bulukumba', 'Kab. Bulukumba'),
(150, '5404', 'Bulungan', 'Kab. Bulungan'),
(151, '3112', 'Bungo', 'Kab. Bungo'),
(152, '6007', 'Buol', 'Kab. Buol'),
(153, '8104', 'Buru', 'Kab. Buru'),
(154, '8109', 'Buru Selatan', 'Kab. Buru Selatan'),
(155, '6901', 'Buton', 'Kab. Buton'),
(156, '6914', 'Buton Selatan', 'Kab. Buton Selatan'),
(157, '6915', 'Buton Tengah', 'Kab. Buton Tengah'),
(158, '6910', 'Buton Utara', 'Kab. Buton Utara'),
(159, '0115', 'Ciamis', 'Kab. Ciamis'),
(160, '0110', 'Cianjur', 'Kab. Cianjur'),
(161, '0915', 'Cilacap', 'Kab. Cilacap'),
(162, '0291', 'Cilegon', 'Kota Cilegon'),
(163, '0196', 'Cimahi', 'Kota Cimahi'),
(164, '2388', 'Curup', 'Kab./Kota Lainnya di Bengkulu'),
(165, '3307', 'Dairi', 'Kab. Dairi'),
(166, '8241', 'Deiyai', 'Kab. Deiyai'),
(167, '3301', 'Deli Serdang', 'Kab. Deli Serdang'),
(168, '0903', 'Demak', 'Kab. Demak'),
(169, '7291', 'Denpasar', 'Kota Denpasar'),
(170, '0197', 'Depok', 'Kota Depok'),
(171, '3411', 'Dharmasraya', 'Kab. Dharmasraya'),
(172, '8233', 'Dogiyai', 'Kab. Dogiyai'),
(173, '7106', 'Dompu', 'Kab. Dompu'),
(174, '6001', 'Donggala', 'Kab. Donggala'),
(175, '3592', 'Dumai', 'Kota Dumai'),
(176, '3617', 'Empat Lawang', 'Kab. Empat Lawang'),
(177, '7408', 'Ende', 'Kab. Ende'),
(178, '6121', 'Enrekang', 'Kab. Enrekang'),
(179, '8402', 'Fak-Fak', 'Kab. Fak-Fak'),
(180, '7406', 'Flores Timur', 'Kab. Flores Timur'),
(181, '0114', 'Garut', 'Kab. Garut'),
(182, '3212', 'Gayo Luwes', 'Kab. Gayo Luwes'),
(183, '7205', 'Gianyar', 'Kab. Gianyar'),
(184, '6388', 'Gorontalo Selatan', 'Kab./Kota Lainnya di Gorontalo'),
(185, '6305', 'Gorontalo Utara', 'Kab. Gorontalo Utara'),
(186, '6102', 'Gowa', 'Kab. Gowa'),
(187, '1201', 'Gresik', 'Kab. Gresik'),
(188, '0904', 'Grobogan', 'Kab. Grobogan'),
(189, '0503', 'Gunung Kidul', 'Kab. Gunung Kidul'),
(190, '5807', 'Gunung Mas', 'Kab. Gunung Mas'),
(191, '3397', 'Gunung Sitoli', 'Kota Gunung Sitoli'),
(192, '8305', 'Halmahera Barat', 'Kab. Halmahera Barat'),
(193, '8306', 'Halmahera Selatan', 'Kab. Halmahera Selatan'),
(194, '8302', 'Halmahera Tengah', 'Kab. Halmahera Tengah'),
(195, '8304', 'Halmahera Timur', 'Kab. Halmahera Timur'),
(196, '8303', 'Halmahera Utara', 'Kab. Halmahera Utara'),
(197, '5104', 'Hulu Sungai Selatan', 'Kab. Hulu Sungai Selatan'),
(198, '5105', 'Hulu Sungai Tengah', 'Kab. Hulu Sungai Tengah'),
(199, '5106', 'Hulu Sungai Utara', 'Kab. Hulu Sungai Utara'),
(200, '3316', 'Humbang Hasundutan', 'Kab. Humbang Hasundutan'),
(201, '3505', 'Indragiri Hilir', 'Kab. Indragiri Hilir'),
(202, '3504', 'Indragiri Hulu', 'Kab. Indragiri Hulu'),
(203, '0118', 'Indramayu', 'Kab. Indramayu'),
(204, '8239', 'Intan Jaya', 'Kab. Intan Jaya'),
(205, '0394', 'Jakarta', 'Wil. Kota Jakarta Selatan'),
(206, '0393', 'Jakarta Barat', 'Wil. Kota Jakarta Barat'),
(207, '0391', 'Jakarta Pusat', 'Wil. Kota Jakarta Pusat'),
(208, '0394', 'Jakarta Selatan', 'Wil. Kota Jakarta Selatan'),
(209, '0395', 'Jakarta Timur', 'Wil. Kota Jakarta Timur'),
(210, '0392', 'Jakarta Utara', 'Wil. Kota Jakarta Utara'),
(211, '3191', 'Jambi', 'Kota Jambi'),
(212, '3188', 'Jambi Lainnya', 'Kab./Kota Lainnya di Jambi'),
(213, '0188', 'Jawa Barat', 'Kab/Kota Lainnya di Jabar'),
(214, '0988', 'Jawa Tengah', 'Kab./Kota Lainnya di Jateng'),
(215, '1288', 'Jawa Timur', 'Kab./Kota Lainnya di Jatim'),
(216, '8213', 'Jayawijaya', 'Kab. Jayawijaya'),
(217, '1212', 'Jember', 'Kab. Jember'),
(218, '7202', 'Jembrana', 'Kab. Jembrana'),
(219, '6113', 'Jeneponto', 'Kab. Jeneponto'),
(220, '0911', 'Jepara', 'Kab. Jepara'),
(221, '1204', 'Jombang', 'Kab. Jombang'),
(222, '8406', 'Kaimana', 'Kab. Kaimana'),
(223, '5388', 'Kalimantan Barat', 'Kab./Kota Lainnya di Kalbar'),
(224, '5188', 'Kalimantan Selatan', 'Kab./Kota Lainnya di Kalsel'),
(225, '5888', 'Kalimantan Tengah', 'Kab./Kota Lainnya di Kalteng'),
(226, '5488', 'Kalimantan Timur', 'Kab./Kota Lainnya di Kaltim'),
(227, '5588', 'Kalimantan Utara', 'Kab./Kota Lainnya di Kaltara'),
(228, '3501', 'Kampar', 'Kab. Kampar'),
(229, '5801', 'Kapuas', 'Kab. Kapuas'),
(230, '5306', 'Kapuas Hulu', 'Kab. Kapuas Hulu'),
(231, '0927', 'Karanganyar', 'Kab. Karanganyar'),
(232, '7208', 'Karangasem', 'Kab. Karangasem'),
(233, '0106', 'Karawang', 'Kab. Karawang'),
(234, '3801', 'Karimun', 'Kab. Karimun'),
(235, '3303', 'Karo', 'Kab. Karo'),
(236, '5811', 'Katingan', 'Kab. Katingan'),
(237, '2308', 'Kaur', 'Kab. Kaur'),
(238, '5311', 'Kayong Utara', 'Kab. Kayong Utara'),
(239, '0922', 'Kebumen', 'Kab. Kebumen'),
(240, '8218', 'Keerom', 'Kab. Keerom'),
(241, '0902', 'Kendal', 'Kab. Kendal'),
(242, '6991', 'Kendari', 'Kota Kendari'),
(243, '2305', 'Kepahiang', 'Kab. Kepahiang'),
(244, '3805', 'Kepulauan Anambas', 'Kab. Kepulauan Anambas'),
(245, '8107', 'Kepulauan Aru', 'Kota Kepulauan Aru'),
(246, '3409', 'Kepulauan Mentawai', 'Kab. Kepulauan Mentawai'),
(247, '3513', 'Kepulauan Meranti', 'Kab. Kepulauan Meranti'),
(248, '3804', 'Kepulauan Riau', 'Kab. Bintan (d/h Kab. Kepulauan Riau)'),
(249, '6204', 'Kepulauan Sangihe', 'Kab. Kepulauan Sangihe'),
(250, '6114', 'Kepulauan Selayar', 'Kab. Kepualauan Selayar (d/h Kab. Selayar)'),
(251, '0396', 'Kepulauan Seribu', 'Wil. Kepulauan Seribu'),
(252, '6211', 'Kepulauan Siau Tagulandang Biaro', 'Kab. Kepulauan Siau Tagulandang Biaro'),
(253, '8307', 'Kepulauan Sula', 'Kab. Kepulauan Sula'),
(254, '6205', 'Kepulauan Talaud', 'Kab. Kepulauan Talaud'),
(255, '8210', 'Kepulauan Yapen', 'Kab. Kepulauan Yapen'),
(256, '3105', 'Kerinci', 'Kab. Kerinci'),
(257, '5303', 'Ketapang', 'Kab. Ketapang'),
(258, '0923', 'Klaten', 'Kab. Klaten'),
(259, '7206', 'Klungkung', 'Kab. Klungkung'),
(260, '6904', 'Kolaka', 'Kab. Kolaka'),
(261, '6912', 'Kolaka Timur', 'Kab. Kolaka Timur'),
(262, '6909', 'Kolaka Utara', 'Kab. Kolaka Utara'),
(263, '6906', 'Konawe', 'Kab. Konawe'),
(264, '6913', 'Konawe Kepulauan', 'Kab. Konawe Kepulauan'),
(265, '6907', 'Konawe Selatan', 'Kab. Konawe Selatan'),
(266, '6911', 'Konawe Utara', 'Kab. Konawe Utara'),
(267, '0191', 'Bandung', 'Kota Bandung'),
(268, '6292', 'Kotamobagu', 'Kota Kotamobagu'),
(269, '5802', 'Kotawaringin Barat', 'Kab. Kotawaringin Barat'),
(270, '5803', 'Kotawaringin Timur', 'Kab. Kotawaringin Timur'),
(271, '3512', 'Kuantan Singingi', 'Kab. Kuantan Singingi'),
(272, '5312', 'Kubu Raya', 'Kab. Kubu Raya'),
(273, '0909', 'Kudus', 'Kab. Kudus'),
(274, '0504', 'Kulon Progo', 'Kab. Kulon Progo'),
(275, '0117', 'Kuningan', 'Kab. Kuningan'),
(276, '5405', 'Kutai Barat', 'Kab. Kutai Barat'),
(277, '5401', 'Kutai Kartanegara', 'Kab. Kutai Kartanegara'),
(278, '5406', 'Kutai Timur', 'Kab. Kutai Timur'),
(279, '3324', 'Labuanbatu Selatan', 'Kab. Labuanbatu Selatan'),
(280, '3325', 'Labuanbatu Utara', 'Kab. Labuanbatu Utara'),
(281, '3305', 'Labuhan Batu', 'Kab. Labuhan Batu'),
(282, '3609', 'Lahat', 'Kab. Lahat'),
(283, '0588', 'Lainnya', 'Kab./Kota Lainnya'),
(284, '5813', 'Lamandau', 'Kab. Lamandau'),
(285, '1229', 'Lamongan', 'Kab. Lamongan'),
(286, '3988', 'Lampung', 'Kab./Kota Lainnya di Lampung'),
(287, '3904', 'Lampung Barat', 'Kab. Lampung Barat'),
(288, '3901', 'Lampung Selatan', 'Kab. Lampung Selatan'),
(289, '3902', 'Lampung Tengah', 'Kab. Lampung Tengah'),
(290, '3907', 'Lampung Timur', 'Kab. Lampung Timur'),
(291, '3903', 'Lampung Utara', 'Kab. Lampung Utara'),
(292, '5308', 'Landak', 'Kab. Landak'),
(293, '3302', 'Langkat', 'Kab. Langkat'),
(294, '3294', 'Langsa', 'Kota Langsa'),
(295, '8234', 'Lanny Jaya', 'Kab. Lanny Jaya'),
(296, '0201', 'Lebak', 'Kab. Lebak'),
(297, '2304', 'Lebong', 'Kab. Lebong'),
(298, '3608', 'Lematang Ilir Ogan Tengah', 'Kab. Lematang Ilir Ogan Tengah (Muara Enim)'),
(299, '7413', 'Lembata', 'Kab. Lembata'),
(300, '3293', 'Lhokseumawe', 'Kota Lhokseumawe'),
(301, '3403', 'Lima Puluh Kota', 'Kab. Lima Puluh Kota'),
(302, '3802', 'Lingga', 'Kab. Lingga'),
(303, '7101', 'Lombok Barat', 'Kab. Lombok Barat'),
(304, '7102', 'Lombok Tengah', 'Kab. Lombok Tengah'),
(305, '7103', 'Lombok Timur', 'Kab. Lombok Timur'),
(306, '7108', 'Lombok Utara', 'Kab. Lombok Utara'),
(307, '3693', 'Lubuklinggau', 'Kota Lubuklinggau'),
(308, '1216', 'Lumajang', 'Kab. Lumajang'),
(309, '6109', 'Luwu', 'Kab. Luwu'),
(310, '6122', 'Luwu Selatan', 'Kab. Luwu Timur (d/h Kab. Luwu Selatan)'),
(311, '6122', 'Luwu Timur', 'Kab. Luwu Timur (d/h Kab. Luwu Selatan)'),
(312, '6124', 'Luwu Utara', 'Kab. Luwu Utara'),
(313, '1224', 'Magetan', 'Kab. Magetan'),
(314, '5413', 'Mahakam Ulu', 'Kab. Mahakam Ulu'),
(315, '0119', 'Majalengka', 'Kab. Majalengka'),
(316, '6402', 'Majene', 'Kab. Majene'),
(317, '6191', 'Makassar', 'Kota Makassar'),
(318, '7421', 'Malaka', 'Kab. Malaka'),
(319, '5410', 'Malinau', 'Kab. Malinau'),
(320, '8188', 'Maluku', 'Kab./Kota Lainnya di Maluku'),
(321, '8108', 'Maluku Barat Daya', 'Kab. Maluku Barat Daya'),
(322, '7488', 'Maluku Tengah', 'Kab./Kota Lainnya di NTT'),
(323, '8102', 'Maluku Tenggara', 'Kab. Maluku Tenggara'),
(324, '8103', 'Maluku Tenggara Barat', 'Kab. Maluku Tenggara Barat'),
(325, '8388', 'Maluku Utara', 'Kab./Kota Lainnya di Maluku Utara'),
(326, '6403', 'Mamasa', 'Kab. Mamasa'),
(327, '8232', 'Mamberamo Raya', 'Kab. Mamberamo Raya'),
(328, '8235', 'Mamberamo Tengah', 'Kab. Mamberamo Tengah'),
(329, '6491', 'Mamuju', 'Kota Mamuju'),
(330, '6405', 'Mamuju Tengah', 'Kab. Mamuju Tengah'),
(331, '6404', 'Mamuju Utara', 'Kab. Mamuju Utara'),
(332, '6291', 'Manado', 'Kota Manado'),
(333, '3314', 'Mandailing Natal', 'Kab. Mandailing Natal'),
(334, '7410', 'Manggarai', 'Kab. Manggarai'),
(335, '7415', 'Manggarai Barat', 'Kab. Manggarai Barat'),
(336, '7418', 'Manggarai Timur', 'Kab. Manggarai Timur'),
(337, '8403', 'Manokwari', 'Kab. Manokwari'),
(338, '8412', 'Manokwari Selatan', 'Kab. Manokwari Selatan'),
(339, '8227', 'Mappi', 'Kab. Mappi'),
(340, '6107', 'Maros', 'Kab. Maros'),
(341, '7191', 'Mataram', 'Kota Mataram'),
(342, '8410', 'Maybrat', 'Kab. Maybrat'),
(343, '3396', 'Medan', 'Kota Medan'),
(344, '5310', 'Melawi', 'Kab. Melawi'),
(345, '5188', 'Mempawah', 'Kab./Kota Lainnya di Kalsel'),
(346, '3111', 'Merangin', 'Kab. Merangin'),
(347, '8211', 'Merauke', 'Kab. Merauke'),
(348, '3912', 'Mesuji', 'Kab. Mesuji'),
(349, '3992', 'Metro', 'Kota Metro'),
(350, '8215', 'Mimika', 'Kab. Mimika'),
(351, '6202', 'Minahasa', 'Kab. Minahasa'),
(352, '6206', 'Minahasa Selatan', 'Kab. Minahasa Selatan'),
(353, '6209', 'Minahasa Tenggara', 'Kab. Minahasa Tenggara'),
(354, '6207', 'Minahasa Utara', 'Kab. Minahasa Utara'),
(355, '6006', 'Morowali', 'Kab. Morowali'),
(356, '6012', 'Morowali Utara', 'Kab. Morowali Utara'),
(357, '3608', 'Muara Enim', 'Kab. Lematang Ilir Ogan Tengah (Muara Enim)'),
(358, '3106', 'Muaro Jambi', 'Kab. Muaro Jambi'),
(359, '2306', 'Mukomuko', 'Kab. Mukomuko'),
(360, '6903', 'Muna', 'Kab. Muna'),
(361, '6916', 'Muna Barat', 'Kab. Muna Barat'),
(362, '5804', 'Murung Raya', 'Kab. Murung Raya'),
(363, '3606', 'Musi Banyuasin', 'Kab. Musi Banyuasin'),
(364, '3610', 'Musi Rawas', 'Kab. Musi Rawas'),
(365, '3618', 'Musi Rawas Utara', 'Kab. Musi Rawas Utara'),
(366, '8214', 'Nabire', 'Kab. Nabire'),
(367, '3215', 'Nagan Raya', 'Kab. Nagan Raya'),
(368, '7419', 'Nagekeo', 'Kab. Nagekeo'),
(369, '3803', 'Natuna', 'Kab. Natuna'),
(370, '8236', 'Nduga', 'Kab. Nduga'),
(371, '7409', 'Ngada', 'Kab. Ngada'),
(372, '1218', 'Nganjuk', 'Kab. Nganjuk'),
(373, '1223', 'Ngawi', 'Kab. Ngawi'),
(374, '3311', 'Nias', 'Kab. Nias'),
(375, '3326', 'Nias Barat', 'Kab. Nias Barat'),
(376, '3315', 'Nias Selatan', 'Kab. Nias Selatan'),
(377, '3327', 'Nias Utara', 'Kab. Nias Utara'),
(378, '5409', 'Nunukan', 'Kab. Nunukan'),
(379, '7188', 'Nusa Tenggara Barat', 'Kab./Kota Lainnya di NTB'),
(380, '7488', 'Nusa Tenggara Timur', 'Kab./Kota Lainnya di NTT'),
(381, '3616', 'Ogan Ilir', 'Kab. Ogan Ilir'),
(382, '3611', 'Ogan Komering Ilir', 'Kab. Ogan Komering Ilir'),
(383, '3607', 'Ogan Komering Ulu', 'Kab. Ogan Komering Ulu'),
(384, '3614', 'Ogan Komering Ulu Selatan', 'Kab. Ogan Komering Ulu Selatan'),
(385, '3615', 'Ogan Komering Ulu Timur', 'Kab. Ogan Komering Ulu Timur'),
(386, '1226', 'Pacitan', 'Kab. Pacitan'),
(387, '3492', 'Padang', 'Kota Padang'),
(388, '3322', 'Padang Lawas', 'Kab. Padang Lawas'),
(389, '3323', 'Padang Lawas Utara', 'Kab. Padang Lawas Utara'),
(390, '3494', 'Padang Panjang', 'Kota Padang Panjang'),
(391, '3405', 'Padang Pariaman', 'Kab. Padang Pariaman'),
(392, '3399', 'Padang Sidempuan', 'Kota Padang Sidempuan'),
(393, '3697', 'Pagar Alam', 'Kota Pagar Alam'),
(394, '3317', 'Pakpak Bharat', 'Kab. Pakpak Bharat'),
(395, '5892', 'Palangkaraya', 'Kota Palangkaraya'),
(396, '3691', 'Palembang', 'Kota Palembang'),
(397, '6193', 'Palopo', 'Kota Palopo'),
(398, '6091', 'Palu', 'Kota Palu'),
(399, '1206', 'Pamekasan', 'Kab. Pamekasan'),
(400, '0202', 'Pandeglang', 'Kab. Pandeglang'),
(401, '0123', 'Pangandaran', 'Kab. Pangandaran'),
(402, '6118', 'Pangkajene Kepulauan', 'Kab. Pangkajene Kepulauan'),
(403, '3791', 'Pangkal Pinang', 'Kota Pangkal Pinang'),
(404, '8212', 'Paniai', 'Kab. Paniai'),
(405, '8288', 'Papua', 'Kab./Kota Lainnya di Papua'),
(406, '8488', 'Papua Barat', 'Kab./Kota Lainnya di Papua Barat'),
(407, '6192', 'Pare-Pare', 'Kota Pare-Pare'),
(408, '3497', 'Pariaman', 'Kota Pariaman'),
(409, '6009', 'Parigi Moutong', 'Kab. Parigi Moutong'),
(410, '3402', 'Pasaman', 'Kab. Pasaman'),
(411, '3410', 'Pasaman Barat', 'Kab. Pasaman Barat'),
(412, '5403', 'Paser', 'Kab. Paser'),
(413, '0908', 'Pati', 'Kab. Pati'),
(414, '3496', 'Payakumbuh', 'Kota Payakumbuh'),
(415, '8411', 'Pegunungan Arfak', 'Kab. Pegunungan Arfak'),
(416, '8221', 'Pegunungan Bintang', 'Kab. Pegunungan Bintang'),
(417, '3591', 'Pekanbaru', 'Kota Pekanbaru'),
(418, '3510', 'Pelalawan', 'Kab. Pelalawan'),
(419, '0910', 'Pemalang', 'Kab. Pemalang'),
(420, '3393', 'Pematang Siantar', 'Kota Pematang Siantar'),
(421, '5411', 'Penajam Paser Utara', 'Kab. Penajam Paser Utara'),
(422, '3619', 'Penukal Abab Lematang Ilir', 'Kab. Penukal Abab Lematang Ilir'),
(423, '3909', 'Pesawaran', 'Kab. Pesawaran'),
(424, '3913', 'Pesisir Barat', 'Kab. Pesisir Barat'),
(425, '3406', 'Pesisir Selatan', 'Kab. Pesisir Selatan'),
(426, '3202', 'Pidie', 'Kab. Pidie'),
(427, '3218', 'Pidie Jaya', 'Kab. Pidie Jaya'),
(428, '6101', 'Pinrang', 'Kab. Pinrang'),
(429, '6304', 'Pohuwato', 'Kab. Pohuwato'),
(430, '6401', 'Polewali Mandar', 'Kab. Polewali Mandar'),
(431, '1225', 'Ponorogo', 'Kab. Ponorogo'),
(432, '6002', 'Poso', 'Kab. Poso'),
(433, '3694', 'Prabumulih', 'Kota Prabumulih'),
(434, '3910', 'Pringsewu', 'Kab. Pringsewu'),
(435, '5809', 'Pulang Pisau', 'Kab. Pulang Pisau'),
(436, '8308', 'Pulau Morotai', 'Kab. Pulau Morotai'),
(437, '8309', 'Pulau Taliabu', 'Kab. Pulau Taliabu'),
(438, '8238', 'Puncak', 'Kab. Puncak'),
(439, '8216', 'Puncak Jaya', 'Kab. Puncak Jaya'),
(440, '0916', 'Purbalingga', 'Kab. Purbalingga'),
(441, '0103', 'Purwakarta', 'Kab. Purwakarta'),
(442, '0921', 'Purworejo', 'Kab. Purworejo'),
(443, '8405', 'Raja Ampat', 'Kab. Raja Ampat'),
(444, '2303', 'Rejang Lebong', 'Kab. Rejang Lebong'),
(445, '0912', 'Rembang', 'Kab. Rembang'),
(446, '3509', 'Rokan Hilir', 'Kab. Rokan Hilir'),
(447, '3508', 'Rokan Hulu', 'Kab. Rokan Hulu'),
(448, '7414', 'Rote Ndao', 'Kab. Rote Ndao'),
(449, '7420', 'Sab Raijua', 'Kab. Sab Raijua'),
(450, '3292', 'Sabang', 'Kota Sabang'),
(451, '0992', 'Salatiga', 'Kota Salatiga'),
(452, '5491', 'Samarinda', 'Kota Samarinda'),
(453, '5302', 'Sambas', 'Kab. Sambas'),
(454, '3318', 'Samosir', 'Kab. Samosir'),
(455, '1205', 'Sampang', 'Kab. Sampang'),
(456, '5304', 'Sanggau', 'Kab. Sanggau'),
(457, '8217', 'Sarmi', 'Kab. Sarmi'),
(458, '3104', 'Sarolangun', 'Kab. Sarolangun'),
(459, '5309', 'Sekadau', 'Kab. Sekadau'),
(460, '6114', 'Selayar', 'Kab. Kepualauan Selayar (d/h Kab. Selayar)'),
(461, '2307', 'Seluma', 'Kab. Seluma'),
(462, '8105', 'Seram Bagian Barat', 'Kota Seram Bagian Barat'),
(463, '8106', 'Seram Bagian Timur', 'Kota Seram Bagian Timur'),
(464, '3319', 'Serdang Bedagai', 'Kab. Serdang Bedagai'),
(465, '5810', 'Seruyan', 'Kab. Seruyan'),
(466, '3511', 'Siak', 'Kab. Siak'),
(467, '3395', 'Sibolga', 'Kota Sibolga'),
(468, '6117', 'Sidenreng Rappang', 'Kab. Sidenreng Rappang'),
(469, '1202', 'Sidoarjo', 'Kab. Sidoarjo'),
(470, '6010', 'Sigi', 'Kab. Sigi'),
(471, '3408', 'Sijunjung', 'Kab. Sawahlunto/Sijunjung'),
(472, '7407', 'Sikka', 'Kab. Sikka'),
(473, '3304', 'Simalungun', 'Kab. Simalungun'),
(474, '3216', 'Simeuleu', 'Kab. Simeuleu'),
(475, '5392', 'Singkawang', 'Kota Singkawang'),
(476, '6110', 'Sinjai', 'Kab. Sinjai'),
(477, '5305', 'Sintang', 'Kab. Sintang'),
(478, '1230', 'Situbondo', 'Kab. Situbondo'),
(479, '0502', 'Sleman', 'Kab. Sleman'),
(480, '0996', 'Solo', 'Kota Surakarta/Solo'),
(481, '3404', 'Solok Selatan', 'Kab. Solok Selatan'),
(482, '6119', 'Soppeng', 'Kab. Soppeng (d/h Kab. Watansoppeng)'),
(483, '8404', 'Sorong Selatan', 'Kab. Sorong Selatan'),
(484, '0925', 'Sragen', 'Kab. Sragen'),
(485, '0121', 'Subang', 'Kab. Subang'),
(486, '3219', 'Subulussalam', 'Kab. Subulussalam'),
(487, '5812', 'Sukamara', 'Kab. Sukamara'),
(488, '0926', 'Sukoharjo', 'Kab. Sukoharjo'),
(489, '6488', 'Sulawesi Barat', 'Kab./Kota Lainnya di Sulbar'),
(490, '6188', 'Sulawesi Selatan', 'Kab./Kota Lainnya di Sulsel'),
(491, '6088', 'Sulawesi Tengah', 'Kab./Kota Lainnya di Sulteng'),
(492, '6988', 'Sulawesi Tenggara', 'Kab./Kota Lainnya di Sulteng'),
(493, '6288', 'Sulawesi Utara', 'Kab./Kota Lainnya di Sulut'),
(494, '3488', 'Sumatera Barat', 'Kab./Kota Lainnya di Sumbar'),
(495, '3688', 'Sumatera Selatan', 'Kab./Kota Lainnya di Sumsel'),
(496, '3388', 'Sumatera Utara', 'Kab/Kota Lainnya di Sumut'),
(497, '7412', 'Sumba Barat', 'Kab. Sumba Barat'),
(498, '7417', 'Sumba Barat Daya', 'Kab. Sumba Barat Daya'),
(499, '7416', 'Sumba Tengah', 'Kab. Sumba Tengah'),
(500, '7411', 'Sumba Timur', 'Kab. Sumba Timur'),
(501, '7104', 'Sumbawa', 'Kab. Sumbawa'),
(502, '7107', 'Sumbawa Barat', 'Kab. Sumbawa Barat'),
(503, '0112', 'Sumedang', 'Kab. Sumedang'),
(504, '1207', 'Sumenep', 'Kab. Sumenep'),
(505, '3192', 'Sungai Penuh', 'Kota Sungai Penuh'),
(506, '8231', 'Supiori', 'Kab. Supiori'),
(507, '1291', 'Surabaya', 'Kota Surabaya'),
(508, '0996', 'Surakarta', 'Kota Surakarta/Solo'),
(509, '5109', 'Tabalong', 'Kab. Tabalong'),
(510, '7203', 'Tabanan', 'Kab. Tabanan'),
(511, '6115', 'Takalar', 'Kab. Takalar'),
(512, '5412', 'Tana Tidung', 'Kab. Tana Tidung'),
(513, '6106', 'Tana Toraja', 'Kab. Tana Toraja'),
(514, '5110', 'Tanah Bumbu', 'Kab.Tanah Bumbu'),
(515, '3407', 'Tanah Datar', 'Kab. Tanah Datar'),
(516, '5102', 'Tanah Laut', 'Kab. Tanah Laut'),
(517, '0294', 'Tangerang Selatan', 'Kota Tangerang Selatan'),
(518, '3906', 'Tanggamus', 'Kab. Tanggamus'),
(519, '3394', 'Tanjung Balai', 'Kota Tanjung Balai'),
(520, '3107', 'Tanjung Jabung Barat', 'Kab. Tanjung Jabung Barat'),
(521, '3108', 'Tanjung Jabung Timur', 'Kab. Tanjung Jabung Timur'),
(522, '3891', 'Tanjung Pinang', 'Kota Tanjung Pinang'),
(523, '3310', 'Tapanuli Selatan', 'Kab. Tapanuli Selatan'),
(524, '3309', 'Tapanuli Tengah', 'Kab. Tapanuli Tengah'),
(525, '3308', 'Tapanuli Utara', 'Kab. Tapanuli Utara'),
(526, '5103', 'Tapin', 'Kab. Tapin'),
(527, '5493', 'Tarakan', 'Kota Tarakan'),
(528, '3391', 'Tebing Tinggi', 'Kota Tebing Tinggi'),
(529, '3109', 'Tebo', 'Kab. Tebo'),
(530, '8407', 'Teluk Bintuni', 'Kab. Teluk Bintuni'),
(531, '8408', 'Teluk Wondama', 'Kab. Teluk Wondama'),
(532, '0919', 'Temanggung', 'Kab. Temanggung'),
(533, '8409', 'Tembrauw', 'Kab. Tembrauw'),
(534, '8390', 'Ternate', 'Kota Ternate'),
(535, '8391', 'Tidore Kepulauan', 'Kota Tidore Kepulauan'),
(536, '7402', 'Timor-Tengah Selatan', 'Kab. Timor-Tengah Selatan'),
(537, '7403', 'Timor-Tengah Utara', 'Kab. Timor-Tengah Utara'),
(538, '3313', 'Toba Samosir', 'Kab. Toba Samosir'),
(539, '6008', 'Tojo Una-Una', 'Kab. Tojo Una-Una'),
(540, '8223', 'Tolikara', 'Kab. Tolikara'),
(541, '6004', 'Toli-Toli', 'Kab. Toli-Toli'),
(542, '6294', 'Tomohon', 'Kota. Tomohon'),
(543, '6125', 'Toraja Utara', 'Kab. Toraja Utara'),
(544, '1220', 'Trenggalek', 'Kab. Trenggalek'),
(545, '8192', 'Tual', 'Kota Tual'),
(546, '1228', 'Tuban', 'Kab. Tuban'),
(547, '3905', 'Tulang Bawang', 'Kab. Tulang Bawang'),
(548, '3911', 'Tulang Bawang Barat', 'Kab. Tulang Bawang Barat'),
(549, '1219', 'Tulungagung', 'Kab. Tulungagung'),
(550, '6103', 'Wajo', 'Kab. Wajo'),
(551, '6905', 'Wakatobi', 'Kab. Wakatobi'),
(552, '8224', 'Waropen', 'Kab. Waropen'),
(553, '6119', 'Watansoppeng', 'Kab. Soppeng (d/h Kab. Watansoppeng)'),
(554, '3908', 'Way Kanan', 'Kab. Way Kanan'),
(555, '0928', 'Wonogiri', 'Kab. Wonogiri'),
(556, '0920', 'Wonosobo', 'Kab. Wonosobo'),
(557, '8222', 'Yahukimo', 'Kab. Yahukimo'),
(558, '8237', 'Yalimo', 'Kab. Yalimo'),
(559, '0591', 'Yogyakarta', 'Kota Yogyakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tltdbb_bi_country`
--

CREATE TABLE `tltdbb_bi_country` (
  `id` int(12) NOT NULL,
  `bi_code` varchar(10) NOT NULL,
  `country` varchar(100) NOT NULL,
  `bi_country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tltdbb_bi_country`
--

INSERT INTO `tltdbb_bi_country` (`id`, `bi_code`, `country`, `bi_country`) VALUES
(1, 'HK', 'Hongkong', ''),
(2, 'JP', 'Japan', ''),
(3, 'KP', 'Korea, Democratic People\'s Republic', ''),
(4, 'TW', 'Taiwan Province Of China', ''),
(5, 'SG', 'Singapore', ''),
(6, 'US', 'United States Of America', ''),
(7, 'MY', 'Malaysia', ''),
(8, 'BG', 'Belgium', ''),
(9, 'AE', 'United Arab Emirat', ''),
(10, 'PH', 'Philippines', ''),
(11, 'indonesia', 'INDONESIA', ''),
(12, '86', 'INDONESIA', '');

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

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t0source_danafloat`
--
ALTER TABLE `t0source_danafloat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_datetime` (`trx_datetime`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `t0source_ltdbb`
--
ALTER TABLE `t0source_ltdbb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `t0source_ltkl`
--
ALTER TABLE `t0source_ltkl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `t0source_sipesat`
--
ALTER TABLE `t0source_sipesat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `t1clean_danafloat`
--
ALTER TABLE `t1clean_danafloat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_datetime` (`trx_datetime`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`),
  ADD KEY `id_source` (`id_source`);

--
-- Indeks untuk tabel `t1clean_lkpbu_309_310_311`
--
ALTER TABLE `t1clean_lkpbu_309_310_311`
  ADD PRIMARY KEY (`id`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `t1clean_lkpbu_312`
--
ALTER TABLE `t1clean_lkpbu_312`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `t1clean_lkpbu_313`
--
ALTER TABLE `t1clean_lkpbu_313`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `t1clean_ltdbb`
--
ALTER TABLE `t1clean_ltdbb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_source` (`id_source`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `t1clean_ltkl`
--
ALTER TABLE `t1clean_ltkl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`),
  ADD KEY `id_source` (`id_source`);

--
-- Indeks untuk tabel `t1clean_sipesat`
--
ALTER TABLE `t1clean_sipesat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`),
  ADD KEY `id_source` (`id_source`);

--
-- Indeks untuk tabel `t1clean_syscrash`
--
ALTER TABLE `t1clean_syscrash`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t2archive_danafloat`
--
ALTER TABLE `t2archive_danafloat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_datetime` (`trx_datetime`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`),
  ADD KEY `id_clean` (`id_clean`);

--
-- Indeks untuk tabel `t2archive_lkpbu_309_310_311`
--
ALTER TABLE `t2archive_lkpbu_309_310_311`
  ADD PRIMARY KEY (`id`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`),
  ADD KEY `id_clean` (`id_clean`);

--
-- Indeks untuk tabel `t2archive_lkpbu_312`
--
ALTER TABLE `t2archive_lkpbu_312`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `t2archive_lkpbu_313`
--
ALTER TABLE `t2archive_lkpbu_313`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `t2archive_ltdbb`
--
ALTER TABLE `t2archive_ltdbb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_clean` (`id_clean`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `t2archive_ltkl`
--
ALTER TABLE `t2archive_ltkl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `t2archive_sipesat`
--
ALTER TABLE `t2archive_sipesat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx_date` (`trx_date`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `status` (`status`),
  ADD KEY `id_clean` (`id_clean`);

--
-- Indeks untuk tabel `t3calendar`
--
ALTER TABLE `t3calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t3report_period`
--
ALTER TABLE `t3report_period`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t3report_settings`
--
ALTER TABLE `t3report_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t3role_model`
--
ALTER TABLE `t3role_model`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t4log_sys`
--
ALTER TABLE `t4log_sys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t4log_trx`
--
ALTER TABLE `t4log_trx`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t4log_user`
--
ALTER TABLE `t4log_user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t4user`
--
ALTER TABLE `t4user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_groups` (`user_group`);

--
-- Indeks untuk tabel `t4user_group`
--
ALTER TABLE `t4user_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_name` (`group_name`);

--
-- Indeks untuk tabel `tlkpbu_312_publication_type`
--
ALTER TABLE `tlkpbu_312_publication_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tlkpbu_313_publication_type`
--
ALTER TABLE `tlkpbu_313_publication_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltdbb_alto_city`
--
ALTER TABLE `tltdbb_alto_city`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltdbb_bi_city`
--
ALTER TABLE `tltdbb_bi_city`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tltdbb_bi_country`
--
ALTER TABLE `tltdbb_bi_country`
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
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t0source_danafloat`
--
ALTER TABLE `t0source_danafloat`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `t0source_ltdbb`
--
ALTER TABLE `t0source_ltdbb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `t0source_ltkl`
--
ALTER TABLE `t0source_ltkl`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `t0source_sipesat`
--
ALTER TABLE `t0source_sipesat`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `t1clean_danafloat`
--
ALTER TABLE `t1clean_danafloat`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT untuk tabel `t1clean_lkpbu_309_310_311`
--
ALTER TABLE `t1clean_lkpbu_309_310_311`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT untuk tabel `t1clean_lkpbu_312`
--
ALTER TABLE `t1clean_lkpbu_312`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t1clean_lkpbu_313`
--
ALTER TABLE `t1clean_lkpbu_313`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t1clean_ltdbb`
--
ALTER TABLE `t1clean_ltdbb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `t1clean_ltkl`
--
ALTER TABLE `t1clean_ltkl`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t1clean_sipesat`
--
ALTER TABLE `t1clean_sipesat`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT untuk tabel `t1clean_syscrash`
--
ALTER TABLE `t1clean_syscrash`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t2archive_danafloat`
--
ALTER TABLE `t2archive_danafloat`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t2archive_lkpbu_309_310_311`
--
ALTER TABLE `t2archive_lkpbu_309_310_311`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t2archive_lkpbu_312`
--
ALTER TABLE `t2archive_lkpbu_312`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t2archive_lkpbu_313`
--
ALTER TABLE `t2archive_lkpbu_313`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t2archive_ltdbb`
--
ALTER TABLE `t2archive_ltdbb`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t2archive_ltkl`
--
ALTER TABLE `t2archive_ltkl`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t2archive_sipesat`
--
ALTER TABLE `t2archive_sipesat`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t3calendar`
--
ALTER TABLE `t3calendar`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `t3report_period`
--
ALTER TABLE `t3report_period`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `t3report_settings`
--
ALTER TABLE `t3report_settings`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `t3role_model`
--
ALTER TABLE `t3role_model`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `t4log_sys`
--
ALTER TABLE `t4log_sys`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t4log_trx`
--
ALTER TABLE `t4log_trx`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t4log_user`
--
ALTER TABLE `t4log_user`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `t4user_group`
--
ALTER TABLE `t4user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tlkpbu_312_publication_type`
--
ALTER TABLE `tlkpbu_312_publication_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tlkpbu_313_publication_type`
--
ALTER TABLE `tlkpbu_313_publication_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tltdbb_alto_city`
--
ALTER TABLE `tltdbb_alto_city`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=527;

--
-- AUTO_INCREMENT untuk tabel `tltdbb_bi_city`
--
ALTER TABLE `tltdbb_bi_city`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=560;

--
-- AUTO_INCREMENT untuk tabel `tltdbb_bi_country`
--
ALTER TABLE `tltdbb_bi_country`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
