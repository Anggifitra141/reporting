-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2019 at 05:23 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_payable`
--

CREATE TABLE `account_payable` (
  `id_account_payable` int(11) NOT NULL,
  `po_number` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ammount` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `activation_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_payable`
--

INSERT INTO `account_payable` (`id_account_payable`, `po_number`, `date`, `ammount`, `status`, `activation_date`) VALUES
(2, '2020', '2019-09-24', 200000, 'CANCEL', '2019-09-24 04:04:42');

-- --------------------------------------------------------

--
-- Table structure for table `account_received`
--

CREATE TABLE `account_received` (
  `id_account_received` int(11) NOT NULL,
  `po_number` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ammount` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `activation_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_received`
--

INSERT INTO `account_received` (`id_account_received`, `po_number`, `date`, `ammount`, `status`, `activation_date`) VALUES
(1, '2020', '2019-10-03', 10, 'SUCCESS', '2019-10-03 09:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `consignee`
--

CREATE TABLE `consignee` (
  `id_consignee` int(10) NOT NULL,
  `nama_consignee` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `activation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consignee`
--

INSERT INTO `consignee` (`id_consignee`, `nama_consignee`, `description`, `activation_date`) VALUES
(1, 'PENFIBER, PENANG', '', '0000-00-00'),
(2, 'BIOVISTA LIFESCIENCES SDN BHD', '', '0000-00-00'),
(3, 'APPLY CARD TECHNOLOGY LIMITED (ACT)', '', '0000-00-00'),
(4, 'SHENZHEN CHENGTIAN WEIYE TECHNOLOGY CO.LTD', '', '0000-00-00'),
(5, 'SMART CARD IT SOLUTIONS LTD', '', '0000-00-00'),
(6, 'PT CIPTA SRIGATI LESTARI', '', '0000-00-00'),
(7, 'PT SUPER BTECH', '', '0000-00-00'),
(8, 'PT DIAN SANTOSA LOG', '', '0000-00-00'),
(9, 'PT NABEL SAKHA GEMILANG', '', '0000-00-00'),
(10, 'WM LOGISTICS', '', '0000-00-00'),
(11, 'OASIS SINGAPORE', '', '0000-00-00'),
(12, 'PT NABEL SAKHA GEMILANG', '', '0000-00-00'),
(13, 'KARNAPHULI SHOES INDUSTRIES LTD', '', '0000-00-00'),
(14, 'JOHN DAVIDS PTE LTD', '', '0000-00-00'),
(15, 'INDONESIA INTERNATIONAL TRADING', '', '0000-00-00'),
(16, 'P4S JAYA ALAM LESTARI', '', '0000-00-00'),
(17, 'DSL', '', '0000-00-00'),
(18, 'POLYESTER, KANAZAWA', '', '0000-00-00'),
(19, 'NYLON, NAGOYA', '', '0000-00-00'),
(20, 'NYLON, KANAZAWA', '', '0000-00-00'),
(21, 'POLYESTER, KANAZAWA', '', '0000-00-00'),
(22, 'SHENZHEN NEXNOVO TECHNOLOGY CO, LTD', '', '0000-00-00'),
(23, 'COMBINE21', '', '0000-00-00'),
(24, 'ALLIANCE-ACL', '', '0000-00-00'),
(25, 'Toray Fibers (Nantong) Co., Ltd', '', '0000-00-00'),
(26, 'MARUBENI INTEX CO., LTD', '', '0000-00-00'),
(27, 'TORAY International', '', '0000-00-00'),
(28, 'CAPITAL TRICOT', '', '0000-00-00'),
(29, 'TORAY MONOFILAMENT CO LTD', '', '0000-00-00'),
(30, 'PT KENERTEC POWER SYSTEM', '', '0000-00-00'),
(31, 'TORAY INDUSTRIES (H.K) LTD', '', '0000-00-00'),
(32, 'SUMITOMO RUBBER NORTH AMERICA -ANZ CUSTOM SUPPORT ', '', '0000-00-00'),
(33, 'MARUBENI INTEX CO., LTD', '', '0000-00-00'),
(34, 'TORAY PLASTICS (CHINA) CO., LIMITED', '', '0000-00-00'),
(35, 'GOODYEAR & DUNLOP TYRES (UAST) PYT LTD', '', '0000-00-00'),
(36, 'TO ORDER BANK OF THE PHILIPPINE ISLANDS', '', '0000-00-00'),
(37, 'THAI SAKAE LACE CO., LTD', '', '0000-00-00'),
(38, 'DAINICHI COLOR INDIA PRIVATE LTD', '', '0000-00-00'),
(39, 'LACEL SU', '', '0000-00-00'),
(40, 'MARUBENI INTEX CO., LTD', '', '0000-00-00'),
(41, 'TORAY INTERNATIONAL INC', '', '0000-00-00'),
(42, 'Global Project Kuwait', '', '0000-00-00'),
(43, 'OASIS SINGAPORE', '', '0000-00-00'),
(44, 'SUPERBTEX', '', '0000-00-00'),
(45, 'NITTOKU', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `nama_customer` varchar(50) NOT NULL,
  `alamat1` varchar(50) NOT NULL,
  `alamat2` varchar(50) NOT NULL,
  `alamat3` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `negara` varchar(50) NOT NULL,
  `kode_pos` varchar(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `fax_no` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `bank_name1` varchar(50) NOT NULL,
  `bank_account1` varchar(50) NOT NULL,
  `bank_name2` varchar(50) NOT NULL,
  `bank_account2` varchar(50) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `credit_terms` varchar(50) NOT NULL,
  `saldo_awal` varchar(50) NOT NULL,
  `ar` varchar(50) NOT NULL,
  `ap` varchar(50) NOT NULL,
  `debet` varchar(50) NOT NULL,
  `kredit` varchar(50) NOT NULL,
  `koreksi` varchar(50) NOT NULL,
  `saldo_akhir` varchar(50) NOT NULL,
  `activation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `code`, `nama_customer`, `alamat1`, `alamat2`, `alamat3`, `kota`, `negara`, `kode_pos`, `phone_no`, `fax_no`, `email`, `bank_name1`, `bank_account1`, `bank_name2`, `bank_account2`, `contact_name`, `credit_terms`, `saldo_awal`, `ar`, `ap`, `debet`, `kredit`, `koreksi`, `saldo_akhir`, `activation_date`) VALUES
