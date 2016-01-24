-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2016 at 07:31 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employees`
--

INSERT INTO `hris_employees` (`id`, `user_id`, `cs_id`, `first_name`, `middle_name`, `surname`, `name_extension`, `birthday`, `birthplace`, `sex`, `civil_status`, `citizenship`, `height`, `weight`, `blood_type`, `gsis_id`, `pagibig_id`, `philhealth`, `sss_id`, `cellphone_number`, `agency_employee_number`, `tin`, `photo`, `file`, `created_at`, `updated_at`) VALUES
(2, 211, NULL, 'Maria Bonjeavem', 'Geollegue', 'Labor', '', '1991-11-08', 'Lupon Davao Oriental', 'male', 'single', 'Filipino', 1.55, 65.00, 'o', '', '', '', '', '09177120837', '', '', '', NULL, '2016-01-04 18:40:47', '2016-01-04 18:40:50'),
(4, 5, NULL, 'Paulina', 'Tapangan', 'Baba', '', '1967-06-22', 'Algeria, Alabel, Sarangani Province', 'female', 'married', 'Filipino', 1.46, 68.00, 'O+', '', '', '', '', '09187679499', '005', '141-137-222', '', 'PaulinaTapanganBaba.xlsx', '2016-01-04 19:02:42', '2016-01-05 03:28:28'),
(5, 161, NULL, 'Marianne', 'Alimboyng', 'Rebortera', '', '1977-10-27', 'Panabo Davao Del Norte', 'female', 'married', 'Filipino', 0.00, 60.00, 'O', '', '', '16-050068405-1', '01-2002913-2', '', '161', '913-813-820', '', NULL, '2016-01-04 19:27:55', '2016-01-04 19:27:57'),
(6, 50, NULL, 'Rosario', 'Bantillo', 'Saligan', '', '1956-10-20', 'General Santos', 'female', 'married', 'Filipino', 4.00, 45.00, 'B', '', '1900-0004-7484', '16-000016482-1', '', '00920765180', '050', '141-137-738', '', NULL, '2016-01-04 19:47:13', '2016-01-04 19:47:13'),
(7, 78, NULL, 'Ruby', 'Vergara', 'Gonzales', '', '1955-05-27', 'Carmen, Cotabato', 'female', 'married', 'Filipino', 1.26, 67.00, 'B+', '', '', '', '', '', '078', '141-137-499', '', NULL, '2016-01-04 21:57:48', '2016-01-04 21:58:16'),
(9, 63, NULL, 'Julieta', 'Salarda', 'Abarquez', '', '1956-07-09', 'Victorias, Negros Oriental', 'male', 'single', 'Filipino', 1.50, 52.00, 'O', '', '1101-2102-4803', '16-000016118-4', '', '09213886535', '063', '141-147-206', '', NULL, '2016-01-04 22:05:08', '2016-01-04 22:05:28'),
(10, 111, NULL, 'Hazel', 'Alcoba', 'Gameng', '', '1975-11-01', 'Buhangin, Davao City', 'female', 'married', 'Filipino', 1.57, 74.00, 'B+', '', '', '', '', '09156962157', '111', '183-592-341', '', NULL, '2016-01-04 22:19:11', '2016-01-04 22:19:31'),
(11, 86, NULL, 'Souci Hannah', 'Saracing', 'Bedoya', '', '1977-02-11', 'Lianga, Surigao del Sur', 'female', 'married', 'Filipino', 1.50, 50.00, 'B+', 'B77DBSSB015', '1900-0004-7516', '16-000016855-3', '', '09195504803', '086', '906-006-608', NULL, NULL, '2016-01-05 19:43:54', '2016-01-05 19:43:57'),
(12, 87, NULL, 'Rogelio', 'Aguilar', 'Masangkay', '', '1969-08-24', 'Paranque, Rizal', 'male', 'married', 'Filipino', 5.00, 65.00, 'B+', '69081401080', '11011086741', '16000016823', '', '09209016224', '087', '102349415', NULL, NULL, '2016-01-05 19:58:31', '2016-01-05 19:59:45'),
(13, 125, NULL, 'Ian Val', 'Planos', 'Delos Reyes', '', '1976-10-11', 'Panabo Davao Del Norte', 'male', 'married', 'Filipino', 1.60, 70.00, 'A', '76101100649', '', '160251268867', '', '09214542129', '125', '919124275', NULL, NULL, '2016-01-05 20:14:24', '2016-01-05 20:14:26'),
(14, 165, NULL, 'Ariel', 'Octa', 'Gamao', '', '1974-12-23', 'Tagbilaran City, Bohol', 'male', 'married', 'Filipino', 0.00, 62.00, 'A+', '956-1009896-01-0', '1900-0006-4424', '', '33-1742066-8', '09328554730', '', '922-958-470', NULL, NULL, '2016-01-05 20:52:55', '2016-01-05 20:52:57'),
(15, 91, NULL, 'Evelyn', 'Jakosalem', 'Lumaday', '', '1964-01-25', 'Sulop, Davao del Sur', 'female', 'married', 'Filipino ', 4.00, 55.00, 'B+', '640122502239', '1900-0004-72-84', '16-000016609-0', 'N/A', '09063236451', '091', '141-137-551', NULL, NULL, '2016-01-05 21:41:36', '2016-01-05 21:41:38'),
(16, 237, NULL, 'Letecia', 'Lozada', 'Cubillo', '', '1978-07-22', 'Tagum City', 'female', 'single', 'Filipino', 0.00, 55.00, 'O+', '', '1900-0027-3532', '16-050158515-4', '09-2336814-6', '09062267741', '237', '286008590', NULL, NULL, '2016-01-05 21:56:17', '2016-01-05 21:56:19'),
(17, 57, NULL, 'Nancy', 'Ramos', 'Raiz', '', '1968-01-14', 'Magastos, Asuncion, Davao Del Norte', 'female', 'married', 'Filipino', 1.16, 72.00, 'A', '', '1101-018598-05', '16-0000169215', '09-1231365-2', '09207337541', '057', '142-594-490', NULL, NULL, '2016-01-05 22:12:38', '2016-01-05 22:12:39'),
(18, 103, NULL, 'Jean', 'Dasalla', 'Centina', '', '1961-10-29', 'Davao CIty', 'female', 'married', 'Filipino', 1.50, 50.00, 'O', '61102900242', '1900-0004-6940', '16000016280-6', 'n/A', '', '0103', '141-137-342', NULL, NULL, '2016-01-05 22:38:49', '2016-01-05 22:38:53'),
(19, 105, NULL, 'Edison', 'Quilisadio', 'Bernaldez', '', '1970-10-15', 'Davao City, Davao Del Sur', 'male', 'married', 'Filipino', 5.60, 90.00, 'B', 'CM00004619420', '', '16-000016152-4', '', '09167830177', '105', '143-568-086', NULL, NULL, '2016-01-05 22:51:22', '2016-01-05 22:51:24'),
(20, 116, NULL, 'Marilou', 'Delfin', 'Junsay', '', '1974-08-09', 'Sudapin, Kidapawan, North Cotabato', 'female', 'married', 'Filipino', 1.56, 60.00, 'O+', 'B74R9-MND01-3', '1900-0004-6985', '16-000016235-0', '09-1869427-8', '09182322176', '116', '916-094-217', NULL, NULL, '2016-01-05 23:33:02', '2016-01-05 23:33:05'),
(21, 64, NULL, 'Girley', 'Santiago', 'Gumanao', '', '1967-10-06', 'Davao City', 'female', 'married', 'Filipino', 5.20, 69.00, 'A', '67100600169', '1101-018577-02', '', '', '09084908356', '064', '', NULL, NULL, '2016-01-05 23:51:58', '2016-01-05 23:52:00'),
(22, 201, NULL, 'Jonathan', 'A.', 'Bayogan', '', '0000-00-00', '', 'male', 'married', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 13:10:30', '2016-01-08 13:10:53'),
(23, 3, NULL, 'Elivira', 'A.', 'Dignos', '', '0000-00-00', '', 'female', 'married', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 13:26:46', '2016-01-08 13:27:09'),
(24, 7, NULL, 'Felicidad', 'L', 'Forro', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 13:29:33', '2016-01-08 13:30:35'),
(25, 8, NULL, 'Jonathan', 'Hebra', 'Floro', '', '1956-06-26', 'Libertad, Tapaz, Capiz', 'male', 'married', 'Filipino', 1.55, 50.00, '', 'CRN-006-0060-6771-1', '', '16-0000-1634-5', '', '09096431163', '008', '141-137-431', NULL, NULL, '2016-01-08 13:31:24', '2016-01-14 01:50:48'),
(26, 11, NULL, 'Gemma', 'Guiral', 'Cervantes', '', '1974-06-27', 'Lianga, Surigao del Sur', 'female', 'married', 'Filipino', 0.00, 67.00, 'O', '7406-2700528', '1900-0005', '16-00016467-1', '08-21251596-6', '09219537530', '011', '905-927-917', NULL, NULL, '2016-01-08 13:32:19', '2016-01-14 01:10:22'),
(27, 144, NULL, 'Levi', 'Navarro', 'Martinez', '', '1976-04-24', 'Binabagan, Negros Occ..', 'male', 'single', 'Filipino', 2.67, 60.00, 'O', '109577424963', '1900-0006-1195', '160000619865', '07173735512', '09302772203', '144', '91-040-789', NULL, NULL, '2016-01-08 13:33:13', '2016-01-15 02:17:45'),
(28, 9, NULL, 'Fe', 'Enumerables', 'Benigno', '', '1962-12-17', 'Babak, Davao del Norte', 'female', 'married', 'Filipino', 1.52, 55.00, 'O', 'CM-3334164', '1101-018551-09', '16-0000-16138-9', '0924047673', '09216684085', '009', '141-137-255', NULL, NULL, '2016-01-08 13:34:57', '2016-01-14 01:07:25'),
(29, 13, NULL, 'Jinnah', 'T', 'Enumerables', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 13:36:24', '2016-01-08 13:37:24'),
(30, 12, NULL, 'Amalia', 'Monulngolh', 'Caballero', '', '1970-10-13', 'Alamada Cotabato', 'female', 'single', 'Filipino', 1.63, 60.00, 'O', '70091301235', '1900-0004-6939', '16-000016208-3', '16-1352690-0', '09195966383', '012', '906-006-536', NULL, NULL, '2016-01-08 13:38:09', '2016-01-14 02:10:36'),
(31, 14, NULL, 'Florida', 'Suan', 'Cerbo', '', '1958-01-15', 'Bucana, Lasang, Davao City', 'female', 'married', 'Filipino', 1.30, 58.00, 'B', '58-011502464', '1101-018561-06', '16-0000-16264-4', '09-0670720-3', '09053604673', '014', '141-137-368', NULL, NULL, '2016-01-08 13:39:07', '2016-01-14 06:26:42'),
(32, 16, NULL, 'Juana', 'Buladaco', 'Cabag', '', '1958-03-31', 'Bingcungan, Tagum City, Davao del Norte', 'male', 'married', 'Filipino', 1.30, 53.00, 'O', '58033001078', '1101-210277-07', '16-000016216-4', '09-2570251-9', '09216985759', '016', '141-137-327', NULL, NULL, '2016-01-08 13:40:30', '2016-01-14 03:38:32'),
(33, 15, NULL, 'Roselyn', 'Martin', 'Aviso', '', '1972-01-17', 'Surigao del Sur', 'female', 'single', 'Filipino', 1.20, 50.00, 'O', '720117000765', '1101-210256-04', '16-000016090-0', '10-0488234-6', '', '015', '180-767-832', NULL, NULL, '2016-01-08 13:41:52', '2016-01-14 02:19:42'),
(34, 17, NULL, 'Celia', 'Melicor', 'Garbosa', '', '1964-10-02', 'Nabunturan, Comval Province', 'male', 'single', 'Filipino', 1.55, 55.00, 'O', '64102901841', '1900-0004-7149', '16-000016358-6', '', '09495001906', '017', '141-137-649', NULL, NULL, '2016-01-08 13:42:55', '2016-01-14 02:43:45'),
(35, 18, NULL, 'Dionisio', 'Dolfo', 'Padrogane', '', '1962-06-10', 'Passi, Iloilo City', 'male', 'married', 'Filipino', 1.70, 56.00, 'O', 'B63LADDP015', '1102-210354-04', '16-00046026-2', '09-11473137', '09491457162', '018', '141-137-673', NULL, NULL, '2016-01-08 13:44:18', '2016-01-14 01:17:48'),
(36, 203, NULL, 'Karen', 'Lihay-Lihay', 'Catane', '', '1971-11-17', 'Padada Davao del Sur', 'female', 'widowed', 'Filipino', 5.30, 58.00, 'A', '71111701011', '', '06-000008778-8', '09-1720135-8', '09333553146', '203', '903-726-824', NULL, NULL, '2016-01-08 13:46:27', '2016-01-14 02:33:57'),
(37, 240, NULL, 'Medel', 'R', 'Silvosa', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 13:47:51', '2016-01-08 13:48:15'),
(38, 21, NULL, 'Conrado', 'Ganacial', 'Ganadores', '', '0000-00-00', '', 'male', 'married', 'Filipino', 5.00, 65.00, 'O', 'B-5SEW-CGG-01-3', '110121031405', '16-000016364-0', '', '', '021', '141-137-456', NULL, NULL, '2016-01-08 13:48:53', '2016-01-14 03:08:33'),
(39, 22, NULL, 'Emilio', 'Tanudtanud', 'Glimada', '', '1963-03-11', 'Pilut N. Cotabato', 'male', 'married', 'Filipino', 1.68, 84.00, 'O', '63031101711', '1101-108574-84', '160004633-47', '09-2401588-3', '09301526806', '022', '141-137-472', NULL, NULL, '2016-01-08 13:49:51', '2016-01-14 02:54:56'),
(40, 29, NULL, 'Rudelito', 'A', 'Sator', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 13:50:52', '2016-01-08 13:51:11'),
(41, 28, NULL, 'Cesar', 'Amado', 'Petiluna', '', '1951-02-24', 'Matag-ob, Leyte', 'male', 'married', 'Filipino', 5.00, 50.00, 'B', '51022402262', '110131455903', '16-000016773-5', '09-0612553-9', '', '028', '123-962-143', NULL, NULL, '2016-01-08 13:52:01', '2016-01-15 03:22:59'),
(42, 31, NULL, 'Dionisio', 'Salag', 'Namuag', '', '1960-04-01', 'Dimiao, Bohol', 'female', 'widowed', 'Filipino', 5.00, 4.00, 'A+', '60040102500', '1900-0004-7350', '160000116806-5', '03-7189886-0', '09232427010', '031', '131-536-549', NULL, NULL, '2016-01-08 13:53:27', '2016-01-15 03:06:22'),
(43, 127, NULL, 'Roldan', 'B', 'Junsay', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 13:54:39', '2016-01-08 13:54:59'),
(44, 43, NULL, 'Carmelita', 'D', 'Sato', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 13:55:42', '2016-01-08 13:56:01'),
(45, 232, NULL, 'Xavier', 'Ngoho', 'Lopez', '', '1978-06-28', 'Rizal Ave., Digos, Davao del Sur', 'male', 'single', 'Filipino', 0.00, 65.00, 'B+', '', '', '120-5041-99741', '09-2185784-0', '09081185162', '232', '234-536-595-000', NULL, NULL, '2016-01-08 13:56:32', '2016-01-14 03:25:40'),
(46, 120, NULL, 'Raquel', 'Juntilla', 'Edjec', '', '1977-10-01', 'Surigao City', 'female', 'married', 'Filipino', 1.68, 80.00, 'O', '77100100765', '100-005-6052', '19-0900108048', '09-2356651-1', '09387702218', '120', '919-215-217', NULL, NULL, '2016-01-08 13:57:40', '2016-01-14 01:40:34'),
(47, 34, NULL, 'Eldy', 'Gardose', 'Garbosa', '', '1962-12-21', 'Iloilo', 'male', 'married', 'Filipino', 1.50, 65.00, 'O', '62112102292', '1900-0004-7150', '16-000016348-9', '', '09495001906', '034', '141-137-464', NULL, NULL, '2016-01-08 13:59:00', '2016-01-14 03:07:08'),
(48, 33, NULL, 'Rolando', 'B', 'Lasquite', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:00:16', '2016-01-08 14:00:36'),
(49, 38, NULL, 'Melecio', 'Gabaya', 'Mendez', '', '1960-12-04', 'Quezon, Panabo City', 'male', 'single', 'Filipino', 1.50, 78.00, 'B', 'B61Y4-M6M-01-9', '1101-018591-08', '16-0000-16816-2', '', '09071798650', '038', '141-137-632', NULL, NULL, '2016-01-08 14:02:01', '2016-01-14 07:40:39'),
(50, 36, NULL, 'Jerry', 'Orevillo', 'Salinas', '', '1965-02-10', 'St. Nino San Agustin Surigao del Sur', 'male', 'married', 'Filipino', 56.00, 65.00, '', '65021001931', '1101-018601-09', '16-000016839-1', '', '09286595269', '036', '166-062-085', NULL, NULL, '2016-01-08 14:02:52', '2016-01-14 01:42:03'),
(51, 35, NULL, 'Avelino', 'P', 'Lanugon', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:03:54', '2016-01-08 14:04:22'),
(52, 46, NULL, 'Rodolfo', 'J', 'Ledesma', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:05:08', '2016-01-08 14:05:28'),
(53, 126, NULL, 'Marichelle', 'C', 'Maglinao', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:08:47', '2016-01-08 14:09:08'),
(54, 212, NULL, 'Leron', 'E', 'Odrada', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:09:41', '2016-01-08 14:10:00'),
(55, 45, NULL, 'Eutiqiuo', 'Laurden', 'Arceño', 'Jr.', '1968-05-09', 'San Agustin, Seirra Bulloees Bohol', 'male', 'married', 'Filipino', 5.00, 80.00, '', '006-00004-2480-0', '1101-018547-11', '16-000016094-3', '09-1354548-7', '09494140508', '045', '166-062-069', NULL, NULL, '2016-01-08 14:11:08', '2016-01-14 06:03:25'),
(56, 41, NULL, 'Gerry', 'O', 'Español', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:12:16', '2016-01-08 14:12:35'),
(57, 44, NULL, 'Rey', 'Bastasa', 'Turno', '', '1961-07-10', 'Babak Davao del Norte', 'male', 'married', 'Filipino', 1.62, 65.00, 'O', '006-00004-2461-9', '1900-0004-7604', '16-000016949-5', '', '', '044', '141-137-829', NULL, NULL, '2016-01-08 14:13:25', '2016-01-14 01:28:11'),
(58, 39, NULL, 'Maximiano', 'Venturado', 'Mendoza', '', '1965-07-19', 'Paloma, Leyte', 'male', 'married', 'Filipino', 5.00, 75.00, 'A', 'BG5DQK-MVM-01-8', '1101-099-389-05', '16-000030677-8', '09-1357988-0', '09173501074', '039', '133-822-215', NULL, NULL, '2016-01-08 14:14:27', '2016-01-15 02:38:39'),
(59, 19, NULL, 'Romulo', 'Olmos', 'Orma', '', '1954-10-30', 'Pototan, Iloilo', 'male', 'married', 'Filipino', 1.30, 51.00, 'O', '4404-5276-8924-0105', '110121035306', '16-00001800-6', '', '09304545815', '019', '141-127-665', NULL, NULL, '2016-01-08 14:15:25', '2016-01-14 01:59:07'),
(60, 26, NULL, 'Felma', 'A', 'Ruelo', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:16:26', '2016-01-08 14:16:46'),
(61, 204, NULL, 'Jay Roldan', 'Beatizola', 'Bañaria', '', '1975-09-12', 'Sasa, Davao City', 'male', 'single', 'Filipino', 1.50, 60.00, 'O', '2004098401', '1880-0079-2478', '16-050422214-1', '09-1716930-6', '09123810828', '212', '404-524-757', NULL, NULL, '2016-01-08 14:17:25', '2016-01-14 06:00:13'),
(62, 48, NULL, 'Nelson', 'Salvador', 'Cerbo', '', '1957-10-12', 'Imelda, Zamboanga del Sur', 'male', 'married', 'Filipino', 5.00, 71.00, 'O', '57101202412', '1900-0004-6963', '16-000016257-1', '09-0487134-8', '', '048', '906-006-543', NULL, NULL, '2016-01-08 14:18:21', '2016-01-14 06:23:20'),
(63, 131, NULL, 'Pondador Raymond', 'P', 'Saguran', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:19:34', '2016-01-08 14:19:53'),
(64, 1, NULL, 'Edgardo', 'M', 'Santos', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '001', '', NULL, NULL, '2016-01-08 14:20:22', '2016-01-23 06:28:30'),
(65, 238, NULL, 'Jo Mark', 'M', 'Libre', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:21:45', '2016-01-08 14:22:24'),
(66, 194, NULL, 'Glenne', 'Berja', 'Lagura', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:23:05', '2016-01-08 14:23:25'),
(67, 113, NULL, 'Reir Erlinda', 'E', 'Cutad', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:24:41', '2016-01-08 14:25:09'),
(68, 199, NULL, 'Ian Jay', 'T', 'Padios', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:25:48', '2016-01-08 14:26:07'),
(69, 68, NULL, 'Ma. Charito', 'Villanueva', 'Aba', '', '1956-03-04', 'Barotac Nuevo, Iloilo', 'female', 'married', 'Filipino', 1.50, 76.00, 'B', 'B57F4-CBA-01-2', '1101-0185-44-06', '16-000016123-0', '', '09081875933', '068', '141-137-192', NULL, NULL, '2016-01-08 14:27:48', '2016-01-12 07:08:31'),
(70, 97, NULL, 'Bernandita', 'Tripole', 'Rodriguez', '', '1967-05-06', 'Lianga, Surigao del Sur', 'female', 'married', 'Filipino', 1.65, 62.00, 'O+', 'B67K6BTR028', '1101-018609-04', '16-000016935-5', '0934368889', '09065771929', '097', '141-137-811', NULL, NULL, '2016-01-08 14:29:22', '2016-01-11 06:17:45'),
(71, 93, NULL, 'Zoilyn', 'Benban', 'Manuales', '', '1956-10-18', 'Barotoc Nuevo, Iloilo', 'female', 'married', 'Filipino', 1.52, 50.00, 'AB', '56101801948', '110221034407', '16-000016829-4', '', '09129302616', '093', '181-137-624', NULL, NULL, '2016-01-08 14:30:23', '2016-01-11 07:31:09'),
(72, 59, NULL, 'Quirino', 'M', 'Bero', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:31:29', '2016-01-08 14:31:49'),
(73, 65, NULL, 'Rogelio', 'O', 'Flores', 'Jr.', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:32:27', '2016-01-08 14:33:22'),
(74, 95, NULL, 'Sol', 'D', 'Sotomil', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:34:11', '2016-01-08 14:34:31'),
(75, 96, NULL, 'Joey', 'Paulo', 'Sotomil', '', '1963-02-06', 'Surallah, South Cotabato', 'male', 'married', 'Filipino', 1.65, 70.00, 'A+', 'B63C6-JPS-02-9', '1101-108606-10', '16-0000-16882-0', '09-3076088-9', '09391359800', '096', '141-137-787', NULL, NULL, '2016-01-08 14:35:11', '2016-01-11 07:17:03'),
(76, 230, NULL, 'Grace', 'C', 'Guanzon', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:36:24', '2016-01-08 14:37:22'),
(77, 20, NULL, 'Cyril Tom', 'Bueno', 'Ranara', '', '1974-12-18', 'Digos City', 'male', 'married', 'Filipino', 1.58, 59.00, 'O+', 'CRN-006-0073-1639-3', '188512380M', '16-0000-16934-7', '', '09097413872', '020', '913-813-055', NULL, NULL, '2016-01-08 14:38:20', '2016-01-12 03:05:10'),
(78, 206, NULL, 'Leizel', 'T', 'Esprela', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:39:11', '2016-01-08 14:39:31'),
(79, 213, NULL, 'MIchael', 'B', 'Andam', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:40:07', '2016-01-08 14:40:26'),
(80, 233, NULL, 'Paquito', 'E', 'Relox', 'Jr', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:41:12', '2016-01-08 14:41:33'),
(81, 239, NULL, 'Sheena Lyn', 'A', 'Nuñez', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:47:09', '2016-01-08 14:47:32'),
(82, 100, NULL, 'Teresita', 'Bayacag', 'Bayaron', '', '1953-03-23', 'Many, Davao Oriental', 'female', 'married', 'Filipino', 1.50, 63.00, 'O', '956-031014-01-7', '1101-210262-09', '16-000016171-0', '', '09192012551', '100', '119-600-970', NULL, NULL, '2016-01-08 14:48:22', '2016-01-12 06:51:19'),
(83, 58, NULL, 'Armin', 'L', 'Rubi', '', '1963-01-09', 'Parang, Cantilan, Surigao del Sur', 'female', 'married', 'Filipino', 5.50, 73.00, 'AB', '6310901890', '1101-018599-03', '16-00016939-8', '09-1367988-0', '09206751902', '058', '148-315-474', NULL, NULL, '2016-01-08 14:49:14', '2016-01-11 06:22:24'),
(84, 73, NULL, 'Alejandro', 'L', 'Ladeza', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:50:22', '2016-01-08 14:50:41'),
(85, 115, NULL, 'Leonida', 'Porras', 'Piorac', '', '1969-07-09', 'Tagum City, Davao del Norte', 'female', 'married', 'Filipino', 1.50, 65.00, 'O', '69070901382', '1101-3283-1810', '', '', '09469434414', '115', '158-771-599', NULL, NULL, '2016-01-08 14:51:10', '2016-01-12 05:56:32'),
(86, 72, NULL, 'Mercedita', 'E', 'Floro', '', '1969-07-18', 'Luparan, Sulop, Davao del Sur', 'female', 'married', 'Filipino', 0.00, 47.00, 'B', 'CN-006-0114-0264-6', '', '16-000016384-5', '', '00912855379', '072', '906-006-577', NULL, NULL, '2016-01-08 14:52:06', '2016-01-12 06:53:05'),
(87, 180, NULL, 'Ann Cherry', 'C', 'Cereno', '', '1975-12-01', 'Davao City', 'female', 'single', 'Filipino', 1.50, 51.00, 'O', '2004098402', '', '16-025052645-5', '0920197349', '09205128597', '180', '194-568-865', NULL, NULL, '2016-01-08 14:53:02', '2016-01-11 07:07:42'),
(88, 208, NULL, 'Sabar', 'Gonzales', 'Hasan', '', '1980-11-30', 'Maco, Davao City', 'male', 'single', 'Filipino', 1.32, 55.00, 'B', '', '', '16-05025106-03', '09-202776611-2', '09461524615', '208', '929-757-359', NULL, NULL, '2016-01-08 14:53:53', '2016-01-12 06:37:16'),
(89, 236, NULL, 'Ma. Kristine', 'I', 'Arriola', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:54:50', '2016-01-08 14:55:09'),
(90, 234, NULL, 'Ian', 'S', 'Somosot', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 14:55:52', '2016-01-08 14:56:11'),
(91, 62, NULL, 'Fidela', 'A', 'Indie', '', '1953-10-28', 'Davao City', 'female', 'married', 'Filipino', 1.75, 68.00, 'O+', '53102802043', '1900-0004-7216', '16-000016427-2', '09-0831572-9', '09489985233', '062', '141-137-543', NULL, NULL, '2016-01-08 14:58:23', '2016-01-11 06:46:02'),
(92, 80, NULL, 'Rosie Lynn', 'Palo', 'Tejada', '', '1969-05-05', 'Mampising, Mabini, Davao del Norte', 'female', 'married', 'Filipino', 1.55, 58.00, 'O', 'CRN-006-0114-0327-3', '1101-018595-11', '16-000016954-1', '', '09183699271', '080', '141-137-681', NULL, NULL, '2016-01-08 14:59:10', '2016-01-11 06:55:49'),
(93, 60, NULL, 'Kenny Allan', 'P', 'Benigno', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 15:00:12', '2016-01-08 15:00:34'),
(94, 109, NULL, 'Edna', 'Alliones', 'Valiente', '', '1967-04-05', 'Malinawon, Mawab. Compostela Valley', 'female', 'married', 'Filipino', 1.55, 50.00, 'AB', 'B67H5-EAV-01-3', '1101-018546-02', '16-4444-16944-4', '', '09165292101', '109', '141-137-214', NULL, NULL, '2016-01-08 15:01:03', '2016-01-12 02:41:02'),
(95, 85, NULL, 'Maria', 'T', 'Corcino', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 15:02:34', '2016-01-08 15:02:53'),
(96, 88, NULL, 'Samuel', 'Abella', 'Plando', '', '1969-02-05', 'Callawa, Davao City', 'male', 'single', 'Filipino', 1.30, 65.00, '', 'CM-4613719 AND 45691', '1101-0000165226-0', '16-0000165226-0', '', '09491986464', '088', '125-025-169', NULL, NULL, '2016-01-08 15:03:54', '2016-01-12 05:31:55'),
(97, 81, NULL, 'Joy', 'Lorin', 'Picar', '', '1968-02-01', 'Davao City', 'female', 'married', 'Filipino', 1.40, 60.00, 'O', '6802011303', '1900000047395', '160000165422', '33-1068082-9', '09178528764', '081', '128727050', NULL, NULL, '2016-01-08 15:05:06', '2016-01-12 06:12:57'),
(98, 74, NULL, 'Jude', 'Mabale', 'Magdayao', '', '1966-12-19', 'Davao City', 'male', 'single', 'Filipino', 1.77, 99.99, 'O+', 'B66YKJMM013', '1101-032897-02', '16-0010016481-7', '09-1344307-1', '09293982538', '074', '124-069-217', NULL, NULL, '2016-01-08 15:06:27', '2016-01-12 06:17:21'),
(99, 70, NULL, 'Mary Sheila', 'De La Cruz', 'Fuentes', '', '1971-04-22', 'Davao City', 'female', 'married', 'Filipino', 1.56, 74.00, 'O+', '71042200969', '1900-0004-7116', '33-32844661-4', '', '09496538581', '070', '913813022', NULL, NULL, '2016-01-08 15:08:05', '2016-01-12 06:45:09'),
(100, 99, NULL, 'Sevetrim', 'Bayacag', 'Torrejos', '', '1973-06-03', 'Davao City', 'female', 'married', 'Filipino', 1.50, 53.00, 'B+', '9560672579011', '1900-0005-4211', '16-0000-16183-4', '', '09128039082', '099', '', NULL, NULL, '2016-01-08 15:09:06', '2016-01-12 03:21:26'),
(101, 152, NULL, 'Chris Lloyd', 'A', 'Ceniza', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 15:11:33', '2016-01-08 15:12:00'),
(102, 178, NULL, 'Arnold', 'M', 'Duping', '', '1978-11-28', 'Manay, Davao Oriental', 'male', 'single', 'Filipino', 0.00, 55.00, 'O', '2003511997', '1900-0007-0098', '160000671662', '092315607-3', '09467035247', '178', '936-324-594', NULL, NULL, '2016-01-08 15:13:30', '2016-01-11 07:27:36'),
(103, 153, NULL, 'Junry', 'R', 'Lanoy', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 15:14:25', '2016-01-08 15:14:55'),
(104, 107, NULL, 'Lemuel', 'T', 'Cardona', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 15:15:33', '2016-01-08 15:15:57'),
(105, 67, NULL, 'Josiedel', 'Contangco', 'Santamaria', '', '1976-08-07', 'Lianga, Surigao del Sur', 'female', 'married', 'Filipino', 5.00, 65.00, 'B', '76080700365', '1900-0005-7886', '16-000016245-8', '', '09195082978', '067', '913-813-014', NULL, NULL, '2016-01-08 15:17:05', '2016-01-12 05:34:49'),
(106, 71, NULL, 'Joan Cristin', 'Eballe', 'Alipoyo', '', '1976-06-24', 'Poblacion, Naawan, Misamis Oriental', 'female', 'married', 'Filipino', 1.57, 79.00, 'O+', '74062400637', '1101-210299-08', '10-000016320-9', '', '09094063140', '071', '913-813-030', NULL, NULL, '2016-01-08 15:20:20', '2016-01-11 06:37:33'),
(107, 235, NULL, 'Melissa', 'G', 'Dalumay', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 15:21:23', '2016-01-08 15:21:42'),
(108, 79, NULL, 'Bonita', 'P', 'Cantere', '', '0000-00-00', '', 'male', 'single', 'Filipino', 0.00, 0.00, '', '', '', '', '', '', '', '', NULL, NULL, '2016-01-08 15:27:51', '2016-01-08 15:28:11'),
(110, 27, NULL, 'Irvin Glenn', 'Saracin', 'Santamaria', '', '1977-01-09', 'Lianga Surigao del Sur', 'male', 'married', 'Filipino', 5.40, 70.00, 'B', '77010900215', '1900-0004-7505', '16000044855-6', '', '09084319583', '027', '916-094-225', NULL, NULL, '2016-01-14 01:56:38', '2016-01-14 01:57:02'),
(111, 149, NULL, 'Jeffrey', 'Baes', 'Rafil', '', '1980-09-04', 'Nituan, Parang Maguindanao', 'male', 'married', 'Filipino', 1.59, 0.00, 'O', '', '', '', '', '09108580813', '149', '936-159-160', NULL, NULL, '2016-01-15 02:46:22', '2016-01-15 03:35:06');

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
(101, 53, '', '', '', 'residential', '2016-01-08 14:09:08', '2016-01-08 14:09:08'),
(102, 53, '', '', '', 'permanent', '2016-01-08 14:09:08', '2016-01-08 14:09:08'),
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
(209, 107, '', '', '', 'residential', '2016-01-08 15:21:42', '2016-01-08 15:21:42'),
(210, 107, '', '', '', 'permanent', '2016-01-08 15:21:42', '2016-01-08 15:21:42'),
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hris_employee_approval_heirarchies`
--

