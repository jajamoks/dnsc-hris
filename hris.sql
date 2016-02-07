-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2016 at 10:40 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hris`
--

-- --------------------------------------------------------

--
-- Table structure for table `hris_configs`
--

CREATE TABLE IF NOT EXISTS `hris_configs` (
`id` int(10) unsigned NOT NULL,
  `config` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_configs`
--

INSERT INTO `hris_configs` (`id`, `config`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_title', 'Davao del Norte State College Human Resource Information System', '2015-11-27 03:05:19', '2015-11-27 03:05:19'),
(2, 'site_description', 'An automated HRIS', '2015-11-27 03:05:19', '2015-11-27 03:05:19'),
(3, 'date_format', 'M d, Y', '2015-11-27 03:05:19', '2015-11-27 03:05:19'),
(4, 'time_format', 'h:i:s', '2015-11-27 03:05:19', '2015-11-27 03:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `hris_departments`
--

CREATE TABLE IF NOT EXISTS `hris_departments` (
`id` int(10) unsigned NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('department','institute') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_departments`
--

INSERT INTO `hris_departments` (`id`, `code`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'IIT', 'Institute of Information Technology', 'institute', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(2, 'EXEC', 'Executive Office', 'department', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(3, 'FINANCE', 'Finance Office', 'department', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(4, 'HR', 'Human Resource Management Office', 'department', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(5, 'BOT', 'Board of Trustees', 'department', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(6, 'IAS', 'Institute of Arts and Sciences', 'institute', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(7, 'IEd', 'Institute of Education', 'institute', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(8, 'IMAGOCS', 'Institute of Management, Governance and Continuing Studies', 'institute', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(9, 'IFT', 'Institute of Fisheries and Food Technology', 'institute', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(10, 'OSS', 'Office of Student Services', 'department', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(11, 'ADMIN', 'Administration', 'department', '2015-11-27 12:47:11', '2015-11-27 12:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `hris_department_heads`
--

CREATE TABLE IF NOT EXISTS `hris_department_heads` (
`id` int(10) unsigned NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_department_heads`
--

INSERT INTO `hris_department_heads` (`id`, `department_id`, `employee_id`, `date_from`, `date_to`, `created_at`, `updated_at`) VALUES
(1, 1, 67, '0000-00-00', NULL, '2016-01-09 05:06:00', '2016-01-09 05:06:00'),
(2, 8, 20, '0000-00-00', NULL, '2016-01-09 05:13:14', '2016-01-09 05:13:14'),
(3, 9, 6, '0000-00-00', NULL, '2016-01-09 05:14:49', '2016-01-09 05:14:49'),
(4, 7, 7, '0000-00-00', NULL, '2016-01-09 05:15:50', '2016-01-09 05:15:50'),
(5, 6, 9, '0000-00-00', NULL, '2016-01-09 05:16:05', '2016-01-09 05:16:05');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employees`
--

CREATE TABLE IF NOT EXISTS `hris_employees` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `cs_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name_extension` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date NOT NULL,
  `birthplace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` enum('male','female') COLLATE utf8_unicode_ci NOT NULL,
  `civil_status` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `citizenship` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `height` double(4,2) DEFAULT NULL,
  `weight` double(4,2) DEFAULT NULL,
  `blood_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gsis_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pagibig_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `philhealth` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sss_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cellphone_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agency_employee_number` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tin` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `community_tax_cert_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `community_tax_issued_at` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `community_tax_issued_on` date DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employees`
--

INSERT INTO `hris_employees` (`id`, `user_id`, `cs_id`, `first_name`, `middle_name`, `surname`, `name_extension`, `birthday`, `birthplace`, `sex`, `civil_status`, `citizenship`, `height`, `weight`, `blood_type`, `gsis_id`, `pagibig_id`, `philhealth`, `sss_id`, `cellphone_number`, `agency_employee_number`, `tin`, `community_tax_cert_no`, `community_tax_issued_at`, `community_tax_issued_on`, `photo`, `file`, `created_at`, `updated_at`) VALUES
(2, 211, NULL, 'Maria Bonjeavem', 'Geollegue', 'Labor', '', '1991-11-08', 'Lupon Davao Oriental', 'male', 'single', 'Filipino', 1.55, 65.00, 'o', '', '', '', '', '09177120837', '', '', NULL, NULL, NULL, '', NULL, '2016-01-04 18:40:47', '2016-01-04 18:40:50'),
(4, 5, NULL, 'Paulina', 'Tapangan', 'Baba', '', '1967-06-22', 'Algeria, Alabel, Sarangani Province', 'female', 'married', 'Filipino', 1.46, 68.00, 'O+', '', '', '', '', '09187679499', '005', '141-137-222', NULL, NULL, NULL, '', 'PaulinaTapanganBaba.xlsx', '2016-01-04 19:02:42', '2016-01-05 03:28:28'),
(5, 161, NULL, 'Marianne', 'Alimboyng', 'Rebortera', '', '1977-10-27', 'Panabo Davao Del Norte', 'female', 'married', 'Filipino', 0.00, 60.00, 'O', '', '', '16-050068405-1', '01-2002913-2', '', '161', '913-813-820', NULL, NULL, NULL, '', NULL, '2016-01-04 19:27:55', '2016-01-04 19:27:57'),
(6, 50, NULL, 'Rosario', 'Bantillo', 'Saligan', '', '1956-10-20', 'General Santos', 'female', 'married', 'Filipino', 4.00, 45.00, 'B', '', '1900-0004-7484', '16-000016482-1', '', '00920765180', '050', '141-137-738', NULL, NULL, NULL, '', NULL, '2016-01-04 19:47:13', '2016-01-04 19:47:13'),
(7, 78, NULL, 'Ruby', 'Vergara', 'Gonzales', '', '1955-05-27', 'Carmen, Cotabato', 'female', 'married', 'Filipino', 1.26, 67.00, 'B+', '', '', '', '', '', '078', '141-137-499', NULL, NULL, NULL, '', NULL, '2016-01-04 21:57:48', '2016-01-04 21:58:16'),
(9, 63, NULL, 'Julieta', 'Salarda', 'Abarquez', '', '1956-07-09', 'Victorias, Negros Oriental', 'male', 'single', 'Filipino', 1.50, 52.00, 'O', '', '1101-2102-4803', '16-000016118-4', '', '09213886535', '063', '141-147-206', NULL, NULL, NULL, '', NULL, '2016-01-04 22:05:08', '2016-01-04 22:05:28'),
(10, 111, NULL, 'Hazel', 'Alcoba', 'Gameng', '', '1975-11-01', 'Buhangin, Davao City', 'female', 'married', 'Filipino', 1.57, 74.00, 'B+', '', '', '', '', '09156962157', '111', '183-592-341', NULL, NULL, NULL, '', NULL, '2016-01-04 22:19:11', '2016-01-04 22:19:31'),
(11, 86, NULL, 'Souci Hannah', 'Saracing', 'Bedoya', '', '1977-02-11', 'Lianga, Surigao del Sur', 'female', 'married', 'Filipino', 1.50, 50.00, 'B+', 'B77DBSSB015', '1900-0004-7516', '16-000016855-3', '', '09195504803', '086', '906-006-608', NULL, NULL, NULL, NULL, NULL, '2016-01-05 19:43:54', '2016-01-05 19:43:57'),
(12, 87, NULL, 'Rogelio', 'Aguilar', 'Masangkay', '', '1969-08-24', 'Paranque, Rizal', 'male', 'married', 'Filipino', 5.00, 65.00, 'B+', '69081401080', '11011086741', '16000016823', '', '09209016224', '087', '102349415', NULL, NULL, NULL, NULL, NULL, '2016-01-05 19:58:31', '2016-01-05 19:59:45'),
(13, 125, NULL, 'Ian Val', 'Planos', 'Delos Reyes', '', '1976-10-11', 'Panabo Davao Del Norte', 'male', 'married', 'Filipino', 1.60, 70.00, 'A', '76101100649', '', '160251268867', '', '09214542129', '125', '919124275', NULL, NULL, NULL, NULL, NULL, '2016-01-05 20:14:24', '2016-01-05 20:14:26'),
(14, 165, NULL, 'Ariel', 'Octa', 'Gamao', '', '1974-12-23', 'Tagbilaran City, Bohol', 'male', 'married', 'Filipino', 0.00, 62.00, 'A+', '956-1009896-01-0', '1900-0006-4424', '', '33-1742066-8', '09328554730', '', '922-958-470', NULL, NULL, NULL, NULL, NULL, '2016-01-05 20:52:55', '2016-01-05 20:52:57'),
(15, 91, NULL, 'Evelyn', 'Jakosalem', 'Lumaday', '', '1964-01-25', 'Sulop, Davao del Sur', 'female', 'married', 'Filipino ', 4.00, 55.00, 'B+', '640122502239', '1900-0004-72-84', '16-000016609-0', 'N/A', '09063236451', '091', '141-137-551', NULL, NULL, NULL, NULL, NULL, '2016-01-05 21:41:36', '2016-01-05 21:41:38'),
(16, 237, NULL, 'Letecia', 'Lozada', 'Cubillo', '', '1978-07-22', 'Tagum City', 'female', 'single', 'Filipino', 0.00, 55.00, 'O+', '', '1900-0027-3532', '16-050158515-4', '09-2336814-6', '09062267741', '237', '286008590', NULL, NULL, NULL, NULL, NULL, '2016-01-05 21:56:17', '2016-01-05 21:56:19'),
(17, 57, NULL, 'Nancy', 'Ramos', 'Raiz', '', '1968-01-14', 'Magastos, Asuncion, Davao Del Norte', 'female', 'married', 'Filipino', 1.16, 72.00, 'A', '', '1101-018598-05', '16-0000169215', '09-1231365-2', '09207337541', '057', '142-594-490', NULL, NULL, NULL, NULL, NULL, '2016-01-05 22:12:38', '2016-01-05 22:12:39'),
(18, 103, NULL, 'Jean', 'Dasalla', 'Centina', '', '1961-10-29', 'Davao CIty', 'female', 'married', 'Filipino', 1.50, 50.00, 'O', '61102900242', '1900-0004-6940', '16000016280-6', 'n/A', '', '0103', '141-137-342', NULL, NULL, NULL, NULL, NULL, '2016-01-05 22:38:49', '2016-01-05 22:38:53'),
(19, 105, NULL, 'Edison', 'Quilisadio', 'Bernaldez', '', '1970-10-15', 'Davao City, Davao Del Sur', 'male', 'married', 'Filipino', 5.60, 90.00, 'B', 'CM00004619420', '', '16-000016152-4', '', '09167830177', '105', '143-568-086', NULL, NULL, NULL, NULL, NULL, '2016-01-05 22:51:22', '2016-01-05 22:51:24'),
(20, 116, NULL, 'Marilou', 'Delfin', 'Junsay', '', '1974-08-09', 'Sudapin, Kidapawan, North Cotabato', 'female', 'married', 'Filipino', 1.56, 60.00, 'O+', 'B74R9-MND01-3', '1900-0004-6985', '16-000016235-0', '09-1869427-8', '09182322176', '116', '916-094-217', NULL, NULL, NULL, NULL, NULL, '2016-01-05 23:33:02', '2016-01-05 23:33:05'),
(21, 64, NULL, 'Girley', 'Santiago', 'Gumanao', '', '1967-10-06', 'Davao City', 'female', 'married', 'Filipino', 5.20, 69.00, 'A', '67100600169', '1101-018577-02', '', '', '09084908356', '064', '', NULL, NULL, NULL, NULL, NULL, '2016-01-05 23:51:58', '2016-01-05 23:52:00'),
(22, 201, NULL, 'Jonathan', 'A.', 'Bayogan', '', '0000-00-00', '', 'male', 'married', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:10:30', '2016-01-08 13:10:53'),
(23, 3, NULL, 'Elivira', 'A.', 'Dignos', '', '0000-00-00', '', 'female', 'married', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:26:46', '2016-01-08 13:27:09'),
(24, 7, NULL, 'Felicidad', 'L', 'Forro', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:29:33', '2016-01-08 13:30:35'),
(25, 8, NULL, 'Jonathan', 'Hebra', 'Floro', '', '1956-06-26', 'Libertad, Tapaz, Capiz', 'male', 'married', 'Filipino', 1.55, 50.00, '', 'CRN-006-0060-6771-1', '', '16-0000-1634-5', '', '09096431163', '008', '141-137-431', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:31:24', '2016-01-14 01:50:48'),
(26, 11, NULL, 'Gemma', 'Guiral', 'Cervantes', '', '1974-06-27', 'Lianga, Surigao del Sur', 'female', 'married', 'Filipino', 0.00, 67.00, 'O', '7406-2700528', '1900-0005', '16-00016467-1', '08-21251596-6', '09219537530', '011', '905-927-917', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:32:19', '2016-01-14 01:10:22'),
(27, 144, NULL, 'Levi', 'Navarro', 'Martinez', '', '1976-04-24', 'Binabagan, Negros Occ..', 'male', 'single', 'Filipino', 2.67, 60.00, 'O', '109577424963', '1900-0006-1195', '160000619865', '07173735512', '09302772203', '144', '91-040-789', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:33:13', '2016-01-15 02:17:45'),
(28, 9, NULL, 'Fe', 'Enumerables', 'Benigno', '', '1962-12-17', 'Babak, Davao del Norte', 'female', 'married', 'Filipino', 1.52, 55.00, 'O', 'CM-3334164', '1101-018551-09', '16-0000-16138-9', '0924047673', '09216684085', '009', '141-137-255', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:34:57', '2016-01-14 01:07:25'),
(29, 13, NULL, 'Jinnah', 'T', 'Enumerables', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:36:24', '2016-01-08 13:37:24'),
(30, 12, NULL, 'Amalia', 'Monulngolh', 'Caballero', '', '1970-10-13', 'Alamada Cotabato', 'female', 'single', 'Filipino', 1.63, 60.00, 'O', '70091301235', '1900-0004-6939', '16-000016208-3', '16-1352690-0', '09195966383', '012', '906-006-536', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:38:09', '2016-01-14 02:10:36'),
(31, 14, NULL, 'Florida', 'Suan', 'Cerbo', '', '1958-01-15', 'Bucana, Lasang, Davao City', 'female', 'married', 'Filipino', 1.30, 58.00, 'B', '58-011502464', '1101-018561-06', '16-0000-16264-4', '09-0670720-3', '09053604673', '014', '141-137-368', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:39:07', '2016-01-14 06:26:42'),
(32, 16, NULL, 'Juana', 'Buladaco', 'Cabag', '', '1958-03-31', 'Bingcungan, Tagum City, Davao del Norte', 'male', 'married', 'Filipino', 1.30, 53.00, 'O', '58033001078', '1101-210277-07', '16-000016216-4', '09-2570251-9', '09216985759', '016', '141-137-327', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:40:30', '2016-01-14 03:38:32'),
(33, 15, NULL, 'Roselyn', 'Martin', 'Aviso', '', '1972-01-17', 'Surigao del Sur', 'female', 'single', 'Filipino', 1.20, 50.00, 'O', '720117000765', '1101-210256-04', '16-000016090-0', '10-0488234-6', '', '015', '180-767-832', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:41:52', '2016-01-14 02:19:42'),
(34, 17, NULL, 'Celia', 'Melicor', 'Garbosa', '', '1964-10-02', 'Nabunturan, Comval Province', 'male', 'single', 'Filipino', 1.55, 55.00, 'O', '64102901841', '1900-0004-7149', '16-000016358-6', '', '09495001906', '017', '141-137-649', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:42:55', '2016-01-14 02:43:45'),
(35, 18, NULL, 'Dionisio', 'Dolfo', 'Padrogane', '', '1962-06-10', 'Passi, Iloilo City', 'male', 'married', 'Filipino', 1.70, 56.00, 'O', 'B63LADDP015', '1102-210354-04', '16-00046026-2', '09-11473137', '09491457162', '018', '141-137-673', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:44:18', '2016-01-14 01:17:48'),
(36, 203, NULL, 'Karen', 'Lihay-Lihay', 'Catane', '', '1971-11-17', 'Padada Davao del Sur', 'female', 'widowed', 'Filipino', 5.30, 58.00, 'A', '71111701011', '', '06-000008778-8', '09-1720135-8', '09333553146', '203', '903-726-824', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:46:27', '2016-01-14 02:33:57'),
(37, 240, NULL, 'Medel', 'R', 'Silvosa', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:47:51', '2016-01-08 13:48:15'),
(38, 21, NULL, 'Conrado', 'Ganacial', 'Ganadores', '', '0000-00-00', '', 'male', 'married', 'Filipino', 5.00, 65.00, 'O', 'B-5SEW-CGG-01-3', '110121031405', '16-000016364-0', '', '', '021', '141-137-456', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:48:53', '2016-01-14 03:08:33'),
(39, 22, NULL, 'Emilio', 'Tanudtanud', 'Glimada', '', '1963-03-11', 'Pilut N. Cotabato', 'male', 'married', 'Filipino', 1.68, 84.00, 'O', '63031101711', '1101-108574-84', '160004633-47', '09-2401588-3', '09301526806', '022', '141-137-472', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:49:51', '2016-01-14 02:54:56'),
(40, 29, NULL, 'Rudelito', 'A', 'Sator', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:50:52', '2016-01-08 13:51:11'),
(41, 28, NULL, 'Cesar', 'Amado', 'Petiluna', '', '1951-02-24', 'Matag-ob, Leyte', 'male', 'married', 'Filipino', 5.00, 50.00, 'B', '51022402262', '110131455903', '16-000016773-5', '09-0612553-9', '', '028', '123-962-143', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:52:01', '2016-01-15 03:22:59'),
(42, 31, NULL, 'Dionisio', 'Salag', 'Namuag', '', '1960-04-01', 'Dimiao, Bohol', 'female', 'widowed', 'Filipino', 5.00, 4.00, 'A+', '60040102500', '1900-0004-7350', '160000116806-5', '03-7189886-0', '09232427010', '031', '131-536-549', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:53:27', '2016-01-15 03:06:22'),
(43, 127, NULL, 'Roldan', 'B', 'Junsay', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:54:39', '2016-01-08 13:54:59'),
(44, 43, NULL, 'Carmelita', 'D', 'Sato', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:55:42', '2016-01-08 13:56:01'),
(45, 232, NULL, 'Xavier', 'Ngoho', 'Lopez', '', '1978-06-28', 'Rizal Ave., Digos, Davao del Sur', 'male', 'single', 'Filipino', 0.00, 65.00, 'B+', '', '', '120-5041-99741', '09-2185784-0', '09081185162', '232', '234-536-595-000', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:56:32', '2016-01-14 03:25:40'),
(46, 120, NULL, 'Raquel', 'Juntilla', 'Edjec', '', '1977-10-01', 'Surigao City', 'female', 'married', 'Filipino', 1.68, 80.00, 'O', '77100100765', '100-005-6052', '19-0900108048', '09-2356651-1', '09387702218', '120', '919-215-217', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:57:40', '2016-01-14 01:40:34'),
(47, 34, NULL, 'Eldy', 'Gardose', 'Garbosa', '', '1962-12-21', 'Iloilo', 'male', 'married', 'Filipino', 1.50, 65.00, 'O', '62112102292', '1900-0004-7150', '16-000016348-9', '', '09495001906', '034', '141-137-464', NULL, NULL, NULL, NULL, NULL, '2016-01-08 13:59:00', '2016-01-14 03:07:08'),
(48, 33, NULL, 'Rolando', 'B', 'Lasquite', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:00:16', '2016-01-08 14:00:36'),
(49, 38, NULL, 'Melecio', 'Gabaya', 'Mendez', '', '1960-12-04', 'Quezon, Panabo City', 'male', 'single', 'Filipino', 1.50, 78.00, 'B', 'B61Y4-M6M-01-9', '1101-018591-08', '16-0000-16816-2', '', '09071798650', '038', '141-137-632', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:02:01', '2016-01-14 07:40:39'),
(50, 36, NULL, 'Jerry', 'Orevillo', 'Salinas', '', '1965-02-10', 'St. Nino San Agustin Surigao del Sur', 'male', 'married', 'Filipino', 56.00, 65.00, '', '65021001931', '1101-018601-09', '16-000016839-1', '', '09286595269', '036', '166-062-085', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:02:52', '2016-01-14 01:42:03'),
(51, 35, NULL, 'Avelino', 'P', 'Lanugon', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:03:54', '2016-01-08 14:04:22'),
(52, 46, NULL, 'Rodolfo', 'J', 'Ledesma', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:05:08', '2016-01-08 14:05:28'),
(53, 126, NULL, 'Marichelle', 'Catitig', 'Maglinao', '', '1977-09-21', 'San Jose, Baggao, Cagayan Valley', 'female', 'married', 'Filipino', 1.58, 50.00, 'AB', '77092101366', '1900-0006-1184', '16-02505-7246-5', '', '09291766929', '126', '946-752-125', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:08:47', '2016-02-04 13:52:46'),
(54, 212, NULL, 'Leron', 'E', 'Odrada', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:09:41', '2016-01-08 14:10:00'),
(55, 45, NULL, 'Eutiqiuo', 'Laurden', 'Arceño', 'Jr.', '1968-05-09', 'San Agustin, Seirra Bulloees Bohol', 'male', 'married', 'Filipino', 5.00, 80.00, '', '006-00004-2480-0', '1101-018547-11', '16-000016094-3', '09-1354548-7', '09494140508', '045', '166-062-069', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:11:08', '2016-01-14 06:03:25'),
(56, 41, NULL, 'Gerry', 'O', 'Español', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:12:16', '2016-01-08 14:12:35'),
(57, 44, NULL, 'Rey', 'Bastasa', 'Turno', '', '1961-07-10', 'Babak Davao del Norte', 'male', 'married', 'Filipino', 1.62, 65.00, 'O', '006-00004-2461-9', '1900-0004-7604', '16-000016949-5', '', '', '044', '141-137-829', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:13:25', '2016-01-14 01:28:11'),
(58, 39, NULL, 'Maximiano', 'Venturado', 'Mendoza', '', '1965-07-19', 'Paloma, Leyte', 'male', 'married', 'Filipino', 5.00, 75.00, 'A', 'BG5DQK-MVM-01-8', '1101-099-389-05', '16-000030677-8', '09-1357988-0', '09173501074', '039', '133-822-215', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:14:27', '2016-01-15 02:38:39'),
(59, 19, NULL, 'Romulo', 'Olmos', 'Orma', '', '1954-10-30', 'Pototan, Iloilo', 'male', 'married', 'Filipino', 1.30, 51.00, 'O', '4404-5276-8924-0105', '110121035306', '16-00001800-6', '', '09304545815', '019', '141-127-665', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:15:25', '2016-01-14 01:59:07'),
(60, 26, NULL, 'Felma', 'A', 'Ruelo', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:16:26', '2016-01-08 14:16:46'),
(61, 204, NULL, 'Jay Roldan', 'Beatizola', 'Bañaria', '', '1975-09-12', 'Sasa, Davao City', 'male', 'single', 'Filipino', 1.50, 60.00, 'O', '2004098401', '1880-0079-2478', '16-050422214-1', '09-1716930-6', '09123810828', '212', '404-524-757', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:17:25', '2016-01-14 06:00:13'),
(62, 48, NULL, 'Nelson', 'Salvador', 'Cerbo', '', '1957-10-12', 'Imelda, Zamboanga del Sur', 'male', 'married', 'Filipino', 5.00, 71.00, 'O', '57101202412', '1900-0004-6963', '16-000016257-1', '09-0487134-8', '', '048', '906-006-543', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:18:21', '2016-01-14 06:23:20'),
(63, 131, NULL, 'Pondador Raymond', 'Pajaron', 'Saguran', '', '1980-08-16', 'Butuan City', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '09981598217', '131', '', NULL, NULL, NULL, 'gCi6lIFrBBBdYop2sVMrF6yVJv51wkx0.jpg', NULL, '2016-01-08 14:19:34', '2016-02-05 15:02:07'),
(64, 1, NULL, 'Edgardo', 'M', 'Santos', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '001', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:20:22', '2016-01-23 06:28:30'),
(65, 238, NULL, 'Jo Mark', 'M', 'Libre', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:21:45', '2016-01-08 14:22:24'),
(66, 194, NULL, 'Glenne', 'Berja', 'Lagura', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:23:05', '2016-01-08 14:23:25'),
(67, 113, NULL, 'Reir Erlinda', 'E', 'Cutad', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:24:41', '2016-01-08 14:25:09'),
(68, 199, NULL, 'Ian Jay', 'T', 'Padios', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:25:48', '2016-01-08 14:26:07'),
(69, 68, NULL, 'Ma. Charito', 'Villanueva', 'Aba', '', '1956-03-04', 'Barotac Nuevo, Iloilo', 'female', 'married', 'Filipino', 1.50, 76.00, 'B', 'B57F4-CBA-01-2', '1101-0185-44-06', '16-000016123-0', '', '09081875933', '068', '141-137-192', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:27:48', '2016-01-12 07:08:31'),
(70, 97, NULL, 'Bernandita', 'Tripole', 'Rodriguez', '', '1967-05-06', 'Lianga, Surigao del Sur', 'female', 'married', 'Filipino', 1.65, 62.00, 'O+', 'B67K6BTR028', '1101-018609-04', '16-000016935-5', '0934368889', '09065771929', '097', '141-137-811', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:29:22', '2016-01-11 06:17:45'),
(71, 93, NULL, 'Zoilyn', 'Benban', 'Manuales', '', '1956-10-18', 'Barotoc Nuevo, Iloilo', 'female', 'married', 'Filipino', 1.52, 50.00, 'AB', '56101801948', '110221034407', '16-000016829-4', '', '09129302616', '093', '181-137-624', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:30:23', '2016-01-11 07:31:09'),
(72, 59, NULL, 'Quirino', 'M', 'Bero', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:31:29', '2016-01-08 14:31:49'),
(73, 65, NULL, 'Rogelio', 'O', 'Flores', 'Jr.', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:32:27', '2016-01-08 14:33:22'),
(74, 95, NULL, 'Sol', 'D', 'Sotomil', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:34:11', '2016-01-08 14:34:31'),
(75, 96, NULL, 'Joey', 'Paulo', 'Sotomil', '', '1963-02-06', 'Surallah, South Cotabato', 'male', 'married', 'Filipino', 1.65, 70.00, 'A+', 'B63C6-JPS-02-9', '1101-108606-10', '16-0000-16882-0', '09-3076088-9', '09391359800', '096', '141-137-787', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:35:11', '2016-01-11 07:17:03'),
(76, 230, NULL, 'Grace', 'C', 'Guanzon', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:36:24', '2016-01-08 14:37:22'),
(77, 20, NULL, 'Cyril Tom', 'Bueno', 'Ranara', '', '1974-12-18', 'Digos City', 'male', 'married', 'Filipino', 1.58, 59.00, 'O+', 'CRN-006-0073-1639-3', '188512380M', '16-0000-16934-7', '', '09097413872', '020', '913-813-055', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:38:20', '2016-01-12 03:05:10'),
(78, 206, NULL, 'Leizel', 'T', 'Esprela', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:39:11', '2016-01-08 14:39:31'),
(79, 213, NULL, 'MIchael', 'B', 'Andam', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:40:07', '2016-01-08 14:40:26'),
(80, 233, NULL, 'Paquito', 'E', 'Relox', 'Jr', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:41:12', '2016-01-08 14:41:33'),
(81, 239, NULL, 'Sheena Lyn', 'A', 'Nuñez', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:47:09', '2016-01-08 14:47:32'),
(82, 100, NULL, 'Teresita', 'Bayacag', 'Bayaron', '', '1953-03-23', 'Many, Davao Oriental', 'female', 'married', 'Filipino', 1.50, 63.00, 'O', '956-031014-01-7', '1101-210262-09', '16-000016171-0', '', '09192012551', '100', '119-600-970', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:48:22', '2016-01-12 06:51:19'),
(83, 58, NULL, 'Armin', 'L', 'Rubi', '', '1963-01-09', 'Parang, Cantilan, Surigao del Sur', 'female', 'married', 'Filipino', 5.50, 73.00, 'AB', '6310901890', '1101-018599-03', '16-00016939-8', '09-1367988-0', '09237863296', '058', '148-315-474', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:49:14', '2016-02-05 15:03:29'),
(84, 73, NULL, 'Alejandro', 'L', 'Ladeza', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:50:22', '2016-01-08 14:50:41'),
(85, 115, NULL, 'Leonida', 'Porras', 'Piorac', '', '1969-07-09', 'Tagum City, Davao del Norte', 'female', 'married', 'Filipino', 1.50, 65.00, 'O', '69070901382', '1101-3283-1810', '', '', '09469434414', '115', '158-771-599', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:51:10', '2016-01-12 05:56:32'),
(86, 72, NULL, 'Mercedita', 'E', 'Floro', '', '1969-07-18', 'Luparan, Sulop, Davao del Sur', 'female', 'married', 'Filipino', 0.00, 47.00, 'B', 'CN-006-0114-0264-6', '', '16-000016384-5', '', '00912855379', '072', '906-006-577', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:52:06', '2016-01-12 06:53:05'),
(87, 180, NULL, 'Ann Cherry', 'C', 'Cereno', '', '1975-12-01', 'Davao City', 'female', 'single', 'Filipino', 1.50, 51.00, 'O', '2004098402', '', '16-025052645-5', '0920197349', '09205128597', '180', '194-568-865', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:53:02', '2016-01-11 07:07:42'),
(88, 208, NULL, 'Sabar', 'Gonzales', 'Hasan', '', '1980-11-30', 'Maco, Davao City', 'male', 'single', 'Filipino', 1.32, 55.00, 'B', '', '', '16-05025106-03', '09-202776611-2', '09461524615', '208', '929-757-359', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:53:53', '2016-01-12 06:37:16'),
(89, 236, NULL, 'Ma. Kristine', 'I', 'Arriola', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:54:50', '2016-01-08 14:55:09'),
(90, 234, NULL, 'Ian', 'S', 'Somosot', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:55:52', '2016-01-08 14:56:11'),
(91, 62, NULL, 'Fidela', 'A', 'Indie', '', '1953-10-28', 'Davao City', 'female', 'married', 'Filipino', 1.75, 68.00, 'O+', '53102802043', '1900-0004-7216', '16-000016427-2', '09-0831572-9', '09489985233', '062', '141-137-543', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:58:23', '2016-01-11 06:46:02'),
(92, 80, NULL, 'Rosie Lynn', 'Palo', 'Tejada', '', '1969-05-05', 'Mampising, Mabini, Davao del Norte', 'female', 'married', 'Filipino', 1.55, 58.00, 'O', 'CRN-006-0114-0327-3', '1101-018595-11', '16-000016954-1', '', '09183699271', '080', '141-137-681', NULL, NULL, NULL, NULL, NULL, '2016-01-08 14:59:10', '2016-01-11 06:55:49'),
(93, 60, NULL, 'Kenny Allan', 'P', 'Benigno', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:00:12', '2016-01-08 15:00:34'),
(94, 109, NULL, 'Edna', 'Alliones', 'Valiente', '', '1967-04-05', 'Malinawon, Mawab. Compostela Valley', 'female', 'married', 'Filipino', 1.55, 50.00, 'AB', 'B67H5-EAV-01-3', '1101-018546-02', '16-4444-16944-4', '', '09165292101', '109', '141-137-214', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:01:03', '2016-01-12 02:41:02'),
(95, 85, NULL, 'Maria', 'T', 'Corcino', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:02:34', '2016-01-08 15:02:53'),
(96, 88, NULL, 'Samuel', 'Abella', 'Plando', '', '1969-02-05', 'Callawa, Davao City', 'male', 'single', 'Filipino', 1.30, 65.00, '', 'CM-4613719 AND 45691', '1101-0000165226-0', '16-0000165226-0', '', '09491986464', '088', '125-025-169', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:03:54', '2016-01-12 05:31:55'),
(97, 81, NULL, 'Joy', 'Lorin', 'Picar', '', '1968-02-01', 'Davao City', 'female', 'married', 'Filipino', 1.40, 60.00, 'O', '6802011303', '1900000047395', '160000165422', '33-1068082-9', '09178528764', '081', '128727050', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:05:06', '2016-01-12 06:12:57'),
(98, 74, NULL, 'Jude', 'Mabale', 'Magdayao', '', '1966-12-19', 'Davao City', 'male', 'single', 'Filipino', 1.77, 99.99, 'O+', 'B66YKJMM013', '1101-032897-02', '16-0010016481-7', '09-1344307-1', '09293982538', '074', '124-069-217', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:06:27', '2016-01-12 06:17:21'),
(99, 70, NULL, 'Mary Sheila', 'De La Cruz', 'Fuentes', '', '1971-04-22', 'Davao City', 'female', 'married', 'Filipino', 1.56, 74.00, 'O+', '71042200969', '1900-0004-7116', '33-32844661-4', '', '09496538581', '070', '913813022', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:08:05', '2016-01-12 06:45:09'),
(100, 99, NULL, 'Sevetrim', 'Bayacag', 'Torrejos', '', '1973-06-03', 'Davao City', 'female', 'married', 'Filipino', 1.50, 53.00, 'B+', '9560672579011', '1900-0005-4211', '16-0000-16183-4', '', '09128039082', '099', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:09:06', '2016-01-12 03:21:26'),
(101, 152, NULL, 'Chris Lloyd', 'A', 'Ceniza', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:11:33', '2016-01-08 15:12:00'),
(102, 178, NULL, 'Arnold', 'M', 'Duping', '', '1978-11-28', 'Manay, Davao Oriental', 'male', 'single', 'Filipino', 0.00, 55.00, 'O', '2003511997', '1900-0007-0098', '160000671662', '092315607-3', '09467035247', '178', '936-324-594', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:13:30', '2016-01-11 07:27:36'),
(103, 153, NULL, 'Junry', 'R', 'Lanoy', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:14:25', '2016-01-08 15:14:55'),
(104, 107, NULL, 'Lemuel', 'T', 'Cardona', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:15:33', '2016-01-08 15:15:57'),
(105, 67, NULL, 'Josiedel', 'Contangco', 'Santamaria', '', '1976-08-07', 'Lianga, Surigao del Sur', 'female', 'married', 'Filipino', 5.00, 65.00, 'B', '76080700365', '1900-0005-7886', '16-000016245-8', '', '09195082978', '067', '913-813-014', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:17:05', '2016-01-12 05:34:49'),
(106, 71, NULL, 'Joan Cristin', 'Eballe', 'Alipoyo', '', '1976-06-24', 'Poblacion, Naawan, Misamis Oriental', 'female', 'married', 'Filipino', 1.57, 79.00, 'O+', '74062400637', '1101-210299-08', '10-000016320-9', '', '09094063140', '071', '913-813-030', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:20:20', '2016-01-11 06:37:33'),
(107, 235, NULL, 'Melissa', 'G', 'Dalumay', '', '1988-01-07', 'BIDCOR, Bayugan City, Agusan del Sur', 'female', 'single', 'Filipino', 0.00, 0.00, 'O+', '', '', '', '', '09207136363', '235', '', NULL, NULL, NULL, 'MrEGV8ZyqQNEQfL9KWd3UzB4QIYNO4Iy.jpg', NULL, '2016-01-08 15:21:23', '2016-02-04 13:58:32'),
(108, 79, NULL, 'Bonita', 'P', 'Cantere', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2016-01-08 15:27:51', '2016-01-08 15:28:11'),
(110, 27, NULL, 'Irvin Glenn', 'Saracin', 'Santamaria', '', '1977-01-09', 'Lianga Surigao del Sur', 'male', 'married', 'Filipino', 5.40, 70.00, 'B', '77010900215', '1900-0004-7505', '16000044855-6', '', '09084319583', '027', '916-094-225', NULL, NULL, NULL, NULL, NULL, '2016-01-14 01:56:38', '2016-01-14 01:57:02'),
(111, 149, NULL, 'Jeffrey', 'Baes', 'Rafil', '', '1980-09-04', 'Nituan, Parang Maguindanao', 'male', 'married', 'Filipino', 1.59, 0.00, 'O', '', '', '', '', '09108580813', '149', '936-159-160', NULL, NULL, NULL, NULL, NULL, '2016-01-15 02:46:22', '2016-01-15 03:35:06');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_accumulated_leaves`
--

CREATE TABLE IF NOT EXISTS `hris_employee_accumulated_leaves` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `vacation_leave` double(8,3) NOT NULL DEFAULT '0.000',
  `sick_leave` double(8,3) NOT NULL DEFAULT '0.000',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_accumulated_leaves`
--

INSERT INTO `hris_employee_accumulated_leaves` (`id`, `employee_id`, `vacation_leave`, `sick_leave`, `created_at`, `updated_at`) VALUES
(2, 2, 18.395, 35.895, '2016-01-04 18:40:47', '2016-01-15 02:35:34'),
(3, 4, 11.586, 116.420, '2016-01-04 19:02:42', '2016-01-15 02:19:35'),
(4, 5, 0.000, -0.727, '2016-01-04 19:27:55', '2016-01-15 03:17:46'),
(5, 6, 15.942, 164.850, '2016-01-04 19:47:13', '2016-01-15 03:19:15'),
(6, 7, 7.387, 78.996, '2016-01-04 21:57:48', '2016-01-15 03:07:30'),
(8, 9, 23.735, 175.326, '2016-01-04 22:05:08', '2016-01-15 02:54:32'),
(9, 10, 2.862, 2.000, '2016-01-04 22:19:11', '2016-01-15 03:07:05'),
(10, 11, 9.535, 23.064, '2016-01-05 19:43:54', '2016-01-15 02:57:53'),
(11, 12, 14.814, 100.813, '2016-01-05 19:58:31', '2016-01-15 03:14:12'),
(12, 13, 7.301, 24.301, '2016-01-05 20:14:24', '2016-01-15 03:03:41'),
(13, 14, 27.792, 35.708, '2016-01-05 20:52:55', '2016-01-15 03:06:00'),
(14, 15, 11.917, 56.147, '2016-01-05 21:41:37', '2016-01-15 03:13:02'),
(15, 16, 0.000, 0.000, '2016-01-05 21:56:17', '2016-01-05 21:56:17'),
(16, 17, 14.289, 13.406, '2016-01-05 22:12:38', '2016-01-15 03:16:57'),
(17, 18, 0.000, 42.963, '2016-01-05 22:38:50', '2016-01-15 03:02:20'),
(18, 19, 11.500, 4.500, '2016-01-05 22:51:22', '2016-01-15 02:58:32'),
(19, 20, 15.239, 179.340, '2016-01-05 23:33:02', '2016-01-15 03:11:40'),
(20, 21, 13.083, 86.082, '2016-01-05 23:51:58', '2016-01-15 03:08:10'),
(21, 22, 42.882, 230.973, '2016-01-08 13:10:30', '2016-01-15 02:23:32'),
(22, 23, 19.392, 216.750, '2016-01-08 13:26:46', '2016-01-15 02:30:19'),
(23, 24, 17.363, 108.291, '2016-01-08 13:29:34', '2016-01-15 02:32:33'),
(24, 25, 13.357, 317.146, '2016-01-08 13:31:24', '2016-01-15 02:32:10'),
(25, 26, 20.126, 42.520, '2016-01-08 13:32:19', '2016-01-15 02:30:01'),
(26, 27, 5.225, 109.125, '2016-01-08 13:33:13', '2016-01-15 02:37:48'),
(27, 28, 42.971, 263.576, '2016-01-08 13:34:57', '2016-01-15 02:23:04'),
(28, 29, 25.275, 275.331, '2016-01-08 13:36:24', '2016-01-15 02:31:09'),
(29, 30, 18.248, 187.576, '2016-01-08 13:38:09', '2016-01-15 02:25:05'),
(30, 31, 13.926, 385.867, '2016-01-08 13:39:07', '2016-01-15 02:29:34'),
(31, 32, 20.364, 251.680, '2016-01-08 13:40:30', '2016-01-15 02:23:56'),
(32, 33, 18.003, 120.920, '2016-01-08 13:41:52', '2016-01-15 02:27:15'),
(33, 34, 44.195, 292.425, '2016-01-08 13:42:55', '2016-01-15 02:33:27'),
(34, 35, 14.750, 182.746, '2016-01-08 13:44:18', '2016-01-15 02:42:30'),
(35, 36, 17.528, 45.680, '2016-01-08 13:46:27', '2016-01-15 02:26:18'),
(36, 37, 0.000, 0.000, '2016-01-08 13:47:51', '2016-01-08 13:47:51'),
(37, 38, 11.432, 365.917, '2016-01-08 13:48:53', '2016-01-15 02:33:01'),
(38, 39, 9.895, 245.750, '2016-01-08 13:49:51', '2016-01-15 02:34:00'),
(39, 40, 20.616, 313.210, '2016-01-08 13:50:52', '2016-01-15 02:50:25'),
(40, 41, 12.500, 174.000, '2016-01-08 13:52:02', '2016-01-15 02:42:57'),
(41, 42, 13.500, 121.085, '2016-01-08 13:53:27', '2016-01-15 02:40:13'),
(42, 43, 10.256, 101.073, '2016-01-08 13:54:40', '2016-01-15 02:34:55'),
(43, 44, 23.817, 244.831, '2016-01-08 13:55:42', '2016-01-15 02:50:07'),
(44, 45, 13.605, 55.605, '2016-01-08 13:56:32', '2016-01-15 02:37:05'),
(45, 46, 14.903, 129.250, '2016-01-08 13:57:40', '2016-01-15 02:30:37'),
(46, 47, 29.345, 373.197, '2016-01-08 13:59:00', '2016-01-15 02:33:43'),
(47, 48, 14.595, 315.002, '2016-01-08 14:00:16', '2016-01-15 02:36:29'),
(48, 49, 15.823, 475.934, '2016-01-08 14:02:01', '2016-01-15 02:38:17'),
(49, 50, 11.226, 57.583, '2016-01-08 14:02:52', '2016-01-15 02:49:17'),
(50, 51, 11.973, 266.000, '2016-01-08 14:03:54', '2016-01-15 02:36:05'),
(51, 52, 21.260, 283.605, '2016-01-08 14:05:09', '2016-01-15 02:36:48'),
(52, 53, 9.246, 108.875, '2016-01-08 14:08:47', '2016-01-15 02:37:28'),
(53, 54, 17.958, 13.458, '2016-01-08 14:09:41', '2016-01-15 02:40:35'),
(54, 55, 14.658, 314.200, '2016-01-08 14:11:08', '2016-01-15 02:26:52'),
(55, 56, 12.458, 3.074, '2016-01-08 14:12:16', '2016-01-15 02:31:37'),
(56, 57, 14.289, 325.750, '2016-01-08 14:13:26', '2016-01-15 02:50:41'),
(57, 58, 14.130, 232.419, '2016-01-08 14:14:27', '2016-01-15 02:53:46'),
(58, 59, 13.512, 420.284, '2016-01-08 14:15:25', '2016-01-15 02:41:35'),
(59, 60, 17.136, 91.125, '2016-01-08 14:16:26', '2016-01-15 02:48:24'),
(60, 61, 10.480, 65.480, '2016-01-08 14:17:25', '2016-01-15 02:21:20'),
(61, 62, 0.000, 0.000, '2016-01-08 14:18:21', '2016-01-08 14:18:21'),
(62, 63, 21.762, 40.605, '2016-01-08 14:19:34', '2016-01-15 02:48:53'),
(63, 64, 44.440, 253.500, '2016-01-08 14:20:22', '2016-01-15 06:37:58'),
(64, 65, 0.000, 0.000, '2016-01-08 14:21:46', '2016-01-08 14:21:46'),
(65, 66, 0.000, 0.000, '2016-01-08 14:23:06', '2016-01-08 14:23:06'),
(66, 67, 16.924, 77.414, '2016-01-08 14:24:41', '2016-01-15 03:03:23'),
(67, 68, 0.000, 0.000, '2016-01-08 14:25:48', '2016-01-08 14:25:48'),
(68, 69, 0.000, 0.000, '2016-01-08 14:27:48', '2016-01-08 14:27:48'),
(69, 70, 15.148, 55.812, '2016-01-08 14:29:22', '2016-01-15 03:18:26'),
(70, 71, 0.000, 52.900, '2016-01-08 14:30:24', '2016-01-15 03:13:50'),
(71, 72, 0.000, 59.844, '2016-01-08 14:31:29', '2016-01-15 03:00:37'),
(72, 73, 15.356, 54.296, '2016-01-08 14:32:28', '2016-01-15 03:05:09'),
(73, 74, 0.000, 52.249, '2016-01-08 14:34:11', '2016-01-15 03:20:30'),
(74, 75, 0.000, 60.807, '2016-01-08 14:35:11', '2016-01-15 03:20:17'),
(75, 76, 13.917, 16.917, '2016-01-08 14:36:24', '2016-01-15 03:07:53'),
(76, 77, 5.050, 119.242, '2016-01-08 14:38:20', '2016-01-15 03:17:18'),
(77, 78, 0.000, 0.000, '2016-01-08 14:39:11', '2016-01-08 14:39:11'),
(78, 79, 12.000, 15.000, '2016-01-08 14:40:07', '2016-01-15 02:57:17'),
(79, 80, 0.000, 0.000, '2016-01-08 14:41:12', '2016-01-08 14:41:12'),
(80, 81, 0.000, 0.000, '2016-01-08 14:47:09', '2016-01-08 14:47:09'),
(81, 82, 42.030, 44.030, '2016-01-08 14:48:22', '2016-01-15 02:57:33'),
(82, 83, 0.000, 78.510, '2016-01-08 14:49:14', '2016-01-15 03:18:47'),
(83, 84, 0.000, 72.385, '2016-01-08 14:50:22', '2016-01-15 03:12:03'),
(84, 85, 30.067, 63.120, '2016-01-08 14:51:11', '2016-01-15 03:16:00'),
(85, 86, 13.264, 88.149, '2016-01-08 14:52:06', '2016-01-15 03:05:31'),
(86, 87, 0.000, 4.000, '2016-01-08 14:53:02', '2016-01-15 03:02:41'),
(87, 88, 0.000, 0.000, '2016-01-08 14:53:53', '2016-01-08 14:53:53'),
(88, 89, 0.000, 0.000, '2016-01-08 14:54:50', '2016-01-08 14:54:50'),
(89, 90, 0.000, 0.000, '2016-01-08 14:55:52', '2016-01-08 14:55:52'),
(90, 91, 15.842, 68.842, '2016-01-08 14:58:23', '2016-01-15 03:09:30'),
(91, 92, 22.624, 188.309, '2016-01-08 14:59:10', '2016-01-15 03:20:52'),
(92, 93, 0.000, 327.103, '2016-01-08 15:00:12', '2016-01-15 02:58:15'),
(93, 94, 0.000, 10.130, '2016-01-08 15:01:03', '2016-01-15 03:21:18'),
(94, 95, 0.000, 132.504, '2016-01-08 15:02:34', '2016-01-15 03:02:52'),
(95, 96, 24.780, 90.793, '2016-01-08 15:03:54', '2016-01-15 03:16:24'),
(96, 97, 0.000, 0.897, '2016-01-08 15:05:06', '2016-01-15 03:15:00'),
(97, 98, 53.243, 72.743, '2016-01-08 15:06:27', '2016-01-15 03:13:29'),
(98, 99, 0.000, 2.000, '2016-01-08 15:08:05', '2016-01-15 03:05:43'),
(99, 100, 0.000, 0.000, '2016-01-08 15:09:06', '2016-01-08 15:09:06'),
(100, 101, 7.542, 26.542, '2016-01-08 15:11:34', '2016-01-15 03:02:05'),
(101, 102, 7.993, 51.993, '2016-01-08 15:13:30', '2016-01-15 03:04:02'),
(102, 103, 12.208, 38.208, '2016-01-08 15:14:25', '2016-01-15 03:12:30'),
(103, 104, 12.500, 101.538, '2016-01-08 15:15:34', '2016-01-15 03:01:24'),
(104, 105, 11.804, 80.680, '2016-01-08 15:17:05', '2016-01-15 03:19:33'),
(105, 106, 0.000, 52.146, '2016-01-08 15:20:20', '2016-01-15 02:57:02'),
(106, 107, 0.000, 0.000, '2016-01-08 15:21:23', '2016-01-08 15:21:23'),
(107, 108, 0.000, 52.202, '2016-01-08 15:27:51', '2016-01-15 03:00:52'),
(109, 110, 12.683, 120.042, '2016-01-14 01:56:38', '2016-01-15 02:49:44'),
(110, 111, 13.669, 42.169, '2016-01-15 02:46:22', '2016-01-15 02:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_address`
--

CREATE TABLE IF NOT EXISTS `hris_employee_address` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_type` enum('residential','permanent') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_address`
--

INSERT INTO `hris_employee_address` (`id`, `employee_id`, `address`, `zip_code`, `telephone_number`, `address_type`, `created_at`, `updated_at`) VALUES
(3, 2, 'Prk 3A Poblacion Banaybanay Davao Oreintal', '8208', '', 'residential', '2016-01-04 18:40:48', '2016-01-04 18:40:48'),
(4, 2, 'Prk 3A Poblacion Banaybanay Davao Oreintal', '8208', '', 'permanent', '2016-01-04 18:40:48', '2016-01-04 18:40:48'),
(5, 4, 'Block 12 Lot 12 Panabo Country Homes, New Visayas, Panabo City', '8105', '', 'residential', '2016-01-04 19:02:43', '2016-01-04 19:02:43'),
(6, 4, 'Block 12 Lot 12 Panabo Country Homes, New Visayas, Panabo City', '8105', '', 'permanent', '2016-01-04 19:02:43', '2016-01-04 19:02:43'),
(7, 5, 'Phase 3 BLK 7 LT3 Dacudao Country Homes, JP Laurel, Panabo City', '8105', '09278344316', 'residential', '2016-01-04 19:27:55', '2016-01-04 19:27:55'),
(8, 5, 'Phase 3 BLK 7 LT3 Dacudao Country Homes, JP Laurel, Panabo City', '8105', '09278344316', 'permanent', '2016-01-04 19:27:55', '2016-01-04 19:27:55'),
(9, 6, '7063 Subdivision, Panabo CIty ', '8105', '', 'residential', '2016-01-04 19:47:13', '2016-01-04 19:47:13'),
(10, 6, '7063 Subdivision, Panabo CIty ', '8105', '', 'permanent', '2016-01-04 19:47:13', '2016-01-04 19:47:13'),
(11, 7, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'residential', '2016-01-04 21:58:14', '2016-01-04 21:58:14'),
(12, 7, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'permanent', '2016-01-04 21:58:14', '2016-01-04 21:58:14'),
(13, 9, 'Purok 6 Salvacion, Panabo City, Davao Del Norte', '8105', '', 'residential', '2016-01-04 22:05:27', '2016-01-04 22:05:27'),
(14, 9, 'Purok 6 Salvacion, Panabo City, Davao Del Norte', '8105', '', 'permanent', '2016-01-04 22:05:28', '2016-01-04 22:05:28'),
(15, 10, 'Purok Ilang - Ilang, Bingcungan, Tagum City', '8100', '', 'residential', '2016-01-04 22:19:30', '2016-01-04 22:19:30'),
(16, 10, 'Purok Ilang - Ilang, Bingcungan, Tagum City', '8100', '', 'permanent', '2016-01-04 22:19:31', '2016-01-04 22:19:31'),
(17, 11, 'Purok Mongo, Nanyo, Panabo City', '8105', '', 'residential', '2016-01-05 19:43:56', '2016-01-05 19:43:56'),
(18, 11, 'Purok Mongo, Nanyo, Panabo City', '8105', '', 'permanent', '2016-01-05 19:43:56', '2016-01-05 19:43:56'),
(19, 12, 'DNSC Compound, New Visayas, Panabo City', '8105', '0846284301', 'residential', '2016-01-05 19:58:31', '2016-01-05 19:58:31'),
(20, 12, 'DNSC Compound, New Visayas, Panabo City', '8105', '0846284301', 'permanent', '2016-01-05 19:58:32', '2016-01-05 19:58:32'),
(21, 13, '0624 Brgy. San Francisco Panabo City', '8105', '084694177', 'residential', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(22, 13, '0624 Brgy. San Francisco Panabo City', '8105', '084694177', 'permanent', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(23, 14, 'BLK.19,LOT 9, URBAN CAGANGOHAN, PANABO CITY', '8105', '', 'residential', '2016-01-05 20:52:55', '2016-01-05 20:52:55'),
(24, 14, 'POB., LILA BOHOL', '', '', 'permanent', '2016-01-05 20:52:55', '2016-01-05 20:52:55'),
(25, 15, '852 Gumamela St., Purok 6, Brgy. Ising, Pob Carmen, Davao del Norte ', '8101', 'N/A', 'residential', '2016-01-05 21:41:37', '2016-01-05 21:41:37'),
(26, 15, 'Davao del Norte  State College , New Visayas, Panabo City ', '8105 ', '084-628-4301', 'permanent', '2016-01-05 21:41:37', '2016-01-05 21:41:37'),
(27, 16, '36 Prk. Narra, Visayan Village, Tagum City', '8100', '', 'residential', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(28, 16, '36 Prk. Narra, Visayan Village, Tagum City', '8100', '', 'permanent', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(29, 17, '#939Z.Zolon St. Publacion Asuncion, Prk2, Cabanugoy, Davao Del Norte', '8102', '', 'residential', '2016-01-05 22:12:38', '2016-01-05 22:12:38'),
(30, 17, '#939Z.Zolon St. Publacion Asuncion, Prk2, Cabanugoy, Davao Del Norte', '8102', '', 'permanent', '2016-01-05 22:12:38', '2016-01-05 22:12:38'),
(31, 18, 'DNSC Road New VIsayas, Panabo City', '8105', '', 'residential', '2016-01-05 22:38:51', '2016-01-05 22:38:51'),
(32, 18, 'DNSC Road New VIsayas, Panabo City', '8105', '', 'permanent', '2016-01-05 22:38:52', '2016-01-05 22:38:52'),
(33, 19, '126 Quilisadio Subdivision New VIsayas, Panabo City', '8105', '', 'residential', '2016-01-05 22:51:22', '2016-01-05 22:51:22'),
(34, 19, '126 Quilisadio Subdivision New VIsayas, Panabo City', '8105', '', 'permanent', '2016-01-05 22:51:22', '2016-01-05 22:51:22'),
(35, 20, '960 Gredu, Panabo City ', '8105', '', 'residential', '2016-01-05 23:33:03', '2016-01-05 23:33:03'),
(36, 20, '960 Gredu , Panao City', '8105', '', 'permanent', '2016-01-05 23:33:03', '2016-01-05 23:33:03'),
(37, 21, 'Phase 2 Blk. 34 Lot. 5  Niceville Subdivision, Cagangohan, Panabo City', '8105', '', 'residential', '2016-01-05 23:51:58', '2016-01-05 23:51:58'),
(38, 21, 'Davao Del Norte State College, New Visaayas, Panabo City', '8105', '084-628-4301', 'permanent', '2016-01-05 23:51:59', '2016-01-05 23:51:59'),
(39, 22, '', '', '', 'residential', '2016-01-08 13:10:53', '2016-01-08 13:10:53'),
(40, 22, '', '', '', 'permanent', '2016-01-08 13:10:53', '2016-01-08 13:10:53'),
(41, 23, '', '', '', 'residential', '2016-01-08 13:27:09', '2016-01-08 13:27:09'),
(42, 23, '', '', '', 'permanent', '2016-01-08 13:27:09', '2016-01-08 13:27:09'),
(43, 24, '', '', '', 'residential', '2016-01-08 13:30:34', '2016-01-08 13:30:34'),
(44, 24, '', '', '', 'permanent', '2016-01-08 13:30:35', '2016-01-08 13:30:35'),
(45, 25, 'DNSC Compound, New Visayas, Panabo City ', '8105', '', 'residential', '2016-01-08 13:31:43', '2016-01-14 01:50:47'),
(46, 25, 'DNSC Compound, New Visayas, Panabo City ', '8105', '', 'permanent', '2016-01-08 13:31:44', '2016-01-14 01:50:47'),
(47, 26, 'DNSC New Visayas , Panabo City', '8105', '', 'residential', '2016-01-08 13:32:39', '2016-01-14 01:10:21'),
(48, 26, 'DNSC New Visayas , Panabo City\r\n', '8105', '', 'permanent', '2016-01-08 13:32:39', '2016-01-14 01:10:21'),
(49, 27, 'Prk 6, Gentiles Subd. New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 13:33:53', '2016-01-15 02:17:44'),
(50, 27, 'Prk 6, Gentiles Subd. New Visayas, Panabo City', '8105', '', 'permanent', '2016-01-08 13:33:53', '2016-01-15 02:17:45'),
(51, 28, 'Lot 10 Block 2 Phase 1, South View Subd., Panabo City', '8105', '09216684085', 'residential', '2016-01-08 13:35:43', '2016-01-14 01:07:23'),
(52, 28, 'Lot 10 Block 2 Phase 1, South View Subd., Panabo City', '8105', '09216684085', 'permanent', '2016-01-08 13:35:43', '2016-01-14 01:07:23'),
(53, 29, '', '', '', 'residential', '2016-01-08 13:37:23', '2016-01-08 13:37:23'),
(54, 29, '', '', '', 'permanent', '2016-01-08 13:37:24', '2016-01-08 13:37:24'),
(55, 30, 'DNSC Compound New Visayas Panabo City', '8105', '', 'residential', '2016-01-08 13:38:29', '2016-01-14 02:10:36'),
(56, 30, 'DNSC Compound New Visayas Panabo City', '8015', '', 'permanent', '2016-01-08 13:38:29', '2016-01-14 02:10:36'),
(57, 31, 'DNSC Compound, New Visayas, Panabo City, Davao del Norte', '8105', '', 'residential', '2016-01-08 13:39:27', '2016-01-14 06:26:39'),
(58, 31, 'DNSC Compound, New Visayas, Panabo City, Davao del Norte', '8105', '', 'permanent', '2016-01-08 13:39:27', '2016-01-14 06:26:39'),
(59, 32, '513 Purok 9 -C , Aljal , Carmen , Davao del Norte', '8102', '', 'residential', '2016-01-08 13:40:49', '2016-01-14 03:38:32'),
(60, 32, '513 Purok 9 -C , Aljal , Carmen , Davao del Norte', '8102', '', 'permanent', '2016-01-08 13:40:49', '2016-01-14 03:38:32'),
(61, 33, '7282. Duterte St. Purok 4b, Brgy San Francisco, Panabo City', '8105', '', 'residential', '2016-01-08 13:42:12', '2016-01-14 02:19:42'),
(62, 33, 'Diatagon, Lianga, Surigao del Sur', '8307', '', 'permanent', '2016-01-08 13:42:12', '2016-01-14 02:19:42'),
(63, 34, 'Lot 14, Block 3, Joebel Village, Cagangohan, Panabo City', '8105', '', 'residential', '2016-01-08 13:43:14', '2016-01-14 02:41:24'),
(64, 34, 'Lot 14, Block 3, Joebel Village, Cagangohan, Panabo City', '8105', '', 'permanent', '2016-01-08 13:43:15', '2016-01-14 02:41:24'),
(65, 35, 'Salacot Beach, Talomo, Davao City', '8000', '09491457162', 'residential', '2016-01-08 13:44:38', '2016-01-14 01:17:48'),
(66, 35, 'Salacot Beach, Talomo, Davao City', '8000', '09491457162', 'permanent', '2016-01-08 13:44:38', '2016-01-14 01:17:48'),
(67, 36, 'DNSC Compound New Visayas Panabo City', '8105', '', 'residential', '2016-01-08 13:46:47', '2016-01-14 02:33:55'),
(68, 36, '464T.Marcasrdo st. Padada Davao del Sur', '8000', '', 'permanent', '2016-01-08 13:46:47', '2016-01-14 02:33:56'),
(69, 37, '', '', '', 'residential', '2016-01-08 13:48:15', '2016-01-08 13:48:15'),
(70, 37, '', '', '', 'permanent', '2016-01-08 13:48:15', '2016-01-08 13:48:15'),
(71, 38, 'Prk.22, POB. Carmen Davao del  Norte', '8101', '', 'residential', '2016-01-08 13:49:12', '2016-01-14 03:08:32'),
(72, 38, 'Prk.22, POB. Carmen Davao del  Norte', '8101', '', 'permanent', '2016-01-08 13:49:13', '2016-01-14 03:08:32'),
(73, 39, 'Prk. 14 Isabela Homes New Visayas Panabo City', '8105', '', 'residential', '2016-01-08 13:50:11', '2016-01-14 02:54:55'),
(74, 39, 'Prk. 14 Isabela Homes New Visayas Panabo City', '8105', '', 'permanent', '2016-01-08 13:50:11', '2016-01-14 02:54:55'),
(75, 40, '', '', '', 'residential', '2016-01-08 13:51:11', '2016-01-08 13:51:11'),
(76, 40, '', '', '', 'permanent', '2016-01-08 13:51:11', '2016-01-08 13:51:11'),
(77, 41, 'Dumalag 2, Matina Davao City', '8012', '', 'residential', '2016-01-08 13:52:21', '2016-01-15 03:22:59'),
(78, 41, 'Dumalag 2, Matina Davao City', '8012', '', 'permanent', '2016-01-08 13:52:21', '2016-01-15 03:22:59'),
(79, 42, 'DNSC Comp. Prk 14, New Visayas, Panabo City Davao del Norte', '8105', '', 'residential', '2016-01-08 13:53:47', '2016-01-15 03:06:19'),
(80, 42, 'DNSC Comp. Prk 14, New Visayas, Panabo City Davao del Norte', '8105', '', 'permanent', '2016-01-08 13:53:47', '2016-01-15 03:06:19'),
(81, 43, '', '', '', 'residential', '2016-01-08 13:54:59', '2016-01-08 13:54:59'),
(82, 43, '', '', '', 'permanent', '2016-01-08 13:54:59', '2016-01-08 13:54:59'),
(83, 44, '', '', '', 'residential', '2016-01-08 13:56:01', '2016-01-08 13:56:01'),
(84, 44, '', '', '', 'permanent', '2016-01-08 13:56:01', '2016-01-08 13:56:01'),
(85, 45, 'Blk 28, lt 33, Emily Homes Subd., T. Ave., Mayo, Digos City, Davao del Sur', '8002', '', 'residential', '2016-01-08 13:56:52', '2016-01-14 03:25:39'),
(86, 45, 'Blk 28, lt 33, Emily Homes Subd., T. Ave., Mayo, Digos City, Davao del Sur', '8002', '', 'permanent', '2016-01-08 13:56:52', '2016-01-14 03:25:39'),
(87, 46, 'Block 2, Lot 1, Dacudao Country Homes, Brgy. J.P. Laurel, Panabo City', '8105', '', 'residential', '2016-01-08 13:58:00', '2016-01-14 01:40:33'),
(88, 46, 'Block 2, Lot 1, Dacudao Country Homes, Brgy. J.P. Laurel, Panabo City', '8105', '', 'permanent', '2016-01-08 13:58:00', '2016-01-14 01:40:34'),
(89, 47, 'Lot 14, Block 3, Joebel Village, Cagangohan, Panabo City', '8105', '', 'residential', '2016-01-08 13:59:20', '2016-01-14 03:07:06'),
(90, 47, 'Lot 14, Block 3, Joebel Village, Cagangohan, Panabo City', '8105', '', 'permanent', '2016-01-08 13:59:20', '2016-01-14 03:07:06'),
(91, 48, '', '', '', 'residential', '2016-01-08 14:00:35', '2016-01-08 14:00:35'),
(92, 48, '', '', '', 'permanent', '2016-01-08 14:00:36', '2016-01-08 14:00:36'),
(93, 49, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 14:02:21', '2016-01-14 07:40:29'),
(94, 49, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'permanent', '2016-01-08 14:02:21', '2016-01-14 07:40:29'),
(95, 50, 'DNSC Compound New Visayas Panabo City', '8015', '6288203', 'residential', '2016-01-08 14:03:11', '2016-01-14 01:42:03'),
(96, 50, 'DNSC Compound New Visayas Panabo City', '8105', '6288203', 'permanent', '2016-01-08 14:03:11', '2016-01-14 01:42:03'),
(97, 51, '', '', '', 'residential', '2016-01-08 14:04:22', '2016-01-08 14:04:22'),
(98, 51, '', '', '', 'permanent', '2016-01-08 14:04:22', '2016-01-08 14:04:22'),
(99, 52, '', '', '', 'residential', '2016-01-08 14:05:28', '2016-01-08 14:05:28'),
(100, 52, '', '', '', 'permanent', '2016-01-08 14:05:28', '2016-01-08 14:05:28'),
(101, 53, 'Block 13, Lot 27, Purok 17, Panabo Country Homes, New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 14:09:08', '2016-02-04 13:52:46'),
(102, 53, 'Block 13, Lot 27, Purok 17, Panabo Country Homes, New Visayas, Panabo City', '8105', '', 'permanent', '2016-01-08 14:09:08', '2016-02-04 13:52:46'),
(103, 54, '', '', '', 'residential', '2016-01-08 14:10:00', '2016-01-08 14:10:00'),
(104, 54, '', '', '', 'permanent', '2016-01-08 14:10:00', '2016-01-08 14:10:00'),
(105, 55, '', '8105', '', 'residential', '2016-01-08 14:11:27', '2016-01-14 06:03:24'),
(106, 55, '', '8105', '', 'permanent', '2016-01-08 14:11:27', '2016-01-14 06:03:25'),
(107, 56, '', '', '', 'residential', '2016-01-08 14:12:35', '2016-01-08 14:12:35'),
(108, 56, '', '', '', 'permanent', '2016-01-08 14:12:35', '2016-01-08 14:12:35'),
(109, 57, 'Prk. Sunkist Cagangohan, Panabo City', '8105', '', 'residential', '2016-01-08 14:13:45', '2016-01-14 01:28:10'),
(110, 57, 'Prk. Sunkist Cagangohan, Panabo City', '8105', '', 'permanent', '2016-01-08 14:13:45', '2016-01-14 01:28:10'),
(111, 58, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 14:14:46', '2016-01-15 02:38:36'),
(112, 58, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'permanent', '2016-01-08 14:14:47', '2016-01-15 02:38:37'),
(113, 59, 'Purok 24, San Vicente, Panabo City', '8105', '', 'residential', '2016-01-08 14:15:44', '2016-01-14 01:59:06'),
(114, 59, 'Purok 24, San Vicente, Panabo City', '8105', '', 'permanent', '2016-01-08 14:15:44', '2016-01-14 01:59:07'),
(115, 60, '', '', '', 'residential', '2016-01-08 14:16:46', '2016-01-08 14:16:46'),
(116, 60, '', '', '', 'permanent', '2016-01-08 14:16:46', '2016-01-08 14:16:46'),
(117, 61, 'Brgy. San Francisco, Prk 6, Peda St. Panabo City', '8105', '', 'residential', '2016-01-08 14:17:53', '2016-01-14 06:00:11'),
(118, 61, 'Brgy. San Francisco, Prk 6, Peda St. Panabo City', '8105', '', 'permanent', '2016-01-08 14:17:53', '2016-01-14 06:00:12'),
(119, 62, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 14:18:52', '2016-01-14 06:23:18'),
(120, 62, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'permanent', '2016-01-08 14:18:52', '2016-01-14 06:23:18'),
(121, 63, '', '', '', 'residential', '2016-01-08 14:19:53', '2016-01-08 14:19:53'),
(122, 63, '', '', '', 'permanent', '2016-01-08 14:19:53', '2016-01-08 14:19:53'),
(123, 64, '', '', '', 'residential', '2016-01-08 14:20:50', '2016-01-08 14:20:50'),
(124, 64, '', '', '', 'permanent', '2016-01-08 14:20:50', '2016-01-08 14:20:50'),
(125, 65, '', '', '', 'residential', '2016-01-08 14:22:24', '2016-01-08 14:22:24'),
(126, 65, '', '', '', 'permanent', '2016-01-08 14:22:24', '2016-01-08 14:22:24'),
(127, 66, '', '', '', 'residential', '2016-01-08 14:23:25', '2016-01-08 14:23:25'),
(128, 66, '', '', '', 'permanent', '2016-01-08 14:23:25', '2016-01-08 14:23:25'),
(129, 67, '', '', '', 'residential', '2016-01-08 14:25:09', '2016-01-08 14:25:09'),
(130, 67, '', '', '', 'permanent', '2016-01-08 14:25:09', '2016-01-08 14:25:09'),
(131, 68, '', '', '', 'residential', '2016-01-08 14:26:07', '2016-01-08 14:26:07'),
(132, 68, '', '', '', 'permanent', '2016-01-08 14:26:07', '2016-01-08 14:26:07'),
(133, 69, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 14:28:07', '2016-01-12 07:03:49'),
(134, 69, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'permanent', '2016-01-08 14:28:08', '2016-01-12 07:03:49'),
(135, 70, 'Blk. 15, Lot 15 Panabo Country Homes, New Visayas, Panabo City', '8105', '09065771929', 'residential', '2016-01-08 14:29:56', '2016-01-11 06:17:43'),
(136, 70, 'Davao del Norte State College, New Visayas, Panabo City', '8105', '084-628-4301', 'permanent', '2016-01-08 14:29:56', '2016-01-11 06:17:44'),
(137, 71, '014 Blk 1, Isabela Homes, New Visayas, Panabo City, Davao del Norte', '8105', '', 'residential', '2016-01-08 14:30:43', '2016-01-11 07:31:09'),
(138, 71, '014 Blk 1, Isabela Homes, New Visayas, Panabo City, Davao del Norte', '8105', '', 'permanent', '2016-01-08 14:30:43', '2016-01-11 07:31:09'),
(139, 72, '', '', '', 'residential', '2016-01-08 14:31:49', '2016-01-08 14:31:49'),
(140, 72, '', '', '', 'permanent', '2016-01-08 14:31:49', '2016-01-08 14:31:49'),
(141, 73, '', '', '', 'residential', '2016-01-08 14:33:22', '2016-01-08 14:33:22'),
(142, 73, '', '', '', 'permanent', '2016-01-08 14:33:22', '2016-01-08 14:33:22'),
(143, 74, '', '', '', 'residential', '2016-01-08 14:34:31', '2016-01-08 14:34:31'),
(144, 74, '', '', '', 'permanent', '2016-01-08 14:34:31', '2016-01-08 14:34:31'),
(145, 75, 'DNSC Compound, New Visayas, Panabo City, Davao del Norte', '8105', '', 'residential', '2016-01-08 14:35:30', '2016-01-11 07:17:01'),
(146, 75, 'DNSC Compound, New Visayas, Panabo City, Davao del Norte', '8105', '', 'permanent', '2016-01-08 14:35:30', '2016-01-11 07:17:02'),
(147, 76, '', '', '', 'residential', '2016-01-08 14:37:22', '2016-01-08 14:37:22'),
(148, 76, '', '', '', 'permanent', '2016-01-08 14:37:22', '2016-01-08 14:37:22'),
(149, 77, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 14:38:39', '2016-01-12 03:05:10'),
(150, 77, 'Mabini 3rd St., Digos City', '8002', '', 'permanent', '2016-01-08 14:38:39', '2016-01-12 03:05:10'),
(151, 78, '', '', '', 'residential', '2016-01-08 14:39:31', '2016-01-08 14:39:31'),
(152, 78, '', '', '', 'permanent', '2016-01-08 14:39:31', '2016-01-08 14:39:31'),
(153, 79, '', '', '', 'residential', '2016-01-08 14:40:26', '2016-01-08 14:40:26'),
(154, 79, '', '', '', 'permanent', '2016-01-08 14:40:26', '2016-01-08 14:40:26'),
(155, 80, '', '', '', 'residential', '2016-01-08 14:41:33', '2016-01-08 14:41:33'),
(156, 80, '', '', '', 'permanent', '2016-01-08 14:41:33', '2016-01-08 14:41:33'),
(157, 81, '', '', '', 'residential', '2016-01-08 14:47:31', '2016-01-08 14:47:31'),
(158, 81, '', '', '', 'permanent', '2016-01-08 14:47:32', '2016-01-08 14:47:32'),
(159, 82, 'Blk. 2 Spring Valley Buhanagin, Davao City', '8000', '088-241-5489', 'residential', '2016-01-08 14:48:41', '2016-01-12 06:51:19'),
(160, 82, 'Blk. 2 Spring Valley Buhanagin, Davao City', '8000', '088-241-5489', 'permanent', '2016-01-08 14:48:42', '2016-01-12 06:51:19'),
(161, 83, 'Prk.2 Brgy. Communal, Upper Catitipan, Davao City', '8000', '09206751902', 'residential', '2016-01-08 14:49:35', '2016-01-11 06:22:22'),
(162, 83, 'Prk.2 Brgy. Communal, Upper Catitipan, Davao City', '8000', '09206751902', 'permanent', '2016-01-08 14:49:35', '2016-01-11 06:22:22'),
(163, 84, '', '', '', 'residential', '2016-01-08 14:50:41', '2016-01-08 14:50:41'),
(164, 84, '', '', '', 'permanent', '2016-01-08 14:50:41', '2016-01-08 14:50:41'),
(165, 85, '7703 Gamao Subd, San Francisco, Panabo CIty', '8105', '0935-191-7014', 'residential', '2016-01-08 14:51:30', '2016-01-12 05:56:32'),
(166, 85, '7703 Gamao Subd, San Francisco, Panabo CIty', '8105', '0935-191-7014', 'permanent', '2016-01-08 14:51:30', '2016-01-12 05:56:32'),
(167, 86, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 14:52:26', '2016-01-12 06:53:05'),
(168, 86, 'DNSC Compound, New Visayas, Panabo City', '8105', '', 'permanent', '2016-01-08 14:52:26', '2016-01-12 06:53:05'),
(169, 87, '727 Don Mariano Marcos Avenue, City of Mati, Davao Oriental', '8200', '08781115063', 'residential', '2016-01-08 14:53:21', '2016-01-11 07:07:41'),
(170, 87, '727 Don Mariano Marcos Avenue, City of Mati, Davao Oriental', '8200', '08781115063', 'permanent', '2016-01-08 14:53:22', '2016-01-11 07:07:41'),
(171, 88, '#0653, Prk 5, San Juan, Maco, Compostela valley Province', '8806', '', 'residential', '2016-01-08 14:54:13', '2016-01-12 06:37:14'),
(172, 88, '#0653, Prk 5, San Juan, Maco, Compostela valley Province', '8806', '', 'permanent', '2016-01-08 14:54:13', '2016-01-12 06:37:14'),
(173, 89, '', '', '', 'residential', '2016-01-08 14:55:09', '2016-01-08 14:55:09'),
(174, 89, '', '', '', 'permanent', '2016-01-08 14:55:09', '2016-01-08 14:55:09'),
(175, 90, '', '', '', 'residential', '2016-01-08 14:56:11', '2016-01-08 14:56:11'),
(176, 90, '', '', '', 'permanent', '2016-01-08 14:56:11', '2016-01-08 14:56:11'),
(177, 91, '1025 Prk. Sibuyas, Gredu Panabo City', '8105', '', 'residential', '2016-01-08 14:58:43', '2016-01-11 06:46:01'),
(178, 91, '1025 Prk. Sibuyas, Gredu Panabo City', '8105', '', 'permanent', '2016-01-08 14:58:43', '2016-01-11 06:46:01'),
(179, 92, 'Blk 13, Lot 3, Country Homes Subd., Brgy. New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 14:59:29', '2016-01-11 06:55:48'),
(180, 92, 'Blk 13, Lot 3, Country Homes Subd., Brgy. New Visayas, Panabo City', '8105', '', 'permanent', '2016-01-08 14:59:30', '2016-01-11 06:55:48'),
(181, 93, '', '', '', 'residential', '2016-01-08 15:00:34', '2016-01-08 15:00:34'),
(182, 93, '', '', '', 'permanent', '2016-01-08 15:00:34', '2016-01-08 15:00:34'),
(183, 94, 'Blk. 2, Lot 22, Monica Homes, New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 15:02:04', '2016-01-12 02:41:02'),
(184, 94, 'Blk. 2, Lot 22, Monica Homes, New Visayas, Panabo City', '8105', '', 'permanent', '2016-01-08 15:02:04', '2016-01-12 02:41:02'),
(185, 95, '', '', '', 'residential', '2016-01-08 15:02:53', '2016-01-08 15:02:53'),
(186, 95, '', '', '', 'permanent', '2016-01-08 15:02:53', '2016-01-08 15:02:53'),
(187, 96, 'Purok 3-A, Southern Davao, Panabo City, Davao del Norte', '8105', '', 'residential', '2016-01-08 15:04:14', '2016-01-12 05:31:53'),
(188, 96, 'Purok 3-A, Southern Davao, Panabo City, Davao del Norte', '8105', '', 'permanent', '2016-01-08 15:04:14', '2016-01-12 05:31:53'),
(189, 97, 'BLK. 18 Lot 18 - E, Atrivido St., Via Vida Townhomes, Datu Abdul, Panabo City', '8105', '', 'residential', '2016-01-08 15:05:29', '2016-01-12 06:12:55'),
(190, 97, 'BLK. 18 Lot 18 - E, Atrivido St., Via Vida Townhomes, Datu Abdul, Panabo City', '8105', '', 'permanent', '2016-01-08 15:05:29', '2016-01-12 06:12:55'),
(191, 98, '80-2 Rizal Extension, PC Compound, Brgy. 38-D, Davao City', '8000', '', 'residential', '2016-01-08 15:07:28', '2016-01-12 06:17:19'),
(192, 98, '80-2 Rizal Extension, PC Compound, Brgy. 38-D, Davao City', '8000', '', 'permanent', '2016-01-08 15:07:28', '2016-01-12 06:17:19'),
(193, 99, '074 Isabela Homes, Brgy. New Visayas, Panabo City, Davao del Norte', '8105', '', 'residential', '2016-01-08 15:08:31', '2016-01-12 06:45:06'),
(194, 99, '1615 Gavina Subd. Brgy. Sto Nino, Panabo City, Davao del Norte', '8105', '', 'permanent', '2016-01-08 15:08:31', '2016-01-12 06:45:06'),
(195, 100, 'Blk 4, Lot 16 Sereno St., Via Vida Homes, Datu Abdul, Panabo City', '8105', '', 'residential', '2016-01-08 15:09:30', '2016-01-12 03:21:26'),
(196, 100, 'Blk 4, Lot 16 Sereno St., Via Vida Homes, Datu Abdul, Panabo City', '8105', '', 'permanent', '2016-01-08 15:09:30', '2016-01-12 03:21:26'),
(197, 101, '', '', '', 'residential', '2016-01-08 15:12:00', '2016-01-08 15:12:00'),
(198, 101, '', '', '', 'permanent', '2016-01-08 15:12:00', '2016-01-08 15:12:00'),
(199, 102, 'Blk 4 LOT 27 Sharaville Subdivision, New Visayas, Panabo City, Philippines', '8105', '', 'residential', '2016-01-08 15:13:54', '2016-01-11 07:27:34'),
(200, 102, 'Blk 4 LOT 27 Sharaville Subdivision, New Visayas, Panabo City, PhilippinesBlk 4 LOT 27 Sharaville Subdivision, New Visayas, Panabo City, Philippines', '8105', '', 'permanent', '2016-01-08 15:13:55', '2016-01-11 07:27:34'),
(201, 103, '', '', '', 'residential', '2016-01-08 15:14:55', '2016-01-08 15:14:55'),
(202, 103, '', '', '', 'permanent', '2016-01-08 15:14:55', '2016-01-08 15:14:55'),
(203, 104, '', '', '', 'residential', '2016-01-08 15:15:57', '2016-01-08 15:15:57'),
(204, 104, '', '', '', 'permanent', '2016-01-08 15:15:57', '2016-01-08 15:15:57'),
(205, 105, 'DNSC New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 15:18:07', '2016-01-12 05:34:48'),
(206, 105, 'DNSC New Visayas, Panabo City', '8105', '', 'permanent', '2016-01-08 15:18:07', '2016-01-12 05:34:48'),
(207, 106, 'Purok 17, Blk 3 - Lot 4, New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 15:20:40', '2016-01-11 06:37:32'),
(208, 106, 'Purok 4, Poblacion, Naawan, Misamis Oriental', '9023', '', 'permanent', '2016-01-08 15:20:40', '2016-01-11 06:37:32'),
(209, 107, 'New Visayas, Panabo City', '8105', '', 'residential', '2016-01-08 15:21:42', '2016-02-04 13:56:51'),
(210, 107, 'BIDCOR, Bayugan City, Agusan Del Sur', '8502', '092071363635', 'permanent', '2016-01-08 15:21:42', '2016-02-04 13:56:51'),
(211, 108, '', '', '', 'residential', '2016-01-08 15:28:11', '2016-01-08 15:28:11'),
(212, 108, '', '', '', 'permanent', '2016-01-08 15:28:11', '2016-01-08 15:28:11'),
(215, 110, 'DNSC Compound New Visayas Panabo City', '8105', '', 'residential', '2016-01-14 01:57:00', '2016-01-14 01:57:00'),
(216, 110, 'DNSC Compound New Visayas Panabo City', '8105', '', 'permanent', '2016-01-14 01:57:00', '2016-01-14 01:57:00'),
(217, 111, 'Prk . 4 Salvacion Panabo City', '8105', '', 'residential', '2016-01-15 02:46:42', '2016-01-15 03:33:39'),
(218, 111, 'Prk . 4 Salvacion Panabo City', '8105', '', 'permanent', '2016-01-15 02:46:42', '2016-01-15 03:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_approval_heirarchies`
--

CREATE TABLE IF NOT EXISTS `hris_employee_approval_heirarchies` (
`id` int(11) NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `recommending_approval_id` int(10) unsigned DEFAULT NULL,
  `approved_by_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hris_employee_approval_heirarchies`
--

INSERT INTO `hris_employee_approval_heirarchies` (`id`, `employee_id`, `recommending_approval_id`, `approved_by_id`, `created_at`, `updated_at`) VALUES
(1, 11, NULL, 67, '2016-02-03 03:27:23', '2016-02-03 03:27:23'),
(2, 10, NULL, 67, '2016-01-08 15:23:20', '2016-01-08 15:23:20'),
(3, 12, NULL, 67, '2016-02-03 03:27:34', '2016-02-03 03:27:34'),
(4, 67, NULL, 22, '2016-01-08 15:24:12', '2016-01-08 15:24:12'),
(5, 14, NULL, 67, '2016-02-03 03:28:10', '2016-02-03 03:28:10'),
(6, 13, NULL, 67, '2016-02-03 03:27:48', '2016-02-03 03:27:48'),
(7, 5, NULL, 67, '2016-02-03 03:27:59', '2016-02-03 03:27:59'),
(8, 68, NULL, 67, '2016-02-03 03:27:01', '2016-02-03 03:27:01'),
(9, 107, 15, 9, '2016-01-08 15:26:55', '2016-01-08 15:26:55'),
(10, 108, 15, 9, '2016-01-08 15:28:28', '2016-01-08 15:28:28'),
(11, 106, 92, 9, '2016-01-08 15:29:01', '2016-01-08 15:29:01'),
(12, 105, 15, 9, '2016-01-08 15:29:44', '2016-01-08 15:29:44'),
(13, 104, 21, 9, '2016-01-08 15:30:18', '2016-01-08 15:30:18'),
(14, 19, 15, 9, '2016-01-08 15:31:08', '2016-01-08 15:31:08'),
(15, 103, 15, 9, '2016-01-08 15:31:38', '2016-01-08 15:31:38'),
(16, 101, 15, 9, '2016-01-08 15:32:09', '2016-01-08 15:32:09'),
(17, 102, 15, 9, '2016-01-08 15:32:35', '2016-01-08 15:32:35'),
(18, 100, 91, 9, '2016-01-08 15:33:03', '2016-01-08 15:33:03'),
(19, 99, 15, 9, '2016-01-08 15:33:29', '2016-01-08 15:33:29'),
(20, 98, 15, 9, '2016-01-08 15:34:02', '2016-01-08 15:34:02'),
(21, 18, 91, 9, '2016-01-08 15:34:30', '2016-01-08 15:34:30'),
(22, 97, 91, 9, '2016-01-08 15:34:52', '2016-01-08 15:34:52'),
(23, 96, 91, 9, '2016-01-08 15:35:20', '2016-01-08 15:35:20'),
(24, 15, NULL, 9, '2016-01-08 15:35:43', '2016-01-08 15:35:43'),
(25, 95, 91, 9, '2016-01-08 15:36:08', '2016-01-08 15:36:08'),
(26, 94, 91, 9, '2016-01-08 15:36:30', '2016-01-08 15:36:30'),
(27, 93, 15, 9, '2016-01-08 15:37:24', '2016-01-08 15:37:24'),
(28, 92, NULL, 9, '2016-01-08 15:37:58', '2016-01-08 15:37:58'),
(29, 91, NULL, 9, '2016-01-08 15:38:20', '2016-01-08 15:38:20'),
(30, 21, NULL, 22, '2016-01-08 15:38:41', '2016-01-08 15:38:41'),
(31, 90, 17, 7, '2016-01-08 15:40:10', '2016-01-08 15:40:10'),
(32, 89, 17, 7, '2016-01-08 15:40:43', '2016-01-08 15:40:43'),
(33, 88, 17, 7, '2016-01-08 15:41:06', '2016-01-08 15:41:06'),
(34, 87, 17, 7, '2016-01-08 15:41:32', '2016-01-08 15:41:32'),
(35, 86, 17, 7, '2016-01-08 15:42:00', '2016-01-08 15:42:00'),
(36, 85, 17, 7, '2016-01-08 15:42:27', '2016-01-08 15:42:27'),
(37, 84, 17, 7, '2016-01-08 15:43:12', '2016-01-08 15:43:12'),
(38, 17, NULL, 7, '2016-01-08 15:43:34', '2016-01-08 15:43:34'),
(39, 7, NULL, 22, '2016-01-08 15:43:54', '2016-01-08 15:43:54'),
(40, 83, 17, 7, '2016-01-08 15:44:46', '2016-01-08 15:44:46'),
(41, 82, 17, 7, '2016-01-08 15:45:21', '2016-01-08 15:45:21'),
(42, 64, NULL, 20, '2016-01-08 15:47:55', '2016-01-08 15:47:55'),
(43, 65, NULL, 20, '2016-01-08 15:48:18', '2016-01-08 15:48:18'),
(44, 20, NULL, 22, '2016-01-08 15:48:40', '2016-01-08 15:48:40'),
(45, 66, NULL, 20, '2016-01-08 15:49:02', '2016-01-08 15:49:02'),
(46, 6, NULL, 22, '2016-01-08 15:49:36', '2016-01-08 15:49:36'),
(47, 69, 70, 6, '2016-01-08 15:50:12', '2016-01-08 15:50:12'),
(48, 70, NULL, 6, '2016-01-08 15:50:55', '2016-01-08 15:50:55'),
(49, 71, 70, 6, '2016-01-08 15:51:28', '2016-01-08 15:51:28'),
(50, 72, 70, 6, '2016-01-08 15:51:54', '2016-01-08 15:51:54'),
(51, 73, 70, 6, '2016-01-08 15:52:26', '2016-01-08 15:52:26'),
(52, 74, 70, 6, '2016-01-08 15:52:52', '2016-01-08 15:52:52'),
(53, 75, 70, 6, '2016-01-08 15:53:18', '2016-01-08 15:53:18'),
(54, 76, 70, 6, '2016-01-08 15:53:47', '2016-01-08 15:53:47'),
(55, 77, 70, 6, '2016-01-08 15:54:44', '2016-01-08 15:54:44'),
(56, 78, 70, 6, '2016-01-08 15:55:15', '2016-01-08 15:55:15'),
(57, 79, 70, 6, '2016-01-08 15:55:40', '2016-01-08 15:55:40'),
(58, 80, 70, 6, '2016-01-08 15:56:15', '2016-01-08 15:56:15'),
(59, 81, 70, 6, '2016-01-08 15:56:44', '2016-01-08 15:56:44'),
(60, 9, NULL, 22, '2016-01-09 11:42:18', '2016-01-09 11:42:18'),
(61, 16, NULL, 22, '2016-02-03 03:26:48', '2016-02-03 03:26:48'),
(62, 23, NULL, 22, '2016-02-04 12:23:46', '2016-02-04 12:23:46'),
(63, 28, 2, 23, '2016-02-04 12:32:49', '2016-02-04 12:32:49'),
(64, 42, 2, 23, '2016-02-04 12:33:05', '2016-02-04 12:33:05'),
(65, 34, 2, 23, '2016-02-04 12:33:24', '2016-02-04 12:33:24'),
(66, 33, 2, 23, '2016-02-04 12:33:41', '2016-02-04 12:33:41'),
(67, 32, 2, 23, '2016-02-04 12:33:57', '2016-02-04 12:33:57'),
(68, 4, 20, 22, '2016-02-04 12:34:21', '2016-02-04 12:34:21'),
(69, 50, 21, 23, '2016-02-04 12:34:56', '2016-02-04 12:34:56'),
(70, 37, 21, 23, '2016-02-04 12:35:16', '2016-02-04 12:35:16'),
(71, 31, 14, 23, '2016-02-04 12:35:46', '2016-02-04 12:35:46'),
(72, 26, 14, 23, '2016-02-04 12:36:04', '2016-02-04 12:36:04'),
(73, 2, NULL, 22, '2016-02-04 12:38:20', '2016-02-04 12:38:20');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_child`
--

CREATE TABLE IF NOT EXISTS `hris_employee_child` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_child`
--

INSERT INTO `hris_employee_child` (`id`, `employee_id`, `name`, `birthday`, `created_at`, `updated_at`) VALUES
(1, 4, 'Rio Paulo T. Baba', '1998-04-26', '2016-01-04 19:02:43', '2016-01-04 19:02:43'),
(2, 4, 'Aubrey Maye T. Baba', '1992-10-15', '2016-01-04 19:02:43', '2016-01-04 19:02:43'),
(3, 4, 'Rio Lynne T. Baba', '1990-11-26', '2016-01-04 19:02:43', '2016-01-04 19:02:43'),
(4, 4, 'Rio Lane T. Baba', '1990-11-26', '2016-01-04 19:02:43', '2016-01-04 19:02:43'),
(5, 5, 'Rhyz Anthoinee A. Hicale', '0000-00-00', '2016-01-04 19:27:56', '2016-01-04 19:27:56'),
(6, 5, 'Frenzy Rhyn A. Hicale', '2000-01-26', '2016-01-04 19:27:56', '2016-01-04 19:27:56'),
(7, 6, 'Joanna Rose B. Saligan', '1997-03-05', '2016-01-04 19:47:14', '2016-01-04 19:47:14'),
(8, 6, 'John Christopher B. Saligan', '1989-06-29', '2016-01-04 19:47:14', '2016-01-04 19:47:14'),
(9, 6, 'Wendell Philip B. Saligan', '1986-12-07', '2016-01-04 19:47:14', '2016-01-04 19:47:14'),
(10, 7, 'Glenn Vergara Gonzales', '1981-10-31', '2016-01-04 21:58:15', '2016-01-04 21:58:15'),
(11, 7, 'Dara Faye Gonzales Alicando', '1977-02-26', '2016-01-04 21:58:15', '2016-01-04 21:58:15'),
(12, 9, 'Romel Bryan S. Abarquez', '1981-08-15', '2016-01-04 22:05:28', '2016-01-04 22:05:28'),
(13, 10, 'Lian Henri A. Gameng', '2007-05-09', '2016-01-04 22:19:31', '2016-01-04 22:19:31'),
(14, 10, 'Harvey Lander A. Gameng', '2004-11-01', '2016-01-04 22:19:31', '2016-01-04 22:19:31'),
(15, 11, 'Rhandy Joseph S. Bedoya', '2006-06-24', '2016-01-05 19:43:56', '2016-01-05 19:43:56'),
(16, 11, 'Rexilee Shayne S. Bedoya', '2000-01-11', '2016-01-05 19:43:56', '2016-01-05 19:43:56'),
(17, 13, 'Zeth Ian Delos Reyes', '2011-03-19', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(18, 13, 'Lianne Claire Delos Reyes', '2009-11-14', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(19, 14, 'Gamao , Marie Mickaellah Alexandrouva', '2003-01-05', '2016-01-05 20:52:55', '2016-01-05 20:52:55'),
(20, 15, 'Khryss Dale Ryve Lumaday', '2003-06-30', '2016-01-05 21:41:37', '2016-01-05 21:41:37'),
(21, 15, 'Lord Van Ryve Lumaday', '1998-01-31', '2016-01-05 21:41:37', '2016-01-05 21:41:37'),
(22, 17, 'Kristoffer Robin R. Raiz', '1997-08-06', '2016-01-05 22:12:38', '2016-01-05 22:12:38'),
(23, 18, 'Dianna Jane D. Centina', '2003-01-13', '2016-01-05 22:38:52', '2016-01-05 22:38:52'),
(24, 18, 'Christian Jane D. Centina', '1989-09-29', '2016-01-05 22:38:52', '2016-01-05 22:38:52'),
(25, 18, 'Lisa Jane D. Centina', '1988-06-04', '2016-01-05 22:38:52', '2016-01-05 22:38:52'),
(26, 19, 'Kyla Cielo Bernaldez', '2002-01-07', '2016-01-05 22:51:22', '2016-01-05 22:51:22'),
(27, 19, 'Caressha Faye Bernaldez', '1998-10-28', '2016-01-05 22:51:22', '2016-01-05 22:51:22'),
(28, 21, 'Karla Angela S. Gumanao', '1993-01-19', '2016-01-05 23:51:59', '2016-01-05 23:51:59'),
(29, 21, 'Kristine Joy S. Gumanao', '1990-12-24', '2016-01-05 23:51:59', '2016-01-05 23:51:59'),
(32, 106, 'Prince Ezekiel E. Alipoyo', '2004-10-12', '2016-01-11 06:37:32', '2016-01-11 06:37:32'),
(33, 106, 'Prince Everiel E. Alipoyo', '2003-08-18', '2016-01-11 06:37:32', '2016-01-11 06:37:32'),
(34, 106, 'Princess Gwneth E. Alipoyo', '2001-06-13', '2016-01-11 06:37:32', '2016-01-11 06:37:32'),
(35, 91, 'Allan A. Indie', '1975-04-29', '2016-01-11 06:46:01', '2016-01-11 06:46:01'),
(36, 92, 'Allyn P. Tejada', '2004-05-28', '2016-01-11 06:55:48', '2016-01-11 06:55:48'),
(37, 92, 'Art P. Tejada', '2002-08-08', '2016-01-11 06:55:48', '2016-01-11 06:55:48'),
(38, 92, 'Warren P. Tejada', '1999-07-04', '2016-01-11 06:55:48', '2016-01-11 06:55:48'),
(39, 92, 'Albert Ian P. Tejada', '1997-09-14', '2016-01-11 06:55:49', '2016-01-11 06:55:49'),
(40, 75, 'Serem D. Sotomil', '1994-02-25', '2016-01-11 07:17:02', '2016-01-11 07:17:02'),
(41, 75, 'Sara Mae D. Sotomil', '1992-05-06', '2016-01-11 07:17:02', '2016-01-11 07:17:02'),
(42, 75, 'Maria Stephanie D. Sotomil', '1989-05-17', '2016-01-11 07:17:02', '2016-01-11 07:17:02'),
(43, 71, 'Candice B. Manuales', '1992-01-12', '2016-01-11 07:31:09', '2016-01-11 07:31:09'),
(44, 71, 'Abbe B. Manuales', '1989-08-05', '2016-01-11 07:31:09', '2016-01-11 07:31:09'),
(45, 71, 'Vankie B. Manuales', '1986-02-17', '2016-01-11 07:31:09', '2016-01-11 07:31:09'),
(46, 71, 'Aiza Lee B. Manuales', '1982-03-26', '2016-01-11 07:31:09', '2016-01-11 07:31:09'),
(47, 94, 'Daryl John A. Valiente', '2001-07-24', '2016-01-12 02:41:02', '2016-01-12 02:41:02'),
(48, 94, 'Irish Jane A. Valiente', '1996-01-27', '2016-01-12 02:41:02', '2016-01-12 02:41:02'),
(49, 94, 'Jasmine Jeanne A. Valiente', '1995-01-25', '2016-01-12 02:41:02', '2016-01-12 02:41:02'),
(50, 77, 'Prinze Feran F. Ranara', '2001-05-16', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(51, 77, 'Liam Eanzo Angelo F. Ranara', '2011-06-28', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(52, 100, 'Jerry Mishael B. Torrejos', '2009-06-08', '2016-01-12 03:21:26', '2016-01-12 03:21:26'),
(53, 100, 'Jemiah Heart B. Torrejos', '2004-05-30', '2016-01-12 03:21:26', '2016-01-12 03:21:26'),
(54, 100, 'Chesedh Jese B. Torrejos', '2003-06-01', '2016-01-12 03:21:26', '2016-01-12 03:21:26'),
(55, 105, 'Josh Irvinson C. Sanatamaria', '2006-07-18', '2016-01-12 05:34:48', '2016-01-12 05:34:48'),
(56, 97, 'Kirstel Joy L. Picar', '1997-08-22', '2016-01-12 06:12:55', '2016-01-12 06:12:55'),
(57, 97, 'Kerl Andreu L. Picar', '1996-08-22', '2016-01-12 06:12:55', '2016-01-12 06:12:55'),
(58, 99, 'Nicole Pauleen D. Fuentes', '2004-11-05', '2016-01-12 06:45:06', '2016-01-12 06:45:06'),
(59, 99, 'Reizle Jade D. Fuentes', '1999-07-08', '2016-01-12 06:45:06', '2016-01-12 06:45:06'),
(60, 86, 'Thessa Angela E. Floro', '2005-09-12', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(61, 86, 'Micah Angela E. Floro', '2005-09-12', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(62, 86, 'Jedo E. Floro', '1999-05-11', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(63, 86, 'Jeco E. Floro', '1999-05-11', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(64, 86, 'Jeref E. Floro', '1991-10-07', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(68, 69, 'Jewel Dan V. Aba (DECEASED)', '1994-10-28', '2016-01-12 07:08:30', '2016-01-12 07:08:30'),
(69, 69, 'Danica Charieze V. Aba', '1991-09-07', '2016-01-12 07:08:30', '2016-01-12 07:08:30'),
(70, 69, 'Gregy Lito V. Aba', '1990-03-25', '2016-01-12 07:08:30', '2016-01-12 07:08:30'),
(71, 28, 'Klyde Alain E. Benigno', '1999-02-04', '2016-01-14 01:07:23', '2016-01-14 01:07:23'),
(72, 28, 'Katrina Aprei Fel E. Benigno', '1993-07-29', '2016-01-14 01:07:23', '2016-01-14 01:07:23'),
(73, 28, 'Kenny Allan II E. Benigno', '1991-02-14', '2016-01-14 01:07:23', '2016-01-14 01:07:23'),
(74, 26, 'Kend Laurence Cervantes', '2007-05-24', '2016-01-14 01:10:21', '2016-01-14 01:10:21'),
(75, 26, 'Lance Geo Angeleo Cervantes', '2006-03-29', '2016-01-14 01:10:21', '2016-01-14 01:10:21'),
(76, 35, 'Dionisio M. Padrogane Jr.', '2008-09-14', '2016-01-14 01:17:48', '2016-01-14 01:17:48'),
(77, 35, 'Jackielyn M. Padrogane', '2006-07-27', '2016-01-14 01:17:48', '2016-01-14 01:17:48'),
(78, 35, 'Jhuvilyn M. Padrogane', '1999-10-10', '2016-01-14 01:17:48', '2016-01-14 01:17:48'),
(79, 35, 'Jhunilyn M. Padrogane', '1997-05-04', '2016-01-14 01:17:48', '2016-01-14 01:17:48'),
(80, 35, 'Jherly M. Padrogane', '1995-04-01', '2016-01-14 01:17:48', '2016-01-14 01:17:48'),
(81, 35, 'Jhinily M. Padrogane', '1994-01-22', '2016-01-14 01:17:48', '2016-01-14 01:17:48'),
(82, 35, 'Jhonlie M. Padrogane', '1992-10-05', '2016-01-14 01:17:49', '2016-01-14 01:17:49'),
(83, 57, 'Reymart P. Turno', '1990-11-28', '2016-01-14 01:28:10', '2016-01-14 01:28:10'),
(84, 46, 'Julia Rachel Hope J. Edjec', '2012-10-22', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(85, 46, 'Kyle Jasper J. Edjec', '2006-07-31', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(86, 46, 'Renz Jairus J. Edjec', '2004-12-03', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(87, 50, 'Jeralyn H. Salinas', '1992-09-19', '2016-01-14 01:42:03', '2016-01-14 01:42:03'),
(88, 25, 'Thessa  Angela E. Floro', '2005-09-12', '2016-01-14 01:50:48', '2016-01-14 01:50:48'),
(89, 25, 'Micah Angela E. Floro', '2005-09-12', '2016-01-14 01:50:48', '2016-01-14 01:50:48'),
(90, 25, ' Jedo E. Floro', '1999-05-11', '2016-01-14 01:50:48', '2016-01-14 01:50:48'),
(91, 25, 'Jeco E. Floro', '1999-05-11', '2016-01-14 01:50:48', '2016-01-14 01:50:48'),
(92, 25, 'Jeref E. Floro', '1991-10-07', '2016-01-14 01:50:48', '2016-01-14 01:50:48'),
(94, 110, 'Josh Irvonson C. Santamaria', '2006-07-18', '2016-01-14 01:57:00', '2016-01-14 01:57:00'),
(95, 59, 'Ruby O. Orma', '1993-12-28', '2016-01-14 01:59:07', '2016-01-14 01:59:07'),
(96, 59, 'Ronald O. Orma', '1989-08-20', '2016-01-14 01:59:07', '2016-01-14 01:59:07'),
(97, 59, 'Rowena  O. Orma', '1986-08-26', '2016-01-14 01:59:07', '2016-01-14 01:59:07'),
(98, 33, 'Seth Roseller Martin Aviso', '2003-09-09', '2016-01-14 02:19:42', '2016-01-14 02:19:42'),
(99, 33, 'Syrus Dominic Martin Aviso', '2001-05-29', '2016-01-14 02:19:42', '2016-01-14 02:19:42'),
(100, 33, 'Sandy Rose Martin Aviso', '1996-09-15', '2016-01-14 02:19:42', '2016-01-14 02:19:42'),
(101, 36, 'Juluis Kleint L. Catane', '2001-04-13', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(102, 36, 'Jules Kenn L. Catane', '1999-10-10', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(103, 36, 'Syrine Joy L. Catane', '1992-04-30', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(106, 34, 'Eldy John Melicor Garbosa', '1996-04-27', '2016-01-14 02:43:44', '2016-01-14 02:43:44'),
(107, 39, 'Philip JamesM. Glimada', '1989-02-11', '2016-01-14 02:54:55', '2016-01-14 02:54:55'),
(108, 39, 'Jonnamil M. Glimada', '1986-06-01', '2016-01-14 02:54:55', '2016-01-14 02:54:55'),
(109, 47, 'Elliah Joise Melicor Garbos', '1999-12-19', '2016-01-14 03:07:06', '2016-01-14 03:07:06'),
(110, 47, 'Eldy John Melicor Garbos', '1996-04-27', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(111, 38, 'Jennifer L. ganadores', '1988-02-19', '2016-01-14 03:08:32', '2016-01-14 03:08:32'),
(112, 38, 'Rey L. Ganadores', '1990-08-19', '2016-01-14 03:08:32', '2016-01-14 03:08:32'),
(113, 38, 'Conrado L. Ganadores Jr.', '1992-11-19', '2016-01-14 03:08:32', '2016-01-14 03:08:32'),
(114, 32, 'Leah Jenny B. Cabag ', '2008-12-29', '2016-01-14 03:38:32', '2016-01-14 03:38:32'),
(115, 32, 'Jumer B. Cabag', '2000-03-04', '2016-01-14 03:38:32', '2016-01-14 03:38:32'),
(116, 55, 'Jhon Mark A. Arceno', '1997-12-03', '2016-01-14 06:03:25', '2016-01-14 06:03:25'),
(117, 62, 'Niel S. Cebo', '1996-02-28', '2016-01-14 06:23:18', '2016-01-14 06:23:18'),
(118, 62, 'Nelson S. Cerbo Jr', '1989-03-15', '2016-01-14 06:23:18', '2016-01-14 06:23:18'),
(119, 62, 'Mia S. Cerbo', '1997-09-24', '2016-01-14 06:23:19', '2016-01-14 06:23:19'),
(120, 31, 'Niel S. Cerbo', '1996-02-28', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(121, 31, 'Nelson S. Cerbo Jr.', '1989-03-15', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(122, 31, 'Mia S. Cerbo', '1987-09-24', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(125, 49, 'Jun Rey Mendez', '1984-06-14', '2016-01-14 07:40:35', '2016-01-14 07:40:35'),
(127, 49, 'Janice Mendez', '1982-12-27', '2016-01-14 07:40:35', '2016-01-14 07:40:35'),
(128, 58, 'Mary Mae Mandoza', '1997-11-25', '2016-01-15 02:38:37', '2016-01-15 02:38:37'),
(129, 58, 'Maxiline Marie Mendoza', '1994-07-13', '2016-01-15 02:38:37', '2016-01-15 02:38:37'),
(130, 42, 'Jester Jun S. Namuag', '1991-10-04', '2016-01-15 03:06:19', '2016-01-15 03:06:19'),
(131, 42, 'Caryl S. Namuag', '1985-02-18', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(132, 41, 'Rhea Petilona', '1986-07-22', '2016-01-15 03:22:59', '2016-01-15 03:22:59'),
(133, 41, 'Rosennie Petilona', '1981-06-08', '2016-01-15 03:22:59', '2016-01-15 03:22:59'),
(134, 41, 'Renalyn Peilona', '1977-06-14', '2016-01-15 03:22:59', '2016-01-15 03:22:59'),
(136, 111, 'Ryckllan B. Rafil', '2003-04-13', '2016-01-15 03:35:05', '2016-01-15 03:35:05'),
(137, 53, 'Jewel Anne', '2011-03-03', '2016-02-04 13:52:46', '2016-02-04 13:52:46'),
(138, 53, 'Brian Anthony', '2006-02-23', '2016-02-04 13:52:46', '2016-02-04 13:52:46'),
(139, 53, 'Jan Marc', '2001-10-09', '2016-02-04 13:52:46', '2016-02-04 13:52:46'),
(140, 83, 'Maricar M. Rubi199', '1996-06-02', '2016-02-05 15:03:28', '2016-02-05 15:03:28'),
(141, 83, 'Earl Dan M. Rubi ', '1994-03-12', '2016-02-05 15:03:28', '2016-02-05 15:03:28');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_civil_services`
--

CREATE TABLE IF NOT EXISTS `hris_employee_civil_services` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `career_service` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rating` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `examination_date` date NOT NULL,
  `examination_place` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `license_number` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `release_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_civil_services`
--

INSERT INTO `hris_employee_civil_services` (`id`, `employee_id`, `career_service`, `rating`, `examination_date`, `examination_place`, `license_number`, `release_date`, `created_at`, `updated_at`) VALUES
(1, 4, 'Librarian Licensure Examination', '78.00', '0000-00-00', 'Professional Regulation Commission, Manila', '807', '2010-07-27', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(2, 4, 'Civil Service Eligibility (PROF)', '80.00', '0000-00-00', 'Mag-ugpo Central Elementary School, Tagum City', '', '0000-00-00', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(3, 4, 'Philippine Board Examination For Teachers', '73.00', '0000-00-00', 'Davao City', '0483288', '2010-08-24', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(4, 6, 'Fisheries Technologist (PRC)', '75.00', '2007-10-02', 'Davao City', '0000892', '2008-03-19', '2016-01-04 19:47:14', '2016-01-04 19:47:14'),
(5, 6, 'Fishery Biologist', '79.00', '1980-11-16', 'Iloilo City', '', '0000-00-00', '2016-01-04 19:47:14', '2016-01-04 19:47:14'),
(6, 6, 'Career Service Professional ', '78.00', '1979-06-17', 'Tagum, Davao Del Norte', '', '0000-00-00', '2016-01-04 19:47:14', '2016-01-04 19:47:14'),
(7, 6, 'Professional Board Examination for Teachers', '76.00', '1979-04-29', 'Davao City', '0175135', '1997-10-17', '2016-01-04 19:47:15', '2016-01-04 19:47:15'),
(8, 7, 'Professional Board for Teachers', '80.00', '1984-11-05', 'Davao City', '0392920', '1998-07-01', '2016-01-04 21:58:15', '2016-01-04 21:58:15'),
(9, 9, 'Career Service Professional ', '72.00', '1983-07-17', 'Tandag, Surigao Del Sur', '', '0000-00-00', '2016-01-04 22:05:28', '2016-01-04 22:05:28'),
(10, 10, 'Civil Service Professional Exam', '90.00', '1996-08-30', 'Davao City High School / Davao City', '', '0000-00-00', '2016-01-04 22:19:31', '2016-01-04 22:19:31'),
(11, 10, 'Civil Service Subprofessional Exam', '88.00', '1994-01-24', 'Davao City High School / Davao City', '', '0000-00-00', '2016-01-04 22:19:31', '2016-01-04 22:19:31'),
(13, 12, 'Civil Service Prof.', '85.00', '0000-00-00', 'Davao City', '', '0000-00-00', '2016-01-05 19:59:44', '2016-01-05 19:59:44'),
(14, 13, 'Civil Service Professional', '80.00', '1998-11-08', 'Davao City', '', '0000-00-00', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(15, 15, 'Professional Board Exam. For Teacher ', '78.00', '1988-11-27', 'Davao City ', '016016', '1989-06-20', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(16, 15, 'Carrer Service Professsional ', '71.00', '1988-07-31', 'Davao City', '29787', '1989-03-03', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(17, 16, 'Licensure Exam for Teachers', '83.00', '2010-01-07', 'PRC - Davao', '1082880', '2010-11-15', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(18, 16, 'Career Service Professional ', '91.00', '2000-04-03', 'CSC Regional Office No. XI', '', '2000-04-03', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(19, 17, 'PBET', '75.00', '1989-12-10', 'Cotabato City', '', '0000-00-00', '2016-01-05 22:12:39', '2016-01-05 22:12:39'),
(20, 18, 'Professional Board Exam. For Teacher''s', '82.00', '1982-11-28', 'Davao City ', '', '0000-00-00', '2016-01-05 22:38:53', '2016-01-05 22:38:53'),
(21, 18, 'Civel Service Professional Exam', '76.00', '1982-12-17', 'Davao City ', '', '0000-00-00', '2016-01-05 22:38:53', '2016-01-05 22:38:53'),
(22, 18, 'Civil Service Sub Professional Exam', '87.00', '1980-06-30', 'Davao City ', 'N/A', '2016-01-06', '2016-01-05 22:38:53', '2016-01-05 22:38:53'),
(23, 20, 'Career Service Subprofessional Examination', '86.00', '1995-12-17', 'Davao City National High School', '', '1996-02-06', '2016-01-05 23:33:03', '2016-01-05 23:33:03'),
(24, 20, 'Career Service Professional Examination', '82.00', '1996-12-01', 'San Pedro College, Davao City', '', '1997-01-10', '2016-01-05 23:33:03', '2016-01-05 23:33:03'),
(25, 20, 'Licensure Exam for Teachers', '79.00', '1996-08-23', 'Davao City National High School', '0012755', '1996-12-17', '2016-01-05 23:33:03', '2016-01-05 23:33:03'),
(26, 21, 'PBET', '76.00', '1988-11-28', 'UM Davao City', '0349235', '1998-04-14', '2016-01-05 23:51:59', '2016-01-05 23:51:59'),
(27, 70, 'Professional Board Exam. For Teachers', '75.75', '1989-12-10', 'Tandag, Surigao del Sur', '', '1990-06-04', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(28, 70, 'Career Service Professional Examination', '80', '1989-07-30', 'Tandag, Surigao del Sur', '', '1989-12-22', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(31, 106, 'Career Service Subprofessional Examination', '89.01', '1998-02-01', 'Cagayan de Oro City', '', '0000-00-00', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(32, 91, 'Licensure Exam for Teacher', '83.60', '1996-08-24', 'davao City', '00120662', '1996-12-16', '2016-01-11 06:46:01', '2016-01-11 06:46:01'),
(33, 91, 'Prof. Board Exam for Teachers', '80.49', '1981-11-08', 'General Santos City', '', '0000-00-00', '2016-01-11 06:46:01', '2016-01-11 06:46:01'),
(34, 91, 'Career Service Prof', '80', '1981-12-06', 'Koronadal South Cotabato', '', '0000-00-00', '2016-01-11 06:46:01', '2016-01-11 06:46:01'),
(35, 91, 'Career Service Subprof', '83.60', '1979-06-17', 'Koronadal South Cotabato', '', '0000-00-00', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(36, 92, 'Professional Board Exam. For Teacher ', '73.26', '1995-05-28', 'Davao City', '951868611P', '1995-12-08', '2016-01-11 06:55:49', '2016-01-11 06:55:49'),
(37, 92, 'Civil Service Exam', '80.50', '1991-12-09', 'Holy Cross of Davao College', '214439', '1992-07-17', '2016-01-11 06:55:49', '2016-01-11 06:55:49'),
(38, 87, 'Career Service Sub-Professional', '81.97', '1995-04-23', 'Mati, Davao Oriental', '', '0000-00-00', '2016-01-11 07:07:41', '2016-01-11 07:07:41'),
(39, 87, 'Career Service Professional ', '83.33', '2007-10-28', 'davao City', '', '0000-00-00', '2016-01-11 07:07:41', '2016-01-11 07:07:41'),
(40, 87, 'Licensure Examination for Teachers', '81', '2008-09-28', 'davao City', '100984', '2013-01-21', '2016-01-11 07:07:41', '2016-01-11 07:07:41'),
(41, 75, 'Professional Board Exam. For Teachers ', '71.02', '1989-12-10', 'Davao City ', '072469', '1990-06-04', '2016-01-11 07:17:02', '2016-01-11 07:17:02'),
(42, 75, 'Career Service Subprofessional Examination', '80.56', '1995-02-25', 'St. Mary''s College', 'C11060001', '1995-03-13', '2016-01-11 07:17:02', '2016-01-11 07:17:02'),
(43, 102, 'Career Service Professional Examination', '82.29', '2008-03-09', 'Magallanes Elementary School, Davao City', '05-02176', '2008-05-19', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(44, 102, 'Licensure Exam for Teachers', '80.20', '2006-08-27', 'Brokenshire College, Davao City', '0941358', '2007-02-21', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(45, 71, 'Professional Board Exam. For Teachers', '70', '1984-11-25', 'Davao City ', '', '1985-07-08', '2016-01-11 07:31:10', '2016-01-11 07:31:10'),
(46, 94, 'Career Service (Professional)', '86.76', '1990-08-05', 'Tagum City, Davao del Norte', '', '0000-00-00', '2016-01-12 02:41:03', '2016-01-12 02:41:03'),
(47, 94, 'Philippine Board Exam for Teacher (PBET)', '79.81', '1989-12-10', 'Davao City', '', '0000-00-00', '2016-01-12 02:41:03', '2016-01-12 02:41:03'),
(48, 77, 'Fisheries Technologist Licensure Exam (PRC)', '75', '2003-10-01', 'Manila, Philippines', '', '2003-10-08', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(49, 77, 'Career Service Subprofessional Examination', '84.79', '1996-02-18', 'Davao City', '', '1996-03-08', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(50, 96, 'PBET', '70.70', '1990-11-25', 'Mati, Davao Oriental', '', '2011-12-01', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(51, 96, 'Career Service Professional', '82.56', '1992-07-26', 'Mati, Davao Oriental', '', '0000-00-00', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(52, 97, 'PBET - Teachers Licensure Exam', '80.33', '1994-09-24', 'Cagayan de Oro', '0576863', '0000-00-00', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(53, 97, 'CSC -  Professional Eligibility', '83.92', '1991-07-16', 'Manila', '', '0000-00-00', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(54, 98, 'Professional Board Exam. For Teachers (PBET)', '70.95', '1991-11-10', 'Davao City', 'PRC 0654115', '2000-10-17', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(55, 88, 'Licensure Examination for Teachers', '75', '2006-08-01', 'Matina, Davao City', '0978379', '2006-10-07', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(56, 99, 'Philippine Board Exam for Teachers', '76.48', '1994-05-29', 'Quezon City', '', '0000-00-00', '2016-01-12 06:45:07', '2016-01-12 06:45:07'),
(57, 99, 'CSC Career Service Professional', '83.90', '1993-10-17', 'Quezon City', '', '0000-00-00', '2016-01-12 06:45:07', '2016-01-12 06:45:07'),
(58, 86, 'Licensure Examination for Teachers', '77.20', '1996-08-24', 'Davao City', '', '0000-00-00', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(60, 69, 'Professional Board Exam. For Teachers', '70', '1982-11-01', 'Iloilo City', '', '0000-00-00', '2016-01-12 07:08:30', '2016-01-12 07:08:30'),
(61, 28, 'CS-Prof Eligible', '76.67', '1987-07-26', 'Davao City', '', '0000-00-00', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(62, 28, 'CS Sub-prof Eligible', '76', '1984-10-14', 'Iligan City', '', '0000-00-00', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(63, 26, 'Nursing Licensure Examination ', '82', '1995-12-03', 'Cagayan de Oro City', '0294392', '1996-05-09', '2016-01-14 01:10:21', '2016-01-14 01:10:21'),
(64, 26, 'Nursing Licensure Examination ', '82', '1995-11-30', 'Cagayan de Oro City', '0294392', '1996-05-09', '2016-01-14 01:10:21', '2016-01-14 01:10:21'),
(65, 46, 'Sub-Professional Civil Service Exam', '83.38', '1998-10-22', 'CSC, Davao City', '', '0000-00-00', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(66, 25, 'Fishery Board Examination', '74.36', '1980-11-16', 'Iloilo City', '', '0000-00-00', '2016-01-14 01:50:48', '2016-01-14 01:50:48'),
(67, 25, 'Teachers Board Examination', '72.50', '1979-04-02', 'Iloilo City', '', '0000-00-00', '2016-01-14 01:50:48', '2016-01-14 01:50:48'),
(68, 33, 'Licensure Examination for Teachers (LET)', '73.79', '1999-05-31', 'Zamboanga City', '0557809', '1999-05-31', '2016-01-14 02:19:42', '2016-01-14 02:19:42'),
(71, 34, 'Career Service Subprofessional Examination', '81.69', '1990-08-05', 'San Roque Elementary School, Davao City', '', '1991-01-25', '2016-01-14 02:43:44', '2016-01-14 02:43:44'),
(72, 32, 'Career Service Subprofessional Examination', '72.89', '1980-12-07', 'Tagum City ', '', '0000-00-00', '2016-01-14 03:38:32', '2016-01-14 03:38:32'),
(73, 55, 'National College Entrance Examination (NCEE)', '70', '0000-00-00', 'Panabo Central Elementary School Panabo Davao del Norte', '', '0000-00-00', '2016-01-14 06:03:25', '2016-01-14 06:03:25'),
(74, 31, 'Professional Board Exam. For Teacher ', '74.35', '1992-10-25', 'Davao City', '01151958', '2003-10-03', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(75, 31, 'Career Service Professional Examination', '70.86', '1981-12-06', 'Davao City', '1100070', '1982-07-26', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(76, 31, 'Career Service Subprofessional National', '71.60', '1979-06-17', 'Davao City', '1130436', '1980-05-31', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(77, 31, 'Career Service Subprofessional Local', '71.39', '1977-11-20', 'Tagum, Davao del Norte', '16042077', '1978-03-31', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(78, 42, 'Sub-Professional Civil Service Exam', '80.20', '1997-04-27', 'Tagum Cty, Davao del Norte', '11060444', '1997-05-01', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(79, 83, 'Career Service Professional Examination', '80.78', '1993-10-17', 'davao City', '9-3015704', '1994-01-24', '2016-02-05 15:03:28', '2016-02-05 15:03:28'),
(80, 83, 'PBET', '75.66', '1986-10-26', 'Prosperedad Agusan del Sur', '011116', '1987-05-07', '2016-02-05 15:03:28', '2016-02-05 15:03:28');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_educations`
--

CREATE TABLE IF NOT EXISTS `hris_employee_educations` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `level` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `school` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `degree_course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year_graduated` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `highest_level` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `academic_honors` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_educations`
--

INSERT INTO `hris_employee_educations` (`id`, `employee_id`, `level`, `school`, `degree_course`, `year_graduated`, `highest_level`, `start`, `end`, `academic_honors`, `created_at`, `updated_at`) VALUES
(1, 2, 'college', 'Ateneo De Davao University', 'Bachelor of Science in Acountacy', '2012', '', '0000-00-00', '0000-00-00', '', '2016-01-04 18:40:49', '2016-01-04 18:40:49'),
(2, 2, 'secondary', 'Banaybanay National High School', '', '2008', '', '0000-00-00', '0000-00-00', 'Valedictorian', '2016-01-04 18:40:49', '2016-01-04 18:40:49'),
(3, 2, 'elementary', 'Banaybanay Central Elementary School', '', '2004', '', '0000-00-00', '0000-00-00', 'Salutatirian', '2016-01-04 18:40:49', '2016-01-04 18:40:49'),
(4, 4, 'graduate studies', 'University of Southeastern Philippines (USEP) Davao City', 'MS - LIB. & INFO SCIENCE', '2013', '', '0000-00-00', '0000-00-00', '', '2016-01-04 19:02:43', '2016-01-04 19:02:43'),
(5, 4, 'graduate studies', 'University of Mindanao, Davao City', 'MAED - LIB.SCIE', '', '9 Units', '0000-00-00', '0000-00-00', '', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(6, 4, 'college', 'Cor Jesu College, Digos, Davao del Sur', 'BSE-Library Science', '1988', '', '0000-00-00', '0000-00-00', '', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(7, 4, 'vocational', 'DECS Non-Formal Education, New Visayas, Panabo City', 'Dress-Making', '1993', '', '0000-00-00', '0000-00-00', 'Second Honor', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(8, 4, 'secondary', 'Holy Cross of Kiblawan, Kiblawan, Davao del Sur', 'Secondary', '1984', '', '0000-00-00', '0000-00-00', 'Salutatorian', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(9, 4, 'elementary', 'Tanwalang Elem. School', 'Elementary', '1980', '', '0000-00-00', '0000-00-00', 'First Honor', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(10, 5, 'graduate studies', 'University of Immculate Conception', 'MIT', '2006', '', '0000-00-00', '0000-00-00', '', '2016-01-04 19:27:56', '2016-01-04 19:27:56'),
(11, 5, 'vocational', 'AMA Computer College', 'BSCS', '1998', '', '0000-00-00', '0000-00-00', '', '2016-01-04 19:27:56', '2016-01-04 19:27:56'),
(12, 5, 'secondary', 'Marynoll High School of Panabo', 'Secondary', '1994', '', '0000-00-00', '0000-00-00', '', '2016-01-04 19:27:56', '2016-01-04 19:27:56'),
(13, 5, 'elementary', 'New Malitbog Elementary School ', 'Elementary', '1990', '', '0000-00-00', '0000-00-00', 'Honorable Mention', '2016-01-04 19:27:56', '2016-01-04 19:27:56'),
(14, 6, 'graduate studies', 'University of Mindanao', 'Doctor Education', '2008', '', '0000-00-00', '0000-00-00', '', '2016-01-04 19:47:14', '2016-01-04 19:47:14'),
(15, 6, 'college', 'Mindanao State University', 'BS Fisheries ', '1978', '', '0000-00-00', '0000-00-00', 'Full Scholor', '2016-01-04 19:47:14', '2016-01-04 19:47:14'),
(16, 6, 'secondary', 'Mindanao State University', 'Secondary', '1974', '', '0000-00-00', '0000-00-00', 'With Honor', '2016-01-04 19:47:14', '2016-01-04 19:47:14'),
(17, 6, 'elementary', 'Didialagas West Elementary School', 'Elementary', '1970', '', '0000-00-00', '0000-00-00', 'With Honor', '2016-01-04 19:47:14', '2016-01-04 19:47:14'),
(18, 7, 'graduate studies', 'Davao del Norte State College', 'PH.D EDUC MGT', '2012', '', '0000-00-00', '0000-00-00', '', '2016-01-04 21:58:15', '2016-01-04 21:58:15'),
(19, 7, 'graduate studies', 'St. Mary''s College', 'M.A.E.D English', '2006', '', '0000-00-00', '0000-00-00', '', '2016-01-04 21:58:15', '2016-01-04 21:58:15'),
(20, 7, 'college', 'Magsaysay Memorial Colleges', 'BSE-ENGLISH', '1983', '', '0000-00-00', '0000-00-00', '', '2016-01-04 21:58:15', '2016-01-04 21:58:15'),
(21, 7, 'secondary', 'Southern Baptist College', 'Secondary', '1971', '', '0000-00-00', '0000-00-00', '', '2016-01-04 21:58:15', '2016-01-04 21:58:15'),
(22, 7, 'elementary', 'Carmen Central Elementary School', 'Elementary', '1967', '', '0000-00-00', '0000-00-00', '', '2016-01-04 21:58:15', '2016-01-04 21:58:15'),
(23, 9, 'elementary', 'Telahe, Elementary School, Tandag, Surigao del Sur', 'Elementary', '1971', '', '0000-00-00', '0000-00-00', '', '2016-01-04 22:05:28', '2016-01-04 22:05:28'),
(24, 10, 'graduate studies', 'University of Southeastern Philippines', 'Master in Engineering Program - Major in ECE', '', 'CAR', '0000-00-00', '0000-00-00', '', '2016-01-04 22:19:31', '2016-01-04 22:19:31'),
(25, 10, 'graduate studies', 'Ateneo De Davao University', 'Master in Information Technology', '2013', '', '0000-00-00', '0000-00-00', 'CHED Scholarship', '2016-01-04 22:19:31', '2016-01-04 22:19:31'),
(26, 10, 'college', 'University of Immculate Conception', 'BS in Computer Engineering', '1996', '', '0000-00-00', '0000-00-00', '', '2016-01-04 22:19:31', '2016-01-04 22:19:31'),
(27, 10, 'secondary', 'Davao City High School', 'Secondary', '1991', '', '0000-00-00', '0000-00-00', '', '2016-01-04 22:19:31', '2016-01-04 22:19:31'),
(28, 10, 'elementary', 'Buhangin Central Elementary School', 'Elementary', '1987', '', '0000-00-00', '0000-00-00', 'With Honors', '2016-01-04 22:19:31', '2016-01-04 22:19:31'),
(29, 11, 'graduate studies', 'University of Southeastern Philippines', 'Master in Business Administration', '', '', '0000-00-00', '0000-00-00', '', '2016-01-05 19:43:56', '2016-01-05 19:43:56'),
(30, 11, 'college', 'Cabalum Western College', 'Bachelor of Science in Computer Science', '1997', '', '0000-00-00', '0000-00-00', '', '2016-01-05 19:43:56', '2016-01-05 19:43:56'),
(31, 11, 'secondary', 'Surigao del Sur Institute of Fisheries Aquaculture', '', '1993', '', '0000-00-00', '0000-00-00', '', '2016-01-05 19:43:56', '2016-01-05 19:43:56'),
(32, 11, 'elementary', 'Linga Central Elementary School', '', '1990', '', '0000-00-00', '0000-00-00', 'With Honors', '2016-01-05 19:43:56', '2016-01-05 19:43:56'),
(38, 12, 'elementary', 'Ateneo De Davao University', 'MIT', '', '', '0000-00-00', '0000-00-00', '', '2016-01-05 19:59:44', '2016-01-05 19:59:44'),
(39, 12, 'college', 'PUP', 'BSECE', '1991', '', '0000-00-00', '0000-00-00', '', '2016-01-05 19:59:44', '2016-01-05 19:59:44'),
(40, 12, 'vocational', 'Systems technology Institute', '1 year program', '1992', '', '0000-00-00', '0000-00-00', '', '2016-01-05 19:59:44', '2016-01-05 19:59:44'),
(41, 12, 'secondary', 'Manila Central University', 'Secondary', '1986', '', '0000-00-00', '0000-00-00', '', '2016-01-05 19:59:44', '2016-01-05 19:59:44'),
(42, 12, 'elementary', 'Caruhatan East Elementary School', 'Elementary', '1982', '', '0000-00-00', '0000-00-00', '', '2016-01-05 19:59:44', '2016-01-05 19:59:44'),
(43, 13, 'graduate studies', 'University of Immculate Conception', 'MIT', '2010', '', '0000-00-00', '0000-00-00', '', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(44, 13, 'college', 'University of Immculate Conception', 'BSCOE', '1998', '', '0000-00-00', '0000-00-00', '', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(45, 13, 'secondary', 'Davao del Norte State College', 'Secondary', '1993', '', '0000-00-00', '0000-00-00', '', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(46, 13, 'elementary', 'Panabo Central Elementary School', 'Elementary', '1989', '', '0000-00-00', '0000-00-00', '', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(47, 14, 'graduate studies', 'Davao del Norte State College', 'PHD IN EDM.', '2013', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(48, 14, 'graduate studies', 'University of Southeastern Philippines (USEP) ', 'MSIS', '2005', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(49, 14, 'college', 'Holy Name Univesity ', 'BSCS', '1999', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(50, 14, 'vocational', 'Employment Apprenticeship Network (E.A.R.N)', 'Computer Technology', '1993', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(51, 14, 'secondary', 'Lila National High School', 'Secondary ', '1991', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(52, 14, 'elementary', 'Lila Central Elem. School', 'Elementary', '1988', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(53, 15, 'graduate studies', 'University of Immculate Conception Bonifacio St. Davao City ', 'PH.D in Applied Linguistics', '', '', '0000-00-00', '0000-00-00', '', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(54, 15, 'graduate studies', 'University of Mindanao, Bolton St. Davao City ', 'MAED- Teaching English', '2004', '', '0000-00-00', '0000-00-00', '', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(55, 15, 'college', 'Holy Cross Of Davao College, Sta. Ana Avenue., Davao City ', 'BSED- English', '1991', '', '0000-00-00', '0000-00-00', '', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(56, 15, 'college', 'Holy Cross Of Davao College, Sta. Ana Avenue., Davao City ', 'Bachelor of Arts- English', '1987', '', '0000-00-00', '0000-00-00', '', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(57, 15, 'secondary', 'Holy Cross Of Sulop, Sulop Davao del Sur ', 'Secondary ', '', '', '0000-00-00', '0000-00-00', 'With Honors', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(58, 15, 'elementary', 'Parami Elem.School, Parami, Malalag, Davao del Sur ', 'Elementary', '', '', '0000-00-00', '0000-00-00', 'Valedictorian', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(59, 16, 'graduate studies', 'University of the Philippines - Open University', 'Diploma in Research and Development Management', '2014', '', '0000-00-00', '0000-00-00', '', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(60, 16, 'graduate studies', 'Xavier University (Ateneo de Cagayan)', 'Master of Arts in Educational Management', '2003', '', '0000-00-00', '0000-00-00', '', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(61, 16, 'college', 'University of the Philippines - Diliman (NCPAG)', 'Bachelor of Arts Public Administration', '1999', '', '0000-00-00', '0000-00-00', '', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(62, 16, 'secondary', 'St. Mary''s College', '', '1995', '', '0000-00-00', '0000-00-00', 'With Honors', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(63, 16, 'elementary', 'St. Mary''s College', '', '1991', '', '0000-00-00', '0000-00-00', 'With Honors', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(64, 17, 'graduate studies', 'Ateneo De Davao University', 'PHD ED. Ad', '', '', '0000-00-00', '0000-00-00', '', '2016-01-05 22:12:38', '2016-01-05 22:12:38'),
(65, 17, 'graduate studies', 'University of Southeastern Mindanao', 'MPS-DE', '1993', '', '0000-00-00', '0000-00-00', '', '2016-01-05 22:12:38', '2016-01-05 22:12:38'),
(66, 17, 'college', 'UM', 'BSE-Math', '1989', '', '0000-00-00', '0000-00-00', 'Cum laude', '2016-01-05 22:12:38', '2016-01-05 22:12:38'),
(67, 17, 'secondary', 'Asuncion Municipal High School', 'Secondary', '1985', '', '0000-00-00', '0000-00-00', 'Valedictorian', '2016-01-05 22:12:39', '2016-01-05 22:12:39'),
(68, 17, 'elementary', 'Magastos Elem School', 'Elementary', '1981', '', '0000-00-00', '0000-00-00', 'Salutatorian', '2016-01-05 22:12:39', '2016-01-05 22:12:39'),
(69, 18, 'graduate studies', 'Ateneo De Davao University', 'Master of Art in Science Teaching - Chemistry', '', 'Completed Academic Requirments', '0000-00-00', '0000-00-00', '', '2016-01-05 22:38:52', '2016-01-05 22:38:52'),
(70, 18, 'graduate studies', 'University of the Philippines - Open University', 'Diploma in Science Teaching - Chemistry ', '1998', '', '0000-00-00', '0000-00-00', '', '2016-01-05 22:38:52', '2016-01-05 22:38:52'),
(71, 18, 'graduate studies', 'University of Southeastern Philippines', 'Master of Arts in Science Education', '', 'Completed Academic Requirments', '0000-00-00', '0000-00-00', '', '2016-01-05 22:38:52', '2016-01-05 22:38:52'),
(72, 18, 'college', 'UM', 'BSED', '1982', '', '0000-00-00', '0000-00-00', '', '2016-01-05 22:38:52', '2016-01-05 22:38:52'),
(73, 18, 'secondary', 'Davao City High School', 'Secondary', '1978', '', '0000-00-00', '0000-00-00', '', '2016-01-05 22:38:52', '2016-01-05 22:38:52'),
(74, 18, 'elementary', 'Quizon Elem School', 'Elementary', '1974', '', '0000-00-00', '0000-00-00', 'With Honors', '2016-01-05 22:38:53', '2016-01-05 22:38:53'),
(75, 19, 'graduate studies', 'USEP', 'MAED - EDAD ', '', '27 units', '0000-00-00', '0000-00-00', '', '2016-01-05 22:51:22', '2016-01-05 22:51:22'),
(76, 19, 'college', 'UM', 'BSED - History', '', '', '0000-00-00', '0000-00-00', '', '2016-01-05 22:51:22', '2016-01-05 22:51:22'),
(77, 19, 'secondary', 'Davao Regional Institute of Fisheries Technology', 'Secondary', '', '', '0000-00-00', '0000-00-00', '', '2016-01-05 22:51:23', '2016-01-05 22:51:23'),
(78, 19, 'elementary', 'Rizal Elem School', 'Elementary', '', '', '0000-00-00', '0000-00-00', '', '2016-01-05 22:51:23', '2016-01-05 22:51:23'),
(79, 20, 'graduate studies', 'Davao del Norte State College', 'Doctor of Philosophy in Educational Management', '2012', '', '0000-00-00', '0000-00-00', 'DNSC Dissertation Assistance', '2016-01-05 23:33:03', '2016-01-05 23:33:03'),
(80, 20, 'graduate studies', 'University of Southeastern Philippines', 'Master of Education in Language Teaching Major in English', '2004', '', '0000-00-00', '0000-00-00', 'DNSC Thesis Assistance', '2016-01-05 23:33:03', '2016-01-05 23:33:03'),
(81, 20, 'college', 'University of Mindanao, Panabo City', 'Bachelor of Science in Secondary Education Major in English', '1996', '', '0000-00-00', '0000-00-00', 'Academic Scholar, Provincial Scholar, Academic Awardee', '2016-01-05 23:33:03', '2016-01-05 23:33:03'),
(82, 20, 'secondary', 'Burueau of Public School, Alamada North Cotabato, Philppines', 'Secondary', '1992', '', '0000-00-00', '0000-00-00', 'Valedictorian', '2016-01-05 23:33:03', '2016-01-05 23:33:03'),
(83, 20, 'elementary', 'Lanao Central Elementary School', 'Elemantary', '1989', '', '0000-00-00', '0000-00-00', 'Valedictorian', '2016-01-05 23:33:03', '2016-01-05 23:33:03'),
(84, 21, 'elementary', 'Davao del Norte State College', 'PhD in Higher Education', '2009', '', '0000-00-00', '0000-00-00', '', '2016-01-05 23:51:59', '2016-01-05 23:51:59'),
(85, 21, 'graduate studies', 'University of Southeastern Philippines', 'MASE', '1985', '', '0000-00-00', '0000-00-00', '', '2016-01-05 23:51:59', '2016-01-05 23:51:59'),
(86, 21, 'college', 'University of Southern Mindanao', '', '1988', '', '0000-00-00', '0000-00-00', '', '2016-01-05 23:51:59', '2016-01-05 23:51:59'),
(87, 21, 'secondary', 'University of Southeastern Philippines', 'Secondary', '1984', '', '0000-00-00', '0000-00-00', '', '2016-01-05 23:51:59', '2016-01-05 23:51:59'),
(88, 21, 'elementary', 'Pendasan Elementary School', 'Elementary', '1980', '', '0000-00-00', '0000-00-00', '', '2016-01-05 23:51:59', '2016-01-05 23:51:59'),
(89, 70, 'graduate studies', 'Iloilo State College of Fisheries', 'Master in Fisheries Tech', '', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(90, 70, 'graduate studies', 'University of Southeastern Philippines', 'Master of Arts in Education', '', 'CAR', '0000-00-00', '0000-00-00', '', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(91, 70, 'college', 'Surigao del Sur Institute of Fisheries and Aquaculture', 'BSF Major in Fish Processing Tech', '1989', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(92, 70, 'vocational', 'Surigao del Sur Institute of Fisheries and Aquaculture', 'DFT Major in Fish Processing Tech.', '1986', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(93, 70, 'secondary', 'Lianga National School of Fisheries', 'Secondary', '1983', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(94, 70, 'elementary', 'Lianga Central Elementary School', 'Elementary', '1979', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(100, 106, 'graduate studies', 'Mindanao State University  - Iligan Institute of Technology', 'MS Marine Biology', '', 'Completed Academic Requirments', '0000-00-00', '0000-00-00', 'CHED-FDP', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(101, 106, 'college', 'Mindanao State University  - Iligan Institute of Technology', 'BS Mathematics', '', '', '0000-00-00', '0000-00-00', '', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(102, 106, 'college', 'Mindanao State University - School of Marine Fisheries and Technology', 'BS Marine Biology', '1998', '', '0000-00-00', '0000-00-00', '', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(103, 106, 'secondary', 'Mindanao State University - Naawan Fisheries High School', 'Secondary', '1993', '', '0000-00-00', '0000-00-00', '6th Honors', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(104, 106, 'elementary', 'Naawan Central School', 'Elementary', '1989', '', '0000-00-00', '0000-00-00', '6th Honor', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(105, 91, 'graduate studies', 'UM', 'Doctor of Education', '2001', '', '0000-00-00', '0000-00-00', '', '2016-01-11 06:46:01', '2016-01-11 06:46:01'),
(106, 91, 'graduate studies', 'Notre Dame of Marbel University', 'MA Education', '1983', '', '0000-00-00', '0000-00-00', '', '2016-01-11 06:46:01', '2016-01-11 06:46:01'),
(107, 91, 'college', 'Notre Dame of Mabel University', 'BSED', '1981', '', '0000-00-00', '0000-00-00', '', '2016-01-11 06:46:01', '2016-01-11 06:46:01'),
(108, 91, 'college', 'UM ', 'BS Engineering ', '', 'First Year', '0000-00-00', '0000-00-00', '', '2016-01-11 06:46:01', '2016-01-11 06:46:01'),
(109, 91, 'secondary', 'St. Peter''s College', 'Secondary', '1970', '', '0000-00-00', '0000-00-00', 'Valedictiorian', '2016-01-11 06:46:01', '2016-01-11 06:46:01'),
(110, 91, 'elementary', 'Daliaon Central Elementary School', 'Elementary', '1966', '', '0000-00-00', '0000-00-00', 'With Honnors', '2016-01-11 06:46:01', '2016-01-11 06:46:01'),
(111, 92, 'graduate studies', 'PH.D in Higher Education Major in Biology', 'Doctoral', '2010', '', '0000-00-00', '0000-00-00', '', '2016-01-11 06:55:49', '2016-01-11 06:55:49'),
(112, 92, 'college', 'Ateneo De Davao University', 'BS Biology', '1990', '', '0000-00-00', '0000-00-00', '', '2016-01-11 06:55:49', '2016-01-11 06:55:49'),
(113, 92, 'secondary', 'Tagum National Trade School', 'Secondary', '1986', '', '0000-00-00', '0000-00-00', '', '2016-01-11 06:55:49', '2016-01-11 06:55:49'),
(114, 92, 'elementary', 'Pindasan Elementary School', 'Elementary', '1982', '', '0000-00-00', '0000-00-00', '', '2016-01-11 06:55:49', '2016-01-11 06:55:49'),
(115, 87, 'graduate studies', 'Davao Oriental State College of Science and Teachnology', 'SCIENCE', '2007', '', '0000-00-00', '0000-00-00', '', '2016-01-11 07:07:41', '2016-01-11 07:07:41'),
(116, 87, 'college', 'Davao Oriental State College of Science and Technology', 'BS Biology', '1998', '', '0000-00-00', '0000-00-00', '', '2016-01-11 07:07:41', '2016-01-11 07:07:41'),
(117, 87, 'secondary', 'Immaculate Heart of Mary Academy', 'Secondary', '1992', '', '0000-00-00', '0000-00-00', '', '2016-01-11 07:07:41', '2016-01-11 07:07:41'),
(118, 87, 'elementary', 'Mati Central Elementary School', 'Elementary', '1988', '', '0000-00-00', '0000-00-00', '', '2016-01-11 07:07:41', '2016-01-11 07:07:41'),
(119, 75, 'graduate studies', 'Iloilo State College of Fisheries', 'Master in Fisheries Tech.', '2002', '', '0000-00-00', '0000-00-00', '', '2016-01-11 07:17:02', '2016-01-11 07:17:02'),
(120, 75, 'graduate studies', 'University of Southeastern Philippines', 'MA Education', '1995', 'CAR', '0000-00-00', '0000-00-00', '', '2016-01-11 07:17:02', '2016-01-11 07:17:02'),
(121, 75, 'college', 'Iloilo State College of Fisheries', 'BS in Fisheries', '1984', '', '0000-00-00', '0000-00-00', '', '2016-01-11 07:17:02', '2016-01-11 07:17:02'),
(122, 75, 'secondary', 'Notre Damme of Sto. Nino', 'Graduated', '1980', '', '0000-00-00', '0000-00-00', '', '2016-01-11 07:17:02', '2016-01-11 07:17:02'),
(123, 75, 'elementary', 'Sto. Nino Central Elementary School', 'Graduated', '1976', '', '0000-00-00', '0000-00-00', '', '2016-01-11 07:17:02', '2016-01-11 07:17:02'),
(124, 102, 'graduate studies', 'St. Mary''s College of Tagum', 'MAED English', '2010', '', '0000-00-00', '0000-00-00', '', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(125, 102, 'college', 'Davao or. State College of Science', 'BSED English', '2006', '', '0000-00-00', '0000-00-00', '', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(126, 102, 'secondary', 'Marynoll High School Of Manay', 'Secondary', '1098', '', '0000-00-00', '0000-00-00', '', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(127, 102, 'elementary', 'Manay Elementary School', 'Elementary', '1992', '', '0000-00-00', '0000-00-00', '', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(128, 71, 'graduate studies', 'Iloilo State College of Fisheries', 'Master in Fisheries Technology', '2002', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-11 07:31:09', '2016-01-11 07:31:09'),
(129, 71, 'graduate studies', 'University of Mindanao', 'MA Teaching Values Education', '', '9 units', '0000-00-00', '0000-00-00', '', '2016-01-11 07:31:09', '2016-01-11 07:31:09'),
(130, 71, 'graduate studies', 'University of Southeastern Philippines', 'MA Education', '', 'CAR', '0000-00-00', '0000-00-00', '', '2016-01-11 07:31:09', '2016-01-11 07:31:09'),
(131, 71, 'college', 'Assumption Collge of Nabunturan', 'BS Education', '', '12 units', '0000-00-00', '0000-00-00', '', '2016-01-11 07:31:09', '2016-01-11 07:31:09'),
(132, 71, 'college', 'Iloilo State College of Fisheries ', 'BS Fisheries', '1970', 'Graduated', '0000-00-00', '0000-00-00', '', '2016-01-11 07:31:10', '2016-01-11 07:31:10'),
(133, 71, 'college', 'Iloilo Doctors College', 'BS Nursing', '1977', '3 Years', '0000-00-00', '0000-00-00', '', '2016-01-11 07:31:10', '2016-01-11 07:31:10'),
(134, 71, 'secondary', 'Iloilo Regional School of Fisheries', 'Secondary', '1974', 'Graduated', '0000-00-00', '0000-00-00', 'Salutatorian', '2016-01-11 07:31:10', '2016-01-11 07:31:10'),
(135, 71, 'elementary', 'Tiwi Elementary School', 'Elementary', '1970', '', '0000-00-00', '0000-00-00', '3rd Honor', '2016-01-11 07:31:10', '2016-01-11 07:31:10'),
(136, 94, 'graduate studies', 'Davao del Norte State College', 'Ph.D in Educational Management', '', '6 Units', '0000-00-00', '0000-00-00', '', '2016-01-12 02:41:02', '2016-01-12 02:41:02'),
(137, 94, 'graduate studies', 'University of Southeastern Philippines - Davao City', 'Master of Arts in Teaching - Math', '2002', '', '0000-00-00', '0000-00-00', '', '2016-01-12 02:41:02', '2016-01-12 02:41:02'),
(138, 94, 'college', 'Philippine Normal University (formerly Philippine Normal College), Manila', 'Bachelor of Science in Mathematics for Teachers', '1988', '', '0000-00-00', '0000-00-00', 'Cum laude, NSTA Proj. 8102 Scholarship', '2016-01-12 02:41:02', '2016-01-12 02:41:02'),
(139, 94, 'secondary', 'Assumption Academy of Mawab', 'Secondary', '1984', '', '0000-00-00', '0000-00-00', 'First Honor', '2016-01-12 02:41:02', '2016-01-12 02:41:02'),
(140, 94, 'elementary', 'Malinawon Elementary School', 'Elementary', '1980', '', '0000-00-00', '0000-00-00', 'First Honor', '2016-01-12 02:41:02', '2016-01-12 02:41:02'),
(141, 77, 'graduate studies', 'Davao del Norte State College', 'MFT', '2006', '', '0000-00-00', '0000-00-00', 'Diploma', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(142, 77, 'college', 'Davao del Norte State College', 'BSF', '2002', '', '0000-00-00', '0000-00-00', 'Diploma', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(143, 77, 'college', 'Davao del Norte State College', 'DFT', '1994', '', '0000-00-00', '0000-00-00', 'Diploma', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(144, 77, 'secondary', 'Davao del Sur National High School', 'Secondary Education', '', '', '0000-00-00', '0000-00-00', 'Diploma', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(145, 77, 'elementary', 'Ramon Magsaysay Elementary School', 'Primary Education', '1986', '', '0000-00-00', '0000-00-00', 'Diploma', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(146, 100, 'graduate studies', 'UP Mindanao', 'MS-FOOD Science', '', '15 units', '0000-00-00', '0000-00-00', '', '2016-01-12 03:21:26', '2016-01-12 03:21:26'),
(147, 100, 'graduate studies', 'Mindanao State University - IIT, Iligan CIty', 'Master in Chemistry', '2013', '', '0000-00-00', '0000-00-00', 'CHED-HEDP', '2016-01-12 03:21:27', '2016-01-12 03:21:27'),
(148, 100, 'college', 'University of Mindanao - MAIN', 'BS in Chemican Engineering', '1995', '', '0000-00-00', '0000-00-00', '', '2016-01-12 03:21:27', '2016-01-12 03:21:27'),
(149, 100, 'secondary', 'Buhangin National High School', '', '1990', '', '0000-00-00', '0000-00-00', 'Salutatorian', '2016-01-12 03:21:27', '2016-01-12 03:21:27'),
(150, 100, 'elementary', 'Buhangin Central Elementary School', '', '1986', '', '0000-00-00', '0000-00-00', 'With Honors', '2016-01-12 03:21:27', '2016-01-12 03:21:27'),
(151, 96, 'graduate studies', 'Notre Dame of Marbel University', 'Master in Biology', '2007', '', '0000-00-00', '0000-00-00', 'CHED Scholarship Grant', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(152, 96, 'graduate studies', 'UP Open University', 'DST Biology', '1998', '', '0000-00-00', '0000-00-00', 'RDR Scholarship Grant', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(153, 96, 'college', 'Holy Cross of Davao College', 'BSE-General Science', '1990', '', '0000-00-00', '0000-00-00', 'BEMSO Scholar', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(154, 96, 'secondary', 'Callawa National High School', '', '1986', '', '0000-00-00', '0000-00-00', 'Valedictorian', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(155, 96, 'elementary', 'Callawa Elementary School', '', '1982', '', '0000-00-00', '0000-00-00', 'Valedictorian', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(156, 105, 'graduate studies', 'Rizal Memorial Colleges', 'MAT - Guindace C''LING', '', 'CAR', '0000-00-00', '0000-00-00', '', '2016-01-12 05:34:48', '2016-01-12 05:34:48'),
(157, 105, 'graduate studies', ' University of Southeastern Philippines  ', 'MAED Guidance & C''Ling', '', 'CAR', '0000-00-00', '0000-00-00', '', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(158, 105, 'college', 'Southwestern University', 'BS Psychology', '1997', '', '0000-00-00', '0000-00-00', '', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(159, 105, 'secondary', 'Surigao Sur Institute of Fisheries and Aquaculture', 'Secondary', '1993', '', '0000-00-00', '0000-00-00', 'With Honor', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(160, 105, 'elementary', 'Liagan Central Elementary School', 'Elementary', '1989', '', '0000-00-00', '0000-00-00', 'With Honor', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(161, 85, 'graduate studies', 'Doctor in Philosophy in Organizational Studies', 'Units', '', '', '0000-00-00', '0000-00-00', '', '2016-01-12 05:56:32', '2016-01-12 05:56:32'),
(162, 85, 'graduate studies', 'Master of Education in Language Teaching', 'Graduated', '2004', '', '0000-00-00', '0000-00-00', 'DEAN''s Citation in the Field of Education', '2016-01-12 05:56:32', '2016-01-12 05:56:32'),
(163, 85, 'college', 'University of Mindanao - Tagum City', 'Graduated', '1990', '', '0000-00-00', '0000-00-00', '', '2016-01-12 05:56:32', '2016-01-12 05:56:32'),
(164, 85, 'secondary', 'Tagum Municipal High School', 'Graduated', '1984', '', '0000-00-00', '0000-00-00', '', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(165, 85, 'elementary', 'Liberty Elementary School', 'Graduated', '1980', '', '0000-00-00', '0000-00-00', '3rd Honorable Mention', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(166, 97, 'graduate studies', 'Mindanao Univ. Sci. & Tech - CDO', 'Ph. D. Applied Math Sciences ', '', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:12:56', '2016-01-12 06:12:56'),
(167, 97, 'graduate studies', 'Mindanao University.Sci & Tech - CDO', 'MS - Applied Math Sci', '2010', '', '0000-00-00', '0000-00-00', 'CHED - PGMSEGS Scholarship', '2016-01-12 06:12:56', '2016-01-12 06:12:56'),
(168, 97, 'graduate studies', 'Mindanao State University - Marawi', 'Master in Public Administration', '2000', 'Graduate', '0000-00-00', '0000-00-00', '', '2016-01-12 06:12:56', '2016-01-12 06:12:56'),
(169, 97, 'college', 'UP - Diliman', 'BSE - Mathematic', '1990', 'Graduate', '0000-00-00', '0000-00-00', '', '2016-01-12 06:12:56', '2016-01-12 06:12:56'),
(170, 97, 'secondary', 'Marynoll High School of Panabo', 'Secondary Education', '1984', 'Graduate', '0000-00-00', '0000-00-00', 'Valedictorian', '2016-01-12 06:12:56', '2016-01-12 06:12:56'),
(171, 97, 'elementary', 'Panabo Central Elementary School', 'Basic Education', '1980', 'Graduate', '0000-00-00', '0000-00-00', 'Class Valedictorian', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(172, 98, 'graduate studies', 'Southwestern University - Cebu City', 'ED.D Major in Physical Education', '', 'Completed Academic Requirments', '0000-00-00', '0000-00-00', '', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(173, 98, 'graduate studies', 'Pamantasan ng Lungsod ng Maynila - NCPE', 'Master in Physical Education in Sports', '1997', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(174, 98, 'college', 'Philipine Institute of Physical Education and Sports Manila', 'Certificate of Physical Education and Sports', '1990', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(175, 98, 'college', 'University of Mindanao - Davao City', 'Bachelor of Arts with Education Units', '1988', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(176, 98, 'vocational', 'Foccolare Lay Movement Carpentry', 'Wood Handicrafts', '1990', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(177, 98, 'secondary', 'University of Mindanao - Davao City', 'Secondary', '1983', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(178, 98, 'elementary', 'Philippine Womens College of Davao, Fatima School Academy, University of Mindanao', 'Primary, Intermediate', '1979', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(179, 88, 'graduate studies', 'UM Tagum College', 'MAED - Teaching Science', '2013', '', '0000-00-00', '0000-00-00', 'Meritorrious ', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(180, 88, 'college', 'UM Tagum College', 'BSED - Gen. Science', '2005', '', '0000-00-00', '0000-00-00', 'Tulay Scholarship Foundation', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(181, 88, 'secondary', 'Maco National High School', 'Secondary', '1998', '', '0000-00-00', '0000-00-00', 'Best in Music', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(182, 88, 'elementary', 'Maco Heights Central Elementary School', 'Elementary', '1994', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(183, 99, 'graduate studies', 'Davao del Norte State College', 'PHD.E.D. MGT', '', '30 units', '0000-00-00', '0000-00-00', '', '2016-01-12 06:45:06', '2016-01-12 06:45:06'),
(184, 99, 'graduate studies', 'St. Mary''s College of Tagum City', 'MAED PE', '2011', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:45:06', '2016-01-12 06:45:06'),
(185, 99, 'college', 'Polytechnic University of the Philippines, Sta. Mesa, Manila', 'BPE', '1993', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:45:06', '2016-01-12 06:45:06'),
(186, 99, 'college', 'Ateneo De Davao University', 'Business Management', '', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:45:06', '2016-01-12 06:45:06'),
(187, 99, 'vocational', 'Technological Institute of the Philippines, Quezon City', 'Drafting Technology', '1995', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:45:06', '2016-01-12 06:45:06'),
(188, 99, 'secondary', 'Maryknoll High School of Panabo City', 'Secondary', '1987', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:45:06', '2016-01-12 06:45:06'),
(189, 99, 'elementary', 'St. Mary''s College of Tagum City', 'Elementary', '1983', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:45:07', '2016-01-12 06:45:07'),
(190, 82, 'elementary', 'San Roque Elementary School', 'Elementary', '1966', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:51:19', '2016-01-12 06:51:19'),
(191, 86, 'graduate studies', 'University of Mindanao, Davao City', 'MAED- Teaching Science', '2002', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(192, 86, 'college', 'University of Mindanao, Davao City', 'BSED- GEn. Science', '1996', '', '0000-00-00', '0000-00-00', '', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(193, 86, 'secondary', 'Bula National School of Fishiries', 'Secondary', '1988', '', '0000-00-00', '0000-00-00', 'Valedictorian', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(194, 86, 'elementary', 'Bula Elementary School', 'Elementary', '1984', '', '0000-00-00', '0000-00-00', '3rd Honorable Mention', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(199, 69, 'elementary', 'Mindanao State University, Naawas Misamis Oriental', 'M.S. in Fisheries ', '1999', '', '0000-00-00', '0000-00-00', 'CHED - MAEP Scholar', '2016-01-12 07:08:30', '2016-01-12 07:08:30'),
(200, 69, 'college', 'Iloilo State College of Fisheries, Barotac Neuvo, Iloilo', 'BSE Fisheries Education', '1982', '', '0000-00-00', '0000-00-00', '', '2016-01-12 07:08:30', '2016-01-12 07:08:30'),
(201, 69, 'secondary', 'Iloilo State College of Fisheries Barotac Nuevo, Iloilo', 'Secondary', '1976', '', '0000-00-00', '0000-00-00', '', '2016-01-12 07:08:30', '2016-01-12 07:08:30'),
(202, 69, 'elementary', 'Baras Elementary School / Iloilo', 'Elemetary', '1971', '', '0000-00-00', '0000-00-00', '', '2016-01-12 07:08:30', '2016-01-12 07:08:30'),
(203, 28, 'graduate studies', 'USEP-Davao City', 'Units', '', '', '0000-00-00', '0000-00-00', '', '2016-01-14 01:07:23', '2016-01-14 01:07:23'),
(204, 28, 'college', 'Mindanao State University - Iligan Institute of Technology (MSU-IIT)', 'BSBA-Economics', '1984', '', '0000-00-00', '0000-00-00', '', '2016-01-14 01:07:23', '2016-01-14 01:07:23'),
(205, 28, 'secondary', 'Holy Cross of Babak, Inc.', 'Graduated', '1980', '', '0000-00-00', '0000-00-00', 'With Honors', '2016-01-14 01:07:23', '2016-01-14 01:07:23'),
(206, 28, 'elementary', 'Babak Central Elementary School', 'Graduated', '1976', '', '0000-00-00', '0000-00-00', 'With Honors', '2016-01-14 01:07:23', '2016-01-14 01:07:23'),
(207, 26, 'college', 'Xavier University ', 'BS - Nursing', '1995', '', '0000-00-00', '0000-00-00', 'Ched Scholar', '2016-01-14 01:10:21', '2016-01-14 01:10:21'),
(208, 26, 'secondary', 'Surigao del Sur Institute of Fisheries and Aquaculture', 'Secondary', '1991', '', '0000-00-00', '0000-00-00', 'Salutatorian ', '2016-01-14 01:10:21', '2016-01-14 01:10:21'),
(209, 26, 'elementary', 'Lianga Central Elementary School', 'Elementary', '1987', '', '0000-00-00', '0000-00-00', '3rd Honorable Mention', '2016-01-14 01:10:21', '2016-01-14 01:10:21'),
(210, 35, 'college', 'Bukidnon State College - External Studio Center', 'BEED', '', '', '0000-00-00', '0000-00-00', '', '2016-01-14 01:17:49', '2016-01-14 01:17:49'),
(211, 35, 'vocational', 'Davao del Norte School of Fisheries', 'DFT', '1996', '', '0000-00-00', '0000-00-00', '8th Capturist', '2016-01-14 01:17:49', '2016-01-14 01:17:49'),
(212, 35, 'secondary', 'Maragusan Valley Institute', '', '1983', '', '0000-00-00', '0000-00-00', 'Leadership Award', '2016-01-14 01:17:49', '2016-01-14 01:17:49'),
(213, 35, 'elementary', 'Daladap Elementary School', '', '1979', '', '0000-00-00', '0000-00-00', 'Valedictorian', '2016-01-14 01:17:49', '2016-01-14 01:17:49'),
(214, 57, 'college', 'Davao del  Norte State College', 'BSF SP - Aquaculture', '', '4th Year', '', '', '', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(215, 57, 'college', 'Davao del Norte State College', 'BSE - Math', '', '3rd year', '', '', '', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(216, 57, 'vocational', 'Davao Del Norte School of Fisheries ', 'Diploma in Fisheries Tech', '1986', '', '', '', '3rd Culturist ', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(217, 57, 'secondary', 'St. Cruz Baranggay High School', 'Secondary', '1980', '', '', '', '', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(218, 57, 'elementary', 'Mabuhay Elementary School', 'Elementary', '1974', '', '', '', '', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(219, 46, 'graduate studies', 'USEP, Davao City', 'Master in Public Administration', '1998', '', '', '', '', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(220, 46, 'college', 'Mindanao State University - Marawi City', 'BS in Business Administration', '1998', '', '', '', '', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(221, 46, 'secondary', 'Jesus Cabarrus Catholic School', '', '1994', '', '', '', '', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(222, 46, 'elementary', 'Jesus Cabarrus Catholic School', '', '1990', '', '', '', '', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(223, 50, 'secondary', 'Surigao del Sur Institute of Fisheries and Aquaculture', 'Secondary', '1988', '', '', '', '', '2016-01-14 01:42:04', '2016-01-14 01:42:04'),
(224, 50, 'elementary', 'St. Nino Elementary School', 'Elementary', '1978', '', '', '', '', '2016-01-14 01:42:04', '2016-01-14 01:42:04'),
(225, 25, 'college', 'Iloilo State College of Fisheries', 'BSFEd', '', '', '1974', '1979', '', '2016-01-14 01:50:48', '2016-01-14 01:50:48'),
(226, 25, 'secondary', 'Good Sheperd''s Fold Academy', '', '', '', '1970', '1974', '', '2016-01-14 01:50:48', '2016-01-14 01:50:48'),
(227, 25, 'elementary', 'Libertad Elementary School', '', '', '', '1964', '1970', '', '2016-01-14 01:50:48', '2016-01-14 01:50:48'),
(232, 110, 'graduate studies', 'Ateneo de Davao University', 'MS - Biology', '2012', 'CAR', '', '', '', '2016-01-14 01:57:01', '2016-01-14 01:57:01'),
(233, 110, 'college', 'Central Philippines University', 'BS - Biology', '1997', '', '', '', '', '2016-01-14 01:57:01', '2016-01-14 01:57:01'),
(234, 110, 'secondary', 'Surigao del Sur Institute of Fisheries and Aquaculture', 'Secondary', '1993', '', '', '', 'With Honors', '2016-01-14 01:57:01', '2016-01-14 01:57:01'),
(235, 110, 'elementary', 'Lianga Central Elemetary School', 'Elementary', '1989', '', '', '', 'With Honors', '2016-01-14 01:57:01', '2016-01-14 01:57:01'),
(236, 59, 'college', 'Iloilo State College of Fisheries', 'Bachelor of Science in Fisheries', '1979', '', '1974', '1979', '', '2016-01-14 01:59:07', '2016-01-14 01:59:07'),
(237, 59, 'secondary', 'St. Pius X Institute', '', '1970', '', '1966', '1970', '', '2016-01-14 01:59:07', '2016-01-14 01:59:07'),
(238, 59, 'elementary', 'Amamaros Elementary School', '', '1966', '', '1961', '1966', '', '2016-01-14 01:59:07', '2016-01-14 01:59:07'),
(239, 30, 'college', 'University of San. Jose - Recoletus ', 'AB - LIACOM', '1991', '', '1987', '1991', '', '2016-01-14 02:10:36', '2016-01-14 02:10:36'),
(240, 30, 'secondary', 'Notre Dame of Edcor ', 'Secondary', '1987', '', '1983', '1987', '2nd Honorable Meontion', '2016-01-14 02:10:36', '2016-01-14 02:10:36'),
(241, 30, 'elementary', 'Alamada Central Elementary Scool', 'Elementary', '1983', '', '', '', '3rd Honor', '2016-01-14 02:10:37', '2016-01-14 02:10:37'),
(242, 33, 'graduate studies', 'University of Southeastern Philippines', 'MAT-MATH', '', '24 Units', '', '', '', '2016-01-14 02:19:42', '2016-01-14 02:19:42'),
(243, 33, 'college', 'Zamboanga Arturo Eustaquio Colleges', 'BSEd', '1993', '', '1989', '1993', '', '2016-01-14 02:19:42', '2016-01-14 02:19:42'),
(244, 33, 'secondary', 'Surigao del Sur Institute of Fisheries and Aquaculture', '', '1989', '', '1985', '1989', '', '2016-01-14 02:19:42', '2016-01-14 02:19:42'),
(245, 33, 'elementary', 'Diatagon Elementary School', '', '1985', '', '1979', '1985', '', '2016-01-14 02:19:42', '2016-01-14 02:19:42'),
(246, 36, 'graduate studies', 'Zamboanga State College of Marine Science and Technology (ZSCMST)', 'M.S Fisheries Major: Aquaculture', '2004', '', '1997', '2000', '', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(247, 36, 'graduate studies', 'Southern Philippines Agri-Business and Marine and Aquatic School of Technology (SPAMAST)', 'B.S Fisheries Inland Major. Fisheries', '1992', '', '1988', '1992', 'Cum Laude', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(248, 36, 'secondary', 'St. Michael School of Padada', 'Secondary', '1988', '', '1984', '1988', '', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(249, 36, 'elementary', 'Padada Elementary School', 'Elementary', '1984', '', '1978', '1984', '', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(252, 34, 'elementary', 'Bunawan Aplaya Elementary School', 'Elementary', '1977', '', '1971', '1977', 'With Honors', '2016-01-14 02:43:44', '2016-01-14 02:43:44'),
(253, 39, 'college', 'College of the Philippines', 'BSMT', '', '', '', '', '', '2016-01-14 02:54:55', '2016-01-14 02:54:55'),
(254, 39, 'college', 'Agro-Industrial Foundation', '', '1982', '', '1980', '1982', '', '2016-01-14 02:54:55', '2016-01-14 02:54:55'),
(255, 39, 'secondary', 'Notre Dame Pikit', 'Secondary', '1980', '', '1976', '1980', '', '2016-01-14 02:54:55', '2016-01-14 02:54:55'),
(256, 39, 'elementary', 'Lantingan Pihit ElementarySchool', 'Elementary', '1976', '', '1970', '1976', '', '2016-01-14 02:54:55', '2016-01-14 02:54:55'),
(257, 47, 'college', 'Davao Regional Institute of Fisheries Technology', 'Diploma in Fisheries Technology', '', '2nd Year College', '1992', '1984', '', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(258, 47, 'secondary', 'San Nicolas Brgy High School', 'Secondary', '1983', '', '1979', '1983', '', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(259, 47, 'elementary', 'San Nicolas Elementary School', 'Elementary', '1976', '', '1970', '1976', '', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(260, 38, 'secondary', 'Sto. Tomas High School', 'Secondary', '1971', '', '1967', '1971', '', '2016-01-14 03:08:33', '2016-01-14 03:08:33'),
(261, 38, 'elementary', 'Sub. Prov. Of Guimaras', 'Elementary', '1967', '', '1961', '1967', '', '2016-01-14 03:08:33', '2016-01-14 03:08:33'),
(262, 45, 'college', 'Davao del  Norte State College', 'B.S Biology', '1999', '', '1995', '1999', '', '2016-01-14 03:25:39', '2016-01-14 03:25:39'),
(263, 45, 'secondary', 'Davao del Sur National High School', 'Secondary', '1995', '', '1991', '1995', '', '2016-01-14 03:25:39', '2016-01-14 03:25:39'),
(264, 45, 'elementary', 'Digos Centarl Elementary Schol', 'Elementary', '1991', '', '1985', '1991', '', '2016-01-14 03:25:39', '2016-01-14 03:25:39'),
(265, 32, 'college', 'University of Mindanao', 'Graduated', '1982', '', '', '', '', '2016-01-14 03:38:32', '2016-01-14 03:38:32'),
(266, 32, 'secondary', 'University of Mindanao', 'Graduated', '1978', '', '', '', 'With Honors', '2016-01-14 03:38:32', '2016-01-14 03:38:32'),
(267, 32, 'elementary', 'Bingcungan Elem. School ', 'Graduated', '1974', '', '', '', 'First Honors', '2016-01-14 03:38:32', '2016-01-14 03:38:32'),
(268, 61, 'college', 'Mats College of Technology Davao City', '', '1994', '', '1992', '1994', '', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(269, 61, 'vocational', 'General Radio Communication Operator', '', '', '', '', '', '', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(270, 61, 'secondary', 'Panabo National High School', 'Secondary', '1992', '', '1988', '1992', '', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(271, 61, 'elementary', 'Panabo Rizal Elementary School', 'Primary', '1988', '', '1982', '1988', '', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(272, 55, 'college', 'Panabo Community College of Technology', 'Auto Mechanic Graduate', '1991', '52 Units', '1990', '1991', '', '2016-01-14 06:03:25', '2016-01-14 06:03:25'),
(273, 55, 'secondary', 'Former Davao del Norte School of Fisheries ', 'Secondary', '1990', '', '1989', '1990', '', '2016-01-14 06:03:25', '2016-01-14 06:03:25'),
(274, 55, 'elementary', 'Kapuna Elementary School', 'Elementary', '1989', '', '1983', '1989', '', '2016-01-14 06:03:25', '2016-01-14 06:03:25'),
(275, 62, 'college', 'Davao del  Norte State College', 'Computer Sect''l & office ', '', 'Graduated', '', '', '', '2016-01-14 06:23:19', '2016-01-14 06:23:19'),
(276, 62, 'college', 'University of Mindanao', 'Engineering', '', 'Second Year', '1979', '1981', '', '2016-01-14 06:23:19', '2016-01-14 06:23:19'),
(277, 62, 'secondary', 'Compostela Community High School', 'Secondary', '1975', '', '1971', '1975', '', '2016-01-14 06:23:19', '2016-01-14 06:23:19'),
(278, 62, 'elementary', 'Hijo Elementary School', 'Elementary', '1971', '', '1965', '1971', '', '2016-01-14 06:23:19', '2016-01-14 06:23:19'),
(279, 31, 'graduate studies', 'Davao del Norte State College', 'Master in Technology Education', '2007', 'Graduated', '', '2007', '', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(280, 31, 'graduate studies', 'University of Southeastern Philippines', 'Master in Public Administration', '', '33 units earned', '1991', '1996', '', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(281, 31, 'college', 'University of Mindanao', 'Education Units', '', '27 Units Earned', '1987', '1988', '', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(282, 31, 'college', 'Rizal Memorial Colleges', 'BS Education ', '', '12 units earned', '1984', '1985', '', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(283, 31, 'college', 'University of Mindanao', 'Bachelor of Science in Commerce', '1980', 'Graduated', '1977', '1980', '', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(284, 31, 'vocational', 'Panabo Community College of Technology', 'Junior Secretarial', '1976', 'Graduated', '1976', '1976', 'Outstanding', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(285, 31, 'secondary', 'Panabo Provincial High School', 'High School', '1974', 'Graduated', '1970', '1974', '', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(286, 31, 'elementary', 'Kasilak Elementary School', 'Elementary', '1969', 'Graduated', '1968', '1969', 'Special Honor', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(291, 49, 'vocational', 'PCCT Panabo, Davao', '', '1989', '', '1988', '1989', '', '2016-01-14 07:40:36', '2016-01-14 07:40:36'),
(293, 49, 'secondary', 'Panabo Provincial High School', '', '1980', '', '1979', '1980', '', '2016-01-14 07:40:36', '2016-01-14 07:40:36'),
(295, 49, 'elementary', 'Panabo Central Elementary School', '', '1976', '', '1975', '1976', '', '2016-01-14 07:40:36', '2016-01-14 07:40:36'),
(296, 27, 'graduate studies', 'University of South Eastern Philippines ', 'Master of Arts in Education Major in Guidance Counseling', '2006', '36', '2004', '2006', '', '2016-01-15 02:17:45', '2016-01-15 02:17:45'),
(297, 27, 'college', 'West Negros College', 'Bachelor of Science And Psychology', '1998', '', '1994', '1998', 'Cum Laude', '2016-01-15 02:17:45', '2016-01-15 02:17:45'),
(298, 27, 'secondary', 'Binalbagan Catholic College', 'Secondary', '1993', '', '1989', '1993', '5th Honorable Mention', '2016-01-15 02:17:45', '2016-01-15 02:17:45'),
(299, 27, 'elementary', 'Paglaum Village Elementary School', 'Elementary', '1989', '', '1983', '1989', 'Satutatorian', '2016-01-15 02:17:45', '2016-01-15 02:17:45'),
(300, 58, 'college', 'Palompon Institute of  Technology', '', '1983', '', '1981', '1983', 'Merit', '2016-01-15 02:38:37', '2016-01-15 02:38:37'),
(301, 58, 'vocational', 'Palompon Institute of Technology', '', '1981', '', '1980', '1981', 'Merit', '2016-01-15 02:38:37', '2016-01-15 02:38:37'),
(302, 58, 'secondary', 'Coliged De San Javier Technology', 'Secondary', '1980', '', '1976', '1980', 'Diploma', '2016-01-15 02:38:37', '2016-01-15 02:38:37'),
(303, 58, 'elementary', 'Caduhaan Elemetary School', 'Elementtary', '1976', '', '1971', '1976', 'Diploma', '2016-01-15 02:38:37', '2016-01-15 02:38:37'),
(304, 41, 'secondary', 'Matag.ob National High School', 'Secondary', '1968', '', '', '', '', '2016-01-15 03:22:59', '2016-01-15 03:22:59'),
(305, 41, 'elementary', 'Matag-ob Elementary School', 'Elementary', '1964', '', '', '', '', '2016-01-15 03:22:59', '2016-01-15 03:22:59'),
(309, 111, 'vocational', 'UM Tagum College', 'Computer Technology', '2000', '', '1997', '2000', '', '2016-01-15 03:35:05', '2016-01-15 03:35:05'),
(310, 111, 'secondary', 'UM Panabo college', 'Secondary', '1997', '', '1992', '1997', '', '2016-01-15 03:35:05', '2016-01-15 03:35:05'),
(311, 111, 'elementary', 'New Panay Elementary Scool', 'Elementary', '1992', '', '1987', '1992', 'Valedictorian', '2016-01-15 03:35:05', '2016-01-15 03:35:05'),
(312, 83, 'elementary', 'Davao del Norte State College', 'Ph.D.Edcution Management', '', 'CAR', '0000-00-00', '0000-00-00', '', '2016-02-05 15:03:28', '2016-02-05 15:03:28'),
(313, 83, 'elementary', 'Rizal Memorial Colleges', 'M.A.Education Management', '1995', '', '0000-00-00', '0000-00-00', 'Meritissimus', '2016-02-05 15:03:28', '2016-02-05 15:03:28'),
(314, 83, 'college', 'Phillippine Normal College ', 'AB-BSE  (English)', '1986', '', '0000-00-00', '0000-00-00', 'SL Awardee', '2016-02-05 15:03:28', '2016-02-05 15:03:28'),
(315, 83, 'secondary', 'Cantilan National Trade School', 'Secondary', '1980', '', '0000-00-00', '0000-00-00', 'BSP Awardee', '2016-02-05 15:03:28', '2016-02-05 15:03:28'),
(316, 83, 'elementary', 'Barobo Central ELementary School', 'Elementary', '1976', '', '0000-00-00', '0000-00-00', 'Valedictorian', '2016-02-05 15:03:28', '2016-02-05 15:03:28');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_leaves`
--

CREATE TABLE IF NOT EXISTS `hris_employee_leaves` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `working_days_applied` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `salary` double(8,2) DEFAULT NULL,
  `commutation` enum('requested','not requested') COLLATE utf8_unicode_ci NOT NULL,
  `leave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `additional_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('filed','recommended','unrecommended','approved','disapproved','certified','uncertified') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'filed',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recommending_approval_id` int(10) unsigned DEFAULT NULL,
  `approved_by_id` int(10) unsigned NOT NULL,
  `certified_by_id` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_leave_credits`
--

CREATE TABLE IF NOT EXISTS `hris_employee_leave_credits` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `force_leave` double(8,2) NOT NULL DEFAULT '5.00',
  `special_leave` double(8,2) NOT NULL DEFAULT '3.00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_leave_credits`
--

INSERT INTO `hris_employee_leave_credits` (`id`, `employee_id`, `force_leave`, `special_leave`, `created_at`, `updated_at`) VALUES
(2, 2, 5.00, 3.00, '2016-01-04 18:40:47', '2016-01-15 02:35:34'),
(3, 4, 5.00, 3.00, '2016-01-04 19:02:42', '2016-01-15 02:19:35'),
(4, 5, 5.00, 3.00, '2016-01-04 19:27:55', '2016-01-15 03:17:46'),
(5, 6, 5.00, 3.00, '2016-01-04 19:47:13', '2016-01-15 03:19:15'),
(6, 7, 5.00, 3.00, '2016-01-04 21:57:48', '2016-01-15 03:07:30'),
(8, 9, 5.00, 3.00, '2016-01-04 22:05:08', '2016-01-15 02:54:32'),
(9, 10, 5.00, 3.00, '2016-01-04 22:19:11', '2016-01-15 03:07:05'),
(10, 11, 5.00, 3.00, '2016-01-05 19:43:54', '2016-01-15 02:57:53'),
(11, 12, 5.00, 3.00, '2016-01-05 19:58:31', '2016-01-15 03:14:12'),
(12, 13, 5.00, 3.00, '2016-01-05 20:14:24', '2016-01-15 03:03:41'),
(13, 14, 5.00, 3.00, '2016-01-05 20:52:55', '2016-01-15 03:06:00'),
(14, 15, 5.00, 3.00, '2016-01-05 21:41:36', '2016-01-15 03:13:02'),
(15, 16, 5.00, 3.00, '2016-01-05 21:56:17', '2016-01-05 21:56:17'),
(16, 17, 5.00, 3.00, '2016-01-05 22:12:38', '2016-01-15 03:16:57'),
(17, 18, 5.00, 3.00, '2016-01-05 22:38:50', '2016-01-15 03:02:20'),
(18, 19, 5.00, 3.00, '2016-01-05 22:51:22', '2016-01-15 02:58:32'),
(19, 20, 5.00, 3.00, '2016-01-05 23:33:02', '2016-01-15 03:11:40'),
(20, 21, 5.00, 3.00, '2016-01-05 23:51:58', '2016-01-15 03:08:10'),
(21, 22, 5.00, 3.00, '2016-01-08 13:10:30', '2016-01-15 02:23:32'),
(22, 23, 5.00, 3.00, '2016-01-08 13:26:46', '2016-01-15 02:30:19'),
(23, 24, 5.00, 3.00, '2016-01-08 13:29:33', '2016-01-15 02:32:33'),
(24, 25, 5.00, 3.00, '2016-01-08 13:31:24', '2016-01-15 02:32:10'),
(25, 26, 5.00, 3.00, '2016-01-08 13:32:19', '2016-01-15 02:30:01'),
(26, 27, 5.00, 3.00, '2016-01-08 13:33:13', '2016-01-15 02:37:47'),
(27, 28, 5.00, 3.00, '2016-01-08 13:34:57', '2016-01-15 02:23:04'),
(28, 29, 5.00, 3.00, '2016-01-08 13:36:24', '2016-01-15 02:31:09'),
(29, 30, 5.00, 3.00, '2016-01-08 13:38:09', '2016-01-15 02:25:05'),
(30, 31, 5.00, 3.00, '2016-01-08 13:39:07', '2016-01-15 02:29:34'),
(31, 32, 5.00, 3.00, '2016-01-08 13:40:30', '2016-01-15 02:23:56'),
(32, 33, 5.00, 3.00, '2016-01-08 13:41:52', '2016-01-15 02:27:15'),
(33, 34, 5.00, 3.00, '2016-01-08 13:42:55', '2016-01-15 02:33:27'),
(34, 35, 5.00, 3.00, '2016-01-08 13:44:18', '2016-01-15 02:42:30'),
(35, 36, 5.00, 3.00, '2016-01-08 13:46:27', '2016-01-15 02:26:18'),
(36, 37, 5.00, 3.00, '2016-01-08 13:47:51', '2016-01-08 13:47:51'),
(37, 38, 5.00, 3.00, '2016-01-08 13:48:53', '2016-01-15 02:33:01'),
(38, 39, 5.00, 3.00, '2016-01-08 13:49:51', '2016-01-15 02:34:00'),
(39, 40, 5.00, 3.00, '2016-01-08 13:50:52', '2016-01-15 02:50:25'),
(40, 41, 5.00, 3.00, '2016-01-08 13:52:02', '2016-01-15 02:42:57'),
(41, 42, 5.00, 3.00, '2016-01-08 13:53:27', '2016-01-15 02:40:13'),
(42, 43, 5.00, 3.00, '2016-01-08 13:54:39', '2016-01-15 02:34:55'),
(43, 44, 5.00, 3.00, '2016-01-08 13:55:42', '2016-01-15 02:50:07'),
(44, 45, 5.00, 3.00, '2016-01-08 13:56:32', '2016-01-15 02:37:05'),
(45, 46, 5.00, 3.00, '2016-01-08 13:57:40', '2016-01-15 02:30:37'),
(46, 47, 5.00, 3.00, '2016-01-08 13:59:00', '2016-01-15 02:33:43'),
(47, 48, 5.00, 3.00, '2016-01-08 14:00:16', '2016-01-15 02:36:29'),
(48, 49, 5.00, 3.00, '2016-01-08 14:02:01', '2016-01-15 02:38:17'),
(49, 50, 5.00, 3.00, '2016-01-08 14:02:52', '2016-01-15 02:49:17'),
(50, 51, 5.00, 3.00, '2016-01-08 14:03:54', '2016-01-15 02:36:05'),
(51, 52, 5.00, 3.00, '2016-01-08 14:05:09', '2016-01-15 02:36:48'),
(52, 53, 5.00, 3.00, '2016-01-08 14:08:47', '2016-01-15 02:37:28'),
(53, 54, 5.00, 3.00, '2016-01-08 14:09:41', '2016-01-15 02:40:35'),
(54, 55, 5.00, 3.00, '2016-01-08 14:11:08', '2016-01-15 02:26:52'),
(55, 56, 5.00, 3.00, '2016-01-08 14:12:16', '2016-01-15 02:31:37'),
(56, 57, 5.00, 3.00, '2016-01-08 14:13:25', '2016-01-15 02:50:41'),
(57, 58, 5.00, 3.00, '2016-01-08 14:14:27', '2016-01-15 02:53:46'),
(58, 59, 5.00, 3.00, '2016-01-08 14:15:25', '2016-01-15 02:41:35'),
(59, 60, 5.00, 3.00, '2016-01-08 14:16:26', '2016-01-15 02:48:24'),
(60, 61, 5.00, 3.00, '2016-01-08 14:17:25', '2016-01-15 02:21:20'),
(61, 62, 5.00, 3.00, '2016-01-08 14:18:21', '2016-01-08 14:18:21'),
(62, 63, 5.00, 3.00, '2016-01-08 14:19:34', '2016-01-15 02:48:53'),
(63, 64, 5.00, 3.00, '2016-01-08 14:20:22', '2016-01-15 06:37:58'),
(64, 65, 5.00, 3.00, '2016-01-08 14:21:46', '2016-01-08 14:21:46'),
(65, 66, 5.00, 3.00, '2016-01-08 14:23:05', '2016-01-08 14:23:05'),
(66, 67, 5.00, 3.00, '2016-01-08 14:24:41', '2016-01-15 03:03:23'),
(67, 68, 5.00, 3.00, '2016-01-08 14:25:48', '2016-01-08 14:25:48'),
(68, 69, 5.00, 3.00, '2016-01-08 14:27:48', '2016-01-08 14:27:48'),
(69, 70, 5.00, 3.00, '2016-01-08 14:29:22', '2016-01-15 03:18:26'),
(70, 71, 5.00, 3.00, '2016-01-08 14:30:23', '2016-01-15 03:13:50'),
(71, 72, 5.00, 3.00, '2016-01-08 14:31:29', '2016-01-15 03:00:37'),
(72, 73, 5.00, 3.00, '2016-01-08 14:32:27', '2016-01-15 03:05:09'),
(73, 74, 5.00, 3.00, '2016-01-08 14:34:11', '2016-01-15 03:20:30'),
(74, 75, 5.00, 3.00, '2016-01-08 14:35:11', '2016-01-15 03:20:17'),
(75, 76, 5.00, 3.00, '2016-01-08 14:36:24', '2016-01-15 03:07:53'),
(76, 77, 5.00, 3.00, '2016-01-08 14:38:20', '2016-01-15 03:17:18'),
(77, 78, 5.00, 3.00, '2016-01-08 14:39:11', '2016-01-08 14:39:11'),
(78, 79, 5.00, 3.00, '2016-01-08 14:40:07', '2016-01-15 02:57:17'),
(79, 80, 5.00, 3.00, '2016-01-08 14:41:12', '2016-01-08 14:41:12'),
(80, 81, 5.00, 3.00, '2016-01-08 14:47:09', '2016-01-08 14:47:09'),
(81, 82, 5.00, 3.00, '2016-01-08 14:48:22', '2016-01-15 02:57:33'),
(82, 83, 5.00, 3.00, '2016-01-08 14:49:14', '2016-01-15 03:18:47'),
(83, 84, 5.00, 3.00, '2016-01-08 14:50:22', '2016-01-15 03:12:03'),
(84, 85, 5.00, 3.00, '2016-01-08 14:51:10', '2016-01-15 03:16:00'),
(85, 86, 5.00, 3.00, '2016-01-08 14:52:06', '2016-01-15 03:05:31'),
(86, 87, 5.00, 3.00, '2016-01-08 14:53:02', '2016-01-15 03:02:41'),
(87, 88, 5.00, 3.00, '2016-01-08 14:53:53', '2016-01-08 14:53:53'),
(88, 89, 5.00, 3.00, '2016-01-08 14:54:50', '2016-01-08 14:54:50'),
(89, 90, 5.00, 3.00, '2016-01-08 14:55:52', '2016-01-08 14:55:52'),
(90, 91, 5.00, 3.00, '2016-01-08 14:58:23', '2016-01-15 03:09:30'),
(91, 92, 5.00, 3.00, '2016-01-08 14:59:10', '2016-01-15 03:20:52'),
(92, 93, 5.00, 3.00, '2016-01-08 15:00:12', '2016-01-15 02:58:15'),
(93, 94, 5.00, 3.00, '2016-01-08 15:01:03', '2016-01-15 03:21:18'),
(94, 95, 5.00, 3.00, '2016-01-08 15:02:34', '2016-01-15 03:02:52'),
(95, 96, 5.00, 3.00, '2016-01-08 15:03:54', '2016-01-15 03:16:24'),
(96, 97, 5.00, 3.00, '2016-01-08 15:05:06', '2016-01-15 03:15:00'),
(97, 98, 5.00, 3.00, '2016-01-08 15:06:27', '2016-01-15 03:13:29'),
(98, 99, 5.00, 3.00, '2016-01-08 15:08:05', '2016-01-15 03:05:43'),
(99, 100, 5.00, 3.00, '2016-01-08 15:09:06', '2016-01-08 15:09:06'),
(100, 101, 5.00, 3.00, '2016-01-08 15:11:33', '2016-01-15 03:02:05'),
(101, 102, 5.00, 3.00, '2016-01-08 15:13:30', '2016-01-15 03:04:02'),
(102, 103, 5.00, 3.00, '2016-01-08 15:14:25', '2016-01-15 03:12:30'),
(103, 104, 5.00, 3.00, '2016-01-08 15:15:33', '2016-01-15 03:01:24'),
(104, 105, 5.00, 3.00, '2016-01-08 15:17:05', '2016-01-15 03:19:33'),
(105, 106, 5.00, 3.00, '2016-01-08 15:20:20', '2016-01-15 02:57:02'),
(106, 107, 5.00, 3.00, '2016-01-08 15:21:23', '2016-01-08 15:21:23'),
(107, 108, 5.00, 3.00, '2016-01-08 15:27:51', '2016-01-15 03:00:52'),
(109, 110, 5.00, 3.00, '2016-01-14 01:56:38', '2016-01-15 02:49:44'),
(110, 111, 5.00, 3.00, '2016-01-15 02:46:22', '2016-01-15 02:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_non_academics`
--

CREATE TABLE IF NOT EXISTS `hris_employee_non_academics` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_non_academics`
--

INSERT INTO `hris_employee_non_academics` (`id`, `employee_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 7, 'Best Paper Award for the Paper "National Competency-Based Teachers Standards Assessment and Intervention, Awarded during the Mindanao Zonal Teacher Education Forum by Western Mindanao State University, Nov. 29, 2012', '2016-01-04 21:58:16', '2016-01-04 21:58:16'),
(2, 7, 'Best Journal Article Draft Award, Awarded by UP Mindanao / CHED Zonal Research Center, Region XI, Nov. 17, 2008', '2016-01-04 21:58:16', '2016-01-04 21:58:16'),
(3, 12, 'CICT - Project Coordinator', '2016-01-05 19:59:45', '2016-01-05 19:59:45'),
(4, 16, 'Award of Exemplary Performance Conferred by Tagum City LGU', '2016-01-05 21:56:19', '2016-01-05 21:56:19'),
(5, 16, 'AY Foundation Award for National Discipline', '2016-01-05 21:56:19', '2016-01-05 21:56:19'),
(6, 18, 'Loyalty Award (30 years in Service)', '2016-01-05 22:38:53', '2016-01-05 22:38:53'),
(7, 20, 'Spot Essay Contest Awardee 1995 - College', '2016-01-05 23:33:05', '2016-01-05 23:33:05'),
(8, 20, 'Campus Journalist 1996 - College', '2016-01-05 23:33:05', '2016-01-05 23:33:05'),
(9, 21, 'Gawad Saka Outstanding Agri - Fishery Scientist Region XI', '2016-01-05 23:52:00', '2016-01-05 23:52:00'),
(10, 21, 'Gawad - Saka Outstanding  Agri - Fishery Scientist (Davao Del Norte)', '2016-01-05 23:52:00', '2016-01-05 23:52:00'),
(15, 91, 'Resource Person in the Training og Trainors, USAID-RISE project, ISALAMBAD, Pakistan', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(16, 91, 'Voluntary Service Overseas in The Education Sector, NRSP - ISLAMABAD, Pakistan', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(17, 98, 'Delegate International Youth Festival Rome Italy', '2016-01-12 06:17:21', '2016-01-12 06:17:21'),
(18, 98, 'University of Mindanao 1996 Vinta Achievement Award 1995 Philippine', '2016-01-12 06:17:21', '2016-01-12 06:17:21'),
(19, 88, 'Tagum ROTARAC Golden Laces Leadership Awardee', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(20, 88, 'Tagum City Leadership Distinction Awardee', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(21, 88, 'Gov. Gelicio T. Gementiza Leadership Awardee', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(22, 88, 'UM Tagum College Institute Ledearship Awardee', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(23, 57, 'Certificate of Commendation', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(24, 83, 'PAVE Service Awardee', '2016-02-05 15:03:29', '2016-02-05 15:03:29'),
(25, 83, 'PAVE Service Awardee', '2016-02-05 15:03:29', '2016-02-05 15:03:29'),
(26, 83, 'Loyalty Awardee (25 years in government service)', '2016-02-05 15:03:29', '2016-02-05 15:03:29'),
(27, 83, 'Outstanding Alumnus-PNU ', '2016-02-05 15:03:29', '2016-02-05 15:03:29');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_organizations`
--

CREATE TABLE IF NOT EXISTS `hris_employee_organizations` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_organizations`
--

INSERT INTO `hris_employee_organizations` (`id`, `employee_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 2, 'Phillipine Institute & Certified Public Acountant ', '2016-01-04 18:40:50', '2016-01-04 18:40:50'),
(2, 7, 'Philippine Association for Teacher Education (PAFTE)', '2016-01-04 21:58:16', '2016-01-04 21:58:16'),
(3, 9, 'AACCUP - Accreditor', '2016-01-04 22:05:28', '2016-01-04 22:05:28'),
(4, 11, 'Philippine Society of Information Technology Educators Foundation', '2016-01-05 19:43:57', '2016-01-05 19:43:57'),
(5, 15, 'Francisco Adlaon Learning Institute PTCA, Inc.', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(6, 15, 'United  DNSC Employment, Inc', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(7, 15, 'DNSC Employment Cooperative, Inc', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(8, 15, 'DNSC Mutal Aid Asso., Inc', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(9, 17, 'PAFTE', '2016-01-05 22:12:39', '2016-01-05 22:12:39'),
(10, 18, 'Kapisanan ng mga Komiko ng Pilipinas Rehiyon X /XII INC.', '2016-01-05 22:38:53', '2016-01-05 22:38:53'),
(11, 18, 'Phil. Asso. for Teacher Educational IX', '2016-01-05 22:38:54', '2016-01-05 22:38:54'),
(12, 18, 'Phil. Society for The Study of Nature', '2016-01-05 22:38:54', '2016-01-05 22:38:54'),
(13, 18, 'National Voluntary Blood Service Program', '2016-01-05 22:38:54', '2016-01-05 22:38:54'),
(14, 18, 'Phil. GOV. Employees Asso.', '2016-01-05 22:38:54', '2016-01-05 22:38:54'),
(15, 19, 'DNSC Faculty Association', '2016-01-05 22:51:24', '2016-01-05 22:51:24'),
(16, 20, 'Faculty Association', '2016-01-05 23:33:05', '2016-01-05 23:33:05'),
(17, 20, 'PGEA', '2016-01-05 23:33:05', '2016-01-05 23:33:05'),
(18, 20, 'PABBSCU', '2016-01-05 23:33:06', '2016-01-05 23:33:06'),
(19, 20, 'PAGE', '2016-01-05 23:33:06', '2016-01-05 23:33:06'),
(20, 21, 'Phil. Fisheries Assoociation', '2016-01-05 23:52:00', '2016-01-05 23:52:00'),
(21, 21, 'Phillipine Society for The Study of Nature', '2016-01-05 23:52:00', '2016-01-05 23:52:00'),
(22, 21, 'Phillipine Association for Marine Science', '2016-01-05 23:52:00', '2016-01-05 23:52:00'),
(23, 70, 'Philippine Association for Teacher Education (PAFTE)', '2016-01-11 06:17:45', '2016-01-11 06:17:45'),
(24, 70, 'Faculty Association', '2016-01-11 06:17:45', '2016-01-11 06:17:45'),
(25, 70, 'Philippine Association for Vocationa Education', '2016-01-11 06:17:45', '2016-01-11 06:17:45'),
(31, 106, 'Professional Association of Diving Instructors', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(32, 91, 'DMMAAI and PAVE/UDEI', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(33, 91, 'DNSC employee cooperative', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(34, 91, 'Panabo Multi-Purpose Cooperative', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(35, 91, 'DNSC Facultty Association', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(36, 91, 'Phil. Statistical Association', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(37, 92, 'Philippine Agricultural Economics and Development Association, Inc. (PAEDA))', '2016-01-11 06:55:49', '2016-01-11 06:55:49'),
(38, 92, 'The Philippine Society for the Study of Nature', '2016-01-11 06:55:50', '2016-01-11 06:55:50'),
(39, 92, 'Accrediting Agency of Chartered Colleges and University in the Philippines, Inc.', '2016-01-11 06:55:50', '2016-01-11 06:55:50'),
(40, 92, 'Philippine Association for Teacher Education (PAFTE)', '2016-01-11 06:55:50', '2016-01-11 06:55:50'),
(41, 102, 'THETA SIGMA OMEGA', '2016-01-11 07:27:36', '2016-01-11 07:27:36'),
(42, 102, 'DNSC Faculty Club Assocn.', '2016-01-11 07:27:36', '2016-01-11 07:27:36'),
(43, 71, 'DNSC Mutual Aid, Inc.', '2016-01-11 07:31:10', '2016-01-11 07:31:10'),
(44, 71, 'DNSC Faculty Association', '2016-01-11 07:31:10', '2016-01-11 07:31:10'),
(45, 71, 'DNSC Employees Cooperative, Inc', '2016-01-11 07:31:10', '2016-01-11 07:31:10'),
(46, 71, 'United Davao del Norte State College Employees, Inc. (UDEI)', '2016-01-11 07:31:10', '2016-01-11 07:31:10'),
(47, 77, 'Philippine Fisheries Association', '2016-01-12 03:05:11', '2016-01-12 03:05:11'),
(48, 96, 'PSSN', '2016-01-12 05:31:55', '2016-01-12 05:31:55'),
(49, 96, 'SPVM', '2016-01-12 05:31:55', '2016-01-12 05:31:55'),
(50, 105, 'DNSC Faculty Association', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(51, 85, 'DNSC Employees Mutual Aide Association, Inc.', '2016-01-12 05:56:34', '2016-01-12 05:56:34'),
(52, 97, 'DNSC Employee Coop', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(53, 97, 'DNSC Faculty Association', '2016-01-12 06:12:58', '2016-01-12 06:12:58'),
(54, 97, 'Phil. Society on the Study of Nature', '2016-01-12 06:12:58', '2016-01-12 06:12:58'),
(55, 97, 'Mathematical Society of the Phil.', '2016-01-12 06:12:58', '2016-01-12 06:12:58'),
(56, 98, 'Philippine Folk Dance Society', '2016-01-12 06:17:21', '2016-01-12 06:17:21'),
(57, 98, 'Movimento Dei Focolare', '2016-01-12 06:17:21', '2016-01-12 06:17:21'),
(58, 98, 'Operation Build-up Movement', '2016-01-12 06:17:21', '2016-01-12 06:17:21'),
(59, 88, 'NCKC Choir Federation', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(60, 88, 'Punla Music Guild', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(61, 86, 'Phil. Association for Graduate Educator-Regional Chapter, Region', '2016-01-12 06:53:07', '2016-01-12 06:53:07'),
(62, 69, 'CHED  - MAED Scholars Association', '2016-01-12 07:08:31', '2016-01-12 07:08:31'),
(63, 69, 'Philippine Association for Vocational Education', '2016-01-12 07:08:31', '2016-01-12 07:08:31'),
(64, 28, 'UDEI, DNSC, Panabo City', '2016-01-14 01:07:25', '2016-01-14 01:07:25'),
(65, 28, 'DEMAAI, DNSC, Panabo City', '2016-01-14 01:07:25', '2016-01-14 01:07:25'),
(66, 28, 'COOP, DNSC, Panabo City', '2016-01-14 01:07:25', '2016-01-14 01:07:25'),
(67, 28, 'GASSO, DNSC, Panabo City', '2016-01-14 01:07:25', '2016-01-14 01:07:25'),
(68, 26, 'GASSO', '2016-01-14 01:10:22', '2016-01-14 01:10:22'),
(69, 57, 'UDEI Member', '2016-01-14 01:28:12', '2016-01-14 01:28:12'),
(70, 57, 'GASSO Member', '2016-01-14 01:28:12', '2016-01-14 01:28:12'),
(71, 57, 'GKK Member', '2016-01-14 01:28:12', '2016-01-14 01:28:12'),
(72, 33, 'DNSC Employees Mutual Aid Association (DEMAAI)', '2016-01-14 02:19:44', '2016-01-14 02:19:44'),
(73, 33, 'DNSC Employees Cooperative (DNSCEC)', '2016-01-14 02:19:44', '2016-01-14 02:19:44'),
(74, 33, 'General Adm. Support Staff Organization (GASSCO)', '2016-01-14 02:19:44', '2016-01-14 02:19:44'),
(75, 33, 'United DNSC Employees, Inc. (UDEI)', '2016-01-14 02:19:44', '2016-01-14 02:19:44'),
(80, 34, 'DNSC Employees Mutual Aid Association, Inc (DEMAAI)', '2016-01-14 02:43:45', '2016-01-14 02:43:45'),
(81, 34, 'Davao del Norte State College Employees Cooperative (DNSCEC)', '2016-01-14 02:43:45', '2016-01-14 02:43:45'),
(82, 34, 'United DNSC Employees, Inc. (UDEI)', '2016-01-14 02:43:45', '2016-01-14 02:43:45'),
(83, 34, 'General Administration and Support Services Organization (GASSO)', '2016-01-14 02:43:45', '2016-01-14 02:43:45'),
(84, 39, 'DNSC', '2016-01-14 02:54:56', '2016-01-14 02:54:56'),
(85, 47, 'DNSC Employees Mutual Aid Association (DEMAAI)', '2016-01-14 03:07:08', '2016-01-14 03:07:08'),
(86, 47, 'DNSC Employees Cooperative (DNSCEC)', '2016-01-14 03:07:08', '2016-01-14 03:07:08'),
(87, 47, 'United DNSC Employees Inc. (UDEI)', '2016-01-14 03:07:09', '2016-01-14 03:07:09'),
(88, 47, 'General Administration and Support Services Organization (GASSO)', '2016-01-14 03:07:09', '2016-01-14 03:07:09'),
(89, 38, 'DNSC, Staff College Manual Aide', '2016-01-14 03:08:33', '2016-01-14 03:08:33'),
(90, 38, 'DNSC Staff College Employee,(COOP)', '2016-01-14 03:08:33', '2016-01-14 03:08:33'),
(91, 61, 'Citizen''s Crime Watch (CCW)', '2016-01-14 06:00:13', '2016-01-14 06:00:13'),
(92, 61, 'Guardian Member', '2016-01-14 06:00:13', '2016-01-14 06:00:13'),
(93, 62, 'United DNSC Employees Inc.', '2016-01-14 06:23:20', '2016-01-14 06:23:20'),
(94, 62, 'DNSC Employees Mutual Cooperative Aide Inc.', '2016-01-14 06:23:20', '2016-01-14 06:23:20'),
(95, 62, 'DNSC Employees Cooperative', '2016-01-14 06:23:20', '2016-01-14 06:23:20'),
(96, 62, 'DNSC General Admin & Support Org.', '2016-01-14 06:23:20', '2016-01-14 06:23:20'),
(97, 31, 'DNSC Employees Mutual Aid Association', '2016-01-14 06:26:42', '2016-01-14 06:26:42'),
(98, 31, 'DNSC Employees Cooperative', '2016-01-14 06:26:42', '2016-01-14 06:26:42'),
(99, 31, 'DNSC General Admin & Support Org ', '2016-01-14 06:26:42', '2016-01-14 06:26:42'),
(100, 27, 'Davao Association of Guidance Counselor', '2016-01-15 02:17:45', '2016-01-15 02:17:45'),
(101, 83, 'Philippines Association of Teachers of Culture and the Arts (National)', '2016-02-05 15:03:30', '2016-02-05 15:03:30'),
(102, 83, 'AACUP National Accreditor ', '2016-02-05 15:03:30', '2016-02-05 15:03:30'),
(103, 83, 'Philippine Association for Language Teaching (PALT), UP Diliman', '2016-02-05 15:03:30', '2016-02-05 15:03:30'),
(104, 83, 'Reading Association of the Philippines (RAP), PNU/UP Diliman', '2016-02-05 15:03:30', '2016-02-05 15:03:30'),
(105, 83, 'Asia Pacific Student Services Association (APSSA-Singapore base) ', '2016-02-05 15:03:30', '2016-02-05 15:03:30');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_parents`
--

CREATE TABLE IF NOT EXISTS `hris_employee_parents` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `relationship` enum('mother','father') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_parents`
--

INSERT INTO `hris_employee_parents` (`id`, `employee_id`, `first_name`, `middle_name`, `last_name`, `relationship`, `created_at`, `updated_at`) VALUES
(3, 2, 'Serio Jr', 'Rocin', 'Labor', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, 'Mary Jean', 'Denila', 'Geollegue', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 4, 'Sergio', 'Prandas', 'Baba', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 4, 'Jesusa', 'Bautista', 'Celmar', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 5, 'Nestor', 'Curada', 'Alimboyong Sr.', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 5, 'Romana', 'Cemconiegue', 'Aranjuez', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 6, 'Carlos', 'Jalandra', 'Bantillo', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 6, 'Felicisima', 'Inguillo', 'Rubin', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 7, 'Rodolfo', 'Tingzon', 'Vergara', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 7, 'Lucia', 'Duro', 'Velasco', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 9, 'Ramon', 'Molinos', 'Salarda', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 9, 'Corazon', 'Botolina', 'Hamaybay', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 10, 'Rufo', 'Sarabillo', 'Alcoba', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 10, 'Asuncion', 'Melendres', 'Rabanos', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 11, 'Luisito', 'Tolentino', 'Saracin', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 11, 'Evelyn', 'Alberca', 'Talamera', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 12, 'Nicholas', 'Quintos', 'Masangkay', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 12, 'Amparo', 'Zurita', 'Aguilar', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 13, 'Sebastian', 'Timon', 'Delos Reyes', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 13, 'Petronila', 'Gitigan', 'Planos', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 14, 'Felipe', 'Gamad', 'Gamao', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 14, 'Lucresia', 'Octa', 'Castil', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 15, 'Eutiquio', 'Saranillo', 'Jakosalem', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 15, 'Zosima', 'Balbes', 'Arendain', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 16, 'Sergio', 'Orihuela', 'Cubillo', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 16, 'Lourdes', 'Lozada', 'Cubillo', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 17, 'Alfredo', 'Lolo', 'Ramos', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 17, 'Lydia', 'Salvo', 'Legista', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 18, 'Ernisto', 'Budas', 'Dasalla', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 18, 'MA. Luzviminda', 'Bondoc', 'Lungay', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 19, 'Desceased', 'Desceased', 'Desceased', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 19, 'Desceased', 'Desceased', 'Desceased', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 20, 'N/A', '', 'N/A', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 20, 'N/A', '', 'N/A', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 21, 'Deceased', 'Deceased', 'Deceased', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 21, 'Bernadita', 'Baes', 'Santiago', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 22, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 22, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 23, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 23, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 24, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 24, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 25, 'DECEASED', '', 'DECEASED', 'father', '0000-00-00 00:00:00', '2016-01-14 01:50:48'),
(46, 25, 'Catalina', 'Sagala', 'Hebra', 'mother', '0000-00-00 00:00:00', '2016-01-14 01:50:48'),
(47, 26, 'Godolfredo', 'Seques', 'Guiral', 'father', '0000-00-00 00:00:00', '2016-01-14 01:10:21'),
(48, 26, 'Emma', 'Martinote', 'Castillo', 'mother', '0000-00-00 00:00:00', '2016-01-14 01:10:21'),
(49, 27, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 27, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 28, 'Sixto', 'Bangura', 'Enumerables (DECEASED)', 'father', '0000-00-00 00:00:00', '2016-01-14 01:07:23'),
(52, 28, 'Minda', 'Morados', 'Enumerables', 'mother', '0000-00-00 00:00:00', '2016-01-14 01:07:23'),
(53, 29, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 29, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 30, 'Agripino', 'Mayola', 'Caballero', 'father', '0000-00-00 00:00:00', '2016-01-14 02:10:36'),
(56, 30, 'Edmunda', 'Dinsay', 'Caballero', 'mother', '0000-00-00 00:00:00', '2016-01-14 02:10:36'),
(57, 31, 'Nestorio', 'Menguez', 'Suan', 'father', '0000-00-00 00:00:00', '2016-01-14 06:26:40'),
(58, 31, 'Purificacion', 'Cuenca', 'Taytayon', 'mother', '0000-00-00 00:00:00', '2016-01-14 06:26:40'),
(59, 32, 'Sabino', 'Medania', 'Buladaco ', 'father', '0000-00-00 00:00:00', '2016-01-14 03:38:32'),
(60, 32, 'Pereitua', 'Ybanez', 'Dumangas', 'mother', '0000-00-00 00:00:00', '2016-01-14 03:38:32'),
(61, 33, 'Enrico', 'Gascon', 'Martin Sr.', 'father', '0000-00-00 00:00:00', '2016-01-14 02:19:42'),
(62, 33, 'Cresencia', 'Pineranda', 'Mapesos', 'mother', '0000-00-00 00:00:00', '2016-01-14 02:19:42'),
(63, 34, 'Silvestre', 'Celis', 'Melicor (DECEASED)', 'father', '0000-00-00 00:00:00', '2016-01-14 02:41:24'),
(64, 34, 'Romana', 'Chato', 'Labor', 'mother', '0000-00-00 00:00:00', '2016-01-14 02:41:24'),
(65, 35, 'DECEASED', '', 'DECEASED', 'father', '0000-00-00 00:00:00', '2016-01-14 01:17:49'),
(66, 35, 'Fercilita', 'Derecho', 'Dolfo', 'mother', '0000-00-00 00:00:00', '2016-01-14 01:17:49'),
(67, 36, 'Victor', 'Suazo', 'Lihay-Lihay', 'father', '0000-00-00 00:00:00', '2016-01-14 02:33:56'),
(68, 36, 'Rosalina', 'Mamad', 'Pascua', 'mother', '0000-00-00 00:00:00', '2016-01-14 02:33:56'),
(69, 37, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 37, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 38, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 38, 'Antonia', 'Ganancial', 'Ganadores', 'mother', '0000-00-00 00:00:00', '2016-01-14 03:08:32'),
(73, 39, 'Florentino', 'Taroroc', 'Glimada', 'father', '0000-00-00 00:00:00', '2016-01-14 02:54:55'),
(74, 39, 'Angela', 'Manura', 'Tanud-Tanud', 'mother', '0000-00-00 00:00:00', '2016-01-14 02:54:55'),
(75, 40, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 40, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 41, 'Getolio', 'Obsemar', 'Petilona', 'father', '0000-00-00 00:00:00', '2016-01-15 03:22:59'),
(78, 41, 'Sergia', 'Eleccion', 'Amado', 'mother', '0000-00-00 00:00:00', '2016-01-15 03:22:59'),
(79, 42, 'Eduardo Sr. (Deceased)', 'Salim', 'Salas', 'father', '0000-00-00 00:00:00', '2016-01-15 03:06:20'),
(80, 42, 'Silvina', 'Rapirap', 'Quipit', 'mother', '0000-00-00 00:00:00', '2016-01-15 03:06:20'),
(81, 43, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 43, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 44, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 44, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 45, 'Dioscoro', 'Cale', 'Lopez', 'father', '0000-00-00 00:00:00', '2016-01-14 03:25:39'),
(86, 45, 'Gregoria', 'Ancajas', 'Ngoho', 'mother', '0000-00-00 00:00:00', '2016-01-14 03:25:39'),
(87, 46, 'Lemuel', 'Geocallo', 'Juntilla', 'father', '0000-00-00 00:00:00', '2016-01-14 01:40:34'),
(88, 46, 'Lydia', 'Elejorder', 'Elardo', 'mother', '0000-00-00 00:00:00', '2016-01-14 01:40:34'),
(89, 47, 'Esteban', 'Fundal', 'Garbosa (DECEASED)', 'father', '0000-00-00 00:00:00', '2016-01-14 03:07:07'),
(90, 47, 'Ismaelita', 'Gape', 'Gardose', 'mother', '0000-00-00 00:00:00', '2016-01-14 03:07:07'),
(91, 48, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 48, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 49, 'Petronilo', 'Mamongan', 'Mendez', 'father', '0000-00-00 00:00:00', '2016-01-14 07:40:30'),
(94, 49, 'Clara', 'Gabaya', 'Mendez', 'mother', '0000-00-00 00:00:00', '2016-01-14 07:40:30'),
(95, 50, 'Leopardo (Deceased)', 'Campos', 'Salinas', 'father', '0000-00-00 00:00:00', '2016-01-14 01:42:03'),
(96, 50, 'Andronica  (Deceased)', 'Morgado', 'Orevillo', 'mother', '0000-00-00 00:00:00', '2016-01-14 01:42:03'),
(97, 51, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 51, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 52, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 52, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 53, 'Antonio', 'Talang', 'Catitig', 'father', '0000-00-00 00:00:00', '2016-02-04 13:52:46'),
(102, 53, 'Remedios', 'Cambari', 'Catitig', 'mother', '0000-00-00 00:00:00', '2016-02-04 13:52:46'),
(103, 54, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 54, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 55, 'Euiqiou ', 'Adag', 'Arcena Sr.', 'father', '0000-00-00 00:00:00', '2016-01-14 06:03:25'),
(106, 55, 'Emelian', 'Laurden', 'Arcceno', 'mother', '0000-00-00 00:00:00', '2016-01-14 06:03:25'),
(107, 56, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 56, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 57, 'Francisco Sr.', 'Abela', 'Turno', 'father', '0000-00-00 00:00:00', '2016-01-14 01:28:11'),
(110, 57, 'Florencia', 'Barbarona', 'Bastasa', 'mother', '0000-00-00 00:00:00', '2016-01-14 01:28:11'),
(111, 58, 'Vicente (deceased)', 'Bongbong', 'Mendoza', 'father', '0000-00-00 00:00:00', '2016-01-15 02:38:37'),
(112, 58, 'Aurelia', 'Cristinor', 'Mendoza', 'mother', '0000-00-00 00:00:00', '2016-01-15 02:38:37'),
(113, 59, 'Tereso', 'Pecache', 'Orma', 'father', '0000-00-00 00:00:00', '2016-01-14 01:59:07'),
(114, 59, 'Perpetua', 'Panes', 'Olmos', 'mother', '0000-00-00 00:00:00', '2016-01-14 01:59:07'),
(115, 60, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 60, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 61, 'Leodegario', 'Padernilla', 'Bañaria', 'father', '0000-00-00 00:00:00', '2016-01-14 06:00:12'),
(118, 61, 'Senita', 'Beatizola', 'Bañaria (DECEASED)', 'mother', '0000-00-00 00:00:00', '2016-01-14 06:00:12'),
(119, 62, 'Leopoldo', 'Araya', 'Cerbo', 'father', '0000-00-00 00:00:00', '2016-01-14 06:23:19'),
(120, 62, 'Alicia', 'Belbis', 'Salvador', 'mother', '0000-00-00 00:00:00', '2016-01-14 06:23:19'),
(121, 63, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 63, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 64, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 64, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 65, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 65, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 66, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 66, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 67, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 67, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 68, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 68, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 69, 'Gregorio', 'Fuentes', 'Villanueva (DECEASED)', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 69, 'Teresa', 'Villanueva', 'Jacobo', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 70, 'Melanio', 'Sabando', 'Tripole', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 70, 'Nenita', 'Alvizo', 'Cotiangco', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 71, 'Elpidio Sr', 'Pendon', 'Benban', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 71, 'Picar', 'Flaviano', 'Fernandez', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 72, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 72, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 73, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 73, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 74, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 74, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 75, 'Crispin Jr', 'Porlas', 'Sotomil', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 75, 'Erlinda', 'Apud', 'Paulo', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 76, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 76, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 77, 'Felixberto', 'Tac-an', 'Ranara', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 77, 'Azucena', 'Braganza', 'Bueno', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 78, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 78, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 79, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 79, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 80, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 80, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 81, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 81, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 82, 'Maximo', 'Bantayan', 'Bayacag', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 82, 'Juliana', 'Tudom', 'Casawaan', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 83, 'Leovigildo', 'Cervantes', 'Rubi', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 83, 'Martina', 'Intano', 'Loren', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 84, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 84, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 85, 'Nilo', 'Palomaria', 'Porras', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 85, 'Epifania', 'De Ocampo', 'Belacas', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 86, 'Eliseo', 'Matahum', 'Escoto', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 86, 'Simplicia', 'Endrina', 'Caparoso', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 87, 'Narciso', 'Cuario', 'Cereno', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 87, 'Beatriz', 'Peralta', 'Cortado', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 88, 'Booby', 'Allan', 'Hasan', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 88, 'Elizabeth', 'Erecre', 'Gonzales', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 89, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 89, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 90, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 90, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 91, 'Geronimo Sr,', 'Bersuela', 'Alegria', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 91, 'Conception', 'Guiso', 'Inrequez', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 92, 'Rosalino', 'Filarca', 'Palo Sr.', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 92, 'Rosita', 'Genabe', 'Palo', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 93, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 93, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 94, 'Isiaias', 'Aspacio', 'Alliones', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 94, 'Dolores', 'Siega', 'Dupay', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 95, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 95, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 96, 'Genaro', 'Gaballo', 'Plando', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 96, 'Sabina', 'Pamat', 'Abella', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 97, 'Rodolfo', 'Lleva', 'Lorin', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 97, 'Teofista', 'Dumandan', 'Victorillo', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 98, 'Rogelio', 'Castor', 'Magdayao', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 98, 'Josephine', 'Florida', 'Mabale', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 99, 'Valentin', 'Rasco', 'De La Cruz', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 99, 'Ceferina', 'Baldimor', 'Bergonia', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 100, 'Maximo Jr', 'Casana-an', 'Bayacag', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 100, 'Lily Andrea', 'Rocas', 'Cruspero', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 101, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 101, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 102, 'Zosimo', 'Languay', 'Duping', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 102, 'Leonisa', 'Panuda', 'Maguindanao', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 103, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 103, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 104, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 104, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 105, 'Edilberto', 'Hermosa', 'Contiangco', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 105, 'Josephine', 'Labsan', 'Contiangco', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 106, 'Mardonio', 'Mendoza', 'Eballe', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 106, 'Norma', 'Valencia', 'Cornelio', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 107, 'Carmelito ', 'Adducul ', 'Dalumay', 'father', '0000-00-00 00:00:00', '2016-02-04 13:56:51'),
(210, 107, 'Julieta ', 'Gammad ', 'Guimbangunan', 'mother', '0000-00-00 00:00:00', '2016-02-04 13:56:51'),
(211, 108, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 108, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 110, 'Federico', 'Indemne', 'Santamaria', 'father', '2016-01-14 01:57:01', '2016-01-14 01:57:01'),
(216, 110, 'Elenita', 'Tolintino', 'Saracin', 'mother', '2016-01-14 01:57:01', '2016-01-14 01:57:01'),
(217, 111, 'Jimmy', 'Edangga', 'Rafil', 'father', '2016-01-15 02:46:42', '2016-01-15 03:33:39'),
(218, 111, 'Cecilia', 'Baes', 'Rafil', 'mother', '2016-01-15 02:46:42', '2016-01-15 03:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_personnel_leave_card`
--

CREATE TABLE IF NOT EXISTS `hris_employee_personnel_leave_card` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `particulars` varchar(75) DEFAULT NULL,
  `vl_earned` double DEFAULT NULL,
  `vl_deduction_with_pay` double DEFAULT NULL,
  `vl_balance` double DEFAULT NULL,
  `vl_deduction_without_pay` double DEFAULT NULL,
  `sl_earned` double DEFAULT NULL,
  `sl_deduction_with_pay` double DEFAULT NULL,
  `sl_balance` double DEFAULT NULL,
  `sl_deduction_without_pay` double DEFAULT NULL,
  `remarks` varchar(75) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_personnel_performances`
--

CREATE TABLE IF NOT EXISTS `hris_employee_personnel_performances` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `strategic_function` double(5,2) NOT NULL,
  `core_function` double(5,2) NOT NULL,
  `average` double(5,2) NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_q_c_es`
--

CREATE TABLE IF NOT EXISTS `hris_employee_q_c_es` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `instruction` double(5,2) NOT NULL,
  `self` double(5,2) NOT NULL,
  `supervisor` double(5,2) NOT NULL,
  `peers` double(5,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_references`
--

CREATE TABLE IF NOT EXISTS `hris_employee_references` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_skills`
--

CREATE TABLE IF NOT EXISTS `hris_employee_skills` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `skill` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_skills`
--

INSERT INTO `hris_employee_skills` (`id`, `employee_id`, `skill`, `created_at`, `updated_at`) VALUES
(1, 2, 'Sing and Dance', '2016-01-04 18:40:49', '2016-01-04 18:40:49'),
(2, 2, 'Plays Tennis, adminton & Softball', '2016-01-04 18:40:49', '2016-01-04 18:40:49'),
(3, 2, 'Proficient  in Microsoft Office', '2016-01-04 18:40:50', '2016-01-04 18:40:50'),
(4, 2, 'Fluent in English', '2016-01-04 18:40:50', '2016-01-04 18:40:50'),
(5, 4, 'Web Development on Open Sources', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(6, 4, 'Computer Literate', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(7, 5, 'Computer Troubleshooting', '2016-01-04 19:27:56', '2016-01-04 19:27:56'),
(8, 5, 'Software Operation/Installation ', '2016-01-04 19:27:56', '2016-01-04 19:27:56'),
(9, 5, 'Data Encoding/PC Operation', '2016-01-04 19:27:56', '2016-01-04 19:27:56'),
(10, 5, 'Computer Literacy/Application', '2016-01-04 19:27:57', '2016-01-04 19:27:57'),
(11, 7, 'Teaching hawaiian and philippine and foreign folk dances', '2016-01-04 21:58:16', '2016-01-04 21:58:16'),
(12, 9, 'Computer Literate', '2016-01-04 22:05:28', '2016-01-04 22:05:28'),
(13, 11, 'Computer Operator', '2016-01-05 19:43:56', '2016-01-05 19:43:56'),
(14, 12, 'Lan Installation', '2016-01-05 19:59:45', '2016-01-05 19:59:45'),
(15, 12, 'Computer Programming ', '2016-01-05 19:59:45', '2016-01-05 19:59:45'),
(16, 12, 'Driving', '2016-01-05 19:59:45', '2016-01-05 19:59:45'),
(17, 13, 'Local Area Nerworking Installation', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(18, 13, 'Computer Programming', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(19, 13, 'Driving', '2016-01-05 20:14:26', '2016-01-05 20:14:26'),
(20, 14, 'Basic Computer Troubleshooting ', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(21, 14, 'Basic Animation', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(22, 14, 'Graphics Design ', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(23, 14, 'Computer Programming', '2016-01-05 20:52:57', '2016-01-05 20:52:57'),
(24, 15, 'Writing ', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(25, 16, 'Cooking', '2016-01-05 21:56:19', '2016-01-05 21:56:19'),
(26, 16, 'Singing', '2016-01-05 21:56:19', '2016-01-05 21:56:19'),
(27, 16, 'Plays', '2016-01-05 21:56:19', '2016-01-05 21:56:19'),
(28, 16, 'Writging Journal', '2016-01-05 21:56:19', '2016-01-05 21:56:19'),
(29, 17, 'Playing Musical Instrument', '2016-01-05 22:12:39', '2016-01-05 22:12:39'),
(30, 18, 'Reading', '2016-01-05 22:38:53', '2016-01-05 22:38:53'),
(31, 18, 'Coaching', '2016-01-05 22:38:53', '2016-01-05 22:38:53'),
(32, 18, 'First Aid', '2016-01-05 22:38:53', '2016-01-05 22:38:53'),
(33, 18, 'Cooking', '2016-01-05 22:38:53', '2016-01-05 22:38:53'),
(34, 18, 'Computer Leterate', '2016-01-05 22:38:53', '2016-01-05 22:38:53'),
(35, 19, 'Table Tennis Trainor', '2016-01-05 22:51:23', '2016-01-05 22:51:23'),
(36, 19, 'Band Trainor', '2016-01-05 22:51:23', '2016-01-05 22:51:23'),
(37, 19, 'Playing Musical Instrument', '2016-01-05 22:51:24', '2016-01-05 22:51:24'),
(38, 20, 'Negotiation Skills', '2016-01-05 23:33:04', '2016-01-05 23:33:04'),
(39, 20, 'Computer Skills', '2016-01-05 23:33:04', '2016-01-05 23:33:04'),
(40, 20, 'Management Skills', '2016-01-05 23:33:04', '2016-01-05 23:33:04'),
(41, 20, 'Communication Skills', '2016-01-05 23:33:05', '2016-01-05 23:33:05'),
(42, 21, 'Reef Monitoring', '2016-01-05 23:52:00', '2016-01-05 23:52:00'),
(43, 21, 'SCUBA Diving ', '2016-01-05 23:52:00', '2016-01-05 23:52:00'),
(44, 70, 'Gardening', '2016-01-11 06:17:45', '2016-01-11 06:17:45'),
(45, 70, 'Typing', '2016-01-11 06:17:45', '2016-01-11 06:17:45'),
(46, 70, 'Cooking', '2016-01-11 06:17:45', '2016-01-11 06:17:45'),
(49, 106, 'Volleyball', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(50, 106, 'Open Water Scuba Diver', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(51, 91, 'Statistics', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(52, 91, 'Research', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(53, 91, 'Computer Literacy', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(54, 92, 'Research and Extension Works', '2016-01-11 06:55:49', '2016-01-11 06:55:49'),
(55, 92, 'Sewing', '2016-01-11 06:55:49', '2016-01-11 06:55:49'),
(56, 87, 'Driving', '2016-01-11 07:07:42', '2016-01-11 07:07:42'),
(57, 87, 'Baking', '2016-01-11 07:07:42', '2016-01-11 07:07:42'),
(58, 87, 'Data Processing', '2016-01-11 07:07:42', '2016-01-11 07:07:42'),
(59, 87, 'Research', '2016-01-11 07:07:42', '2016-01-11 07:07:42'),
(60, 75, 'Driving ', '2016-01-11 07:17:03', '2016-01-11 07:17:03'),
(61, 75, 'Diving', '2016-01-11 07:17:03', '2016-01-11 07:17:03'),
(62, 75, 'Playing Soccer and Basketball', '2016-01-11 07:17:03', '2016-01-11 07:17:03'),
(63, 75, 'Cooking', '2016-01-11 07:17:03', '2016-01-11 07:17:03'),
(64, 102, 'Hosting', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(65, 102, 'Acting', '2016-01-11 07:27:36', '2016-01-11 07:27:36'),
(66, 96, 'Cooking', '2016-01-12 05:31:55', '2016-01-12 05:31:55'),
(67, 105, 'Computer Literate ', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(68, 97, 'Gardening', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(69, 97, 'Consultant Research', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(70, 97, 'Research / Lecturer on Statistical', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(71, 97, 'Computer Literate ', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(72, 98, 'Traditional Dances', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(73, 98, 'Traditional Percussion Instruments', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(74, 98, 'Rondalla Player - Banduria', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(75, 98, 'Dance - Classical Ballet, Modern Contemporary, Jazz, Tap Dance', '2016-01-12 06:17:21', '2016-01-12 06:17:21'),
(76, 88, 'Painting / Caption Making', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(77, 88, 'Driving Light Vehicles', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(78, 88, 'Audio recording / Computer', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(79, 88, 'Playing Musical Instrument', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(80, 88, 'Singing, Song Composition and Arrangement', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(81, 99, 'Computer Literate', '2016-01-12 06:45:09', '2016-01-12 06:45:09'),
(82, 82, 'Sewing', '2016-01-12 06:51:19', '2016-01-12 06:51:19'),
(83, 69, 'Baking', '2016-01-12 07:08:31', '2016-01-12 07:08:31'),
(84, 69, 'Cooking', '2016-01-12 07:08:31', '2016-01-12 07:08:31'),
(85, 28, 'Singing and Dancing', '2016-01-14 01:07:25', '2016-01-14 01:07:25'),
(86, 26, 'Cooking', '2016-01-14 01:10:22', '2016-01-14 01:10:22'),
(87, 26, 'Needle Works', '2016-01-14 01:10:22', '2016-01-14 01:10:22'),
(88, 57, 'Chess', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(89, 25, 'Carpentry', '2016-01-14 01:50:48', '2016-01-14 01:50:48'),
(90, 110, 'Badminton Coach', '2016-01-14 01:57:01', '2016-01-14 01:57:01'),
(91, 110, 'Licensed Scuba Diver', '2016-01-14 01:57:01', '2016-01-14 01:57:01'),
(92, 110, 'Computer Literate ', '2016-01-14 01:57:02', '2016-01-14 01:57:02'),
(93, 36, 'Computer Literate ', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(94, 34, 'Playing Volleyball', '2016-01-14 02:43:44', '2016-01-14 02:43:44'),
(95, 34, 'Singing ', '2016-01-14 02:43:44', '2016-01-14 02:43:44'),
(96, 39, 'Basketball', '2016-01-14 02:54:56', '2016-01-14 02:54:56'),
(97, 47, 'Playing (e.g. Basketball, Volleyball)', '2016-01-14 03:07:08', '2016-01-14 03:07:08'),
(98, 38, 'Volleyball', '2016-01-14 03:08:33', '2016-01-14 03:08:33'),
(99, 38, 'Basketball', '2016-01-14 03:08:33', '2016-01-14 03:08:33'),
(100, 45, 'Aquarium Maintenace', '2016-01-14 03:25:40', '2016-01-14 03:25:40'),
(101, 45, 'Fish Identifacation', '2016-01-14 03:25:40', '2016-01-14 03:25:40'),
(102, 45, 'Scuba Diving', '2016-01-14 03:25:40', '2016-01-14 03:25:40'),
(103, 61, 'Martial Arts', '2016-01-14 06:00:13', '2016-01-14 06:00:13'),
(104, 61, 'Radio Operator', '2016-01-14 06:00:13', '2016-01-14 06:00:13'),
(105, 61, 'Driver License', '2016-01-14 06:00:13', '2016-01-14 06:00:13'),
(106, 62, 'Photography', '2016-01-14 06:23:20', '2016-01-14 06:23:20'),
(107, 31, 'Bookeeping', '2016-01-14 06:26:42', '2016-01-14 06:26:42'),
(113, 49, 'Volleyball', '2016-01-14 07:40:38', '2016-01-14 07:40:38'),
(115, 49, 'Boxing', '2016-01-14 07:40:38', '2016-01-14 07:40:38'),
(117, 49, 'Driving ', '2016-01-14 07:40:39', '2016-01-14 07:40:39'),
(119, 49, 'Playing Basketball', '2016-01-14 07:40:39', '2016-01-14 07:40:39'),
(120, 27, 'Playing Piano/Organ', '2016-01-15 02:17:45', '2016-01-15 02:17:45'),
(121, 27, 'Choral Conducting', '2016-01-15 02:17:45', '2016-01-15 02:17:45'),
(122, 58, 'Planning', '2016-01-15 02:38:38', '2016-01-15 02:38:38'),
(123, 58, 'Carpentre Work', '2016-01-15 02:38:39', '2016-01-15 02:38:39'),
(124, 58, 'Electrical Installation', '2016-01-15 02:38:39', '2016-01-15 02:38:39'),
(125, 42, 'Strumming the Guitar', '2016-01-15 03:06:22', '2016-01-15 03:06:22'),
(126, 42, 'Cooking', '2016-01-15 03:06:22', '2016-01-15 03:06:22'),
(127, 42, 'Sewing', '2016-01-15 03:06:22', '2016-01-15 03:06:22'),
(130, 111, 'Playing Musical Instrument', '2016-01-15 03:35:06', '2016-01-15 03:35:06'),
(131, 111, 'Computer Literate ', '2016-01-15 03:35:06', '2016-01-15 03:35:06'),
(132, 111, 'Driving', '2016-01-15 03:35:06', '2016-01-15 03:35:06'),
(133, 83, 'Reading', '2016-02-05 15:03:29', '2016-02-05 15:03:29'),
(134, 83, 'Writing', '2016-02-05 15:03:29', '2016-02-05 15:03:29');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_special_leaves`
--

CREATE TABLE IF NOT EXISTS `hris_employee_special_leaves` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `type` enum('personal milestone','filial obligation','personal transaction','parental obligation','domestic emergencies','calamity') COLLATE utf8_unicode_ci NOT NULL,
  `number_of_days` int(10) unsigned NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `status` enum('filed','recommended','unrecommended','approved','disapproved','certified','uncertified') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'filed',
  `number` enum('1','2','3') COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approved_by_id` int(10) unsigned DEFAULT NULL,
  `recommending_approval_id` int(10) unsigned DEFAULT NULL,
  `certified_by_id` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_spouse`
--

CREATE TABLE IF NOT EXISTS `hris_employee_spouse` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `occupation` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `employer_business_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `business_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephone_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_spouse`
--

INSERT INTO `hris_employee_spouse` (`id`, `employee_id`, `first_name`, `middle_name`, `last_name`, `occupation`, `employer_business_name`, `business_address`, `telephone_number`, `created_at`, `updated_at`) VALUES
(1, 4, 'Porferio', 'Sale', 'Baba', 'Self-Employed', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 7, 'Henry', 'Perez', 'Gonzales', 'Retired DNSC Employee', 'Davao del Norte State College', 'New Visayas, Panabo City', '(084) 628-4301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 10, 'Lemeul', 'Abaya', 'Gameng', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 11, 'Randy', 'Jayme', 'Bedoya', 'Barangay Official / Businessman', 'Barangay Nanyo', 'Nanyo, Panabo City', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 15, 'Henry', 'Tapican ', 'Lumaday ', 'Self-Employed ', 'N/A', 'N/A', 'N/A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 17, 'Robinson', 'Fernandez', 'Raiz', 'Farming', 'N/A', 'Asuncion Davao Del Norte', '0918-725-7954', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 18, 'Romeo', 'Celeste', 'Centina', 'Employee', 'UniFruitti Phillipines INC', 'Ilang, Tebungco, Davao City', '082238320', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 19, 'Joylyn', 'Atanoza', 'Bernaldiez', 'Teacher', 'Alejal National High School', 'Carmen, Davao del Norte', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 21, 'Pablo', 'Magdayao', 'Gumanao', 'Sales Manager', 'Vita Rich Company', 'Panacan, Davao City', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 70, 'Renante', 'Celeste', 'Rodriguez', 'Employee', 'TADECO', 'A.O. Floirendo, Panabo City', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 83, 'Elaine', 'Cortiz', 'Moreno', 'Self Employed', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 106, 'Riel', 'Eguna', 'Alipoyo', 'Welding', 'Ever Machine Shop', 'San Juan, Surigao City', '(086) 826-0412', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 91, 'Mangcasan', 'Cacasel', 'Indie', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 92, 'Albert', 'Jetizo', 'Tejada', 'Government Worker (City Security Unit)', 'LGU, Panabo City', 'Panabo City, Davao del Norte', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 75, 'Sol', 'Degamo', 'Sotomil', 'Government Employee', 'Davao del Norte State College', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 71, 'Pablo Jr.', 'Masillones', 'Manuales', 'Farming', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 94, 'Joedelito', 'Macas', 'Valiente', 'Teaching / Entrepreneurship', 'Valiant Technical Institute and Assessment Center, Inc.', 'Bangoy St., Salvacion, Panabo City', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 77, 'Mitzi', 'Fernandez', 'Ranara', 'Clerk', 'Philippine Rural Development Program', 'Davao City', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 100, 'Jerry', 'Barcenas', 'Torrejos', 'Driver', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 105, 'Irvin Glenn', 'Saracin', 'Santamaria', 'Laboratory Aide II', 'Davao del Norte State College', 'New Visayas, Panabo City', '084-628-4301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 85, 'Ramil', 'Baltazar', 'Piorac', 'Retired', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 97, 'Lisandro', 'Hipona', 'Picar', 'Self Employed', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 99, 'Renato', 'Ga', 'Fuentes', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 82, 'Jonathan', 'Dumawas', 'Bayaron', 'Retired', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 86, 'Jonathan', 'Hebra', 'Floro', 'Gov''t Employee', 'Davao del Norte state College', 'New Visayas, Panabo City', '84628431', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 69, 'Danilo', 'Lomboson', 'Aba', 'Seaman', 'Liones Navigation Inc.', 'Malate, Metro Manila', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 28, 'Kenny Allan', 'Pacba', 'Benigno', 'Government Employee', 'Davao del Norte State College', 'New Visayas, Panabo City', '(084)-628-4301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 26, 'Orlindo Sr.', 'Ramas', 'Cervantes', 'Bank Employee', 'Enterprise Bank Incorporation', 'Dalisay, Gante Road Tagum City', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 35, 'Ma. Leah', 'Magallanes', 'Padrogane', 'Housewife', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 57, 'Noemi', 'Peralta', 'Turno', 'Self Employed', 'Noemi Sari-Sari Store', 'Prk. Sankist Cagangohan Panabo City', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 46, 'Rolando', 'Gerodias', 'Edjec', 'Private Employee', 'Panabo Multi-Purpose Cooperative', 'Panabo City, Davao del Norte', '(084)-628-5240', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 50, 'Esperlita', 'Hangad', 'Saninas', 'Teacher', 'Little Panay Elementary School', 'Little Panay Panabo City', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 25, 'Mercedita', 'Escoto', 'Floro', 'Instructor', 'Davao del Norte State College', 'New Visayas, Panabo City', '(846)-828-4301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 110, 'Josidel', 'Contiangco', 'Santamaria', 'Instructor', 'Davao del Norte State Colleg', 'New Visayas Panabo City', '084-628-4301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 59, 'Rose', 'Jumao-as', 'Omana', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 36, 'Juluis ', 'Palomar', 'Catane', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 34, 'Eldy', 'Gardose', 'Garbosa', 'Government Employee', 'Davao del Norte State College', 'New Visayas, Panabo City', '(084)-628-4301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 39, 'Gloria', 'Malasarte', 'Glimada', 'Businesswoman', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 47, 'Celia', 'Melicor', 'Garbosa', 'Government Employee', 'Davao del Norte State College', 'New Visayas, Panabo City, Davao del Norte', '(084)-628-4301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 38, 'Josephine', 'Ledesma', 'Ganadores', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 32, 'Teofilo', 'Tingson ', 'Cabag', 'Farm Production Supervisor ', 'TADECO', 'A.O Floirend, Panabo City , Davao del Norte ', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 55, 'Julieta', 'Apostol', 'Arceno', 'House Keeper', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 62, 'Florida', 'Suan', 'Cerbo', 'Employee', 'Davao del Norte State College', 'New Visayas, Panabo City', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 31, 'Nelson', 'Salvador', 'Cerbo', 'Employee', 'Davao del Norte State College', 'New Visayas, Panabo City', '09153851132', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 49, 'Ma. Victoria', 'Ganancial', 'Mendez', 'Housewife', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 58, 'Marisa', 'Fariola', 'Mendoza', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 42, 'Esterio', 'Salim', 'Namuag (Deseased)', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 41, 'Remegia', 'Buguion', 'Petilona', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 111, 'Rio Jean', 'Bungabong', 'Rafil', 'Businesswoman', '', 'Salvacion Panabo City', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 53, 'Joel', 'Mapano', 'Maglinao', 'Philippine Navy', 'Armed Forces of the Philippines', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_training_programs`
--

CREATE TABLE IF NOT EXISTS `hris_employee_training_programs` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `number_of_hours` int(10) unsigned NOT NULL,
  `sponsored_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_training_programs`
--

INSERT INTO `hris_employee_training_programs` (`id`, `employee_id`, `title`, `start`, `end`, `number_of_hours`, `sponsored_by`, `created_at`, `updated_at`) VALUES
(1, 70, 'Seminar - Workshop on Understanding Food Fortification', '0000-00-00', '0000-00-00', 16, 'DOST in Collaboration with the Local Government Unit of Tagum City', '2016-01-11 06:17:45', '2016-01-11 06:17:45'),
(2, 70, 'Symposium on Organizational Management and Curriculum Development Towards Competent and Qualify Service', '0000-00-00', '0000-00-00', 8, 'DNSC Graduate School and Graduate School Society', '2016-01-11 06:17:45', '2016-01-11 06:17:45'),
(3, 70, '1st Faculty - Sponsored Re-echo Seminar', '0000-00-00', '0000-00-00', 8, 'DNSC Faculty Association', '2016-01-11 06:17:45', '2016-01-11 06:17:45'),
(4, 70, 'Regional Workshop on Instructional Materials Development', '0000-00-00', '0000-00-00', 16, 'Commission on Higher Education', '2016-01-11 06:17:45', '2016-01-11 06:17:45'),
(5, 70, 'Supply Chain Management Training', '0000-00-00', '0000-00-00', 20, 'Souther Mindanao Agricultural Resources Research ', '2016-01-11 06:17:45', '2016-01-11 06:17:45'),
(6, 83, 'Enhancing the Capacity of State Universities and Colleges in Informaion', '0000-00-00', '0000-00-00', 8, 'Microsoft, Intel, InfoTrans-PASUC', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
(7, 83, 'PMS-OPES Seminar Workshop', '0000-00-00', '0000-00-00', 24, 'CSC', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
(8, 83, 'Training on Regional Strategic Management and Curriculum Development', '0000-00-00', '0000-00-00', 52, 'Ched-DAP', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
(9, 83, '10th Annual Convention of the Philippine Society for the Study of Nature', '0000-00-00', '0000-00-00', 8, 'PSSN-UP', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
(10, 83, 'Symposium on Organizational Management and Curriculum Development Towa', '0000-00-00', '0000-00-00', 8, 'DNSC Graduate School', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
(11, 83, 'Re-Echo Seminar Workshop on Education', '0000-00-00', '0000-00-00', 16, 'DNSC institute of Education', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
(12, 83, 'PAGE Mindanao Zonal Conference', '0000-00-00', '0000-00-00', 16, 'PAGE Mindanao', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
(13, 106, 'Resource Person: Sea Cucumber Fishery Assessment and Species Identification Training Workshop', '0000-00-00', '0000-00-00', 24, 'Davao del Norte State College in Cooperation with UP - Marine Science Institute, CHED and PCAARRD', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(14, 106, 'Presenter: Agency in-house Review 2012: Species Inventory & Fisheries Assessment of Sea Cucumber in Key Marine Bio-Geopgraphic Regions in the Philippines: Fishery Independent', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(15, 106, 'Re-Echo Seminar - Workshop on Academic Management Competencies for Program Excellence', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(16, 106, 'Consultative Workshop on the Formulation of the Policies, Standards and Guidelines for Marine Biology Program', '0000-00-00', '0000-00-00', 8, 'Commission on Higher Education - Manila', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(17, 106, 'Seminar - Workshop: Academic Managers and Faculty Teaching Competencies Enhancement', '0000-00-00', '0000-00-00', 16, 'Institute of Education Davao del Norte State College', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(18, 92, 'Training-Workshop of AACCUP Accreditors on Outcomes Quality Assurance', '0000-00-00', '0000-00-00', 24, 'AACCUP Inc.', '2016-01-11 06:55:49', '2016-01-11 06:55:49'),
(19, 87, 'In House Proposal Review 2013', '0000-00-00', '0000-00-00', 8, 'DNSC-Research, Extension Production', '2016-01-11 07:07:42', '2016-01-11 07:07:42'),
(20, 87, 'Institute In- Service Echo Seminar', '0000-00-00', '0000-00-00', 8, 'Institute of Education, DNSC', '2016-01-11 07:07:42', '2016-01-11 07:07:42'),
(21, 75, 'Value Re-orientation Seminar', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College - DNSC', '2016-01-11 07:17:03', '2016-01-11 07:17:03'),
(22, 102, 'Workshop on Revisiting and Enhancing the SUCS'' Strategic Plans', '0000-00-00', '0000-00-00', 40, 'DEV. Academy of the Phil.', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(23, 102, 'Advocacy Forum on the National Development Roadmap on Restructuring of PPHEIS ', '0000-00-00', '0000-00-00', 8, 'RDC 11/ CHED 11', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(24, 102, '2012 Research Congress', '0000-00-00', '0000-00-00', 8, 'CHED/PAGE/CODGE', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(25, 102, '2012 Mindanao Communicator''s Congress And Workshop', '0000-00-00', '0000-00-00', 24, 'Mindanao Communicators Network, INC.', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(26, 77, 'Monitoring and Modified Triangular Method of seaweed farming', '0000-00-00', '0000-00-00', 16, 'DOST-PCAMMARD / DOST-XI / DTI - XI / RFTC-XI / BFAR XI / LBP / DNSC', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(27, 77, 'Seminar / Workshop on Start your business programme', '0000-00-00', '0000-00-00', 24, 'DOST - PCAMMRD / ILO', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(28, 77, 'Training on Course Module Writing', '0000-00-00', '0000-00-00', 16, 'USEP', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(29, 77, 'Training on Induced-spawning and Mariculture of Giant Clams', '0000-00-00', '0000-00-00', 32, 'DNSC / CHED', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(30, 77, '14th Annual RD&E review cum and techno-demo forum s&t planning worshop', '0000-00-00', '0000-00-00', 24, 'MSU-Naawan', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(31, 77, 'Freshwater Prawn Hatchery and Growout Operations', '0000-00-00', '0000-00-00', 40, 'AQD-SEAFDEC', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(32, 77, 'Training on Sustainable Fisheries Management in the Context of the Code of conduct for responsible fisheries', '0000-00-00', '0000-00-00', 40, 'PCAARD - DOST', '2016-01-12 03:05:11', '2016-01-12 03:05:11'),
(33, 100, 'New Revolution of Atomic Spectroscopy, an Atomic Emission Spectra that RUNS on AIR', '0000-00-00', '0000-00-00', 8, 'Souther Mindanao Analytical Laboratories Consortium', '2016-01-12 03:21:27', '2016-01-12 03:21:27'),
(34, 100, 'Empowering Teachers and Engaging Students in Learning, using online technology', '0000-00-00', '0000-00-00', 8, 'Educo Soft and DNSC', '2016-01-12 03:21:27', '2016-01-12 03:21:27'),
(35, 96, 'Trainers Training on Integrating Change, Adaptation, and DIsaster Management in Selected Curricula Regional Universities and Colleges Philippines', '0000-00-00', '0000-00-00', 16, 'MSU, UNDP, NEDA, PHILVOCS', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(36, 96, '1st Faculty Sponsored Seminar', '0000-00-00', '0000-00-00', 8, 'DNSC', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(37, 96, 'News Writing and Photoshop', '0000-00-00', '0000-00-00', 8, 'DNSC', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(38, 96, 'Empowering Teachers in Engaging in Learning Using Online', '0000-00-00', '0000-00-00', 8, 'DNSC EDUCOSOFT', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(39, 96, 'Strategic Planning Orientation', '0000-00-00', '0000-00-00', 8, 'DNSC', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(40, 96, 'REDAS Software Seminar', '0000-00-00', '0000-00-00', 48, 'DOST, CHED, PHIVOLCS', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(41, 105, 'Institute Development Planning Workshop', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(42, 105, 'Seminar / Workshop on Accreditation', '0000-00-00', '0000-00-00', 16, 'Davao del Norte State College', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(43, 105, 'Seminar / Workshop on Coastal Resource Management', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(44, 105, 'Seminar /  Workshop on Graduate Tracer Study', '0000-00-00', '0000-00-00', 16, 'Commission on Higher Education ', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(45, 105, 'Gender and Development Seminar', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(46, 105, 'Orientation/ Seminar on the Revised form of the Statement of Assets, Liabilities and Networth', '0000-00-00', '0000-00-00', 4, 'Davao del Norte State College', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(47, 105, 'Seminar / Training (FOLLET)', '0000-00-00', '0000-00-00', 24, 'Follet Software Company', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(48, 105, 'Citizen''s Charter Orientation', '0000-00-00', '0000-00-00', 4, 'Davao del Norte State College', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(49, 85, 'National Conference on innovative Educational Development Systems', '0000-00-00', '0000-00-00', 16, 'Development Academy of the Phils', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(50, 85, 'Citizen''s Charter Orientation', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(51, 85, 'Leadership Seminar', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(52, 85, 'Free and open source Software ICT Literacy & Gender & Development Seminar', '0000-00-00', '0000-00-00', 16, 'Davao del Norte State College', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(53, 85, 'Regional Worshop for GAD Plan and Budget Formulation', '0000-00-00', '0000-00-00', 8, 'RDC-XI / GAD Coordinating Committee', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(54, 85, 'Computer - Assisted Langauge', '0000-00-00', '0000-00-00', 32, 'USAID-GEM and DNSC', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(55, 85, 'Annual Development Planning and Assessment Workshop', '0000-00-00', '0000-00-00', 24, 'Davao del Norte State College', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(56, 85, 'Empowering Teachers in Engaging Students in Learning, Using On-line Technology', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College and EducoSoft', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(57, 85, 'News Writing and Photoshop Seminar Workshop', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(58, 85, 'NCBTS - based Syllabus Making Seminar', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(59, 85, 'DNSC Strategic Planning', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(60, 85, 'Mindanao Economy and Environment Summit', '0000-00-00', '0000-00-00', 16, 'Mindanao Development Authority', '2016-01-12 05:56:34', '2016-01-12 05:56:34'),
(61, 85, 'Advocacy Forum on National Development Road Map on Restructuring of the Philippine HEI', '0000-00-00', '0000-00-00', 8, 'Regional Development Council / CHED XI', '2016-01-12 05:56:34', '2016-01-12 05:56:34'),
(62, 85, 'Revisiting and Enhancing the SUC''s Strategic Plans', '0000-00-00', '0000-00-00', 24, 'Development Academy of the Philippines, CHED, PASUC', '2016-01-12 05:56:34', '2016-01-12 05:56:34'),
(63, 97, '2012 Philippines Statistical Association Annual Conference  - Davao City', '0000-00-00', '0000-00-00', 16, 'Philippines Statistical Association - National', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(64, 97, 'ICAST - Science / Applied International Coference - Kuantan Pahanh Malaysia', '0000-00-00', '0000-00-00', 48, 'International university of Malaysia  ', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(65, 97, '2013 National Convention - Mathematical Society of the Philippines - Palawan, Puerto Princcesa', '0000-00-00', '0000-00-00', 16, 'Mathematical Society of the Phil. - National', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(66, 88, 'Scientific Forum on Biotechnology for Communicators', '0000-00-00', '0000-00-00', 8, 'Biotechnology Coalition of the Phil. Biotech. for Life Media & Advocacy Resource Center', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(67, 88, 'Graduate School Research Forum', '0000-00-00', '0000-00-00', 8, 'UM Tagum College', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(68, 88, 'Institute In-Service Echo Seminar', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(69, 99, 'Unified Sports Programme and Operationalization of Philippine Sports Institute', '0000-00-00', '0000-00-00', 16, 'Philippine Sports Commission (PSU)', '2016-01-12 06:45:07', '2016-01-12 06:45:07'),
(70, 99, 'Investing in the Future: "A Teachers'' training on Implementing the NSTP"', '0000-00-00', '0000-00-00', 32, 'M.T. Calaw Institute; READ Foundation', '2016-01-12 06:45:07', '2016-01-12 06:45:07'),
(71, 99, 'Research Capability Enhancement Seminar - Workshop', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 06:45:07', '2016-01-12 06:45:07'),
(72, 99, 'Gender and Develoment Seminar', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 06:45:08', '2016-01-12 06:45:08'),
(73, 99, 'National Capabilty Enhancement Training for NSTP Trainers in the Successful Program Implementation of NSTP', '0000-00-00', '0000-00-00', 24, 'Philippine Society of NSTP Educators; T.U.P.; CHED-NCR', '2016-01-12 06:45:08', '2016-01-12 06:45:08'),
(74, 99, 'Research Methodologies, Experimental Design and Statistics', '0000-00-00', '0000-00-00', 8, 'Graduate School - Davao del Norte State College', '2016-01-12 06:45:08', '2016-01-12 06:45:08'),
(75, 99, 'CHED Regional Conference on National Service Training Program ( NSTP)', '0000-00-00', '0000-00-00', 8, 'Commission on Higher Education Region XI', '2016-01-12 06:45:08', '2016-01-12 06:45:08'),
(76, 99, 'Seminar on the proper decorum in Public Service', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 06:45:08', '2016-01-12 06:45:08'),
(77, 99, 'Seminar on the Revised Form of the Statement of Assets, Liablities, and Net Worth', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 06:45:08', '2016-01-12 06:45:08'),
(78, 99, 'Values Formation and Poverty Alleviation', '0000-00-00', '0000-00-00', 8, 'Provincial Government of Davao del Norte & Davao del Norte State College', '2016-01-12 06:45:08', '2016-01-12 06:45:08'),
(79, 99, 'Re-echo Seminar on the New Guidelines of NBC 461', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 06:45:08', '2016-01-12 06:45:08'),
(80, 99, 'Regional Folk Dance Workshop', '0000-00-00', '0000-00-00', 24, 'Samahang Tagapagtaguyod ng Katutubung Sayaw ng Pilipinas', '2016-01-12 06:45:09', '2016-01-12 06:45:09'),
(81, 99, '2012 Research Congress ', '0000-00-00', '0000-00-00', 8, 'CHED XI, PHIL Asso. for Graduate Education (PAGE XI)', '2016-01-12 06:45:09', '2016-01-12 06:45:09'),
(82, 99, 'Re-echo Seminar Workshop Academic Management Competencies for Program Excellence', '0000-00-00', '0000-00-00', 8, 'Davao del Norte State College', '2016-01-12 06:45:09', '2016-01-12 06:45:09'),
(83, 99, 'Seminar - Workshop: Academic Managers and Faculty Teaching Competencies Enhancement', '0000-00-00', '0000-00-00', 16, 'Institute of Education - Davao del Norte State College', '2016-01-12 06:45:09', '2016-01-12 06:45:09'),
(84, 86, 'CHED Xl- PAGE Xl, CODGE Xl, Research Congress', '0000-00-00', '0000-00-00', 8, 'Davao del Norte Sate College', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(85, 86, 'Features of Higher Education System in the US/Green Jobs and Decent Works', '0000-00-00', '0000-00-00', 8, 'Davo del Norte State College', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(86, 86, 'Post Harvest and Value-Adding of Milkfish', '0000-00-00', '0000-00-00', 16, 'Davao del Norte State College', '2016-01-12 06:53:07', '2016-01-12 06:53:07'),
(87, 86, 'Seminar on the Proper Decorum in Public Service', '0000-00-00', '0000-00-00', 8, 'Davo del Norte State College', '2016-01-12 06:53:07', '2016-01-12 06:53:07'),
(88, 86, 'Computer literacy Training- Basic Concepts, Interst, MS Word & MS Excel', '0000-00-00', '0000-00-00', 24, 'Davao del Norte Sate College', '2016-01-12 06:53:07', '2016-01-12 06:53:07'),
(90, 69, 'Accredited Competency Assesor for Aquaculture NC II', '0000-00-00', '0000-00-00', 0, '', '2016-01-12 07:08:31', '2016-01-12 07:08:31');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_utilities`
--

CREATE TABLE IF NOT EXISTS `hris_employee_utilities` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `can_file_vacation_leave` tinyint(1) NOT NULL DEFAULT '0',
  `can_file_sick_leave` tinyint(1) NOT NULL DEFAULT '0',
  `can_file_special_leave` tinyint(1) NOT NULL DEFAULT '0',
  `can_file_travel_order` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hris_employee_utilities`
--

INSERT INTO `hris_employee_utilities` (`id`, `employee_id`, `can_file_vacation_leave`, `can_file_sick_leave`, `can_file_special_leave`, `can_file_travel_order`) VALUES
(1, 2, 1, 1, 1, 1),
(2, 4, 1, 1, 1, 1),
(3, 5, 1, 1, 1, 1),
(4, 6, 1, 1, 1, 1),
(5, 7, 1, 1, 1, 1),
(6, 9, 1, 1, 1, 1),
(7, 10, 1, 1, 1, 1),
(8, 11, 1, 1, 1, 1),
(9, 12, 1, 1, 1, 1),
(10, 13, 1, 1, 1, 1),
(11, 14, 1, 1, 1, 1),
(12, 15, 1, 1, 1, 1),
(13, 16, 1, 1, 1, 1),
(14, 17, 1, 1, 1, 1),
(15, 18, 1, 1, 1, 1),
(16, 19, 1, 1, 1, 1),
(17, 20, 1, 1, 1, 1),
(18, 21, 1, 1, 1, 1),
(19, 22, 1, 1, 1, 1),
(20, 23, 1, 1, 1, 1),
(21, 24, 1, 1, 1, 1),
(22, 25, 1, 1, 1, 1),
(23, 26, 1, 1, 1, 1),
(24, 27, 1, 1, 1, 1),
(25, 28, 1, 1, 1, 1),
(26, 29, 1, 1, 1, 1),
(27, 30, 1, 1, 1, 1),
(28, 31, 1, 1, 1, 1),
(29, 32, 1, 1, 1, 1),
(30, 33, 1, 1, 1, 1),
(31, 34, 1, 1, 1, 1),
(32, 35, 1, 1, 1, 1),
(33, 36, 1, 1, 1, 1),
(34, 37, 1, 1, 1, 1),
(35, 38, 1, 1, 1, 1),
(36, 39, 1, 1, 1, 1),
(37, 40, 1, 1, 1, 1),
(38, 41, 1, 1, 1, 1),
(39, 42, 1, 1, 1, 1),
(40, 43, 1, 1, 1, 1),
(41, 44, 1, 1, 1, 1),
(42, 45, 1, 1, 1, 1),
(43, 46, 1, 1, 1, 1),
(44, 47, 1, 1, 1, 1),
(45, 48, 1, 1, 1, 1),
(46, 49, 1, 1, 1, 1),
(47, 50, 1, 1, 1, 1),
(48, 51, 1, 1, 1, 1),
(49, 52, 1, 1, 1, 1),
(50, 53, 1, 1, 1, 1),
(51, 54, 1, 1, 1, 1),
(52, 55, 1, 1, 1, 1),
(53, 56, 1, 1, 1, 1),
(54, 57, 1, 1, 1, 1),
(55, 58, 1, 1, 1, 1),
(56, 59, 1, 1, 1, 1),
(57, 60, 1, 1, 1, 1),
(58, 61, 1, 1, 1, 1),
(59, 62, 1, 1, 1, 1),
(60, 63, 1, 1, 1, 1),
(61, 64, 1, 1, 1, 1),
(62, 65, 1, 1, 1, 1),
(63, 66, 1, 1, 1, 1),
(64, 67, 0, 1, 1, 1),
(65, 68, 1, 1, 1, 1),
(66, 69, 1, 1, 1, 1),
(67, 70, 1, 1, 1, 1),
(68, 71, 0, 1, 1, 1),
(69, 72, 0, 1, 1, 1),
(70, 73, 1, 1, 1, 1),
(71, 74, 0, 1, 1, 1),
(72, 75, 1, 1, 1, 1),
(73, 76, 1, 1, 1, 1),
(74, 77, 1, 1, 1, 1),
(75, 78, 1, 1, 1, 1),
(76, 79, 1, 1, 1, 1),
(77, 80, 1, 1, 1, 1),
(78, 81, 1, 1, 1, 1),
(79, 82, 1, 1, 1, 1),
(80, 83, 1, 1, 1, 1),
(81, 84, 1, 1, 1, 1),
(82, 85, 1, 1, 1, 1),
(83, 86, 1, 1, 1, 1),
(84, 87, 1, 1, 1, 1),
(85, 88, 1, 1, 1, 1),
(86, 89, 1, 1, 1, 1),
(87, 90, 1, 1, 1, 1),
(88, 91, 1, 1, 1, 1),
(89, 92, 1, 1, 1, 1),
(90, 93, 1, 1, 1, 1),
(91, 94, 1, 1, 1, 1),
(92, 95, 1, 1, 1, 1),
(93, 96, 1, 1, 1, 1),
(94, 97, 1, 1, 1, 1),
(95, 98, 1, 1, 1, 1),
(96, 99, 0, 1, 1, 1),
(97, 100, 1, 1, 1, 1),
(98, 101, 1, 1, 1, 1),
(99, 102, 1, 1, 1, 1),
(100, 103, 1, 1, 1, 1),
(101, 104, 1, 1, 1, 1),
(102, 105, 1, 1, 1, 1),
(103, 106, 1, 1, 1, 1),
(104, 107, 1, 1, 1, 1),
(105, 108, 1, 1, 1, 1),
(107, 110, 1, 1, 1, 1),
(108, 111, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_voluntary_works`
--

CREATE TABLE IF NOT EXISTS `hris_employee_voluntary_works` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `organization_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organization_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `number_of_hours` int(10) unsigned NOT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_work_experiences`
--

CREATE TABLE IF NOT EXISTS `hris_employee_work_experiences` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `position_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `monthly_salary` double(8,2) NOT NULL,
  `salary_grade` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `status_of_appointment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `government_service` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_work_experiences`
--

INSERT INTO `hris_employee_work_experiences` (`id`, `employee_id`, `date_from`, `date_to`, `position_title`, `company`, `monthly_salary`, `salary_grade`, `status_of_appointment`, `government_service`, `created_at`, `updated_at`) VALUES
(1, 2, '2011-05-01', '2011-05-01', 'Acounting clerk', 'Info Opamin Auditing and Acounting', 0.00, 'N/A', 'Intern', 'no', '2016-01-04 18:40:49', '2016-01-04 18:40:49'),
(2, 2, '2013-04-20', '2013-06-04', 'Acountant', 'Mindanao Shoppers Daily Destination Corporation - SM Lanang Department Store', 12000.00, '5', 'Probitionary', 'no', '2016-01-04 18:40:49', '2016-01-04 18:40:49'),
(3, 4, '1988-04-03', '1989-12-31', 'Graders/College/Audio Visual Librarian', 'St. Peter''s  College of Toril', 2400.00, '', 'Probationary', 'no', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(4, 4, '1990-01-02', '1996-03-18', 'School Librarian I', 'Davao del Norte School of Fishieries', 5933.00, '10', 'Permanent', 'yes', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(5, 4, '1996-03-18', '1996-11-03', 'School Librarian III', 'Davao del Norte State College', 6568.00, '12', 'Permanent', 'yes', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(6, 4, '1996-11-03', '0000-00-00', 'College Librarian III', 'Davao del Norte State College', 33000.00, '18', 'Permanent', 'yes', '2016-01-04 19:02:44', '2016-01-04 19:02:44'),
(7, 7, '2007-07-31', '0000-00-00', 'Assistant Professor I', 'Davao del Norte State College', 13300.00, '', 'Permanent', 'yes', '2016-01-04 21:58:16', '2016-01-04 21:58:16'),
(8, 7, '2001-11-01', '2007-07-30', 'Instructor III', 'Davao del Norte State College', 11837.00, '', 'Permanent', 'yes', '2016-01-04 21:58:16', '2016-01-04 21:58:16'),
(9, 7, '1996-11-01', '2001-10-31', 'Instructor I', 'Davao del Norte State College', 11446.00, '', 'Permanent', 'yes', '2016-01-04 21:58:16', '2016-01-04 21:58:16'),
(10, 7, '1995-02-14', '1996-10-31', 'Teacher I', 'Davao del Norte State College', 6107.00, '', 'Permanent', 'yes', '2016-01-04 21:58:16', '2016-01-04 21:58:16'),
(11, 7, '1989-01-01', '1995-02-13', 'Teacher I', 'Davao del Norte School of Fisheries', 4966.00, '', 'Permanent', 'yes', '2016-01-04 21:58:16', '2016-01-04 21:58:16'),
(12, 7, '1985-07-08', '1988-12-31', 'Secondary School Teacher', 'Davao del Norte School of Fisheries', 1764.00, '', 'Permanent', 'yes', '2016-01-04 21:58:16', '2016-01-04 21:58:16'),
(13, 7, '1984-06-18', '1985-07-07', 'Secondary School Teacher', 'Davao del Norte School of Fisheries', 1053.00, '', 'Provi-sional', 'yes', '2016-01-04 21:58:16', '2016-01-04 21:58:16'),
(14, 9, '2011-06-01', '0000-00-00', 'Assistant Professor IV', 'Davao Del Norte State College', 28684.00, '', 'Permanent', 'yes', '2016-01-04 22:05:28', '2016-01-04 22:05:28'),
(15, 10, '1997-04-08', '0000-00-00', 'College Instructor', 'Davao del Norte State College', 22246.00, 'SG-15', 'Permanent', 'yes', '2016-01-04 22:19:31', '2016-01-04 22:19:31'),
(16, 10, '1996-04-01', '1996-06-30', 'I.T. Specialist', 'Computech Consultancy & Computer Service Inc.', 4500.00, '', 'Contractual', 'no', '2016-01-04 22:19:32', '2016-01-04 22:19:32'),
(17, 10, '1996-01-04', '1996-06-30', 'Instructor', 'Southern Mindanao Inst. of Technology', 3000.00, '', 'Contractual', 'no', '2016-01-04 22:19:32', '2016-01-04 22:19:32'),
(18, 11, '1998-07-23', '0000-00-00', 'Instructor I', 'Davao del Norte State College', 20750.00, '12-5', 'Permanent', 'yes', '2016-01-05 19:43:56', '2016-01-05 19:43:56'),
(22, 12, '1998-06-28', '0000-00-00', 'Assistant Professor I', 'DNSC', 0.00, '', 'Permanent', 'yes', '2016-01-05 19:59:45', '2016-01-05 19:59:45'),
(23, 12, '1994-10-10', '1998-06-05', 'Network Engr.', 'Columbia Comp Center', 0.00, '', 'Full Time', 'yes', '2016-01-05 19:59:45', '2016-01-05 19:59:45'),
(24, 12, '1992-06-15', '1994-06-02', 'Junior Instructor', 'STI College ', 0.00, '', 'Full Time', 'yes', '2016-01-05 19:59:45', '2016-01-05 19:59:45'),
(25, 13, '2002-07-08', '0000-00-00', 'College Instructor', 'Davao del Norte State College', 20800.00, '12', 'Permanent', 'yes', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(26, 13, '2000-06-01', '2002-05-02', 'College Instructor', 'SJN Borongan, E. Samar', 2100.00, '', 'Part Time', 'no', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(27, 13, '1999-06-07', '2001-10-20', 'Collge Instructor', 'ST. Mary''s College, E. Samar', 4600.00, '', 'Full Time', 'no', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(28, 14, '1996-01-04', '0000-00-00', 'Computer Technician', 'ALTURAS SUPERMARKET CORP.', 4500.00, '', 'Regular', 'no', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(29, 14, '1998-01-05', '0000-00-00', 'Computer Programmer', 'ALTURAS SUPERMARKET CORP.', 5500.00, '', 'Regular', 'no', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(30, 14, '2000-04-06', '0000-00-00', 'Instructor II', 'Southern Mindanao Institue Of Technology ', 6500.00, '', 'Regular', 'no', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(31, 14, '2007-06-01', '2007-04-09', 'Head Comp SCI Dept', 'University Of Mindanao', 19000.00, '', 'Regular', 'no', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(32, 14, '2007-09-07', '0000-00-00', 'DEAN', 'Davao del Norte State College', 19200.00, '12', 'Permanent', 'yes', '2016-01-05 20:52:56', '2016-01-05 20:52:56'),
(33, 15, '2009-01-01', '0000-00-00', 'INSTRUTOR II', 'Davao del Norte State College', 279288.00, '', 'Permanent', 'yes', '2016-01-05 21:41:38', '2016-01-05 21:41:38'),
(34, 16, '2000-04-17', '2001-03-30', 'Administrative Staff', 'Local Government Unit of Tagum', 6000.00, 'Contractual', '', 'yes', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(35, 16, '2002-08-01', '2006-05-31', 'Secretary to the President', 'Assumption College of Nabunturan', 7954.00, '', 'Regular', 'no', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(36, 16, '2006-06-01', '2007-05-31', 'Exec. Secretary to the President', 'Assumption College of Nabunturan', 8534.00, '', 'Regular', 'no', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(37, 16, '2007-06-01', '2015-04-11', 'Part-time Graduate School Faculty', 'Assumption College of Nabunturan', 7200.00, '', 'Part-time', 'no', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(38, 16, '2007-06-01', '2015-04-11', 'HRD-IN-CHARGE / MANAGER', 'Assumption Collge of Nabunturan', 13648.00, '', 'Regular', 'no', '2016-01-05 21:56:18', '2016-01-05 21:56:18'),
(39, 18, '1982-06-07', '0000-00-00', 'Assistant Professor I', 'Davao del Norte State College', 0.00, '', 'Permanent', 'yes', '2016-01-05 22:38:53', '2016-01-05 22:38:53'),
(40, 20, '2012-06-01', '0000-00-00', 'Instructor II', 'Davao del Norte State College', 257232.00, '13-1', 'Permanent', 'yes', '2016-01-05 23:33:03', '2016-01-05 23:33:03'),
(41, 21, '1989-11-07', '1981-06-09', 'Lab. Aide II', 'Davao del Norte State College', 27000.00, '', 'Permanent', 'yes', '2016-01-05 23:51:59', '2016-01-05 23:51:59'),
(42, 21, '2007-01-01', '2007-06-30', 'Assistant Professor III', 'Davao del Norte State College Panabo Davao', 176328.00, '', 'Permanent', 'yes', '2016-01-05 23:51:59', '2016-01-05 23:51:59'),
(43, 21, '1988-11-07', '1989-11-06', 'Chemistry Laboraty Aide I', 'Davao del Norte School of Fisheries Panabo Davao', 10116.00, '', 'Temporary', 'yes', '2016-01-05 23:51:59', '2016-01-05 23:51:59'),
(44, 70, '1999-11-01', '1999-12-31', 'Instructor I', 'Davao del Norte State College', 9910.00, '12-2', 'Permanent', 'yes', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(45, 70, '2000-07-01', '2001-10-31', 'Instructor I', 'Davao del Norte State College', 10901.00, '12-2', 'Permanent', 'yes', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(46, 70, '2001-11-01', '2004-10-31', 'Instructor II', 'Davao del Norte State College', 11837.00, '13-1', 'Permanent', 'yes', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(47, 70, '2004-11-01', '2011-05-30', 'Instructor II', 'Davao del Norte State College', 12134.00, '13-2', 'Permanent', 'yes', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(48, 70, '2011-05-31', '0000-00-00', 'Instructor III', 'Davao del Norte State College', 21346.00, '14-2', 'Permanent', 'yes', '2016-01-11 06:17:44', '2016-01-11 06:17:44'),
(49, 106, '1998-07-08', '0000-00-00', 'Instructor I', 'Davao del Norte State College', 20750.00, '12', 'Permanent', 'yes', '2016-01-11 06:37:33', '2016-01-11 06:37:33'),
(50, 91, '2012-06-01', '0000-00-00', 'Associate prof 4', 'Davao del Norte State College', 42.00, '22', 'Permanent', 'yes', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(51, 91, '2011-06-01', '2012-05-31', 'Associate prof III', 'Davao del norte state college', 37.00, '22', 'Permanent', 'yes', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(52, 91, '2011-06-01', '2012-03-31', 'Associate Prof III', 'Davao del Norte State College', 35.00, '21', 'Pemanent', 'yes', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(53, 91, '2010-06-24', '2011-05-31', 'Associate Prof III', 'Davao del Norte State College', 31.00, '21', 'Permanent', 'yes', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(54, 87, '2012-01-17', '0000-00-00', 'Instructor I', 'Davao del norte state college', 19.00, '', 'Permanent', 'yes', '2016-01-11 07:07:42', '2016-01-11 07:07:42'),
(55, 87, '2011-01-16', '2012-01-17', 'Instructor I', 'Davao del norte state college', 18.00, '', 'Temporary', 'yes', '2016-01-11 07:07:42', '2016-01-11 07:07:42'),
(56, 87, '2010-06-03', '2011-04-08', 'Substitute', 'Davao del norte state college', 7.00, '', 'Contractual', 'yes', '2016-01-11 07:07:42', '2016-01-11 07:07:42'),
(57, 87, '2009-06-01', '2010-04-08', 'Instructor I', 'Davao del norte state college', 13.00, 'Substitute', 'Substitute', 'yes', '2016-01-11 07:07:42', '2016-01-11 07:07:42'),
(58, 87, '2008-07-01', '2009-03-31', 'Instructor I', 'Davao Del Norte State College', 13.00, '', 'Substitute', 'yes', '2016-01-11 07:07:42', '2016-01-11 07:07:42'),
(59, 87, '1999-07-01', '2008-07-01', 'Instructor I', 'Davao Oriental State College of Science and Technology', 9.00, '', 'Part-Time', 'yes', '2016-01-11 07:07:42', '2016-01-11 07:07:42'),
(60, 75, '1984-07-06', '1985-07-15', 'Secondary School Teacher', 'Davao Regional Institute of Fisheries Technology', 957.00, '', 'Provisional', 'yes', '2016-01-11 07:17:02', '2016-01-11 07:17:02'),
(61, 75, '1985-07-16', '1986-07-15', 'Secondary School Teacher', 'Davao Regional Institute of Fisheries Technology', 1053.00, '', 'Provisional', 'yes', '2016-01-11 07:17:02', '2016-01-11 07:17:02'),
(62, 75, '1986-07-16', '1987-07-15', 'Secondary School Teacher', 'Davao Regional Institute of Fisheries Technology', 1053.00, '', 'Temporary', 'yes', '2016-01-11 07:17:03', '2016-01-11 07:17:03'),
(63, 75, '1989-11-01', '1989-12-31', 'Secondary School Teacher', 'Davao del Norte School of Fisheries', 2000.00, '', 'Temporary', 'yes', '2016-01-11 07:17:03', '2016-01-11 07:17:03'),
(64, 75, '1995-01-01', '1995-02-13', 'Teacher I', 'Davao del Norte School of Fisheries', 4933.00, '10', 'Permanent', 'yes', '2016-01-11 07:17:03', '2016-01-11 07:17:03'),
(65, 75, '1996-06-04', '1996-10-31', 'Teacher I', 'Davao del Norte State College', 6044.00, '10', 'Permanent', 'yes', '2016-01-11 07:17:03', '2016-01-11 07:17:03'),
(66, 75, '2001-07-01', '2001-10-31', 'Instructor I', 'Davao del Norte State College', 11837.00, '13', 'Permanent', 'yes', '2016-01-11 07:17:03', '2016-01-11 07:17:03'),
(67, 75, '2004-11-01', '0000-00-00', 'Instructor II', 'Davao del Norte State College', 12134.00, '13', 'Permanent', 'yes', '2016-01-11 07:17:03', '2016-01-11 07:17:03'),
(68, 102, '2008-08-01', '0000-00-00', 'Instructor', 'Davao del norte state college', 21.00, 'SG11', 'Pemanent', 'yes', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(69, 102, '2006-06-06', '2008-07-31', 'Part Time Intructor', 'Davao or. State College of Science and Technology', 6000.00, '', 'Contractual', 'yes', '2016-01-11 07:27:35', '2016-01-11 07:27:35'),
(70, 71, '2012-04-01', '0000-00-00', 'Assistant Professor II', 'Davao del Norte State College', 26878.00, '16', 'Permanent', 'yes', '2016-01-11 07:31:10', '2016-01-11 07:31:10'),
(71, 94, '2001-11-01', '2004-10-31', 'Instructor II', 'Davao del Norte State College', 11837.00, '13-1', 'Permanent', 'yes', '2016-01-12 02:41:03', '2016-01-12 02:41:03'),
(72, 94, '2004-11-01', '2006-12-31', 'Instructor II', 'Davao del Norte State College', 12134.00, '13-2', 'Permanent', 'yes', '2016-01-12 02:41:03', '2016-01-12 02:41:03'),
(73, 94, '2007-01-01', '2007-07-01', 'Assistant Professor I', 'Davao del Norte State College', 13300.00, '15', 'Permanent', 'yes', '2016-01-12 02:41:03', '2016-01-12 02:41:03'),
(74, 94, '2007-07-01', '2008-06-30', 'Assistant Professor I', 'Davao del Norte State College', 14630.00, '15-1', 'Permanent', 'yes', '2016-01-12 02:41:03', '2016-01-12 02:41:03'),
(75, 94, '2008-07-01', '2008-12-31', 'Assistant Professor I', 'Davao del Norte State College', 14682.00, '15-2', 'Permanent', 'yes', '2016-01-12 02:41:03', '2016-01-12 02:41:03'),
(76, 94, '2009-01-01', '2009-06-30', 'Assistant Professor I', 'Davao del Norte State College', 16093.00, '15-2', 'Permanent', 'yes', '2016-01-12 02:41:03', '2016-01-12 02:41:03'),
(77, 94, '2009-07-01', '2010-06-23', 'Assistant Professor I', 'Davao del Norte State College', 18292.00, '15-2', 'Permanent', 'yes', '2016-01-12 02:41:03', '2016-01-12 02:41:03'),
(78, 94, '2010-06-24', '0000-00-00', 'Assistant Professor I', 'Davao del Norte State College', 20827.00, '15-2', 'Permanent', 'yes', '2016-01-12 02:41:03', '2016-01-12 02:41:03'),
(79, 94, '2012-06-01', '0000-00-00', 'Assistant Professor II', 'Davao del Norte State College', 26878.00, '16-1', 'Permanent', 'yes', '2016-01-12 02:41:03', '2016-01-12 02:41:03'),
(80, 77, '1998-02-02', '0000-00-00', 'Aquatic Tech I / Instructor I', 'Davao del Norte State College', 20140.00, '12', 'Permanent', 'yes', '2016-01-12 03:05:10', '2016-01-12 03:05:10'),
(81, 100, '1998-07-08', '0000-00-00', 'Instructor I', 'Davao del Norte State College', 0.00, '', 'Permanent', 'yes', '2016-01-12 03:21:27', '2016-01-12 03:21:27'),
(82, 96, '1990-06-01', '1995-03-01', 'Teacher', 'Immaculate Heart of Mary Academy', 0.00, '', 'Temporary', 'no', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(83, 96, '1995-06-01', '0000-00-00', 'Instructor', 'Davao del Norte State College', 0.00, '', 'Permanent', 'yes', '2016-01-12 05:31:54', '2016-01-12 05:31:54'),
(84, 105, '1998-07-08', '0000-00-00', 'Instructor I', 'Davao del Norte State College', 20750.00, '5', 'Permanent', 'yes', '2016-01-12 05:34:49', '2016-01-12 05:34:49'),
(85, 85, '2012-06-01', '0000-00-00', 'Instructor III', 'Davao del Norte State College', 276528.00, '', 'Permanent', 'yes', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(86, 85, '2007-01-01', '2012-03-31', 'Instructor II', 'Davao del Norte State College', 238896.00, '', 'Permanent', 'yes', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(87, 85, '2002-11-18', '2008-12-31', 'Instructor I', 'Davao del Norte State College', 137352.00, '', 'Permanent', 'yes', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(88, 85, '2001-08-06', '2002-12-17', 'Instructor I', 'Davao del Norte State College', 134004.00, '', 'Temporary', 'yes', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(89, 85, '2001-07-16', '2001-08-05', 'Instructor I', 'Davao del Norte State College', 507.59, '', 'Contractual', 'yes', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(90, 85, '1999-07-12', '2001-07-15', 'Instructor', 'Davao del Norte State College', 12762.00, '', 'Temporary', 'yes', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(91, 85, '1992-01-15', '1999-07-01', 'Teacher I', 'A.O. Floirendo National High School', 105852.00, '', 'Regular', 'yes', '2016-01-12 05:56:33', '2016-01-12 05:56:33'),
(92, 97, '1998-07-08', '0000-00-00', 'Instructor 2', 'Davao del Norte State College', 21690.00, 'SG-13 Step 2', 'Permanent', 'yes', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(93, 97, '1997-04-01', '1997-10-01', 'Executive Direcctor', 'AMA Computer Learning Center (Davao)', 10000.00, '', 'Permanent', 'no', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(94, 97, '1993-09-01', '1997-03-01', 'Executive Director', 'SIAM Foundation, Inc, Cagayan de Oro City', 7500.00, '', 'Permanent', 'no', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(95, 97, '1991-04-01', '1993-03-01', 'Research Direcctor', 'AMA Computer Learning Center (Cagayan de Oro City)', 6500.00, '', 'Permanent', 'no', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(96, 97, '1991-06-01', '1992-03-01', 'College Instructor', 'Cagayan Capitol College ', 7800.00, '', 'Part Time', 'no', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(97, 97, '1990-06-01', '1991-03-01', 'Research Coordinator', 'Shaw Boulevard, Mandaluyong, Manila', 4000.00, '', 'Permanent', 'no', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(98, 97, '1990-06-01', '1991-03-01', 'Lecturer', 'International University - Manila', 5000.00, '', 'Part Time', 'no', '2016-01-12 06:12:57', '2016-01-12 06:12:57'),
(99, 98, '1991-01-08', '1998-06-07', 'Associate Professor I', 'University of Mindanao', 0.00, '', 'Permanent', 'no', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(100, 98, '1998-06-08', '0000-00-00', 'Assistant Professor I', 'Davao del Norte State College', 0.00, '15', 'Permanent', 'yes', '2016-01-12 06:17:20', '2016-01-12 06:17:20'),
(101, 88, '2012-06-01', '0000-00-00', 'Instructor I', 'Davao del Norte State College', 19900.00, '', 'Permanent', 'yes', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(102, 88, '2011-06-01', '2012-05-03', 'Laboratory School Teacher', 'Davao del Norte State College', 8000.00, '', 'Contractual', 'no', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(103, 88, '2009-02-01', '2011-03-11', 'Secreatary / HR Officer (OFW)', 'ABAJA Contracting Establishment', 18000.00, '', 'Contractual', 'no', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(104, 88, '2006-02-01', '2008-10-30', 'Voice Instructor', ' Aguinaldo Dance Studio', 5000.00, '', 'Contratual', 'no', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(105, 88, '2006-06-01', '2008-01-28', 'Instructor/NSTP Coordinator', 'Academia de Davao', 7000.00, '', 'Contratual', 'no', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(106, 88, '2005-11-15', '2006-02-25', 'Secretary - Operation Department', 'GV Appliance Corporation', 5000.00, '', 'Contractual', 'no', '2016-01-12 06:37:15', '2016-01-12 06:37:15'),
(107, 99, '1993-06-01', '1994-04-15', 'PE Teacher', 'Dominican College', 4000.00, '', 'Contractual', 'no', '2016-01-12 06:45:07', '2016-01-12 06:45:07'),
(108, 99, '1995-06-01', '1997-04-15', 'PE Teacher', 'Systems Plus Computer College', 5000.00, '', 'Contractual', 'no', '2016-01-12 06:45:07', '2016-01-12 06:45:07'),
(109, 99, '1998-07-08', '2012-04-01', 'Instructor I', 'Davao del Norte State College', 19047.00, '12-4', 'Permanent', 'yes', '2016-01-12 06:45:07', '2016-01-12 06:45:07'),
(110, 99, '2012-04-02', '0000-00-00', 'Instructor II', 'Davao del Norte State College', 19658.00, '13', 'Permanent', 'yes', '2016-01-12 06:45:07', '2016-01-12 06:45:07'),
(111, 86, '1998-07-08', '2016-01-12', 'Instructor lll', 'Davao del Norte State College', 23.00, '', 'Permanet', 'yes', '2016-01-12 06:53:06', '2016-01-12 06:53:06'),
(113, 69, '1983-06-14', '0000-00-00', 'Assitant Professor I', 'Davao del Norte State College', 0.00, 'Permanent', '', 'yes', '2016-01-12 07:08:30', '2016-01-12 07:08:30'),
(114, 28, '1983-04-01', '1983-05-01', 'Researcher / Clerk', 'SPDA - RO XI', 0.00, '', 'Apprentice', 'yes', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(115, 28, '1985-10-07', '1986-10-19', 'Illustrator', 'DRIFT', 655.00, '', 'Contractual', 'yes', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(116, 28, '1986-10-20', '1990-05-14', 'Clerk II', 'DANSOF / DRIFT', 666.00, '', 'Permanent', 'yes', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(117, 28, '1990-05-14', '1994-11-22', 'Disbursing Officer', 'DANSOF / DNSC', 2473.00, '', 'Permanent', 'yes', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(118, 28, '1994-12-01', '2003-12-31', 'Cashier I', 'Davao del Norte State College', 3906.00, '', 'Permanent', 'yes', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(119, 28, '2004-01-01', '0000-00-00', 'Administrative Officer I', 'Davao del Norte State College', 10704.00, '', 'Permanent', 'yes', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(120, 26, '1998-07-06', '0000-00-00', 'Nurse I', 'Davao del Norte State College', 19302.00, '', 'Permanent', 'yes', '2016-01-14 01:10:21', '2016-01-14 01:10:21'),
(121, 26, '1996-11-04', '1997-12-20', 'Public Health Nurse', 'Rural Health Unit Lianga', 7400.00, '', 'Contractual', 'yes', '2016-01-14 01:10:21', '2016-01-14 01:10:21'),
(122, 57, '1996-02-01', '0000-00-00', 'Farm Worker', 'Davao del Norte State College', 10270.00, '2', 'Permanent', 'yes', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(123, 57, '1991-02-15', '1993-01-31', 'Utility Worker', 'Davao del Norte School of Fisheries ', 2000.00, '1', 'Permanent', 'yes', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(124, 57, '1990-02-14', '1991-02-14', 'Utility Worker', 'Davao del Norte School of Fisheries ', 2000.00, '1', 'Temporary', 'yes', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(125, 57, '1990-01-01', '1990-02-13', 'Utility Worker', 'Davao del Norte School of Fisheries ', 1800.00, '1', 'Casual', 'yes', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(126, 57, '1986-05-01', '1989-08-30', 'Fishery Technician ', 'SELGA''S Fish Farm', 2000.00, '', 'Casual', 'no', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(127, 46, '1997-04-10', '1997-05-19', 'Practicumer', 'Rural Bank', 0.00, '', 'Practicumer', 'no', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(128, 46, '1998-08-16', '2001-05-31', 'Audit Clerk', 'Davao del Norte State College', 0.00, '', 'Contractual / Casual 2 mos.', 'yes', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(129, 46, '2001-06-16', '2003-06-08', 'Finance Clerk', 'Peerless Integrated Services Inc.', 0.00, '', 'Permanent', 'no', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(130, 46, '2003-07-09', '2006-06-08', 'Clerk I', 'Davao del Norte State College', 6039.00, '03-01', 'Permanent', 'yes', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(131, 46, '2006-06-09', '2009-06-30', 'Admin Aide III', 'Davao del Norte State College', 7489.00, '03-02', 'Permanent', 'yes', '2016-01-14 01:40:34', '2016-01-14 01:40:34'),
(132, 46, '2009-07-01', '0000-00-00', 'Admin Aide III', 'Davao del Norte State College', 10687.75, '03-03', 'Permanent', 'yes', '2016-01-14 01:40:35', '2016-01-14 01:40:35'),
(133, 50, '1995-02-14', '0000-00-00', 'Fisherman', 'Davao del Norte State College', 11040.00, '3-7', 'Permanent', 'yes', '2016-01-14 01:42:04', '2016-01-14 01:42:04'),
(134, 50, '1993-01-04', '1995-02-13', 'Fisherman', 'Davao del Norte School of Fisheries', 0.00, '', 'Permanent', 'yes', '2016-01-14 01:42:04', '2016-01-14 01:42:04'),
(135, 25, '1980-06-01', '0000-00-00', 'Fam Superintendent II', 'Davao del Norte State College', 26800.00, '', 'Permanent', 'yes', '2016-01-14 01:50:48', '2016-01-14 01:50:48'),
(137, 110, '1998-07-08', '0000-00-00', 'Laboratory Aide II', 'Davao del Norte State College', 0.00, '5', 'Permanent', 'yes', '2016-01-14 01:57:01', '2016-01-14 01:57:01'),
(138, 30, '1998-06-23', '0000-00-00', 'Records Officer I', 'Davao del Norte State College', 0.00, '', 'Permanent', 'yes', '2016-01-14 02:10:37', '2016-01-14 02:10:37'),
(139, 30, '1996-12-16', '1998-06-22', 'Clerk I', 'Davao del Norte State College', 0.00, '', 'Permanent', 'yes', '2016-01-14 02:10:37', '2016-01-14 02:10:37'),
(140, 30, '1996-03-01', '1996-12-15', 'Clerk', 'DITFI', 0.00, '', 'Contractual', 'no', '2016-01-14 02:10:37', '2016-01-14 02:10:37'),
(141, 30, '1995-11-01', '1995-12-20', 'Clerk', 'ATI - RFTC', 0.00, '', 'Contractual', 'yes', '2016-01-14 02:10:37', '2016-01-14 02:10:37'),
(142, 30, '1993-06-01', '1993-08-30', 'Clerk', 'Aspac International Air Freight', 0.00, '', 'Contractual ', 'no', '2016-01-14 02:10:37', '2016-01-14 02:10:37'),
(143, 30, '1993-01-10', '1993-05-30', 'Clerk', 'RP Chem, Inc.', 0.00, '', 'Contractual', 'no', '2016-01-14 02:10:37', '2016-01-14 02:10:37'),
(144, 30, '1992-03-01', '1992-12-01', 'Clerk', 'Biocon Internal Ohills, Inc.', 0.00, '', 'Contractual', 'no', '2016-01-14 02:10:37', '2016-01-14 02:10:37'),
(145, 33, '1997-06-16', '1997-09-30', 'Cashiering Aide', 'Davao del Norte State College', 207.09, '', 'Casual', 'yes', '2016-01-14 02:19:42', '2016-01-14 02:19:42'),
(146, 33, '1998-01-05', '1998-06-22', 'Cashiering Aide', 'Davao del Norte State College', 207.09, '', 'Casual', 'yes', '2016-01-14 02:19:42', '2016-01-14 02:19:42'),
(147, 33, '1998-06-23', '2003-12-31', 'Accounting Clerk III', 'Davao del Norte State College', 8906.00, '', 'Permanent', 'yes', '2016-01-14 02:19:42', '2016-01-14 02:19:42'),
(148, 33, '2004-01-01', '0000-00-00', 'Administrative Assistant II', 'Davao del Norte State College', 15693.00, '', 'Permanent', 'yes', '2016-01-14 02:19:43', '2016-01-14 02:19:43'),
(149, 36, '2008-08-04', '0000-00-00', 'Aqau.Tech.1', 'Davao del Norte State College', 0.00, '', 'Permanent', 'yes', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(150, 36, '2006-06-01', '2008-03-31', 'Instructor ', 'Davao Central College', 0.00, '', 'Contractual', 'yes', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(151, 36, '1996-06-01', '2002-05-31', 'Instructor ', 'Southern Philippines Agri Business and Marine and Aquatic School Technology (SPAMAST)', 0.00, '', 'Temporary', 'yes', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(154, 34, '2004-06-23', '0000-00-00', 'Administrative Assistant II', 'Davao del Norte State College', 15538.00, '08-3', 'Permanent', 'yes', '2016-01-14 02:43:44', '2016-01-14 02:43:44'),
(155, 39, '1989-12-03', '0000-00-00', 'Boatman', 'DNSC', 0.00, '', 'Permanent', 'yes', '2016-01-14 02:54:55', '2016-01-14 02:54:55'),
(156, 39, '0000-00-00', '1990-11-05', 'Boatman', 'DNSC', 0.00, '', 'Permanent', 'yes', '2016-01-14 02:54:55', '2016-01-14 02:54:55'),
(157, 39, '1989-04-02', '1989-11-05', 'Cook l', 'DANSOF', 0.00, '', 'Casual', 'yes', '2016-01-14 02:54:56', '2016-01-14 02:54:56'),
(158, 39, '1985-01-10', '1988-12-03', 'Security Guard', 'DRIFT', 0.00, '', 'Temporary', 'yes', '2016-01-14 02:54:56', '2016-01-14 02:54:56'),
(159, 39, '1982-01-01', '1985-01-01', 'NCMT-Instructor', 'DRIFT', 0.00, '', 'Casual', 'yes', '2016-01-14 02:54:56', '2016-01-14 02:54:56'),
(160, 47, '1987-01-13', '1987-12-31', 'Groundsman Gardener', 'Davao Regional Institute of Fisheries', 25.00, '', 'Casual', 'yes', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(161, 47, '1988-01-01', '1989-12-31', 'Janitor', 'Davao del Norte School of Fisheries', 2000.00, '', 'Temporary', 'yes', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(162, 47, '1990-01-01', '1990-12-12', 'Utility Worker I', 'Davao del Norte School of Fisheries', 2000.00, '', 'Temporary', 'yes', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(163, 47, '1990-12-13', '1991-12-12', 'Driver I', 'Davao del Norte School of Fisheries', 2156.00, '', 'Temporary', 'yes', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(164, 47, '1991-12-13', '2003-12-31', 'Driver I', 'Davao del Norte State College', 6664.00, '03-5', 'Permanent', 'yes', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(165, 47, '2004-01-01', '0000-00-00', 'Administrative Aide III', 'Davao del Norte State College', 11151.00, '03-8', 'Permanent', 'yes', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(166, 38, '1972-02-29', '1981-04-30', 'Fisherman', 'Aquamarine', 0.00, '', '', 'yes', '2016-01-14 03:08:33', '2016-01-14 03:08:33'),
(167, 45, '2008-10-29', '2012-01-15', 'Aquanist/Diver', 'China Oceanic Phil. Inc', 10537.67, '2', 'Regular', 'no', '2016-01-14 03:25:39', '2016-01-14 03:25:39'),
(168, 45, '0000-00-00', '2007-09-15', 'Community Organizer', 'Marine Aquarium Counsel', 15.00, '', 'Project', 'no', '2016-01-14 03:25:39', '2016-01-14 03:25:39'),
(169, 45, '2004-07-15', '2005-09-14', 'Community Development Worker', 'Feed the children Philippines Corp.', 7000.00, '', 'Project', 'no', '2016-01-14 03:25:39', '2016-01-14 03:25:39'),
(170, 45, '2003-11-18', '2004-06-11', 'Sales Account Officer', 'Vitarich Corp.', 5000.00, '', 'Temporary', 'no', '2016-01-14 03:25:39', '2016-01-14 03:25:39'),
(171, 45, '2003-02-06', '2003-05-30', 'Team Leader', 'Maharlika Agro MarineVentures Inc', 5000.00, '', 'Contratual', 'no', '2016-01-14 03:25:40', '2016-01-14 03:25:40'),
(172, 32, '1984-11-14', '1985-12-01', 'Records Aide', 'Davao Regional Institute Of Fisheries Technology', 25.00, '', 'Casual ', 'yes', '2016-01-14 03:38:32', '2016-01-14 03:38:32'),
(173, 32, '1985-12-02', '1986-12-31', 'Storekeeper I', 'Davao Regional Institute Of Fisheries Technology', 546.00, '', 'Permanent', 'yes', '2016-01-14 03:38:33', '2016-01-14 03:38:33'),
(174, 32, '1987-01-01', '1987-12-31', 'Bookkeeper I', 'Davao Regional Institute Of Fisheries Technology ', 1315.20, '', 'Contractual', 'yes', '2016-01-14 03:38:33', '2016-01-14 03:38:33'),
(175, 32, '1988-01-01', '1989-01-01', 'Dormitory Manager', 'Davao del Norte School Of Fisheries', 886.00, '', 'Temporary', 'yes', '2016-01-14 03:38:33', '2016-01-14 03:38:33'),
(176, 32, '1989-01-02', '1989-04-02', 'Clerk I', 'Davao del Norte School Of Fisheries', 32.85, '', 'Casual ', 'yes', '2016-01-14 03:38:33', '2016-01-14 03:38:33'),
(177, 32, '1989-04-03', '1990-12-12', 'Clerk I', 'Davao del Norte School Of Fisheries', 762.00, '', 'Permanent', 'yes', '2016-01-14 03:38:33', '2016-01-14 03:38:33'),
(178, 32, '1993-03-23', '1994-11-30', 'Acounting clerk II', 'Davao del Norte State College', 3273.00, '', 'Permanent', 'yes', '2016-01-14 03:38:33', '2016-01-14 03:38:33'),
(179, 32, '1993-03-23', '1994-03-22', 'Clerk II', 'Davao del Norte School Of Fisheries', 2250.00, '', 'Permanent', 'yes', '2016-01-14 03:38:33', '2016-01-14 03:38:33'),
(180, 32, '1994-12-01', '2003-12-21', 'Bookkeeper', 'Davao del Norte State College', 9378.00, '', 'Permanent', 'yes', '2016-01-14 03:38:33', '2016-01-14 03:38:33'),
(181, 32, '2004-01-01', '0000-00-00', 'Administrative Assistant II', 'Davao del Norte State College', 15850.00, '', 'Permanent', 'yes', '2016-01-14 03:38:33', '2016-01-14 03:38:33'),
(182, 61, '2011-01-20', '0000-00-00', 'Watchman I', 'Davao del Norte State College', 9675.00, '', 'Permanent', 'yes', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(183, 61, '2008-03-16', '2011-01-01', 'Security Guard', 'LXM Security and Allied Services, DNSC, Panabo City', 0.00, '', '', 'yes', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(184, 61, '2007-11-08', '2008-03-15', 'Security Guard', 'ACD Investigation Security Agency Inc. ', 0.00, '', '', 'no', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(185, 62, '1994-06-14', '0000-00-00', 'Administration Aide I', 'Davao del Norte State College', 9459.00, '', 'Permanent', 'yes', '2016-01-14 06:23:19', '2016-01-14 06:23:19'),
(186, 62, '1981-03-04', '1985-12-20', 'Lay-out artist', 'GIMA Printing Corporation', 12000.00, '', 'Regular', 'no', '2016-01-14 06:23:19', '2016-01-14 06:23:19'),
(187, 62, '1979-02-15', '1980-04-30', 'Survey Aide', 'Min. of Public Works & Highway', 0.00, '', 'Contractual', 'no', '2016-01-14 06:23:19', '2016-01-14 06:23:19'),
(188, 62, '1976-06-08', '1978-03-25', 'Lumber Grader', 'Valderamal Lumber Co., Inc.', 0.00, '', 'Regular', 'no', '2016-01-14 06:23:19', '2016-01-14 06:23:19'),
(189, 31, '1978-01-05', '1980-05-30', 'Bookkeeper', 'Trinity Sales', 0.00, '', 'Permanent', 'no', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(190, 31, '1980-06-01', '1980-12-30', 'Clerk', 'PEPSI-COLA Bottling Company', 0.00, '', 'Contractual', 'no', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(191, 31, '1981-01-15', '1981-11-30', 'Typist', 'GIMA Printing Corporation', 0.00, '', 'Contractual', 'no', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(192, 31, '1982-02-01', '1982-12-31', 'Clerk', 'JCH Trading', 0.00, '', 'Contractual', 'no', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(193, 31, '1983-01-15', '1983-10-30', 'Clerk', 'Trinidad Greenhills Subdivision', 0.00, '', 'Contractual', 'no', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(194, 31, '1984-01-02', '1984-06-30', 'Billing Clerk', 'Davao City Water District', 0.00, '', 'Contractual', 'no', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(195, 31, '1984-07-25', '1986-04-07', 'Clerk I', 'Davao Regional Institute of Fisheries Technology', 1453.20, '', 'Contractual', 'yes', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(196, 31, '1986-04-08', '1986-05-31', 'Accounting Clerk III', 'Davao del Norte School of Fisheries', 813.00, '', 'Permanent', 'yes', '2016-01-14 06:26:40', '2016-01-14 06:26:40'),
(197, 31, '1986-08-01', '1987-12-31', 'Accountant I', 'Davao Regional Institute of Fisheries Technology', 1604.40, '', 'Contractual', 'yes', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(198, 31, '1988-01-01', '1988-12-31', 'Clerk', 'Davao del Norte School of Fisheries', 722.17, '', 'Casual', 'yes', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(199, 31, '1989-01-02', '0000-00-00', 'Dormitory Manager I', 'Davao del Norte State College', 17209.00, '08', 'Permanent', 'yes', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(204, 49, '1934-02-08', '0000-00-00', 'Security Guard I', 'Davao del Norte State College', 24876.00, '', 'Permanent', 'yes', '2016-01-14 07:40:37', '2016-01-14 07:40:37'),
(205, 49, '1984-08-12', '0000-00-00', 'Watchman', 'Davao Regional Institute of Fisheries Techonology', 5382.00, '', 'Temporary', 'yes', '2016-01-14 07:40:37', '2016-01-14 07:40:37'),
(206, 27, '2006-06-28', '0000-00-00', 'Guidance ', 'Davao del Norte State College', 18000.00, '10', 'Permanent', 'no', '2016-01-15 02:17:45', '2016-01-15 02:17:45'),
(207, 27, '2003-09-01', '2003-02-25', 'Community Relation Officer', 'Tagum Agriculture Development Co.', 8000.00, '', 'Contractual', 'no', '2016-01-15 02:17:45', '2016-01-15 02:17:45'),
(208, 27, '1998-09-01', '2001-02-25', 'Guidance Counseling ', 'West Negros College', 0.00, '10000', 'Permanent', 'no', '2016-01-15 02:17:45', '2016-01-15 02:17:45'),
(209, 58, '1997-01-19', '1981-01-19', 'Storage Man', 'Refrigerator/SMI', 4600.00, '', 'Permanent', 'yes', '2016-01-15 02:38:37', '2016-01-15 02:38:37'),
(210, 58, '1994-01-19', '1997-01-19', 'Supervisor', 'Refrigerator/SMI', 4100.00, '', '', 'yes', '2016-01-15 02:38:37', '2016-01-15 02:38:37'),
(211, 58, '1987-01-19', '1994-01-19', 'Machine Operator', 'Refrogerator/SMI', 2786.00, '', 'Permanent', 'yes', '2016-01-15 02:38:37', '2016-01-15 02:38:37'),
(212, 58, '1985-01-09', '1987-01-19', 'Rewinder', 'Costelo Elec. Shop', 0.00, '', '', 'yes', '2016-01-15 02:38:37', '2016-01-15 02:38:37'),
(213, 42, '1989-02-02', '1992-08-15', 'Auditing Clerk', 'Department of AgricultureTagum City', 2370.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(214, 42, '0000-00-00', '1988-08-19', 'Auditing Clerk ', 'DENR - Penro Tagum City', 2370.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(215, 42, '1998-08-20', '1999-12-31', 'Clerk II', 'Davao del Norte State College', 5228.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(216, 42, '2000-01-01', '2001-06-30', 'Clerk II', 'Davao del Norte State College', 5751.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(217, 42, '2001-07-01', '2001-08-19', 'Clerk II', 'Davao del Norte State College', 6039.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(218, 42, '2001-08-20', '2003-03-16', 'Clerk II', 'Davao del Norte State College', 6189.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(219, 42, '2003-03-17', '2003-12-31', 'Clerk II', 'Davao del Norte State College', 6522.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(220, 42, '2004-01-01', '2006-03-31', 'Administrative Aide IV', 'Davao del Norte State College', 6522.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(221, 42, '2006-04-01', '2007-03-31', 'Administrative Aide IV', 'Davao del Norte State College', 6684.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(222, 42, '2007-08-01', '2008-07-31', 'Administrative Aide IV', 'Davao del Norte State College', 7352.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(223, 42, '2008-08-01', '2009-04-30', 'Administrative Aide IV', 'Davao del Norte State College', 8087.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(224, 42, '2009-05-01', '2009-07-31', 'Administrative Aide IV', 'Davao del Norte State College', 8290.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(225, 42, '2009-08-01', '2010-07-31', 'Administrative Aide IV', 'Davao del Norte State College', 9069.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(226, 42, '2010-08-01', '2011-05-31', 'Administrative Aide IV', 'Davao del Norte State College', 9848.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(227, 42, '2011-06-01', '2012-03-31', 'Administrative Aide IV', 'Davao del Norte State College', 10626.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(228, 42, '2012-04-01', '2012-06-30', 'Administrative Aide IV', 'Davao del Norte State College', 10763.00, '', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(229, 42, '2012-07-01', '0000-00-00', 'Administrative Aide IV', 'Davao del Norte State College', 11519.00, '4', 'Permanent', 'yes', '2016-01-15 03:06:20', '2016-01-15 03:06:20'),
(230, 41, '1978-01-19', '1999-01-19', 'Heavy Equipment Mechanic', 'Valderama Lumber Manufacturing Inc. Company', 3900.00, '', '', 'yes', '2016-01-15 03:22:59', '2016-01-15 03:22:59'),
(236, 111, '2013-01-02', '0000-00-00', 'Administration Aide I', 'Davao del Norte State College', 9000.00, '', 'Casual', 'yes', '2016-01-15 03:35:06', '2016-01-15 03:35:06'),
(237, 111, '2012-12-02', '2012-12-31', 'Administration Aide I', 'Davao del Norte State College', 9000.00, '', 'Casual', 'yes', '2016-01-15 03:35:06', '2016-01-15 03:35:06'),
(238, 111, '2009-01-01', '2012-12-29', 'Com. Tech', 'Davao del Norte State College', 6500.00, '', 'JO', 'yes', '2016-01-15 03:35:06', '2016-01-15 03:35:06'),
(239, 111, '2005-03-01', '2008-12-31', 'Com. Tech', 'Davao del Norte State College', 6500.00, '', 'JO', 'yes', '2016-01-15 03:35:06', '2016-01-15 03:35:06'),
(240, 111, '2000-10-01', '2004-09-30', 'Tech. Support', 'Columbia Computer Center ', 5000.00, '', 'Regular', 'yes', '2016-01-15 03:35:06', '2016-01-15 03:35:06');

-- --------------------------------------------------------

--
-- Table structure for table `hris_failed_jobs`
--

CREATE TABLE IF NOT EXISTS `hris_failed_jobs` (
`id` int(10) unsigned NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_forms`
--

CREATE TABLE IF NOT EXISTS `hris_forms` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restricted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_forms`
--

INSERT INTO `hris_forms` (`id`, `name`, `description`, `path`, `type`, `restricted`, `created_at`, `updated_at`) VALUES
(1, 'Regular Leave Form', 'Form for filing regular leave request', 'app/templates/LeaveRequestForm.xlsx', 'excel', 1, '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(2, 'Personal Data Sheet', 'Form for personal data sheet', 'app/templates/PersonalDataSheet.xlsx', 'excel', 1, '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(3, 'Special Leave Form', 'Form for filing special leave request', 'app/templates/SpecialLeaveForm.xlsx', 'excel', 1, '2015-11-27 03:05:19', '2015-11-27 03:05:19'),
(4, 'Travel Order Form', 'Form for filing travel order', 'app/templates/TravelOrderForm.xlsx', 'excel', 1, '2015-11-27 03:05:19', '2015-11-27 03:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `hris_jobs`
--

CREATE TABLE IF NOT EXISTS `hris_jobs` (
`id` bigint(20) unsigned NOT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_logs`
--

CREATE TABLE IF NOT EXISTS `hris_logs` (
`id` int(10) unsigned NOT NULL,
  `status_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(11) DEFAULT NULL,
  `trace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_messages`
--

CREATE TABLE IF NOT EXISTS `hris_messages` (
`id` int(10) unsigned NOT NULL,
  `sender_id` int(10) unsigned NOT NULL,
  `message_group_id` int(10) unsigned NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('read','unread') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_message_groups`
--

CREATE TABLE IF NOT EXISTS `hris_message_groups` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_message_group_members`
--

CREATE TABLE IF NOT EXISTS `hris_message_group_members` (
`id` int(10) unsigned NOT NULL,
  `message_group_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_message_informations`
--

CREATE TABLE IF NOT EXISTS `hris_message_informations` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `message_id` int(10) unsigned NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `time_seen` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_migrations`
--

CREATE TABLE IF NOT EXISTS `hris_migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_migrations`
--

INSERT INTO `hris_migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_08_29_050310_create_employees_table', 1),
('2015_08_29_053252_create_employee_address_table', 1),
('2015_08_29_053847_create_employee_spouse_table', 1),
('2015_08_29_055104_create_employee_child_table', 1),
('2015_08_29_055727_create_employee_parents_table', 1),
('2015_08_29_060606_create_employee_civil_services_table', 1),
('2015_08_29_061050_create_employee_educations_table', 1),
('2015_08_29_061647_create_notifications_table', 1),
('2015_08_29_064518_create_employee_leaves_table', 1),
('2015_08_29_065928_create_settings_table', 1),
('2015_08_29_071322_create_departments_table', 1),
('2015_08_29_071745_create_trainings_table', 1),
('2015_08_29_072100_create_training_participants_table', 1),
('2015_08_29_072423_create_leave_credits_table', 1),
('2015_08_29_073306_create_employee_non_academics_table', 1),
('2015_08_29_073430_create_employee_organizations_table', 1),
('2015_08_29_073722_create_employe_references_table', 1),
('2015_08_29_074116_create_employee_skills_table', 1),
('2015_08_29_074522_create_employe_training_programs_table', 1),
('2015_08_29_074802_create_employee_voluntary_works_table', 1),
('2015_08_29_075150_create_employee_work_experiences_table', 1),
('2015_09_01_143231_create_department_heads_table', 1),
('2015_09_01_144249_add_department_id_to_users_table', 1),
('2015_09_07_142400_create_employee_special_leaves_table', 1),
('2015_09_08_223556_create_configs_table', 1),
('2015_09_11_034919_create_travel_orders_table', 1),
('2015_09_11_070021_create_forms_table', 1),
('2015_09_12_154802_create_jobs_table', 1),
('2015_09_13_121021_create_salary_table', 1),
('2015_09_15_044021_create_session_table', 1),
('2015_09_22_152048_create_failed_jobs_table', 1),
('2015_09_24_144311_create_messages_table', 1),
('2015_10_02_092942_create_phpdebugbar_table', 1),
('2015_10_17_175031_create_employee_accumulated_leaves_table', 1),
('2015_10_17_180416_create_employee_leave_credits_table', 1),
('2015_10_22_185550_create_employee_personnel_performances_table', 1),
('2015_10_28_105117_create_employee_q_c_es_table', 1),
('2015_10_29_110749_create_positions_table', 1),
('2015_10_29_111733_create_user_positions_table', 1),
('2015_10_30_095558_create_logs_table', 1),
('2015_11_01_195328_create_todos_table', 1),
('2015_11_14_120218_create_message_groups_table', 1),
('2015_11_14_120253_create_message_group_members_table', 1),
('2015_11_14_122901_add_message_group_id_to_messages_table', 1),
('2015_11_19_182111_create_message_informations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hris_notifications`
--

CREATE TABLE IF NOT EXISTS `hris_notifications` (
`id` int(10) unsigned NOT NULL,
  `sent_to` int(10) unsigned NOT NULL,
  `sent_by` int(10) unsigned NOT NULL,
  `object_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_password_resets`
--

CREATE TABLE IF NOT EXISTS `hris_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_positions`
--

CREATE TABLE IF NOT EXISTS `hris_positions` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_positions`
--

INSERT INTO `hris_positions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'President', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(2, 'Finance Director', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(3, 'Faculty', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(4, 'Chief Adm. Officer', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(5, 'Accountant III', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(6, 'College Librarian II', '2015-11-27 03:05:16', '2015-11-27 03:05:16'),
(7, 'Registrar III', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(8, 'Admin Officer V', '2015-11-27 03:05:17', '2016-02-03 03:29:39'),
(9, 'Farm Supt. II', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(10, 'Nurse I', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(11, 'Guidance Counselor I', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(12, 'Admin Officer I', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(13, 'Dorm Manager', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(14, 'Admin Asst. II', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(15, 'Launch Patron', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(16, 'Aquacultural Tech. I', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(17, 'Master Fisherman I', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(18, 'Boatswain', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(19, 'Admin Aide IV', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(20, 'Marine Engineman', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(21, 'Lab. Aide II', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(22, 'Quartermaster', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(23, 'Admin Aide III', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
(24, 'Cook I', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(25, 'Security Guard I', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(26, 'Fisherman I', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(27, 'Watchman I', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(28, 'Farm Worker I', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(29, 'Contruction & Maintenance. Man', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(30, 'Admin Aide I', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(31, 'Admin Aide', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(32, 'Professor VI', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(33, 'Professor III', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(34, 'Asst. Prof. I', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(35, 'Asst. Prof. II', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(36, 'Asst. Prof. III', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(37, 'Asst. Prof. IV', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(38, 'Asst. Prof. V', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(39, 'Instructor I', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(40, 'Instructor II', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(41, 'Instructor III', '2015-11-27 03:05:18', '2015-11-27 03:05:18'),
(42, 'Asso. Prof IV', '2015-11-28 15:07:54', '2015-11-28 15:07:54'),
(43, 'Asso. Prof III', '2016-01-02 18:34:41', '2016-01-02 18:34:41'),
(44, 'Asso. Prof V', '2016-01-02 18:41:50', '2016-01-02 18:41:50'),
(45, 'Asso. Prof I', '2016-01-02 18:47:07', '2016-01-02 18:47:07');

-- --------------------------------------------------------

--
-- Table structure for table `hris_sessions`
--

CREATE TABLE IF NOT EXISTS `hris_sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_settings`
--

CREATE TABLE IF NOT EXISTS `hris_settings` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `notify_via_system` tinyint(1) NOT NULL DEFAULT '1',
  `notify_via_email` tinyint(1) NOT NULL DEFAULT '1',
  `notify_via_sms` tinyint(1) NOT NULL DEFAULT '1',
  `language` enum('en','fil') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en'
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_settings`
--

INSERT INTO `hris_settings` (`id`, `user_id`, `notify_via_system`, `notify_via_email`, `notify_via_sms`, `language`) VALUES
(1, 1, 1, 1, 1, 'en'),
(2, 2, 1, 1, 1, 'en'),
(3, 3, 1, 1, 1, 'en'),
(4, 4, 1, 1, 1, 'en'),
(5, 5, 1, 1, 1, 'en'),
(6, 6, 1, 1, 1, 'en'),
(7, 7, 1, 1, 1, 'en'),
(8, 8, 1, 1, 1, 'en'),
(9, 9, 1, 1, 1, 'en'),
(10, 10, 1, 1, 1, 'en'),
(11, 11, 1, 1, 1, 'en'),
(12, 12, 1, 1, 1, 'en'),
(13, 13, 1, 1, 1, 'en'),
(14, 14, 1, 1, 1, 'en'),
(15, 15, 1, 1, 1, 'en'),
(16, 16, 1, 1, 1, 'en'),
(17, 17, 1, 1, 1, 'en'),
(18, 18, 1, 1, 1, 'en'),
(19, 19, 1, 1, 1, 'en'),
(20, 20, 1, 1, 1, 'en'),
(21, 21, 1, 1, 1, 'en'),
(22, 22, 1, 1, 1, 'en'),
(23, 23, 1, 1, 1, 'en'),
(24, 24, 1, 1, 1, 'en'),
(25, 25, 1, 1, 1, 'en'),
(26, 26, 1, 1, 1, 'en'),
(27, 27, 1, 1, 1, 'en'),
(28, 28, 1, 1, 1, 'en'),
(29, 29, 1, 1, 1, 'en'),
(30, 30, 1, 1, 1, 'en'),
(31, 31, 1, 1, 1, 'en'),
(32, 32, 1, 1, 1, 'en'),
(33, 33, 1, 1, 1, 'en'),
(34, 34, 1, 1, 1, 'en'),
(35, 35, 1, 1, 1, 'en'),
(36, 36, 1, 1, 1, 'en'),
(37, 37, 1, 1, 1, 'en'),
(38, 38, 1, 1, 1, 'en'),
(39, 39, 1, 1, 1, 'en'),
(40, 40, 1, 1, 1, 'en'),
(41, 41, 1, 1, 1, 'en'),
(42, 42, 1, 1, 1, 'en'),
(43, 43, 1, 1, 1, 'en'),
(44, 44, 1, 1, 1, 'en'),
(45, 45, 1, 1, 1, 'en'),
(46, 46, 1, 1, 1, 'en'),
(47, 47, 1, 1, 1, 'en'),
(48, 48, 1, 1, 1, 'en'),
(49, 49, 1, 1, 1, 'en'),
(50, 50, 1, 1, 1, 'en'),
(51, 51, 1, 1, 1, 'en'),
(52, 52, 1, 1, 1, 'en'),
(53, 53, 1, 1, 1, 'en'),
(54, 54, 1, 1, 1, 'en'),
(55, 55, 1, 1, 1, 'en'),
(56, 56, 1, 1, 1, 'en'),
(57, 57, 1, 1, 1, 'en'),
(58, 58, 1, 1, 1, 'en'),
(59, 59, 1, 1, 1, 'en'),
(60, 60, 1, 1, 1, 'en'),
(61, 61, 1, 1, 1, 'en'),
(62, 62, 1, 1, 1, 'en'),
(63, 63, 1, 1, 1, 'en'),
(64, 64, 1, 1, 1, 'en'),
(65, 65, 1, 1, 1, 'en'),
(66, 66, 1, 1, 1, 'en'),
(67, 67, 1, 1, 1, 'en'),
(68, 68, 1, 1, 1, 'en'),
(69, 69, 1, 1, 1, 'en'),
(70, 70, 1, 1, 1, 'en'),
(71, 71, 1, 1, 1, 'en'),
(72, 72, 1, 1, 1, 'en'),
(73, 73, 1, 1, 1, 'en'),
(74, 74, 1, 1, 1, 'en'),
(75, 75, 1, 1, 1, 'en'),
(76, 76, 1, 1, 1, 'en'),
(77, 77, 1, 1, 1, 'en'),
(78, 78, 1, 1, 1, 'en'),
(79, 79, 1, 1, 1, 'en'),
(80, 80, 1, 1, 1, 'en'),
(81, 81, 1, 1, 1, 'en'),
(82, 82, 1, 1, 1, 'en'),
(83, 83, 1, 1, 1, 'en'),
(84, 84, 1, 1, 1, 'en'),
(85, 85, 1, 1, 1, 'en'),
(86, 86, 1, 1, 1, 'en'),
(87, 87, 1, 1, 1, 'en'),
(88, 88, 1, 1, 1, 'en'),
(89, 89, 1, 1, 1, 'en'),
(90, 90, 1, 1, 1, 'en'),
(91, 91, 1, 1, 1, 'en'),
(92, 92, 1, 1, 1, 'en'),
(93, 93, 1, 1, 1, 'en'),
(94, 94, 1, 1, 1, 'en'),
(95, 95, 1, 1, 1, 'en'),
(96, 96, 1, 1, 1, 'en'),
(97, 97, 1, 1, 1, 'en'),
(98, 98, 1, 1, 1, 'en'),
(99, 99, 1, 1, 1, 'en'),
(100, 100, 1, 1, 1, 'en'),
(101, 101, 1, 1, 1, 'en'),
(102, 102, 1, 1, 1, 'en'),
(103, 103, 1, 1, 1, 'en'),
(104, 104, 1, 1, 1, 'en'),
(105, 105, 1, 1, 1, 'en'),
(106, 106, 1, 1, 1, 'en'),
(107, 107, 1, 1, 1, 'en'),
(108, 108, 1, 1, 1, 'en'),
(109, 109, 1, 1, 1, 'en'),
(110, 110, 1, 1, 1, 'en'),
(111, 111, 1, 1, 1, 'en'),
(112, 112, 1, 1, 1, 'en'),
(113, 113, 1, 1, 1, 'en'),
(114, 114, 1, 1, 1, 'en'),
(115, 115, 1, 1, 1, 'en'),
(116, 116, 1, 1, 1, 'en'),
(117, 117, 1, 1, 1, 'en'),
(118, 118, 1, 1, 1, 'en'),
(119, 119, 1, 1, 1, 'en'),
(120, 120, 1, 1, 1, 'en'),
(121, 121, 1, 1, 1, 'en'),
(122, 122, 1, 1, 1, 'en'),
(123, 123, 1, 1, 1, 'en'),
(124, 124, 1, 1, 1, 'en'),
(125, 125, 1, 1, 1, 'en'),
(126, 126, 1, 1, 1, 'en'),
(127, 127, 1, 1, 1, 'en'),
(128, 128, 1, 1, 1, 'en'),
(129, 129, 1, 1, 1, 'en'),
(130, 130, 1, 1, 1, 'en'),
(131, 131, 1, 1, 1, 'en'),
(132, 132, 1, 1, 1, 'en'),
(133, 133, 1, 1, 1, 'en'),
(134, 134, 1, 1, 1, 'en'),
(135, 135, 1, 1, 1, 'en'),
(136, 136, 1, 1, 1, 'en'),
(137, 137, 1, 1, 1, 'en'),
(138, 138, 1, 1, 1, 'en'),
(139, 139, 1, 1, 1, 'en'),
(140, 140, 1, 1, 1, 'en'),
(141, 141, 1, 1, 1, 'en'),
(142, 142, 1, 1, 1, 'en'),
(143, 143, 1, 1, 1, 'en'),
(144, 144, 1, 1, 1, 'en'),
(145, 145, 1, 1, 1, 'en'),
(146, 146, 1, 1, 1, 'en'),
(147, 147, 1, 1, 1, 'en'),
(148, 148, 1, 1, 1, 'en'),
(149, 149, 1, 1, 1, 'en'),
(150, 150, 1, 1, 1, 'en'),
(151, 151, 1, 1, 1, 'en'),
(152, 152, 1, 1, 1, 'en'),
(153, 153, 1, 1, 1, 'en'),
(154, 154, 1, 1, 1, 'en'),
(155, 155, 1, 1, 1, 'en'),
(156, 156, 1, 1, 1, 'en'),
(157, 157, 1, 1, 1, 'en'),
(158, 158, 1, 1, 1, 'en'),
(159, 159, 1, 1, 1, 'en'),
(160, 160, 1, 1, 1, 'en'),
(161, 161, 1, 1, 1, 'en'),
(162, 162, 1, 1, 1, 'en'),
(163, 163, 1, 1, 1, 'en'),
(164, 164, 1, 1, 1, 'en'),
(165, 165, 1, 1, 1, 'en'),
(166, 166, 1, 1, 1, 'en'),
(167, 167, 1, 1, 1, 'en'),
(168, 168, 1, 1, 1, 'en'),
(169, 169, 1, 1, 1, 'en'),
(170, 170, 1, 1, 1, 'en'),
(171, 171, 1, 1, 1, 'en'),
(172, 172, 1, 1, 1, 'en'),
(173, 173, 1, 1, 1, 'en'),
(174, 174, 1, 1, 1, 'en'),
(175, 175, 1, 1, 1, 'en'),
(176, 176, 1, 1, 1, 'en'),
(177, 177, 1, 1, 1, 'en'),
(178, 178, 1, 1, 1, 'en'),
(179, 179, 1, 1, 1, 'en'),
(180, 180, 1, 1, 1, 'en'),
(181, 181, 1, 1, 1, 'en'),
(182, 182, 1, 1, 1, 'en'),
(183, 183, 1, 1, 1, 'en'),
(184, 184, 1, 1, 1, 'en'),
(185, 185, 1, 1, 1, 'en'),
(186, 186, 1, 1, 1, 'en'),
(187, 187, 1, 1, 1, 'en'),
(188, 188, 1, 1, 1, 'en'),
(189, 189, 1, 1, 1, 'en'),
(190, 190, 1, 1, 1, 'en'),
(191, 191, 1, 1, 1, 'en'),
(192, 192, 1, 1, 1, 'en'),
(193, 193, 1, 1, 1, 'en'),
(194, 194, 1, 1, 1, 'en'),
(195, 195, 1, 1, 1, 'en'),
(196, 196, 1, 1, 1, 'en'),
(197, 197, 1, 1, 1, 'en'),
(198, 198, 1, 1, 1, 'en'),
(199, 199, 1, 1, 1, 'en'),
(200, 200, 1, 1, 1, 'en'),
(201, 201, 1, 1, 1, 'en'),
(202, 202, 1, 1, 1, 'en'),
(203, 203, 1, 1, 1, 'en'),
(204, 204, 1, 1, 1, 'en'),
(205, 205, 1, 1, 1, 'en'),
(206, 206, 1, 1, 1, 'en'),
(207, 207, 1, 1, 1, 'en'),
(208, 208, 1, 1, 1, 'en'),
(209, 209, 1, 1, 1, 'en'),
(210, 210, 1, 1, 1, 'en'),
(211, 211, 1, 1, 1, 'en'),
(212, 212, 1, 1, 1, 'en'),
(213, 213, 1, 1, 1, 'en'),
(214, 214, 1, 1, 1, 'en'),
(215, 215, 1, 1, 1, 'en'),
(216, 216, 1, 1, 1, 'en'),
(217, 217, 1, 1, 1, 'en'),
(218, 218, 1, 1, 1, 'en'),
(219, 219, 1, 1, 1, 'en'),
(220, 220, 1, 1, 1, 'en'),
(221, 221, 1, 1, 1, 'en'),
(222, 222, 1, 1, 1, 'en'),
(223, 223, 1, 1, 1, 'en'),
(224, 224, 1, 1, 1, 'en'),
(225, 225, 1, 1, 1, 'en'),
(226, 226, 1, 1, 1, 'en'),
(227, 227, 1, 1, 1, 'en'),
(228, 228, 1, 1, 1, 'en'),
(229, 229, 1, 1, 1, 'en'),
(230, 230, 1, 1, 1, 'en'),
(231, 231, 1, 1, 1, 'en'),
(232, 232, 1, 1, 1, 'en'),
(233, 233, 1, 1, 1, 'en'),
(234, 234, 1, 1, 1, 'en'),
(235, 235, 1, 1, 1, 'en'),
(236, 236, 1, 1, 1, 'en'),
(237, 237, 1, 1, 1, 'en'),
(238, 238, 1, 1, 1, 'en'),
(239, 239, 1, 1, 1, 'en'),
(240, 240, 1, 1, 1, 'en'),
(241, 241, 1, 1, 1, 'en'),
(242, 242, 1, 1, 1, 'en'),
(243, 243, 1, 1, 1, 'en'),
(244, 244, 1, 1, 1, 'en'),
(245, 245, 1, 1, 1, 'en'),
(246, 246, 1, 1, 1, 'en'),
(247, 247, 1, 1, 1, 'en'),
(248, 248, 1, 1, 1, 'en'),
(249, 249, 1, 1, 1, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `hris_todos`
--

CREATE TABLE IF NOT EXISTS `hris_todos` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `todo` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `is_done` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_trainings`
--

CREATE TABLE IF NOT EXISTS `hris_trainings` (
`id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `venue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `number_of_hours` int(11) NOT NULL,
  `sponsored_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_trainings`
--

INSERT INTO `hris_trainings` (`id`, `title`, `description`, `venue`, `start`, `end`, `number_of_hours`, `sponsored_by`, `created_at`, `updated_at`) VALUES
(1, 'SAP Business One', NULL, NULL, '2011-06-01', '2011-06-01', 90, 'Darwn Dizon (ADDU)', '2016-01-04 18:40:49', '2016-01-04 18:40:49'),
(2, 'SGV: Technical Session (IT Auditing)', NULL, NULL, '2011-10-27', '2011-10-27', 1, 'SGV & Co', '2016-01-04 18:40:49', '2016-01-04 18:40:49'),
(3, 'Web Development Training', NULL, NULL, '2011-07-04', '2011-07-08', 40, 'CICT', '2016-01-05 20:14:25', '2016-01-05 20:14:25'),
(4, 'Success Coaching Seminar ', NULL, NULL, '2012-09-22', '2012-09-22', 8, 'Phillippines Sports Commission', '2016-01-05 22:51:23', '2016-01-05 22:51:23'),
(5, 'Yamaha Safety Riding Seminar', NULL, NULL, '2012-10-16', '2012-10-16', 8, 'Yamaha Motors Phillippines', '2016-01-05 22:51:23', '2016-01-05 22:51:23'),
(6, 'Training Course on Research Design, Statistical Data Analysis and Interpretation for Researchers in FENR', NULL, NULL, '2012-05-29', '2012-06-21', 32, 'PCAARD - DOST', '2016-01-05 23:33:04', '2016-01-05 23:33:04'),
(7, 'Workskop on Revisiting and Enhancing the SUC''s Strategic Plans', NULL, NULL, '2012-08-02', '2012-08-04', 24, 'CHED / DAP / PASUC', '2016-01-05 23:33:04', '2016-01-05 23:33:04'),
(8, 'Seminar - Workshop on the Performance Targets and Standards', NULL, NULL, '2005-05-25', '2005-05-26', 0, 'DNSC, IGACOS, Samal Davao del Norte', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(9, 'Seminar on Cash Management and Control System', NULL, NULL, '2005-10-05', '2005-10-07', 0, 'COA, RO XI, Davao City', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(10, 'Seminar on Public Service Ethics and Accountability', NULL, NULL, '2005-12-15', '2005-12-15', 0, 'CSC, Tagum City', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(11, 'Cooperative Governance', NULL, NULL, '2006-03-25', '2006-03-25', 0, 'DNSCEC, Panabo City', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(12, 'Seminar on Proper Decorum in Public Service', NULL, NULL, '2007-12-20', '2007-12-20', 0, 'DNSC, Panabo City', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(13, 'Orientation / Seminar in the Revised Form of SALN', NULL, NULL, '2008-03-19', '2008-03-19', 0, 'DNSC, Panabo City', '2016-01-14 01:07:24', '2016-01-14 01:07:24'),
(14, 'Citizen''s Charter Orientation', NULL, NULL, '2009-02-11', '2009-02-11', 0, 'CSC - Tagum City', '2016-01-14 01:07:25', '2016-01-14 01:07:25'),
(15, 'Seminar Workshop on Physical Wellnes and PAGIBIG Updates ', NULL, NULL, '2010-12-16', '2010-12-16', 0, 'PAGIBIG / DNSC, Panabo City', '2016-01-14 01:07:25', '2016-01-14 01:07:25'),
(16, 'Anti-Money Laundering Act (AMLA)', NULL, NULL, '2011-10-27', '2011-10-02', 0, 'Land Bank of the Philippines, Davao City', '2016-01-14 01:07:25', '2016-01-14 01:07:25'),
(17, 'Defence Mechanism', NULL, NULL, '1999-03-20', '1999-03-20', 8, 'Professional Nurse Specialist', '2016-01-14 01:10:21', '2016-01-14 01:10:21'),
(18, 'Gatrointestinal Bleeding', NULL, NULL, '0199-04-17', '0199-04-17', 8, 'Professional Nurse Specialist', '2016-01-14 01:10:21', '2016-01-14 01:10:21'),
(19, 'The Evolution of Epidemic Aids', NULL, NULL, '0000-00-00', '1995-05-29', 8, 'Professional,Nurse Specailist', '2016-01-14 01:10:22', '2016-01-14 01:10:22'),
(20, 'Caring for Gerantologic Clients ', NULL, NULL, '1999-07-17', '1999-07-17', 8, 'Professional Nurse Specialist', '2016-01-14 01:10:22', '2016-01-14 01:10:22'),
(21, 'Post Traumatic Stress Disorder', NULL, NULL, '1999-08-02', '1999-08-02', 8, 'Professional Nurse Specialist', '2016-01-14 01:10:22', '2016-01-14 01:10:22'),
(22, 'Basic Intravenous Therapy Training', NULL, NULL, '2008-11-05', '2008-11-07', 24, 'Davao regional hospital', '2016-01-14 01:10:22', '2016-01-14 01:10:22'),
(23, 'Fishing Technology Course', NULL, NULL, '1999-03-01', '1999-08-01', 0, 'DA-BFAR (Fisheries Training Center)', '2016-01-14 01:17:49', '2016-01-14 01:17:49'),
(24, 'Saving and Loan Seminar (Tagum Coop)', NULL, NULL, '2012-01-31', '2012-01-31', 8, 'Tagum Cooperative Tagum City (EDCOM)', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(25, 'Seminar on Public Service Ethics and Accountability', NULL, NULL, '2005-02-15', '2005-02-15', 8, 'Civil Service Commission Regional Office XI', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(26, 'Alay Palaisdaan', NULL, NULL, '1998-09-09', '1998-09-09', 24, 'SEAFDEC Aquaculture', '2016-01-14 01:28:11', '2016-01-14 01:28:11'),
(27, 'Moral Recovery Program Seminar', NULL, NULL, '1999-02-05', '1999-02-05', 8, 'University Training Center, USEP, Obrero, Davao City', '2016-01-14 01:40:35', '2016-01-14 01:40:35'),
(28, 'Basic Orientation Seminar on Public Sector Unionism', NULL, NULL, '1999-08-20', '1999-08-20', 8, 'DNSC', '2016-01-14 01:40:35', '2016-01-14 01:40:35'),
(29, 'Seminar on Increasing Administrative Efficiency', NULL, NULL, '2001-08-18', '2001-08-18', 8, 'PEERLESS', '2016-01-14 01:40:35', '2016-01-14 01:40:35'),
(30, 'Seminar on Team Building and Customer Service', NULL, NULL, '2001-08-25', '2001-08-25', 8, 'PEERLESS', '2016-01-14 01:40:35', '2016-01-14 01:40:35'),
(31, 'Seminar - Workshop on Public Service Ethics & Acouuntability', NULL, NULL, '2005-12-15', '2005-12-15', 8, 'DNSC, CSC', '2016-01-14 01:40:35', '2016-01-14 01:40:35'),
(32, 'Gender and Development Seminar', NULL, NULL, '2006-12-14', '2006-12-14', 8, 'DNSC, CSC', '2016-01-14 01:40:35', '2016-01-14 01:40:35'),
(33, 'Orientation / Seminar on the Revised Form of the Statement of Assets, Liabilities and Networth', NULL, NULL, '2008-03-19', '2008-03-19', 8, 'DNSC, CSC', '2016-01-14 01:40:35', '2016-01-14 01:40:35'),
(34, 'Seminar on Values Formation and Poverty Alleviation', NULL, NULL, '2008-12-18', '2008-12-18', 8, 'DNSC, CSC', '2016-01-14 01:40:35', '2016-01-14 01:40:35'),
(35, 'Citizen''s Charter Orientation', NULL, NULL, '2009-02-11', '2009-02-11', 8, 'DNSC, CSC', '2016-01-14 01:40:35', '2016-01-14 01:40:35'),
(36, 'Free and Open Source Software  (FOSS) Seminar', NULL, NULL, '2009-12-17', '2009-12-17', 8, 'DNSC', '2016-01-14 01:40:35', '2016-01-14 01:40:35'),
(37, 'Gender and Development Seminar', NULL, NULL, '2009-12-18', '2009-12-18', 8, 'DNSC, CSC', '2016-01-14 01:40:35', '2016-01-14 01:40:35'),
(38, 'Seminar - Workshop on Physical Wellness and PAG-IBIG 2 / MP2, Membership Coverage and PAG-IBIG Updates', NULL, NULL, '2010-12-16', '2010-12-16', 8, 'DNSC,  PAG-IBIG', '2016-01-14 01:40:36', '2016-01-14 01:40:36'),
(39, 'Gender and Development Seminar', NULL, NULL, '2012-12-20', '2012-12-20', 8, 'DNSC, CSC', '2016-01-14 01:40:36', '2016-01-14 01:40:36'),
(40, 'Seminar - Workshop on Basic Records Management and the National Inventory of Records and Archives', NULL, NULL, '2013-03-20', '2013-03-20', 8, 'National Archives of the Philippines', '2016-01-14 01:40:36', '2016-01-14 01:40:36'),
(41, 'Strategic Performance Management System Seminar', NULL, NULL, '2003-06-18', '2003-06-18', 8, 'DNSC, CSC', '2016-01-14 01:40:36', '2016-01-14 01:40:36'),
(42, 'Computer Technician - Short Course', NULL, NULL, '1992-04-01', '1992-06-08', 300, 'Inreface of Manila, Davao City', '2016-01-14 01:42:04', '2016-01-14 01:42:04'),
(43, 'Post Harvest and Value-adding of Milk Fish (Introduction of alternative livelihood for the fisherfolk community)', NULL, NULL, '2010-07-15', '2010-07-16', 0, 'DED/DNSC', '2016-01-14 01:42:04', '2016-01-14 01:42:04'),
(44, 'Workshop on Physical Wellness and Pag-ibig  2/mp2 Membership Coverage', NULL, NULL, '2010-12-14', '2010-12-14', 8, 'Pag-ibig', '2016-01-14 01:42:04', '2016-01-14 01:42:04'),
(45, 'Glassware Calibration and thermometer Verification ', NULL, NULL, '2007-11-07', '2007-11-07', 8, 'DOST XI', '2016-01-14 01:57:01', '2016-01-14 01:57:01'),
(46, 'Developing and Implementing a Laboratory QMS Based on ISO/IEC 17025', NULL, NULL, '2008-05-27', '2008-05-29', 24, 'DOST XI and Tadeco', '2016-01-14 01:57:01', '2016-01-14 01:57:01'),
(47, 'Welfare and Benifits Updates', NULL, NULL, '2003-12-19', '2003-12-19', 8, 'DNSC', '2016-01-14 02:19:43', '2016-01-14 02:19:43'),
(48, 'Value Re-orientation Seminar', NULL, NULL, '2004-12-17', '2004-12-17', 8, 'DNSC', '2016-01-14 02:19:43', '2016-01-14 02:19:43'),
(49, 'Seminar Workshop on the Performance Targets and Standard Settings', NULL, NULL, '2005-05-05', '2005-05-26', 16, 'DNSC', '2016-01-14 02:19:43', '2016-01-14 02:19:43'),
(50, 'Seminar on Public Service Ethics and Accountability', NULL, NULL, '2005-12-15', '2005-12-15', 8, 'CSC', '2016-01-14 02:19:43', '2016-01-14 02:19:43'),
(51, 'Gender and Development Seminar', NULL, NULL, '2006-12-14', '2006-12-14', 8, 'DNSC', '2016-01-14 02:19:43', '2016-01-14 02:19:43'),
(52, 'Seminar on Proper Decorum in Public Service', NULL, NULL, '2007-12-20', '2007-12-20', 8, 'DNSC', '2016-01-14 02:19:43', '2016-01-14 02:19:43'),
(53, 'Orientation Seminar on Revised Form of Statement Assets, Liabilities and Networth (SALN)', NULL, NULL, '2008-03-19', '2008-03-19', 8, 'DNSC, CSC', '2016-01-14 02:19:43', '2016-01-14 02:19:43'),
(54, 'Seminar on Values Formation and Poverty Alleviation', NULL, NULL, '2008-12-18', '2008-12-18', 8, 'DNSC, CSC', '2016-01-14 02:19:43', '2016-01-14 02:19:43'),
(55, 'Citizen''s Charter Orientation', NULL, NULL, '2009-02-11', '2009-02-11', 8, 'DNSC, CSC', '2016-01-14 02:19:43', '2016-01-14 02:19:43'),
(56, 'Free and Open Source Software (FOSS) Seminar', NULL, NULL, '2009-12-17', '2009-12-17', 8, 'DNSC', '2016-01-14 02:19:43', '2016-01-14 02:19:43'),
(57, 'Gender and Development Seminar', NULL, NULL, '2009-12-18', '2009-12-18', 8, 'DNSC, CSC', '2016-01-14 02:19:44', '2016-01-14 02:19:44'),
(58, 'BIR Information and Tax Update Seminar', NULL, NULL, '2010-11-17', '2010-11-17', 8, 'PICPA', '2016-01-14 02:19:44', '2016-01-14 02:19:44'),
(59, 'Seminar Workshop on Physical Wellness and PAG-IBIG Updates', NULL, NULL, '2010-12-16', '2010-12-16', 8, 'DNSC', '2016-01-14 02:19:44', '2016-01-14 02:19:44'),
(60, 'Tax Update Seminar', NULL, NULL, '2012-01-24', '2012-01-24', 6, 'PICPA', '2016-01-14 02:19:44', '2016-01-14 02:19:44'),
(61, 'Schools Project Closeout 2', NULL, NULL, '2012-02-27', '2012-02-29', 24, 'DOST - ICTO', '2016-01-14 02:19:44', '2016-01-14 02:19:44'),
(62, 'Strategic Performance Management Sytem Seminar', NULL, NULL, '2013-08-18', '2013-08-18', 8, 'DNSC / CSC', '2016-01-14 02:19:44', '2016-01-14 02:19:44'),
(63, 'Seminar - Workshop "Regional Disaster Science and Management S & T Capacity Development  "', NULL, NULL, '2013-06-27', '2013-06-28', 16, 'USEP', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(64, 'Seminar - Workshop on the Start and Improve your Business ', NULL, NULL, '2009-02-06', '2009-02-08', 24, 'The International Labour Organization Subregional Office for Southeast Asia and the Pacific/DOST - PCAMRD Zonal Center V - DNSC', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(65, 'Bioentrepernuership in Academia', NULL, NULL, '2009-04-20', '2009-04-20', 8, 'UP-Mindanao / Davao Association of Colleges and Universities  Network  / CHED Zonal Research Center XI', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(66, 'Promotion and Training on Seaweed Value - Adding', NULL, NULL, '2009-08-14', '2009-08-15', 16, 'DTI XI - Davao Industry Cluster Capacity Enhancement Project (DICCEP)/SPAMAST/DOST-PCAMRD Zonal Center V', '2016-01-14 02:33:56', '2016-01-14 02:33:56'),
(68, 'Values Re-orientation seminar', NULL, NULL, '2012-12-19', '2012-12-20', 0, 'DNSC', '2016-01-14 02:54:56', '2016-01-14 02:54:56'),
(69, 'Training-Workshop on  Marine REsearch Capability Enhancement', NULL, NULL, '2002-01-17', '2002-01-23', 0, 'Zamboanga Zonal Center', '2016-01-14 02:54:56', '2016-01-14 02:54:56'),
(70, 'Seminar or Service and Commitment', NULL, NULL, '1997-05-30', '1997-05-30', 0, 'DNSC', '2016-01-14 02:54:56', '2016-01-14 02:54:56'),
(71, 'Shipper Master Fisherman Course', NULL, NULL, '1993-03-01', '1993-07-30', 0, 'National Commercial Fisheries Development Center Single Point Cavite City', '2016-01-14 02:54:56', '2016-01-14 02:54:56'),
(72, 'Welfare and Benifits Updates', NULL, NULL, '2003-12-19', '2003-12-19', 8, 'DNSC', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(73, 'Value Re-orientation Seminar', NULL, NULL, '2004-12-17', '2004-12-17', 8, 'DNSC', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(74, 'Seminar Workshop on the Performance Targets and Standard Setting', NULL, NULL, '2005-05-05', '2005-05-26', 16, 'DNSC', '2016-01-14 03:07:07', '2016-01-14 03:07:07'),
(75, 'Seminar on the Public Service Ethics and Accountability', NULL, NULL, '2013-12-15', '2013-12-15', 8, 'DNSC', '2016-01-14 03:07:08', '2016-01-14 03:07:08'),
(76, 'Gender and Development Seminar', NULL, NULL, '2006-12-14', '2006-12-14', 8, 'DNSC', '2016-01-14 03:07:08', '2016-01-14 03:07:08'),
(77, 'Seminar on the Proper Decorum in Public Service', NULL, NULL, '2007-12-20', '2007-12-20', 8, 'DNSC', '2016-01-14 03:07:08', '2016-01-14 03:07:08'),
(78, 'Orientation Seminar on the Revised Form of Statement of Assets, Liabilities and Networth (SALN)', NULL, NULL, '2008-03-19', '2008-03-19', 8, 'DNSC / CSC', '2016-01-14 03:07:08', '2016-01-14 03:07:08'),
(79, 'Seminar on Values Formation and Poverty Alleviation', NULL, NULL, '2008-12-18', '2008-12-18', 8, 'DNSC / CSC', '2016-01-14 03:07:08', '2016-01-14 03:07:08'),
(80, 'Citizen''s Charter Orientation', NULL, NULL, '2009-02-11', '2009-02-11', 8, 'DNSC / CSC', '2016-01-14 03:07:08', '2016-01-14 03:07:08'),
(81, 'Gender and Development Seminar', NULL, NULL, '2009-12-18', '2009-12-18', 8, 'DNSC / CSC', '2016-01-14 03:07:08', '2016-01-14 03:07:08'),
(82, 'Seminar Workshop on Physical Wellness and PAG-IBIG Updates', NULL, NULL, '2010-12-16', '2010-12-16', 8, 'DNSC', '2016-01-14 03:07:08', '2016-01-14 03:07:08'),
(83, 'Customer Service Seminar', NULL, NULL, '2011-06-27', '2011-06-28', 10, 'China Oceanis Philippine Inc.', '2016-01-14 03:25:40', '2016-01-14 03:25:40'),
(84, 'Basic Life Support', NULL, NULL, '2010-03-01', '2010-03-02', 16, 'Philippine National Red Cross', '2016-01-14 03:25:40', '2016-01-14 03:25:40'),
(85, 'Standard First Aid Training', NULL, NULL, '2010-03-03', '2010-03-06', 32, 'Philippine National Red Cross', '2016-01-14 03:25:40', '2016-01-14 03:25:40'),
(86, 'Re-training Course Class # 127 1 Day Marksmanship Firing', NULL, NULL, '2009-12-14', '2009-12-14', 0, '', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(87, 'Security Services - NCI Class 49', NULL, NULL, '2007-08-11', '2007-08-30', 0, '', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(88, 'Citizen''s Crime Watch (CCW)', NULL, NULL, '2007-03-27', '2007-03-29', 0, '', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(89, 'Bomb Awareness Seminar', NULL, NULL, '2005-05-28', '2005-05-28', 0, '', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(90, 'Personal Safety and Social Responsibilities', NULL, NULL, '1998-03-28', '1998-04-06', 30, '', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(91, 'Basic Safety Course, Personal Survival, Basic Firefighting, Medical Emegency', NULL, NULL, '1998-03-28', '1998-04-06', 30, '', '2016-01-14 06:00:12', '2016-01-14 06:00:12'),
(92, 'Bomb Threat Awareness and Detection Seminar Held at Covered Court Brgy. New Pandan, Panabo City', NULL, NULL, '2007-03-16', '2007-03-16', 24, 'Glen G. Cristines Police Chief Inspector', '2016-01-14 06:03:25', '2016-01-14 06:03:25'),
(93, 'National Manpower and Youth Council  Panabo Davao del norte', NULL, NULL, '0000-00-00', '0000-00-00', 0, 'Jum Estrada Instructor Master Electrician', '2016-01-14 06:03:25', '2016-01-14 06:03:25'),
(94, 'Seminar on Fire Prevention Safety and Drills Held at DNSC', NULL, NULL, '1998-03-17', '1998-03-17', 24, 'SFO Pedrito M. Tolop Municipal Fire Marshall', '2016-01-14 06:03:25', '2016-01-14 06:03:25'),
(95, 'Free licence for Security Training Course Tamaraw Training Center', NULL, NULL, '1991-04-16', '2016-05-14', 1080, 'LT. Dweight  Nebria Training Director', '2016-01-14 06:03:25', '2016-01-14 06:03:25'),
(96, 'Seminar on Public Service Ethics and Accountability', NULL, NULL, '2005-12-15', '2003-12-15', 8, 'Civil Service Commission', '2016-01-14 06:23:19', '2016-01-14 06:23:19'),
(97, 'Seminar Workshop on the Performance Targets and Standard Setting', NULL, NULL, '2005-05-25', '2005-05-26', 16, 'Davao del Norte State College', '2016-01-14 06:23:19', '2016-01-14 06:23:19'),
(98, 'Institute Development Planning Workshop of the Administration Services', NULL, NULL, '2003-08-05', '2003-08-05', 0, 'Davao del Norte State College', '2016-01-14 06:23:20', '2016-01-14 06:23:20'),
(99, 'Basic Computer Concepts & DOS Turbo', NULL, NULL, '1997-01-16', '1997-02-27', 60, 'Davao del Norte State  College', '2016-01-14 06:23:20', '2016-01-14 06:23:20'),
(100, 'Third Tracer Study Seminar', NULL, NULL, '1986-08-25', '1986-08-29', 32, 'EDPITAF, Min. of Education', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(101, 'Seminar Workshop and Planning and Budgetting', NULL, NULL, '1986-08-04', '1986-08-06', 16, '', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(102, 'Seminar Workshop on the Conduct of Follow-up and Occupational Assessment', NULL, NULL, '1986-11-22', '1986-11-23', 16, 'EDPITAF, Min. of Education', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(103, 'Audit of Disbursement', NULL, NULL, '1985-11-18', '1985-11-22', 32, 'COA, Regional Office XI', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(104, 'Use of Apple II + Computer', NULL, NULL, '1985-04-11', '1985-04-25', 112, 'UP, Visayas', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(105, 'Fiscal and Property Management', NULL, NULL, '1986-10-06', '1986-10-10', 24, 'COA, Regional Office XI', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(106, 'Basic Computer Concepts and DOS Turbo', NULL, NULL, '1977-01-06', '1977-02-27', 60, 'Davao del Norte State College', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(107, 'Institute Development Planning Worskshop of the Administrative Services', NULL, NULL, '2003-08-05', '2003-08-05', 0, 'Davao del Norte State College', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(108, 'Seminar Workshop on the Performance Targets and Standard Settings', NULL, NULL, '2005-05-25', '2005-05-26', 16, 'Davao del Norte State College', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(109, 'Seminar on Public Service Ethics and Accountability', NULL, NULL, '2005-12-15', '2005-12-15', 8, 'Civil Service Commission', '2016-01-14 06:26:41', '2016-01-14 06:26:41'),
(112, 'Six Months Special Training in 11th Regional Community Defense Unit 6th Infantry (Kampilan / Division Philippine Army, San Gabriel, Davao City)', NULL, NULL, '1992-05-03', '1983-12-13', 0, 'Philippine Army', '2016-01-14 07:40:37', '2016-01-14 07:40:37'),
(114, 'Security Guard Training at Davao del Sur Constabulary Command', NULL, NULL, '1979-08-05', '1979-09-09', 0, 'PC Susia', '2016-01-14 07:40:37', '2016-01-14 07:40:37'),
(115, 'The Counselor AS AN Advocate', NULL, NULL, '2010-05-10', '2009-10-24', 18, 'Phil. Guidance and Counseling ASOO.', '2016-01-15 02:17:45', '2016-01-15 02:17:45'),
(116, 'Liabilities & Netwoht', NULL, NULL, '2008-03-19', '2008-03-19', 0, '', '2016-01-15 02:38:37', '2016-01-15 02:38:37'),
(117, 'Form of the Statement of Assets ', NULL, NULL, '0000-00-00', '0000-00-00', 0, '', '2016-01-15 02:38:38', '2016-01-15 02:38:38'),
(118, 'Orientation / Seminar in the Revised', NULL, NULL, '0000-00-00', '0000-00-00', 0, '', '2016-01-15 02:38:38', '2016-01-15 02:38:38'),
(119, 'Gender & Development Seminar', NULL, NULL, '2006-12-14', '2006-12-14', 0, '', '2016-01-15 02:38:38', '2016-01-15 02:38:38'),
(120, 'Performance Targets & Standard Setting', NULL, NULL, '2005-05-25', '2005-05-26', 0, '', '2016-01-15 02:38:38', '2016-01-15 02:38:38'),
(121, 'Value Service Ethics & Acountability', NULL, NULL, '2005-12-15', '2005-12-15', 0, '', '2016-01-15 02:38:38', '2016-01-15 02:38:38'),
(122, 'Institute Development Planning ', NULL, NULL, '2003-08-15', '2003-08-15', 0, '', '2016-01-15 02:38:38', '2016-01-15 02:38:38'),
(123, 'Environmental Awareness & Management ', NULL, NULL, '2000-07-06', '2000-07-07', 0, '', '2016-01-15 02:38:38', '2016-01-15 02:38:38'),
(124, 'Sector Unionism', NULL, NULL, '0000-00-00', '0000-00-00', 0, '', '2016-01-15 02:38:38', '2016-01-15 02:38:38'),
(125, 'Basic Orientation Seminar Public ', NULL, NULL, '1999-09-20', '1999-09-20', 0, '', '2016-01-15 02:38:38', '2016-01-15 02:38:38'),
(126, 'Seminar on the New Omnibus Rules on Appointments, Leaves, Value Re-orientation, Rules of Conduct', NULL, NULL, '1999-06-01', '0199-06-01', 8, 'HRMO - DNSC', '2016-01-15 03:06:21', '2016-01-15 03:06:21'),
(127, 'Basic Orientation Seminar on Public Sector Unionism ', NULL, NULL, '1999-09-20', '1999-09-20', 8, 'HRMO - DNSC', '2016-01-15 03:06:21', '2016-01-15 03:06:21'),
(128, 'Values Re-orientation seminar', NULL, NULL, '2002-12-19', '2002-12-20', 16, 'DNSC', '2016-01-15 03:06:21', '2016-01-15 03:06:21'),
(129, 'Institute Development Planning Workshop', NULL, NULL, '2003-08-15', '2003-08-15', 8, 'DNSC', '2016-01-15 03:06:21', '2016-01-15 03:06:21'),
(130, 'Seminar / Discussion on the Senigficant Developments in the Natonal Gorvernment Today', NULL, NULL, '2003-07-17', '2003-07-18', 16, 'GACTA / PICPA/ COA Offices', '2016-01-15 03:06:21', '2016-01-15 03:06:21'),
(131, 'Employee Welfare and Benefits Updates ', NULL, NULL, '2003-12-18', '2003-12-19', 16, 'DNSC', '2016-01-15 03:06:21', '2016-01-15 03:06:21'),
(132, 'Value Re-orientation Seminar', NULL, NULL, '2004-12-17', '2004-12-17', 8, 'DNSC', '2016-01-15 03:06:21', '2016-01-15 03:06:21'),
(133, 'Seminar Workshop on the Performance Targets and Standard Setings', NULL, NULL, '2005-05-25', '2005-05-26', 16, 'HRMO - DNSC', '2016-01-15 03:06:21', '2016-01-15 03:06:21'),
(134, 'Public Service Ethics and Accountability ', NULL, NULL, '2005-12-15', '2005-12-15', 8, 'Civil Service Commission', '2016-01-15 03:06:21', '2016-01-15 03:06:21'),
(135, 'Gender and Development Seminar', NULL, NULL, '2006-12-14', '2006-12-14', 8, 'Civil Service Commission', '2016-01-15 03:06:22', '2016-01-15 03:06:22'),
(136, 'Training Workshop on Marine Research Capability Enhancement ', NULL, NULL, '2002-01-17', '2002-01-23', 56, 'Southern Mindanao Aquatic R&D Zonal Center', '2016-01-15 03:22:59', '2016-01-15 03:22:59'),
(137, 'Emplementation of the New Performance Evaluation System for Non-Teaching Peersonnel', NULL, NULL, '1998-12-23', '1998-12-23', 24, 'Vicente C. Hermoso Ph.D (DNSC Colleg Press.)', '2016-01-15 03:22:59', '2016-01-15 03:22:59'),
(138, 'Enhancing the Capacity of State Universities and Colleges in Informaion', NULL, NULL, '0000-00-00', '0000-00-00', 8, 'Microsoft, Intel, InfoTrans-PASUC', '2016-02-05 15:03:28', '2016-02-05 15:03:28'),
(139, 'PMS-OPES Seminar Workshop', NULL, NULL, '0000-00-00', '0000-00-00', 24, 'CSC', '2016-02-05 15:03:28', '2016-02-05 15:03:28'),
(140, 'Training on Regional Strategic Management and Curriculum Development', NULL, NULL, '0000-00-00', '0000-00-00', 52, 'Ched-DAP', '2016-02-05 15:03:29', '2016-02-05 15:03:29'),
(141, '10th Annual Convention of the Philippine Society for the Study of Nature', NULL, NULL, '0000-00-00', '0000-00-00', 8, 'PSSN-UP', '2016-02-05 15:03:29', '2016-02-05 15:03:29'),
(142, 'Symposium on Organizational Management and Curriculum Development Towa', NULL, NULL, '0000-00-00', '0000-00-00', 8, 'DNSC Graduate School', '2016-02-05 15:03:29', '2016-02-05 15:03:29'),
(143, 'Re-Echo Seminar Workshop on Education', NULL, NULL, '0000-00-00', '0000-00-00', 16, 'DNSC institute of Education', '2016-02-05 15:03:29', '2016-02-05 15:03:29'),
(144, 'PAGE Mindanao Zonal Conference', NULL, NULL, '0000-00-00', '0000-00-00', 16, 'PAGE Mindanao', '2016-02-05 15:03:29', '2016-02-05 15:03:29');

-- --------------------------------------------------------

--
-- Table structure for table `hris_training_participants`
--

CREATE TABLE IF NOT EXISTS `hris_training_participants` (
`id` int(10) unsigned NOT NULL,
  `training_id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `include_in_pds` tinyint(1) NOT NULL DEFAULT '1',
  `rvsp` enum('going','not going') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'going',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_training_participants`
--

INSERT INTO `hris_training_participants` (`id`, `training_id`, `employee_id`, `include_in_pds`, `rvsp`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 2, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 3, 13, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 4, 19, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 5, 19, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 6, 20, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 7, 20, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 8, 28, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 9, 28, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 10, 28, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 11, 28, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 12, 28, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 13, 28, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 14, 28, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 15, 28, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 16, 28, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 17, 26, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 18, 26, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 19, 26, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 20, 26, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 21, 26, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 22, 26, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 23, 35, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 24, 57, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 25, 57, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 26, 57, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 27, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 28, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 29, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 30, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 31, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 32, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 33, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 34, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 35, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 36, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 37, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 38, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 39, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 40, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 41, 46, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 42, 50, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 43, 50, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 44, 50, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 45, 110, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 46, 110, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 47, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 48, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 49, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 50, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 51, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 52, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 53, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 54, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 55, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 56, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 57, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 58, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 59, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 60, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 61, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 62, 33, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 63, 36, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 64, 36, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 65, 36, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 66, 36, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 68, 39, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 69, 39, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 70, 39, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 71, 39, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 72, 47, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 73, 47, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 74, 47, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 75, 47, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 76, 47, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 77, 47, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 78, 47, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 79, 47, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 80, 47, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 81, 47, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 82, 47, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 83, 45, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 84, 45, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 85, 45, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 86, 61, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 87, 61, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 88, 61, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 89, 61, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 90, 61, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 91, 61, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 92, 55, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 93, 55, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 94, 55, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 95, 55, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 96, 62, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 97, 62, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 98, 62, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 99, 62, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 100, 31, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 101, 31, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 102, 31, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 103, 31, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 104, 31, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 105, 31, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 106, 31, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 107, 31, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 108, 31, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 109, 31, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 112, 49, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 114, 49, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 115, 27, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 116, 58, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 117, 58, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 118, 58, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 119, 58, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 120, 58, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 121, 58, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 122, 58, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 123, 58, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 124, 58, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 125, 58, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 126, 42, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 127, 42, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 128, 42, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 129, 42, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 130, 42, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 131, 42, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 132, 42, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 133, 42, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 134, 42, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 135, 42, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 136, 41, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 137, 41, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 138, 83, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 139, 83, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 140, 83, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 141, 83, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 142, 83, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 143, 83, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 144, 83, 1, 'going', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hris_travel_orders`
--

CREATE TABLE IF NOT EXISTS `hris_travel_orders` (
`id` int(10) unsigned NOT NULL,
  `travel_order_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `recipient` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `purpose` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `expenses` double(8,2) NOT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `status` enum('filed','recommended','unrecommended','approved','disapproved','certified','uncertified') COLLATE utf8_unicode_ci DEFAULT 'filed',
  `finance_director_id` int(10) unsigned DEFAULT NULL,
  `recommending_approval_id` int(10) unsigned DEFAULT NULL,
  `approved_by_id` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hris_users`
--

CREATE TABLE IF NOT EXISTS `hris_users` (
`id` int(10) unsigned NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `signature` blob,
  `type` enum('user','admin','president') COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `status` enum('active','resigned','retired','inactive') COLLATE utf8_unicode_ci DEFAULT 'active',
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_users`
--

INSERT INTO `hris_users` (`id`, `username`, `email`, `password`, `signature`, `type`, `department_id`, `status`, `last_login`, `last_logout`, `ip_address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '001', NULL, '$2y$10$SVjPBmcEoMZLXUdm9y3SzOMl4oHSNIcp5Rb62m4qgCzuDvL76CJVC', NULL, 'user', 8, 'active', '2015-11-27 11:06:38', '2015-11-27 11:10:26', '::1', 'cZGBI9JilgtJTYT08diFaNlL5pOEKCVKEpZqEuMWmUx0gipMBe1Xkq4J2Blu', '2015-11-27 03:04:18', '2016-02-05 00:48:46'),
(2, '002', NULL, '$2y$10$nMELY.agcRA0Zq67ySBW.e2UreanKcZ6qutpck1xMDqq0f6JJHo8W', NULL, 'user', 11, 'resigned', NULL, NULL, NULL, '26u6m7fwyHv2NzUskrbSFOkIGviIS3rjQpwI6BYeC1vkQbQzliq1omy9G4tF', '2015-11-27 03:04:18', '2016-01-23 06:30:34'),
(3, '003', NULL, '$2y$10$6Hy6G3q3aAJc7l3uXb0P.OcwoWPhMIPpwn6XmKm2C8mV2mfWHQl7a', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e535568455567414141483041414142454341594141414373395470414141414f71306c45515652346e4f326462584155315a72486e7a366e2b3352507638394d5a3259797957516d6b3348494d44486b6a52686d416751434952424969615459614d6e4c5a62646342436f46436e737053696c7879374b577341616c574b5277546546566b626f624553795546376c5534473563516331564631686775634379684557594779416d6d52697739384d46436a47384445786e4173367636766d513665376e2f5076382b35772b3530796e68394a31485a4c38756b434a4670436b2f306d6166687663627266485a44496463377664746b5272695364306f67554d5a414b4277506341734d7274646c394b744a5a3451686c3954332f696953653472372f2b576a35783473543368686155354b347874487350426f4f686264753237573972617a766b647273726a4377727964316a6d4f6b464251585a52343463325977512b6d394a6b6a3435642b356377395370557a6d6a796b74793978686d2b72466a783559525176356357466a344e3449674e45536a55662b2b666676536a536f767964316a694f6e68634e6a2f7777382f564473636a6d584e7a63302f566c525566493851757079526b6545776f72776b73574749365565504876304e7833456e717175722f77414173475048447075753633516b45766b2f4938704c456875476d42364e526b647a4850644a51304e444641414149545359595a692f56465656475461435837353875546875334c67635173694963446963392b4b4c4c3270476c6658416f2b74365847503337743045496453646d707061632b307a565658664577526865377a4c7568625a32646c6c4e45314841454148674373416f464d553153744a306b366e307a6d39736247524e717273427a474d614f6e63547a2f395244524e75774141384f474848354b757271344a69714930475641574141436350486e7952554551766c3238654846715a57576c716147684953556e4a32636378766a4532624e6e567a332f2f505072476873626b77745231346a3356645463334d7742514b2f4e5a707567367a7234664c3478434b476555614e477052743135567174316d554d7735783175393135666651437054524e587a53627a57756d54352b4f4574334b426b49596b6c5353704e507036656e7a7268727943732f7a72612b3939707068465635585638644a6b72535645484c61352f4e4e76486d37312b73645131465562794151474a336f4368384959556853555252336d38336d64567532624547694b4461727172724b36424f5a4f584d6d72326e6136786a6a5472505a7647626b794a48616a64735652646b6b696d4c7a6e446c7a6676583364304f537071616d7a694f456e4b6d7171764951516a6f794d6a4a716a436a6e357469306152507965447956484d63645a686a6d724d316d2b3466783438664c75713544666e352b43554b6f743769344f4366526c5a376f4d4352704f42793273537837536c585641785246585a6b7a5a34367450302b71764c7963743976746459535130787a484858573733524f626d706f49777a4352314e545557596d753945534859596d39586d387854645074444d4e30754e33757038654e4735654e454e494134487145516947664a456e564146446a63726c2b4d5169373336697171724a5972645a56434b4675525645614e5530374c4d7679326b5258656e2b45312b7374434956436c6e3431666457715662544a5a446f6b4345497278726764496451446635314458772b4b6f6e6f70696d6f486748614759534c4468772f33474b456c4b7975726a4f4f344177436753354b3039366d6e6e754953625571734d586273574f5279755a374147483846414e2b774c50754632577a65627256616c3553586c2f39735a725276337a354543446b756975497a2f57703659574668447361344a78674d4672337a7a6a743861576d70467744796267792f332b392f393931335354415944434745656f714b696759627057664b6c436d387957546142514336795754367072437730472b6b535173584c6b53566c5a553574625731596a7a795a57566c56534b45656b52525841554138305652584b7870576a334c7373637778703261707230795a737759556464316d445a746d6f4f6d366337382f5077782f57713633573566794848637161616d706a754f6c68564661654a35766e6e6c797057476a7177426f496d6d366532794c4f386b684a7878753933465270547a364b4f504f6d565a2f6867417268424349726d3575646b33626b394c5335756a4b4d723649554f47714865624d7a55313951564a6b6b3475574c44675a31506678735a4732753132503030494f63337a2f4b4768513466363347353345554b6f4a7a4d7a30397576706b7553744e74734e712b373033355a57566b56464556643866763968732b684f59373731475179725632795a416d6e4b4d70374e453233653733656b6c6a7a6a42677877713970326d7741574b6f6f796b4b723156705a57466a6f30485564517147516b2b4f345179615461662f516f554e44504d2b33617071323574717875626d354a5169686270716d4c316f736c6a76576a36372f64565a6974567158415942757439735839375850364e476a4e56455564784a437a675344775263494965645772466768393576705a57566c446f52517038766c2b73564379593052446f6564684a445456717431395a6f31617778664c5a4d6b365a6a543658784f31335859736d554c4d70764e36786d474f56646358487a48726a3463446f746d73336b317a2f4d6e4165434b7957513644674237575a5a74785268336d38336d6465586c35537250383630387a3338786475785969363772344841345870566c2b6175724630734754644f6e4655583566534151714c6d365946523275334b4477574365494169374d4d5936414f6773793534614e6d795973363939353836647934756975507671666764756c644f51796e573558452f544e42305a505870306e36504861364771616950486359646d7a4a6a424732333432322b2f4c56495531656c79756170767143534f352f6d76564657396259764c7938757a3844792f6c784279334f46777a416d4651746d544a6b3269722b5a4669714b5132624e6e63347169664d7979374f47536b704c7270674441504141344f5776574c4a376e2b6632694b5037373434382f4c7336644f7864706d72594759397a753858696532726878342f574c2f714f50506b4a2b767a386b792f494769714a365a566e6536764634356746414c3864785232565a3372786f3061492b623456446867797845554c4f57697957726631717571496f4732565a336e793766514b42514248477544736a49324f4330596272756736444277387551516a3168454b686e375671743973396b366270692f583139583365582b7671366f676b535474565664583966762b637179624f382f6c386f52763353306c4a2b556561706950352b666d355036746767486b55525a314b53556d705a786a6d374e436851362b507443644f6e4567374849356c474f4e4f5152414f45304b32386a792f557854466f786a6a626b4551746a2f7979434e6c382b624e5177417746514336673848674349525154304642775330586d57773232327046555662336d2b6b7256717a674353487436656e707431304555565831643449673747316f614c687474313551554f443065723356466f746c4453486b704e31756e336376756a524e57384a78334f48362b6e7079342b65505066615948774375654479656972364f6d7a70317169684a3075645842325874414843416f716844474f4e7570394f35524e643138506c384a526a6a7a725330744f6b3348792f4c387438427742574d6358646d5a75626a665a55785a4d675158317061326e4d63782f327a4c4d762f35484b353575546d3567352b2f2f33337239664e6f4547444b67476735375050506c4d356a6a757261567166307a4664317945764c34384567304679712b31784e7a307a4d374f6170756e4f38764c795075383731344a6c32644f617073322f38624d33336e694479386e4a38586f386e6d714c7856497669754958474f4e4f516b68456b715464434b4675693856797838575644527332634455314e5461456b41634176416768727941496538316d38357162397930744c625551516a6f77786e304f6b4852646878456a526841416349524349565858645669775941484b7a4d79636a6844714351514331547a506679504c63744f6d545a742b635145584652586c30445239305736337633412f3956705957466747414c337a35382f5059466e326e4d566975656556786269624c737679656c455564323764757657324c666a71744f6b55546450724b597071564657316d57475930786a6a4870716d7a306d53744e646973627a69392f744c6e337a7953646e7239565a51464855465939777453644958474f4e476d7162587071576c7653434b347179556c4a52584a456c71346e6d2b6c5747594d3453516a70735867374b797371707631764842427838676a38637a4b7a63334e79505763315555356663593432364759633455467866663871746a6e382b6e3164625733746430744c6934574361454844655a544963777868326855436a37586e50463166424a6b7962784c4d756564546763732b2b3037374268777878327537324f6f716a66416342376472763956596644555a75646e5a327a614e47695879786f4b497179435142306c3875314f43556c5a536b417645665439455a5656542f48474a3955464757334a456c72725662726330366e6332704a53556d49454f4944414b38737935734a495a4570553662455a61486b576d526d5a6b34454150336d4873756f434151434f527a482f577471616d716674346d456d4f37332b7973706975716450486d79493535355656584e705369716c2b4f346230704c53324d7962767a3438536f68354c516b5365766a71576e78347357304b497037415543335771334c2b735030654556636b316b736c7257694b44624857365454366652614c4a5a646f564449452b757861576c70597767685a774f42514d794c4d4866514e41746a334a6d536b764b356f6969664a747249684a692b644f6c5377724c73555a764e6473734255614a697a35343963563365485474324c4763796d5135624c4a594770394f3554465856316b5366597977527477636a743233626c743362322b7578322b30373470557a586777665076787950504d644f48446736643765337652674d46682f2f767a356378306448512f5534395a784d2f333438654d56684a43323131392f2f552f78796a6b516d546c7a4a74666533763562575a622f5a632b65505732794c504d737933596c576c6373784d3330377537753853615436624e526f306239464b2b63413547576c7062696e7036656a45474442713044414d4159757a694f2b39394536347146754a686555314f6a6458643346776d4338476b383867316b49704649466364782f395853306e4945414f445370557665614452364973477959694975706e2f35355a656a4b596f4376392b2f4a783735426a4c52614851437833476658507362495a517469754b425247714b6c6269596676486978536b6d6b2b6d507533627465716a664e6c46645865324d52714d2b7539322b4377436771716f717661757279796d4b346e386d576c7373334c6670723737364b742f5631565568792f4b6d6541676179427738654c41595933785a303752764151426157317372475961354e476a516f503949744c6159754e383558315a57316b5361706a754e2f4c656c67524a5771335532777a436e4e6d2f655448526442316d573936717147746556766764696e68364a52435a7a484c66766d5765656159764852546951635467632f304e526c50726d6d322b7167554367724b4f6a6f795139505831316f6e5846796e325a506d6e534a424b4e52697346516468555731763755452f564141444d5a764f664c6c2b2b6a4134644f6a547a324c466a367852462b6266783438642f6d5768644d584d2f33555275626d344a4146774a68384f2b5248645a2f646a464e313739332f667452555646665435344f4e446a766c7036573176624a4a376e44337139336a2f4836526f63384a772f662f34335a57566c6731352b2b6557712f6676335035417646627a6e6c7763324e54576847544e6d664d5779374935494a504c624f4f744b59694433334e4a58726c7a706a55616a6732303232395a34436b7069505064732b74476a527966514e503258757271364232754f6d75546575336452465066534e483377776f554c6678396e54556b4d35703561656a6763396b536a30514b723157725979344f53474d63396d5837382b5046716d7159766a427735386f2f7846705445654f3670653163555a52644e307963696b636a664771417069634845334e4b584c313875646e563146517543734e4d4951556d4d4a3262543333727272534a6431306c36656e714c45594b5347452f4d7072653374343969474f624974476e5448766f7657423557596a4c39705a64655174466f74454951684438382b2b797a635833434e456e2f455a5070333333336e624f7a733750596172562b624a53674a4d59546b2b6b744c5332564c4d74654b43307454553756486d42696d724b7071727042313358753473574c6b7733556c4d52673772716c7a35382f6e3474476f79556d6b366e5a5345464a6a4f6575545739756276622b2b4f4f50365461623761462f7a506c683536354e623274727132425a397676362b7670766a52535578486a752b70374f736d776a78746a5431645531796d424e53517a6d726e2f695168434538786a6a35412f79506754454e487076625731462b666e35442f31547277383768762f4162704b4252374b372f6857534e5031587950384475363562356157525a2f6f41414141415355564f524b35435949493d, 'user', 11, 'active', NULL, NULL, NULL, 'd7eiftcYBjwDDLOM54IRGP5f5I3mcvG9WsXnIvUYk8x9paa8075ifQ9XFmm4', '2015-11-27 03:04:18', '2016-02-02 12:16:45'),
(4, '004', NULL, '$2y$10$OxrS8XFttSk7aygwEIG/iuXEPNXW1xLhTozz7sduPVUg9tzk5kbjG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:19', '2015-11-27 03:04:19'),
(5, '005', NULL, '$2y$10$0tHDuzRTqyK9FubUe8As4.0KTC3UZTqeuLR17lCta1HDvqlhd9oCO', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'Ti7kiTdMwknrJBQQ5k0EpWP7pAeYwe8B9g7ASvOcxdDCYvD0y9DSxACddWMS', '2015-11-27 03:04:19', '2016-01-12 06:21:56'),
(6, '006', NULL, '$2y$10$d0GNJKbHxTK02lizqclR4ulsGpZZ6fxp/aNaWXOeR8HMcZpFb4F7G', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:19', '2015-11-27 03:04:19'),
(7, '007', NULL, '$2y$10$A0DbxRQ/4u4Xgamlezh2f.gh/D3NidnnmvzWGZGMzvzh7kM1ArxzG', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e535568455567414141483041414142454341594141414373395470414141415056456c45515652346e4f316465334155315a722f2b7632596e706e7565655931595179544d4a6d515a43416b45514a734b677342416857436f726751677943464c6e647868524975416e573372705a5962466230656c5667765267737a4c5551645a55723934716f344f37796b6d496a6b6741714a4a424934474b53475a6a4a5931353939672b4e4654454a5161646e6d7343763676746e2b7576762b33582f2b75747a637671634577776842486477657747504e3445376944337569483462516a5769762f444343376a4659696b744c7938583438316c75414e54533574655546435164767a3438644e367666342f4f6a6f36317357627a334347616971397136764c4a63737954524245547279354448656f5276546d356d59374149445035334e753272534a6a6a4f64595133566943364b6f686b414942774f70315a58567876697a576334517a576968304968417742414a4249684c312b2b724270657778477175626d42514943504e34666242616f52336550783648513648514141506d484342463030596d37647568562f3838303356584f4e5138574d47544d456d38336d56697742516b675652704c6b662b586d356949415141554642615852694b6e56617263616a63616165462f627a5a725261487964352f6e54537356585452566f4e4270646533763775774167313958564a55516a70732f6e6377514367516e526942557233485858586555656a2b6542784d54454655726c5549336f4645555a414b415641434155436b574e56794151454e352f2f333079577647555246465255564a72612b746d535a4b326e443137396b4f6c3871684739484134724175487739656948546353695a6a57723139766a336263614f504167514e346658333948776d4338465a555643673749686e76397176584749623575794149717745674167415052615874777646394149414177423376363775523265333278515242644b616e703039514f7064714b6a30514350422b76372b48595a6775765634666c542f664a456e7952694f4f30736a507a3364382b2b3233315161445965505858333939534f6c38616d76725a49376a764671744e697066326869475562336f7131657670732b634f624f5a70756d7a786358462f78364c6e476f544854414d383871794c45556a6c732f6e61346c47484357786666763278377537757774634c74663474393536717963574f56587a65753946494244772b6e792b47316236794a456a54544e6e7a6d514838306c4b536d714d4872506f497a4d7a63327848523866764c52624c62372f383873745473637172696b6f2f644f675144514367305769436e5a32646667415142764f664d32654f324e726165727972713273724147775979492b6d365659414142785833624d4e7332624e457071626d3274346e762b34704b546b5437484d725971374551674561417a4479495345425039512f413866507279347036636e3165667a4464706d79374b634141446763726e735561415a5652773764757a5a634468737963724b6576694e4e393449787a4b334b696f64773741682b3561586c2b733848732b2f4167426b5a6d5a2b505a687659324e6a416742415330754c383163526a444c5330744c6d747257314c526b785973512f485435382b45717338367569306845612b7053744930654f72416f4767366e772f5842743832432b4f703175424141415256485a4e3470724e4270665430314e66576a4952483468636e4e7a585330744c56754e52754d4c6a59324e37796d64727a386f4c7672476a527678374f7a73735136486f387a74646b3963736d544a7a326246444c5853783438666e2b62786542347a476f33764167424f302f525773396e387a45442b5070387644514441372f64506676444242332b534e7a73376537516f697238764b536b78544a34383265583165752b2f6375584b30374e6e7a34374b4637377273574844426a49354f626e797a4a6b7a657a6d4f4f374a7332624a2f55794c506b4b446b7945396d5a71614c3437696a46455835654a35766f4369716e654f344f70764e4e717576332f37392b77554d773770486a6877354877442b42674276396864506b715258575a6239536843454b6644395342764363627837314b685259362f3366656d6c6c334374566e765336585365774441736c4a575639654f587538724b536f46686d4359415147617a2b5a6d6b704b524b444d4d51777a416f4a53566c5362547651306c4a695555516845386f696d7133574379504c3169776749336e364a39696761644d6d534a774846656e30576a326c7061576d6842434d483336644e466f4e50364f4949684f535a4932547030366c55514977616566666e7044305a314f3530534349414a327533302b41457741414553535a4c64476f7a6d75315772333164545534483339485134487a54434d7a3271314c744e717466753157753166336e6e6e485277684246617239586355525832586e4a7938672b4f34467176562b697a4c737064455561786857626168764c7863364931545746686f736c71746a774c414d7a7164627557594d57507372373332476a37552b7a4270307151456c6d56503844782f744c69344f436d6559697375656d357562686b416f486e7a357156646638787574786454465056336b386e3048454933726e53333232326e616270466b715274382b624e7733744646775468734e50706e49446a654c664434536a766538364b4653744d414942476a426778793236336c2b4534337032656e6c34366576546f7353524a586b314f546e35387a4a677834774167496b6b536b6952705233352b6667704e3078633147733275374f7a736952614c35516d4b6f72376a4f4f3434414c7a4b6364786e4a456c32386a782f504430396663714e376b4642515545537a2f4e31476f336d59465a576c696e65596973754f6b335469774567644f4c4569583672776d3633332f2f4471336e69594a5665576c6f71386a782f54424345673473574c6549525174417275736c6b716b45496753694b727a4d4d6336366f714369683937796c533563364151424e6d7a6274626f51514749334756796d4b3870416b3253364b346a764c6c79386e4b79737265595a685767414132653332427842436b4a575635645a6f4e50746f6d766277504838774a53586c6755574c4670454949566939656a552b62647130464a504a744a4567434a396572393938333333333666713776734c43516a76444d4b64356e6a3959566c5a6d694c66514d5246646b71534863427750665044424233522f78367571716e425246486478484e645158563264304a2f6f525556464b527a4831584563647a776e4a2b664856324f7636496d4a6955386a684b43696f6b4c4863567964567176644e332f2b66426f684245366e73775141496a4e6d7a4568444345464e545131757439754c72565a7232665050502f2f6a6779694b347573346a6f64476a783739737a6653594a61656e6a364f5a646d544c4d7565646a676378583250465263586d31695750536b497769647a35737a70393645596c7149584652564e41414130652f5a733130412b2b666e357153524a65764c793870374463547a51562f547337477758777a4266615453612f376d2b556e70465a786a6d38643766334736336979544a71346d4a69553867684d426b4d6c567a485064565a57566c7677396472786d4e7876554145484534484a4e7639687276766664657757673056704d6b32576b7747503551555648427231713169745271745874596c6d325950486d79616c37704d5247396f4b424152394e30693856696558597776345345685055637879454d773143763643524a6e694e4a30715056616d767a38764b4536382f70465632723166366b7032323157706351424e4774312b7472535a4c304a43516b5048306a6e70496b76513841534a4b6b6e622f30576a4d794d695a51464e5843736d79645271505a51354a6b6530354f546b363878593235364438497570496b7966624377734b4d675877714b6970304c4d7332415142794f70315045415452674f4f347a32617a4c567534634f46412f59465a4149427963335076767636597a5761627064466f58725a594c412f743337392f30463732756e587257495a686d6d77326d776648386536536b704a66334c764f7a382b3336485336745252467665783275776538586a57596f734566666652525871665437615670756955724b327641475345326d2b305a41454159686947617068474759594e576e534149612b44374754612f3675626d356555354d41794c7546797565326961766d53315774664557354262586e53454546525656644547672b466c67694136655a3576304f76314c35764e3572566d73336d744b49702f35446a75473449677567454150667a7777326a4b6c436c6f6f4d475a586e4d34484d55476732485074476e54666c556e4b546b356554364759614731613966717a47627a526f5a684c7379634f664e6e7a636c7773356774565a343061564a4b55315054424a2f503977384149414941494954385771313258317061577476426777632f4d52674d65484a794d6c79386548464c573176625079764e795741772f4345634468646675335974642b4c4569536c486a783739796d77327232687462663150705850484666462b36684243514e50303366444473437042454d68734e6d2b4f5256355246412f3358517968312b73336378783365745771565845644a6c58615650475644634d77456743414a456d495243497879566c62573876366644346e686d4848656e397a75567a50425950426c423037646c5446684553636f41725255314e54525a716d67306c4a535564696c664f707035374b6b47565a4d42714e582f542b64756a516f624e3676663550486f396e33634b464377656476584d72517857696b79544a416b43513437686473636f5a69555279534a4c734b6934752f736c456a48486a786d32555a5a6e2f364b4f502f6956575847494e5659684f4541535059566a593758622f58367879646e5230354e4d303362786c7935613276722f763362763373734667324f4c7865483554586c342b4c4b746446614a336458554a434b4867314b6c543633456344337338486b556d4d76524654302b504738667866682b7955614e47625175465171597676766969516d6b653859417152413847677a52434b47797a32667861726261525a566c46747855724b536e684163416c696d4a646638632f2b2b797a3833713966726658362f324e6b6a7a6942565749337472614b6f56436f5a37533074496576392f66794c4b7353636c386769436b644864336d79524a477241356b53527071392f764c786737647577344a626e4541366f5148634d77484d6478475144415944433068554968525376393838382f64784d45455a516b715834676e396d7a5a2f38767a2f4e664e6a55314b5435494647756f516e52524645577456757346414b416f366f72663731643064366c774f4a7a484d457a6a394f6e544231776176576e5470714167434b2f362f663537536b744c4c55727969545655495870662b48792b37794b52694b4c7a3857565a7a6d465a397453614e57734758575177632b624d50324d59527034366465702b4a666e45476d6f55586446466642392b2b434870392f746473697a3332346e7269323362746e6c356e6e2f62362f552b7143536e57454e316f69754e445273324a4347455442614c5a6344327643394555647a56336433744c697773564e55716d56384431596e4f383779695734523676643430575a5a4a71395536704657695a57566c2f3032535a4e754643786675555a4a584c4b4536306656362f51694f343461306b5047586f4b6d706154514164443335354a506e682b4c2f796975762b436d4b4f6e44743272562f56497054724b4536305473364f6c496f69676f71465a2f6a4f4b73674342307a5a7377596367366a305869534949694d527835355a4e4431384c634b564c467174624f7a3078734f683856392b2f62684c4d76616c5a7a597754434d69424471754a6c7a5171465176642f765437703438654b5032353764796c42467061656b704c54674f433757313964622f48362f6f68326d5143416752694b526d397136724b696f714234413850506e7a32636f5243756d5549586f77574377575a5a6c5966763237635752534554526a747a56713164316e5a32644e3755425555744c7978574f34377865722f654f364e454354644f58493545494c63767962774541416f4741596d316e4d42696b673848675466555a5671356332594d514f752f332b7a4f563468564c71454c30356375584e774e41734b4768776331785845636f464e4c5631745971386e6c566b7152724f703375707362326d35756241634f774d41414d692b334a5653483659343839316d477a3252626f3966726c627264374151445162372f3974694c6a33517a442b456d53764b6e4a45587632374c48333950533454536254583554674647756f6f76634f41484468776f563341514159686e484a736b7a75337231626b593875424548344d51793771596f39646572552f525246655630753177456c4f4d556171716a3076756874626d565a566f53624c4d756e723136393671697171687253513557526b544735766231396e634667324c683739323746426f31694364574a726a54533074492b51416a6848332f3863646d4e664d6550482b3838662f3738546b4551336e72787852633378594a6654424476696666585730354f6a703067694f3652493065574b5a5644454953394f70317533394b6c53386e2b6a746656316546577133584a44787359374a6f3764793466372f73535459733767657474353836644c4545516c305252584b6c556a737a4d7a414b534a44316d73336e6a3473574c53595151314e6257346f73574c6549544578506e436f4c77435545516e7354457843565656565644336c2f6d5672473445376a65746d336252754d346670486a75476f6c3836536c705a57524a4e6e4f4d45773754644d48575a5a746f476e364b734d775461496f506c3159574a6761373375686c4b6d6d3939344c6a386344426f50687a777a446e4651797a376c7a352f3561586c352b317a6666664f4f38644f6d53553650527443556b4a445462624c617a37373333586b78325934345856504d506475386764726a74657539336345663032784c2f447a49784356487139787a464141414141456c46546b5375516d4343, 'user', 11, 'active', NULL, NULL, NULL, 'oK9zhChevFad6tO6aBiYN9CiqybXknCj1WYzFuVJ9IGlIEctWvmYflkDTFi8', '2015-11-27 03:04:19', '2016-02-02 12:16:24'),
(8, '008', NULL, '$2y$10$AEUvwJo6iBQwcF1xeLFB/.BdWHFgSVVrjSbyIcSMK38Y8J2GjN.7i', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'Ya2eSgxhXIChZLlb2J6wTWn9xQ8LPWvdSmLMaPYgPF7U3Pbo6rcPFcgwWyc9', '2015-11-27 03:04:20', '2016-01-14 01:52:32'),
(9, '009', NULL, '$2y$10$S0aSpt7nVYALblhROxhy/.e7odElMNuRzo3a4hl4WsmEhaFBCSKHS', NULL, 'user', 11, 'active', NULL, NULL, NULL, '82FfVifiLiPkZMAZANohhuLz82vNw1LwRlYgkZ8bNn6BiDrgNASyVBKlxXRK', '2015-11-27 03:04:20', '2016-01-14 01:07:59'),
(10, '010', NULL, '$2y$10$Q5ekKyNTpdr3xNRa38VSd.KMR9a9/1VNTOmJshqZtEOUxWThS6bhO', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:20', '2015-11-27 03:04:20'),
(11, '011', NULL, '$2y$10$ckLTAogmG8vZLdL4QC54huIQvo8kcXYtCaHEPQZp5alz8XgwTEosa', NULL, 'user', 11, 'active', NULL, NULL, NULL, '3JJO3QhfoOx7L76fImvdeN5MoOPShGRwZD9skVHJSMkK2bA82G5SHfv0vMcK', '2015-11-27 03:04:20', '2016-01-14 01:11:08'),
(12, '012', NULL, '$2y$10$0gDIw8wF5A7h/mvRJb4DluRd0R5FT7iLUVN/xcNdkbQB.4vjK/GNK', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'ULHbsOMNB1yuWlLzIDlsXj8NQkanuGMEhsmEaNDMnbvvAUmpmOMUcvQGy9Vp', '2015-11-27 03:04:21', '2016-01-14 02:10:45'),
(13, '013', NULL, '$2y$10$382eUMHJBNl.MEvOhUxjOuvGmlhQHXJSdVAISuUc8.p5IO98W1BHy', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'JfII7oJZnOIr9YaUomgFlsnJWllcWZo8UXuBgT9BeJ8fhiPOMWzUfZsROPGw', '2015-11-27 03:04:21', '2016-01-08 13:37:38'),
(14, '014', NULL, '$2y$10$/3ve7Mro1eGaQGAjDwf./ul/cOD8KD/PEZe7Juw3RuMa80Xo2cIOi', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'Hk6u8sVuVKPk1K161zrjNXFzec6fKHUEo0tXdqQg5cMpHlY7yT0sfFk4RRNO', '2015-11-27 03:04:21', '2016-01-14 06:27:09'),
(15, '015', NULL, '$2y$10$SWoJG3LtPlvlBkaBCb7J6ONKQ8GT9CTWkpaOONq4aFqKaVJdv3c.a', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'pdclQFK0GzOnmGXTWjtX5rv23jFdfxZhGaMoZHpKRLWujiXdCvPnKDPiwfoY', '2015-11-27 03:04:21', '2016-01-14 02:20:02'),
(16, '016', NULL, '$2y$10$7Sfm/l5bYX7xsVSaflTe0use1fErmqLos8GwLVk9mBDhUAd27aEhi', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'XRYSK2Odr2fZ68UO5kxZmlyh1djODLtpI9fTjsB4pkKVVJyrVYZnpoMm6Ula', '2015-11-27 03:04:22', '2016-01-08 13:41:24'),
(17, '017', NULL, '$2y$10$zE9snL2CubPqrPpvmfsRC.2FF9bIpOVj5ryOgNsZWI.TBep4ObkPC', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'LvUKQLHx8OiuruQmIkB55n65X6Xhd21bcvJCK6EkxrLlg8PiFC4LDwnAmO6c', '2015-11-27 03:04:22', '2016-01-14 02:43:54'),
(18, '018', NULL, '$2y$10$2vEK9Oud6Q8EkjKlHPqzc.oUX1DGQbqNWZvfjysmQJqVdimowSx8e', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'STa1yN8XU90YIXuxQhsUMJlR9x3lShdR3aVVcxQKVc4DfaIb4ARYAYeANfGz', '2015-11-27 03:04:22', '2016-01-14 01:18:02'),
(19, '019', NULL, '$2y$10$DioJ1eq6wH50u4uuuceV5unT4CPxBt9jBM5DR3.KBGLAIDMFmUWpC', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'ZeGR5DSNDFBiRenugFU9Noyw5qzhe2QARlmzbCdwn1ehNKSK48oZ7ONsSsmU', '2015-11-27 03:04:22', '2016-01-15 03:08:52'),
(20, '020', NULL, '$2y$10$Pd3/T2RLbWW2pxgNexL.9.CMl7Deke9bydIOj82cGJyIIep9pCKqm', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'SA0PfPNxfxRcAtXSfK6GQgBYFhJeArPu9pufVeVWtfHNsTqL7BnNTnozw5AE', '2015-11-27 03:04:22', '2016-02-05 01:09:05'),
(21, '021', NULL, '$2y$10$b7RKc.Qc7IS6AZ/A8Uw9QuWT0msIiP4R4fvzDntWIQR5A23779dM6', NULL, 'user', 11, 'active', NULL, NULL, NULL, '4Vkv6gPByKXkGjzbuZBoTmYqpyVZzE9EUHPkpMFjcd0kqtAKvEawc0ZRuyFU', '2015-11-27 03:04:23', '2016-01-14 03:08:41'),
(22, '022', NULL, '$2y$10$lskgbHk1t3Ejnelk83ob/O7ayJDtHsPXrFQoYxIuDv/oDAxjc8GXe', NULL, 'user', 11, 'active', NULL, NULL, NULL, '9ERe7OSOUsHgvMy0fZyyyb8TtbWvXZKkUoecAt4GzEcgJDJKSu3jHhPJrHPH', '2015-11-27 03:04:23', '2016-01-14 02:55:10'),
(23, '023', NULL, '$2y$10$0PECaNiQOEMRMiqRm6TUoevTU4Gf8DZkSFKfI7aeHyEYU4E.ki.2q', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:23', '2015-11-27 03:04:23'),
(24, '024', NULL, '$2y$10$zwnXeHvW4Dv4vppzkCt1pOYmbKcW03sLEc2JqssBRBXaxj9KhzpCm', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:23', '2015-11-27 03:04:23'),
(25, '025', NULL, '$2y$10$GjUhqE5jgMC4RBYuDUTDE.d6vGzAvFZkmSmSVYJeFWtKzilR7ittS', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:24', '2015-11-27 03:04:24'),
(26, '026', NULL, '$2y$10$Ye76PtyTn89NwzsBo.cZBOSD8.j8RI/Ol/6Szybm/gCo58WHmRnte', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'xqJamuzPzARaPqfVOMqg0w5jHsXY5LtyqykD63IOZqoLy4xYC9IKhK9fVTl7', '2015-11-27 03:04:24', '2016-01-08 14:16:52'),
(27, '027', NULL, '$2y$10$2/xejhCYKjoErFlRrbu7/exvNc/6164Y2TMC1L8odZYt8PoTGiZpe', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'hXPI45MyOqxWe3LbQDfcwkNs183JcCXwHRhHxFUBCjjtZXP2gb0kGJ8V0Fvy', '2015-11-27 03:04:25', '2016-01-14 01:57:20'),
(28, '028', NULL, '$2y$10$/F9HG8rhaX7Z8w9zzH23huvt6y1TiyIzz2KL1/GXiqyY2JGPiQi22', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'AfpyAKMoPHnxdFFFU5dDDEjt2E9Sz7q3HMSW4oDZnF97wiw88cbwRqdqrUi5', '2015-11-27 03:04:25', '2016-01-15 03:23:09'),
(29, '029', NULL, '$2y$10$MlB6dgfB2r.HRolQrzc6k.RXHUInWJK.DfQ294bB2XbYetVfuCEqi', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'wapqZpFPTLq2Y4ntHRgkTY2jy2fZaiHFw4phu8UqNcGTksc4LEKs6PqzKfmv', '2015-11-27 03:04:25', '2016-01-08 13:51:34'),
(30, '030', NULL, '$2y$10$SwR8XQ7xm1Qg8nHM7bx7Oens92g8g0xgDP0b5NeAC/Vr3klj1NTa6', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:25', '2015-11-27 03:04:25'),
(31, '031', NULL, '$2y$10$eQU5v.aj1zL1MLwlN.mcdu05ODU0cSy3EhhUsQWe1FTczwiNPDoqC', NULL, 'user', 11, 'active', NULL, NULL, NULL, '1S5mMc7yMsw1am9jbsYN1XK0ugVA9uH3J97d8H0yiDLNYUZxaIPxk1PHOWmu', '2015-11-27 03:04:26', '2016-01-15 03:06:57'),
(32, '032', NULL, '$2y$10$LPGY37XlefTDbEsVJfCoS.JKDF3a7ZlEtCUToMuto6gUFKiFPoI9a', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:26', '2015-11-27 03:04:26'),
(33, '033', NULL, '$2y$10$8m7QQsZh1wSqtaHjNRSyE.xSmMhpyUHITl8cl2i9673mzaRsRhNe.', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'j9yn7Kcwyg6NJAdVem6Vi9Gqp40Wqm6gmwGeFElKRdVFA79keJ35STKxfcLC', '2015-11-27 03:04:26', '2016-01-08 14:01:08'),
(34, '034', NULL, '$2y$10$jVvCiQSuNb/PE44Sddcss.GQZhCpB1y36cxQEZklEHcsXeq7DHQVy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, 'PAuQnwBZbMWm8jtqtMsZiIbM1h0qFJ5rKdMI06Eip8dlbNUv13OPqcND2CSt', '2015-11-27 03:04:26', '2016-01-14 03:07:49'),
(35, '035', NULL, '$2y$10$ZbOBbgDPrdYL7dFXGsWEP.MPT5fcUC7Bv1adbh69AOIvVP4tfWz6m', NULL, 'user', 11, 'active', NULL, NULL, NULL, '8skJMqBsXqjyMoGIq4djc2lKKlrj17Dlajb3HiWyvsez24ahcrLGF49wbyNx', '2015-11-27 03:04:26', '2016-01-08 14:04:39'),
(36, '036', NULL, '$2y$10$zdCUMEkdg3lXkA9Pt7omnepCvq5uim7oIkjthzbyngeS33G4bt2VW', NULL, 'user', 11, 'active', NULL, NULL, NULL, '0oKbTSUW94QUtQf5QjzLiNKDpihnddQBD8Xoj3df4HEOBK3L1ZTewS4Z4RYA', '2015-11-27 03:04:27', '2016-01-14 01:42:19'),
(37, '037', NULL, '$2y$10$L.l2vdXkTup5z3YnVojIne4EIiWW5xaIbkslFZc6S6Kyp7uP.nFfC', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:27', '2015-11-27 03:04:27'),
(38, '038', NULL, '$2y$10$GdfKV5chV3MScdZdtL0ZruSErKwA23Xvh2jTWq6I5ZBpUveHNBnde', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'fbOpTFJS6dSg1ivYFcfzf3udfTUh8f0b24QUt0XZpfGVZu87Uw0gW81xOsbE', '2015-11-27 03:04:27', '2016-01-08 14:02:28'),
(39, '039', NULL, '$2y$10$hD4RQw/nIbglfM35TTQZleLWyLBF96YXMyRjbp/EK5YyGxSjj42au', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'PdRcBcL13dHsU4M1OOhlSBREzvWFQDqcN8AnXxZkOCER6yfmWMczO1YXF8u7', '2015-11-27 03:04:27', '2016-01-15 02:38:48'),
(40, '040', NULL, '$2y$10$mRjJBixNSP/CfHQDYN09iek3vNhW6PQDLsLpEnaX781p/dmoqPXLy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:28', '2015-11-27 03:04:28'),
(41, '041', NULL, '$2y$10$sRiMqkQAk6eCocu/1tgRFuAPjEMudG5Ighk4PQZPZQlqU5x0/9N4a', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'kErgfrIOaLhpu0oNEB9qBC0rn2V0ClvCE3tyIooADSzGgUw6CnKFjk0xB5gv', '2015-11-27 03:04:28', '2016-01-08 14:13:02'),
(42, '042', NULL, '$2y$10$ru8m/72/ykLRd.ZOVzkvXuo9TWToTOWFjgVRLF2zGQgV8IcIHTquu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:28', '2015-11-27 03:04:28'),
(43, '043', NULL, '$2y$10$QZgZmVgde4P4zL58kcG1BuX7vWdp.Zzi7yVoCXB1uvvru5BMBbVqS', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'Goc5tI62Sg2KZVfV2IrPg85W5YIaRrMk5uE9VP5rA1RrTnW8vIwBTH59VeLi', '2015-11-27 03:04:28', '2016-01-08 13:56:07'),
(44, '044', NULL, '$2y$10$nO/H9L7ZN4EimZKlAQtGg.zl2BaFy.rYAqHmjyNVOuggzLVt1JVGu', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'cq69NxUjRdWAWEAJB5XtY16mKr2RVKeOoNzoK3NSzHg0YS5S5e1ynbulTPXI', '2015-11-27 03:04:28', '2016-01-14 01:28:27'),
(45, '045', NULL, '$2y$10$mwFyHerxjW5sZGQUDiapNufQHZAJmhUnwBMX6/0qJKAAvIGWrINW.', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'yFNQ3HfugmEHsPgsempoe8KpKsGMuSNwmvfnelMyMOlD4Bw5KGzljXWGN1wi', '2015-11-27 03:04:29', '2016-01-14 06:03:33'),
(46, '046', NULL, '$2y$10$uiSTZJ5UpD2LT0qjvn7ms.Evs6HBLOi/DKV67n0DTPYL5VRoVMDwe', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'MyzxLYicNhHSPUOef7o8IRYzyULnPmM4Hiioogtky4TUNbeibsan9oibm8bE', '2015-11-27 03:04:29', '2016-01-08 14:05:37'),
(47, '047', NULL, '$2y$10$5jbSWPJzPyo1JOCU7IuUPubUSNeGAkGCeYsc6ygEDC7pzTQ.Xeedy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:29', '2015-11-27 03:04:29'),
(48, '048', NULL, '$2y$10$UVSbDKdOnd2ACTkD7hKgnOgjE6FndiWPVOi76pszvJwWG/ePT4jie', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'frwQ4l3WDZzjzqik8r3JzQxGou3lYIC0ZSHaxLef7PsNN9CkiZm3tHUoLHp9', '2015-11-27 03:04:30', '2016-01-14 06:23:32'),
(49, '049', NULL, '$2y$10$BQm6XyY6qAV2LWjYfJG0muR.n91YzOH0zkEHBolrJoeIRxDtRWtTC', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:30', '2015-11-27 03:04:30'),
(50, '050', NULL, '$2y$10$vFigch0os3yug.yzYZDgKeD0PzSEZvtc3YX.eVIdCpwZslSKFmW3u', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'ObOTh18YmLNbY7Ke5k4k1uJ195lIPUHnpV2ED3QssmnLzA0r3tqmgqqZzbA6', '2015-11-27 03:04:30', '2016-02-05 01:09:15'),
(51, '051', NULL, '$2y$10$hl8x1FKtYbZNPw14G.OZjObcsraatfBuuQJBx/8ZWmsed9q8a93/S', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:30', '2015-11-27 03:04:30'),
(52, '052', NULL, '$2y$10$fA0OkvMILbN579w8kBPkru8VImkqfL4soHBTaEMkpGo2aug9OxIT6', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:30', '2015-11-27 03:04:30'),
(53, '053', NULL, '$2y$10$RZfpUpTm0RYm6SeXr5F2A.tLaUbWtJKxBhZ/sjSNLXpcmb5GCH.oe', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:31', '2015-11-27 03:04:31'),
(54, '054', NULL, '$2y$10$pQt5y7Wotmo8ZnrdNLWMwO8n/YoG6da1bqgFJc8ND8hTOJTy.Yp8i', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:31', '2015-11-27 03:04:31'),
(55, '055', NULL, '$2y$10$VZr8i5ApiTqeM5M7.j1BTusAqorHjZDbLj80hukIdKcq.JTlfNMYi', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:31', '2015-11-27 03:04:31'),
(56, '056', NULL, '$2y$10$0IWrahr.kDppKdr1ZnEwNeMXtuoGn2ryGNzOVjbhdMvQVOfh5i7hG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:32', '2015-11-27 03:04:32'),
(57, '057', NULL, '$2y$10$fluepfemSeGoDM44BD7ifuHV8.HQQE91g1BlDV4C5WqrdGnESekYW', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e535568455567414141483041414142454341594141414373395470414141414d4f456c45515652346e4f3264665577555a7872416e33632b646d654732646c68642f687764706e4b4c72674c5752625a4c6f68384b5742787277565a37523678534d576a59654d6e35613761614b576d4c54617036596378686872734e77323547474c61692b31356c3137506d46356a726c64616d347565436c5a37485055716f685a4c36624975372f315236564742326c61327537727a53353645374c7a76387a347a763531355a325a33466f517842705859676f68304153712f504b723047455356486f4f6f306d4d5156586f4d6f6b7150516168494633416a73724b794e4c4973613269612f767174743934616933513950346548486e7149347a684f30397261656a6e5374514141414d5a596a544247585632644d7a342b2f706773793933333333382f46656c364d4d625276366666426c774f68554c2f6f536a713634364f6a7175524c675941414b6c333547495039555175426c476c78794371394268456c523644714e4a6a45465636444b4a4b6a304655365447494b6a304755615848494b723047455356486f4f6f306d4d5156586f4d6f6b7150515654704d59677150515a527063636755532b39706157466d6a6476586d563565666e43534e647932784470623262654b4449794d705a51464458434d4d7a416777382b4b4565366e7473686f6e35504a306c793374577256356c674d4369634f4845694f644c3133413545766653767676724b446741774e6a5a476e546c7a686f3930506263445553313937393639314d4441674149415146485531773838384d445a434a66306f336a2b2b65656a2b6e6d43714a597553524a6f74566f4141474159357576547030392f46654753626b68475273627131746257667a6d647a725752726d55366f6c7036583138664d7a6f364b674941454152783864537055784639467579707035356973724b79664273326244424d74587a5a736d5747382b6650507a51774d47426d5758624b4e32682f667a2f78394e4e50632b47743949654a36734f51305767634778763739706c467656352f3974436851372f6f41347864585633433865504872783439656e544f30614e48667a30304e4652782b664a6c3134554c463137647658763341396533372b6e705758587834735530686d45754f70334f7631792f2f506a78343854697859763342514942387763666650437272713675694c794a6f317236364f6a6f474545516f77414146793563474172336547317462645272723732322b744e505031334d736977314f446a6f35486c2b6147686f79427749424869453046687963764a6662546262377576374c6c7934304e4862323775565a646d685143416766504c4a4a326b4138506e454e6f382f2f6e6a4a3535392f377156702b70762b2f6e354e754e646e4f714c3638483731366c5543495552632b2f76396349797866506c792b377031367751416750333739337536753774336a6f794d3541304f446c6f4551666a624e39393838313952464873525173447a2f4a2b71717172754f332f2b2f4c386e3574693262527652323976376d3241777947646e5a2f2b576f716a5277634842677576484f6e486952506e5932426a46737578527639392f4d527a7238364f49394932434834714f6a67364f34376954434b454179374c756d6370625856314e56465255574d786d38794e786358454436656e706a36786174637167312b732f356e6e2b7a4f7256717931657235664847414e43694367734c5052544642565976486878535870362b6b355246442b707171705378764d564642544d5a526a6d6b71496f2b375a73325a4c4d63567a6672466d7a58706b345a6c31646e55476e30333347736d7966782b4e78546c66626338383970366d7271374f456337764f654d4c6d356d616975726f36302b2f334a393973726a6666664a4f4a693473375268424548386478334d336d4f336a77494848767666633654536254506f5a6842674541493452436439353535334b54796452466b6d51674e7a6533646d4b665278393956474d30476f387744484f79746256566b695470474142676f39483439747131612f6d616d686f2b4f546e35485a5a6c42796f714b757a37392b2b6e394872392b2f48783864306448523366505939757456703358757433754c32396664726e3141734b437677387a7738383838777a3469306a2f5a353737704545515267515266486b79705572705a764a4a6375796d53544a537761443463444e3172562b2f5872655a724e74356a6875514b76564470704d706b364e526e4e6c39757a5a70334e7a633539474349587364767532362f73745772516f6e364b6f45597646306c4a63584f776a43434a6f4e42713745554968673848776773466732454f535a4d426d7336317661576b684d4d5a674e707462614a6f657271696f794d515977394b6c532b3161725859594148423866507a665833373535576d6c577979576e59496744487a303055656157306236736d584c434a504a31417741754b7973724f786d636d566c5a586b42414d75792f496366617065666e312b6d4b4d6f4c4a70504a753250486a6b6b62314f2f3369776b4a4351634a67676771697649486e38396e72366d706362417365325875334c6c59713958696849534564376476337a3570517a73636a70304d77777a573139656e4b5972795a3045517a766a39666b4e5355744c723430634b73396e38556d7472363364395330744c797842436f646d7a5a362b7372363950302b76312f3652702b6f7242594f6754424b472f747261576e326f39624459626f64567144786d4e787037743237654837566372777049304c793976455144676f7149697a38336b5355704b326e3174372f69346f364f446d4b704e625733744849376a2b69694b4370416b4762545a624530546c78635846383832476f337655785131346e61376d2f66733261504247454e6d5a6d59544147414177417a44664848666666656c545a586661445232636878337875507865476d61486b354d544e787a37593345786358462b664c793870613174625639622b704a53307554744670747630366e4f38627a2f456d4e52764e6c59574768782b6c30726b59496854497a4d3666634c6b314e5459776b53662f696566366463416b506d2f53616d706f69414d41464251552f572f726d7a5a734e4f7032753535715563313164585a506d754130624e6e423676663539686d454750423750496b4551446a4d4d4d2f6a7777772f4c47474e7775567833307a52396957585a537936587132473833364644687969645476655038543356375861766d71344f52564661454549686a55597a777650385a327658726c562b545032794c47384741457a5439484275627534536a4445383863515449732f7a665846786364313164585754397661616d68706572396566733171744f3234353664585631535541674e50543037336a723832665039387453644b374b536b707630394c53377637526a6c5355314f664a556b794b456e53455a496b41396e5a32666b546c3364326468495a47526b3745454b68374f7a735652686a634467634452524642647875643936614e577653744672744f554551546c5a5756733664324e667239525a6f4e4a7068414d43534a423370364f68677071756a714b676f6e32585a53316172645a2f50352f76525a39576c7061574d4c4d744c56713563615a2f34656b354f546931434b486a484858667332725270302f634f34656e70365a6b41674f31322b384f336e50537973724b464149427a636e4b3847474f6f7171704b3175763150537a4c44756a312b7339496b6777346e633756302f58507a382f335542513162444b5a5876643450484e6f6d7235694d706e614a725a784f42792f517767464c52624c4b7a55314e52714d4d537859734d434445416f356e5536664b4972765552523170624b7963744b6c586b354f7a6a59417743524a426c3075312f496272632f382b664f4678783537624d72703561664769792b2b5343694b306b36535a4e42734e7263356e5537442b4c4c7938764b3745554a59464558664c53653971616b706a5343496f4e31752f783347474c4b7a7335736f6967726b354f5173383371397961496f766b755335496a44345a6930636855564655364f347a375436585139643931316c377874327a59694d54467850384d77413471697942686a4b436b7038534b4567724973763731697859727644704e757433737551524368754c6934666f5251794f56797262302b2f39617457796c46556436354e6d333076505453537a64394b6668546f377938584a77316139594c4a456b476a455a6a643146526b52316a4448613776593467694d44476a5276743452772f4c456b624778735a6e75634855314a53326e302b6e34586a75484d47672b48777338382b7932434d7765667a79594967644e4d302f575671617571714930654f554c573174636b326d36324f3437672b6a75504f655479656776463864727439455545517761536b70414f4b6f72784f302f53586769416371362b762f39346c6f6356694b5545496861344a37573572613574304e74376132697270644c6f2b414d424f703350394c793138504f624e6d30646c5a475455586a763639646a74396e784655585a7074647268686f59473879306e666375574c59516b53643073793336636d4a68346b4b62704c356373575a4933736333436851766e43494c774d556d535159376a656c69572f59496b7961424f707a745a566c5a574d4c467451304d446c5a695975464f6e3035316857586151352f6e58613274724a3832764b316173345052362f5245417744716437736d70616d747562715a6b575636646b704c79354e4b6c5336653864506f6c772b56796c58416331386579374264367666343079374a664e4459326876564842734f574f43456859642f344a5a484434586a6b774945446b2b624577734a435556475552314a54557a7446556678395556475274374b79306a425676724e6e7a78493764757751536b704b354d544578476b336973316d633175743170324e6a59316875364d31303547646e543033506a372b4545496f4a456c536a38316d432b7555453762454b536b704f306d53444b616d70725a76334c687832724e6a4e62344e6e382b584c416a434f51414979624c6335584b356846744f2b6f494643336954795a5458337434657474754a74314f7358373965464557786e2b6435544241456a6f2b5066322f4e6d6a566845522f786c56586a3233433733624e4a6b6779735737634f6239323646514d41746c71746b36342b5a694b692b76503057454b534a414d41554b6d70716242703079626765523647686f624b5833333131526c3370457150456b4b686b42514b6851684245454151424c4261725441364f6a726e384f48444d2f37744a6c56366c4b44526141694545496969434a637658346265336c345947526d35304e6e5a4f654d2f4636354b6a784a4f6e546f6c415144514e413176765045474441385051326c70365a37523064455a2f7a4b6f4b6a314b4d4a6c4d357a4847384f474848384b7558627541352f6b4c4652555666777a4c594a452b6131586a3232686f6144446f644c725442454667697149434e7075744f56786a5258786c3166682f32477932536b6d536a6851584639653174376650794b643655345836377a7969444c2f6672396d37642b396f4f4d645170636367366f6c63444b4a4b6a304655365447494b6a304755615848495038446e586f6d366438504b754541414141415355564f524b35435949493d, 'user', 7, 'active', NULL, NULL, NULL, 'hSr0QmjHT8TIMn8KIFGztl6pjc77eODLDTc5UGAtsVX78tYoBv5m7lgDBm3u', '2015-11-27 03:04:32', '2016-02-05 00:50:24'),
(58, '058', NULL, '$2y$10$cls7uysPIevepbHWQaYN3eV8a39ny6WT9UjWIqio.YeFo8NEos1OK', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'ib5yWxxDICKpb28uldzxhT2lA0TA4nnBUYP9jqMLkerRAZ2bPjaXRkjgDh8k', '2015-11-27 03:04:32', '2016-02-05 15:03:34'),
(59, '059', NULL, '$2y$10$c0ZqZBsTM6qGOhpLZmCBreMd5dbmy/DckjnBkFsdPM8V0m5EXFcT.', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'c6DhUHOLeQeeLizzTpVORMKjvXt9fqkjfIGOExyq0Mdd7MDZZyYcrEQlbT0X', '2015-11-27 03:04:32', '2016-02-05 01:09:27'),
(60, '060', NULL, '$2y$10$Yh/QglCIDD80xVD80J4Q7ewaAqSEZcM7eFM0l6movSFAbP35bMxOq', NULL, 'user', 6, 'active', NULL, NULL, NULL, '8vbkpr182uTWtYCOQXTLq4vyCCpSSFjdQvI4o6Z94zagZeQuAex7GSbHsQbW', '2015-11-27 03:04:32', '2016-02-05 00:48:29'),
(61, '061', NULL, '$2y$10$gSf4P0qUhAvK7kgL2uAU5.lYJkTZ/sjdF4Gz//j4ezwcyqm5qqeP.', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:33', '2015-11-27 03:04:33'),
(62, '062', NULL, '$2y$10$w9Vi7tF1T54f7YXg3tGmqef6ZiXLdDjeuHVQELiThesEun1vMdqIG', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'sHar4mpC8XrgvOev6K8ND1HYeuDAvs6WfSjrpFEtcpvbPLPbNa9gVddtKXqb', '2015-11-27 03:04:33', '2016-02-05 00:56:18'),
(63, '063', NULL, '$2y$10$Hrg4MYg8pgQWR/Ur3xl4U.YwKZSfppVW/BiOG3EmAOCX6vZl8bfPO', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'SgdMnFd63ZwqPxXB9hIF1QP6U90zWuXizDDS8wiIIyclEmILrJFkwVANOV8z', '2015-11-27 03:04:33', '2016-02-05 00:56:35'),
(64, '064', NULL, '$2y$10$M7nSlY8xTHWqTJ8vQOBgMuC.Zd42333.qb9QqKC3usG0EBFSuVahq', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'ci4UbUhd4nju3fp1QYVtGnTYPCO0EWPpMsr9hyNYK54gJ6G2ew1PlSp5x7Xj', '2015-11-27 03:04:33', '2016-02-05 00:57:16'),
(65, '065', NULL, '$2y$10$knFSIjxx2/ktdJz1vZ/d9u0nftfmdNbVxCkFzlcGzrqdNjw3SB1ze', NULL, 'user', 9, 'active', NULL, NULL, NULL, '9GhilMx7JNXbsBbVwRcuT3PUhrNm9RCxEAkuYWLXvK15qPhiYgclMaAuWuLJ', '2015-11-27 03:04:34', '2016-02-05 01:09:40'),
(66, '066', NULL, '$2y$10$.xUVtBNBNSTFyLMuQhTM4ufJY5eQ8oLO0JtL4.41xBBwIr8V5X4C.', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:34', '2015-11-27 03:04:34'),
(67, '067', NULL, '$2y$10$mruc.Uo6dIJuKUaiGO8xROlnn0VRDULdQiRVOrvfcrdqzbWgENj1q', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'u2VQ8fVExRst4rzSTHPYLSIj3vBsRV1WQar1ia4bOeaVdblIJeuvD1Sbb6Yg', '2015-11-27 03:04:34', '2016-02-05 00:50:10'),
(68, '068', NULL, '$2y$10$4WGF4dJmwQKd/9GTP3KE2umprU0DZ0qmgEOxnuGyNmz6iLGl8JomG', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'jIC3Xw3UFHuSdfpWMMBBMkMz5mDx7Yzvs12fg1fecZD2GN6eIvTEk7lu0Dt5', '2015-11-27 03:04:34', '2016-02-05 01:09:51'),
(69, '069', NULL, '$2y$10$JagvTO28RUdLvCbp4KgkdO.NpTJp4kisw3o5DZjeHAyS.s4rt/gpu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:35', '2015-11-27 03:04:35'),
(70, '070', NULL, '$2y$10$CFTOar0Y/sK4HNHMxvN/vuwnBDQ12ivzMqbdLZy7h4ScV7GYzLt9q', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'lQW702xzZU4BumxMBkscBenWTc68n8s6zei8p2DCTvtodzHMg72eEeFp2f2g', '2015-11-27 03:04:35', '2016-02-05 00:57:37'),
(71, '071', NULL, '$2y$10$Sp4fGyOEYyuXJjXEiT..lOHUFf1Rmu4s5EyaQpePxfvT.oXZRTWHG', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'd8Up5MOonMMefQQKS2bieprOUFMPkVkMH30dZz5cUZcmaVEwIKMoyf71AdLP', '2015-11-27 03:04:35', '2016-01-12 06:00:38'),
(72, '072', NULL, '$2y$10$HtswNDnPCK2sAQR45OL77e3tBvby3r7CFtdBZDywcEcHsG8.lkp8m', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'vRt3HMqZO650ADqvJqL70zZ1JngyOgnsBbvzocM29h5m3GObkcOZnftj5ZSg', '2015-11-27 03:04:36', '2016-02-05 00:50:49'),
(73, '073', NULL, '$2y$10$vxj3cdp.6ibjpDp6dqpdZu63fHY9Q7U2WvoKlAkFV4NbhCiAlG5oi', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'BVYZzaBC3k0974P80vwnrsuVNTtE4V7zjLqjoff8kozqVa5r8PgXpZ85MASw', '2015-11-27 03:04:36', '2016-02-05 00:51:02'),
(74, '074', NULL, '$2y$10$XO8HzPbT6tjM3SmIBkmqs.AvXiOnPegCe7kEvef343yFDlsLI7WDq', NULL, 'user', 6, 'active', NULL, NULL, NULL, '5TnqLOxoSrEtB9cf9XJ1IdCIe5TNjuX8DucVChF6QQOg8z2YeaEOYcZry9gw', '2015-11-27 03:04:36', '2016-02-05 00:57:51'),
(75, '075', NULL, '$2y$10$22HNPfin2M2bKCLxuv191e5mzZ6DZcHJezwtENGfClEhfdPmelH4G', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:36', '2015-11-27 03:04:36'),
(76, '076', NULL, '$2y$10$y6/aUkN450wcF8Cg5vMva.DOQ3byRc82HwvVYpIgpq9RD.UiniIle', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:37', '2015-11-27 03:04:37'),
(77, '077', NULL, '$2y$10$IWqjDAN2Yz2LxBBGVFA/hu6u/DYvcwt20WuKhj5xNmO0JvCCIOfzy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:37', '2015-11-27 03:04:37'),
(78, '078', NULL, '$2y$10$DDi8qgC5eGWdzZriuQznOeW8qi6Sn4wIQmIDoQZ8dLmoAri2vxj82', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'PAWTW6OxjOM7zCUkmasSsG5BD2LvT0kk05ouYYQk9YnCpcrzSzmUVeF7o77z', '2015-11-27 03:04:37', '2016-02-05 00:51:17'),
(79, '079', NULL, '$2y$10$1Fbx.ECnWpoeKcHqkVm6F.SQa5bAhxSI8OvsT9PWX2WLfUoCJm3Q.', NULL, 'user', 6, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:37', '2016-02-05 00:48:02');
INSERT INTO `hris_users` (`id`, `username`, `email`, `password`, `signature`, `type`, `department_id`, `status`, `last_login`, `last_logout`, `ip_address`, `remember_token`, `created_at`, `updated_at`) VALUES
(80, '080', NULL, '$2y$10$OllEJz6TlYLx9Js87bCApOUflZ5rpl3czTCnYZKpDsHh2UTK3DHdC', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e535568455567414141483041414142454341594141414373395470414141415a4f6b6c45515652346e4f31396531525552375a33565a31486e7a35392b7279362b3354544c3772707075585274476745473052454243526f48415956486377597845644d786867664a4361596d347a4a596d6d535a626a35386d55354c6d394773787a47385770432f50784d4a7374786948464d5a695a5262705a78457363594a7738487559624c454753776264713666396a4e616857455668356d5a4b2b312f364336617465752b74585a74577658506765494d51616a64486352476d6b46526d6e3461525430753542475162384c615254307535424751512b54302b6c38574a626c33544e6e7a75524757706568706c485177395456315a56383664496c5832646e4a7a5053756777317764456a323931486f302f365855696a6f4e2b463943384a656d6c7071534a4a306e4f534a443166574669594d4e4c3633476c456a7251436730327071616b5476767a7979345a4c6c79365a4151446f3434382f5a6745416a347930586e635344657154506d6e534a4c76566171306c434f49455175696b795752363132713172706b3061644b7750473056465258383131392f2f5272476d4851366e5173304773313767554167637a6a362f6b45527876693265636d534a62544c356171694b4b6f4651686769434f4972414d415a6d715a624151416869714c61724662726d6b574c466a474430563966624451616e344d51426c4e5455387377786b41516850324349427764796a356a35526b7a5a70424f70374e4d6c75586e6e45356e30556a6f634e73436676536a48346b366e5734586844436b3057672b637a71645a5a7332625749624778765249343838596b704f547037447375777841454249703950744c696b706f596469494c6d3575516b6b53625a4a6b72513755695a4a3067464a6b6f364d4e4e41526e6a6476486d307747445a4443494d416742424e3078663866722f334277583678496b547252714e356869454d42675846376531764c7863374b3365736d584c4f4b505275415541454c4a6172633956566c6169775236495471666252704a6b52325a6d5a6c4b6b544b76566e6a41594441306a445861454c52624c52674241694f66355055366e63785a465552644555587a6a427750363071564c61554551336f555142684953457059304e545864464d6a74323766547369792f6752414b75467975575150745a38574b4666614b69677048662f5855616e556278334862496e2f506d4448446a52447173746c734b30596162497778794d724b6370416b32614854366659382b75696a4e4d5959794c4a6352394e3078356f3161376766424f6832753730574142434b5a564933624e6a414d51787a6d75663578747261327073756b6e5872316e46476f2f454e4347475149496975754c693444583356726175724d346574794c496f2f536f68684d484d7a4d79556b51596359777a3065763157676943364a6b3663364936557061536b35414541734d56694b626a6a51632f4d7a4577484141515652646d31667631364d706132466f756c756a3877786f346479776d43384136454d4b6a5436527130577532484a456d3254353036316447487a447741414859366e646d524d6b6d5339716a563671392b39377666446670574569766e35756161614a7075312b6c30723061586537336554414141546b784d7a4c2f6a515264467359476d365a617055366561593232626c35646e7053697133574177624f377439326565655159706972495651686979322b31504c462b2b484e31373737302b4141424f536b7161332b736741436747414951414144364d4d5a67336278367655716e4f79624b384c566239686f4964446b63464141426e5a47524d694336664f4848694c41414158724a6b79624136637a45333848713932524443674b496f543939717036496f376d5959356c78746265304e65316c6959754963434748515a444b3945764554616d70717a4141413748613746773445394c53307446774151436768496146737041484847414e5a6c6e657031656f7a733266505a71347258776b68444b3161746170584233696f4f4b62677a4e4b6c53386d76762f3536505556522f7967714b76712f74786f624d42714e727755434161572b766a37762b742f4f6e7a2b2f587150522f43556e4a326439656e72366c567552662f37382b587370697271556d7072362f7133714f466930594d454338702f2f2f476352777a432f323774333736586f3331517156527250383938324e7a64664845366459674c396a332f385930354852306552547166627648506e7a762b353155376e7a352f2f463452514e304c49464632656c5a575633744852345a4d6b36645539652f5a3848796c766232396e41414341595a684c313873434141434545414141494931475179355a736f53356550466942634d77373557556c4e79796a6f4e464c70644c755854706b697749776f665235572b2b2b536236787a2f2b6b58543538755650662f4f6233335150703034787864362f2b65616266364d6f36727a66372f2b50322b6b304d544878497362347973574c462f6e6f38692b2b2b4f496e42454638372f46342f6c39302b5a456a522b7741414b4452614c37745456355a57646c66392b376465305551684d7a3333332f66336458565a5932506a33396b2b664c6c3131694b5134634f6f66723665767254547a396c725661723577392f2b494f58595a694d7a73354f57524345767a55334e3539314f42782f7a387a4d6650763131312b2f6644746a6a4e437666765572447741417146537176306158313966583878686a7279524a7678694d666d4b6967653444632b664f645141415176487838592f48756f647332624c6c47672f367749454450454b6f7732617a58534e4c6f39453069614a3434507232697149734a416769454263586c39425848317174396a4e524650647a484864454549546d4a3539384d7433763978646f4e4a704b7439763956467863334461475951354a6b6e5157495251414147414141495951687349524d687a6d55474a69347141646f567775317a4b4b6f6a717a73374d643065564a53556c6c344b71666b6a7663507361414b35704d70685545515151794d6a4938735852773975785a5a444b5a4773614e472b65506c486d393376455177714454365379506c425555464667706975717732577a56313875514a4b6d4f70756c764e6d3361785062577835747676736c5a4c4a6264424546674343474f416a436151797156716b4f76317a6570316572646272643767396c734c6c7535636d5853394f6e5456776d4345444b5a544456786358486c3639657648375137416c45555879524a736e6e6e7a7033583643374c38683631576e316d78596f56765937706a674364352f6d44484d633178647142312b764e425142676a38637a4a314a6d4e70745849495143632b664f37566e3953556c4a73774141654f4c45695a6e587935426c2b554f64546e63515977782b2b3976663076666464352f5835584a56694b4c346971496f6630494964594b72336a744743415731577531686838507873745070584b5052614d704c5330757a4e327a5959492b4c6979505872312f6659335871367571517a575a374b767a6b68795a4d6d44446f353257645476633852564574652f627336514833305563666c556d536246635535655868426e7a416f4d2b634f644e4555565362795752364c74594f33473733796e4351706563734b676a436670376e543062586778412b4467414952554b554556362f6672305a496453755671756244416244415a716d6d36504e4d3033546d4f663578766a342b4e6342414a6a6a75434e62746d7a704e324455314e53453948723979354846496f72692f727136756b45503543516d4a7136676162713973724b794a365a684e42717249495442636550475a666658506a6333313575556c4c533873724a7930437a4367436f6c4a79635841774277536b704b7a5075504b4970766b43545a6c5a75626d344178426f574668655a77634f62356178514234484541514b6971717371636c4a5355703966726e3962723959304551567949414d7777544276444d482f533658536e773038314a676743467859572b68524632526f7536796f724b2b7333614753333236736965376c61725734714c437a55447a6267346647585167694469714b6b59497a42786f30625359376a6a6d67306d71613675726f2b462b666b795a4e6c673847776979434954674241534a626c56634d4b756b366e32306852564f6650662f377a6d46626230614e48615971697a6b574462725661717943456f617973725045595937423438574a39656e7036726b716c3267634177437156366b4c3436517378444e4e436b6d514851524364343865504c2f62372f655a35382b5970444d4e3878624c735a316c5a5752554141447875334c6948535a4c73307576315279474567626934754455333032765370456b703462742b7a44444d36665430394a6a386c494879314b6c5445314a54557a6341414c445836793343474950553146512f5169686f73566765377176646a426b7a54447a5048343073646f49673273654f4854746f4474394167454e7174627152352f6e475749552f2b2b797a6570716d32784243515a764e6c7653546e2f78455a466e324d355a6c573355365861306f69676656616e567a784d5143414c43694b49635652586b364e545531372b474848375a714e4a705052464863483546707356696551416746556c4a533868495345736f686844676c4a61574e4949684f76392b666f74567144334d63313152545539506e7662306743416643674a38624d32614d627a416d737171715373515967386247526c5251554f4178476f3276554254567174466f4d4d7579574b2f587678782b674c5a54464e5661576c7261703258684f473566394f6e43355849744777776442777a363071564c576131572b343356616f335a366644372f5736534a4c7341414467314e585762577131756968344d515242744f703375694b496f5479636d4a6d3445414f44567131663333454b353365356943474577506a352b535252674a375661376348743237636a535a4c656f43674b713151714c416a434c6f78376274644350702b76563663734e54553142317a4e356d6e4a794d693477576d4d68577471617367705536623464447264466f376a76764a3676584e304f7431724a456c32524c61664b564f6d594645554d634d77583032624e73314c454553584a456d763943567a32725270446f54516d6367384f5a334f6f314f6e5469325a4d4747436164323664637837373731333233354876785679636e4a4d434b474149416a4c597856754e7075726f6b44474141444d737578686a38657a796d617a356237777767733971393368634977484149514d426b4d4a786869735862755731477131487a454d63337268776f55394d586f415142744655632f2f3870652f5a43496d476945556e447835636c4b344863737754445050383774366d56435053715536452f5a504b6d39313071717271354850353873545266456751696759415469797750746972565a376c69544a39767a38665066314d6c6576587330346e6334564e453233686d4d486f65693242454545524645387854444d4562566133574333323273714b6971734f3366756a486b5239467568734c44514477444132646e5a4d52316e6d707161454d2f7a372f493866303672316261457a656d5a77734c43586938586c69356461714a707574336c6371334247494f456849534b3845712f35704a46464d556d6a55627a6d63316d3278435a454a314f747a57366a69524a6d306d53374a6f7a5a343431557061526b65466d57665930525645644a456b47744672746f657271367069544632624f6e4b6b596a6362587267636c6d6c4e54557a4848635a4846486f794c6936766a6566344941414162444962393055397251304d446e5a6157567162566170764370342b543438614e6d3557656e703774644472765430784d72505234504e55387a2b3879474179667164587174736832534a4a6b70313676332b337a2b575a392b6557584177612f337771534a4e325045417136335735484c4a4e7a7a7a333338417a44744532614e4f6b59535a4b6e495951344f546d3554335061324e6849716c5371553749737631465355734b7a4c48744b6f394638394d777a7a3177544b4c46594c4a556b53585a4754334a69596d4a4e625731747a324c4b79636c4a4967696953362f583132434d51575a6d707039686d484d6b5358616b706155565779795768384e656537505a6246367a5973574b666d2b3564757a5977566974316d71475953354557363749566d5530476e635a444961463565586c4b624e6e7a3934646c6e38324f546c354a735a5830376b69396456716461737379322f6f644c72744c4d74654141426769714c61624462624534324e6a66336d454459304e4c41704b536d6c305a61473437672f44585337367265433357352f6a6d585a6c6b574c467356302f5664635844772b504d43654355704d5443792f575274465556346b434b4c646172587567684347556c4e54653830574e5a6c4d72305a4e65444238586d3831476f31622f58362f39363233336b49637837334473757a70386550486c31495531617053715a7139586d3865786c65505457363365786e4c737166434f70367a574379507a3530377431666e4b6a45787356536a305a7745414743627a595a644c6c63503444524e6e30744a535a6c54586c364f776f757943694555464154685545354f6a68356a444c7865627a46434b43444c6372334e5a6e755234376750535a4c73676843474f493572736c6773543553586c39746a7454727231713144382b624e53394470644c55555258556768414957693658665745712f677456716454314e30352b382f666262413836514f5837384f46495570545a696770784f357771575a55397174646f6a7834386637394d4d6a527333626b4c45644a6c4d706c3454494d614d47564d57507274696d715a623876507a66513648597958486363636768454745554b6642594b6850533075726868426968464241725661666d5468783467324a43675546425a7a4834316e4773757a4a38484778325777323132566b5a4b5248786d477a325a36414541596f696d717571616c704b793475787545395043444c3873357030366231674f58316576306b535861794c50764a6f6b574c5a4977784b43777331444d4d63355a6c3256505470302b584d636267685264654950507a3838326c706155706978637648705473344b79734c4a395771333258494969756c313536795852626f4f743075734e3676663664744c533034767675752b2b6d51592b662f65786e374a67785932614a6f6e67515168676b53624c56352f506c594979423257786547546144665a355070303262356f4551426b6953374d7249794c6a423266483566444d4a676d68484345574f647a31356339585631597a50353875524a4b6d424941684d30335248324147366b4a4f5463344f73614334704b6548636276644372565a374c4b783370385669655678526c466368684346424541356d5a57586c4a53636e6e34495159705a6c502f4e3450506d624e6d32365a674662726459584b5970714b79676f534d495967786b7a5a6e41387a2b39484348576c704b514d6555725554332f36557a596e4a366567736248787076743776344a6b5754356c73566832716c53715535496b7662466f30614962566d5a65587037646272657659566e324a4951775246465542774141522b65677a3530376c2b45347270476971506145684954376e3333323257737352325a6d706c326a305a7767434b4954516867776d557a624367734c5a597778714b7572347977575377314371464f763137636c4a79646a6d715a625330704b626a44485938654f545a4a6c75636638496f51435070397651487664553038397861536e702b65794c5074686c4a4f347136696f794b465771302b4649327576545a6b7970646474514b7656626c4f70564b643337647046563156563655565233416368444a6e4e3571654747764259754e384b434b45326d715933576979577077454149554551337446717463733948732f39444d4e55362f58362b7369624c417a446647577857445a6b5a6d615741514243647275394d6c7257394f6e5465795a50464d58644f546b35785a4d6e543535674d426732307a543946554b6f632b7a5973584d4d4273505769447943494936794c487361414244536172564873724b7979676943774161446f646539793236332b776d43614a466c2b5632455547547833584238363473724b696f34515244656a555146395872393972533074425361707239784f70307262685936746476744b776d43435041383336685771382b4730373432394a6365666b65422f76373737334d517769365479565439394e4e504d334678635855496f65697a614967676943355246412f487838645872463237567351594134664473596f67694d37382f487a4839544a4c536b6f55525647325239396851776944484d656473747674387a48476f4c4b796b72505a624d73356a76734d414e4171792f4a4a7139566157316c5a7959567672646f4b4377757466656c39394f685274716d7043586b386e6d5868793553546d7a64763774636e4b536f713469564a4f674168444a724e356c71547962516c48447659396f74662f454c7572333178636248434d4d7733434b4632575a5a504a43516b72487270705a66754b4d443742623278735a47484548625a3766616559483961576c714b4b49717a334737336649376a38686373574a423066547565353139547156526e7a353439322b65416b354b534d6c3075312b4f694b4e6235664c3638686f614747304270616d6f69502f6a67673537796666763230537a4c6e68554559554276726379634f5a4e6d5766614552714d354d332f2b2f4a75432f73676a6a2f41637878304356784e4661734c394937316576785541454c4a594c41504b37392b386562502b31372f2b4e542f537741347136414e685152412b314f76314e3254413343346e4a79666e517768445471647a7a6b44714e7a51306f4c437078724e6e7a2b347a7a586a37397532304a456e37494952426d38315733644451304c4e5943776f4b614a376e443149553154466c79705162467667506b516364394f336274374d55525a32544a4b6e5876506262596131572b794a465561325050666259674a366b2b66506e4b3546416a746c733776585334766a78343868674d44775072715a4d39356f4b4e6d33614e44644e307863346a6a763632474f5044656d6274794d4f2b69656666494951517530555264554f5647426d5a7161646f716a4f2b506a346d4750312f624852614e796c302b6b2b47576839575a6233517767786842434c6f746a72685a4846596c6b4949517a4b73727a726751636536484d37636a71646c57486e644642767645614362356f4337665035727641382f392b794c4a747656692b614f6a6f366c474177794a496b2b63564132777955416f474147574e3866714431753775374c377664377064554b74582f694b4c59657633765938614d6d6444533076494b79374c4858533758677a7432374f677a7a33376c7970572f45675468673561576c6e2b624d574f472f6c62486343645176336e764245476376334c6c69716d2f656848694f4934464141424a6b6d35487231367076623164333937652f74384472662f3232322f506c57583531653775626a5951434877642f6475434251763462372f39396e57453050644a53556b2f2f664f662f2f78395833494141474456716c5864647276397957417771427737646d7a64725937685471422b51512b46517064436f524139554948643364307941414330744c514d2b6d632f424545344c776943593644314a303261644b573575626b6b464172524a705070655052766877386658746e56315a586b385867652f506a6a6a2f2f616c34786f717171712b6b435370502f38377276766c7139647531614d55663037682f717a2f36496f4870526c2b6442413934763039485447352f4d564a79636e4433724f47632f7a7a784d453062707533626f4258596e4f6e6a326234546a75424d2f7a48793559734b426e7638374a79584654464e556d79334c4d48797a772b58773534665474415a3067376b547574774c4c7376735968766c777042584647414f76317a7354516867796d5577622b367537644f6c535a444b5a5867454168467775312f3352762b6c307574306b536262372f663659632b4e32374e6a424d417a7a6c53524a4f306436506f594d64454551746a454d63337266766e31443871325957466d53704630496f5943694b4a7366665044425871334a69792b2b5343754b386a4941494b516f79757350505042416a2b34544a6b7a49425665444c54476e63306459723964766f576e3633424e5050444773583541594e744164446b634e79374b74437859733644634d4f527a3834494d50696f496748415a5872304a6252564638336546774c4d764f7a76626e3565583530394c5338734d7643324a52464f7362477875766963544a737677615464504e7061576c747877316934754c4b344d5168704b546b394e48656a364742485242454262655375624d55504b795a63746f72396337527843455935484d6b636737616547457930364c78664a5539424f4f4d5161624e6d316956437256575a314f6431756d2b614748486e4941414c444659716b6336626d3446653733726458303950532f485435386d42514549514541384c656863796b48546c75336272304d414e6a3730454d502f66387a5a3836595470382b37652f75376b3447344f6f69356a6a75774f6566662f376e363976563139655076337a357370336e2b583233302f2f35382b652f35546a7566486433397a30416742323349327445714c39564d58763262443146555263455158686e363961744d583166356b356a6a754e574167427762573274636a747944683036684451617a5647565376587553492f7056726a66632f72657658752f4d356c4d47372f2f2f76754367776350656f5a684851345a7863664866776b4141507632376275747a355a753372775a495954737369782f4f5469614453384e36457355502f37786a2f2b50312b75644d6d7657724d2b48577147684a49504238463855525633382b392f2f6e6e63376368524655546f364f737858726c77354d55697144532b4e744b6b5a5476373937332b504e42724e555a716d4c39787a7a7a32332f48614c305769735151674673724f7a78342f306d47364652317942346561696f6949335464504e6172583662487036656e46525556464d6d53336c35655636686d4761745672742f6a737444576f55394a7477526b5a47446b5652625143416b43524a68394c5430777665657575746d774c59324e6849657a7965686546632b57423264725a2f4f485164437235722f334650555647523963534a4530392b393931336c64336433597857712f3155464d565848513748635167682b4f696a6a33694b6f6c694477654337634f464342735a34516b64486831576c5570323357713350662f4846462f382b306d4f345a52727056546553664f4441415a53666e2b38786d557831444d4d30672f444c6b4f474154382b37616a524e6433416339346e4e5a71755a4e5776576b4879385950524a48774736393935373961644f6e5a707a2b664c6c65497a786c5173584c725253465058506e4a796376357737642b377a7859735866373936396570657632503351364e52304f39432b7066386230326a64484d614266307570464851373049614266307570503846356d314d5851484355505541414141415355564f524b35435949493d, 'user', 6, 'active', NULL, NULL, NULL, 'A6ac1Q67qIreTXzu6yCeGMcBpWdWkhGQdLU0Xvs2g7IKlWosukR5ZyOGhGY6', '2015-11-27 03:04:38', '2016-02-05 00:58:10'),
(81, '081', NULL, '$2y$10$Fo5pJRTmIPW0bkKsySA7leGaNS3Nvhw5OnLxVnuckDP9G2teEoHMW', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'ySz7pvwUPK6XLZdaW0LAIW34Hzkjl7ITJuQYmoZeUQ6ErVQyURuTCDBHev48', '2015-11-27 03:04:38', '2016-02-05 00:58:23'),
(82, '082', NULL, '$2y$10$wRnicEcFnrZrfBisuen0J.snSsXO8KR9doQFzal7DD.gk6nUWX9Pa', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:38', '2015-11-27 03:04:38'),
(83, '083', NULL, '$2y$10$opgShIYTAV/fPFXYVCacTuU1cjWInB6wWcx40Jt7iIUMeApv/RbYG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:38', '2015-11-27 03:04:38'),
(84, '084', NULL, '$2y$10$jvGE/diydZMnb3lAJuJL9eZbFAmkTFq1/77zPpseJIorOJ81rfRcW', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:39', '2015-11-27 03:04:39'),
(85, '085', NULL, '$2y$10$FbMUmBMkeGrav9fhBHjwN.dXCqNdWj6Q1WgJICHFbNjROmsZIlZjO', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'dzsayr00V1hzkhwWBFIoh7cH7r6WFzNYiOxB1hV7VQbUg3Ssx1CS9InwJy5d', '2015-11-27 03:04:39', '2016-02-05 00:58:36'),
(86, '086', NULL, '$2y$10$cNt9/arv7R.r5E6oG/9Q2uKsyGlPHvLxUpH.FO/TRG6yuka9DWdry', NULL, 'user', 1, 'active', NULL, NULL, NULL, 'eHYztsozsmO7g10q4kVRAfdD2nuU7pa1oCJEy4bsTmtWuEr1WeyxhcnecRqC', '2015-11-27 03:04:39', '2016-02-05 00:53:25'),
(87, '087', NULL, '$2y$10$YZ2EqyGiLNrC7SdzOM5X4ex8sZB974ix8LcdCWim9/9xZo.ll3Yv6', NULL, 'user', 1, 'active', NULL, NULL, NULL, 'PLbZFHgbThSv5Ai79CsdpYvA19qH41vDGpJ65VX2m9jrn166W5zFOiiPlPA8', '2015-11-27 03:04:39', '2016-02-05 00:53:39'),
(88, '088', NULL, '$2y$10$LVVcE1PnulwAdRZhbltU.Os9CsgCNeXd7cp0XOlxoxGZeKGfwyQNq', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'YzGmVAS5L2CQtAAsh0kCumPPb0Dm9bWBzx5XFo79McHkf8LeZXR4CuBUl75D', '2015-11-27 03:04:39', '2016-02-05 00:58:58'),
(89, '089', NULL, '$2y$10$w3vWwx1rh/xlelQzKoXMC.EMqtaXh6twCeTLRae1xY1vxlv82FMZe', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:40', '2015-11-27 03:04:40'),
(90, '090', NULL, '$2y$10$B1rbwBgzNoPMnY3MpZXuvOdg7S/5TQAWJXvaQ0AbtpbO3vtUYfi6u', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:40', '2015-11-27 03:04:40'),
(91, '091', NULL, '$2y$10$bKX5cJ6FAviMwjoYXViB2ebJFmIrXS9cM0ZnKxbuY/5P5RmlvPfcS', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414830414141424543415941414143733954704141414156526b6c45515652346e4f3164665a4264525a552f5839313937357558595859593470694e464a584b5a6f65597a5159634935576c6b4755687862497069305642425a5956645332302f414a4b585752586930706c4b5370467561786d4656314b6b5670575a464652524d75346f696a6851795153776f6543515a4f51684a437659535a763372763963666150647966314d6a4f5a47636a546a4d6e387175346663392b3966627276722f763036584e4f393643717767794f4c6443527273414d2f7643594966305978417a7062594a7a7269764c7367387a632b2b527273746b6d43473966566a68765639706a4c6e6f5346646b4d6b67374330504565514377784671374d4953774b3658304b414438556c56444f2b564d4e794269743469384e63737947304c344f30543867716f575237706568384a686b2b3663492b2f395047504d6c63363535536d6c5467436f476d4d43497535543155635238546f41324b697136664372504330785731586e6878443271476f76414d774667453148756c4b48776d47703934364f6a6d34412b4b517835674645664a2b715a696d6c58536d6c78377a336d315331384e36664377412f5a2b597a454c47746d6d573677466f375231563776506362695569677a527130335868566c554e4573745975514d517241654169414e69565576704253756d75474f4d365664324a694e4a6f4e506f374f6a6f756154516179346e6f526b5438454143736132734c7067464343443249574548456f76523754477462365657523374485230656539767a3645634b3649334b75717433727637323264783870352f434645664578457a6b38703361697131794c6935617136733230746d415a6735684f74746258683465476452445476534e646e4d727a69486f6d49506437376c536d6c5a536d6c727852466355326a30666a576f51775856533143434e3847674d2b6e6c42597a38334a456e4e596a345a5643565638625169425674536d6c4f6744734f394a316d6768542f7669494b4d363544317072622f62657679576c74456c56623067705054505a7536706154796c39425246334574456c485230643252526c396946695a61703150464a513155714d55514267546b7070457744734f744a316d676854497230636d522f77336e2f616533382b414352566e572b4d4f572b716f7a616c74454e56377753417066563666656b555a4a376f6e4c764e4f666652715a522f4a454645676f6a437a5030413850683058364a4f695441695775796357316d705648714d4d5274553952527237554d7878705645644f4a34373151714654747231697737387265714a6d504d31314e4b4e6566633330346b447845727a4c79794b496f6c525647382f592f41366e395752414141724b702b2f314150545a647062644a4b6c4152632f345933764b465452485952306257712b7054332f6b5a6a544159415a34312b68356b7a414c677578766942316f59575262456e706652554347457049765a4d49485a426a5048734c4d756579764f634147444f71326e6334594b49656f6e6f704d6d655539574e6a55596a45354637596f786a706a74454a4f666369534a79626b6448687832766a44386b4a6957646942596a34754c4e6d7a656e776348427239587239523869496a467a647768425648574d30594b4953324f4d4633767654776141316b612b624978357748742f3071453052436c7a4c6a503346455778455246665863756d41434b617838796e6a36644a4546465539515a45764155526c34343353684752454e455355514b416567686846774345306557495348394b36637445394e6b5177684733377164432b756b7878746b376475783442674275564e5843474e4f5069502b5555767131716f3633376a374865392f4c7a452b72616e336b70716f6d496e714d6d537445744f42514d706c35766a476d78737837796a6f65746e6f7631394548444567696d6b744531784852625141776635785835694c694759693445424658415544584f50553830546e333371496f6c71707142524850464a45567061774b4d352f716e487333414b794a4d5a3556464d564a3376737835597a4157727567577132654e367265586133316267656d386a482f4167414b45666c79765637666d57585a78596a34486c5664784d7a586c623237745a49574553386749676b6864493475724636765032577454536d6c4e774c41313859546d464a364451426b7174705a46415841595336426a44454c6d666c7956533051635a574941444e2f694a6c587842677a5a6c3642694c386563524f586d6d79356950534545415141657376706145394c4f33754a36424d7070575569596748676c774351705a512b6a596876526b51787869784d4b533157316171714169496d496870334e594b495064626156536d6c7559683476366f4f49654a4345626e6147504d454976354832397a59716a72685255542f773877764564464873797937515553655a2b61474d65627a4974497a2b6e6e6e33504b75727135475a32656e4574484b30623844674a526c3348456f6d534a79737a486d525554386a6a486d5067436779657035714d7359302b326375344f5a39317472427844786b387838686a466d75375832546846354f4d2f7a37774a41393867374a61465064336433522b6463673468656373376443414139414e444e7a4263595937354852414e45744a61493968746a506b70454677484143387a63454a47474d57612f695077554562386e496730524762445733674a4e67362f316d38334c382f786d496d6f5130573841494d767a664647575a64385245572b7466526f5246373761627a434767776c2f424b6a6d6562376c7461393962535050387932494f47697448633679374c2b5a656334347a33636159323774362b754c766232394b694a7269576a75364f657374542f4e73757a6e68354a624c74556546354574524854544b323055455a316d6a466d446949754e4d5a63615977615a2b5459522b516b52625265524a347778573679315330586b6e7846785077436358726242646e52307242515264633546353977336a5446726d586b334d36386e6f76565a6c76307579374b47694c7a457a50396e6a486b53414259425141594179346a6f733468344178457474396165614b3239457847485265516d496e705252443449545330376834677549364b487262583771395871466d504d727742674f534b75643837745a655a624548474c69467a3265794d64414c715975527352357950694230342b2b655447787a2f2b63633279544c4d73327930694e3151716c577938776842784f52483543792b38554c7536756e614c794e3473793734484141764c447a49536a506953694778337a6e56616138654d59756663486462616e3163716c51466a7a41644779656a4b382f7a4c575a61644d657164666d612b31546c33726e5075615552734d504d76386a782f6e4a6e586a71686f5242776b496d2b4d2b52517a43794c4f52735142524879596948714e4d576354306250573272334d2f464b65352b6368346e77412b4b6d316472647a626938527663444d61374d73477943697755716c73676f417050782b684967576d6759737153726b6558366d74665a47524a776a496738773831354548444447764a526c3255425a7031755a2b6432494f4f696332343249673468344177443069386a7a7a726c5074576f38414b424b7056493178727a5847504d4c353979447a726b376d666b4b35317831497530346d6e444c7a48637a3877417a3733664f4458523164656b70703579697051703737775271744e63593830425054342f32392f6448496c72746e4c744f5250595330585969576b3145467a507a786462614e586d65447a6a6e666d477458544b36724771316570647a376b586e334141414c476c744b4246396e496a325a316c32575976734c6d7674485a564b5a64415938364349624b6c554b6e63666439787867387738344a78624d6649524550464f5938774c414c43777064784c41574251524e5a6261332f487a4d385430636f387a322b43706d30424146414267486555317877522b61787a62686741746742413735524857564d54504a6a6e2b525a6a7a4c504d2f4b427a377171796b3168452f4c497835736b737936346f372f553635395937353234646d525941674977787032565a647065494442746a4270787a41386159596566636f4c5832627564632f3647494832334964567072647856467351385239336a764f792b37374c4c4f3434382f486a5a73325043596948786a504c744152415152333457496978417872562b2f66696341334e316f4e4a354378453545584d484d483062454168465453676b716c556f3179374a464c3737343467706f476b47746f4a5253702f662b5a7743773963424e6f6d3441654373304c666f45414a446e6552555250777741793875504e6a2b4563473274567673784d7a3941524273626a635950745453436a4447316c4e4a7a41504472466e6c664a36493349754b3756485750694e78557239662f76625643716c7144467350545772732b684c4256524b344e49557735674b5371367844786b7548683453554155414f415231754e595554386950642b6b66662b45573136396e5977387a34416d472b4d4955516b45546b44456466454745386b6f6e5771656838414a4552386a596a3065652f5042494265612b336c41504455474c35475657675849743467496d746a6a447342344431396658337a31713564573851593778776548683758696f3478396f6e4935633635327235392b796f707055645564614f71376b50456630584542324b4d6278615275535066374857766539315a31577056746d3362746d3130655556527642784373414277483551574d79494b497236446945356c3569454147454a457966503866465639507742734c497269564143346e346a2b4e3657306a4a6b54414e79714279386237775341516c7463706470636871364b4d66374f474c4f6a3057683865314c324148346b497673616a6359392b677174616c586442496449736c44566c3246552b4a6d5a4e366a71786170617a624b734c3453774f71585561597a357a2b486834567455395541484a714c357a726e33464558784c6848356d44486d513937376f6446434471574743424858584837353566723631372f2b52576852682b5059414775592b566b522b51307a4e346a6f33654d38567757414251437777426a7a74746d7a5a772f3239505234496c6f366a6946326b34674d413844694179704a704238526e79324e734e39567139586c6948692b694478746a486e51577675324c4d7657566971565a514241496e4b53632b3654496a4c473450786a75356a3567336d6537382b7937414a6a7a4833476d43334f755373416f486f49546a715a656255783569567237586c6a6670394947424639356f51545474425a7332593941614f5747534f5874665a39705647326d706d66464a466e6d586e32524f586d6562354d5248594477485a456e442b7177686b41504f79633277384170356233466750416734673449434c7674645a7579665038566d504d457743775730544f4e4d5a30356e6d2b434134326472714f4e47487475497778373668554b6e757474513862593134536b537563632b4d5333744a522b68447863524735413171576f354f53337448526352554152477674666550304a724c57726b44453535317a5033664f7a625857726e484f6658513869377a316373347445704866414d4364414e413571684f646a6f69376a54474e61725736586b51654d4d59386a3467654561384367473452655149523932645a39714978356c496f4c65656a39554c457055546b79322f774b51436f5450594f414969316468557a50392f523058475173547a5a69347563633374465a417330585a5655717334755a7634674d372f6b6e4873797a2f4d7a537a4c464f54657049385535643759785a726531396c396137784e52685a6c765273526657577658414d426545646b764974757a4c50736b6c4a59304553306a6f73634259506c6b4865786f7545536b6e34676169486a4879446559796755415a3476496744486d6f4f6c32516a6573716d346b6f686f697a6747417a785052716a4c773844466d587161714f3475692b4a697133673841554b2f584a34306a49364a596179396b356b3459356673337869784f4b5a306e497439764e426f664535456e694b697a4b4970485177672f31744a67696a47754134432f6e457a57305142457a4a6a354834777855425446486470696c4534423630546b57346a34574f764e53583376496e4b76746661796572312b4b6742384678454245514d6972694f696d37333350394170574b2b49614c4d73572b5363577a68723171794c6a6a2f2b654e71306164504a7a487952694f7772697549355938776c4143416868467531755554367769746f3446454a5a6a344e414d34764e64777258535855414f416652392b665373446c6d3056527247446d5a324b4d466741434971354e4b5832724b49714e6b37324d694e5a617535535a7a31545663304949533049493265446759456f705855424535775041546d504d49796d6c4f5554305265666359354f5665797941694b7045644355526b617257694769694849517059314c5359347950616e4e644f59655a503647716d347569654b627352524d434553584c7369754b6f72686b7759494653375a75335372652b397251304e445836765836366170614d504e57414a6948694f635a59304a4b615775745670734c427a74506a6b6d6f616e394b365777692b6c704b36534a7455787257705048306c4e4975414c68656d7a733433686c6a3344704677736c6165326d6c55726e6d36717576376a2f72724c4f734d57624957767535454d4a6e6d586b50496a365555766f5141467759593777797062517578726a43474c4d4b4565644f4a754e6f52706e593855346932685a6a584b75716c5a525357304b726b354b75716b6c56663042456e774f414664626157784278544a7838544d46456c7a4c7a3671757575717233754f4f4f6f397476767a304e4451327446704656414c43724b4970455250555177715a476f2f46596a5045724d63623347474f2b714b724c4b35584b366e593038493859637746674b5143735539564e717471322f4c6f705a61526f4d2f6e676d6a7a506578467852516a684352483545694a2b56565748596f77464e483368684968537156544f744e6175504f47454533727575656565394d676a6a32787a7a6c33767666396955525142456273524d62576d49476b7a62333462496c35726a4f6c734e4272643757726b48794f4d4d63746a6a4174696a466344514a325a496158554676552b3554516b5661306834767342594a647a37674a457643614538483469756838526e305045765144774a36726145324e6334623376336235392b323966654f47466a534c796d56717439714e5775555355656539484f73746f4f56664377626c3178785151735349696234566d734f6b684b4e4f357972583359654d56355a367036683545764c6f6f6973654e4d58384e414b655671564546496759416b4a53534c55667a505552306c2f662b477947456732774149724968684971713173637a5472515a6444686d5554706a467363592f3673634247306a484f42564a4279577a6f4576497549397a4878614347454245663270716c616753667062524f5358496e4a31725659624e354c6b6e4d753839395a614f33693444546a61554335787a7747414f68463972377748324d6173344665645a61717132774467473468494b61567561415a4b33705a6c32567453536d75476834642f6536683369536744674578456a756b5250523659755a4a53576b70457a385559442f6842326a6e53443973694c4b3337585143774451444f6954482b4e71563049476c68504d5159737a4b74643170763944735353436e317868695846555678582b7330683468744f3943686e647473466746416e2f662b6f526a6a304551507868697a6c4a4c55362f5539457a31336a4f4973614772672b3064756c484e36676a627831546253456245666d6e6c6b33356c736161477173356b356842426d53473942365a42354d79492b673467485648744b53596949326a586132304a3647546b377856713742366267506c58566b7847784149444e375a422f74494349356f6c4958365653656251316d6959696330536b426932624c51344837646f4e536f67344735714a667050757a55624575534745424530375941596c45484665434745324150786b564169317433526d375769486e4c61516a6f6a6776652b4570714e6c77766b636f4e6d6a566657334959527076592f374347434a694354762f55455a72436d6c627539394267427449623074366a335063324c6d62694a3665624a4945445a33673836464764552b42696d6c3135636a2f4c6e572b3878384167415552445470674a6f4b326a616e413041764555326c4a2f59686f6f307848764f68303945516b59564574486d305278495235794c694c6d76743944486b6f4b6e577037536b594f59464951544c7a412b3353665a5241555355474f4f69454d4b4730622b6c6c4f616f366c62762f66516833587566596f7737556b6f54486f5a6265752f2b43674232654f396e52767242364d2f7a764243524a317476496d49566d346374375a7857704264466b5142675830717069684f6671394b707167757a4c4e7347302f7745706a38306d486c2b76563658454d4c6f464c52655a73365965544f4d696b692b577254544931646e5a6f486d54705a7867596a64414c43674b496f4e716a726a6d476d424d6562504558476e63323530504b497a7874675a5933774270686e70435245335135507751367034524477644555384b4958793354584b50477351594f784778466d4d384b4d565a524c705631544c7a72716c6b485538466253466456594f495042426a7244726e2b735a3742684737726256765639554e4d486158366a475045454b6d7a514f5544317279457448734d7632354c577430674461713936496f666d324d71555054647a796d584245353033742f717258324c67435943616d326f4e79526178467854464a4a6152796e65723365746f686b323068504b5732494d57344f4953786c356f4d4f3033484f39534c694e5969347733762f3158616c38683546454759575a713542793778642b6a2f654a434937797a543074714274704b747153696e64526b534c55307158456c4576496c617a4c4f736a6f74554163424952585a39536d7648456a595531786d546c59634948446c595745564c5668536d6c7a6472476b3750626576796d632b36656f696a2b6e6f69755a65593371657154716e7168392f35555a7636336f696a75626165386f776b70705a487334414d444d63593457305157714f6f64375a545656744a72746471754c4d7457687842755273534c69436a45474174452f4c72332f695a56625976762b4368457253694b756f683051557357734b6f754c6a586f47432f6434614374704b74715173523149764b52454d4b705250526e71766f54566633687a4c72383043685850304d6868457035454f484966503433524c514c41435939587632566f4f326e4b3564473267385138576378786d34413244466a7545304f59387a4c3376764d576a7379306e7568656262644f694a7161393742372b306f616c57747165725747634b6e68764c676878355637515941514d516c414c4451652f2f4e52715052316d6c785770772f50674f416f614768487a467a616a516146355a6e387230666d706c496254642b702f76682b63634d5650555a5a763668716c37477a4c4e54537633476d4a5646556254646b54557a3071635256505557524877357066513252507932392f373233346363624f664f69526b634872443566324175517351337842687653536d4e4f6532784c584a6d534a39654b4230304651436f745375714e6b6247444f6e48486d626d39474d512f773937524d30707a45434b724141414141424a52553545726b4a6767673d3d, 'user', 6, 'active', NULL, NULL, NULL, 'IXSrC14Q8njT2hhzfQ8OXuNtl1UZMisPWmSYsHBQURNQxllBpOuMJXVtSKip', '2015-11-27 03:04:40', '2016-02-05 00:59:12'),
(92, '092', NULL, '$2y$10$VFtxeEV/JDnoIhffX90Wcu90NN7tHgTWDySIrF2RcWzueuJKKFIoK', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:40', '2015-11-27 03:04:40'),
(93, '093', NULL, '$2y$10$F0Np71DkVEdkjvlgPpsb/ujshEvGahNXIj2udYOo/8GmJIpUlghKe', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'oxQXJkRLKv1OdVpn0DS4jMF80k0ufDxxgIAPDmHsqyHiysivlPwMhSmLG3r1', '2015-11-27 03:04:41', '2016-02-05 01:10:03'),
(94, '094', NULL, '$2y$10$M49UtI7xDUJQN5Hz4zZl2.OnXPDINMI9c.b4Z27KDuhkJC4DIX0iu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:41', '2015-11-27 03:04:41'),
(95, '095', NULL, '$2y$10$P/xBn2Y9q47ynNI7XLruj.thatuFOgi13qZr4IFj1F3j3gH/huIRa', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'EAgfDvpkTiIVYiGIiGnJtaENtOQHzznubkKvT3lbXbVZUxxCfC48CGLmtfFa', '2015-11-27 03:04:41', '2016-02-05 01:10:14'),
(96, '096', NULL, '$2y$10$qNQPySlIpbYTd1UxpW2th.qMRR60PG1HXjUxP6icGwSUp8du982sO', NULL, 'user', 9, 'active', NULL, NULL, NULL, '6UbypndWIVKK0UnnORPkYCKYU1AWRKcPwe9sVDc9BNuJsRPdBlLykRO7aFtm', '2015-11-27 03:04:41', '2016-02-05 01:10:25'),
(97, '097', NULL, '$2y$10$vQsRViuwKbafl6oKdb4qSOnLdy.K/ZP1ZmRQiu8FTThnQNz1cEcSC', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'Hrnd1pvRfIrwavmj0i48k6CFiO6ivt0bZSvvZrT7T3gWjbD02syWufQ0vMuH', '2015-11-27 03:04:41', '2016-02-05 01:10:39'),
(98, '098', NULL, '$2y$10$JuiqpO53JUby7Gr3cWBv8O56Q0j8.OTTOrAYFtOhIWl.mAgnyOJim', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:42', '2015-11-27 03:04:42'),
(99, '099', NULL, '$2y$10$of0dfy/OzvFFgvnL02yQqe8JyOwVfTWolLTSdqwRpYnOq4TmlctWW', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'RlL6xNxMozcytprf2Na4rQohlEeoAxkfWtyyeHu72jZncEDokTuOmaybg9Hy', '2015-11-27 03:04:42', '2016-01-08 16:00:16'),
(100, '100', NULL, '$2y$10$wMmUp7IRA7jULlYYP4xR5ukkuUUXfRgfQy8EGpqP0m/XIFWNmyRVG', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'XVnvhrwn29Wg1J5ukuV47q757XwA4JJ5k5ZD00FB3LZsAHm2ZE1JFApvwcPb', '2015-11-27 03:04:42', '2016-02-05 00:51:30'),
(101, '101', NULL, '$2y$10$ydDU9MY7qBsTIJV.TniW.ethaqiLCRm/uoaGqhE22iKIpdcbjAs16', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:42', '2015-11-27 03:04:42'),
(102, '102', NULL, '$2y$10$WfySiYCa/DlI7FfMDtQ.FOTsRxrdRH9id4uUK0Q6xk/uaRppPANTW', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:43', '2015-11-27 03:04:43'),
(103, '103', NULL, '$2y$10$2CHY/o4A9DlfyVthK67yzeX9K49WLO4LJTqHHndHSyW7.6bPRO2Y2', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'VOWVyoeK57i99BUZe300qhWCM50MmqIqAce8ljFBdf2sXciLtUU24e8lVyfG', '2015-11-27 03:04:43', '2016-02-05 00:59:25'),
(104, '104', NULL, '$2y$10$TEtSY3Zf/2YKKudjnYFOOepaH2wrUKFcnLBXmeSpICKSq06aRxJ3m', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:43', '2015-11-27 03:04:43'),
(105, '105', NULL, '$2y$10$dWSNcbg7HxalyWrXlS5yZOCEvqkSKNq17nrnjNsTa0bkas3gLDrVG', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'Mh5Jj9xxdhH2OPIYgQYbdcbUY4eceJr4AGbY4wT899JyIy7uJ4QBEyPR26Bs', '2015-11-27 03:04:43', '2016-02-05 01:00:13'),
(106, '106', NULL, '$2y$10$7OpsjLY84s5I3I1uQon.cuLTueKvGZwGYel99cPMZBtFGsscMpOnm', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:44', '2015-11-27 03:04:44'),
(107, '107', NULL, '$2y$10$DRx1c8z0dNLEv7qkuHddPeAyCPopzxnK9i/APu8/bjT2lVDN2Klzy', NULL, 'user', 6, 'active', NULL, NULL, NULL, '9GeEUGGam0ex3bzqZwt5oUAVddqCTirsio2jm3L3dGCvpXOn8WQOedEOesva', '2015-11-27 03:04:44', '2016-02-05 01:00:24'),
(108, '108', NULL, '$2y$10$plqKHEOrZ4/iJUJpvC861esQVhKzf6SlNrKB8d3uNWqKgSgJDl16y', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:44', '2015-11-27 03:04:44'),
(109, '109', NULL, '$2y$10$8CG2ZzvqDsf2uFQag9oNG..sDgGbLTcTi6ow9C/2o4cFN03E6A05O', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'AMRigfUPgaXVnexdqYrjRAvhjEZ0UjTeo9K4J9DPUUBnxBAVFJwxagUZK6ve', '2015-11-27 03:04:44', '2016-02-05 01:00:38'),
(110, '110', NULL, '$2y$10$ndh8gV/yIBO9iekKI3ssKulEDUZJfcn5aEOr9VlVwJpzvFWzi0wxW', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:44', '2015-11-27 03:04:44'),
(111, '111', NULL, '$2y$10$jKcSywMc7hBV.gTNjjwzXOKnEnR31oM125KmIVZwZVv85kbLmzxOG', NULL, 'user', 1, 'active', NULL, NULL, NULL, 'rmL3nfDbtSzynMBAQ9PS3QQT9nS6eqGPSt6OZ9tqn44QL5mWG0PKCqzFJrG8', '2015-11-27 03:04:45', '2016-02-05 00:53:51'),
(112, '112', NULL, '$2y$10$VDMp7D.4kPhydSnzDHXUIeOq8QdAJKHyGbtlpZd6IpmsX/rt2xJQy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:45', '2015-11-27 03:04:45');
INSERT INTO `hris_users` (`id`, `username`, `email`, `password`, `signature`, `type`, `department_id`, `status`, `last_login`, `last_logout`, `ip_address`, `remember_token`, `created_at`, `updated_at`) VALUES
(113, '113', NULL, '$2y$10$ySl31q1nOvR4DXvVvAs8QOUEuVi.chz9lnfe8zwEiDjMy0r2JbuIa', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414830414141424543415941414143733954704141414161396b6c45515652346e4f316465565254562f362f655273764c7773764953516843534745414248436a38574153674246714969696f6b4e7858396f425730576f646c7031314f4e767248576b557855394c70327062616b366a6a2b5863634768566b644c585971434b4656455a464e423973676149475239767a3947484b73677139555a2b4a787a442b666b667539396e33732f37323766652b2b44526c4555474d62514176533643517a6a3138657736454d51773649505151794c506751784c506f51784c446f517844446f6739424449732b424445732b684445734f6844454830575053556c52633768634e5a724e4a714a43785973514634467154634a58332f394e66766777595034362b59786d4f697a614f6e7036524d4e42734e373565586c7a6a4b5a37426f416f4f6b5638486f6a4d4733614e4756425163454b50702b66652b725571572b4f48446c69664e326342674e3946723239765631415552534a34376a5a31746232705a5777614e4569615635656e70444e5a70745a4c465a52576c7061612f2b702f7271496a4979453675727145717571717562563164574e477a466978445541774d2b766b354e436f56433675626c5a762f7675753649425a555252564a2b4354435a4c516c473055537757622b677166732b655064434b4653766b303664506e2b5867344c43504949697a4c425972666353494552767533627448395056357279736b4a79664c534a4b737064466f464931476f78514b5263723036644f683138456c4b536b4a487a392b6644684a6b67636c45736e584b536b70386f486b312b63454d41777642674455777a433876717634714b696f57574b782b4b42594c4c3646595a674a5152414b686d474b4a456d745771316558464e546737317551587354516b4e446c364d6f7170664c3564635a444561746a59314e4c6b6d532b4f76674d6d72557141434251484142525645396a75504e2f76372b71395054302f766467506f386b624e594c4e4354762f447a63516b4a4351473362392f2b754b367562705a4f70354e794f4a784c4970466f753151712f567437657a7679344d474444324a6959734a4c536b726536416e677558506e79494b4367736b49677454342b666e747064466f355161446757687161767256655965466865474e6a59337661625861454949676973786d4d315a64586130704b79736a2b35766e6f437a5a43676f4b6b496949694e455a47526b66563164586533433533477942514c425670564a743272703136386135632b6475564b6c55783575626d3932717136735862746d79525467597a333156794d6a49554f68304f6a6d6454713971625732396f7466726a514141382b766749704649334f727136714c5a62486152517146496f64466f4852414534547164447574766e6f507935693566766c7855566c6132347637392b31463850762b75537158614e47584b6c42385345684c61415141674a69616d51537156376c6939656e56345731756258306c4a69515141554445597a333456794d7a4d56464955785a624c355663794d6a4b73466f766c7453335a717175726f3972613270684b70664b3732624e6e702b586d3575366730576857444f753335674e763656392b2b535657586c342b71364b6959684a42454139645856313366504c4a4a3939314374364a2b506a343230354f54746630656a322f75727061464273622b305936686f34644f7762563164564a4c52594c6f5651716278674d426779384a69665777594d48326666753359764163667778683850353666723136315962477875496f6968674e76652f34786c775955776d6b36792b766a3442414742326433662f57694b522f433067494d44616c53324877386c746132746a566c645853334e7a6339394930652f65765975595443593769714951507039662f75546e31384b31734c4251716456713553694b337666323976363575626b5a596a41595271765669746655315053376c78357759536f724b333371362b736c646e5a323138526938624544427735302b7772533666514773396b4d4e5459324d6b744c533939493061396375594c706444713231577146664831394f2f304b58623745727871466859564b4749594a4c7064626c4a5355564f486f3641695a54435a6f6f487747504b626e35755a3632746a59644241456366623438654d5058325a625531506a6a3247596b55366e50366252614b2b6c496e75433257794739486f3962724659494c6c632f686a38736f4a2f31636c635957476878477131496771466f6b4368554a6746416f476b74625756535a4a6b67352b665830742f38783251364656565656424a53596b5069714a4e4b70587134637473762f72714b374b3074485153535a4c6c506a342b74382b65506674615a735050592f333639657a3039485370775743414e42704e363953705530462b666a376531745a6d3362647658797558793255334e6a5a3232704c37397532444b696f716f4a4b53457279676f41446a63446a57704b536b6b736a497945457454315a57466c5a525565466f4e7073525230664868774141304e4c5334675a426b4a5769714b714b696f7258492f71705536636b4451304e4d6f716957747a633342362b7a506271316173684c533074516b644878794e6a783434744763687a42784f5a6d5a6e6a486a392b2f46757a32517a64766e323771726934754961694b43554d7739597a5a38354d776e476344634d776a36496f35507a35383074496b6f5430656a3275302b6c497256624c31656c30786a2f2b38592b2f6934794d7242704d58746e5a3257794b6f6b525771395836384f4844687741415546525535416244634165627a5836776375584b6a76376d33576652535a49454c533074566c746257384e50502f30303157517953656c3065725a4b706571323048506e7a7556657633353949595a68725777322b2f4b614e5776712b6b7434734646595744696d6f6145686845616a495464763373534d527550547456426a59324d4b5256484161725643567173565a475a6d726f63677945716a3051414d773059596871304167505a486a78354a414143444b767178593864496f394849786e4863484245525562566b79524b73764c7a6345774451595774725739356a426939426e3055664e576f556375584b4657743465446a39776f554c5977774741783461476e6f34494344676356663265586c355545314e7a63534b696f6f67426f4e524e486e7935423848516e6977455259576475727533627463464557787973704b535856317464787174556f674344494441436f73466775626f69672b686d464e45415256454152686847485953704c6b597761443059726a2b4d4f596d4a683767383272704b51454d78674d4f4a504a37466978596b5844652b2b394a7977744c5858444d4b7a6c726266654774434753353946787a434d695341496a714a6f4f4971694372465958485471314b6c7675724d2f66767734393836644f315030656a302f4f4467345a66506d7a586348516e697738653233333134444146774441494435382b65546c5a57566b2b376375664d35693857713262567256324a7963764b55374f7a734a4263586c354e577133557a6e382f76594c505a31754467344361434949774a43516d765a473469466f73786e55364836665836566769434f6e51366e524c444d42364477536958792b583342354a336e3055764b79757a4d356c4d6545354f7a6d6974566d754e6a497a633035337462332f37573669777344445159724745454154523849632f2f4b46623232637859634945646c31646e6458427763456145684b4375627537743836594d654f56542f774f48446a51784f507848757030757662323976613639766232613438655051716b4b4171785743785a42515546763970634a43676f434b75747263567261327462746d2f66447057576c72705a4c4261757662333979666e7a3577396f69377050612b555a4d325a676a59324e5849504267425156465145555256736550333538746a743776563476616d31742f56315455784d2f4e445430327a466a7876513434357731617861377672352b6b55366e6936327271347535662f2f2b2b78637558464430686564415546396644786d4e526b53763132504e7a633163426f4d78306d51794965486834543332554665755849475954436178624e6d7941532b46487a3136684a744d4a707a48347a55314e6a5953392b2f66393954723963794a45796465486d6a6566534b586c3565484e5463336b31617246514941414163486878795a544e626c704f4c6464392f46477873625639322b665474494b705865374f6a6f2b4574502b59385a4d77626e6344684c63334e7a4e36496f696a783639416a6376486e54694f4d34612f6675335776377772572f6f4e466f674b496f534341516d433964757351316d557875646e5a326a7939647574536a364a6d5a6d535246556247566c5a55355833333131633234754c682b2b794c71367570776b386d456955536931754c6959694764546c653274376433714653717a50376d32596b2b746653536b684b6b706155467036682f58572b6d302b6b50497949695875687134754c69454c3165762b444848333963774f46774b747a643354656550332f2b705a4f50754c6734794771314c72683036644971697149516f39454954435954514647303363584670624a5070526f41374f33746a5459324e75334f7a73374935637558655a57566c517178574a7a6a35756232306c4e437533627467724b7a732b4d73466b764b3965765850776341534166436f376132466a4d59444c6944673050467a7a2f2f4c477876622f65515371552f2f2f6e506678377779716666726c41596873324e6a593346456f6e6b4264484e5a76506f48332f3863595846597346476a687a3578646d7a5a394e367973396b4d716e71362b7558744c57315064306e686d485948426b5a2b6532614e57752b37532f50766b4b6a306253534a4e6e533374374f39764c79696d68746257556a434a4c6c362b76375574466257317556467939652f4d32544a5638726a755039586b6344414942577138554e4267504f3458416556465a5738686f62472f6b3848752b4855614e47446479543261646a4e674351414942304141444635584a4c6f364b6977702b3353556c4a596676342b5077464145434e476a587154472f796a592b5078344f4467303844414b6a4f674343494a53676f614d4f785938642b31644d7157375a736b63766c386e2f792b5879546934734c52616654323852693861535870636e4d7a4d544559764547414943465271507075467a75306f4879385058316a534a4a736a596b4a4f536f7437663361527a484c534e476a4967616a444c3257335237652f757a31363564347a31764d326e5370496b49676c6741414d3043676343744e2f6e47784d523843414367624778734b4152424b42714e5a6c416f46482b3565504569743773306b5a475248366c5571724f7071616d4b7752543977494544504c4659664c547a35584e7a632f7470376471317970656c5561765650674b425150736b54534f4759544d47796d505a736d552b4970486f526963506d55795746524d543036763666435769777a427338505430335052386645314e4459516753443445515a5372712b76367a7a2f2f764d64576d7069594f4a37425944786973566955683463485252414578655679632f667332644f743448506e7a703345342f484b6144536169534349486533743753383973426766487838676b5569535076333055306c50664e617357594d374f546e7452464855517150524b49464173505063755850646c7550713161744d41454257707a6751424c574e48446e7938355355464f6c4168456c4c532b506132646e39485142417754427345597646473950543077666c664747666a506c3850704e476f3531434545513365664c6b42632f487a356b7a35304d5968765832397661586c79316239744c5751564555324c4e6e44384c68634862434d477a7938764b6946416f465261505271506a342b4f6a75307379634f56507534754b53516150524c414141697356696e59324f6a7535577a4b79734c43615078797447454552506b7553487a73374f53452b38676f4f446c7849453063786b4d7255544a6b7959313533646f306550634639663331514167416d4349417143494f714a5341616c55766e5a746d33626d50305252613157782b3764753966447863566c445949676256777574324456716c576a42304e776975726a7763686475335a684c42594c673248594f486e79354b66486e566176586f3348784d51734f48667558434b475952314251554837624731746533526b5542516c59544b5a5369365869366a56616c42625777746358467779395872392b613773563635634364585531437838384f42426f454b684b42454b6856557744485031656a32337532656b70716247364851366f646c73787075626d356c6c5a5755396c726d6c70515779577130516a7550336e4a3264752b51434141427a3573795a576c4a534d6f484e5a6a6445525556397a32617a5777454177474b78594330744c5837486a78396e392f53735a37466777514c65374e6d7a312b586e352b2f63746d33624b715653795942684746697431673457697a566f647762364a50714e477a666347417947314751795764505430357341414341314e5657576e70362b382f7676763939615831387656616c556155776d382f382b2f665454486a316f42773865644e507239536f326d77317533626f466a45616a455547516e59364f6a753164325173454174474e477a655357437857433045516130306d557757547957524c706449754b2f666b795a50436b796450766d3077474167412f745772576130766e2f7875334c68527074507049702b6b61584632647535795479456c4a55565958563039766257315652676348507a5a7a5a73337a3753317454333165356a4e5a6d564451304f7652562b3362743345724b797351386550482f38595152422b534568495447317437544b4477594333744c516f642b37634f54556c4a61582f422b4f6552562b36425138506a336c4d4a724d5a414b444663647a76364e476a536f6c456b6f456769413748636231476f306d6650486c79723861796749414155694b5248454a52314f4c74375531684745624a35664b7a483337346f6179374e434b5261436345515a52494a4471775a7330616e722b2f2f774562477875396b3550546771797372426647396143676f4b6d3274726156344e2b72676e554167473748785173584c69427174546f4f68754532414144465a724e7662647532375956685371315749784b4a35434d45515a72743765323143516b4a6968456a52715343663833654b527a484c5169436d454a4451372f6f715234534578504a6d4a69594433456372305151784141416f4e52714e665842427839307a6d394b63527733324e6e5a465938644f316239713362764a303663775056367657746257787354414141364f6a71676a49774d53584e7a73384a734e6a4d46416b474e57437a6536653775337174547268774f4a377136756e71535171456f3866507a4f3064526c4e466f4e4637754c76337332624f6a576c74626f2b6830656e6c51554e4442364f6a6f42693658653846674d4f433274726165743237642b73574a3153564c6c6f69616d70726530656c30664b46512b4c41336e466173574545574668596d6f69694b323976627435744d4a744768513466557a39754e474445697171717136754d6e3555374a794d6a41745670744f414141676d48343863534a4539666132746f575a57566c785378637548444769524d6e58716a6e7935637651327658726c57645033392b78356b7a5a7a3775364f67516d63316d7a4d6247426751454249444c6c7938447139567135484134487a73344f4f7876616d7153645852302f4f2f6d7a5a734866444b333132375938764a79444545514c6b565230424e5870566b6f46503773346546784d69737261356c57712b586e354f5241687738663770587a344e4b6c53374d7844414d774448397835383464467a716437756671366c71796550486946346146525973574b584e79636a356f61327354425155463756456f464666382f6632746a78382f2f706e465972586f644c72786877346432684566482f3930574c68382b664b696b704b53634a6c4d6c734e6b4d744e72616d6f323973544a77634668365a3037643552537166546b324c466a732f627633372b707071596d5973574b46656543676f49656e7a6878516c4a66587a38764b79747250675242584b4651654577696b66794e7757444d4b537773464149414141524235563565586c2f64753366502f7637392b3074506e7a3639716279383348767633723370376533744e5169435142774f78364f79736a4b306f714969704c6132566f6d694b444a71314b686a392b37646d7744444d44736e4a77666b352b634452306648663267306d69763139665631426f4e68394f3362743863334e4452735a62505a6e79556b4a505237543733586f6d646e5a324d6d6b346b5041414145515669646e4a786146793161314a43646e5a30696b386e555a57566c6f3856693864684e6d7a6164583774326262666571355355464f62313639646a7a47617a47734f7743677a44736d2f64757655576b386c7338666232726e6e65506a342b6e6c6c555650533738764c79514a6c4d646b6367454b5273327253704651414142414a42565831392f61584b79737277774d44414b4144416c366d7071635435382b636e466863584c3245796d57592b6e2f394652555646427741416f4368716c636c6b58664a61756e5470684a79636e506b455154524970644b6a6e7036655037425972492b315775326b744c53306c757a73374b617171716f41725661724d68674d504b56532b62326a6f2b4e6e666e352b4661644f6e5a70757356675141414477396658642f636b6e6e7a792b632b664f5879694b6b68595846382f497a73352b33324b7852424d45305747785749444a5a434a704e4272585a444b524841366e334d6e4a61537544775441614449596f6938554338764c7941497646756a7471314b677666487838476f714b696d34616a6361396d5a6d5a2f317457566a5a6e7834346433507a382f4d30346a742f5a746d3162337a313076523048596d4e6a7057357562706342414a52554b69335973474544535645556949794d6844773950576578574b78475731766273696c5470764337792b505571564e4551454241456f66444b595a6832434955436b2b76574c474344774434696350685049694c69357677664a726f364f6859426f4e524c78514b48775147426b35394e6d3778347357497036666e596761446f624f7a73387666766e3137394f6a526f7a65544a4a6b48773742424a704d64574c68776f5a416769466741414f5873374c7a3579792b2f664f454f324c4a6c793153757271356e554254564b78534b66564f6d544f484f6d444544557176566d2b6c307567484473506f6e39396b4d62446137306466583934757773444456337231374d5269475254694f367741416c4677757a33766e6e58656b46455742764c77384b43516b78454f6a30657a6c63446861476f314764643772597a4b5a4a6d646e3531782f662f2b64343865506a34714c692b4f4b78654c446e637451444d4d6170302b662f763757725675664c766b574c5672453132673079336b3858714f4e6a59334f3174623277726878343934504441785552555646435938634f644c7279355739466e334d6d444568416f486745514341636e5230764a69666e77383949347a49776348684e414441456873622b344a776e5748426767585242454555306d67306969414962585230394e53725636386955716e3049494967656a63337430334a79636c50437a70743272545258433433433047514e716c55756d4871314b6b767248766e7a4a6b6a467767452f345167794d546e382f4f59544759746a55617a714e58716f33352b666e377036656d516a343950454a504a4e416745676b4f686f61472f38434a2b394e4648764b43676f4c305968756d45516d482b68416b542f44726a35733262702f447a3839766834654752352b72716d7174514b464a6c4d746d3857624e6d506230313675546b4a455551784d546c63683945524553382b2f3737372f39696f7069516b4b4467385869786644352f3961524a6b7a344c4467376572464b706b745271646444697859746c68773866786e4563687a414d6577442b4e646d302b507637623932795a63734c3373376c7935667a2f503339462f50352f4749496767784d4a7250557873626d4a36465165507144447a34594e2b6969733169734253694b476741414649376a5a352b4e323735394f2b62713672726178735a47372b76726d394a562b76486a78342b7a743766504251425952434a5273567174546b704c53324e534641584377734c434951677945515252484234656e76544e4e392f775a7379594d56346b45703147454551766b556a2b47526759324b577a352b7256713068776350416b486f3958436743672b487a2b497838666e36317a353837396e35557256794955525948526f30664c374f7a734b6f564334595741674142525a3972662f2f3733504263586c7851326d36306c535649376375544965576c7061552b644e3774333734626d7a3538764477734c473666526145496949694b5545524552762b677066487838434a564b74564f6a305353393939353758586f52555254464e526f4e3738695249354a7432375a4a6c69785a51693561744f68706f33467863594745517546316b6953624651724646334678636432366c706375585571713165705a546b354f6637657a73367348414642304f743077632b624d627031492f5259644150412b2b50665335353964744c6a784a456d57636a69633348587231736d656a5a7332625671515143413469324759525351533352677a5a737938354f546b7078573063654e4770717572363939704e4a7146772b47554f6a6b35486554786546645246473054695553355155464234556550487533576b375a373932366d7036646e6a4c6533393263616a576242756e5872667246736448467845664a347648794a524649594668626d466838664c776b504435386c6c557054365853366c69544a3270456a523636665033382b3264763665445973584c68516e705355314f3277317073514668593279392f6666336c4d54497a62716c5772587470564a79596d4d6b4e43516e7955537555694c792b767a377939765666487873623265672b693136523450463563702b6745515a7839506e37506e6a31634f7032656753424973314b7033445237396d7a70357332622b52714e5a705a4d4a6b7448454552507039507a6f364b695a71316375664958336652662f2f7058615062733255454b68654b456a59324e447364786734324e6a556b716c5634644f584a6b39494544423372304f6139657652726275584f6e61502f2b2f53384d41524d6d544f444b35664c544245473069555369564c4659664a6a4c35643669302b6c3657317662526738506a773376767674756a33373556786e3237392f502f4e4f662f74536e6c32374a6b695834317131624a65664f6e654e6575484268384d6630795a4d6e4a33574b3775586c315755583775586c7452474759514f4f3432574f6a6f373758467863556a6b637a693063782f556b535459716c636f4636656e70374b3753486a7432444a73356336626133643139485966444f65336f364c677a4e445230596d4a69346f413347524954457a474e52724f597a575a72635278767733486351704a6b6f31777576366857717a2b614f48486961785838317736394e70777a5a383661547446564b745737336278354b6763486833515552536b366e573467434d4c3078474e3256616c5566765444447a2f30754147785a3838656e71656e352b6a593246685a636e4c796f4833754979596d52754c68346246424c425a6646497646687a7738504436634e6d33612b482f3834782f3936744c2f6b774f4e6f6e72336e78312b383576667244392b2f50674741414241454753757957543657316432623733313172694844782b2b6f3966724136785761776442454a65555375565a46786558537a7432374869744878703635353133524a57566c5235634c72646d79705170392b664f6e64756c6a2f2b2f486231327a6a79357a514541414d42734e6e66722b462b3865504756334e7a63716d765872716e4e5a724d784d444477576e4a793868767841594c55314e51714d4d673355663454305776526d3571616e6d326c3366727333333737626650626237396442414159324765766876484b30477652323972616a414141674b4b6f6d63766c4e72773653734e3431656a314c7075397654304341414149677253377537752f4d62644f68394633394c716c6f79686177754677376b4d5131464a6358507a4733446f6452742f5261394635504e345654302f504642524667624f7a38332f4d357a364838534a3676575162786e3850337369502f517a6a31574a59394347495964474849495a4648344959466e3049596c6a304959686830596367686b55666768675766516869575051686950384842326335716370785a346b41414141415355564f524b35435949493d, 'user', 1, 'active', NULL, NULL, NULL, 'itXu51cvcClnw12K0sI4sKZo6Vfv2wKcxBx9r99dfujMh6jRBJvqKaqO66ta', '2015-11-27 03:04:45', '2016-02-05 00:54:02'),
(114, '114', NULL, '$2y$10$oXmjCYn4ZrQMFW.unpgF0eodcZRn24e3Dl4PJW9B0NthjEGdf5U.m', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:45', '2015-11-27 03:04:45'),
(115, '115', NULL, '$2y$10$LiFZMwT9TEkOphZ9nCRY3u5uk3smtkGBtUdW335yNcdNUwAU7GUuy', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'cvFWqsgjkD662sD7S3hX7hj9XZLHBX2bpaIIsvXKtHn4nVFG4HWfCiLEzMuw', '2015-11-27 03:04:46', '2016-02-05 00:51:42'),
(116, '116', NULL, '$2y$10$SNjNeZylZ0gkagXiBPKGx.ntxjGpXyCYSAcHVJqzT9y7Ons111reS', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e53556845556741414148304141414245434159414141437339547041414141504e306c45515652346e4f32646532786356583748662b6435483350766e54737a6e73476539347866457a7478484e75316a474e736b3963474b3449497053674b4b556c35524b5641556c59555555533251516968464646594c51697859597653585a7175454b49493053524e6b7a524c4559584364724d426b69554b58706f346b4e694f53527837624d2f316e503552547a513273654d5a6a7a30457a30663653626e6e6e764d377633752b35334850765864694a49534141764d4c6e4f3841437377394264486e4951585235794546306563684264486e49546b525052714e65743175643230756642575966584969656c645831377034505037587566425659506168755841794f6a70614477446e632b4772774f79546b35464f4b5456734e74764a585067714d50766b5250526b4d756c464343567a3461764137444e6a30615052614c466c5751747a45557942755748476f7666303944514a49565141474d70425041586d67426d4c506a49793869646a2f79794966703251697a563949514441304e42515166547268426d4a66767674743950523064457167494c6f31784d7a327165664f484769434143696c464c676e412f6d4b4b59437338794d524f2f71366d727765723134634841515042375074376b4b717344734d7150706657526b354d627a35382f2f764c65333930797541696f772b38784939475179325567702f5141414367396d72694f79467632787878366a6c6d5531476f6278555334444b6a44375a43333671362b2b576f73517572526a7834347663686c514f6d7657724b4768554b686f74767a50563749576658427773426c6a2f46463565666d73546532484478392b3574793563776476756557576e4c774e4c50442f5a4e32596c6d57314d6362657932557736625330744e43686f6146314747507a3838382f707742677a565a643834327352336f796d61796a6c48343856523658792b58564e4f336562507a33395051554a35504a6f424469374f72567130657969374c413163684b3946416f3545306d6b35364f6a6f376670744b7539714f4a65447a2b314f446734457542514343636152316e7a7079704151424d43506e306c5664654b65774f636b6857302f756c533565714b4b566637746d7a5a78414167424453632f6273325441412f4436567036536b4a4a5a494a445a53536e6c336433634d41503659535232575a6455414147434d443259545934484a7957716b6a34794d31474b4d663563364a6f5438527a77655835366535384b4643303879786e346c685067494953526e48426a476c5143514e45337a4e396e4557465255564b46703273476d707162435465414573684c64737178365173676e7157504f2b65466b4d726b7164577933327a73737931726c644471665167683949637479634c712b48513548725745596d34654868344d59342f4f6c7061562f7a436247793563762f376c6c5765654c6934734c53384e456842415a325a5974577a4168354b537536363270744f727161674d6831466463584c7a4f342f463045454b2b5668546c455345455949782f59526a476f31503562473174356171715071596f796f63414d437a4c386f654b6f727a434f58386e302f6853786867374c456e53786d7a4c2f35417434366c762f2f37396667416f4b696b7075624a2b662f727070356363447366666650504e4e32384177496773797a38764b79763765774141535a4c4f444138506c774d41714b71365270626c627939637550436671624b7857457a72374f783833624b735273625950324f4d63534b524f4551494b55736d6b7a7a627a6d785a6c704d5163696e62386a396f4d75306c6d715a745949776475647135574378574734764667684e47334e327171723674362f7036414967545172364b78574a4f49515145673047564d58615945484c5336585247685242414b6633414e4d313743534864434b4542763938667a4454475543696b456b4c3662726a68687568303874665831334e4b3665704669785a355a6d743065547765586c6c5a696564694a49664434616a543656773132666d4d48557153744575573561656d6d3938776a485941364d635944786947385341683542504f2b633863446b634c592b7749592b78594a424b353074674130466c565664584a4744736d53644942575a5a2f6571303671717171754745597a37533074484168424e5456315255545172727676504e4f4e543266332b3833416f47414f72473871717150414d416f706652304a424a785a744965757136766a55616a2f6d74304b6f4d78646b7a5839622b634339455a592b394b6b72517a4a364b765872306155306f2f4d30317a7858544c2b48772b4a79486b4b3776642f716751416a524e6138455939774c417143524a2b37316537376a526944452b69524153706d6e6534664634476846432f6249735033505050666677796572776572334e434b4776323972615a43454578474b786851696872336276336e316c5a4733627467307a7867374b737679544366457452416a313637712b41514336416142357574656d616472644144434b4d54356e6d6d625431664b455169465a6b7153394143444334584364335735666f61727170494c4d3146525633594178376736465173553545623238764e7950454c6f596a55597a476730544c524b4a65463075563833567a6e6b386e675a4e307a616b6a68304f7877714d38546c437947644f70334e56523063486e566947632f3572525647757a41674173416f415471626e6354716464514351344a7866575a7257726c324c4b61587663383566466b4941592b7959706d6b72567135636953564a38693966767677376461584d62726666685241614d45317a6736496f7578686a7230334d4577674556456d533367414151536b393364625752696d6c52774867772f5238627265373057617a505875564f707274647676546472763972364c52364b51697069776344706352516e703158623972716e775a695457326e723833573731304d6f74476f31354a6b6c35444341307a7867353676643657314c6d79736a496e78766969312b75746d6b70307a766c755464506552776a3162392b2b6e516f687744434d757a4447585973584c7a614645494151656f7351386f696d61632b6d366f70476f385a5678466944454272516466316549515334584b353278746766627237353569737a69397674316a6a6e657a48476e546162376465633839667364767379414244706f693963754e43676c42346e6848536e313648722b714d496f51484732483954537276475a704f4b7964716f75727161553071504d4d5a2b75587a3538696e7648544a712f457a5838317862635846786a53524a62794b4534707a7a336375574c5a4e6c5758364a6337352f3345564e454e337239555978786e3268554369474d54376e63726e612f58352f474346303054544e6a576e6c336d534d665955514f71636f7974324d7355386b53586f353362664c355671424d65367a322b3050707449696b5967484954545130744c6946454a4163334f7a7968683742324e384c424b4a42426c6a683230323232624f2b563648773347555576714839657658343972615773773566316c526c4f4d593434464149464257576c7071794c4c384f6b4c6f6f747674376c692f666a317562322b58465556356e5244795079556c4a642f7068475061504d73594f3135625733764e5754696a527165556e6a4a4e737a31666f7163316643756c394a53694b487378786863644473653470514a6a76414941546a332f2f504e59434147794c442f434f5839624341474b6f6a78464b543147434f6d554a4f6e74435a336c5451415974746c737138627157596751366e65355844456842437859734b4359454e4c464f662f4a317131623859537958314e4b6d345042594868735233493848413737467978595947434d65304f6855437443714e2f6e3839556968433736664c3659322b3165697a4875633776644e59797839777a443244416d377647696f714b476450396c5a5755617066536f71717176624e713061567a645471667a566f7878763976746270784f2b3032376f66312b6677584775506532323236543879323645414938486b384e516d694155747135655048696362322f6f714b694347506356315255564e5859324d6770706363305462747237446f3869714b385937505a646c5a57566f3472687a462b585a626c63534e62566458584343476679624b386d564a366c464c36316f3033336a6875725739716170495251743247595479474d6636614d586251352f4d466852446764727562434347646d71593949556e534f3049496b4352704e3250734641414d4b4971795a61786a2f6c54583951474d38646432752f32715730323733563646454f70314f42793370744c4334624366454e4974792f4b3064776254626d52565662664f35416c5a727330307a525a437945564655546f5652586c36346e6e4f2b573747324165534a4f326c6c4a364d52434c6174587a61624c5a696c3873314c742f596450734749655169352f7a64696f714b372f68784f427a744143415151714f71716a367a614e47694b7a734e41466858584677386f4f743672365a703634515145417146764a496b50574f613574713036316c42434f6d7a32577854376f78555664314b4b5432326264733276476e544a737759653075537044637a616274705a2b536376364f7136745a386935307978746765307a523368554b684e526a6a58702f504e323474433456434873373545566d5744376a6437724b5a314c563036564c7338586963323764762f38344e556e6c354f5a636b61532f4775462f54744c753362647332636470664e3362336671716d706d625362616351416f4c4234445858342f72366570555130716e722b6e705656652f41474a2f7a65723154506966495376516c53355a6f434b452b6e3838333664336a584a72663777385351766f724b6970714f7a73377361496f4a7a30655430632b59676b476778374732436554726166686344684d43446e7463446a75794657644e7074744b3250734b43476b79323633333531702b576c6c4d67796a6c564c61326444514d4365504561396c6e504f64757134665048546f554f704762532b6c39432f7946632b4f4854736d3363384c4961436b704d53356375584b6e4c56644f42774f416f44676e42396f6247796373753673525a636b6161636b53622f4974396843434669775949464a434f6d4e52714f7255326b756c327558595268353230724f74586b386e686f414544616262584d3235616631506e31306448515a59327876566d393063737a703036633353354a305a76763237662b57536b736d6b304d416b5055627565754a4631353441666631395431484b5956454972456b47782f58464c3230744e5176684b68777539315a666347535378352f2f4845384e4454305a35716d76625235382b597248306377786a51685246382b593573726e6e7a79795673426f43345143507764516d6a614836656b633033527a35382f333434782f7632585833365a392f383961746575585173525168564c6c697a356c2f523079374c6b52434c78672f396974724b796b6c2b2b66506c763758623738356375585872667371786f4e6e36754b667249794d69504d4d5948736e4765612f72372b2f2b556333356f33373539347a72673850427755416a78672f2f56374e6d7a5a2b394143486e71362b7466724b36752f6c38414b4e71795a557647793971556f6a63334e394e6b4d746d754b4d712f5a7831706a6d68766236656a6f364f334f35334f50656e707a7a33336e446f304e46526a474d5a2f35537532756143686f55474f782b50626e55376e7a6e3337396e31726d755949516f6a47342f474d76334f6373734158583378526d30776d61554e4477322b6e796a63584844392b764149412f42555646654d36344b3564752b6f415950432b2b2b34376b5a2f49356f59544a3036735a597a787572713666774141364f6e70305a4c4a354642746257336d762f795a36745a65555a516e4a456c365064396246434545794c4c3859303354446b784d647a71644f786c6a622b513776746b327a766c4268385078524f7259362f557567776d766a334f795a624d73363562767931624e73717766535a4c30626e70616132757230642f6676316e54744e3335696d737543496644775551693052794e527638706c52615078347349495a657a385465703641304e4455374c736d7138586d2f65312f5037373738665934794466722f2f302f54306b7964503369574536466d386550472f35697532756143377533756a5952692f2b666a6a6a37394d70535754795355496f64394e565735534a707343644633766f4a5165792f65304a6f51417439744e4353483936562f4856466458467a504776724c5a6246767948643863544f304833473733672b6c704e70747476797a4c4432626a62394b526e6b676b3269696c6558386741774377644f6c53475142344a424b3542414477384d4d50303636757270644852306650654479656638787a654c4e4b613275726c6b676b47674f4277425574486e726f4958566b5a4b544a5a724e6c74324f5a72446377786f356f6d70617a4e304d7a7355574c466c4643794c6e4b79736f6d49515234766437484d63626e707674642b2f56736a4c4571516b6a387852646676504c437875667a725357456e4872676751637966746b697843517658446f364f6c534d6358643565666e33706c455a593374644c74667a6755446745595451674e76747a737572314c6b326846414d414249744c53315943414774726132474c4d74484f6566662b58703252714a726d72614755746f566a55617a366b6d7a59586137665155414a4242433864536e542f50426d707161696842434130314e5451747675756d6d4d7276642f6937472b4c6a58367a567a4b6a716c39476c4e303336633777744f743761324e717a722b713252534f52374d2f764d6c58484f3979434575676b6846796d6c6e7a6b636a71715a2b4d763742525873326c5a61576870454344316e6d75626d6a52733354766e4a3158514d435648345736767a6a634c665a5a754846455366687852456e346355524a2b4846455366687852456e346355524a2b482f423954716d492b775a756d324141414141424a52553545726b4a6767673d3d, 'user', 8, 'active', NULL, NULL, NULL, 'CZCkI4rgzmiKLnOP7l1isSedF0aprgABBqPZZPTTJFFGuO4b6BF4ShXZSoj3', '2015-11-27 03:04:46', '2016-02-02 12:14:37'),
(117, '117', NULL, '$2y$10$criRJfVW5hw.3sMI5s8Ko.OLO5chLEZl4X2GoNuJDYSazoGPya.p6', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:46', '2015-11-27 03:04:46'),
(118, '118', NULL, '$2y$10$Ebrr1VOXMzb2uPZCy2Z8Y.ZpADwi2qwuX//fknasMDcVxw2cMd4ai', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:46', '2015-11-27 03:04:46'),
(119, '119', NULL, '$2y$10$cC/KqddhRIUDXCT43329y.hqkgc6oT/RYd4mOXfJD5rsBk5i7FEt6', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:46', '2015-11-27 03:04:46'),
(120, '120', NULL, '$2y$10$FPh6zRIjkHcL0MEakKdBb.OciCo78B.qGOWVOxEFraXA4r7mp04AS', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'CtXhI3K9L5ezKSLvnINXleO6QoelvTgPBarO49hWvyF0E3mAGYOI6gDzsi6o', '2015-11-27 03:04:47', '2016-01-14 01:40:48'),
(121, '121', NULL, '$2y$10$uSYNbpHiL8c9sFe658/.kuRpSg0SrH2uZCWYbscIuZPm3Bg9tSJHq', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:47', '2015-11-27 03:04:47'),
(122, '122', NULL, '$2y$10$BKb48uTgtVMitTbm8N2Jh.HZoFE15VYZchsjLBSe5i.ReQC7AYKHe', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'to38CYhsNmESWNGcNGg07ZXJ58jKzBUpc1EokYHSqozDeAtUlGWpRm8NBzxk', '2015-11-27 03:04:47', '2016-01-12 02:26:01'),
(123, '123', NULL, '$2y$10$.7NyrP/hfUpL7Il7b4bDvOnzfbuCOiX8bwGh3G9cLsuKClZCRHRRK', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:47', '2015-11-27 03:04:47'),
(124, '124', NULL, '$2y$10$CxjElPfAdQR/QAt37iy37uRoHG0GZ9UTdwxuj3k995v4OxzFR00LS', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:47', '2015-11-27 03:04:47'),
(125, '125', NULL, '$2y$10$ZtzNRGEU/J3rKJDAZ0FOuu9bYQIxmqlNoGQyH8HYreSPQe1LHJo0i', NULL, 'user', 1, 'active', NULL, NULL, NULL, 'XV0TwCdHESHl7YgEneEC9Kg0NFlKE9tEFEkctIs4fd0whyKxHrPWfeZxlBBw', '2015-11-27 03:04:48', '2016-02-05 00:54:13'),
(126, '126', NULL, '$2y$10$TmsvBUSRrNg.TGhRY5n85uAYkxAdAEDKUi.nPnVgij4uvLdjc63Pi', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'SORFGYjy44fMfCT2qG8A97GP630zskPefnCdnmEbFTGPfcKO2uSEKwXpSSpE', '2015-11-27 03:04:48', '2016-02-04 13:53:19'),
(127, '127', NULL, '$2y$10$D3NePC7BKsdtqN4ma1ri7OvmmVSI4f4Mm66nmrk3LXJ7e62ISztjO', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'w4vXz81yNzzDaiMFSuFp5bO37erQZTDHxYq12ymxP5vD1SmcXibUkLOiOjDu', '2015-11-27 03:04:48', '2016-01-08 13:55:06'),
(128, '128', NULL, '$2y$10$WE1FaBW8m.jgi6OEPri1BO/W8IX/Iqd1nfiS1Yxw7mBi6JQUJ2OOe', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:48', '2015-11-27 03:04:48'),
(129, '129', NULL, '$2y$10$W9tLvHIwcZdWmlb8q9ehqeUwukTnflfCWFMqBAT8RGH63WhENQN7O', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:49', '2015-11-27 03:04:49'),
(130, '130', NULL, '$2y$10$0AWBnELEhZnqANMQftpG1eBtUSGt2oqpzTMiNMgnMLUbAivlCDzH6', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:49', '2015-11-27 03:04:49'),
(131, '131', NULL, '$2y$10$4iB6X9R6NifOeppjDO/Zl.GEA/wdL7Jkw2SZteXd6CpC2Z1oP5zxm', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'hBBtBgCxPMIrwiMvqhfXpd7R933SsWcMc0G9bFz02zHyO0YeXYD1QYlSd745', '2015-11-27 03:04:49', '2016-02-05 15:02:35'),
(132, '132', NULL, '$2y$10$nKPIC7mG580mJklQA8rMfeDDAjCYkYegyfjJ3Q0AYOAFfs0PSb5pq', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:49', '2015-11-27 03:04:49'),
(133, '133', NULL, '$2y$10$rNmz/NqhKQa4hUUdY8RkMOp0a1DrWZ0nPVYCZqxjAw3A/A2sxt/Rm', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:49', '2015-11-27 03:04:49'),
(134, '134', NULL, '$2y$10$1BG//UX3raOh6KcLZAc4..4HzEFp5z0bkZ2hsaQRsZYqZxyOLBdfO', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:50', '2015-11-27 03:04:50'),
(135, '135', NULL, '$2y$10$SJ6dpBtbtOdfHK5A3gaR6eYheLBdgajBGwsf.lagfmsDK37wCeAsa', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:50', '2015-11-27 03:04:50'),
(136, '136', NULL, '$2y$10$oTlo8XDwejN9MD9b5cpU8uKQ3ukZ4LxhsFP4km0uqrGT77jMELd4a', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:50', '2015-11-27 03:04:50'),
(137, '137', NULL, '$2y$10$yld9EOks0ZsiBghofhYVQeDJDLXBK0H92jqnGt2a7LkN98qKtHFYu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:50', '2015-11-27 03:04:50'),
(138, '138', NULL, '$2y$10$oTIxoFUHtZ6geCy6WDALNuX4cM2SVLnheV0hkehllH2ohAAvWBWL.', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:51', '2015-11-27 03:04:51'),
(139, '139', NULL, '$2y$10$nMIcG4LPNkHdeDa67BmQruDT890VcLVqxHGZs9gt1aZ6YdHrGxweG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:51', '2015-11-27 03:04:51'),
(140, '140', NULL, '$2y$10$eUbOxS23H.lh.7LEw1eY1OFDzNbkv8d5heCSWl7FuCSQhFM6pQROG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:51', '2015-11-27 03:04:51'),
(141, '141', NULL, '$2y$10$rMPjM6JDIsyH6TfMF.fzL.rqWbWoy5icJyYuO3uiisQlVnlSMvl2a', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:51', '2015-11-27 03:04:51'),
(142, '142', NULL, '$2y$10$WkjBKWPLfJQNxWWWvyUEGOOIwtEfGYi7i7ByHFenE26lyCAy3VKq6', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:51', '2015-11-27 03:04:51'),
(143, '143', NULL, '$2y$10$9BSbiWvXYZk.9bhboiLL/OLIYQkKUcaKoILsdq.cqaNUf0Vnmo/V.', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:52', '2015-11-27 03:04:52'),
(144, '144', NULL, '$2y$10$Qgq32Uc8pteDt7YTYuSu7OEaHZT3ULq7FvjrZyH/LS4QeJDR5cmhS', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'w1y2v7DxzG0ql2XstflAQYaHYWWVEBtLclnpUTDGP5oHhqUcPZ82IkL88zSN', '2015-11-27 03:04:52', '2016-01-15 02:17:58'),
(145, '145', NULL, '$2y$10$zBmT4/xO3ZWhijB1DJXzHulmc3izl5u1PnIi0bk/tyVndg3Wzk4ZW', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:52', '2015-11-27 03:04:52'),
(146, '146', NULL, '$2y$10$8vcpWKErJCEU442gWbY3vO6FofZ4Da4vo.VjGVhAZjMmOrswo3CwC', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:52', '2015-11-27 03:04:52'),
(147, '147', NULL, '$2y$10$bLnJ588xy5y647RY2IoF.OK5SrA4rBY3sI2Y8IN9a7dX.NXwrUd6a', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:52', '2015-11-27 03:04:52'),
(148, '148', NULL, '$2y$10$OSnjXpo5kbAuSZfn/ea1jucuPSCGIWlc8wE3kJIxpRBcNAtjcVh5C', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:53', '2015-11-27 03:04:53'),
(149, '149', NULL, '$2y$10$OGmO9.TCfMNMbp5xjt.tuOqOxs1QZSl7itau.sT6FicXXCoJs.bjC', NULL, 'user', 11, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:53', '2016-01-03 01:51:47'),
(150, '150', NULL, '$2y$10$5iGAFMSadJTihD9NWezXZOeRfhL6i18GIAfWimfuMUDSQRjfOHVx.', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:53', '2015-11-27 03:04:53'),
(151, '151', NULL, '$2y$10$duFK3RSknKGlKR91cHSPiuxmkNZx11qzc72O2Os3A7gQCp27wGJSC', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:53', '2015-11-27 03:04:53'),
(152, '152', NULL, '$2y$10$BDki6NeDK8VJBeB3BMnAlukmYARACZNZTFXlp9SeYBSHWNKTOAN/m', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'ui4ULuRMkFEH2NPlRSYqogc9i2ePwn6XRUMVh0BiPSmVNhed1v0fXR2F3wLb', '2015-11-27 03:04:54', '2016-02-05 01:01:09'),
(153, '153', NULL, '$2y$10$u6R.eGGEBWe6g8L1iCLZYOHNepFEd3PMRXzbKXC5jfpVq6oUvQRoq', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'sqBoDAEIKFB8GGELnY69OAQkzozDnFnYkz0MGGZB0v5FIp13e9HWXujqvy6V', '2015-11-27 03:04:54', '2016-02-05 00:51:58'),
(154, '154', NULL, '$2y$10$8Hd37GXTzDYBzYlGQxI2Iuo6djTQRJG9h85nWONAgIgUfeKcBR7bK', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:54', '2015-11-27 03:04:54'),
(155, '155', NULL, '$2y$10$ESBTh5mluNWKJ1wh5c2qb.fklrglqDcb6CIfDlYN1ehJUHn2VBRF2', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:54', '2015-11-27 03:04:54'),
(156, '156', NULL, '$2y$10$uSufrRc5pCFEby8wEQiveO/weIe9SWi393anw9pQjHpoWjA.BjF8y', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:54', '2015-11-27 03:04:54'),
(157, '157', NULL, '$2y$10$GjApzYRG9gg6msaGWevDdeq2WWycBQin7M15fM2C8Q4OWh02H6YxG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:55', '2015-11-27 03:04:55'),
(158, '158', NULL, '$2y$10$5EuHK/Zlza0aKSlDKoHYoumYIat5is2xHUPdD8esCSsWTyYps1buu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:55', '2015-11-27 03:04:55'),
(159, '159', NULL, '$2y$10$Wm8382G0CF6pRX0Hw9kKB.job9fcZUK.OUPNXgjKsBOP9vuktc9bu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:55', '2015-11-27 03:04:55'),
(160, '160', NULL, '$2y$10$JdOcvPG06jeP0IMYg6YCBOuuE8XoQtu90j53wm4gy/q7sUPT7/MpG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:55', '2015-11-27 03:04:55'),
(161, '161', NULL, '$2y$10$h0wtVutl8.aFUFIYsjmAheJ/QOLoQHDiJObmWxwtKS/PyukaJSua.', NULL, 'user', 1, 'active', NULL, NULL, NULL, 'CdUoj98AGmfAjgjRmqFAbi6ukYebaoE8BTgAw5VU6JCdiSoTICUpkks1LBx2', '2015-11-27 03:04:56', '2016-02-05 00:54:27'),
(162, '162', NULL, '$2y$10$ULPhcEiiuLsAJvpWtsyLTeBzejDhHv12rDJOvgkDYFfb.r72NUNOu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:56', '2015-11-27 03:04:56'),
(163, '163', NULL, '$2y$10$NKImHrDwQbCxWI0COU2GmePD2oEwf3DAfosIOWzNOCJCacDq6KH/.', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:56', '2015-11-27 03:04:56'),
(164, '164', NULL, '$2y$10$tVp3Nm5d0QYiWYAy6udis.1Qu9HbLdvi.G/GQm1u2hKtvs/dV4LDq', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:56', '2015-11-27 03:04:56');
INSERT INTO `hris_users` (`id`, `username`, `email`, `password`, `signature`, `type`, `department_id`, `status`, `last_login`, `last_logout`, `ip_address`, `remember_token`, `created_at`, `updated_at`) VALUES
(165, '165', NULL, '$2y$10$0jRh6IkbiaCdM/QekWwAweLnOZpxJ8N6hXVqsoEM7F27ntfJ6Sa8u', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414830414141424543415941414143733954704141414154636b6c45515652346e4f326365314354563937487a33504e6b7966334379486343586b494541494a45454a414c674745497142316b565663554c53724c6e55375861334b7150504f55746336376d566364396452702b322b70467533304a32745132326e74746257714c58317867705657327a5242616b696949614c584549757a2f502b49656b624c563471534c54684f2f5037672b45384a2b63386e334e2b353363757a344559686748543869334233693741744b5a6530394239554e5051665644543048315130394239554e5051665644543048315130394239554e50516656445430483151714c634c344730314e4454777a35382f4836485661712b48684954635345684973487537544939625067766459724867713165766671367472573331794d6849494d4d776470664c5a524f4c785630536961534c78574a3139506633582b377036656b7947417a586a555a6a56337036656964465564626f364f696e756d46417672626830746257687061576c68613374376476364f7672533652702b6b454e6e305a52314135426b4a4e684744734551514e4b70624c5262726366574c426777596e6c79356466554367557a696b702f43544a353641726c6370584c312b2b764e6a6c6368454141466f696b5453486834656237585937743757314e59444e5a73744a6b67796b61566f364d44416747786f61346f4e78504349455154534b6f674d734675744b514544417630306d307a75767666626131314e666f7838766e344a2b2b504268496a63337434326d61626c414947696e4b47714c52434a3535384342413333754e456550486b5750487a394f6e447433447633696979384950702f5031656c3038734842776543327472625131746257474a496b446433643357715072476b576933556a494344676b3543516b44327071616c647a63334e59727664666c3876346e4134774f6e5470325632752f32654154574759585275626d37487233373171374e7a353837747531653648794f666772356a7877375653792b3939422b6e30386d644e5774572b6637392b2b736535726b6a523436496a7830374a6d397161684b66506e31616a6943495371465162446c30364e41503071496f616b4d51784562544e413465596e626b63446a77423658424d4d7847303751314d44447741702f502f364b2f76372b7071717271516c4652305839314f7432506a6939384372704f7035747a377479357654524e6f3774333734367171717236466741415076726f49374b2b766c3739795365664244756454706c4d4a67754359546a6361725547583774324c52434349443643494154444d4c6a543653526f6d6f62423545313348795965754d4e6a77444273787a4273774f567957534d69496872392f50786550586273324e47482f55476667713758367775626d706f61614a72476b354b534e6e523164665778326579386a6f344f4451524263716654536268634c6854634836675478334762514343346757475964585230744b75767236394c715652324b68534b37377137753858743765304c2b7676374e517a4466412f4c333938664c4679344541774e44633375362b7362414141416d7162704579644f584c393639656f396536745371535269596d4c69543530366c516f4130413050443863504467344b506375496f756741535a4b4e6b5a4752763278736247782f3048767743656a373975336a2f2f4f662f34772b642b3563576d74723631616170676b4551657a6a414b5978444c50782b6677624f49376663446763313374376532386f4649714f304e445161794b52714b4f7a732f4e4b613275724e5330747a5a61596d476a4c79736f614e706c4d643041724c4377554477304e5a5837393964655641774d442b5861376e5151414142614c425169436141774f446e37316c56646565587675334c6d44503659654f336675355037746233385455685156617256616a6566506e30396947435a6e6147684944734f776b382f6e503976623237762f51666e384a4b48763362755858317462712f373232323831444d506b58726c794a5245414942736448655544443867496774676c45736b467539312b4a6a6b352b624f686f61477a4c533074566f50425945744e5452314f53556d782b66763732784d53457568484b6366363965754a3036645071793965764c6a49617257574467344f42674d4141417a44546f6c45386b564d544d79364930654f6e48725565723733336e766f61362b39706a707a3573777643594b3461544b5a64745857316a343432474d5935716d3364393535683575586c32634d445131645156465550597646616d4778575030414142634167484562686d46444d706e735377364863785541775044352f4c624e6d7a63486e7a6c7a426e36633554747a356779636e4a77634842635839364a594c4437744c68654c786570574b42542f382f4c4c4c77756e386e31354864696a32703439653452717458714f537158364234716934304a47555852494b7055324351534350646e5a325374554b7057367572706171746672667a47573171485261465a4f5a626b584c566f6b5669715661396c7339733278636a6f6b456f6b6c4e7a6333625272364f465a585638654e6a5930317863584662636478764156426b4e473765374a554b6d336963726c3773724b79566b524652576e5772466b6a506e587131423039756147684152654c785a38424142674f68334f7071716f71634b7272556c68597150667a382f76556f396633714653713674726157734c6e6f6466583135504a79636c70476f316d4335764e2f684c44734673656f46304367654379564372646b35756275304b6a3063537657624e47327454553945423358567863624278724e4b37773850427433716a62716c5772684a47526b57744a6b757747414441514249326f564b6f2f4c466d79684f747a304e3939393133555a44496c78736247627552774f436478484f2f33424d336a3861364a524b4a2f5a32566c6c57566e5a34632b444f533762667632376242436f666a664d5139784d7a633374384162646132707159477a73724c30666e352b6e7745415844414d6a796f556974323575626d50625a7a334f6d41503048423565586c30584678636c5551694f5541515249386e6141364830794d536966595a6a63626e307450544b597646676b37304e3266506e68314f454551334149416853624b31704b5445344b33367a356f314b384c66332f2f4157493933536158535063584678644b664a505333333334625430784d4c4a444a5a5074496b727a7147597a684f48354c4b425165305767304c36576d706b612f2b6561622b47542b646b314e445a79576c6c62475972463678364c352f31525856387539395336574c3138654b4a4649396b49513541494175435153796437484557393444585a6257787571312b744e4d706e7366517a44686a776a6271465165467974566d394f54457a552f2f3733762b66662f657a6375584d6a39487239537156537551634138506d396a4d666a4855684b53746f5345524578507a73374f334858726c3179693856797831425157566b4a4a79516b4c494e6865425343494564306450527a336e6f6e444d4f4170557558697633382f5062414d4f7741414c6a382f50774f6c4a57565255773539506a342b416f2b6e2f2b42305769637632376475676e314e6f7646676d7531326b793558503476484d647665597a544c5252462f536b784d544839355a6466466f2f3362464e5445786f58463164466b75536c7536646e447a4158535a493375567a754e31777539304253557449327056493558367656476d4a69596f78634c6e6575514343344441426775467a75415739435a7867477a4a382f6e78385546505171444d4f6a4141416d494344416b7065584e326e4233554d6c34764634423979394d444177384b324d6a417a4e6f38444f7a4d7a4d6c4d766c657a306963426558793730554852323973614367494869383534346650343466506e795958314a53516c455539516359686b634141417943494b4e436f62414a415044427659776b79534e436f62414e5264475238526f43515244394c4262726c7273425152446b696f6949324f707436417a44674c4b794d6935465564746847485a41454f51776d557954466d672b56434b39586c2f49352f4e6233432b4d78574a6456617656617a647332504441434e4e69736141354f546e476f4b436774334163372f55497a433672564b6f744d32664f4450644d2f3776662f5536715543684d4b536b70363856693856345552542f6e63446866636a696337397877534a4b385a44415935757a5973654f2b67633737373739504c6c32364e4477304e4e51345938614d4a525246375359497769495369566f784442735a793838464148424245445171466f76333565546b544f6e71325031737734594e596736483839565962362f6676486e7a684950586834624f4d417a497a38385044773850332b344f65694149636f6c456f732b7973374e4e625731745035677948547030434d33507a30384d445131396e63566966522b4a6b79523556616c556273764e7a56573530323762746f33516172557a59324a697470456b655135426b5046364a6f4f693649684d4a7673774d7a507a52337361747830376467786675335a747345776d3036656e70382b50693473724267436b73566773342f4c6c793538593447366a4b476f54414d4346596469744f58506d68453470644961355061626d3575616168454c6845586576773347385079516b5a4f65634f58504333656e4d5a6a4f71302b6c57456752787a51324d49496a75734c43773353615453574d326d2b396f4a4e485230633935756d4149676878634c7265624a4d6d5462445a375832526b354f743676583572526b5a47345a2f2f2f4766533279436d30676f4c432b4d78444c734a414742554b6c58316c454e3332377031363453526b5a45766b6952353251324b782b4f31364853366c532b38384949384a53576c416b58522f72476834475a77634c413549794d6a385737596267734b43746f4941474267474862495a4c495045784d54662f484d4d382b6f362b7672482b764b314e4e676257317473467775667838417745676b6b6e4e565656555462765154657269676f45415647426a346c7275586a76585172314155375159414d414b42344b766b354752546257337466636569685173583572766464304a4351706d33582f53545a68455245597368434849414146797256362f57547a532f435233352b66444444372f6474476c547055366e577967514345346743454950446736716e55366e444141415a444c5a787a4e6d7a446937644f6e532b78344a636a71646a58772b2f344c5436535175586271306f6253304e48676935666f70716232394862626237544d59686b4578444274324f427a584a357a705a4c58474a5575576145516930586641492f4243454752554a42496431327131693165735748486649436b314e62555552644568414941724a43526b68396c736e7454567436665638764c796a43694b39674941474971692f7270783438594a372f3150537348577231387644416f4b32677475543331476c45726c57304b683850545971684944772f436f534354364c436b70616637617457742f734d4c474d41776f4b79764435584c35362b43326d2b38334741796c336e3768336a617a32597a4c35664b3934505957384c577973724c777963683377686d382b6561626347526b354e59783441364b6f7261627a575a693161705630766a342b436f2b6e2f2f6c32486a45494167794b68614c5030314a53536e2b34782f2f2b494f415a4f4843686546436f664172634873642f4a75662f65786e3064352b38643630744c533041677a442b674541544678633350703742634a5444723234754267504341686f4151417777634842487978657650674f4e2f373838382f4c4e52724e4b6936582b39585952674b44494d696f5643723949434d6a492b654e4e39363434394241536b704b73627569675947422f313635637557346e75476e626b564652524553696551497544307a6171326f714a69306a61414a5a79415143456a33476e7041514d414c39307133624e6d79594c5661765a48443462534373546b2b6971496a2f76372b65374f7973744c6459376a5a6245616a6f714b325142446b51684445455255567462477973744a6e78766679386e4b6852714f70346e4b3572574f786b5373324e6e62465a50374768444e597332614e48414467674748594552415155504b67394a57566c6545784d54476232577a325a546438444d4e7542515145764a57646e573134343430333849714b437246554b6a30773972392b6f3945347636476834624565587653322f6559337638485430744a792f507a38506e58485169694b33704c4c35662b594f58506d70487137435764515856317447494d7a74474442676f632b3346645255554770564b707442454663645566374c4261724e7a67342b5057636e4a7a347973704b4e592f484f776475722b5a647a637a4d4e486f627a4f4f77686f59474f43636e68776f4e44643374397067774444734541734670725659377436616d5a744b393349517a4b4334754c6757336c324e3774323362707671787a2f2f38357a39585230524537475378574e3065384c73564373576d34754c6933347246596759417745696c30732b584c31382b3770627230326766662f7778624441594968495345745a794f4a77327439646a73396d5849794d6a312f37363137392b4c4b646d4a675736517146343065324b357332626c2f6b6f655277366441696550587432596c68596d426e4863666652594359794d704c523658546662345653464656645531507a564c76356a527333436d664d6d4747535371566d4c7066623752486639416346425a6c6e7a5a7231324763734538356777594946526752422b7348745a64655732624e6e787a39715868614c4253346f4b4569547957547649776a792f576b61747845453054315a63395770744c71364f7478674d4641616a615a614a704d64427834485144414d757955514344347a476f3335342b315750704851613274723466543039416f334a4a46496447545a736d5554416c4e54553050457838662f6773666a66542f4864357457713533536a784d6d5969556c4a654b5a4d3263576973586966336c38334d4241454f526973566a665552526c31756c30706f614768696e644f5a7955544635383855565571395675644f2b445379535367315656565250652b313235637155304b697271743277322b2f766c336143676f483237642b2b656c4d4d456b32304e44513134515547424c4338767a7867564662564a4a424c6430576878484f3858436f57665578525639636f7272307a4b33726a586f444d4d41785976586f797231656f74376e4e646644362f53616c5562696b6f4b4567764b697153486a7834384a46426c5a535571454e43517659514248457450447a384437743237586f6978765833336e73504c536f716b706c4d4a6f4e577136336d385868374a524c4a4a552f514d41773743494a6f6934794d2f47742b666e3736752b2b2b362f55474f366d5a7a5a382f6e77674f446a613756393747584a6c44497046384978614c2f3547666e313852477873622b70652f2f4f57525074335a766e3137524631646e64646532754844682b46466978614a30394c534e4f6e7036532f77654c782f536158535667444148554d51444d4d4f484d64372f507a38506f324e6a56327961644d6d727832724873386d2f56506c724b7773666b39507a784b723154725061725647753177757363634e546a524245414d3848752b4576372b2f525361546664545a32586d39734c4277754c5330644467314e66574a754b5870354d6d54634774724b33373237466e69314b6c544f4152425567694330687362473150483770745241592f6249534149636d49594e6f426857476459574e69786b5a4752492b586c3557666d7a5a76335835314f3930545579564f503766763039765a32754c362b50767a76662f2b37415962686f6f364f6a6e5361706d564f70355030534f626b38586839504236767732617a585151416443516e4a33386c466f73766e6a7835736a30704b576e346d576565735645555a63764b796e716b62385476566e4e7a4d397a5631595565503336637346677365484e7a4d314651554344444d437a343272567267643938383033597a5a733335534b524b424242454a6e4e5a7050323976624b7875365141514463766c6b4b77374142414d423169714a4f334c7031797a4a7633727a47785973585830684953486a69494e2b744b6275556f4b36756a72397a353037447a5a7333737a6f374f2b6659624c5a7770394e4a4d6835586448674b52644668715652364255475144717656656a45364f726f314b6972714170764e7667454141417a44634730326d2f526866372b6e70346666307449535a725661413456436f517a444d4e6e7738484467474e414858546c43597867326a4342496c304b684f4445774d4741704c793976665037353537384f4477392f346948664c612f63524e48583177647633627056597a6162315677754e34496b5357315856786656323973725278434553394d3034584b35486e6a723069534a5268444543634f774577426764376c634e68524642344f43677470355046366e302b6d383074585664656e5a5a3538397633547030724d5a47526d324b53725859394d546466334977594d482b556550486733647633392f784d574c4630504477734c692b767637565a32646e524541414434414141662f50356253454151396443396a4749616d61646f47515a417449434467696b676b616e63366e5230644852325851304a437269636d4a74354954553374307576315855616a63654278314f394a30524d462f563571626d374747787362417738644f6852363965705650674141454154684e42714e5851414141454551414f44325447533876774541674d2f6e4478734d6871364d6a4979664e4e434830564d4266567154712b6e37336e315130394239554e5051665644543048315130394239554e5051665644543048315130394239554e505166564454304831512f776542394d4d48514e4365444141414141424a52553545726b4a6767673d3d, 'user', 1, 'active', NULL, NULL, NULL, 'aki3LQwoUM53eKy606Gvcce4Kph29oYBMAE1jnr30UJbn4DBPFErIATH6Zum', '2015-11-27 03:04:56', '2016-02-05 00:54:40'),
(166, '166', NULL, '$2y$10$di1csfLIThJMLfrRT0Kk5egrLsR3KwfmWy2TrKp8BLo8v0.DJe9se', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:57', '2015-11-27 03:04:57'),
(167, '167', NULL, '$2y$10$HIpE5TA1DZZBgRhg2aUh0OfVULuwtgithGW89PbB5bwhv9xbCA/EO', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:57', '2015-11-27 03:04:57'),
(168, '168', NULL, '$2y$10$zwkeWPR9WxJXxEa9Yr1/qOVbsN7uI1JwMErvoGGF83yxsx.UfSavO', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:57', '2015-11-27 03:04:57'),
(169, '169', NULL, '$2y$10$vRq3QHBPSlNmn9FiN8ZqFuyRUC6Y1aH.0nVV4JK6/o4FvJ1uvJciC', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:57', '2015-11-27 03:04:57'),
(170, '170', NULL, '$2y$10$SLe2vpSmrf7nN7k1IW03.OpwZJaEsLNrt0.BzF3lGPz4gciliJNlu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:58', '2015-11-27 03:04:58'),
(171, '171', NULL, '$2y$10$cXTbMnTd7PwHjApwYUrWEOrQV28nTF7ydvEVjvmqVP.CYBWqjb5Ti', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:58', '2015-11-27 03:04:58'),
(172, '172', NULL, '$2y$10$xw4vi0PbZr8Xgk/nWnNaYO8Ok5LIA/suhqnzLhw9eIJVdKUACug32', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:58', '2015-11-27 03:04:58'),
(173, '173', NULL, '$2y$10$A52Eq9GuohhKGU8/QsMNiO66kxiYAWFtP3rNFjYRh8HozabN9.nAC', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:58', '2015-11-27 03:04:58'),
(174, '174', NULL, '$2y$10$fvi18puux.THLStjZpZq4.BwIefFFeLFSDqtBVUc9QUAEIG4KZ95a', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:59', '2015-11-27 03:04:59'),
(175, '175', NULL, '$2y$10$IdzduHecivfLoOIOppSDD.rl7ycr/HqN3CRq9P9ivNGAK9bbQWL7u', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:59', '2015-11-27 03:04:59'),
(176, '176', NULL, '$2y$10$zT/JMVsPUeC8JMf8P/qEo.4nUi5qvVUwElIIzVFG/ZbVML1bmgdwO', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:59', '2015-11-27 03:04:59'),
(177, '177', NULL, '$2y$10$Rxb9Z5kNl2dInPR8PG8xZeQHyjDR2gx6QE97qNWOtPxhMnSvpE66u', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:59', '2015-11-27 03:04:59'),
(178, '178', NULL, '$2y$10$5wpporeWM/o02DHuUW4yrOhcyetsxZd21FncjSfGxHIIv0iv3QmNO', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'ItRCbvmaM6dT8O7Gpempg4Ihbnw2g5IzY0bdmsHtQj7wHM7n2LDf7ptnemNt', '2015-11-27 03:05:00', '2016-02-05 00:47:48'),
(179, '179', NULL, '$2y$10$eVoJWguBVn/GKNsgWgkUveJI84El00EUIOQxIpgJTrMlLzH5wx33C', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:00', '2015-11-27 03:05:00'),
(180, '180', NULL, '$2y$10$5Z0JYsy/Nby5SwhCb82epO7KpYCe6NYcI1FoG3BZ1xsp3ENreKuqm', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'GvftjG9BZFronjy2AuwU7qRZav0lrxECKx6HG1Tlrn8ojltZXmlyF7152Q0t', '2015-11-27 03:05:00', '2016-02-05 00:52:08'),
(181, '181', NULL, '$2y$10$pcqLCwnOlx0x3SVofch8w.KCd9vxusSHYqZ.MgQTTG0fatDwVdUNi', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:00', '2015-11-27 03:05:00'),
(182, '182', NULL, '$2y$10$7hNxfWWDnmSJNmzMChRye.UiBL/H.INmDQwbM3Bh2BE8.SOtvySK2', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:00', '2015-11-27 03:05:00'),
(183, '183', NULL, '$2y$10$.IkzAXmiN19oTu1DvoFnJO7dgCOiENMmNT4dDrTbtWfaB6W5bTH9a', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:01', '2015-11-27 03:05:01'),
(184, '184', NULL, '$2y$10$a0gSzXygV2uaj5zCYvzWeu7wRzDC3f.DAT.6V8cgDy3CsSb8K/YEK', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:01', '2015-11-27 03:05:01'),
(185, '185', NULL, '$2y$10$VhI/trT8BzwqNiQkRXFK6ODjbjIUwty1W8fQN/n5Hs4fNEksSE.mu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:01', '2015-11-27 03:05:01'),
(186, '186', NULL, '$2y$10$xNa1J8UwuiO2r4y1C.tmwuJRMpzEZQ9JP4Gw3LWUhGAqc.8Mg6oIa', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:01', '2015-11-27 03:05:01'),
(187, '187', NULL, '$2y$10$1tvN40YSLntUHGCfNQ7TeOi0UD2maWwkSgndT.RkYGqz6xkDFVuza', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:02', '2015-11-27 03:05:02'),
(188, '188', NULL, '$2y$10$nmupkhbklJoVoDlaTF5ZZevJeBiiuEvXHqs.lv6gbWWqqIZZ1IE4m', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:02', '2015-11-27 03:05:02'),
(189, '189', NULL, '$2y$10$QQyWsqnb9.R.ojSsN6u2AubzHzVWVP8ZumtngoyWipzLPIudqtHkm', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:02', '2015-11-27 03:05:02'),
(190, '190', NULL, '$2y$10$6DtOjROj5d2omO1JuHH7V.pNFs40n6gfT2X4wsN3I7yYLuO/d3aum', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:02', '2015-11-27 03:05:02'),
(191, '191', NULL, '$2y$10$x9nJYfeiA5YIVRRd/BPH5eOJxNkN03Qxi77NvCGDGfwyVdCqDOpxO', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:02', '2015-11-27 03:05:02'),
(192, '192', NULL, '$2y$10$C.2H7vFjOP6GOCt6nAqoYuxsVhJKiWKA5qrY3B/wG0RDN1J26VtI2', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:02', '2015-11-27 03:05:02'),
(193, '193', NULL, '$2y$10$MvT8pMIz6Jq9jRPw5TLmC.dcphqcdhxttG3FcwRJLfRHDQde7ty2K', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:03', '2015-11-27 03:05:03'),
(194, '194', NULL, '$2y$10$8GwsNkCVkPC.BVYAv/1gH.BwVZoEYUa/6h5vbn3BISWUQedK82iM6', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e535568455567414141483041414142454341594141414373395470414141414a5a556c45515652346e4f32636632785635526e485038394e3039773054573061516b6a5445454b36706d6b61786f695a706e473645567a495a70686a68724746675073684f71507a787a527559527378786843794c4752545a347768684c4673696769696978466c47633634624962354179646a77437044564e417937357867577772502f6e696530337539744c6558396e446563376a336d397963336e76656339366e372f65387a2f75387a34386a716b6f64745956636141487153423531306d7351695a4d75496a6b526152655261556e335859636878457a76426834484e6f6a4939414439317a776141765135483767552b412f313553554951677a364d38416730415173464a453638516b6a7849416641545944656541366f434f414444574e78456c58315548674165415138466e672b71526c71485545556132712b684c774a475a544c424f526d53486b7146574558452f76426f34433763444e49704a506f6c4d52365243526c534a79755969454d4753444979547048774b2f384c385841335069376b424538694a796a596a73454a464852575170634174774837414771456c6667595430766274613377624d417a61723674646a766e386638474c4a54344e41415a67424841612b6f4b72396366615a425154644c716e715957793244774a58696369314d572f6843706a424f4f7a4842694279434c55426a5448326c526d6b59592b384264694637647576412b4930367671786e634949526a4c414150595135456e482f35383467762f54716e6f5375413359432f514250346e78336f50414c344666595351504130384166385a3842652f4631566557454a783078333567417a596a463476496c2b4b3673616f4f417739693271515275427834474c67546377585848464a42757171654165344858674a61675674455a45614d392b384862735a6d6544646d77632f30666d734f71534164526c58784b7379716e673873692f6e2b2b3445566d4672764144726a76482b574548544c5667345261634b634e6e646750766f7234743553655469334739697271674e54754538727070574f714f70495850496c6764544d64426731366e3647456434422f4d67484e38342b336c505650303252384437677238432f675055694d6a633241524e41716b68334447437a2f535067476d42425748452b4352475a68336e305a6d4d794c675857754a624b42464a4875687458543241426d565a67625a78475851795941387746446d4a627a527a7752597a385443423170414f34366c32447a66725a774a306930684a574b73767677774a454f637a672f44316d474f61414c7963564e4a6f71556b6d3659792f6d71436b414b346e5a6d70386b6373424649674c6d4f6a344a2f4d48506456423038615961715358643166776a6d4b7076786d5a376432435a526f414476754f5a695156754374674430453547736f4253537a7141716861417537426779537a677268515954414f5941646542455430436e4d47434f5a6d497a366561644c41744672612b463743342b2b4b7745764571356a6165426c794a2b664f484d5264766e66515973526c34476d67426668417976557056443246352b77446678777a4e504c612b447759533635795143644a647a612f43564f7463544d3248744a522f6a5156726d7246745778354c2f546f61554b61716b516e535958534733594f702b615841386f4135382b39676e734f54464833346d5345395662373369654237396675413556694378425771656d5363647531414c325a6b2f52303437454764306e594e33673767714964687135566c4f764151634c582f64443857736f317752465854476270563155783967433767483441436d3444576b6e4e4e77454a737a5430754975727433674c75426161563357754a332b75666d425a7038392b6e592b76315055425042566d75397674486e314d6c6e303141652b6a78476c507530414a4d6b766876412f38446a6d4f4f6d78793268586f4b2b426734445277442f6f676c527637586958676373776c796d452f2f5857383756484c2b596d436a66342f75387a43325a637956794a44485a6e7230554432504257446539503647734768684c7451345857696b742f69416e77626578676f69747a7452513842364c505771315766744575414e5037664e74635744667631727744702f574434472f7562484138427a667331704c4b70324539446f4d76513579616639397a614b66766c372f66663367653751343356426b4f3644336c6d693571506a4d5a2f356a574f303733586931496b2b357554656943304c5077644f2b506b6834485a73373733635a33476b7674646a4c7545445475796a355772634834414466733147664e6c497979653441464d6b2f72757553685654393363412b517274463559517138432f67566c2b72686d7a794938446a7745744a64643175475a3532346b2f34512f47447142336e4c365775457766414e656d536330484632434b70486344727a75427a77504e453752764137615847486737797337503841656a613478726d37413072686377573242744a64587466573177626641574d4350306546306f70472f7a51593073356c7572754f5a576e3656615466737872732b37566d696f6f6d32586178503135614d70394a6970616e61634d2b5877444a59466d43572b79343872716f6a45376359635047424f6c6e4f4371673671366b646152563663576a4c6d4f73785838453367736e5074373377676b36534c53434e573139344537414e5759306b4e766343332f50783432494d356179435a414d6b6a774c505930724661524a6f54364c4d7951717561536172314f5a68445a51693441624f79663471702b4f4e41357754587a3861696461304a795873565a745364416d3449506e3668425a6a6b4950345957796466783430757a4a333672762b2b4e72534d593869387a575637425a676455705a4d716e657357675867536256314531563942334f34674a564778563776506b577378754c77637a446249316a7350584f6b693867737a4e4d4735686770785259735333556d5676716370715347666342577a4b686253634158496d534f644d774b627344693251664c7a75334450474135724f79356a5941516b54595261595052517371484b4c345534587568354d6f55365a343438526c4d377131596d74496f314a497066345046745764684d796f49524b5148432b4138466d306a315849436675744e466f74496b487136544a474f2b6474374d4258356f6f3678562f6142336570667678627756615474574d5275487038736c7479492b51633667515568456b4779526e6f50356e7274782f62623432455470763637734f71544542686d374a7935505a6a743059685630535a65784a453130692f425a4f374869694847773335674a2b613875544a513276515a2f2b516f4757665854693967443851387a4b57624b4c4a472b73562b484e4379314b6453714f7148574f584a494a626445734b6769314b6a477a6a376855593773667936526f722f55324c4947756e52326c684e7a666f57544d5733414a382f58774a56514d483762364a4d6861746c397837797231394e56717a736b52344e337673544e56524c53747a6e58324e39503132564b4642386b564862474162625533354d33494c5047756c52726e75685971736958765a6a69464c6e614b59446649717a7833702f737549556b54585349336d725456562b30342b4e535a6336757a4d6d656a68374f44756956336644546f51796c32713135554e5276447850305857624a4a374443687776786462325643417a705074574a314b5876565665467256764a417a707a314b30345073433944386d4d6b4f36593763665031316c2b32675050454b41346b4c664f683732722b56572b69562b54507864646c6b6a2f58642b37484866396b5434696838486f684273414b7a44487268465a572f43584f544858556b4c6c44585339324a37394537674f355643703534794e642b2f376b784174764877445041584c4a52367659684d642f4c624d4132305058474a516d65555443494435573473412f5944594836466473736f3571634872544c42336b64376a474b713968762b3977354b387573546b796330695a4d5977476173797551456c6965336a4c4d4c45792f44716c684f59596b57695139736d54774e7741387870314b55632f2b4b5077794a4630466b716c513567723958626856576b6e515355353937734e6c3045666253775335734f566968717276487556566938437a59526341334d452f6441367236637557727a704d735753516452684d7162736379554d7266366a534372663233716572545363745743534b53303842766e3834733654424b6642646d7348304f49372b414755633767594f68427a694e794454706455774f576475793152454436715458495034506d3664642b5174452b753841414141415355564f524b35435949493d, 'user', 8, 'active', NULL, NULL, NULL, 'pkwBv9d09G3aldeyp21jFSapgjPzEM4DUq32gZ6A8IxqdPBaqXPDWEbw2bZG', '2015-11-27 03:05:03', '2016-02-02 12:13:54'),
(195, '195', NULL, '$2y$10$zTwSoC11IVHj0NZG8prAKuhWqAtRwpBOpfh1ZDHwL/980RgEfe3KK', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:03', '2015-11-27 03:05:03'),
(196, '196', NULL, '$2y$10$TxA.pGhh1G5A/D9hHh5ADuJsh00dctfMDP/G0ULzX3Ek7gPuoTLqu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:03', '2015-11-27 03:05:03'),
(197, '197', NULL, '$2y$10$HNhpw3eKM06uhi3y3QBGyu/.3WKD89TztoRy595qGXBEu4mi7YhKq', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:04', '2015-11-27 03:05:04'),
(198, '198', NULL, '$2y$10$bn/3PYzo330y6GLm4EOJPueQUjpTdlPimmB84kithpuq1XE6GnTq2', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:04', '2015-11-27 03:05:04'),
(199, '199', NULL, '$2y$10$nZ5tu4zCsaCcnKxiG.vRyeb./oPOaiP3qEYjGwaWyZ0AqLcBHWY46', NULL, 'user', 1, 'active', NULL, NULL, NULL, 'srp6XmlgPoBVtBtyYvOKKyoOtoX0sDS5wFSEIFQhdGbynWU1zE6vxjjw71q6', '2015-11-27 03:05:04', '2016-02-05 00:55:00'),
(200, '200', NULL, '$2y$10$heui2KvotxINPokSS3VYIup4/EFDy4dc0pmh3F2Y/WQ.UegMmJtS2', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:04', '2015-11-27 03:05:04'),
(201, '201', NULL, '$2y$10$dglMjrGVZjCZkeNtuFgPE.1j.qPfPc4N73zWlyACxZ4H7iDrmi3ue', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e535568455567414141483041414142454341594141414373395470414141415170456c45515652346e4f316465327a56565a372f6e4d66762f4e3650336e743765323937372b31744330324c7051394258694c766742615553696f7a62467970786a5573325968527832576353516b78786e574e4957517a613469726a7575346a694a785a346d4c52435a7567777a4c6f4d4d772b474b5259646c53433962796d5062533074665a5033704c674a62484c6253333048365354394c63332f6e2b7a766433507566315062397a66695653536f78686449476d3234457844442f4752422b4647424e3946474a4d3946474959526464312f556c686d47384e6e2f2b66473234387835444c345a64394b3675726c4262573975797572713668634f64397868364d6579697a3577353831644369506437656e6f325a6d5a6d4c686e752f4d63416b48544536625a74653231746263393364336666352f66376e3470476f2b2f76323765765a39676447615649793053757061586c744b3772663838352f37666d3575594e396658317978392b2b4f4778536556775155715a4e6871476f514634486b4144495754656c644c57314e52775864665843694857726c75336a71625437357564615731646955536966644b6b53532b6f7172704453766d4b6264734c426b71586b5a466876502f2b2b3276623274702b4b7155737746696f655831496436325455714b676f4d44484748754c4548496f4841375075664261555646526a4448324159427a6e504e585330744c7258543765374d7a37513730555645554834444e684a4344414971536c6147514d625962674b5355486f7a48343546302b336b724d4f304f584d6a4377734951352f786a5173686532375966705a54754a34524941464a56315a665337642b747772513763436e6a385869454548494567417745416e4c426767555377446e586461656c3237646268534e71516c5261576d70383939313379365755426f432f634d3578354d67525545722f584668592b4964302b77634175626d352b586c3565646c5853724e2b2f666f52566137396b4f3561313066444d414a4369453041366e5664663859307a586b4144674f517571352f38734144443979514d43305769316b564652586930742b447757414a49655156414674565658314e555a54384336384430437a4c576f336538504b515a566d726934754c2b2f6b554341526d554571334b497279536b4642675866684e632f7a714f4d346435756d2b5777674543684d56316d6e585777704a534b52794752437942354b36646536726c66322f653636376f38424e4b7571756d2f5772466e3865764c497973724b466b4b7370705475316a54743533322f5631565663644d3048794f4548434b4537425a4362414677796a544e327234304b31617334454b49357741304d4d616545304a38414f44492b50486a4c366f386971497341584359454e4945494b456f53756b466c595943654168415053486b444b5630372f6a783433326a54765437377275504d3861574545494f416667674641715658486739466f747851736737414d3770756c3639644f6e535162563279374b6d4545492b4a34516342664131592b7a7265447a75654a35486456312f464543546f6967765a575a6d42676f4b4372675159693868354530704a63724c79366c68474e55416d6b7a5472436b724b2b4f4b6f6c51424f44647a357378345878364251474143496152425664564e6e756556417a686857645a714b5355387a2b4f4d73565541476b7a54724d33497948674d77436d667a35647961382f4b79764a733235343362646f303536595476624377304c497371786241435633584e2f72392f6746725053466b4577424a43476b30545850794941707047715630503656306d2b643534327a625867626754485a3239753242514b41794f5a7938454931477a2f636b6c4e4b58685243664c3171307950413862776f6870464858395a66476a782f50705a54676e433841494955514d365355794d6e4a6352686a48314a4b39325a6c5a666b416841413041566866586c374f6456312f484543445a566c725636356379526c6a525141537571342f6c4d717a42414b42795a54536651444f435346715579324c74497075575a5a50566456664144674b344d46466978623147325037614e76324841426e41456a473243362f3378394d5166425a6c4e4b446c4e4c4e706d6c6d53796c68474d5a6641656a4d79636c35484d415253756b6245795a4d4d507073567178595154564e323859593278795078344f4d7354724f2b6335594c485a2b55576a5370456c784147643058622f62387a797561566f746745625038325a4a4b6345594377453441574339347a6a4c414a78514647567457566d5a6b4649435142474142494256312f6f736672382f52416a5a545169705578546c48554c496f59714b696b4731396d45584845434955766f4f4965535171717233585331395a6d596d5a347a39466f414530436d456547505370456e6131657730545373696842796c6c4c357057565a41536f6e63334679714b4d7076474750536352784a434e6d586e35386675744175464170787a766d58414e3553464f56464145643950742f6b5335354241334455747530584c4d75714274436761646f7a6664667676504e4f51536e6478686a625251673578446e2f494338765437764176702f6f6d5a6d5a3855416755464a5455394e76434a732b66546f5851767743774e6568554b6a4538377a4a41466f30546274712b615664644c2f665877546751307270675741774f504e6137577a62766876414f5556524a43486b6e4b5a7071362b555068614c42526c6a6e7a4447646b63696b664d39517a4159484a6673646957415534376a4c4c6a553972626262744f536b363154414a7031585839386749717241546961374771504b4972796875753646315645586463664164414e6f4d486e383556636371305551497672757457753677704e303535495269704e727573757644512f6e382b3349446b635043696c52445161465979783333444f7438666a386376326b6d6b56766279386e49624434546d456b454f4d735430464251564671646976584c6d5363383633756134726f39476f4a495130354f626d68675a4b57314a53596a4847586957453146755764623677373772724c69714565444570654c6351597550537055763752515378574b77306d555a797a74384e6838504770576e3652452f4f4e5135456f39487353394f556c5a565a6a4c48566a75506358565a57646c487274537872465942546672392f4769486b5a51434e6971493854776a353344434d64355050595a696d75557a547446636f706673595939766e7a703137766d4b5a70726b57514d4f3463654e536a6743475848445038366a72757375544d2b6458673846675944443373573137486f4236536d6e6673757a362b66506e583153595a57566c56416a7844494236323761585848677449794d6a6e784453674e35312f4c327857477a41755147414f556b7876387a4979426733554272476d4a5a736d643271716a365736724d346a6a4d4e77436b416a51414f426f504271724b794d736f3558772f67534451614c5651555a584e7943456851536e63356a6e4e52512b47637a7741672f58372f7242456c7575643556416978436b4144352f786c31335837745a70554b49536f4248416b32524b6273374b794c68496c476463336d4b6235784b57327571342f6b37527263427a6e736c4741454b4b514550496867436d58537a4e37396d7a714f45346c592b794a34754c696c436454733266504672717550796d45324b496f79766d777a624b736641414e6c4e4b6a414d3459686c48706556372b394f6e542b2b567878783133524143633054537465735349586c52555249555154774e6f4e45317a62573575376c556e5839666b4d444150774d466b794c537873724b5353696d526b354e5444714242555a534e727574654e4d374e6e7a396659347a745449376a447a373030454d6a63684e4761576b704e777a6a4563373578345a68564638364c46784953696b46634568526c4e6447684f67544a6b77516a754d3844654345454f4c4a57437832586174704177672f42634358414d356b5a575756352b626d686767686459535144324f78574c38787a6e47634943486b533033544e7152623242744a586463334d38592b72716d7053576b794e78534361365a70726766514b495259356272756b4c51715656584c415a7a676e4f39554647553767507138764c7742782b426b4165586e35755a65312f4179306b6770585538496154514d493656353067313159754c4569596175367873414e4b6971576a5055443632713675612b6d626272757631437131756472757375414e43636e5a31646b6f726444587346574631647258333737626650743757314c515077564874372b793976314c30766836367572723139663765307450784e595746683056446e4f5a4c51306448784851446a2b2b2b2f4c30334a38456255754d574c463275617072324b33706c3135593234353955596a55614c6b766c4a4963524f414e736f7059657a73724a53446d4675566c5a58567a75456b415a643135394f786536364d36367472615643694363424a42686a6334626a5959754c697a30414f7748735a597a74703554754275416a684c784e43446b61436f583672577264716b795777645a684664336e38383041304b787032724f7a5a733061386c436f7171714b3672722b4849436d63446863626c6e575777443253436e68757135444b583044514c336a4f436d4e637a63722f58372f517475325536726b31355668666e362b4c376e355966764569524f485a57757935336c54414452706d7661596c4249417476654a6e76544a5332367533463951554a412f48443764624c7775593156564e36443368554c706a58446d61677948777734685a42656c394c665470302b3342684a6453676c64312b4d416467485961747432576e616e6a47514f32744332375572304c6e6d6d7650593857416f686e73556c727a6f48456c314b69576730656a7368354c4371716d39506e54703137494445395971656b354d5449495163344a792f46516745686d5842772f4f38615144714e55303776324f6b6f4b4167516767354c4954594e4a434e5952677a415a77613650586f6147624b42704649684173684e6846436a67786d6a39646757463565626e444f74314e4b3932526e5a352f6659616f6f796a38424f42494f682b4f58732b57637630307033546c3136745262616a5675574555506838506c364e323155544d63446c5a56565648544e4a3841304f793637766d4e463637727a67505159426a476f31657931335739436b4354332b395065582f6472637155562b544f6e446c7a4f344432764c793848616e61446761666676707059534b522b496d694b4273714b69702b42774254706b7978576c7462317a48472f75547a2b5835394a5876486358354843506b686b5567734851352f6277716b556b505772466c444b615876634d35334234504249592f4a4935474978686a6253676a35764c43773043656c5245314e4454554d3431454154625a7458315072355a792f54516a5a763344687772454a6e557978652f63384c30417050636f59577a38637a706d6d755178416f2b4d3438354c35433975325636503376666e504a303261644530566a334f2b696842796f726934754e2b32707448496c424c372f66355a4145375a746e334e6d786f487937793850497453576b637066586632374e6b55674d5935723058764b5a4f31414b373548544c6e664373685a4765364333756b6b4b6379464c53327474344f3448524f5473372f334f6868356c4c38384d4d506c5430395053573672762b3075626b3578426a62304e336450634e31335a38422b4e5870303665377275552b5335597373627137757773315466755049586235706b464b457a6b705a526d41316d41772b4a63683867634155464a5359707739652f597078746a76506338372b38303333327a75377534757a4d6a4957446c6e7a70782f76566242415744486a68335a5573707341416547304f576243366c3043355a6c4c51475173473137786c42325035716d4c51665153536b39444f41677066526a565655767579766d536e51635a39446e786d3556707454536264762b62307270386261327473564455514542594e79346361474f6a6f34314148685054342b684b4d71626b556a6b723976623237394e3956342b6e362b777061586c5a34797866772b4877386547774e326245366e57456948454b345351413858467854646b64327366772b4677747171715478424344674134777a6c2f506a4d7a4d7a37592b3055694559397a2f676d6c6446636f4642716274562f416c41325348777449634d342f30485639655367554776436b79645734614e45696f65743674754d34537852467155312b594b6754765163564e2f76392f705350362f5378714b6949613571326752445336486e6537656b75354a48476c44385465733839392f43367572724b72713675483356326473346a684852787a763954566455746955546954365a70396b7965504c6b64414c4b79736a714b69347537414f436a6a7a3453687738664470342b66586f61593278715230644861553950547a6d414c6b72702f7a484774684243786e6430644479596b5a4778364f544a6b2f3831324e374c4e4d31487a7034392b364a706d6a3970625733393557447663387469734c566c7a5a6f31314f2f3378773344574a303856586f4b51444d6870496c7a587338357232654d48614b55666b307033635559323450653437756e43434766614a713251644f3048317557465a733362353452436f557353756b655256452b724b3274486652716e32565a4d3943376550505351476656786a69496c6a3451357336644b7a3737374c4f535a42782f486b49496a314b614134436a64317630463532646e58396376486a7838666665652b2b69734574563165794f6a6f3739727575754f3333363944385078672f544e47507437653162416678766358487879692b2b2b4f4c306f422f71566b613661313066493548494441414a7937497565346273536f78476f314d494956387978766147517146426858656a6853506d3031644e5455317841445352534a784e7861366d706f6147772b46357834346432304970505a6d666e2f2b6a787362476c4d4f375559563031376f2b456b4965495953305646525558504f6e51477471616d686d5a7561533544486f3134714c69776431444871304d61573139364745615a6f567261327466373733336e7550583076362b2b2b2f6e2b376375584e356333507a5377422b44574464563139396c5649764d5671526c762f734d42415959397436656e6f384b6558307136574e78574c5a783438666636537a732f4e76415777433849395379766168392f4c577749675a30796d6c6677415139506c383863756c6963666a6e71377266336673324c46504f6a733748395a3166523241667867545045576b65337a705930354f546f5253656f427a2f6b5a565664564663587065587036774c4774354d74592f4b6f54596d4a3264506261304f6b694f6d4f346441437a4c656a43525347777754664e6647474e644c53307441536b6c5a34795664486433787a6a6e4f327a626675486b795a5066704e76586d786b6a537653636e427a782f666666763972563156554a3444734130445474704a54796a35716d76567457567662377572713673662f71644a305955614944774d71564b77566a5448763939646548644b5047614d61494533304d513438524d337366772f426854505252694448525279482b48334f4b6e3039335862624c4141414141456c46546b5375516d4343, 'president', 11, 'active', NULL, NULL, NULL, 'kZMqjNmfNNNu6TTi4IeQpFilorAqDAvOUUzwLEs99nHgYgdoB2eiatg0c04K', '2015-11-27 03:05:04', '2016-02-02 12:13:35'),
(202, '202', NULL, '$2y$10$i2EB2VIUgEM6TiGGJiq1meKD3DOoMC37My4xbPy.UgG1B4wkGp2Dy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:05', '2015-11-27 03:05:05'),
(203, '203', NULL, '$2y$10$EWO6FeaMHilBTb6TN/Fwy.ATOiqNt/EkXH6Ggp3SF2LidpbjDWaGW', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'WUnrLrMjUwnpz2yY1nWJkR0NcXInUlBmEJTpYIXiy8eCY5spoxNiAkCifjAY', '2015-11-27 03:05:05', '2016-02-05 01:10:49'),
(204, '204', NULL, '$2y$10$ETP69jF0gFEPc2vp1JJwyeUQBF2aQuoutVD0EEqgP44u2Fxwsn.FG', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'EbD45J5SScsPBvEGnuncLRXFiRFMA4UDf1JQaCUiPodBnU1wNPdyuatm0pcG', '2015-11-27 03:05:05', '2016-01-14 06:00:53'),
(205, '205', NULL, '$2y$10$rLTQjNuQOSkzhtEcAQ0CweIZ0wB1fmXrQvQX97yCDFGPD4iyke6Fq', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:05', '2015-11-27 03:05:05'),
(206, '206', NULL, '$2y$10$EZEdWODEOrZWLYaM8bFUBeZmoAvAyHmH38rsauWBpInzwe52tV89O', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'Mllelw99IUPrRjp0jztFUNIao29HFxuNk42CHCoSlJnTTSVi5Uc1Fbg4UqGL', '2015-11-27 03:05:05', '2016-02-05 01:10:59'),
(207, '207', NULL, '$2y$10$iVSNxJy7CkASvGjv.92op./xlgktSsLS6HCZhH5RPNIf/tn4/SRk2', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:06', '2015-11-27 03:05:06'),
(208, '208', NULL, '$2y$10$BGGEzOIyXaioJQ2LI59uLekUIRdjGXez5Bm4CbQ7I394ujbEsiuWC', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'fPHSYWQKiQYHW8iPnruVClyt00Bt4dRBjF53CEquehqScowUeizQkwimvMDR', '2015-11-27 03:05:06', '2016-02-05 00:52:26'),
(209, '209', NULL, '$2y$10$Q8HsybKYFMksigKUadX9hOo9SVHWwGxdSbVPJhDDOxm0o8.Yx9uwm', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:06', '2015-11-27 03:05:06'),
(210, '210', NULL, '$2y$10$0udLnMaw7ZNUBQLPKdOBaOmBund5536NESoxNVtRh8O4beHAeXTrG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:06', '2015-11-27 03:05:06');
INSERT INTO `hris_users` (`id`, `username`, `email`, `password`, `signature`, `type`, `department_id`, `status`, `last_login`, `last_logout`, `ip_address`, `remember_token`, `created_at`, `updated_at`) VALUES
(211, '211', NULL, '$2y$10$9bGiTfPpP5EqrYmitbGOmuhuPhoX26tOWmhUtXEUSYblMzw20wdvy', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e53556845556741414148304141414245434159414141437339547041414141525a556c45515652346e4f316365334155315a6f2f302b6b2b352f547078387a307a50524d356a33444d486b516b77416862774962416f4962516e516a69565255694a4736416b57786f6b4264554d7269565a616c4b52634453796b615a57395a6c4e645643726c4b73526859626b785269494263515859464443466d495a4263495a41426b6a6e377879565544496b6d6b4b517a6b562f56393865637839652f376c392f6655352f352f546f4b4b586741583566594c516d384142446a7765692f773778515054664956697443647750786f30623532317061596e583658546e7a357735383633576643494645526e70363965765a7856462b654f4a457964716d707562357a55304e4878754e42714c744f59564b64424634757864555a5458726c2b2f6e683462472f764530614e487a397674397249725636345574376132507177317430684178455736772b4634704c573174535159444259665058723050414141574379576f783064486247624e6d324b364f4671794541706a5269624e6d326141554a593733513638377557473433475049376a6a6d6e4e4c3149736f694c6a304b46442f387078334e66313966576664533058424d464c4b54326e46613949513853496e706d5a6157747462563367382f6e2b7158746463334e7a4567446768416130496849524d3661664f484869525a376e2f334c71314b6d2f645331667633343947773648383631573677367475455563744235662b6d4b624e32396d4555494e5070387670587564302b6e4d786869666666666464316d746555614b615536674c785949424e4978786e5872317132443365746b57643671312b74663035706a4a4a6e6d4250706973697976455154683765376c43516b4a5151686855327071716c4e726a70466b7733354d33375270453950653376364958712f6632623375334c6c7a4b776b684878773865504338467479474d394c53306749476732454a4957532f7757423473327664734a2b39662f727070327037653373774a79666e7637755778386247786f5a436f55665330744965306f726263454e69596d4c796a7a2f2b2b4f69745737634b4b6155455176695a31577064505837382b4b392b305644725238327632644e5050383361624c59696e75635064712b544a4f6c6a575a5933614d31525331757859675554467863584b387679797a7a506e305149485a646c2b5a55785938596b2f31712f59526e7067554167634f48436861586863486836573175626e524479373133727656357654696755536b394e545831574b34356149696b707956746658313855436f574b772b47776a4244367338766c65727a37363279763050707537576f7a5a7378677a47627a4967686867313676587a46703069513749655267644852305957656257624e6d515a376e44356e4e35766c613878314b5330704b387572312b756378786a55387a353857424b48433758616e762f58575730782f66576c2b4d70303263654a4555524345447a4847745846786358354b4b5669356371584d6356784c566c62576e646d357171706c434b466a4c373330306f682f4c30394e5462557069724959593179444d54347453644b6258713833753769342b4b355831346754666662733253776835424e43794a2b7973374e4a5a376e6462673879444e503078526466734a52536b4a326433626e674d6b31727a6f4e6c6978597477717171506959497767364555494d6743467538586d39325957486866516b39374551336d5577724d4d6148382f507a6364667968495345795a496b6e657a384c637679566b6d53746d6e4e6436427436644b6c724e31757a354d6b3657304959534d685a4a665a624a3564586c354f42754e346d703977664878384c4d64785458467863594875645a496b7a594551377161554172766458674168724d764a79564730346a7078346b525a6c75556c6f30614e756f76727656705a57526e42474238424146435078334e673071524a69527332624f6a334f4230786f7065576c6a4b43494878754d706c573956527673396d574b597279586c70616d686c43574f64774f4237526b71396572392b4d4d6161434947775a4b4a38564652574d71717150535a4b306868437941324e386d7566355536496f66716971617448557156506c455357367a2b664c686844577a5a67786f386648474d5a344979466b6e53524a3232525a7669734e323576352f66374d6d4a6759393042796e54783573706e6e2b57747061576e555a444b74474b787238746c6e6e7a486a786f317a577979576b74766a6572334e5a6973644d614a4c6b72545a6144532b326c75394b496f664b6f7079414346304f694d6a773941586e2b6e70365536475961365a544b615842354b727171707a4d7a4979714e5070704c4778735865743967325775643375524954514b5976464d6d446e6f316e75766271366d723178343061686f696a62653276446352787061576c4a745671747a337a313156642f37347666303664504634624459584c35386d5854774c45466f4b32744c556d7631344f6d70715a4c61576c70513762647571367537747534754c6770502f2f3838384a674d446875494878714a72704f70344f555574486863507a55552f324d4754504574726132574a504a744b3675726d3566582f32327462564e316576313451456a656873366e5335515631634847496235613156563163332b3976643450446d694b4735392f6658582b35304650584c6b79486d6535393838662f37383676373237516d6172374c70644c713779747875392b5176762f787956796755436b49492b7878563565586c384f624e6d2b50613239752f4746435341494332746a62376d544e6e6743524a652b366c6630744c79395058726c3072652b4f4e4e7772767054394336473841415056652b6e61485a714a4443473843414e71626d35766c727555756c327436665833395870314f46775141674a392b2b716d31727a35726132754441414132464172314c51666452315258567a5068634669386465765739554167384a2f3334694d63446d6537584b342f58376c795a64363939473976622f637944444d676d7a3831457a307a4d374d6451766a4e78597358557a764c586e7a785266625370557576526b56462f54305143457a46474a2b545a646b624852326453676735355050357375664e6d3864594c4a5935587138337537765043786375544963513775766f364f6a333437656f7145684f536b72714d5a4a2b2b4f4548426b4a4943434666314e54552f46392f66552b66507431383438594e6d396c7372727835383262793875584c59582f36563156564d57317462662b43454b727537374637684a617a6434504273453653704d326476323032577a37444d47304f683250364f2b2b38772f49385879644a306e74367662365345484a4b454952616e3838336e654f3452676a6835666a342b462b386c684643617531322b78774177426f41774a752f646679636e4278465664553567694238456855566456575370453936616c6465586f35356e6d3979753933336c4365775743776c684a443961396173595246434c6550486a772f3270372f5035387546454a3539346f6b6e4269524470366e6f6672382f45304c5973486274576a5951435067356a6d7651362f56724b4b56673965725655424345526f504263464b53704f2f38666e387078334858596d4a696a68694e7870636c5364716d4b4d6f726e62346d544a6a675a6c6d324a537372532b6c4e39434e486a6a415a47526c2b5656586e456b4a32493451615a566e657264507062756e312b6e563565586b39587454526f30646e4167426f646e5a32596d2f6e5972666255777747772b4b616d68713274726232463474427369792f5a7a51615631464b675341496531525666617176317967704b636b414954787573566747624656525539465872466a42386a782f334f56796c554549542b7030756f37342b50685953696e4979636e42474f4f724c4d74536a4848482f506e7a6e524443526f5a6861434151534859366e586b496f564f64766c52566e537349776d354b4b6267742b6b5a46555a5942414e375736585262655a3676356e6d2b4553463055704b6b39327732572f374b6c537568772b484978526766703553437859735851306d5374756a312b724b75504556523341722b6b535a4e372b6b38536b744c496362346945366e612b4934726745685647657a32535a54537348537055736851756873584678634f715555474179475661496f767539774f504a346e742f6a64447037336643516b704b434353476679374b385a66587131514f576d74565564456f705542526c6855366e753257785749377a50502f6442783938774e77754a777a443341414155497878336650505038385351716f356a727577644f6c5358464a53516943456a636e4a79516d555569424a3074624f614c4a594c432f497376796578574c4a517769646c53547064612f586d7a353337747937456a786d73336d784c4d76624b6158416144517541774251414d43646846464f546f34424958525a555a51624a704f70714b647a4d4a6c4d5379524a6f67414171746672747a71647a69494934656e78343863724d544578695169687072567231374b55557544332b774d59347a71455549505261487762495853737079644d6648793867656635765953516a365a4d6d544a674b327961693536636e4578346e74386446525856595451616137754f37776b4a4351616454746342414b43694b4f362b66534e55794c4b3876374f4e4a456b666d38336d5263584678526768564f66332b394d707063447064433479476f33624b6155674b69727149355a6c462f5447775741776246455535655748486e7249437946734e42714e653369653339685a6237566179776768422f52362f54705246446433377a396d7a4a67676850424358467a6361777a445842733764717933387961554a4f6c395256475743594c775964632b7061576c3473795a4d2b565a733259786b6952394a497269746f4b43416b677042564f6e5470584e5a764e38684e4170575a5a666e7a4e6e7a6f44764739424d38494b43416949497769354a6b72617271726f4d41454374567575637a76716e6e6e724b68684369444d4e51515241714b4c327a4250756e7a6a617171763642454c4c4c6272635859597950464259577370525334484134537656362f65655555694149776947507835506647772b645472646245495435474f50444a704e703165314a567a576c464c7a777767734d49615447617257572b6e792b6249545132647a63334474524f586675584a59517373646f4e4b36534a4f6b31535a4c75634a73775959494b49577769684a7932577132393573375430744a6b51524232594978504959543233313544332b377a2b5649483639707249766a7332624f784941673742454834614f624d6d666a7878783833634278333157517950646154364161445954366c464e687374674b373362366f73303147526f5954517467696975497069385653336c6d4f45437149696f717132625a74472b5134726a4539505432324e793473792b354343423054424748507338382b7979516d4a735a6a6a4a752b2b6559624a6a342b50706e6a75417350502f797757464652775242433969714b636d6578785777324c305949485837797953636849655377795754365131666671717157595978335a575a6d69723932505a353535686b6d4e7a6333714e6672303664506e7a376771327161693536626d77734a495a2b496f76684a65586b35707053434d57504765426d4736554149485a383865544c754c6e7043516b4a65622f344d42734e6d6e7564723538326264796343665437665a497a7864316c5a5754614f34363556566c62326574476a6f364e4c4d63593759324e6a2f5a5253734744424170486a754d7454706b7a7879724a634b637479525766626d4a69592b4e746a385370465566364945476f4d42414b4a74322b6530364e476a657031646a2b63624567504e6e506d5443794b347365694b4f34594f3362736e5630794e70767445555652546b6d535647757857425a31467a30364f6a71685038664a7938744c4645577877655078504559494f6478666e70496b375851344843397a48486468334c6878767a68324d426a3043344a514b556c535a554a4367722b7a764c4b79636c423275555330364b6d7071537250382f734a4952394e6d7a62744639756958433758496b565274727664376b774959554e65587036685533534f3432356c5a47543036374f6c724b77734a3454776d73466732476b77474e62306c36764659706b4449615343494e526f4c644267324a436b59514f42514f4b333333353767424479312f7a382f43643237393464366c6f66436f586b6344683870613675376973493464654844783965424141414f7033757069524a2f3255326d2f75636677634167496b544a2f346b53644b2f74626132756930577939622b3873334c792f744c4f42774f4959546537322f66694d4267333155326d36304151746867743974376e6347794c4c75425a646b4b53696b49426f4d70454d4c4734754c69574a376e4c3565556c4f444235746a64556c4a5333417a4433444b5a54475644666579496a765248483330556d6b796d563571626d7a65717176703451305044662f54576c754d34455348554367414132646e5a33374173652b6e373737387641414345556c4a53426e78742f4c64773573795a4f537a4c737146516147542b5739566733456e4259444449382f7842555252337071536b32483672505144674e5144416e572f4d4655563578655078744541492f336666766e3244756a4f304a384d5948336137335274346e712f544f696f4877776255575770714b714d6f796749495959504659706c66555648524a38464d4a744d717656352f5a3465707757416f30656c3046414177355038596c5a3665376f635174697863754e444f6356784c55564752585775526871336f4d544578666b4c4935786a6a417936587131394c683671716c676d43734b767a743850684b414c2f534c384f2b657a5a5a444974454152683534454442316947595336597a655a65457a7552617663397069395a736f53315743794c7a7034397578396a7644637a4d33504b7558506e2f71632f506b776d30396364485230705656565644414141744c6132547648372f66644c375a3751317462327a7844436e646e5a326533686344683836644b6c59666c6c37333368667534596c3873316d65663541345351765445784d66324b37713557576c6f4b655a342f356e513679313075313277495965506f30614f5861524870474f4f6d354f546b78466466665a5677484864353071524a4137702f666a6859767a7473334c6952745671742b547a504830414948564e56746553353535363737386d57782b504a35586e2b7043694b74513648493933706442594f74656a467863564f6a754e61536b744c5a592f483432645a7471587a34386d525a4c2f5a6f4c4b796b696b6f4b46447364767330555254666842445745304c323275333277757271366b4762575773682b756a526f784e596c6d335976486b7a4e4a764e537a6f335a597730363758436244595843594c7750732f7a787a4847395953515862497350352b536b6a496b6a7a7374524b2b71717349637831324e6a6f352b41554c593650563665397770452b6e576134557379777373466b744a636e4a79594d75574c55502b69484f373359393133544178564761333230736b5358726635584c6c6169334f594e6d772f6239336a3864546675584b6c5a6b744c53327a744f5979306a4273583063755872786f434966446666702b37514836683245724f736478526742417339593852694b477265674949545048636656613878694a474c61695837313656596d4b696a71694e592b52694745724f736478646b56524c6d724e5979524338302b5665304d3448465a356e752f3378344950384e73596c714c76323765507658486a6875483639657350496e30514d4378465837353875617254366469464378632b69505242774c424d7a7354477875616550332b2b737257314e5535724c694d52777a4c536d357161627249737530317248694d56777a4c53483242774d53776a2f514547467739452f7833692f77456a7a4d74332b5470316f5141414141424a52553545726b4a6767673d3d, 'user', 11, 'active', NULL, NULL, NULL, 'bucoEmXYpHSEozvbkDAKPz1NUqkWJwlp7RwHDHlBoxiLMkiCmq89vWfD9vD8', '2015-11-27 03:05:07', '2016-02-02 12:13:14'),
(212, '212', NULL, '$2y$10$ofTz/48.u6cryDNPzYR1n.ExfsanjvCJdJOQDAChmIU/9PL74.Zeu', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'O1n1pWnqIzYCSBuRmvdH8d6eUSyGpIXeGpcn8UTCbIxQEpCrhkLZfN6CouRP', '2015-11-27 03:05:07', '2016-01-08 14:10:13'),
(213, '213', NULL, '$2y$10$V01DfsGT4hDsnFRC5XHVPuK5k0Zg6KKA8HvmT.QWg228e2iRaeAxS', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'RCq9tdL7pC50wOl8izWQh6Ob2PBFAE2fb0zVxi557QGCYh4L58UizKwIwlGJ', '2015-11-27 03:05:07', '2016-02-05 01:11:09'),
(214, '214', NULL, '$2y$10$cUlFFhJhQUji0heN7X6eIu977yf2Jn2EP7Eef9VRaUSawi70PbkO6', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:07', '2015-11-27 03:05:07'),
(215, '215', NULL, '$2y$10$1yJjrIi3oTQDTfSnf6Jnj.4WY4o3R5Pv25dwAaM1RNFUi5k9O2zrm', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:07', '2015-11-27 03:05:07'),
(216, '216', NULL, '$2y$10$tojyv7hGxk.kr3VGljs8Wu8LyEGRWum2dYwBeMEp0Ioc1MFm38QOK', NULL, 'user', 6, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:08', '2016-01-03 03:50:37'),
(217, '217', NULL, '$2y$10$3dAPKxLldm/F9ldsAoCL4uoInyDz92K15dLSIXEmxaewrdnAEh89K', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:08', '2015-11-27 03:05:08'),
(218, '218', NULL, '$2y$10$09krv30Z/xadH0VYMUrS6u9/pbYYZGxVnN.SAboyQVBj4gZOfwgje', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:08', '2015-11-27 03:05:08'),
(219, '219', NULL, '$2y$10$JZyu4Q4LYFKJPEDB1TfYDufR2wXTRhlfcFYfE/dSsQym1f82xRDLy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:08', '2015-11-27 03:05:08'),
(220, '220', NULL, '$2y$10$SdpF792I5yfewm30a.eALeDNKVBgMvYjBqt8YBjAlT/Hwy1nle36.', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:08', '2015-11-27 03:05:08'),
(221, '221', NULL, '$2y$10$bIp0qaXgP.XqAr1uclev1u29XwI4RSWQMnbGB2WUsgfP0tCKq8aiq', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:09', '2015-11-27 03:05:09'),
(222, '222', NULL, '$2y$10$4veRrDyXP6MrBQurBKURj.U8Uk2gB8.uPnR/u1jJof0BsR/RZb0JO', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:09', '2015-11-27 03:05:09'),
(223, '223', NULL, '$2y$10$LeWi7beSLq2fD7WMucFSAORq6LlU9HwlqUOX9FqJzqFX9BgLJsBpa', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:09', '2015-11-27 03:05:09'),
(224, '224', NULL, '$2y$10$2GTt4eaXlaf2nm3q6ARm3.V5amIiN6J9giJtCztNzNzczA4tvm78W', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:10', '2015-11-27 03:05:10'),
(225, '225', NULL, '$2y$10$OP3BI5yfoCujrqI4GkmXYeEbvTh44eWqcgpahwFpdYllmHM9kjoLS', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:10', '2015-11-27 03:05:10'),
(226, '226', NULL, '$2y$10$3kULf0QoHP/qfkk/feMRjepnjixsUojBx4Wf3nSJ.PVii6iFChWbu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:10', '2015-11-27 03:05:10'),
(227, '227', NULL, '$2y$10$nKE.mHByZOV0ViVyeTo/XeGgl4Zz.xzgKymZAzEPdgZFqd.OSAvwa', NULL, 'user', 7, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:10', '2016-01-03 03:02:04'),
(228, '228', NULL, '$2y$10$0OKoPin5cSSuVHnLJRQzc.wIPOrmxNjTlOR9daFk5kkGst7lzT2pK', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:11', '2015-11-27 03:05:11'),
(229, '229', NULL, '$2y$10$Mnfa5oPZ.nqo085gscn45.CChRshZhxdTnSWXs6OQgiuJAUOo1sI6', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:11', '2015-11-27 03:05:11'),
(230, '230', NULL, '$2y$10$1SoXx981c/5ToCiFUbYBuOrS3iYgFezb.nTzrj5WjDpVrdWlsZpxS', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'GRZHBh4feJf5Gxoe1DNYZzuoyCbyHYLa7wMpTX6igY4z9EGWZKnIywIrJzHc', '2015-11-27 03:05:11', '2016-02-05 01:11:24'),
(231, '231', NULL, '$2y$10$eQr2Fvh08oriIlxb3xSttOpIdgWSpskqBmp3LryrJ4tyAHKT0C.qG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:12', '2015-11-27 03:05:12'),
(232, '232', NULL, '$2y$10$e5Kl1UXjxF3BQQC4OvgjLOK1uj/oGTM6.voUrtwbi/ToxeWYWzVAy', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'tN6GDfPBGZOK2DaK54b0cSGtTm8Nlc6ZdTbGNoUssyBDsfSV1LWNZhUxpzME', '2015-11-27 03:05:12', '2016-01-14 03:25:52'),
(233, '233', NULL, '$2y$10$dzy/U12YR7bDROYaJebS1O2bn3/x2ohVOeQ9Sp6/9PBk3ctXoO5ru', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'TcR1PMKBBMXltz9nofzROy9azfUkar9T05PYBUwrm6LVvDNMay1PUkWdoyxI', '2015-11-27 03:05:12', '2016-02-05 01:11:34'),
(234, '234', NULL, '$2y$10$Wn3bUGExhM3j5.pUCUs/bugoAaooYym3COjTd8NxW93WkYA0bDrKC', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'KUzAERqwhYgxK5H4lDT6cV41uE53UVgbqdhRtTGKAUspA7BZAQmP3F80wRG6', '2015-11-27 03:05:12', '2016-02-05 00:52:37'),
(235, '235', NULL, '$2y$10$iYcD967OGRzqMOie09osluvEn5dgxg73W4c7K4xmH61SA/JwQr16a', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'Bm391AAEOgUgxNFJ90dpHuwwHZvxQmMKAboH3YoB9PCYSEZYExP4fFSVWaad', '2015-11-27 03:05:12', '2016-02-05 01:01:30'),
(236, '236', NULL, '$2y$10$5c8fYuF1gF4Is2LC83WvRu948waoMlejl4tp4.9ArQp6BmgyQEhB6', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'u64TZHjrFDfgEdWNNFDetEmpOYxlqXSzMTwQRQpTopkgUpq92QpjCuA0e1RU', '2015-11-27 03:05:13', '2016-02-05 00:52:47'),
(237, '237', NULL, '$2y$10$9bIFcSvm/jhLWFQRebgzAuwPNtbS16Svhr3Z/6cRphX8Tws8Hwp3q', 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e535568455567414141483041414142454341594141414373395470414141415036556c45515652346e4f3164653342543162372b72625858336e6b307a2b62564a6d6e5453644b51506d67726253677442656f70344b5769494b577431674e6145414546785476674b4d4a55524845597838467a5550427873584c78776969576f6b643073484c5444675049595867346974364b57725548454f6a37615568333176306a43635052706d3251736750744e2f50397738363331362f725732767439515a52536d4555497774593641424763654d7861766f49784b6a704978436a706f39416a4a6f2b416a46712b6843526b35507a6c36536b704530616a575933777a44376a55626a366b63666664517364467a58424572704b41666774476e544648467863533879444e4d4e414251412b414170777a4364466f746c343953705536564378786b4f425138676b726c7734554a705445784d4e51447747474f50302b6e636d4a47524d58334d6d44485459324e6a74774f4146794845617a5361392b362f2f3336743050474f6d6e34646d4a2b666e77634176466773626b3950542f2b50337a2f5079636b7035446a755041425176563566585652556849574f655367632f615950675072362b6a7342414974456f73507a35382f2f3339382f50337a343843644f702f4e2b6c6d57374c6c32364e50507332624e2f4553444d38434630715974553575586c5959314755773841644e7934635574432f63377464684f6a3062674e414b68476f366c7a75393263304c4866636a58396e5866654955366e633770476f7a6d6756437272636e4e7a6a634f527a746978597a4f616d357674456f6d6b52537156316f62365858352b666c396959754a6d516b686261327672684a5572562b5950527a7a5846554b58756e425957566e4a3265333264516768447742516d557857623756613434636a4c6150522b425141304b696f7145505631645869775834664578507a447743675a724e35683944354e4267464432436f584c35387564526b4d6d314543486b5a68756d32322b3150465263587134596a7252392f2f424872644c6f6a41454364547565616f5768535531506e4949523469555279747179734c45486f2f4c727054642b7759594e597039507451416a78684a4465784d54456834637a7662567231316f4a496132456b4e374d7a4d79386f57683237646f6c6c55676b357747415430744c47396234526f547053556c4a44774d414a5951304f78794f6d634f6433705170552f494a495236575a63392f39746c6e305550567863624762674941716c416f2f6c4658563065457a72645176436b36636b314e54513841414d5448782f39586658333978384f6448715830537236774c44746b6e63766c716745417742696e627432364e586f595172737569486a545330744c78376530744753774c4e74684d706c3243523350514768716176716e53435471616d7472692f2f707035386351736354436846762b76486a782f4e346e70647948506639327256727637345261583733335863796e7565787a2b66376a564c3632314231303664503731437056436341414463334e3038657868442f4849542b766778477456706441774130495346683434314b4577447542662f6979706c77745871392f6955416f4671747475724167514d524f53306230545639392b37647174376558697443794b665661673964797a747161327478576c726165497a78476b4c493676486a78383964764869785969434e3157727477426a334d517a4448546c7952425a4f65736e4a7966554141474b7832467862573075754a656268526b5362766e2f2f666a3347574945513670733161396150346570726132764a6f6b574c6e767a6d6d32384f55457258387a7a2f7772466a78335a2f2f5048484737647332524c7962382f4e7a6233494d4d786c516f6a30364e476a595858494343472f416742345042373930614e4849394a30775a75616757697857435951516e6f426f5076516f554f4b635055354f546e354c4d74324d677a6a5553715657385669385561456b4a646c32633648486e724947457233367175764a684243326a6d4f367977754c6834585a764f6541514138777a43394b70564b4a6e5165336e544e2b36564c6c7a696535776b4139456d6c30694633714141415470382b6a657672363875395871394d713958754b5373726533547030715576796d53792f2f4e3676624b616d707243554e71556c4a516d6e382f58772f4d383938555858345256302f5636665a644549756e6765563563586c3675445564376f784452706d646c5a585749524b4c6645454a63573175624b687874536b714b7236576c78516341634f48436861597457376234656e703643454b4941774251713955396f6254352b666c644c4d743238547a5039666232686d55637874694845414941414a5a6c497a4a2f497a4b6f494449794d6a6f5968756c42434f474442772f717739557246496f654141435a5443594441506a71713639534f7a733772527a4864566b736c73384730736247786e3448414b44583632384c4a38334c6c792f726533703646427a48645833797953644e34635a3849784452706a75647a72612b7672347553696e5a73574f484d3179393357372f47514241725661624b79737253554e44777a325555714a57717a2b664e6d3161323042616a38666a4267426f61476a492b2b696a6a7a6741674c71364f6e7a733244487851447144775a414d4146696a306679596e5a31394f64795962776945376c514d52715052574130413147617a7652797564744b6b53535541774b7455717361696f694a39644852306346504551344e706e336a6969517a774c3631654b69676f7347646e5a79644c70644c6a456f6e6b2b4b524a6b35796864467174396955416f4e485230627633376473586b655030794278535841574f34773442774f796d70716263634c57584c312f2b7030516961577072617a4e65764869787571576c785336525343354b70644c5042394e2b2f2f333358797355696c38374f6a70697a70303756393759324a6a6230394d7a6a6d585a46712f5832323974333774334c2f483566413441414a5a6c767938734c505346472f4d4e6764436c626a424f6e4468784b734d7748704649645061565631364a435564625731744c6f714f6a5077514169684369414541744673754c6c5a575651367142426f4e68467742516a4445462f7777644e52714e66334f37336633716934754c705871392f6c73416f4e4f6d545373524f753943556641414275503237647631474f4e57516b6876636e4c796b4e613272325a4752735a636a4c454841436a486357667675757575684b486f4e6d33616841304751325851624143674c4d734f4f47366650486d796e6d4759586f535131324b7870417164643645593052303541494435382b6466564371562f2b727236784e6a6a465044315a65576c745979444e4d45414b4253716234704b536e35313243615536644f346332624e37393434634b462b56662f4f3657305a2b484368622b45306c6b734667665038324b6c55766d72792b574b794a34374145522b546165556773316d71775141616a4b5a4b7350567071616d4c6b41496563472f4361505435584a4e486b7a6a6344676552676a31496f533867526c42437636576f6e3356716c55684f3345576932555a414643355848356f35383664672b367245347143427a41554f70334f6538472f45624a687a7077354961645066382b696f714c6f714b696f4c774741537156534367425570394f39392f7272722f6537713657696f6f4a597264625647474d762b413877374a664c3551654370694f4576467174746a42556572477873627344757265457a724f6233765479386e4b465843342f44774238566c6257583465696565757474374446596c6b482f684d7150302b66506e302b41504163783756506d54496c4c66693730744a5337704648486a476e704b544d4e5a6c4d623178315a71302f3867417770372f3031713564617953456444494d34306c4a53666e44615a68496f754142444a566d73336b542b413855664670525554486f67514b58797a575a5a646c75686d45384a7050703773636565347a5461725531675a70596c5a6157746a49714b75702f4e42724e7438486d50306952534e53705671767252534c524162505a2f4a35494a476f647a485372316670556f4455362b6662626230666b5173744e5a2f716b535a50474d777a6a49595430466859574474677a5872392b765549756c3538472f3261474d7961546159334659746b64504864326463306c6848534c7865494c4d706d4d4277437156437272636e4a7945746174573664777539323470716147794f56796431426a735667323956504148444b5a37457a672b5a4e4335395574592f727131617646306448524e514241342b4c692f76444e724b71716b72706372676b4f68324f465671766433312f7a6a4448324d677a6a435253474f72505a504b656b704354356a546665304d766c386e6145454a2b556c50546737392f7463446a2b4d31444c715551692b586e5772466e6d344c506262373839546146516642586f4e787866746d785a57484d4a6f36595077765430394e6b5959792f4c7370307a5a73784963376c63575361546159585a624b346d684a77504768717378527a482f524162472f7570537156614e32584b6c4c734c4367724d446f666a4a664366524b6b4c7674646d737a30562b5061665762703036522b4f48433961744d6a4f7375796c344876486a426e7a4a4b55555a7379596b524556465655666143474f7a7073336231684f32347759302b2b3838303546344474654935504a7168304f78392f476a426d7a6a57585a627642506c48514861312b67466e763065763050444d505151453365765766506e6a396346684166487a3856592b7868474b5a317a35343930513838384941784b697271427744676b354f546c34574b783251796652684d697842794954457863623145496d6b4d70485777754c6a59504678354d574a4d312b763138534b52364d494150656d725a38716f5371577130757631565142417857497858626c795a622f6a365a6466666c6b76456f6c2b52676835783430624e7a4d784d58457541504253716654734278393845504a4769657a73374a6e3939655a564b745742724b797369472f53727961694e444a766a44783136685265736d524a32756e54702b396a47415a304f6c316e5330754c334f667a4f546f364f6d62366644354d43506d7472362b50412f3853385a585a5255494973437a3774567174506b557050566861576e7134753776376d7a6666664e4d48414741796d543438642b3763335461623764584f7a6b377878597358487a4b627a6538324e6a624f437858503372313775586e7a356a5632645858703157723143597a78595a764e566763416e783839656e54415a6471496739436c4c6c7936335734787833454e414d42627264612f566c56566152392f2f5046636c55703146767844706d2b6a6f714b2b5a466e32796b77614150427174627265614453754b53676f534855366e51764158377462465172466551436732646e5a6734372f745672744e674367617256366d3944353847636f65414458776f5345684f336737385658556b72687474747565775438342b734c65586c35475a7333623559366e553648792b5571302b6c3072796b556969746a6359376a3270564b35576d45454839566f61434c4679394f4779786468384f78496d443677573362746b58734e4f73746162725a624634412f6d2f3373654c6934676b73797a596a684c774f68324e6c663739766147676757566c5a6553615461577455564e545041483859796e6b30477332674278564c536b6f6d417742567156534e425155466571487a5955535a2f765454547764337458686a596d4a6177642b44726e6e6d6d576347764e724c3758626a32624e6e6135314f5a306c4d544d795673547a4c7372324a69596b4c7973724b4274544878386362575a62745267683563334e7a493362703946593158637878584766514e4a4649314837484858665977336e48374e6d7a6f316d573759522f37346b6679637a4d4c4853373366307579437862746b796d302b6d2b445051424868513648306155366375584c38647863584648494c44796c5a7161477649696f464373714b6767426f4f684767497a61584b352f4d76412b7a7a78386647627938764c2b37336c776d41776241594147684d54552f3363633839463542363477526a786d796a3641386478754c6533567777416f465171542b546b35507833754f393439746c6e2b2b4c69347035527139562f7a387a4d584c78677759497052715078615a5a6c662f766c6c312b57376475337236713876447a6d397a7154796651687872697675626c354b734d774135364a693167495865717568556c4a535539436f466e573658546650766a67673245666551724669524d6e5470564b70576641502f7a3749536b7036642b32614b316174556f626e48724e794d6934562b69387542594b486b4334764f2b2b2b2b78587a3952686a4430696b576a494779754777726c7a353970564b745568384866796d6d303232344a3333333333536c4d6548782f2f46766858314e34544f6a397565644d624768717730576a6347716946775155514c77426356394d707066442b2b2b2b4c64547264646f51516a7844794a69516b7241382b4d35764e397749414c784b4a666a6835386d54453369317a5335672b59634b4563537a4c74694b452b4f546b354355427734664664456f7072466978516d7730476c2f414748735151727a5a624837686e6e76753457624e6d6a574f3437684f516b6a376867306272454c6e7979317475746c7333677a2b4d666b686a754d536874743053696d6350486b53573633574a517a4464434f4565495042734c32696f734a4d43476e4547487674647676645175664c4c5774365556475256716c556e6745414f6e62733241575a6d5a6d35344c2b537531636b456733724b74664a6b796478656e723654454a496536444756397274396f4d415147303232316168382b61574e523041724d4761585668596d4b78514b44344641476f77474b725872466c7a517937687a63374f4c755134726a3351326c44776a2f4650762f626161384e79632b57494e31327456736354516a6f42674a664a5a413367587a79354e474843684e77624755647963764a636c6d586267364d4873566a634f6e6e79354a7471536c62774149624b545a73326b5953456842654471324e4b70664a30656e72366f416358726a64506e4469426b354b5335684a435769457749796956536d396f77527378706c4e4b34666e6e6e3864547030346472314b70796e627533436e6f2f35737964757a5944496644736446717463375a74322f6654545673693969644d364d5950747955632b2b6a2b484d594e583045597454304559685230306367526b3066675267316651526931505152695038482b6a7a536f577564544a7741414141415355564f524b35435949493d, 'admin', 11, 'active', '2015-12-02 13:23:27', '2015-11-28 23:18:32', '::1', 'iRSxvSzwnAr6Lv2ZjZ6NHwczOQfTo7QOMup3LjmT7HQFvz6lfNefxR91lkF1', '2015-11-27 03:05:13', '2016-02-04 12:44:06'),
(238, '238', NULL, '$2y$10$CdxJZzXztQ5bNHjIos1pLOofwTYnDQX0vWmmMgsyGfsZz8DXra.JO', NULL, 'user', 8, 'active', NULL, NULL, NULL, 'p4cofq8vTAkAV26479R0htBaeJMw49zH6dJQYxkXQyH2UzPSx0zt3NhiDZDx', '2015-11-27 03:05:13', '2016-01-08 14:22:29'),
(239, '239', NULL, '$2y$10$03a.nIw8lRg7GeOY7l1Wm.mouiyLWo/yY3qZ0lD32A0xlE4nMR2FS', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'BRcAYWSb7Viv19XXm3etwIIvUQvlrGOal9LQYYfwf8EEhQscHrUnNsG5I6tY', '2015-11-27 03:05:13', '2016-02-05 01:11:51'),
(240, '240', NULL, '$2y$10$7q3IEP9dPqM2QcnJw9GzCeng6zsYQh.LhdmnMIbfssotuQ0FchevG', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'h8gUBQnr21rUlYFb5RMfJzpKZMaKvypdtnop8YJXWCq8kj0VEUZdXOpeXNVF', '2015-11-27 03:05:14', '2016-01-08 16:02:30'),
(241, '241', NULL, '$2y$10$JnijqiJ8jIYWAeCY.18yHOxo6kS0JnnX9jSFMPYkqy5R8OrBo1suy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:14', '2015-11-27 03:05:14'),
(242, '242', NULL, '$2y$10$f4d28PYJlNwqj.mLXw/hiuc0drG44UlQM0Mr57K.lEhDLDRLGNL3u', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:14', '2015-11-27 03:05:14'),
(243, '243', NULL, '$2y$10$CQ9DEHVn3vJDHh2lkRN0pechEaAWPqAKKlmMKPZs99mYTGG/dfYb2', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:14', '2015-11-27 03:05:14'),
(244, '244', NULL, '$2y$10$.wHZrDl5chLsTUcTqxhP5u06f5mbQhWRmE5CZv21ZRkLHOocwq2Sy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:14', '2015-11-27 03:05:14'),
(245, '245', NULL, '$2y$10$cVJwsBaHvEgYF0/KuoZ8p./c4uMBKjI.crDl5xqq/KmrCBdvlObxW', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:15', '2015-11-27 03:05:15'),
(246, '246', NULL, '$2y$10$ZJFUz0p/c0rEhupr4Br3ieWwFHL3iYGILiqCOLr5jFpEinwUDRRXy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:15', '2015-11-27 03:05:15'),
(247, '247', NULL, '$2y$10$/X6VVAwQsBbYBxhDXC7ZVuCVMYyUVEtrB5cQLyYsV96jGP/aXlgZ.', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:15', '2015-11-27 03:05:15'),
(248, '248', NULL, '$2y$10$g0RosRLfx5IYLh.EltPNVeDXC5KWLGBCZ./RcvDcZWthhtAeaD4Ly', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:15', '2015-11-27 03:05:15'),
(249, '249', NULL, '$2y$10$n951iSzfonrpEsTMxoXcAubOXRApxAqD/8gAcztbKn7vcs.hNigGC', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:16', '2015-11-27 03:05:16');

-- --------------------------------------------------------

--
-- Table structure for table `hris_user_positions`
--

CREATE TABLE IF NOT EXISTS `hris_user_positions` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `position_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_user_positions`
--

INSERT INTO `hris_user_positions` (`id`, `user_id`, `position_id`, `created_at`, `updated_at`) VALUES
(2, 3, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 7, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 8, 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 9, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 13, 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 237, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 14, 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 15, 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 16, 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 17, 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 18, 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 19, 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 21, 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 22, 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 26, 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 27, 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 28, 20, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 29, 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 5, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 31, 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 33, 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 35, 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 36, 26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 38, 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 39, 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 43, 21, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 44, 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 45, 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 46, 25, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 48, 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 50, 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 57, 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 58, 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 62, 44, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 63, 44, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 64, 44, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 60, 45, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 211, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 144, 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 203, 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 127, 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 232, 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 126, 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 212, 23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 41, 28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 201, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 204, 27, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 131, 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 149, 31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 194, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 238, 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 68, 45, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 97, 45, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 93, 42, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 65, 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 95, 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 96, 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 230, 40, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 20, 40, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 206, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 234, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 213, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 116, 35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 233, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 100, 33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 78, 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 73, 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 115, 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 180, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 227, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 236, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 80, 43, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 109, 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 91, 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 153, 40, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 165, 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 125, 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 161, 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 199, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 113, 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 152, 40, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 87, 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 86, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 67, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 79, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 122, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 178, 40, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 74, 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 81, 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 85, 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 88, 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 103, 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 107, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 70, 41, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 71, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 235, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 59, 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 111, 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 72, 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 216, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 105, 39, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 1, 32, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 211, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 11, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 178, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 79, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 60, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 1, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 67, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 57, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 58, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 72, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 73, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 78, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 100, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 115, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 153, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 180, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 208, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 234, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 236, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 86, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 87, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 111, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 113, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 125, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 161, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 165, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 199, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 62, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 63, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 64, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 70, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 74, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 80, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 81, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 85, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 88, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 91, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 103, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 105, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 107, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 109, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 152, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 235, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 20, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 50, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 59, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 65, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 68, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 93, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 95, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 96, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 97, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 203, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 206, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 213, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 230, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 233, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 239, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hris_configs`
--
ALTER TABLE `hris_configs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hris_departments`
--
ALTER TABLE `hris_departments`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `departments_code_unique` (`code`);

--
-- Indexes for table `hris_department_heads`
--
ALTER TABLE `hris_department_heads`
 ADD PRIMARY KEY (`id`), ADD KEY `department_heads_department_id_foreign` (`department_id`), ADD KEY `department_heads_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employees`
--
ALTER TABLE `hris_employees`
 ADD PRIMARY KEY (`id`), ADD KEY `employees_user_id_foreign` (`user_id`);

--
-- Indexes for table `hris_employee_accumulated_leaves`
--
ALTER TABLE `hris_employee_accumulated_leaves`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `employee_accumulated_leaves_employee_id_unique` (`employee_id`);

--
-- Indexes for table `hris_employee_address`
--
ALTER TABLE `hris_employee_address`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_address_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_approval_heirarchies`
--
ALTER TABLE `hris_employee_approval_heirarchies`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_id` (`employee_id`), ADD KEY `recommending_approval` (`recommending_approval_id`), ADD KEY `approved_by` (`approved_by_id`);

--
-- Indexes for table `hris_employee_child`
--
ALTER TABLE `hris_employee_child`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_child_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_civil_services`
--
ALTER TABLE `hris_employee_civil_services`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_civil_services_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_educations`
--
ALTER TABLE `hris_employee_educations`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_educations_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_leaves`
--
ALTER TABLE `hris_employee_leaves`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_leaves_employee_id_foreign` (`employee_id`), ADD KEY `employee_leaves_recommending_approval_foreign` (`recommending_approval_id`), ADD KEY `employee_leaves_certified_by_foreign` (`certified_by_id`), ADD KEY `approved_by_id` (`approved_by_id`);

--
-- Indexes for table `hris_employee_leave_credits`
--
ALTER TABLE `hris_employee_leave_credits`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_leave_credits_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_non_academics`
--
ALTER TABLE `hris_employee_non_academics`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_non_academics_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_organizations`
--
ALTER TABLE `hris_employee_organizations`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_organizations_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_parents`
--
ALTER TABLE `hris_employee_parents`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_parents_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_personnel_leave_card`
--
ALTER TABLE `hris_employee_personnel_leave_card`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `hris_employee_personnel_performances`
--
ALTER TABLE `hris_employee_personnel_performances`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `employee_personnel_performances_employee_id_unique` (`employee_id`);

--
-- Indexes for table `hris_employee_q_c_es`
--
ALTER TABLE `hris_employee_q_c_es`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `employee_q_c_es_employee_id_unique` (`employee_id`);

--
-- Indexes for table `hris_employee_references`
--
ALTER TABLE `hris_employee_references`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_references_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_skills`
--
ALTER TABLE `hris_employee_skills`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_skills_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_special_leaves`
--
ALTER TABLE `hris_employee_special_leaves`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_special_leaves_employee_id_foreign` (`employee_id`), ADD KEY `employee_special_leaves_processing_personnel_foreign` (`approved_by_id`), ADD KEY `employee_special_leaves_recommending_approval_foreign` (`recommending_approval_id`), ADD KEY `employee_special_leaves_certified_by_foreign` (`certified_by_id`);

--
-- Indexes for table `hris_employee_spouse`
--
ALTER TABLE `hris_employee_spouse`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_spouse_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_training_programs`
--
ALTER TABLE `hris_employee_training_programs`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_training_programs_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_utilities`
--
ALTER TABLE `hris_employee_utilities`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `hris_employee_voluntary_works`
--
ALTER TABLE `hris_employee_voluntary_works`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_voluntary_works_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_work_experiences`
--
ALTER TABLE `hris_employee_work_experiences`
 ADD PRIMARY KEY (`id`), ADD KEY `employee_work_experiences_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_failed_jobs`
--
ALTER TABLE `hris_failed_jobs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hris_forms`
--
ALTER TABLE `hris_forms`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hris_jobs`
--
ALTER TABLE `hris_jobs`
 ADD PRIMARY KEY (`id`), ADD KEY `jobs_queue_reserved_reserved_at_index` (`queue`,`reserved`,`reserved_at`);

--
-- Indexes for table `hris_logs`
--
ALTER TABLE `hris_logs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hris_messages`
--
ALTER TABLE `hris_messages`
 ADD PRIMARY KEY (`id`), ADD KEY `messages_sender_id_foreign` (`sender_id`), ADD KEY `messages_message_group_id_foreign` (`message_group_id`);

--
-- Indexes for table `hris_message_groups`
--
ALTER TABLE `hris_message_groups`
 ADD PRIMARY KEY (`id`), ADD KEY `message_groups_owner_id_foreign` (`owner_id`);

--
-- Indexes for table `hris_message_group_members`
--
ALTER TABLE `hris_message_group_members`
 ADD PRIMARY KEY (`id`), ADD KEY `message_group_members_message_group_id_foreign` (`message_group_id`), ADD KEY `message_group_members_user_id_foreign` (`user_id`);

--
-- Indexes for table `hris_message_informations`
--
ALTER TABLE `hris_message_informations`
 ADD PRIMARY KEY (`id`), ADD KEY `message_informations_user_id_foreign` (`user_id`), ADD KEY `message_informations_message_id_foreign` (`message_id`);

--
-- Indexes for table `hris_notifications`
--
ALTER TABLE `hris_notifications`
 ADD PRIMARY KEY (`id`), ADD KEY `notifications_sent_to_foreign` (`sent_to`), ADD KEY `notifications_sent_by_foreign` (`sent_by`);

--
-- Indexes for table `hris_password_resets`
--
ALTER TABLE `hris_password_resets`
 ADD KEY `password_resets_email_index` (`email`), ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `hris_positions`
--
ALTER TABLE `hris_positions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `positions_name_unique` (`name`);

--
-- Indexes for table `hris_sessions`
--
ALTER TABLE `hris_sessions`
 ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `hris_settings`
--
ALTER TABLE `hris_settings`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `settings_user_id_unique` (`user_id`);

--
-- Indexes for table `hris_todos`
--
ALTER TABLE `hris_todos`
 ADD PRIMARY KEY (`id`), ADD KEY `todos_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_trainings`
--
ALTER TABLE `hris_trainings`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hris_training_participants`
--
ALTER TABLE `hris_training_participants`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `training_participants_training_id_employee_id_unique` (`training_id`,`employee_id`), ADD KEY `training_participants_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_travel_orders`
--
ALTER TABLE `hris_travel_orders`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `travel_orders_travel_order_number_unique` (`travel_order_number`), ADD KEY `travel_orders_employee_id_foreign` (`employee_id`), ADD KEY `travel_orders_finance_director_foreign` (`finance_director_id`), ADD KEY `travel_orders_recommending_approval_foreign` (`recommending_approval_id`), ADD KEY `travel_orders_approved_by_foreign` (`approved_by_id`);

--
-- Indexes for table `hris_users`
--
ALTER TABLE `hris_users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_username_unique` (`username`), ADD UNIQUE KEY `users_email_unique` (`email`), ADD KEY `users_department_id_foreign` (`department_id`);

--
-- Indexes for table `hris_user_positions`
--
ALTER TABLE `hris_user_positions`
 ADD PRIMARY KEY (`id`), ADD KEY `user_positions_user_id_foreign` (`user_id`), ADD KEY `user_positions_position_id_foreign` (`position_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hris_configs`
--
ALTER TABLE `hris_configs`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hris_departments`
--
ALTER TABLE `hris_departments`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `hris_department_heads`
--
ALTER TABLE `hris_department_heads`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hris_employees`
--
ALTER TABLE `hris_employees`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `hris_employee_accumulated_leaves`
--
ALTER TABLE `hris_employee_accumulated_leaves`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `hris_employee_address`
--
ALTER TABLE `hris_employee_address`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=219;
--
-- AUTO_INCREMENT for table `hris_employee_approval_heirarchies`
--
ALTER TABLE `hris_employee_approval_heirarchies`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `hris_employee_child`
--
ALTER TABLE `hris_employee_child`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=142;
--
-- AUTO_INCREMENT for table `hris_employee_civil_services`
--
ALTER TABLE `hris_employee_civil_services`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `hris_employee_educations`
--
ALTER TABLE `hris_employee_educations`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=317;
--
-- AUTO_INCREMENT for table `hris_employee_leaves`
--
ALTER TABLE `hris_employee_leaves`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_employee_leave_credits`
--
ALTER TABLE `hris_employee_leave_credits`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `hris_employee_non_academics`
--
ALTER TABLE `hris_employee_non_academics`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `hris_employee_organizations`
--
ALTER TABLE `hris_employee_organizations`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `hris_employee_parents`
--
ALTER TABLE `hris_employee_parents`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=219;
--
-- AUTO_INCREMENT for table `hris_employee_personnel_leave_card`
--
ALTER TABLE `hris_employee_personnel_leave_card`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_employee_personnel_performances`
--
ALTER TABLE `hris_employee_personnel_performances`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_employee_q_c_es`
--
ALTER TABLE `hris_employee_q_c_es`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_employee_references`
--
ALTER TABLE `hris_employee_references`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_employee_skills`
--
ALTER TABLE `hris_employee_skills`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `hris_employee_special_leaves`
--
ALTER TABLE `hris_employee_special_leaves`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_employee_spouse`
--
ALTER TABLE `hris_employee_spouse`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `hris_employee_training_programs`
--
ALTER TABLE `hris_employee_training_programs`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `hris_employee_utilities`
--
ALTER TABLE `hris_employee_utilities`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `hris_employee_voluntary_works`
--
ALTER TABLE `hris_employee_voluntary_works`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_employee_work_experiences`
--
ALTER TABLE `hris_employee_work_experiences`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT for table `hris_failed_jobs`
--
ALTER TABLE `hris_failed_jobs`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_forms`
--
ALTER TABLE `hris_forms`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hris_jobs`
--
ALTER TABLE `hris_jobs`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_logs`
--
ALTER TABLE `hris_logs`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_messages`
--
ALTER TABLE `hris_messages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_message_groups`
--
ALTER TABLE `hris_message_groups`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_message_group_members`
--
ALTER TABLE `hris_message_group_members`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_message_informations`
--
ALTER TABLE `hris_message_informations`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_notifications`
--
ALTER TABLE `hris_notifications`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_positions`
--
ALTER TABLE `hris_positions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `hris_settings`
--
ALTER TABLE `hris_settings`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=250;
--
-- AUTO_INCREMENT for table `hris_todos`
--
ALTER TABLE `hris_todos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_trainings`
--
ALTER TABLE `hris_trainings`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT for table `hris_training_participants`
--
ALTER TABLE `hris_training_participants`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT for table `hris_travel_orders`
--
ALTER TABLE `hris_travel_orders`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_users`
--
ALTER TABLE `hris_users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=250;
--
-- AUTO_INCREMENT for table `hris_user_positions`
--
ALTER TABLE `hris_user_positions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=163;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `hris_department_heads`
--
ALTER TABLE `hris_department_heads`
ADD CONSTRAINT `department_heads_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `hris_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `department_heads_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employees`
--
ALTER TABLE `hris_employees`
ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `hris_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_accumulated_leaves`
--
ALTER TABLE `hris_employee_accumulated_leaves`
ADD CONSTRAINT `employee_accumulated_leaves_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_address`
--
ALTER TABLE `hris_employee_address`
ADD CONSTRAINT `employee_address_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_approval_heirarchies`
--
ALTER TABLE `hris_employee_approval_heirarchies`
ADD CONSTRAINT `hris_employee_approval_heirarchies_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `hris_employee_approval_heirarchies_ibfk_2` FOREIGN KEY (`recommending_approval_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `hris_employee_approval_heirarchies_ibfk_3` FOREIGN KEY (`approved_by_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_child`
--
ALTER TABLE `hris_employee_child`
ADD CONSTRAINT `employee_child_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_civil_services`
--
ALTER TABLE `hris_employee_civil_services`
ADD CONSTRAINT `employee_civil_services_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_educations`
--
ALTER TABLE `hris_employee_educations`
ADD CONSTRAINT `employee_educations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_leaves`
--
ALTER TABLE `hris_employee_leaves`
ADD CONSTRAINT `employee_leaves_certified_by_foreign` FOREIGN KEY (`certified_by_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `employee_leaves_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `employee_leaves_recommending_approval_foreign` FOREIGN KEY (`recommending_approval_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `hris_employee_leaves_ibfk_1` FOREIGN KEY (`approved_by_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_leave_credits`
--
ALTER TABLE `hris_employee_leave_credits`
ADD CONSTRAINT `employee_leave_credits_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_non_academics`
--
ALTER TABLE `hris_employee_non_academics`
ADD CONSTRAINT `employee_non_academics_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_organizations`
--
ALTER TABLE `hris_employee_organizations`
ADD CONSTRAINT `employee_organizations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_parents`
--
ALTER TABLE `hris_employee_parents`
ADD CONSTRAINT `employee_parents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_personnel_performances`
--
ALTER TABLE `hris_employee_personnel_performances`
ADD CONSTRAINT `employee_personnel_performances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_q_c_es`
--
ALTER TABLE `hris_employee_q_c_es`
ADD CONSTRAINT `employee_q_c_es_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hris_employee_references`
--
ALTER TABLE `hris_employee_references`
ADD CONSTRAINT `employee_references_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_skills`
--
ALTER TABLE `hris_employee_skills`
ADD CONSTRAINT `employee_skills_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_special_leaves`
--
ALTER TABLE `hris_employee_special_leaves`
ADD CONSTRAINT `employee_special_leaves_certified_by_foreign` FOREIGN KEY (`certified_by_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `employee_special_leaves_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `employee_special_leaves_processing_personnel_foreign` FOREIGN KEY (`approved_by_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `employee_special_leaves_recommending_approval_foreign` FOREIGN KEY (`recommending_approval_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_spouse`
--
ALTER TABLE `hris_employee_spouse`
ADD CONSTRAINT `employee_spouse_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_training_programs`
--
ALTER TABLE `hris_employee_training_programs`
ADD CONSTRAINT `employee_training_programs_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_utilities`
--
ALTER TABLE `hris_employee_utilities`
ADD CONSTRAINT `hris_employee_utilities_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_voluntary_works`
--
ALTER TABLE `hris_employee_voluntary_works`
ADD CONSTRAINT `employee_voluntary_works_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_employee_work_experiences`
--
ALTER TABLE `hris_employee_work_experiences`
ADD CONSTRAINT `employee_work_experiences_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_messages`
--
ALTER TABLE `hris_messages`
ADD CONSTRAINT `messages_message_group_id_foreign` FOREIGN KEY (`message_group_id`) REFERENCES `hris_message_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `hris_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_message_groups`
--
ALTER TABLE `hris_message_groups`
ADD CONSTRAINT `message_groups_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `hris_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_message_group_members`
--
ALTER TABLE `hris_message_group_members`
ADD CONSTRAINT `message_group_members_message_group_id_foreign` FOREIGN KEY (`message_group_id`) REFERENCES `hris_message_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `message_group_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `hris_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_message_informations`
--
ALTER TABLE `hris_message_informations`
ADD CONSTRAINT `message_informations_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `hris_messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `message_informations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `hris_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_notifications`
--
ALTER TABLE `hris_notifications`
ADD CONSTRAINT `notifications_sent_by_foreign` FOREIGN KEY (`sent_by`) REFERENCES `hris_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `notifications_sent_to_foreign` FOREIGN KEY (`sent_to`) REFERENCES `hris_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_settings`
--
ALTER TABLE `hris_settings`
ADD CONSTRAINT `settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `hris_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_todos`
--
ALTER TABLE `hris_todos`
ADD CONSTRAINT `todos_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_training_participants`
--
ALTER TABLE `hris_training_participants`
ADD CONSTRAINT `training_participants_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `training_participants_training_id_foreign` FOREIGN KEY (`training_id`) REFERENCES `hris_trainings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_travel_orders`
--
ALTER TABLE `hris_travel_orders`
ADD CONSTRAINT `travel_orders_approved_by_foreign` FOREIGN KEY (`approved_by_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `travel_orders_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `travel_orders_finance_director_foreign` FOREIGN KEY (`finance_director_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `travel_orders_recommending_approval_foreign` FOREIGN KEY (`recommending_approval_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_users`
--
ALTER TABLE `hris_users`
ADD CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `hris_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hris_user_positions`
--
ALTER TABLE `hris_user_positions`
ADD CONSTRAINT `user_positions_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `hris_positions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `user_positions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `hris_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