(1, 'SMF01', 'SMURFIT KAPPA NERVION\r\n', 'B ARRIANDI S/N \r\n', '', '', 'BIZKAIA BILBAO\r\n', 'ESPANA\r\n', '48215\r\n', '34946205123\r\n', '34946205119\r\n', 'INFONERVION@SMURFITKAPPA.ES\r\n', 'THE BANK OF NEW YORK MELLON\r\n', '', 'THE BANK OF NEW YORK MELLON\r\n', '', 'IGNACIO MR.\r\n', '15\r\n', '', '', '', '', '', '', '', '0000-00-00'),
(2, 'NAB01', 'NABEL SAKHA GEMILANG\r\n', 'Jl. Boulevard Raya\r\n', 'Graha Saphire Blok M5 No. 9C\r\n', 'Gading Serpong, Tangerang\r\n', '', 'INDONESIA\r\n', '15810\r\n', '62-21 – 54210098\r\n', '62-21 – 54210099\r\n', 'import@nabelsakha.com\r\n', '', '', '', '', 'RATNA\r\n', '30\r\n', '', '', '', '', '', '', '', '0000-00-00'),
(3, 'ITS01', 'INDONESIA TORAY SYNTHETICS', '3RD FLOOR, SUMMITMAS II, 61-62\r\n', 'JL. JENDERAL SUDIRMAN\r\n', 'JAKARTA 12190 INDONESIA\r\n', 'DKI JAKARTA\r\n', 'INDONESIA\r\n', '12190\r\n', '62-21-5501256\r\n', '', 'sherley_megahwati@ina.toray.co.id\r\n', '', '', '', '', '', '30\r\n', '', '', '', '', '', '', '', '0000-00-00'),
(4, 'ANI01', 'AERO NUSANTARA INDONESIA\r\n', 'Gedung Chase Palza Lt.5\r\n', 'Jl. Jend. Sudirman Kav.21\r\n', 'Jakarta Selatan - 12920 , Indonesia\r\n', 'DKI JAKARTA\r\n', 'INDONESIA\r\n', '12920\r\n', '62 21 5462204-08\r\n', '', 'irwan_exim@ani.co.id\r\n', '', '', '', '', '', '45\r\n', '', '', '', '', '', '', '', '0000-00-00'),
(5, 'EBR01', 'EBARA INDONESIA\r\n', 'JL. RAYA JAKARTA BOGOR KM 32 RT.001 RW.004\r\n', 'CURUG CIMANGGIS JAWA BARAT\r\n', '', 'DEPOK\r\n', 'INDONESIA\r\n', '16953\r\n', '021-8740852\r\n', '', 'Ibu Putri/Ibu Orie\r\n', '', '', '', '', '', '30\r\n', '', '', '', '', '', '', '', '0000-00-00'),
(6, 'TII01', 'TORAY INTERNATIONAL INDONESIA\r\n', '3RD FLOOR, SUMMITMAS II, 61-62\r\n', 'JL. JENDERAL SUDIRMAN\r\n', 'JAKARTA 12190-INDONESIA\r\n', 'DKI JAKARTA\r\n', 'INDONESIA\r\n', '12190\r\n', '62 21- 5201216\r\n', '62 21- 5201222\r\n', 'hiswanto_felimandana@ina.toray.co.id\r\n', '', '', '', '', '', '30\r\n', '', '', '', '', '', '', '', '0000-00-00'),
(7, 'AGR01', 'AGRICON\r\n', 'AGRICON BUILDING\r\n', 'JL. SILIWANGI NO.178\r\n', 'BOGOR 16134, INDONESIA\r\n', 'BOGOR\r\n', 'INDONESIA\r\n', '16134\r\n', '62 251 8313070\r\n', '62 251 8313972\r\n', 'suswianto@agricon.com\r\n', '', '', '', '', '', '30\r\n', '', '', '', '', '', '', '', '0000-00-00'),
(8, 'TNS01', 'TONDIRAYA SANTOSA\r\n', 'JL. RAYA NAROGONG KM.12,5\r\n', 'CIKIWUL, BANTAR GEBANG\r\n', 'BEKASI, INDONESIA\r\n', 'BEKASI\r\n', 'INDONESIA\r\n', '', '62 21-29451308\r\n', '', 'arman@tondira.com\r\n', '', '', '', '', '', '30\r\n', '', '', '', '', '', '', '', '0000-00-00'),
(9, 'SBX01', 'SUPERBTEX BDG\r\n', 'Jl. Raya Banjaran KM. 15,3\r\n', 'Lebakwangi, Arjasari\r\n', 'Kab. Bandung, Jawa Barat 40376\r\n', 'BANDUNG\r\n', 'INDONESIA\r\n', '40376\r\n', '', '', 'superbtex@gmail.com\r\n', '', '', '', '', '', '30\r\n', '', '', '', '', '', '', '', '0000-00-00'),
(10, 'UDM01', 'ULTRA DELTA MAJU\r\n', 'KEDOYA ELOK PLAZA BLOK DD NO. 59-60\r\n', 'JL PANJANG KEBON JERUK 11520\r\n', '', 'DKI JAKARTA\r\n', 'INDONESIA\r\n', '11520\r\n', '021-5830 0678 \r\n', '021-5830 0686\r\n', 'purchasing_exp@udm.co.id\r\n', '', '', '', '', '', '30', '', '', '', '', '', '', '', '0000-00-00'),
(11, 'INS01', 'INDONESIA NIPPON SEIKI\r\n', 'Kawasan Industri Modern Cikande\r\n', 'Jl. Utama Modern Industrial Blok E\r\n', 'Cikande\r\n', 'Banten\r\n', 'INDONESIA\r\n', '', '0254-402166\r\n', '', 'Bu Lusiana\r\n', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00'),
(12, 'YKK01', 'YKK AP INDONESIA\r\n', 'Kawasan Industri Manis\r\n', 'Jl. Manis Raya No. 23 \r\n', 'Tangerang\r\n', 'Banten\r\n', 'INDONESIA\r\n', '', '021-5919073\r\n', '', 'Pak Sandi\r\n', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00'),
(13, 'ARS01', 'ARAI RUBBER SEAL\r\n', 'Kawasan Industri Manis\r\n', 'Jl Manis II/2 \r\n', 'Zona Industri Manis\r\n', 'Banten\r\n', 'INDONESIA\r\n', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `destination`
--

CREATE TABLE `destination` (
  `id_destination` int(11) NOT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `export`
--

CREATE TABLE `export` (
  `id_export` int(11) NOT NULL,
  `po_number` varchar(50) DEFAULT NULL,
  `peb_no` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `ammount` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `activation_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finish_goods`
--

CREATE TABLE `finish_goods` (
  `id_finish_goods` int(11) NOT NULL,
  `po_number` varchar(50) DEFAULT NULL,
  `btb_no` varchar(50) NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `activation_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `finish_goods`
--

INSERT INTO `finish_goods` (`id_finish_goods`, `po_number`, `btb_no`, `date`, `status`, `activation_date`) VALUES
(1, '2020', 'JK2020', '2019-10-03', 'SUCCESS', '2019-10-03 09:31:51');

-- --------------------------------------------------------

--
-- Table structure for table `import`
--

CREATE TABLE `import` (
  `id_import` int(11) NOT NULL,
  `po_number` varchar(50) DEFAULT NULL,
  `pib_no` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `ammount` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `activation_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `import`
--

INSERT INTO `import` (`id_import`, `po_number`, `pib_no`, `date`, `qty`, `ammount`, `status`, `activation_date`) VALUES
(1, '2020', 'KL9090', '2019-09-24', 20, 90000, 'SUCCESS', '2019-09-24 10:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `production`
--

CREATE TABLE `production` (
  `id_production` int(11) NOT NULL,
  `po_number` varchar(50) DEFAULT NULL,
  `bprb_no` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `activation_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `production`
--

INSERT INTO `production` (`id_production`, `po_number`, `bprb_no`, `date`, `qty`, `status`, `activation_date`) VALUES
(1, '200', 'JG9090', '2019-09-24', 200, 'SUCCESS', '2019-09-24 10:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id_purchase` int(11) NOT NULL,
  `raw_material` varchar(50) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `vendor` varchar(50) DEFAULT NULL,
  `po_number` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `ammount` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `activation_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `raw_material`
--

CREATE TABLE `raw_material` (
  `id_raw_material` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `desc` varchar(50) DEFAULT NULL,
  `activation_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `raw_material`
--

INSERT INTO `raw_material` (`id_raw_material`, `code`, `desc`, `activation_date`) VALUES
(1, 'TST', 'TES SET TES', '2019-10-03 09:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `level` enum('admin','finance','user') NOT NULL,
  `status` enum('ACTIVE','NO_ACTIVE') NOT NULL,
  `activation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `fullname`, `level`, `status`, `activation_date`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin', 'ACTIVE', '2018-09-13 17:00:00'),
(2, 'finance', '57336afd1f4b40dfd9f5731e35302fe5', 'Finance', 'finance', 'ACTIVE', '2018-09-14 17:00:00'),
(3, 'sdg', 'f970e2767d0cfe75876ea857f92e319b', 'sdg', 'admin', 'ACTIVE', '2019-08-18 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id_vendor` int(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `nama_vendor` varchar(50) NOT NULL,
  `alamat1` varchar(50) NOT NULL,
  `alamat2` varchar(50) NOT NULL,
  `alamat3` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `negara` varchar(50) NOT NULL,
  `kode_pos` varchar(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `fax_no` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `bank_name1` varchar(50) NOT NULL,
  `bank_account1` varchar(50) NOT NULL,
  `bank_name2` varchar(50) NOT NULL,
  `bank_account2` varchar(50) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `credit_terms` varchar(50) NOT NULL,
  `saldo_awal` varchar(50) NOT NULL,
  `ar` varchar(50) NOT NULL,
  `ap` varchar(50) NOT NULL,
  `debet` varchar(50) NOT NULL,
  `kredit` varchar(50) NOT NULL,
  `koreksi` varchar(50) NOT NULL,
  `saldo_akhir` varchar(50) NOT NULL,
  `activation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id_vendor`, `code`, `nama_vendor`, `alamat1`, `alamat2`, `alamat3`, `kota`, `negara`, `kode_pos`, `phone_no`, `fax_no`, `email`, `bank_name1`, `bank_account1`, `bank_name2`, `bank_account2`, `contact_name`, `credit_terms`, `saldo_awal`, `ar`, `ap`, `debet`, `kredit`, `koreksi`, `saldo_akhir`, `activation_date`) VALUES
(1, 'SHI01', 'SHIPCO TRANSPORT INDONESIA\r\n', 'GEDUNG OLEOS 1 LT.6 SUITE 611', 'JL. MAMPANG PRAPATAN RAYA NO.139A', 'KALIBATA, PANCORAN, JAKARTA SELATAN\r\n', 'DKI JAKARTA\r\n', 'INDONESIA', '12740\r\n', '62-21 7918 3060\r\n', '62-21 7918 3080\r\n', 'rtrisusanto@shipco.com\r\n', 'HSBC (HONGKONG & SHANGHAI BANK CORPORATION)\r\n', '001-273994-001\r\n', '', '', 'RICKY/HENDRO MR\r\n', '30\r\n', '', '', '', '', '', '', '', '0000-00-00'),
(2, 'SNI01\r\n', 'SARANA INSTRUMENTS\r\n', 'Graha Semesta 3rd floor\r\n', 'Jl Raya Kebayoran Lama Pal VII No.31\r\n', 'Jakarta 12210, Indonesia\r\n', 'DKI JAKARTA\r\n', 'INDONESIA', '12210\r\n', '6221-5347855\r\n', '', 'avisena@saranainstrument.com\r\n', '', '', '', '', 'AVISENA\r\n', '15', '', '', '', '', '', '', '', '0000-00-00'),
(3, 'SSL01\r\n', 'SAMUDERA SHIPPING PT\r\n', 'Tanjung Priok Branch Office\r\n', 'Perkantoran Yos Sudarso Megah \r\n', 'Jl. Yos Sudarso No. 1, Blok A1-7\r\n', 'Jakarta Utara\r\n', 'INDONESIA', '14320\r\n', '021-4301150\r\n', '', 'LENI@SAMUDERA.COM\r\n', '', '', '', '', 'LENI\r\n', '', '', '', '', '', '', '', '', '0000-00-00'),
(4, 'SMI01\r\n', 'PT. Samudera Agencies Indonesia \r\n', 'Lippo Kuningan Building,21st Floor\r\n', 'Jl. H.R.Rasuna Said Kav. B-12\r\n', 'Jakarta Selatan\r\n', 'Jakarta \r\n', 'INDONESIA', '12920\r\n', '62-21-29110909 \r\n', '', 'niko@ekmtc.com\r\n', '', '', '', '', 'NIKO PRATAMA\r\n', '', '', '', '', '', '', '', '', '0000-00-00'),
(5, 'CTP01', 'PT. PELAYARAN CARAKA TIRTA PERKASA\r\n', 'JL. Tomang Raya NO.57\r\n', '', 'Jakarta Barat \r\n', 'Jakarta \r\n', 'INDONESIA', '11440\r\n', '(021) 56940789 \r\n', '', 'alifi@ctpline.com\r\n', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00'),
(6, 'ECU01\r\n', 'ECU WORLDWIDE INDONESIA\r\n', 'Emerald Tower 6th Fl\r\n', 'Jl Boulevard Barat XB-3 \r\n', 'Kelapa Gading Barat\r\n', 'Jakarta Utara\r\n', 'INDONESIA', '14240\r\n', '021-24520191\r\n', '', 'Pak Andreas\r\n', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id_warehouse` int(11) NOT NULL,
  `po_number` varchar(50) DEFAULT NULL,
  `btb_no` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `activation_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id_warehouse`, `po_number`, `btb_no`, `date`, `qty`, `status`, `activation_date`) VALUES
(1, '2020', 'JK1011', '2019-09-24', 20, 'SUCCESS', '2019-09-24 10:28:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_payable`
--
ALTER TABLE `account_payable`
  ADD PRIMARY KEY (`id_account_payable`),
  ADD KEY `po_number` (`po_number`);

--
-- Indexes for table `account_received`
--
ALTER TABLE `account_received`
  ADD PRIMARY KEY (`id_account_received`),
  ADD KEY `po_number` (`po_number`);

--
-- Indexes for table `consignee`
--
ALTER TABLE `consignee`
  ADD PRIMARY KEY (`id_consignee`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`id_destination`);

--
-- Indexes for table `export`
--
ALTER TABLE `export`
  ADD PRIMARY KEY (`id_export`),
  ADD KEY `destination` (`destination`),
  ADD KEY `po_number` (`po_number`);

--
-- Indexes for table `finish_goods`
--
ALTER TABLE `finish_goods`
  ADD PRIMARY KEY (`id_finish_goods`),
  ADD KEY `po_number` (`po_number`);

--
-- Indexes for table `import`
--
ALTER TABLE `import`
  ADD PRIMARY KEY (`id_import`),
  ADD KEY `po_number` (`po_number`);

--
-- Indexes for table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`id_production`),
  ADD KEY `po_number` (`po_number`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id_purchase`),
  ADD KEY `vendor` (`vendor`),
  ADD KEY `po_number` (`po_number`);

--
-- Indexes for table `raw_material`
--
ALTER TABLE `raw_material`
  ADD PRIMARY KEY (`id_raw_material`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id_vendor`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id_warehouse`),
  ADD KEY `po_number` (`po_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_payable`
--
ALTER TABLE `account_payable`
  MODIFY `id_account_payable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_received`
--
ALTER TABLE `account_received`
  MODIFY `id_account_received` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `consignee`
--
ALTER TABLE `consignee`
  MODIFY `id_consignee` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `destination`
--
ALTER TABLE `destination`
  MODIFY `id_destination` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `export`
--
ALTER TABLE `export`
  MODIFY `id_export` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finish_goods`
--
ALTER TABLE `finish_goods`
  MODIFY `id_finish_goods` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `import`
--
ALTER TABLE `import`
  MODIFY `id_import` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `production`
--
ALTER TABLE `production`
  MODIFY `id_production` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id_purchase` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raw_material`
--
ALTER TABLE `raw_material`
  MODIFY `id_raw_material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id_vendor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id_warehouse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