INSERT INTO `hris_employee_approval_heirarchies` (`id`, `employee_id`, `recommending_approval_id`, `approved_by_id`, `created_at`, `updated_at`) VALUES
(1, 11, 10, 67, '2016-01-08 15:26:00', '2016-01-08 15:26:00'),
(2, 10, NULL, 67, '2016-01-08 15:23:20', '2016-01-08 15:23:20'),
(3, 12, 10, 67, '2016-01-08 15:23:48', '2016-01-08 15:23:48'),
(4, 67, NULL, 22, '2016-01-08 15:24:12', '2016-01-08 15:24:12'),
(5, 14, 10, 67, '2016-01-08 15:24:38', '2016-01-08 15:24:38'),
(6, 13, 10, 67, '2016-01-08 15:25:03', '2016-01-08 15:25:03'),
(7, 5, 10, 67, '2016-01-08 15:25:33', '2016-01-08 15:25:33'),
(8, 68, 10, 67, '2016-01-08 15:26:24', '2016-01-08 15:26:24'),
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
(60, 9, NULL, 22, '2016-01-09 11:42:18', '2016-01-09 11:42:18');

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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(30, 83, 'Maricar M. Rubi199', '1996-06-02', '2016-01-11 06:22:22', '2016-01-11 06:22:22'),
(31, 83, 'Earl Dan M. Rubi ', '1994-03-12', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
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
(136, 111, 'Ryckllan B. Rafil', '2003-04-13', '2016-01-15 03:35:05', '2016-01-15 03:35:05');

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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(29, 83, 'Career Service Professional Examination', '80.78', '1993-10-17', 'davao City', '9-3015704', '1994-01-24', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
(30, 83, 'PBET', '75.66', '1986-10-26', 'Prosperedad Agusan del Sur', '011116', '1987-05-07', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
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
(78, 42, 'Sub-Professional Civil Service Exam', '80.20', '1997-04-27', 'Tagum Cty, Davao del Norte', '11060444', '1997-05-01', '2016-01-15 03:06:20', '2016-01-15 03:06:20');

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
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(95, 83, 'graduate studies', 'Davao del Norte State College', 'Ph.D.Edcution Management', '', 'CAR', '0000-00-00', '0000-00-00', '', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
(96, 83, 'graduate studies', 'Rizal Memorial Colleges', 'M.A.Education Management', '1995', '', '0000-00-00', '0000-00-00', 'Meritissimus', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
(97, 83, 'college', 'Phillippine Normal College ', 'AB-BSE  (English)', '1986', '', '0000-00-00', '0000-00-00', 'SL Awardee', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
(98, 83, 'secondary', 'Cantilan National Trade School', 'Secondary', '1980', '', '0000-00-00', '0000-00-00', 'BSP Awardee', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
(99, 83, 'elementary', 'Barobo Central ELementary School', 'Elementary', '1976', '', '0000-00-00', '0000-00-00', 'Valedictorian', '2016-01-11 06:22:23', '2016-01-11 06:22:23'),
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
(311, 111, 'elementary', 'New Panay Elementary Scool', 'Elementary', '1992', '', '1987', '1992', 'Valedictorian', '2016-01-15 03:35:05', '2016-01-15 03:35:05');

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
  `commutation` enum('requested','not requested') COLLATE utf8_unicode_ci NOT NULL,
  `leave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `additional_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('filed','recommended','unrecommended','approved','disapproved','certified') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'filed',
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(11, 83, 'PAVE Service Awardee', '2016-01-11 06:22:24', '2016-01-11 06:22:24'),
(12, 83, 'PAVE Service Awardee', '2016-01-11 06:22:24', '2016-01-11 06:22:24'),
(13, 83, 'Loyalty Awardee (25 years in government service)', '2016-01-11 06:22:24', '2016-01-11 06:22:24'),
(14, 83, 'Outstanding Alumnus-PNU ', '2016-01-11 06:22:24', '2016-01-11 06:22:24'),
(15, 91, 'Resource Person in the Training og Trainors, USAID-RISE project, ISALAMBAD, Pakistan', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(16, 91, 'Voluntary Service Overseas in The Education Sector, NRSP - ISLAMABAD, Pakistan', '2016-01-11 06:46:02', '2016-01-11 06:46:02'),
(17, 98, 'Delegate International Youth Festival Rome Italy', '2016-01-12 06:17:21', '2016-01-12 06:17:21'),
(18, 98, 'University of Mindanao 1996 Vinta Achievement Award 1995 Philippine', '2016-01-12 06:17:21', '2016-01-12 06:17:21'),
(19, 88, 'Tagum ROTARAC Golden Laces Leadership Awardee', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(20, 88, 'Tagum City Leadership Distinction Awardee', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(21, 88, 'Gov. Gelicio T. Gementiza Leadership Awardee', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(22, 88, 'UM Tagum College Institute Ledearship Awardee', '2016-01-12 06:37:16', '2016-01-12 06:37:16'),
(23, 57, 'Certificate of Commendation', '2016-01-14 01:28:11', '2016-01-14 01:28:11');

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(26, 83, 'Philippines Association of Teachers of Culture and the Arts (National)', '2016-01-11 06:22:24', '2016-01-11 06:22:24'),
(27, 83, 'AACUP National Accreditor ', '2016-01-11 06:22:24', '2016-01-11 06:22:24'),
(28, 83, 'Philippine Association for Language Teaching (PALT), UP Diliman', '2016-01-11 06:22:24', '2016-01-11 06:22:24'),
(29, 83, 'Reading Association of the Philippines (RAP), PNU/UP Diliman', '2016-01-11 06:22:24', '2016-01-11 06:22:24'),
(30, 83, 'Asia Pacific Student Services Association (APSSA-Singapore base) ', '2016-01-11 06:22:24', '2016-01-11 06:22:24'),
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
(100, 27, 'Davao Association of Guidance Counselor', '2016-01-15 02:17:45', '2016-01-15 02:17:45');

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
(101, 53, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 53, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
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
(209, 107, '', '', '', 'father', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 107, '', '', '', 'mother', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(47, 83, 'Reading', '2016-01-11 06:22:24', '2016-01-11 06:22:24'),
(48, 83, 'Writing', '2016-01-11 06:22:24', '2016-01-11 06:22:24'),
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
(132, 111, 'Driving', '2016-01-15 03:35:06', '2016-01-15 03:35:06');

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(50, 111, 'Rio Jean', 'Bungabong', 'Rafil', 'Businesswoman', '', 'Salvacion Panabo City', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hris_employee_training_programs`
--

CREATE TABLE IF NOT EXISTS `hris_employee_training_programs` (
  `id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `number_of_hours` int(10) unsigned NOT NULL,
  `sponsored_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_employee_training_programs`
--

INSERT INTO `hris_employee_training_programs` (`id`, `employee_id`, `title`, `date_from`, `date_to`, `number_of_hours`, `sponsored_by`, `created_at`, `updated_at`) VALUES
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
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_jobs`
--

INSERT INTO `hris_jobs` (`id`, `queue`, `payload`, `attempts`, `reserved`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:21;}}"}}', 0, 0, NULL, 1452258631, 1452258631),
(2, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:22;}}"}}', 0, 0, NULL, 1452259607, 1452259607),
(3, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:23;}}"}}', 0, 0, NULL, 1452259774, 1452259774),
(4, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:24;}}"}}', 0, 0, NULL, 1452259884, 1452259884),
(5, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:25;}}"}}', 0, 0, NULL, 1452259940, 1452259940),
(6, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:26;}}"}}', 0, 0, NULL, 1452259994, 1452259994),
(7, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:27;}}"}}', 0, 0, NULL, 1452260097, 1452260097),
(8, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:28;}}"}}', 0, 0, NULL, 1452260184, 1452260184),
(9, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:29;}}"}}', 0, 0, NULL, 1452260289, 1452260289),
(10, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:30;}}"}}', 0, 0, NULL, 1452260347, 1452260347),
(11, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:31;}}"}}', 0, 0, NULL, 1452260430, 1452260430),
(12, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:32;}}"}}', 0, 0, NULL, 1452260513, 1452260513),
(13, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:33;}}"}}', 0, 0, NULL, 1452260575, 1452260575),
(14, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:34;}}"}}', 0, 0, NULL, 1452260658, 1452260658),
(15, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:35;}}"}}', 0, 0, NULL, 1452260787, 1452260787),
(16, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:36;}}"}}', 0, 0, NULL, 1452260871, 1452260871),
(17, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:37;}}"}}', 0, 0, NULL, 1452260933, 1452260933),
(18, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:38;}}"}}', 0, 0, NULL, 1452260991, 1452260991),
(19, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:39;}}"}}', 0, 0, NULL, 1452261052, 1452261052),
(20, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:40;}}"}}', 0, 0, NULL, 1452261122, 1452261122),
(21, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:41;}}"}}', 0, 0, NULL, 1452261208, 1452261208),
(22, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:42;}}"}}', 0, 0, NULL, 1452261280, 1452261280),
(23, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:43;}}"}}', 0, 0, NULL, 1452261342, 1452261342),
(24, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:44;}}"}}', 0, 0, NULL, 1452261393, 1452261393),
(25, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:45;}}"}}', 0, 0, NULL, 1452261460, 1452261460),
(26, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:46;}}"}}', 0, 0, NULL, 1452261540, 1452261540),
(27, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:47;}}"}}', 0, 0, NULL, 1452261616, 1452261616),
(28, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:48;}}"}}', 0, 0, NULL, 1452261721, 1452261721),
(29, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:49;}}"}}', 0, 0, NULL, 1452261772, 1452261772),
(30, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:50;}}"}}', 0, 0, NULL, 1452261834, 1452261834),
(31, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:51;}}"}}', 0, 0, NULL, 1452261909, 1452261909),
(32, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:52;}}"}}', 0, 0, NULL, 1452262127, 1452262127),
(33, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:53;}}"}}', 0, 0, NULL, 1452262181, 1452262181),
(34, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:54;}}"}}', 0, 0, NULL, 1452262268, 1452262268),
(35, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:55;}}"}}', 0, 0, NULL, 1452262336, 1452262336),
(36, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:56;}}"}}', 0, 0, NULL, 1452262406, 1452262406),
(37, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:57;}}"}}', 0, 0, NULL, 1452262467, 1452262467),
(38, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:58;}}"}}', 0, 0, NULL, 1452262525, 1452262525),
(39, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:59;}}"}}', 0, 0, NULL, 1452262586, 1452262586),
(40, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:60;}}"}}', 0, 0, NULL, 1452262645, 1452262645),
(41, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:61;}}"}}', 0, 0, NULL, 1452262701, 1452262701),
(42, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:62;}}"}}', 0, 0, NULL, 1452262774, 1452262774),
(43, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:63;}}"}}', 0, 0, NULL, 1452262822, 1452262822),
(44, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:64;}}"}}', 0, 0, NULL, 1452262906, 1452262906),
(45, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:65;}}"}}', 0, 0, NULL, 1452262986, 1452262986),
(46, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:66;}}"}}', 0, 0, NULL, 1452263081, 1452263081),
(47, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:67;}}"}}', 0, 0, NULL, 1452263148, 1452263148),
(48, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:68;}}"}}', 0, 0, NULL, 1452263268, 1452263268),
(49, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:69;}}"}}', 0, 0, NULL, 1452263362, 1452263362),
(50, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:70;}}"}}', 0, 0, NULL, 1452263424, 1452263424),
(51, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:71;}}"}}', 0, 0, NULL, 1452263490, 1452263490),
(52, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:72;}}"}}', 0, 0, NULL, 1452263548, 1452263548),
(53, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:73;}}"}}', 0, 0, NULL, 1452263652, 1452263652),
(54, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:74;}}"}}', 0, 0, NULL, 1452263711, 1452263711),
(55, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:75;}}"}}', 0, 0, NULL, 1452263784, 1452263784),
(56, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:76;}}"}}', 0, 0, NULL, 1452263900, 1452263900),
(57, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:77;}}"}}', 0, 0, NULL, 1452263951, 1452263951),
(58, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:78;}}"}}', 0, 0, NULL, 1452264007, 1452264007),
(59, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:79;}}"}}', 0, 0, NULL, 1452264072, 1452264072),
(60, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:80;}}"}}', 0, 0, NULL, 1452264429, 1452264429),
(61, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:81;}}"}}', 0, 0, NULL, 1452264502, 1452264502),
(62, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:82;}}"}}', 0, 0, NULL, 1452264554, 1452264554),
(63, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:83;}}"}}', 0, 0, NULL, 1452264622, 1452264622),
(64, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:84;}}"}}', 0, 0, NULL, 1452264671, 1452264671),
(65, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:85;}}"}}', 0, 0, NULL, 1452264726, 1452264726),
(66, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:86;}}"}}', 0, 0, NULL, 1452264782, 1452264782),
(67, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:87;}}"}}', 0, 0, NULL, 1452264833, 1452264833),
(68, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:88;}}"}}', 0, 0, NULL, 1452264890, 1452264890),
(69, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:89;}}"}}', 0, 0, NULL, 1452264952, 1452264952),
(70, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:90;}}"}}', 0, 0, NULL, 1452265103, 1452265103),
(71, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:91;}}"}}', 0, 0, NULL, 1452265150, 1452265150),
(72, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:92;}}"}}', 0, 0, NULL, 1452265212, 1452265212),
(73, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:93;}}"}}', 0, 0, NULL, 1452265263, 1452265263),
(74, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:94;}}"}}', 0, 0, NULL, 1452265354, 1452265354),
(75, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:95;}}"}}', 0, 0, NULL, 1452265435, 1452265435),
(76, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:96;}}"}}', 0, 0, NULL, 1452265506, 1452265506),
(77, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:97;}}"}}', 0, 0, NULL, 1452265587, 1452265587),
(78, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:98;}}"}}', 0, 0, NULL, 1452265685, 1452265685),
(79, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:99;}}"}}', 0, 0, NULL, 1452265746, 1452265746),
(80, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:100;}}"}}', 0, 0, NULL, 1452265894, 1452265894),
(81, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:101;}}"}}', 0, 0, NULL, 1452266010, 1452266010),
(82, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:102;}}"}}', 0, 0, NULL, 1452266065, 1452266065),
(83, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:103;}}"}}', 0, 0, NULL, 1452266134, 1452266134),
(84, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:104;}}"}}', 0, 0, NULL, 1452266226, 1452266226),
(85, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:105;}}"}}', 0, 0, NULL, 1452266421, 1452266421),
(86, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:106;}}"}}', 0, 0, NULL, 1452266483, 1452266483),
(87, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:107;}}"}}', 0, 0, NULL, 1452266871, 1452266871),
(88, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:108;}}"}}', 0, 0, NULL, 1452315960, 1452315960),
(89, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:109;}}"}}', 0, 0, NULL, 1452316394, 1452316394),
(90, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:110;}}"}}', 0, 0, NULL, 1452316489, 1452316489),
(91, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:111;}}"}}', 0, 0, NULL, 1452316550, 1452316550),
(92, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:112;}}"}}', 0, 0, NULL, 1452316565, 1452316565),
(93, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:113;}}"}}', 0, 0, NULL, 1452491789, 1452491789),
(94, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:114;}}"}}', 0, 0, NULL, 1452493051, 1452493051),
(95, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:115;}}"}}', 0, 0, NULL, 1452493330, 1452493330),
(96, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:116;}}"}}', 0, 0, NULL, 1452494240, 1452494240),
(97, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:117;}}"}}', 0, 0, NULL, 1452494749, 1452494749),
(98, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:118;}}"}}', 0, 0, NULL, 1452495336, 1452495336),
(99, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:119;}}"}}', 0, 0, NULL, 1452496059, 1452496059),
(100, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:120;}}"}}', 0, 0, NULL, 1452496619, 1452496619),
(101, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:121;}}"}}', 0, 0, NULL, 1452497242, 1452497242),
(102, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:122;}}"}}', 0, 0, NULL, 1452497457, 1452497457),
(103, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:123;}}"}}', 0, 0, NULL, 1452566382, 1452566382),
(104, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:124;}}"}}', 0, 0, NULL, 1452567842, 1452567842),
(105, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:125;}}"}}', 0, 0, NULL, 1452568819, 1452568819),
(106, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:126;}}"}}', 0, 0, NULL, 1452576701, 1452576701),
(107, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:127;}}"}}', 0, 0, NULL, 1452576876, 1452576876),
(108, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:128;}}"}}', 0, 0, NULL, 1452578189, 1452578189),
(109, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:129;}}"}}', 0, 0, NULL, 1452579154, 1452579154),
(110, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:130;}}"}}', 0, 0, NULL, 1452579420, 1452579420),
(111, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:131;}}"}}', 0, 0, NULL, 1452580615, 1452580615),
(112, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:132;}}"}}', 0, 0, NULL, 1452581086, 1452581086),
(113, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:133;}}"}}', 0, 0, NULL, 1452581459, 1452581459),
(114, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:134;}}"}}', 0, 0, NULL, 1452581566, 1452581566),
(115, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:135;}}"}}', 0, 0, NULL, 1452582210, 1452582210),
(116, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:136;}}"}}', 0, 0, NULL, 1452733618, 1452733618),
(117, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:137;}}"}}', 0, 0, NULL, 1452733772, 1452733772),
(118, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:138;}}"}}', 0, 0, NULL, 1452734249, 1452734249),
(119, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:139;}}"}}', 0, 0, NULL, 1452734871, 1452734871),
(120, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:140;}}"}}', 0, 0, NULL, 1452735613, 1452735613),
(121, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:141;}}"}}', 0, 0, NULL, 1452735704, 1452735704),
(122, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:142;}}"}}', 0, 0, NULL, 1452736227, 1452736227),
(123, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:143;}}"}}', 0, 0, NULL, 1452736517, 1452736517),
(124, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:144;}}"}}', 0, 0, NULL, 1452736598, 1452736598),
(125, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:145;}}"}}', 0, 0, NULL, 1452736708, 1452736708),
(126, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:146;}}"}}', 0, 0, NULL, 1452737395, 1452737395),
(127, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:147;}}"}}', 0, 0, NULL, 1452737982, 1452737982),
(128, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:148;}}"}}', 0, 0, NULL, 1452738812, 1452738812),
(129, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:149;}}"}}', 0, 0, NULL, 1452739261, 1452739261),
(130, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:150;}}"}}', 0, 0, NULL, 1452740075, 1452740075),
(131, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:151;}}"}}', 0, 0, NULL, 1452740775, 1452740775);
INSERT INTO `hris_jobs` (`id`, `queue`, `payload`, `attempts`, `reserved`, `reserved_at`, `available_at`, `created_at`) VALUES
(132, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:152;}}"}}', 0, 0, NULL, 1452740893, 1452740893),
(133, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:153;}}"}}', 0, 0, NULL, 1452741920, 1452741920),
(134, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:154;}}"}}', 0, 0, NULL, 1452742700, 1452742700),
(135, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:155;}}"}}', 0, 0, NULL, 1452751171, 1452751171),
(136, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:156;}}"}}', 0, 0, NULL, 1452751382, 1452751382),
(137, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:157;}}"}}', 0, 0, NULL, 1452752579, 1452752579),
(138, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:158;}}"}}', 0, 0, NULL, 1452752773, 1452752773),
(139, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:159;}}"}}', 0, 0, NULL, 1452753540, 1452753540),
(140, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:160;}}"}}', 0, 0, NULL, 1452824243, 1452824243),
(141, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:161;}}"}}', 0, 0, NULL, 1452825497, 1452825497),
(142, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:162;}}"}}', 0, 0, NULL, 1452825982, 1452825982),
(143, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:163;}}"}}', 0, 0, NULL, 1452827155, 1452827155),
(144, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:164;}}"}}', 0, 0, NULL, 1452828160, 1452828160),
(145, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:165;}}"}}', 0, 0, NULL, 1452828819, 1452828819),
(146, 'default', '{"job":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","data":{"event":"O:44:\\"DNSCHumanResource\\\\Events\\\\NotificationCreated\\":1:{s:12:\\"notification\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:37:\\"DNSCHumanResource\\\\Models\\\\Notification\\";s:2:\\"id\\";i:166;}}"}}', 0, 0, NULL, 1453530488, 1453530488);

-- --------------------------------------------------------

--
-- Table structure for table `hris_leave_credits`
--

CREATE TABLE IF NOT EXISTS `hris_leave_credits` (
  `id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `regular_leave` double(8,2) NOT NULL DEFAULT '25.00',
  `force_leave` double(8,2) NOT NULL DEFAULT '5.00',
  `special_leave` double(8,2) NOT NULL DEFAULT '3.00',
  `accumulated_leave` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
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
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_notifications`
--

INSERT INTO `hris_notifications` (`id`, `sent_to`, `sent_by`, `object_id`, `object_type`, `subject`, `message`, `is_read`, `icon`, `color`, `created_at`, `updated_at`) VALUES
(1, 237, 211, '2', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Maria Bonjeavem Geollegue Labor filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-04 18:40:47', '2016-01-05 03:56:19'),
(2, 237, 5, '4', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Paulina Tapangan Baba filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-04 19:02:43', '2016-01-05 03:56:19'),
(3, 237, 161, '5', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Marianne Alimboyng Rebortera filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-04 19:27:55', '2016-01-05 03:56:19'),
(4, 237, 50, '6', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Rosario Bantillo Saligan filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-04 19:47:13', '2016-01-05 03:56:19'),
(5, 237, 78, '7', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Ruby Vergara Gonzales filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-04 21:57:48', '2016-01-05 03:56:19'),
(6, 237, 63, '8', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Julieta Salarda Abarquez filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-04 22:03:01', '2016-01-04 22:03:43'),
(7, 237, 63, '9', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Julieta Salarda Abarquez filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-04 22:05:08', '2016-01-04 22:05:44'),
(8, 237, 111, '10', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Hazel Alcoba Gameng filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-04 22:19:11', '2016-01-05 03:56:19'),
(9, 237, 5, '4', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Paulina Tapangan Baba updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-05 03:28:28', '2016-01-05 03:56:19'),
(10, 237, 86, '11', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Souci Hannah Saracing Bedoya filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-05 19:43:55', '2016-01-08 12:24:29'),
(11, 237, 87, '12', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Rogelio Aguilar Masangkay filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-05 19:58:31', '2016-01-08 12:24:29'),
(12, 237, 125, '13', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Ian Val Planos Delos Reyes filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-05 20:14:24', '2016-01-08 12:24:29'),
(13, 237, 165, '14', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Ariel Octa Gamao filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-05 20:52:55', '2016-01-08 12:24:29'),
(14, 237, 91, '15', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Evelyn Jakosalem Lumaday filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-05 21:41:37', '2016-01-08 12:24:29'),
(15, 237, 237, '16', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Letecia Lozada Cubillo filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-05 21:56:17', '2016-01-08 12:24:29'),
(16, 237, 57, '17', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Nancy Ramos Raiz filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-05 22:12:38', '2016-01-08 12:24:29'),
(17, 237, 103, '18', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jean Dasalla Centina filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-05 22:38:50', '2016-01-08 12:24:29'),
(18, 237, 105, '19', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Edison Quilisadio Bernaldez filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-05 22:51:22', '2016-01-08 12:24:29'),
(19, 237, 116, '20', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Marilou Delfin Junsay filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-05 23:33:02', '2016-01-06 00:32:39'),
(20, 237, 64, '21', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Girley Santiago Gumanao filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-05 23:51:58', '2016-01-08 12:24:29'),
(21, 237, 201, '22', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jonathan A. Bayogan filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:10:31', '2016-01-08 14:00:57'),
(22, 237, 3, '23', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Elivira A. Dignos filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:26:46', '2016-01-08 14:00:57'),
(23, 237, 7, '24', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Felicidad L Forro filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:29:34', '2016-01-08 14:00:57'),
(24, 237, 8, '25', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jonathan H Floro filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:31:24', '2016-01-08 14:00:57'),
(25, 237, 11, '26', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Gemma G Cervantes filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:32:20', '2016-01-08 14:00:57'),
(26, 237, 144, '27', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Levi N Martinez filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:33:13', '2016-01-08 14:00:57'),
(27, 237, 9, '28', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Fe E Benigno filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:34:57', '2016-01-08 14:00:57'),
(28, 237, 13, '29', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jinnah T Enumerables filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:36:24', '2016-01-08 14:00:57'),
(29, 237, 12, '30', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Amalia M Caballero filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:38:09', '2016-01-08 14:00:57'),
(30, 237, 14, '31', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Florida S Cerbo filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:39:07', '2016-01-08 14:00:57'),
(31, 237, 16, '32', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Juana B Cabag filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:40:30', '2016-01-08 14:00:57'),
(32, 237, 15, '33', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Roselyn M Aviso filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:41:52', '2016-01-08 14:00:57'),
(33, 237, 17, '34', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Celia M Garbosa filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:42:55', '2016-01-08 14:00:57'),
(34, 237, 18, '35', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Dionisio M Padrogane filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:44:18', '2016-01-08 14:00:57'),
(35, 237, 203, '36', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Karen L Catane filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:46:27', '2016-01-08 14:00:57'),
(36, 237, 240, '37', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Medel R Silvosa filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:47:51', '2016-01-08 14:00:57'),
(37, 237, 21, '38', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Conrado G Ganadores filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:48:53', '2016-01-08 14:00:57'),
(38, 237, 22, '39', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Emilio T Glimada filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:49:51', '2016-01-08 14:00:57'),
(39, 237, 29, '40', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Rudelito A Sator filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:50:52', '2016-01-08 14:00:57'),
(40, 237, 28, '41', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Cesar A Petiluna filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:52:02', '2016-01-08 14:00:57'),
(41, 237, 31, '42', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Dionisio S Namuag filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:53:28', '2016-01-08 14:00:58'),
(42, 237, 127, '43', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Roldan B Junsay filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:54:40', '2016-01-08 14:00:58'),
(43, 237, 43, '44', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Carmelita D Sato filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:55:42', '2016-01-08 14:00:58'),
(44, 237, 232, '45', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Xavier N Lopez filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:56:33', '2016-01-08 14:00:58'),
(45, 237, 120, '46', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Raquel J Edjec filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:57:40', '2016-01-08 14:00:58'),
(46, 237, 34, '47', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Eldy G Garbosa filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 13:59:00', '2016-01-08 14:00:58'),
(47, 237, 33, '48', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Rolando B Lasquite filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:00:16', '2016-01-08 14:00:58'),
(48, 237, 38, '49', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Melecio M Mendez filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:02:01', '2016-01-08 14:11:39'),
(49, 237, 36, '50', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jerry O Salinas filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:02:52', '2016-01-08 14:11:39'),
(50, 237, 35, '51', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Avelino P Lanugon filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:03:54', '2016-01-08 14:11:39'),
(51, 237, 46, '52', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Rodolfo J Ledesma filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:05:09', '2016-01-08 14:11:39'),
(52, 237, 126, '53', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Marichelle C Maglinao filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:08:47', '2016-01-08 14:11:40'),
(53, 237, 212, '54', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Leron E Odrada filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:09:41', '2016-01-08 14:11:40'),
(54, 237, 45, '55', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Eutiqiuo L Arceño filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:11:08', '2016-01-08 14:11:40'),
(55, 237, 41, '56', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Gerry O Español filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:12:16', '2016-01-08 14:14:51'),
(56, 237, 44, '57', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Rey B Turno filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:13:26', '2016-01-08 14:14:51'),
(57, 237, 39, '58', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Maximiano V Mendoza filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:14:27', '2016-01-08 14:14:51'),
(58, 237, 19, '59', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Romulo O Orma filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:15:25', '2016-01-08 14:21:09'),
(59, 237, 26, '60', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Felma A Ruelo filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:16:26', '2016-01-08 14:21:09'),
(60, 237, 204, '61', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jay Roldan B Banaria filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:17:25', '2016-01-08 14:21:09'),
(61, 237, 48, '62', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Nelson S Cerbo filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:18:21', '2016-01-08 14:21:09'),
(62, 237, 131, '63', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Pondador Raymond P Saguran filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:19:34', '2016-01-08 14:21:09'),
(63, 237, 1, '64', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Edgardo M Santos filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:20:22', '2016-01-08 14:21:09'),
(64, 237, 238, '65', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jo Mark M Libre filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:21:46', '2016-01-08 14:29:47'),
(65, 237, 194, '66', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Glenne Berja Lagura filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:23:06', '2016-01-08 14:29:47'),
(66, 237, 113, '67', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Reir Erlinda E Cutad filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:24:41', '2016-01-08 14:29:47'),
(67, 237, 199, '68', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Ian Jay T Padios filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:25:48', '2016-01-08 14:29:47'),
(68, 237, 68, '69', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Ma. Charito V Aba filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:27:48', '2016-01-08 14:29:47'),
(69, 237, 97, '70', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Bernandita T Rodriguez filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:29:22', '2016-01-08 14:29:47'),
(70, 237, 93, '71', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Zoliyn B Manuales filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:30:24', '2016-01-08 14:35:35'),
(71, 237, 59, '72', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Quirino M Bero filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:31:29', '2016-01-08 14:35:35'),
(72, 237, 65, '73', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Rogelio O Flores filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:32:28', '2016-01-08 14:35:35'),
(73, 237, 95, '74', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Sol D Sotomil filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:34:12', '2016-01-08 14:35:35'),
(74, 237, 96, '75', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Joey P Sotomil filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:35:11', '2016-01-08 14:35:35'),
(75, 237, 230, '76', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Grace C Guanzon filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:36:24', '2016-01-08 14:47:38'),
(76, 237, 20, '77', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Cyril Tom B Ranara filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:38:20', '2016-01-08 14:47:38'),
(77, 237, 206, '78', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Leizel T Esprela filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:39:11', '2016-01-08 14:47:38'),
(78, 237, 213, '79', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'MIchael B Andam filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:40:07', '2016-01-08 14:47:38'),
(79, 237, 233, '80', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Paquito E Relox filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:41:12', '2016-01-08 14:47:38'),
(80, 237, 239, '81', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Sheena Lyn A Nuñez filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:47:09', '2016-01-08 14:47:38'),
(81, 237, 100, '82', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Teresita B Bayaron filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:48:22', '2016-01-08 14:57:45'),
(82, 237, 58, '83', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Armin L Rubi filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:49:14', '2016-01-08 14:57:45'),
(83, 237, 73, '84', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Alejandro L Ladeza filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:50:22', '2016-01-08 14:57:45'),
(84, 237, 115, '85', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Leonida P Piorac filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:51:11', '2016-01-08 14:57:45'),
(85, 237, 72, '86', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Mercedita E Floro filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:52:06', '2016-01-08 14:57:45'),
(86, 237, 180, '87', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Ann Cherry C Cereno filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:53:02', '2016-01-08 14:57:45'),
(87, 237, 208, '88', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Sabar G Hasan filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:53:53', '2016-01-08 14:57:45'),
(88, 237, 236, '89', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Ma. Kristine I Arriola filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:54:50', '2016-01-08 14:57:45'),
(89, 237, 234, '90', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Ian S Somosot filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:55:52', '2016-01-08 14:57:45'),
(90, 237, 62, '91', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Fidela A Indie filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:58:23', '2016-01-08 15:14:49'),
(91, 237, 80, '92', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Rosie Lynn P Tejada filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 14:59:10', '2016-01-08 15:14:49'),
(92, 237, 60, '93', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Kenny Allan P Benigno filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:00:12', '2016-01-08 15:14:49'),
(93, 237, 109, '94', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Edna A Valiente filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:01:03', '2016-01-08 15:14:49'),
(94, 237, 85, '95', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Maria T Corcino filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:02:34', '2016-01-08 15:14:49'),
(95, 237, 88, '96', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Samuel A Plando filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:03:54', '2016-01-08 15:14:49'),
(96, 237, 81, '97', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Joy L Picar filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:05:06', '2016-01-08 15:14:49'),
(97, 237, 74, '98', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jude M Magdayao filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:06:27', '2016-01-08 15:14:49'),
(98, 237, 70, '99', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Mary Shiela D Fuentes filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:08:05', '2016-01-08 15:14:49'),
(99, 237, 99, '100', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Sevetrim B Torrejos filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:09:06', '2016-01-08 15:14:49'),
(100, 237, 152, '101', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Chris Lloyd A Ceniza filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:11:34', '2016-01-08 15:14:49'),
(101, 237, 178, '102', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Arnold M Duping filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:13:30', '2016-01-08 15:14:49'),
(102, 237, 153, '103', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Junry R Lanoy filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:14:25', '2016-01-08 15:14:49'),
(103, 237, 107, '104', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Lemuel T Cardona filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:15:34', '2016-01-08 15:17:43'),
(104, 237, 67, '105', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Josiedel  Santamaria filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:17:06', '2016-01-08 15:17:43'),
(105, 237, 71, '106', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Joan Cristin E Alipoyo filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:20:20', '2016-01-08 15:22:00'),
(106, 237, 235, '107', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Melissa G Dalumay filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:21:23', '2016-01-08 15:22:00'),
(107, 237, 79, '108', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Bonita P Cantere filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-08 15:27:51', '2016-01-08 15:57:56'),
(108, 113, 237, '1', 'DNSCHumanResource\\Models\\DepartmentHead', 'New designation', 'You are assigned as a head of Institute of Information Technology by Letecia Lozada Cubillo', 0, 'institution', 'warning', '2016-01-09 05:06:00', '2016-01-09 05:06:00'),
(109, 116, 237, '2', 'DNSCHumanResource\\Models\\DepartmentHead', 'New designation', 'You are assigned as a head of Institute of Management, Governance and Continuing Studies by Letecia Lozada Cubillo', 0, 'institution', 'warning', '2016-01-09 05:13:14', '2016-01-09 05:13:14'),
(110, 50, 237, '3', 'DNSCHumanResource\\Models\\DepartmentHead', 'New designation', 'You are assigned as a head of Institute of Fisheries and Food Technology by Letecia Lozada Cubillo', 0, 'institution', 'warning', '2016-01-09 05:14:49', '2016-01-09 05:14:49'),
(111, 78, 237, '4', 'DNSCHumanResource\\Models\\DepartmentHead', 'New designation', 'You are assigned as a head of Institute of Education by Letecia Lozada Cubillo', 0, 'institution', 'warning', '2016-01-09 05:15:50', '2016-01-09 05:15:50'),
(112, 63, 237, '5', 'DNSCHumanResource\\Models\\DepartmentHead', 'New designation', 'You are assigned as a head of Institute of Arts and Sciences by Letecia Lozada Cubillo', 0, 'institution', 'warning', '2016-01-09 05:16:05', '2016-01-09 05:16:05'),
(113, 237, 58, '83', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Armin L Rubi updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-11 05:56:29', '2016-01-12 02:47:46'),
(114, 237, 97, '70', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Bernandita Tripole Rodriguez updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-11 06:17:31', '2016-01-12 02:47:46'),
(115, 237, 58, '83', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Armin L Rubi updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-11 06:22:10', '2016-01-12 02:47:46'),
(116, 237, 71, '106', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Joan Cristin Eballe Alipoyo updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-11 06:37:20', '2016-01-12 02:47:46'),
(117, 237, 62, '91', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Fidela A Indie updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-11 06:45:49', '2016-01-12 02:47:46'),
(118, 237, 80, '92', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Rosie Lynn Palo Tejada updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-11 06:55:36', '2016-01-12 02:47:46'),
(119, 237, 180, '87', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Ann Cherry C Cereno updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-11 07:07:38', '2016-01-12 02:47:46'),
(120, 237, 96, '75', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Joey Paulo Sotomil updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-11 07:16:59', '2016-01-12 02:47:46'),
(121, 237, 178, '102', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Arnold M Duping updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-11 07:27:22', '2016-01-12 02:47:46'),
(122, 237, 93, '71', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Zoilyn Benban Manuales updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-11 07:30:57', '2016-01-12 02:47:46'),
(123, 237, 109, '94', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Edna Alliones Valiente updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 02:39:42', '2016-01-12 02:41:15'),
(124, 237, 20, '77', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Cyril Tom Bueno Ranara updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 03:04:02', '2016-01-12 03:05:02'),
(125, 237, 99, '100', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Sevetrim Bayacag Torrejos updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 03:20:19', '2016-01-12 03:21:20'),
(126, 237, 88, '96', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Samuel Abella Plando updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 05:31:41', '2016-01-12 05:32:01'),
(127, 237, 67, '105', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Josiedel Contangco Santamaria updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 05:34:36', '2016-01-12 05:35:07'),
(128, 237, 115, '85', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Leonida Porras Piorac updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 05:56:29', '2016-01-12 07:11:43'),
(129, 237, 81, '97', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Joy Lorin Picar updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 06:12:34', '2016-01-12 06:13:00'),
(130, 237, 74, '98', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jude Mabale Magdayao updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 06:17:00', '2016-01-12 07:11:43'),
(131, 237, 208, '88', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Sabar Gonzales Hasan updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 06:36:55', '2016-01-12 06:39:16'),
(132, 237, 70, '99', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Mary Sheila De La Cruz Fuentes updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 06:44:46', '2016-01-12 07:08:58'),
(133, 237, 100, '82', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Teresita Bayacag Bayaron updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 06:50:59', '2016-01-12 07:11:43'),
(134, 237, 72, '86', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Mercedita E Floro updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 06:52:46', '2016-01-12 07:11:43'),
(135, 237, 68, '69', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Ma. Charito Villanueva Aba updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-12 07:03:30', '2016-01-12 07:11:43'),
(136, 237, 9, '28', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Fe Enumerables Benigno updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 01:06:58', '2016-01-14 03:26:49'),
(137, 237, 11, '26', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Gemma Guiral Cervantes updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 01:09:32', '2016-01-14 03:26:49'),
(138, 237, 18, '35', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Dionisio Dolfo Padrogane updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 01:17:28', '2016-01-14 03:26:49'),
(139, 237, 44, '57', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Rey Bastasa Turno updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 01:27:51', '2016-01-14 03:26:49'),
(140, 237, 120, '46', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Raquel Juntilla Edjec updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 01:40:13', '2016-01-14 03:26:49'),
(141, 237, 36, '50', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jerry Orevillo Salinas updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 01:41:44', '2016-01-14 03:26:50'),
(142, 237, 8, '25', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jonathan Hebra Floro updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 01:50:27', '2016-01-14 03:26:50'),
(143, 237, 27, '109', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Irvin Glenn Saracin Santamaria filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 01:55:17', '2016-01-14 03:26:50'),
(144, 237, 27, '110', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Irvin Glenn Saracin Santamaria filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 01:56:38', '2016-01-14 03:26:50'),
(145, 237, 19, '59', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Romulo Olmos Orma updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 01:58:28', '2016-01-14 03:26:50'),
(146, 237, 12, '30', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Amalia Monulngolh Caballero updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 02:09:55', '2016-01-14 03:26:50'),
(147, 237, 15, '33', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Roselyn Martin Aviso updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 02:19:41', '2016-01-14 03:26:50'),
(148, 237, 203, '36', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Karen Lihay-Lihay Catane updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 02:33:32', '2016-01-14 03:26:50'),
(149, 237, 17, '34', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Celia Melicor Garbosa updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 02:41:01', '2016-01-14 03:26:50'),
(150, 237, 22, '39', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Emilio Tanudtanud Glimada updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 02:54:35', '2016-01-14 03:26:50'),
(151, 237, 34, '47', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Eldy Gardose Garbosa updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 03:06:15', '2016-01-14 03:26:50'),
(152, 237, 21, '38', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Conrado Ganacial Ganadores updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 03:08:13', '2016-01-14 03:26:50'),
(153, 237, 232, '45', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Xavier Ngoho Lopez updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 03:25:19', '2016-01-14 03:26:50'),
(154, 237, 16, '32', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Juana Buladaco Cabag updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 03:38:20', '2016-01-14 05:41:18'),
(155, 237, 204, '61', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jay Roldan Beatizola Bañaria updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 05:59:31', '2016-01-14 07:49:21'),
(156, 237, 45, '55', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Eutiqiuo Laurden Arceño updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 06:03:02', '2016-01-14 07:49:21'),
(157, 237, 48, '62', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Nelson Salvador Cerbo updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 06:22:59', '2016-01-14 07:49:21'),
(158, 237, 14, '31', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Florida Suan Cerbo updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 06:26:13', '2016-01-14 07:49:21'),
(159, 237, 38, '49', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Melecio Gabaya Mendez updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-14 06:39:00', '2016-01-14 07:49:22'),
(160, 237, 144, '27', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Levi Navarro Martinez updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-15 02:17:22', '2016-01-15 02:51:25'),
(161, 237, 39, '58', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Maximiano Venturado Mendoza updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-15 02:38:17', '2016-01-15 02:51:25'),
(162, 237, 149, '111', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jeffrey  Rafil filled up his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-15 02:46:22', '2016-01-15 02:51:25'),
(163, 237, 31, '42', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Dionisio Salag Namuag updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-15 03:05:55', '2016-01-15 03:30:12'),
(164, 237, 28, '41', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Cesar Amado Petiluna updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-15 03:22:39', '2016-01-15 03:30:12'),
(165, 237, 149, '111', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Jeffrey Baes Rafil updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-15 03:33:39', '2016-01-15 03:33:59'),
(166, 237, 1, '64', 'DNSCHumanResource\\Models\\Employee', 'Personal Data Sheet', 'Edgardo M Santos updated his/her Personal data sheet.', 1, 'user', 'purple', '2016-01-23 06:28:08', '2016-01-23 06:29:09');

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
-- Table structure for table `hris_phpdebugbar`
--

CREATE TABLE IF NOT EXISTS `hris_phpdebugbar` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `meta_utime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_datetime` datetime NOT NULL,
  `meta_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL
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
(8, 'Admin Oficer V', '2015-11-27 03:05:17', '2015-11-27 03:05:17'),
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
-- Table structure for table `hris_salary`
--

CREATE TABLE IF NOT EXISTS `hris_salary` (
  `id` int(10) unsigned NOT NULL,
  `salary_grade` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `step` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `salary` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

--
-- Dumping data for table `hris_sessions`
--

INSERT INTO `hris_sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4083f01fd5d3aa5d48798fda84e273f54348c945', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', 'ZXlKcGRpSTZJakpQWEM5WVlXdE9aVlJyUmxOYVdWd3ZUSEkzZEU1b1VUMDlJaXdpZG1Gc2RXVWlPaUpJZVdWWGNHSjJPR2hPWXpOd1ZYQTVjRlk0YUdkcE1rNDFaa05oVVVWU2RESnZNbEUyVlZFMlFYaHFVa2hrU3paMVIwb3JXbVJxVlhKTlUyRmpSRVpjTDJSWVMxcDVZemdyZVVZNFdUVmpTVEJTVFdZMk5EQkxVVlZQUTBsT1VsWnBOakE1U0hoSU9GaHBVSG81VG1ObFUwWk5aWGMyVUV4blNrRk9lR3BOYUhNelMwWkpRVUpFY21GRlYwMVJVR1ZUTUdsak9EZ3hNVFpHWVhrMllrWk5VWFkyYUdsdFZHSXdXamxrYVRSYU0weHVVRUkxYXpabVFUbEtTVzFWWTI5cWNXaEtTazUwVEZGRFQwVkRWa3BUYmtObVZGbFdNMHhVV1NzcldEUTRVV05RWmpSb1MwMDBibWN5TmxKamFHOWNMek4zWm5ob2NtNUdVMk54UlRGVUsyVjFUa2gzTVZRMWVHVldjVko2VGpaMFdFOUhaR1ZhWWxCRGRVc3JVR1ZoTUZkV1NHUXhialJ5ZUdwSGJGRkxTalozWlhwdVQyUmxkRE01UjBOS1ZXaHpkazQ0YW1ObGVIVnFaR3ByWWtoelRHRk5PVzlVUjF3dlpsbDNZVFpSUzF3dmNVeDRlVmRJZDBkbWFIbEVabGRuTjJaaFVFVnFjVUUxVFdOMlJTdDNZVzFwTTNCdGREWmlUalV3UzFscllXMXJka0phV0ZKcGJFVklXVFJFU0ZGeVJGQTFVbVZKUlZnMVExUjZaelo2Tld0elowWlVkR2MzT0hCblRXUkdXbWxMWkRWbGFHRjFjazR3YUhaV1dsVndPV1JUZFVWaGQxWjZabWR5TkVSeFQzbEdUbU5HU1RGdGRHRlpjWEV4TW1GdVpGSnBNRUpCVW1kdWJqUkljMXd2TTJkaFVHWTViVFp1SzFkaVFucENaV3RrUVROYVprMTZOelZqVDNVNVZqaHZjRWhLTVc1eWN6UlVYQzkzVTF3dmFVNU9hVE5qWEM5Qk5tbEpjbHd2VGxFeVZubHhhVE1pTENKdFlXTWlPaUl4TWpSbVlXTTJaRGswTW1GaFpEYzBaRGN6TjJWaE5URmxOekZoTm1ReVlqRmpZemc1TW1JelpESmpNVGxqT0RNd1pURTFPRGMxWVROak5HWmhZVE5tSW4wPQ==', 1453530521),
('57e1f15e3fb009f66bf621074689d7d4f681faf5', 237, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36', 'ZXlKcGRpSTZJbXRZYTNVd00ybGFPRWxrYUhoaWFUTXJPV1F6WmtFOVBTSXNJblpoYkhWbElqb2lORVZLY3pSR1Nsd3ZjMXBQYjI1eVZUaHdhblozU1RSSVpqRjBja052YUVSQ2RFcERUbGhjTDBkeWRFbGNMMHB5TW1aWVdTdEhUVEpyWTNSa1NGQkNiRzVWTlU5SmFVbHNjVTFWYkdWUFZpdEpVMmwyTVZkSWQzSjZhblZrTW1sNlZsd3ZkRzk1YmtFMVRHNHJTVkpvY0ZGSmVXVjJURmRJVERKQ1FteE9jVU5JTlZnMk5EQlhUVGxQVWs1bGEwUlBkbkI1TjJRMGVHcDNhREl3T0hwM01VSlRjekl6V1VwY0wxbHpkRTlvZURSNVoyVm5iSEJEUXpsV1owbHFNMUZSU1ZkNVQxSlRhREZyWkhaVGVHRXlkblo2Tkd3MmNVdDVTR056VW5CVWJUWlBkSFZoU1ZKU2MzWTNkRkJHWTFCRlluSnVPVFJKT1hSblNtVnFWalI1TTFoQk0xd3ZXR2hNVFhWNGEza3pUbU41Vm1OeVpVSXdUbnBaU2s1R2FEQnZaRVUzUjNGMVUyVXlWR1ZhZERRM01HRlFTSHA2T0ZoaWQyVnFSMEZxV0RaTE1EbDVjR3RwVTJkR1UxUm1kV3hXVm1oUlVGbDVhekJXWTFSTGQzY3JjR3hUTWtZM1VrcFVhRXBjTDFWTk0waFlYQzlpWlRGbFlsUXdkMUpWT1RCclUwOHhaM1pPYWxwMlJWcFNVMVp4Y0ZaRWJuUlBSRkoxVmpob1JYRXdXR3BHUkdsamVHaE1XRkZHU3pnNVVUVnpRVTV2WjJkMk1XcGxaM0ZyV2s1WGF5dHJVRU0yVlVSR1VVOVNVelZVYTFKTFNWTnljVzU2VmtwYU5taFJRbms1VWpkaE16RkZaVzl2WjJaTFJrbzRRMFJrUkRRMGNVNVhaVGhYY1VSTlprZDJVRnBoV1RCMlIwdzNXRTVDUVhoVU0zVmpRbXh1WldGbWRUQnBTMnhtTWtVclZYcHJWemR5U1hSaGRucEJkVGhLVDBFOUlpd2liV0ZqSWpvaU5UQmlaVGMxT1RKalpXTTBNV0U1WW1VNVlUZGpabUU0TkRBM1lXWXlNell6WVdOak1EUmtaREppTTJGak4yRXdaamt3WldOa09XVTFOVEUxWlRrMk55Sjk=', 1453530650);

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
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(137, 'Emplementation of the New Performance Evaluation System for Non-Teaching Peersonnel', NULL, NULL, '1998-12-23', '1998-12-23', 24, 'Vicente C. Hermoso Ph.D (DNSC Colleg Press.)', '2016-01-15 03:22:59', '2016-01-15 03:22:59');

-- --------------------------------------------------------

--
-- Table structure for table `hris_training_participants`
--

CREATE TABLE IF NOT EXISTS `hris_training_participants` (
  `id` int(10) unsigned NOT NULL,
  `training_id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `include_in_pds` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hris_training_participants`
--

INSERT INTO `hris_training_participants` (`id`, `training_id`, `employee_id`, `include_in_pds`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 3, 13, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 4, 19, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 5, 19, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 6, 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 7, 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 8, 28, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 9, 28, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 10, 28, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 11, 28, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 12, 28, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 13, 28, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 14, 28, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 15, 28, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 16, 28, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 17, 26, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 18, 26, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 19, 26, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 20, 26, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 21, 26, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 22, 26, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 23, 35, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 24, 57, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 25, 57, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 26, 57, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 27, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 28, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 29, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 30, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 31, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 32, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 33, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 34, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 35, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 36, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 37, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 38, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 39, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 40, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 41, 46, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 42, 50, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 43, 50, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 44, 50, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 45, 110, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 46, 110, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 47, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 48, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 49, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 50, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 51, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 52, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 53, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 54, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 55, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 56, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 57, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 58, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 59, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 60, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 61, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 62, 33, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 63, 36, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 64, 36, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 65, 36, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 66, 36, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 68, 39, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 69, 39, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 70, 39, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 71, 39, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 72, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 73, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 74, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 75, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 76, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 77, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 78, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 79, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 80, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 81, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 82, 47, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 83, 45, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 84, 45, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 85, 45, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 86, 61, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 87, 61, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 88, 61, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 89, 61, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 90, 61, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 91, 61, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 92, 55, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 93, 55, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 94, 55, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 95, 55, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 96, 62, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 97, 62, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 98, 62, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 99, 62, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 100, 31, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 101, 31, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 102, 31, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 103, 31, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 104, 31, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 105, 31, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 106, 31, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 107, 31, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 108, 31, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 109, 31, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 112, 49, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 114, 49, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 115, 27, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 116, 58, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 117, 58, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 118, 58, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 119, 58, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 120, 58, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 121, 58, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 122, 58, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 123, 58, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 124, 58, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 125, 58, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 126, 42, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 127, 42, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 128, 42, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 129, 42, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 130, 42, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 131, 42, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 132, 42, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 133, 42, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 134, 42, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 135, 42, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 136, 41, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 137, 41, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
  `signature_path` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
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

INSERT INTO `hris_users` (`id`, `username`, `email`, `password`, `signature_path`, `type`, `department_id`, `status`, `last_login`, `last_logout`, `ip_address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '001', NULL, '$2y$10$SVjPBmcEoMZLXUdm9y3SzOMl4oHSNIcp5Rb62m4qgCzuDvL76CJVC', NULL, 'user', 8, 'active', '2015-11-27 11:06:38', '2015-11-27 11:10:26', '::1', 'cZGBI9JilgtJTYT08diFaNlL5pOEKCVKEpZqEuMWmUx0gipMBe1Xkq4J2Blu', '2015-11-27 03:04:18', '2016-01-13 08:02:45'),
(2, '002', NULL, '$2y$10$nMELY.agcRA0Zq67ySBW.e2UreanKcZ6qutpck1xMDqq0f6JJHo8W', NULL, 'user', 11, 'resigned', NULL, NULL, NULL, '26u6m7fwyHv2NzUskrbSFOkIGviIS3rjQpwI6BYeC1vkQbQzliq1omy9G4tF', '2015-11-27 03:04:18', '2016-01-23 06:30:34'),
(3, '003', NULL, '$2y$10$6Hy6G3q3aAJc7l3uXb0P.OcwoWPhMIPpwn6XmKm2C8mV2mfWHQl7a', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'PfNDULXeXNZkAHSANiuYMxW0X692MLa75rl6trvXZS8Mw80N04OK2ZTdyHrf', '2015-11-27 03:04:18', '2016-01-08 13:27:35'),
(4, '004', NULL, '$2y$10$OxrS8XFttSk7aygwEIG/iuXEPNXW1xLhTozz7sduPVUg9tzk5kbjG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:19', '2015-11-27 03:04:19'),
(5, '005', NULL, '$2y$10$0tHDuzRTqyK9FubUe8As4.0KTC3UZTqeuLR17lCta1HDvqlhd9oCO', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'Ti7kiTdMwknrJBQQ5k0EpWP7pAeYwe8B9g7ASvOcxdDCYvD0y9DSxACddWMS', '2015-11-27 03:04:19', '2016-01-12 06:21:56'),
(6, '006', NULL, '$2y$10$d0GNJKbHxTK02lizqclR4ulsGpZZ6fxp/aNaWXOeR8HMcZpFb4F7G', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:19', '2015-11-27 03:04:19'),
(7, '007', NULL, '$2y$10$A0DbxRQ/4u4Xgamlezh2f.gh/D3NidnnmvzWGZGMzvzh7kM1ArxzG', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'WBm30ZfcbixkihgPBEWuHVIIp25IEJgSHuMB3GfRxAW5G6jzasIymWU8C2QD', '2015-11-27 03:04:19', '2016-01-08 13:30:51'),
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
(20, '020', NULL, '$2y$10$Pd3/T2RLbWW2pxgNexL.9.CMl7Deke9bydIOj82cGJyIIep9pCKqm', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'SA0PfPNxfxRcAtXSfK6GQgBYFhJeArPu9pufVeVWtfHNsTqL7BnNTnozw5AE', '2015-11-27 03:04:22', '2016-01-12 03:06:00'),
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
(50, '050', NULL, '$2y$10$vFigch0os3yug.yzYZDgKeD0PzSEZvtc3YX.eVIdCpwZslSKFmW3u', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'ObOTh18YmLNbY7Ke5k4k1uJ195lIPUHnpV2ED3QssmnLzA0r3tqmgqqZzbA6', '2015-11-27 03:04:30', '2016-01-04 19:47:36'),
(51, '051', NULL, '$2y$10$hl8x1FKtYbZNPw14G.OZjObcsraatfBuuQJBx/8ZWmsed9q8a93/S', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:30', '2015-11-27 03:04:30'),
(52, '052', NULL, '$2y$10$fA0OkvMILbN579w8kBPkru8VImkqfL4soHBTaEMkpGo2aug9OxIT6', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:30', '2015-11-27 03:04:30'),
(53, '053', NULL, '$2y$10$RZfpUpTm0RYm6SeXr5F2A.tLaUbWtJKxBhZ/sjSNLXpcmb5GCH.oe', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:31', '2015-11-27 03:04:31'),
(54, '054', NULL, '$2y$10$pQt5y7Wotmo8ZnrdNLWMwO8n/YoG6da1bqgFJc8ND8hTOJTy.Yp8i', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:31', '2015-11-27 03:04:31'),
(55, '055', NULL, '$2y$10$VZr8i5ApiTqeM5M7.j1BTusAqorHjZDbLj80hukIdKcq.JTlfNMYi', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:31', '2015-11-27 03:04:31'),
(56, '056', NULL, '$2y$10$0IWrahr.kDppKdr1ZnEwNeMXtuoGn2ryGNzOVjbhdMvQVOfh5i7hG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:32', '2015-11-27 03:04:32'),
(57, '057', NULL, '$2y$10$fluepfemSeGoDM44BD7ifuHV8.HQQE91g1BlDV4C5WqrdGnESekYW', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'Fc4czKUhOwZnF5gnI91dvuYZSb09P4mMiZGbSiYvh59vba9ubZYQPkB4P0XP', '2015-11-27 03:04:32', '2016-01-08 14:50:00'),
(58, '058', NULL, '$2y$10$cls7uysPIevepbHWQaYN3eV8a39ny6WT9UjWIqio.YeFo8NEos1OK', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'aXkRR3XnP6C5OGYQ1WOrxt2sjjiu7sTVPdy5gYOaJrVvApbthpvotpmiGeYR', '2015-11-27 03:04:32', '2016-01-11 06:23:42'),
(59, '059', NULL, '$2y$10$c0ZqZBsTM6qGOhpLZmCBreMd5dbmy/DckjnBkFsdPM8V0m5EXFcT.', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'c6DhUHOLeQeeLizzTpVORMKjvXt9fqkjfIGOExyq0Mdd7MDZZyYcrEQlbT0X', '2015-11-27 03:04:32', '2016-01-08 14:31:57'),
(60, '060', NULL, '$2y$10$Yh/QglCIDD80xVD80J4Q7ewaAqSEZcM7eFM0l6movSFAbP35bMxOq', NULL, 'user', 6, 'active', NULL, NULL, NULL, '8vbkpr182uTWtYCOQXTLq4vyCCpSSFjdQvI4o6Z94zagZeQuAex7GSbHsQbW', '2015-11-27 03:04:32', '2016-01-08 15:00:45'),
(61, '061', NULL, '$2y$10$gSf4P0qUhAvK7kgL2uAU5.lYJkTZ/sjdF4Gz//j4ezwcyqm5qqeP.', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:33', '2015-11-27 03:04:33'),
(62, '062', NULL, '$2y$10$w9Vi7tF1T54f7YXg3tGmqef6ZiXLdDjeuHVQELiThesEun1vMdqIG', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'sHar4mpC8XrgvOev6K8ND1HYeuDAvs6WfSjrpFEtcpvbPLPbNa9gVddtKXqb', '2015-11-27 03:04:33', '2016-01-11 06:48:41'),
(63, '063', NULL, '$2y$10$Hrg4MYg8pgQWR/Ur3xl4U.YwKZSfppVW/BiOG3EmAOCX6vZl8bfPO', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'SgdMnFd63ZwqPxXB9hIF1QP6U90zWuXizDDS8wiIIyclEmILrJFkwVANOV8z', '2015-11-27 03:04:33', '2016-01-09 05:21:59'),
(64, '064', NULL, '$2y$10$M7nSlY8xTHWqTJ8vQOBgMuC.Zd42333.qb9QqKC3usG0EBFSuVahq', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'ci4UbUhd4nju3fp1QYVtGnTYPCO0EWPpMsr9hyNYK54gJ6G2ew1PlSp5x7Xj', '2015-11-27 03:04:33', '2016-01-13 00:02:24'),
(65, '065', NULL, '$2y$10$knFSIjxx2/ktdJz1vZ/d9u0nftfmdNbVxCkFzlcGzrqdNjw3SB1ze', NULL, 'user', 9, 'active', NULL, NULL, NULL, '9GhilMx7JNXbsBbVwRcuT3PUhrNm9RCxEAkuYWLXvK15qPhiYgclMaAuWuLJ', '2015-11-27 03:04:34', '2016-01-08 14:33:39'),
(66, '066', NULL, '$2y$10$.xUVtBNBNSTFyLMuQhTM4ufJY5eQ8oLO0JtL4.41xBBwIr8V5X4C.', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:34', '2015-11-27 03:04:34'),
(67, '067', NULL, '$2y$10$mruc.Uo6dIJuKUaiGO8xROlnn0VRDULdQiRVOrvfcrdqzbWgENj1q', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'u2VQ8fVExRst4rzSTHPYLSIj3vBsRV1WQar1ia4bOeaVdblIJeuvD1Sbb6Yg', '2015-11-27 03:04:34', '2016-01-12 07:25:38'),
(68, '068', NULL, '$2y$10$4WGF4dJmwQKd/9GTP3KE2umprU0DZ0qmgEOxnuGyNmz6iLGl8JomG', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'jIC3Xw3UFHuSdfpWMMBBMkMz5mDx7Yzvs12fg1fecZD2GN6eIvTEk7lu0Dt5', '2015-11-27 03:04:34', '2016-01-08 14:28:45'),
(69, '069', NULL, '$2y$10$JagvTO28RUdLvCbp4KgkdO.NpTJp4kisw3o5DZjeHAyS.s4rt/gpu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:35', '2015-11-27 03:04:35'),
(70, '070', NULL, '$2y$10$CFTOar0Y/sK4HNHMxvN/vuwnBDQ12ivzMqbdLZy7h4ScV7GYzLt9q', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'lQW702xzZU4BumxMBkscBenWTc68n8s6zei8p2DCTvtodzHMg72eEeFp2f2g', '2015-11-27 03:04:35', '2016-01-12 06:49:13'),
(71, '071', NULL, '$2y$10$Sp4fGyOEYyuXJjXEiT..lOHUFf1Rmu4s5EyaQpePxfvT.oXZRTWHG', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'd8Up5MOonMMefQQKS2bieprOUFMPkVkMH30dZz5cUZcmaVEwIKMoyf71AdLP', '2015-11-27 03:04:35', '2016-01-12 06:00:38'),
(72, '072', NULL, '$2y$10$HtswNDnPCK2sAQR45OL77e3tBvby3r7CFtdBZDywcEcHsG8.lkp8m', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'vRt3HMqZO650ADqvJqL70zZ1JngyOgnsBbvzocM29h5m3GObkcOZnftj5ZSg', '2015-11-27 03:04:36', '2016-01-12 06:53:16'),
(73, '073', NULL, '$2y$10$vxj3cdp.6ibjpDp6dqpdZu63fHY9Q7U2WvoKlAkFV4NbhCiAlG5oi', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'BVYZzaBC3k0974P80vwnrsuVNTtE4V7zjLqjoff8kozqVa5r8PgXpZ85MASw', '2015-11-27 03:04:36', '2016-01-08 14:50:45'),
(74, '074', NULL, '$2y$10$XO8HzPbT6tjM3SmIBkmqs.AvXiOnPegCe7kEvef343yFDlsLI7WDq', NULL, 'user', 6, 'active', NULL, NULL, NULL, '5TnqLOxoSrEtB9cf9XJ1IdCIe5TNjuX8DucVChF6QQOg8z2YeaEOYcZry9gw', '2015-11-27 03:04:36', '2016-01-12 06:18:07'),
(75, '075', NULL, '$2y$10$22HNPfin2M2bKCLxuv191e5mzZ6DZcHJezwtENGfClEhfdPmelH4G', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:36', '2015-11-27 03:04:36'),
(76, '076', NULL, '$2y$10$y6/aUkN450wcF8Cg5vMva.DOQ3byRc82HwvVYpIgpq9RD.UiniIle', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:37', '2015-11-27 03:04:37'),
(77, '077', NULL, '$2y$10$IWqjDAN2Yz2LxBBGVFA/hu6u/DYvcwt20WuKhj5xNmO0JvCCIOfzy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:37', '2015-11-27 03:04:37'),
(78, '078', NULL, '$2y$10$DDi8qgC5eGWdzZriuQznOeW8qi6Sn4wIQmIDoQZ8dLmoAri2vxj82', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'PAWTW6OxjOM7zCUkmasSsG5BD2LvT0kk05ouYYQk9YnCpcrzSzmUVeF7o77z', '2015-11-27 03:04:37', '2016-01-04 22:00:27'),
(79, '079', NULL, '$2y$10$1Fbx.ECnWpoeKcHqkVm6F.SQa5bAhxSI8OvsT9PWX2WLfUoCJm3Q.', NULL, 'user', 6, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:37', '2016-01-03 03:23:29'),
(80, '080', NULL, '$2y$10$OllEJz6TlYLx9Js87bCApOUflZ5rpl3czTCnYZKpDsHh2UTK3DHdC', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'Q86dj4xh0B6PtCix34jdbnJd64Dx01JuHqQvcOd160NIBk6DJ4I5Hh1sGQY0', '2015-11-27 03:04:38', '2016-01-11 06:56:18'),
(81, '081', NULL, '$2y$10$Fo5pJRTmIPW0bkKsySA7leGaNS3Nvhw5OnLxVnuckDP9G2teEoHMW', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'ySz7pvwUPK6XLZdaW0LAIW34Hzkjl7ITJuQYmoZeUQ6ErVQyURuTCDBHev48', '2015-11-27 03:04:38', '2016-01-12 06:13:35'),
(82, '082', NULL, '$2y$10$wRnicEcFnrZrfBisuen0J.snSsXO8KR9doQFzal7DD.gk6nUWX9Pa', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:38', '2015-11-27 03:04:38'),
(83, '083', NULL, '$2y$10$opgShIYTAV/fPFXYVCacTuU1cjWInB6wWcx40Jt7iIUMeApv/RbYG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:38', '2015-11-27 03:04:38'),
(84, '084', NULL, '$2y$10$jvGE/diydZMnb3lAJuJL9eZbFAmkTFq1/77zPpseJIorOJ81rfRcW', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:39', '2015-11-27 03:04:39'),
(85, '085', NULL, '$2y$10$FbMUmBMkeGrav9fhBHjwN.dXCqNdWj6Q1WgJICHFbNjROmsZIlZjO', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'dzsayr00V1hzkhwWBFIoh7cH7r6WFzNYiOxB1hV7VQbUg3Ssx1CS9InwJy5d', '2015-11-27 03:04:39', '2016-01-08 15:03:12'),
(86, '086', NULL, '$2y$10$cNt9/arv7R.r5E6oG/9Q2uKsyGlPHvLxUpH.FO/TRG6yuka9DWdry', NULL, 'user', 1, 'active', NULL, NULL, NULL, 'eHYztsozsmO7g10q4kVRAfdD2nuU7pa1oCJEy4bsTmtWuEr1WeyxhcnecRqC', '2015-11-27 03:04:39', '2016-01-05 19:44:06'),
(87, '087', NULL, '$2y$10$YZ2EqyGiLNrC7SdzOM5X4ex8sZB974ix8LcdCWim9/9xZo.ll3Yv6', NULL, 'user', 1, 'active', NULL, NULL, NULL, 'PLbZFHgbThSv5Ai79CsdpYvA19qH41vDGpJ65VX2m9jrn166W5zFOiiPlPA8', '2015-11-27 03:04:39', '2016-01-05 20:00:07'),
(88, '088', NULL, '$2y$10$LVVcE1PnulwAdRZhbltU.Os9CsgCNeXd7cp0XOlxoxGZeKGfwyQNq', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'YzGmVAS5L2CQtAAsh0kCumPPb0Dm9bWBzx5XFo79McHkf8LeZXR4CuBUl75D', '2015-11-27 03:04:39', '2016-01-12 05:32:12'),
(89, '089', NULL, '$2y$10$w3vWwx1rh/xlelQzKoXMC.EMqtaXh6twCeTLRae1xY1vxlv82FMZe', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:40', '2015-11-27 03:04:40'),
(90, '090', NULL, '$2y$10$B1rbwBgzNoPMnY3MpZXuvOdg7S/5TQAWJXvaQ0AbtpbO3vtUYfi6u', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:40', '2015-11-27 03:04:40'),
(91, '091', NULL, '$2y$10$bKX5cJ6FAviMwjoYXViB2ebJFmIrXS9cM0ZnKxbuY/5P5RmlvPfcS', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'L3xTRooKIUxUT8Ky1FhE03CCsykwiNEahCxfmlQrZt9RSssFkGAOr0QJb5pi', '2015-11-27 03:04:40', '2016-01-05 21:42:11'),
(92, '092', NULL, '$2y$10$VFtxeEV/JDnoIhffX90Wcu90NN7tHgTWDySIrF2RcWzueuJKKFIoK', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:40', '2015-11-27 03:04:40'),
(93, '093', NULL, '$2y$10$F0Np71DkVEdkjvlgPpsb/ujshEvGahNXIj2udYOo/8GmJIpUlghKe', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'oxQXJkRLKv1OdVpn0DS4jMF80k0ufDxxgIAPDmHsqyHiysivlPwMhSmLG3r1', '2015-11-27 03:04:41', '2016-01-08 14:31:00'),
(94, '094', NULL, '$2y$10$M49UtI7xDUJQN5Hz4zZl2.OnXPDINMI9c.b4Z27KDuhkJC4DIX0iu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:41', '2015-11-27 03:04:41'),
(95, '095', NULL, '$2y$10$P/xBn2Y9q47ynNI7XLruj.thatuFOgi13qZr4IFj1F3j3gH/huIRa', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'EAgfDvpkTiIVYiGIiGnJtaENtOQHzznubkKvT3lbXbVZUxxCfC48CGLmtfFa', '2015-11-27 03:04:41', '2016-01-08 14:34:39'),
(96, '096', NULL, '$2y$10$qNQPySlIpbYTd1UxpW2th.qMRR60PG1HXjUxP6icGwSUp8du982sO', NULL, 'user', 9, 'active', NULL, NULL, NULL, '6UbypndWIVKK0UnnORPkYCKYU1AWRKcPwe9sVDc9BNuJsRPdBlLykRO7aFtm', '2015-11-27 03:04:41', '2016-01-11 07:17:44'),
(97, '097', NULL, '$2y$10$vQsRViuwKbafl6oKdb4qSOnLdy.K/ZP1ZmRQiu8FTThnQNz1cEcSC', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'Hrnd1pvRfIrwavmj0i48k6CFiO6ivt0bZSvvZrT7T3gWjbD02syWufQ0vMuH', '2015-11-27 03:04:41', '2016-01-11 06:20:12'),
(98, '098', NULL, '$2y$10$JuiqpO53JUby7Gr3cWBv8O56Q0j8.OTTOrAYFtOhIWl.mAgnyOJim', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:42', '2015-11-27 03:04:42'),
(99, '099', NULL, '$2y$10$of0dfy/OzvFFgvnL02yQqe8JyOwVfTWolLTSdqwRpYnOq4TmlctWW', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'RlL6xNxMozcytprf2Na4rQohlEeoAxkfWtyyeHu72jZncEDokTuOmaybg9Hy', '2015-11-27 03:04:42', '2016-01-08 16:00:16'),
(100, '100', NULL, '$2y$10$wMmUp7IRA7jULlYYP4xR5ukkuUUXfRgfQy8EGpqP0m/XIFWNmyRVG', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'XVnvhrwn29Wg1J5ukuV47q757XwA4JJ5k5ZD00FB3LZsAHm2ZE1JFApvwcPb', '2015-11-27 03:04:42', '2016-01-12 06:51:59'),
(101, '101', NULL, '$2y$10$ydDU9MY7qBsTIJV.TniW.ethaqiLCRm/uoaGqhE22iKIpdcbjAs16', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:42', '2015-11-27 03:04:42'),
(102, '102', NULL, '$2y$10$WfySiYCa/DlI7FfMDtQ.FOTsRxrdRH9id4uUK0Q6xk/uaRppPANTW', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:43', '2015-11-27 03:04:43'),
(103, '103', NULL, '$2y$10$2CHY/o4A9DlfyVthK67yzeX9K49WLO4LJTqHHndHSyW7.6bPRO2Y2', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'VOWVyoeK57i99BUZe300qhWCM50MmqIqAce8ljFBdf2sXciLtUU24e8lVyfG', '2015-11-27 03:04:43', '2016-01-08 15:06:05'),
(104, '104', NULL, '$2y$10$TEtSY3Zf/2YKKudjnYFOOepaH2wrUKFcnLBXmeSpICKSq06aRxJ3m', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:43', '2015-11-27 03:04:43'),
(105, '105', NULL, '$2y$10$dWSNcbg7HxalyWrXlS5yZOCEvqkSKNq17nrnjNsTa0bkas3gLDrVG', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'Mh5Jj9xxdhH2OPIYgQYbdcbUY4eceJr4AGbY4wT899JyIy7uJ4QBEyPR26Bs', '2015-11-27 03:04:43', '2016-01-08 15:15:13'),
(106, '106', NULL, '$2y$10$7OpsjLY84s5I3I1uQon.cuLTueKvGZwGYel99cPMZBtFGsscMpOnm', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:44', '2015-11-27 03:04:44'),
(107, '107', NULL, '$2y$10$DRx1c8z0dNLEv7qkuHddPeAyCPopzxnK9i/APu8/bjT2lVDN2Klzy', NULL, 'user', 6, 'active', NULL, NULL, NULL, '9GeEUGGam0ex3bzqZwt5oUAVddqCTirsio2jm3L3dGCvpXOn8WQOedEOesva', '2015-11-27 03:04:44', '2016-01-08 15:16:36'),
(108, '108', NULL, '$2y$10$plqKHEOrZ4/iJUJpvC861esQVhKzf6SlNrKB8d3uNWqKgSgJDl16y', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:44', '2015-11-27 03:04:44'),
(109, '109', NULL, '$2y$10$8CG2ZzvqDsf2uFQag9oNG..sDgGbLTcTi6ow9C/2o4cFN03E6A05O', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'AMRigfUPgaXVnexdqYrjRAvhjEZ0UjTeo9K4J9DPUUBnxBAVFJwxagUZK6ve', '2015-11-27 03:04:44', '2016-01-12 02:41:50'),
(110, '110', NULL, '$2y$10$ndh8gV/yIBO9iekKI3ssKulEDUZJfcn5aEOr9VlVwJpzvFWzi0wxW', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:44', '2015-11-27 03:04:44'),
(111, '111', NULL, '$2y$10$jKcSywMc7hBV.gTNjjwzXOKnEnR31oM125KmIVZwZVv85kbLmzxOG', NULL, 'user', 1, 'active', NULL, NULL, NULL, 'rmL3nfDbtSzynMBAQ9PS3QQT9nS6eqGPSt6OZ9tqn44QL5mWG0PKCqzFJrG8', '2015-11-27 03:04:45', '2016-01-05 14:58:48'),
(112, '112', NULL, '$2y$10$VDMp7D.4kPhydSnzDHXUIeOq8QdAJKHyGbtlpZd6IpmsX/rt2xJQy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:45', '2015-11-27 03:04:45'),
(113, '113', NULL, '$2y$10$ySl31q1nOvR4DXvVvAs8QOUEuVi.chz9lnfe8zwEiDjMy0r2JbuIa', NULL, 'user', 1, 'active', NULL, NULL, NULL, '0jX94Spg9AAIibxrukoCIveckVygMbKzKDImvftgPwz0V9zrSLvjBzhr0b8b', '2015-11-27 03:04:45', '2016-01-08 14:25:15'),
(114, '114', NULL, '$2y$10$oXmjCYn4ZrQMFW.unpgF0eodcZRn24e3Dl4PJW9B0NthjEGdf5U.m', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:45', '2015-11-27 03:04:45'),
(115, '115', NULL, '$2y$10$LiFZMwT9TEkOphZ9nCRY3u5uk3smtkGBtUdW335yNcdNUwAU7GUuy', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'cvFWqsgjkD662sD7S3hX7hj9XZLHBX2bpaIIsvXKtHn4nVFG4HWfCiLEzMuw', '2015-11-27 03:04:46', '2016-01-12 05:57:09'),
(116, '116', NULL, '$2y$10$SNjNeZylZ0gkagXiBPKGx.ntxjGpXyCYSAcHVJqzT9y7Ons111reS', NULL, 'user', 8, 'active', NULL, NULL, NULL, 'PTpwLV4ZEgVODymYWRcTnJtWqX6jiQ33kZqkV46GPhdQvyWixZLYZv0QvMk9', '2015-11-27 03:04:46', '2016-01-08 14:22:41'),
(117, '117', NULL, '$2y$10$criRJfVW5hw.3sMI5s8Ko.OLO5chLEZl4X2GoNuJDYSazoGPya.p6', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:46', '2015-11-27 03:04:46'),
(118, '118', NULL, '$2y$10$Ebrr1VOXMzb2uPZCy2Z8Y.ZpADwi2qwuX//fknasMDcVxw2cMd4ai', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:46', '2015-11-27 03:04:46'),
(119, '119', NULL, '$2y$10$cC/KqddhRIUDXCT43329y.hqkgc6oT/RYd4mOXfJD5rsBk5i7FEt6', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:46', '2015-11-27 03:04:46'),
(120, '120', NULL, '$2y$10$FPh6zRIjkHcL0MEakKdBb.OciCo78B.qGOWVOxEFraXA4r7mp04AS', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'CtXhI3K9L5ezKSLvnINXleO6QoelvTgPBarO49hWvyF0E3mAGYOI6gDzsi6o', '2015-11-27 03:04:47', '2016-01-14 01:40:48'),
(121, '121', NULL, '$2y$10$uSYNbpHiL8c9sFe658/.kuRpSg0SrH2uZCWYbscIuZPm3Bg9tSJHq', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:47', '2015-11-27 03:04:47'),
(122, '122', NULL, '$2y$10$BKb48uTgtVMitTbm8N2Jh.HZoFE15VYZchsjLBSe5i.ReQC7AYKHe', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'to38CYhsNmESWNGcNGg07ZXJ58jKzBUpc1EokYHSqozDeAtUlGWpRm8NBzxk', '2015-11-27 03:04:47', '2016-01-12 02:26:01'),
(123, '123', NULL, '$2y$10$.7NyrP/hfUpL7Il7b4bDvOnzfbuCOiX8bwGh3G9cLsuKClZCRHRRK', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:47', '2015-11-27 03:04:47'),
(124, '124', NULL, '$2y$10$CxjElPfAdQR/QAt37iy37uRoHG0GZ9UTdwxuj3k995v4OxzFR00LS', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:47', '2015-11-27 03:04:47'),
(125, '125', NULL, '$2y$10$ZtzNRGEU/J3rKJDAZ0FOuu9bYQIxmqlNoGQyH8HYreSPQe1LHJo0i', NULL, 'user', 1, 'active', NULL, NULL, NULL, 'XV0TwCdHESHl7YgEneEC9Kg0NFlKE9tEFEkctIs4fd0whyKxHrPWfeZxlBBw', '2015-11-27 03:04:48', '2016-01-05 20:14:33'),
(126, '126', NULL, '$2y$10$TmsvBUSRrNg.TGhRY5n85uAYkxAdAEDKUi.nPnVgij4uvLdjc63Pi', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'nTdocgBrxMPjXFg7s8MNLI2lqg6Bd1PjbMUD2D6R1taJGlfzXAC1w9GxwsHB', '2015-11-27 03:04:48', '2016-01-08 14:09:14'),
(127, '127', NULL, '$2y$10$D3NePC7BKsdtqN4ma1ri7OvmmVSI4f4Mm66nmrk3LXJ7e62ISztjO', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'w4vXz81yNzzDaiMFSuFp5bO37erQZTDHxYq12ymxP5vD1SmcXibUkLOiOjDu', '2015-11-27 03:04:48', '2016-01-08 13:55:06'),
(128, '128', NULL, '$2y$10$WE1FaBW8m.jgi6OEPri1BO/W8IX/Iqd1nfiS1Yxw7mBi6JQUJ2OOe', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:48', '2015-11-27 03:04:48'),
(129, '129', NULL, '$2y$10$W9tLvHIwcZdWmlb8q9ehqeUwukTnflfCWFMqBAT8RGH63WhENQN7O', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:49', '2015-11-27 03:04:49'),
(130, '130', NULL, '$2y$10$0AWBnELEhZnqANMQftpG1eBtUSGt2oqpzTMiNMgnMLUbAivlCDzH6', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:49', '2015-11-27 03:04:49'),
(131, '131', NULL, '$2y$10$4iB6X9R6NifOeppjDO/Zl.GEA/wdL7Jkw2SZteXd6CpC2Z1oP5zxm', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'z2siJQ6fld1zbLVDildvHpFHLtynUwC1TtGkVhGv20yGmSK8OvusvQJ5nwuc', '2015-11-27 03:04:49', '2016-01-08 14:19:58'),
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
(152, '152', NULL, '$2y$10$BDki6NeDK8VJBeB3BMnAlukmYARACZNZTFXlp9SeYBSHWNKTOAN/m', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'ui4ULuRMkFEH2NPlRSYqogc9i2ePwn6XRUMVh0BiPSmVNhed1v0fXR2F3wLb', '2015-11-27 03:04:54', '2016-01-08 15:13:10'),
(153, '153', NULL, '$2y$10$u6R.eGGEBWe6g8L1iCLZYOHNepFEd3PMRXzbKXC5jfpVq6oUvQRoq', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'sqBoDAEIKFB8GGELnY69OAQkzozDnFnYkz0MGGZB0v5FIp13e9HWXujqvy6V', '2015-11-27 03:04:54', '2016-01-08 15:15:00'),
(154, '154', NULL, '$2y$10$8Hd37GXTzDYBzYlGQxI2Iuo6djTQRJG9h85nWONAgIgUfeKcBR7bK', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:54', '2015-11-27 03:04:54'),
(155, '155', NULL, '$2y$10$ESBTh5mluNWKJ1wh5c2qb.fklrglqDcb6CIfDlYN1ehJUHn2VBRF2', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:54', '2015-11-27 03:04:54'),
(156, '156', NULL, '$2y$10$uSufrRc5pCFEby8wEQiveO/weIe9SWi393anw9pQjHpoWjA.BjF8y', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:54', '2015-11-27 03:04:54'),
(157, '157', NULL, '$2y$10$GjApzYRG9gg6msaGWevDdeq2WWycBQin7M15fM2C8Q4OWh02H6YxG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:55', '2015-11-27 03:04:55'),
(158, '158', NULL, '$2y$10$5EuHK/Zlza0aKSlDKoHYoumYIat5is2xHUPdD8esCSsWTyYps1buu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:55', '2015-11-27 03:04:55'),
(159, '159', NULL, '$2y$10$Wm8382G0CF6pRX0Hw9kKB.job9fcZUK.OUPNXgjKsBOP9vuktc9bu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:55', '2015-11-27 03:04:55'),
(160, '160', NULL, '$2y$10$JdOcvPG06jeP0IMYg6YCBOuuE8XoQtu90j53wm4gy/q7sUPT7/MpG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:55', '2015-11-27 03:04:55'),
(161, '161', NULL, '$2y$10$h0wtVutl8.aFUFIYsjmAheJ/QOLoQHDiJObmWxwtKS/PyukaJSua.', NULL, 'user', 1, 'active', NULL, NULL, NULL, 'CdUoj98AGmfAjgjRmqFAbi6ukYebaoE8BTgAw5VU6JCdiSoTICUpkks1LBx2', '2015-11-27 03:04:56', '2016-01-04 19:28:32'),
(162, '162', NULL, '$2y$10$ULPhcEiiuLsAJvpWtsyLTeBzejDhHv12rDJOvgkDYFfb.r72NUNOu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:56', '2015-11-27 03:04:56'),
(163, '163', NULL, '$2y$10$NKImHrDwQbCxWI0COU2GmePD2oEwf3DAfosIOWzNOCJCacDq6KH/.', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:56', '2015-11-27 03:04:56'),
(164, '164', NULL, '$2y$10$tVp3Nm5d0QYiWYAy6udis.1Qu9HbLdvi.G/GQm1u2hKtvs/dV4LDq', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:04:56', '2015-11-27 03:04:56'),
(165, '165', NULL, '$2y$10$0jRh6IkbiaCdM/QekWwAweLnOZpxJ8N6hXVqsoEM7F27ntfJ6Sa8u', NULL, 'user', 1, 'active', NULL, NULL, NULL, '8uxKyj6pxRZJ2QRtKYtqjxxa55Arky0VKie7lI5n8962JxIklgaJ552WPnXt', '2015-11-27 03:04:56', '2016-01-05 20:53:32'),
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
(178, '178', NULL, '$2y$10$5wpporeWM/o02DHuUW4yrOhcyetsxZd21FncjSfGxHIIv0iv3QmNO', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'ItRCbvmaM6dT8O7Gpempg4Ihbnw2g5IzY0bdmsHtQj7wHM7n2LDf7ptnemNt', '2015-11-27 03:05:00', '2016-01-11 07:28:20'),
(179, '179', NULL, '$2y$10$eVoJWguBVn/GKNsgWgkUveJI84El00EUIOQxIpgJTrMlLzH5wx33C', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:00', '2015-11-27 03:05:00'),
(180, '180', NULL, '$2y$10$5Z0JYsy/Nby5SwhCb82epO7KpYCe6NYcI1FoG3BZ1xsp3ENreKuqm', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'GvftjG9BZFronjy2AuwU7qRZav0lrxECKx6HG1Tlrn8ojltZXmlyF7152Q0t', '2015-11-27 03:05:00', '2016-01-11 07:08:36'),
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
(194, '194', NULL, '$2y$10$8GwsNkCVkPC.BVYAv/1gH.BwVZoEYUa/6h5vbn3BISWUQedK82iM6', NULL, 'user', 8, 'active', NULL, NULL, NULL, 'qz8uZ9Bf6971yRQmUT9qrdb8knLMEb9F0kicXF9HhYHvvo8ZBjMN7MXiugBt', '2015-11-27 03:05:03', '2016-01-08 14:24:04'),
(195, '195', NULL, '$2y$10$zTwSoC11IVHj0NZG8prAKuhWqAtRwpBOpfh1ZDHwL/980RgEfe3KK', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:03', '2015-11-27 03:05:03'),
(196, '196', NULL, '$2y$10$TxA.pGhh1G5A/D9hHh5ADuJsh00dctfMDP/G0ULzX3Ek7gPuoTLqu', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:03', '2015-11-27 03:05:03'),
(197, '197', NULL, '$2y$10$HNhpw3eKM06uhi3y3QBGyu/.3WKD89TztoRy595qGXBEu4mi7YhKq', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:04', '2015-11-27 03:05:04'),
(198, '198', NULL, '$2y$10$bn/3PYzo330y6GLm4EOJPueQUjpTdlPimmB84kithpuq1XE6GnTq2', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:04', '2015-11-27 03:05:04'),
(199, '199', NULL, '$2y$10$nZ5tu4zCsaCcnKxiG.vRyeb./oPOaiP3qEYjGwaWyZ0AqLcBHWY46', NULL, 'user', 1, 'active', NULL, NULL, NULL, 'srp6XmlgPoBVtBtyYvOKKyoOtoX0sDS5wFSEIFQhdGbynWU1zE6vxjjw71q6', '2015-11-27 03:05:04', '2016-01-08 14:26:27'),
(200, '200', NULL, '$2y$10$heui2KvotxINPokSS3VYIup4/EFDy4dc0pmh3F2Y/WQ.UegMmJtS2', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:04', '2015-11-27 03:05:04'),
(201, '201', NULL, '$2y$10$dglMjrGVZjCZkeNtuFgPE.1j.qPfPc4N73zWlyACxZ4H7iDrmi3ue', NULL, 'president', 11, 'active', NULL, NULL, NULL, 'tyK90Tyy4aPGHecjiYR3degkONV3SeVdW0gvnaOiDyTHNs6Dr2TWkOtkHy2N', '2015-11-27 03:05:04', '2016-01-08 13:15:12'),
(202, '202', NULL, '$2y$10$i2EB2VIUgEM6TiGGJiq1meKD3DOoMC37My4xbPy.UgG1B4wkGp2Dy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:05', '2015-11-27 03:05:05'),
(203, '203', NULL, '$2y$10$EWO6FeaMHilBTb6TN/Fwy.ATOiqNt/EkXH6Ggp3SF2LidpbjDWaGW', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'WUnrLrMjUwnpz2yY1nWJkR0NcXInUlBmEJTpYIXiy8eCY5spoxNiAkCifjAY', '2015-11-27 03:05:05', '2016-01-14 02:34:05'),
(204, '204', NULL, '$2y$10$ETP69jF0gFEPc2vp1JJwyeUQBF2aQuoutVD0EEqgP44u2Fxwsn.FG', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'EbD45J5SScsPBvEGnuncLRXFiRFMA4UDf1JQaCUiPodBnU1wNPdyuatm0pcG', '2015-11-27 03:05:05', '2016-01-14 06:00:53'),
(205, '205', NULL, '$2y$10$rLTQjNuQOSkzhtEcAQ0CweIZ0wB1fmXrQvQX97yCDFGPD4iyke6Fq', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:05', '2015-11-27 03:05:05'),
(206, '206', NULL, '$2y$10$EZEdWODEOrZWLYaM8bFUBeZmoAvAyHmH38rsauWBpInzwe52tV89O', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'Mllelw99IUPrRjp0jztFUNIao29HFxuNk42CHCoSlJnTTSVi5Uc1Fbg4UqGL', '2015-11-27 03:05:05', '2016-01-08 14:39:36'),
(207, '207', NULL, '$2y$10$iVSNxJy7CkASvGjv.92op./xlgktSsLS6HCZhH5RPNIf/tn4/SRk2', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:06', '2015-11-27 03:05:06'),
(208, '208', NULL, '$2y$10$BGGEzOIyXaioJQ2LI59uLekUIRdjGXez5Bm4CbQ7I394ujbEsiuWC', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'fPHSYWQKiQYHW8iPnruVClyt00Bt4dRBjF53CEquehqScowUeizQkwimvMDR', '2015-11-27 03:05:06', '2016-01-12 06:37:50'),
(209, '209', NULL, '$2y$10$Q8HsybKYFMksigKUadX9hOo9SVHWwGxdSbVPJhDDOxm0o8.Yx9uwm', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:06', '2015-11-27 03:05:06'),
(210, '210', NULL, '$2y$10$0udLnMaw7ZNUBQLPKdOBaOmBund5536NESoxNVtRh8O4beHAeXTrG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:06', '2015-11-27 03:05:06'),
(211, '211', NULL, '$2y$10$9bGiTfPpP5EqrYmitbGOmuhuPhoX26tOWmhUtXEUSYblMzw20wdvy', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'DHPlbBz5dqdJUzDcgonTirZ2xqWAMlW5L5mFC7k1P70X2seffCeCWgC1D9Bs', '2015-11-27 03:05:07', '2016-01-08 13:28:53'),
(212, '212', NULL, '$2y$10$ofTz/48.u6cryDNPzYR1n.ExfsanjvCJdJOQDAChmIU/9PL74.Zeu', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'O1n1pWnqIzYCSBuRmvdH8d6eUSyGpIXeGpcn8UTCbIxQEpCrhkLZfN6CouRP', '2015-11-27 03:05:07', '2016-01-08 14:10:13'),
(213, '213', NULL, '$2y$10$V01DfsGT4hDsnFRC5XHVPuK5k0Zg6KKA8HvmT.QWg228e2iRaeAxS', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'RCq9tdL7pC50wOl8izWQh6Ob2PBFAE2fb0zVxi557QGCYh4L58UizKwIwlGJ', '2015-11-27 03:05:07', '2016-01-08 14:40:37'),
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
(230, '230', NULL, '$2y$10$1SoXx981c/5ToCiFUbYBuOrS3iYgFezb.nTzrj5WjDpVrdWlsZpxS', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'GRZHBh4feJf5Gxoe1DNYZzuoyCbyHYLa7wMpTX6igY4z9EGWZKnIywIrJzHc', '2015-11-27 03:05:11', '2016-01-08 14:37:27'),
(231, '231', NULL, '$2y$10$eQr2Fvh08oriIlxb3xSttOpIdgWSpskqBmp3LryrJ4tyAHKT0C.qG', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:12', '2015-11-27 03:05:12'),
(232, '232', NULL, '$2y$10$e5Kl1UXjxF3BQQC4OvgjLOK1uj/oGTM6.voUrtwbi/ToxeWYWzVAy', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'tN6GDfPBGZOK2DaK54b0cSGtTm8Nlc6ZdTbGNoUssyBDsfSV1LWNZhUxpzME', '2015-11-27 03:05:12', '2016-01-14 03:25:52'),
(233, '233', NULL, '$2y$10$dzy/U12YR7bDROYaJebS1O2bn3/x2ohVOeQ9Sp6/9PBk3ctXoO5ru', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'TcR1PMKBBMXltz9nofzROy9azfUkar9T05PYBUwrm6LVvDNMay1PUkWdoyxI', '2015-11-27 03:05:12', '2016-01-08 14:46:40'),
(234, '234', NULL, '$2y$10$Wn3bUGExhM3j5.pUCUs/bugoAaooYym3COjTd8NxW93WkYA0bDrKC', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'KUzAERqwhYgxK5H4lDT6cV41uE53UVgbqdhRtTGKAUspA7BZAQmP3F80wRG6', '2015-11-27 03:05:12', '2016-01-08 14:57:58'),
(235, '235', NULL, '$2y$10$iYcD967OGRzqMOie09osluvEn5dgxg73W4c7K4xmH61SA/JwQr16a', NULL, 'user', 6, 'active', NULL, NULL, NULL, 'Bm391AAEOgUgxNFJ90dpHuwwHZvxQmMKAboH3YoB9PCYSEZYExP4fFSVWaad', '2015-11-27 03:05:12', '2016-01-08 15:27:30'),
(236, '236', NULL, '$2y$10$5c8fYuF1gF4Is2LC83WvRu948waoMlejl4tp4.9ArQp6BmgyQEhB6', NULL, 'user', 7, 'active', NULL, NULL, NULL, 'u64TZHjrFDfgEdWNNFDetEmpOYxlqXSzMTwQRQpTopkgUpq92QpjCuA0e1RU', '2015-11-27 03:05:13', '2016-01-08 14:55:28'),
(237, '237', NULL, '$2y$10$9bIFcSvm/jhLWFQRebgzAuwPNtbS16Svhr3Z/6cRphX8Tws8Hwp3q', NULL, 'admin', 11, 'active', '2015-12-02 13:23:27', '2015-11-28 23:18:32', '::1', 'ue1aN37Nhqsi6NBPkVzAn42Vaso9rvxbs7N4YPToxPVovuDtX3ymb33PCSxD', '2015-11-27 03:05:13', '2016-01-14 07:52:15'),
(238, '238', NULL, '$2y$10$CdxJZzXztQ5bNHjIos1pLOofwTYnDQX0vWmmMgsyGfsZz8DXra.JO', NULL, 'user', 8, 'active', NULL, NULL, NULL, 'p4cofq8vTAkAV26479R0htBaeJMw49zH6dJQYxkXQyH2UzPSx0zt3NhiDZDx', '2015-11-27 03:05:13', '2016-01-08 14:22:29'),
(239, '239', NULL, '$2y$10$03a.nIw8lRg7GeOY7l1Wm.mouiyLWo/yY3qZ0lD32A0xlE4nMR2FS', NULL, 'user', 9, 'active', NULL, NULL, NULL, 'BRcAYWSb7Viv19XXm3etwIIvUQvlrGOal9LQYYfwf8EEhQscHrUnNsG5I6tY', '2015-11-27 03:05:13', '2016-01-08 15:59:37'),
(240, '240', NULL, '$2y$10$7q3IEP9dPqM2QcnJw9GzCeng6zsYQh.LhdmnMIbfssotuQ0FchevG', NULL, 'user', 11, 'active', NULL, NULL, NULL, 'h8gUBQnr21rUlYFb5RMfJzpKZMaKvypdtnop8YJXWCq8kj0VEUZdXOpeXNVF', '2015-11-27 03:05:14', '2016-01-08 16:02:30'),
(241, '241', NULL, '$2y$10$JnijqiJ8jIYWAeCY.18yHOxo6kS0JnnX9jSFMPYkqy5R8OrBo1suy', NULL, 'user', NULL, 'active', NULL, NULL, NULL, NULL, '2015-11-27 03:05:14', '2015-11-27 03:05:14');
INSERT INTO `hris_users` (`id`, `username`, `email`, `password`, `signature_path`, `type`, `department_id`, `status`, `last_login`, `last_logout`, `ip_address`, `remember_token`, `created_at`, `updated_at`) VALUES
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(106, 11, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_code_unique` (`code`);

--
-- Indexes for table `hris_department_heads`
--
ALTER TABLE `hris_department_heads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_heads_department_id_foreign` (`department_id`),
  ADD KEY `department_heads_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employees`
--
ALTER TABLE `hris_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_user_id_foreign` (`user_id`);

--
-- Indexes for table `hris_employee_accumulated_leaves`
--
ALTER TABLE `hris_employee_accumulated_leaves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_accumulated_leaves_employee_id_unique` (`employee_id`);

--
-- Indexes for table `hris_employee_address`
--
ALTER TABLE `hris_employee_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_address_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_approval_heirarchies`
--
ALTER TABLE `hris_employee_approval_heirarchies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `recommending_approval` (`recommending_approval_id`),
  ADD KEY `approved_by` (`approved_by_id`);

--
-- Indexes for table `hris_employee_child`
--
ALTER TABLE `hris_employee_child`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_child_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_civil_services`
--
ALTER TABLE `hris_employee_civil_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_civil_services_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_educations`
--
ALTER TABLE `hris_employee_educations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_educations_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_leaves`
--
ALTER TABLE `hris_employee_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_leaves_employee_id_foreign` (`employee_id`),
  ADD KEY `employee_leaves_recommending_approval_foreign` (`recommending_approval_id`),
  ADD KEY `employee_leaves_certified_by_foreign` (`certified_by_id`),
  ADD KEY `approved_by_id` (`approved_by_id`);

--
-- Indexes for table `hris_employee_leave_credits`
--
ALTER TABLE `hris_employee_leave_credits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_leave_credits_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_non_academics`
--
ALTER TABLE `hris_employee_non_academics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_non_academics_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_organizations`
--
ALTER TABLE `hris_employee_organizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_organizations_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_parents`
--
ALTER TABLE `hris_employee_parents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_parents_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_personnel_leave_card`
--
ALTER TABLE `hris_employee_personnel_leave_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `hris_employee_personnel_performances`
--
ALTER TABLE `hris_employee_personnel_performances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_personnel_performances_employee_id_unique` (`employee_id`);

--
-- Indexes for table `hris_employee_q_c_es`
--
ALTER TABLE `hris_employee_q_c_es`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_q_c_es_employee_id_unique` (`employee_id`);

--
-- Indexes for table `hris_employee_references`
--
ALTER TABLE `hris_employee_references`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_references_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_skills`
--
ALTER TABLE `hris_employee_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_skills_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_special_leaves`
--
ALTER TABLE `hris_employee_special_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_special_leaves_employee_id_foreign` (`employee_id`),
  ADD KEY `employee_special_leaves_processing_personnel_foreign` (`approved_by_id`),
  ADD KEY `employee_special_leaves_recommending_approval_foreign` (`recommending_approval_id`),
  ADD KEY `employee_special_leaves_certified_by_foreign` (`certified_by_id`);

--
-- Indexes for table `hris_employee_spouse`
--
ALTER TABLE `hris_employee_spouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_spouse_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_training_programs`
--
ALTER TABLE `hris_employee_training_programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_training_programs_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_utilities`
--
ALTER TABLE `hris_employee_utilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `hris_employee_voluntary_works`
--
ALTER TABLE `hris_employee_voluntary_works`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_voluntary_works_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_employee_work_experiences`
--
ALTER TABLE `hris_employee_work_experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_work_experiences_employee_id_foreign` (`employee_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_reserved_at_index` (`queue`,`reserved`,`reserved_at`);

--
-- Indexes for table `hris_leave_credits`
--
ALTER TABLE `hris_leave_credits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_credits_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_logs`
--
ALTER TABLE `hris_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hris_messages`
--
ALTER TABLE `hris_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_sender_id_foreign` (`sender_id`),
  ADD KEY `messages_message_group_id_foreign` (`message_group_id`);

--
-- Indexes for table `hris_message_groups`
--
ALTER TABLE `hris_message_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_groups_owner_id_foreign` (`owner_id`);

--
-- Indexes for table `hris_message_group_members`
--
ALTER TABLE `hris_message_group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_group_members_message_group_id_foreign` (`message_group_id`),
  ADD KEY `message_group_members_user_id_foreign` (`user_id`);

--
-- Indexes for table `hris_message_informations`
--
ALTER TABLE `hris_message_informations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_informations_user_id_foreign` (`user_id`),
  ADD KEY `message_informations_message_id_foreign` (`message_id`);

--
-- Indexes for table `hris_notifications`
--
ALTER TABLE `hris_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_sent_to_foreign` (`sent_to`),
  ADD KEY `notifications_sent_by_foreign` (`sent_by`);

--
-- Indexes for table `hris_password_resets`
--
ALTER TABLE `hris_password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `hris_phpdebugbar`
--
ALTER TABLE `hris_phpdebugbar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phpdebugbar_meta_utime_index` (`meta_utime`),
  ADD KEY `phpdebugbar_meta_datetime_index` (`meta_datetime`),
  ADD KEY `phpdebugbar_meta_uri_index` (`meta_uri`),
  ADD KEY `phpdebugbar_meta_ip_index` (`meta_ip`),
  ADD KEY `phpdebugbar_meta_method_index` (`meta_method`);

--
-- Indexes for table `hris_positions`
--
ALTER TABLE `hris_positions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `positions_name_unique` (`name`);

--
-- Indexes for table `hris_salary`
--
ALTER TABLE `hris_salary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salary_salary_grade_unique` (`salary_grade`);

--
-- Indexes for table `hris_sessions`
--
ALTER TABLE `hris_sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `hris_settings`
--
ALTER TABLE `hris_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_user_id_unique` (`user_id`);

--
-- Indexes for table `hris_todos`
--
ALTER TABLE `hris_todos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `todos_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_trainings`
--
ALTER TABLE `hris_trainings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hris_training_participants`
--
ALTER TABLE `hris_training_participants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `training_participants_training_id_employee_id_unique` (`training_id`,`employee_id`),
  ADD KEY `training_participants_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `hris_travel_orders`
--
ALTER TABLE `hris_travel_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `travel_orders_travel_order_number_unique` (`travel_order_number`),
  ADD KEY `travel_orders_employee_id_foreign` (`employee_id`),
  ADD KEY `travel_orders_finance_director_foreign` (`finance_director_id`),
  ADD KEY `travel_orders_recommending_approval_foreign` (`recommending_approval_id`),
  ADD KEY `travel_orders_approved_by_foreign` (`approved_by_id`);

--
-- Indexes for table `hris_users`
--
ALTER TABLE `hris_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_department_id_foreign` (`department_id`);

--
-- Indexes for table `hris_user_positions`
--
ALTER TABLE `hris_user_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_positions_user_id_foreign` (`user_id`),
  ADD KEY `user_positions_position_id_foreign` (`position_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `hris_employee_child`
--
ALTER TABLE `hris_employee_child`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT for table `hris_employee_civil_services`
--
ALTER TABLE `hris_employee_civil_services`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `hris_employee_educations`
--
ALTER TABLE `hris_employee_educations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=312;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `hris_employee_organizations`
--
ALTER TABLE `hris_employee_organizations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=133;
--
-- AUTO_INCREMENT for table `hris_employee_special_leaves`
--
ALTER TABLE `hris_employee_special_leaves`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hris_employee_spouse`
--
ALTER TABLE `hris_employee_spouse`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
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
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=147;
--
-- AUTO_INCREMENT for table `hris_leave_credits`
--
ALTER TABLE `hris_leave_credits`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=167;
--
-- AUTO_INCREMENT for table `hris_positions`
--
ALTER TABLE `hris_positions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `hris_salary`
--
ALTER TABLE `hris_salary`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT for table `hris_training_participants`
--
ALTER TABLE `hris_training_participants`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=138;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=107;
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
-- Constraints for table `hris_leave_credits`
--
ALTER TABLE `hris_leave_credits`
  ADD CONSTRAINT `leave_credits_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `hris_employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
