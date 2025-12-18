-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for rumah_sakit
CREATE DATABASE IF NOT EXISTS `rumah_sakit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rumah_sakit`;

-- Dumping structure for table rumah_sakit.accounts_user
CREATE TABLE IF NOT EXISTS `accounts_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(10) NOT NULL,
  `doctor_profile_id` bigint DEFAULT NULL,
  `patient_profile_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `doctor_profile_id` (`doctor_profile_id`),
  UNIQUE KEY `patient_profile_id` (`patient_profile_id`),
  CONSTRAINT `accounts_user_doctor_profile_id_58bdd88a_fk_doctor_id` FOREIGN KEY (`doctor_profile_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `accounts_user_patient_profile_id_2827afd9_fk_patient_id` FOREIGN KEY (`patient_profile_id`) REFERENCES `patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.accounts_user: ~1 rows (approximately)
INSERT INTO `accounts_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `role`, `doctor_profile_id`, `patient_profile_id`) VALUES
	(1, 'pbkdf2_sha256$1000000$wJug4abvy7YAchzrmONl4g$7Kp0s8aO8T/sVHUXmAUANqk0bi6MKpT4EVx/dh+lBHw=', '2025-11-21 08:19:19.281691', 1, 'cyclocerine', '', '', 'hammamfaiq@protonmail.com', 1, 1, '2025-11-21 06:29:43.000000', 'admin', NULL, NULL);

-- Dumping structure for table rumah_sakit.accounts_user_groups
CREATE TABLE IF NOT EXISTS `accounts_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.accounts_user_groups: ~0 rows (approximately)

-- Dumping structure for table rumah_sakit.accounts_user_user_permissions
CREATE TABLE IF NOT EXISTS `accounts_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.accounts_user_user_permissions: ~0 rows (approximately)

-- Dumping structure for table rumah_sakit.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.auth_group: ~3 rows (approximately)
INSERT INTO `auth_group` (`id`, `name`) VALUES
	(3, 'admin'),
	(2, 'akuntan'),
	(1, 'doctor');

-- Dumping structure for table rumah_sakit.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.auth_group_permissions: ~93 rows (approximately)
INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
	(1, 1, 40),
	(2, 1, 45),
	(3, 1, 46),
	(4, 1, 47),
	(5, 1, 48),
	(6, 1, 53),
	(7, 1, 54),
	(8, 1, 55),
	(9, 1, 56),
	(10, 2, 1),
	(11, 2, 2),
	(12, 2, 3),
	(13, 2, 4),
	(14, 2, 33),
	(15, 2, 34),
	(16, 2, 35),
	(17, 2, 36),
	(18, 3, 1),
	(19, 3, 2),
	(20, 3, 3),
	(21, 3, 4),
	(22, 3, 5),
	(23, 3, 6),
	(24, 3, 7),
	(25, 3, 8),
	(26, 3, 9),
	(27, 3, 10),
	(28, 3, 11),
	(29, 3, 12),
	(30, 3, 13),
	(31, 3, 14),
	(32, 3, 15),
	(33, 3, 16),
	(34, 3, 17),
	(35, 3, 18),
	(36, 3, 19),
	(37, 3, 20),
	(38, 3, 21),
	(39, 3, 22),
	(40, 3, 23),
	(41, 3, 24),
	(42, 3, 25),
	(43, 3, 26),
	(44, 3, 27),
	(45, 3, 28),
	(46, 3, 29),
	(47, 3, 30),
	(48, 3, 31),
	(49, 3, 32),
	(50, 3, 33),
	(51, 3, 34),
	(52, 3, 35),
	(53, 3, 36),
	(54, 3, 37),
	(55, 3, 38),
	(56, 3, 39),
	(57, 3, 40),
	(58, 3, 41),
	(59, 3, 42),
	(60, 3, 43),
	(61, 3, 44),
	(62, 3, 45),
	(63, 3, 46),
	(64, 3, 47),
	(65, 3, 48),
	(66, 3, 49),
	(67, 3, 50),
	(68, 3, 51),
	(69, 3, 52),
	(70, 3, 53),
	(71, 3, 54),
	(72, 3, 55),
	(73, 3, 56),
	(74, 3, 57),
	(75, 3, 58),
	(76, 3, 59),
	(77, 3, 60),
	(78, 3, 61),
	(79, 3, 62),
	(80, 3, 63),
	(81, 3, 64),
	(82, 3, 65),
	(83, 3, 66),
	(84, 3, 67),
	(85, 3, 68),
	(86, 3, 69),
	(87, 3, 70),
	(88, 3, 71),
	(89, 3, 72),
	(90, 3, 73),
	(91, 3, 74),
	(92, 3, 75),
	(93, 3, 76);

-- Dumping structure for table rumah_sakit.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.auth_permission: ~76 rows (approximately)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add content type', 4, 'add_contenttype'),
	(14, 'Can change content type', 4, 'change_contenttype'),
	(15, 'Can delete content type', 4, 'delete_contenttype'),
	(16, 'Can view content type', 4, 'view_contenttype'),
	(17, 'Can add session', 5, 'add_session'),
	(18, 'Can change session', 5, 'change_session'),
	(19, 'Can delete session', 5, 'delete_session'),
	(20, 'Can view session', 5, 'view_session'),
	(21, 'Can add doctor', 6, 'add_doctor'),
	(22, 'Can change doctor', 6, 'change_doctor'),
	(23, 'Can delete doctor', 6, 'delete_doctor'),
	(24, 'Can view doctor', 6, 'view_doctor'),
	(25, 'Can add medicine', 7, 'add_medicine'),
	(26, 'Can change medicine', 7, 'change_medicine'),
	(27, 'Can delete medicine', 7, 'delete_medicine'),
	(28, 'Can view medicine', 7, 'view_medicine'),
	(29, 'Can add patient', 8, 'add_patient'),
	(30, 'Can change patient', 8, 'change_patient'),
	(31, 'Can delete patient', 8, 'delete_patient'),
	(32, 'Can view patient', 8, 'view_patient'),
	(33, 'Can add payment', 9, 'add_payment'),
	(34, 'Can change payment', 9, 'change_payment'),
	(35, 'Can delete payment', 9, 'delete_payment'),
	(36, 'Can view payment', 9, 'view_payment'),
	(37, 'Can add room', 10, 'add_room'),
	(38, 'Can change room', 10, 'change_room'),
	(39, 'Can delete room', 10, 'delete_room'),
	(40, 'Can view room', 10, 'view_room'),
	(41, 'Can add supplier', 11, 'add_supplier'),
	(42, 'Can change supplier', 11, 'change_supplier'),
	(43, 'Can delete supplier', 11, 'delete_supplier'),
	(44, 'Can view supplier', 11, 'view_supplier'),
	(45, 'Can add medical record', 12, 'add_medicalrecord'),
	(46, 'Can change medical record', 12, 'change_medicalrecord'),
	(47, 'Can delete medical record', 12, 'delete_medicalrecord'),
	(48, 'Can view medical record', 12, 'view_medicalrecord'),
	(49, 'Can add medical transaction', 13, 'add_medicaltransaction'),
	(50, 'Can change medical transaction', 13, 'change_medicaltransaction'),
	(51, 'Can delete medical transaction', 13, 'delete_medicaltransaction'),
	(52, 'Can view medical transaction', 13, 'view_medicaltransaction'),
	(53, 'Can add prescription', 14, 'add_prescription'),
	(54, 'Can change prescription', 14, 'change_prescription'),
	(55, 'Can delete prescription', 14, 'delete_prescription'),
	(56, 'Can view prescription', 14, 'view_prescription'),
	(57, 'Can add inpatient', 15, 'add_inpatient'),
	(58, 'Can change inpatient', 15, 'change_inpatient'),
	(59, 'Can delete inpatient', 15, 'delete_inpatient'),
	(60, 'Can view inpatient', 15, 'view_inpatient'),
	(61, 'Can add schedule', 16, 'add_schedule'),
	(62, 'Can change schedule', 16, 'change_schedule'),
	(63, 'Can delete schedule', 16, 'delete_schedule'),
	(64, 'Can view schedule', 16, 'view_schedule'),
	(65, 'Can add doctor leave', 17, 'add_doctorleave'),
	(66, 'Can change doctor leave', 17, 'change_doctorleave'),
	(67, 'Can delete doctor leave', 17, 'delete_doctorleave'),
	(68, 'Can view doctor leave', 17, 'view_doctorleave'),
	(69, 'Can add doctor availability', 18, 'add_doctoravailability'),
	(70, 'Can change doctor availability', 18, 'change_doctoravailability'),
	(71, 'Can delete doctor availability', 18, 'delete_doctoravailability'),
	(72, 'Can view doctor availability', 18, 'view_doctoravailability'),
	(73, 'Can add user', 19, 'add_user'),
	(74, 'Can change user', 19, 'change_user'),
	(75, 'Can delete user', 19, 'delete_user'),
	(76, 'Can view user', 19, 'view_user');

-- Dumping structure for table rumah_sakit.doctor
CREATE TABLE IF NOT EXISTS `doctor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `sip_number` varchar(50) NOT NULL,
  `str_number` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `specialty` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `monthly_salary` decimal(10,2) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `working_hours_end` time(6) NOT NULL,
  `working_hours_start` time(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.doctor: ~11 rows (approximately)
INSERT INTO `doctor` (`id`, `name`, `email`, `phone`, `sip_number`, `str_number`, `date_of_birth`, `gender`, `specialty`, `position`, `unit`, `monthly_salary`, `is_available`, `working_hours_end`, `working_hours_start`) VALUES
	(1, 'dr. Kaka Ubed, Sp.Jp', 'kaka@usya.com', '082338423023', '12345678910', '', '2006-11-19', 'Laki-laki', 'Jantung', 'Spesialis', 'IGD', 0.00, 1, '17:00:00.000000', '08:00:00.000000'),
	(2, 'dr. Andi Prasetyo, Sp.PD', 'andi.prasetyo@rssehat.id', '081234567890', '30240145', '202310001', '1981-03-22', 'Laki-laki', 'Penyakit Dalam', 'Dokter Spesialis', 'Poli Penyakit Dalam', 18000000.00, 1, '16:00:00.000000', '08:00:00.000000'),
	(3, 'dr. Siti Maemunah, Sp.A', 'siti.maemunah@rssehat.id', '081278900122', '30240256', '202310002', '1985-07-11', 'Perempuan', 'Anak', 'Dokter Spesialis', 'Poli Anak', 17500000.00, 1, '16:00:00.000000', '08:00:00.000000'),
	(4, 'dr. Budi Hartanto, Sp.B', 'budi.hartanto@rssehat.id', '081311224455', '30240367', '202310003', '1979-09-05', 'Laki-laki', 'Bedah Umum', 'Dokter Spesialis', 'Poli Bedah', 19000000.00, 1, '16:00:00.000000', '08:00:00.000000'),
	(5, 'dr. Rina Kusuma, Sp.KJ', 'rina.kusuma@rssehat.id', '081399002233', '30240478', '202310004', '1987-01-18', 'Perempuan', 'Kejiwaan', 'Dokter Spesialis', 'Poli Psikiatri', 17000000.00, 1, '16:00:00.000000', '08:00:00.000000'),
	(6, 'dr. Ahmad Fauzi, Sp.JP', 'ahmad.fauzi@rssehat.id', '081277889900', '30240589', '202310005', '1983-06-27', 'Laki-laki', 'Jantung & Pembuluh Darah', 'Dokter Spesialis', 'Poli Jantung', 20000000.00, 1, '16:00:00.000000', '08:00:00.000000'),
	(7, 'dr. Lina Agustina, Sp.M', 'lina.agustina@rssehat.id', '081255667788', '30240690', '202310006', '1988-04-09', 'Perempuan', 'Mata', 'Dokter Spesialis', 'Poli Jantung', 16000000.00, 1, '16:00:00.000000', '08:00:00.000000'),
	(8, 'dr. Rudi Setiawan, Sp.OT', 'rudi.setiawan@rssehat.id', '081322334455', '30240721', '202310007', '1980-12-03', 'Laki-laki', 'Ortopedi', 'Dokter Spesialis', 'Poli Tulang', 18500000.00, 1, '16:00:00.000000', '08:00:00.000000'),
	(9, 'dr. Maya Lestari, Sp.THT', 'maya.lestari@rssehat.id', '081277733344', '30240832', '202310008', '1990-05-15', 'Perempuan', 'Telinga Hidung Tenggorokan', 'Dokter Spesialis', 'Poli THT', 16500000.00, 1, '16:00:00.000000', '08:00:00.000000'),
	(10, 'dr. Fajar Nugroho, Sp.KK', 'fajar.nugroho@rssehat.id', '081366778899', '30240943', '202310009', '1986-11-25', 'Laki-laki', 'Kulit & Kelamin', 'Dokter Spesialis', 'Poli Kulit & Kelamin', 17000000.00, 1, '16:00:00.000000', '08:00:00.000000'),
	(11, 'dr. Wulan Sari, Sp.OG', 'wulan.sari@rssehat.id', '081255443322', '30241054', '202310010', '1984-02-14', 'Perempuan', 'Kandungan & Kebidanan', 'Dokter Spesialis', 'Poli Kebidanan', 19000000.00, 1, '16:00:00.000000', '08:00:00.000000');

-- Dumping structure for table rumah_sakit.doctoravailability
CREATE TABLE IF NOT EXISTS `doctoravailability` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `day_of_week` int NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `doctor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `doctoravailability_doctor_id_day_of_week_4a17ccd3_uniq` (`doctor_id`,`day_of_week`),
  CONSTRAINT `doctoravailability_doctor_id_b9babf20_fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.doctoravailability: ~20 rows (approximately)
INSERT INTO `doctoravailability` (`id`, `day_of_week`, `start_time`, `end_time`, `is_active`, `doctor_id`) VALUES
	(1, 1, '08:00:00.000000', '16:00:00.000000', 1, 2),
	(2, 3, '08:00:00.000000', '16:00:00.000000', 1, 2),
	(3, 5, '08:00:00.000000', '16:00:00.000000', 1, 2),
	(4, 6, '09:00:00.000000', '14:00:00.000000', 1, 3),
	(5, 7, '08:00:00.000000', '12:00:00.000000', 1, 3),
	(6, 1, '10:00:00.000000', '18:00:00.000000', 1, 4),
	(7, 4, '10:00:00.000000', '18:00:00.000000', 1, 4),
	(8, 5, '09:00:00.000000', '15:00:00.000000', 1, 5),
	(9, 6, '09:00:00.000000', '15:00:00.000000', 1, 5),
	(10, 5, '13:00:00.000000', '20:00:00.000000', 1, 6),
	(11, 6, '08:00:00.000000', '14:00:00.000000', 1, 6),
	(12, 2, '13:00:00.000000', '17:00:00.000000', 1, 7),
	(13, 6, '13:00:00.000000', '17:00:00.000000', 1, 7),
	(14, 7, '10:00:00.000000', '16:00:00.000000', 1, 8),
	(15, 1, '14:00:00.000000', '18:00:00.000000', 1, 9),
	(16, 3, '14:00:00.000000', '18:00:00.000000', 1, 9),
	(17, 5, '14:00:00.000000', '18:00:00.000000', 1, 9),
	(18, 5, '08:00:00.000000', '12:00:00.000000', 1, 10),
	(19, 2, '09:00:00.000000', '14:00:00.000000', 1, 11),
	(20, 4, '09:00:00.000000', '14:00:00.000000', 1, 11);

-- Dumping structure for table rumah_sakit.doctorleave
CREATE TABLE IF NOT EXISTS `doctorleave` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `doctor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doctorleave_doctor_id_7f99fac5_fk_doctor_id` (`doctor_id`),
  CONSTRAINT `doctorleave_doctor_id_7f99fac5_fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.doctorleave: ~6 rows (approximately)
INSERT INTO `doctorleave` (`id`, `start_date`, `end_date`, `reason`, `created_at`, `doctor_id`) VALUES
	(1, '2025-04-01', '2025-04-07', 'Cuti Hari Raya Idul Fitri', '2025-03-01 10:00:00.000000', 2),
	(2, '2025-12-25', '2025-12-31', 'Liburan Akhir Tahun bersama Keluarga', '2025-11-01 09:00:00.000000', 6),
	(3, '2025-06-10', '2025-06-12', 'Sakit Tifus (Istirahat Bedrest)', '2025-06-10 08:00:00.000000', 4),
	(4, '2025-02-14', '2025-02-14', 'Urusan Keluarga Mendesak', '2025-02-10 14:00:00.000000', 1),
	(5, '2025-09-20', '2025-09-25', 'Menghadiri Seminar Ortopedi Internasional di Jepang', '2025-08-01 11:00:00.000000', 8),
	(6, '2025-03-15', '2025-03-16', 'Acara Pernikahan Adik', '2025-03-01 15:00:00.000000', 3);

-- Dumping structure for table rumah_sakit.inpatient
CREATE TABLE IF NOT EXISTS `inpatient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admission_date` date NOT NULL,
  `discharge_date` date DEFAULT NULL,
  `diagnosis` longtext NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `patient_id` bigint NOT NULL,
  `room_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inpatient_patient_id_882e99f7_fk_patient_id` (`patient_id`),
  KEY `inpatient_room_id_f73fc702_fk_room_id` (`room_id`),
  CONSTRAINT `inpatient_patient_id_882e99f7_fk_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  CONSTRAINT `inpatient_room_id_f73fc702_fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.inpatient: ~0 rows (approximately)

-- Dumping structure for table rumah_sakit.medicalrecord
CREATE TABLE IF NOT EXISTS `medicalrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `examination_date` date NOT NULL,
  `diagnosis` longtext,
  `treatment` longtext,
  `doctor_id` bigint NOT NULL,
  `patient_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `examination_time` time(6) DEFAULT NULL,
  `notes` longtext,
  `status` varchar(20) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `confirmation_status` varchar(20) NOT NULL,
  `rejection_reason` longtext,
  PRIMARY KEY (`id`),
  KEY `medicalrecord_doctor_id_49cf86dd_fk_doctor_id` (`doctor_id`),
  KEY `medicalrecord_patient_id_86c0486f_fk_patient_id` (`patient_id`),
  CONSTRAINT `medicalrecord_doctor_id_49cf86dd_fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `medicalrecord_patient_id_86c0486f_fk_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.medicalrecord: ~11 rows (approximately)
INSERT INTO `medicalrecord` (`id`, `examination_date`, `diagnosis`, `treatment`, `doctor_id`, `patient_id`, `created_at`, `examination_time`, `notes`, `status`, `updated_at`, `confirmation_status`, `rejection_reason`) VALUES
	(1, '2025-11-19', 'Hipertensi', 'Diberikan Amlodipine 10 mg sekali sehari dan dianjurkan diet rendah garam', 1, 2, '2025-11-19 06:54:29.000000', '06:54:29.000000', '-', 'Selesai', '2025-11-19 06:54:29.000000', 'Disetujui', NULL),
	(2, '2025-11-19', 'Diabetes Mellitus Tipe 2', 'Diberikan Metformin 500 mg dua kali sehari dan kontrol gula darah rutin', 1, 3, '2025-11-19 06:54:29.000000', '06:54:29.000000', '-', 'Selesai', '2025-11-19 06:54:29.000000', 'Disetujui', NULL),
	(3, '2025-11-19', 'Infeksi Saluran Pernafasan Akut (ISPA)', 'Diberikan Amoxicillin 500 mg tiga kali sehari selama 5 hari', 8, 4, '2025-11-19 06:54:29.000000', '06:54:29.000000', '-', 'Selesai', '2025-11-19 06:54:29.000000', 'Disetujui', NULL),
	(4, '2025-11-19', 'Gastritis (Maag)', 'Diberikan Omeprazole 20 mg sebelum makan pagi selama 7 hari', 1, 5, '2025-11-19 06:54:29.000000', '06:54:29.000000', '-', 'Selesai', '2025-11-19 06:54:29.000000', 'Disetujui', NULL),
	(5, '2025-11-19', 'Demam Berdarah Dengue (DBD)', 'Diberikan cairan infus, Paracetamol, dan observasi suhu tubuh', 2, 6, '2025-11-19 06:54:29.000000', '06:54:29.000000', '-', 'Selesai', '2025-11-19 06:54:29.000000', 'Disetujui', NULL),
	(6, '2025-11-19', 'Asma Bronkial', 'Diberikan inhaler Salbutamol dan edukasi penggunaan nebulizer', 6, 11, '2025-11-19 06:54:29.000000', '06:54:29.000000', '-', 'Selesai', '2025-11-19 06:54:29.000000', 'Disetujui', NULL),
	(7, '2025-11-19', 'Anemia Defisiensi Zat Besi', 'Diberikan tablet Fe 1x sehari dan dianjurkan konsumsi makanan tinggi zat besi', 1, 8, '2025-11-19 06:54:29.000000', '06:54:29.000000', '-', 'Selesai', '2025-11-19 06:54:29.000000', 'Disetujui', NULL),
	(8, '2025-11-19', 'Tonsilitis Akut', 'Diberikan antibiotik Cefadroxil 500 mg dua kali sehari dan istirahat cukup', 8, 9, '2025-11-19 06:54:29.000000', '06:54:29.000000', '-', 'Selesai', '2025-11-19 06:54:29.000000', 'Disetujui', NULL),
	(9, '2025-11-19', 'Osteoarthritis Lutut', 'Diberikan Meloxicam 7.5 mg sekali sehari dan fisioterapi ringan', 3, 7, '2025-11-19 06:54:29.000000', '06:54:29.000000', '-', 'Selesai', '2025-11-19 06:54:29.000000', 'Disetujui', NULL),
	(10, '2025-11-19', 'Alergi Kulit (Dermatitis)', 'Diberikan Cetirizine 10 mg malam hari dan salep hidrokortison', 9, 10, '2025-11-19 06:54:29.000000', '06:54:29.000000', '-', 'Selesai', '2025-11-19 06:54:29.000000', 'Disetujui', NULL),
	(11, '2025-11-20', 'Jantung Koroner', 'Bedah jantung atas bawah', 1, 1, '2025-11-19 07:39:45.791400', '14:42:37.000000', '', 'Selesai', '2025-11-19 07:43:07.933122', 'Disetujui', '');

-- Dumping structure for table rumah_sakit.medicaltransaction
CREATE TABLE IF NOT EXISTS `medicaltransaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `details` longtext NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `medical_record_id` bigint NOT NULL,
  `payment_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `medicaltransact_medical_record_id_ed591687_fk_medi` (`medical_record_id`),
  KEY `medicaltransaction_payment_id_9f856da7_fk_payment_id` (`payment_id`),
  CONSTRAINT `medicaltransact_medical_record_id_ed591687_fk_medi` FOREIGN KEY (`medical_record_id`) REFERENCES `medicalrecord` (`id`),
  CONSTRAINT `medicaltransaction_payment_id_9f856da7_fk_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.medicaltransaction: ~10 rows (approximately)
INSERT INTO `medicaltransaction` (`id`, `details`, `total`, `medical_record_id`, `payment_id`) VALUES
	(1, 'Diagnosis: DBD Biaya Pengobatan: 1500000 Biaya Rawat Inap: 2000000', 3500000.00, 5, 1),
	(2, 'Diagnosis: Diabetes Mellitus Tipe2 Biaya Pengobatan: 1200000 Biaya Rawat Inap: 7000000', 8200000.00, 2, 2),
	(3, 'Diagnosis: ISPA Biaya Pengobatan: 15000000 Biaya Rawat Inap: 21000000', 36000000.00, 3, 3),
	(4, 'Diagnosis: Gastritis Biaya Pengobatan: 1000000 Biaya Rawat Inap: 3500000', 4500000.00, 4, 4),
	(5, 'Diagnosis: Tonsilitis Akut Biaya Pengobatan: 3000000 Biaya Rawat Inap: 5000000', 8000000.00, 8, 5),
	(6, 'Diagnosis: Asma Bronkial Biaya Pengobatan: 4000000 Biaya Rawat Inap: 21000000', 25000000.00, 6, 6),
	(7, 'Diagnosis: Anemia Defisiensi Zat Besi Biaya Pengobatan: 2000000 Biaya Rawat Inap: 15000000', 17000000.00, 7, 7),
	(8, 'Diagnosis: Osteoarthritis Lutut Biaya Pengobatan: 1500000 Biaya Rawat Inap: 3500000', 5000000.00, 9, 8),
	(9, 'Diagnosis: Alergi Kulit (Dermatitis) Biaya Pengobatan: 2500000 Biaya Rawat Inap: 30000000', 32500000.00, 10, 9),
	(10, 'Diagnosis: Hipertensi Biaya Pengobatan: 1500000 Biaya Rawat Inap: 7500000', 9000000.00, 1, 10);

-- Dumping structure for table rumah_sakit.medicine
CREATE TABLE IF NOT EXISTS `medicine` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `medicine_class` varchar(50) NOT NULL,
  `medicine_type` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL,
  `stock` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `supplier_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medicine_supplier_id_f7dd1afa_fk_supplier_id` (`supplier_id`),
  CONSTRAINT `medicine_supplier_id_f7dd1afa_fk_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.medicine: ~15 rows (approximately)
INSERT INTO `medicine` (`id`, `name`, `medicine_class`, `medicine_type`, `expiry_date`, `stock`, `price`, `supplier_id`) VALUES
	(16, 'Paracetamol 500mg', 'Bebas', 'Tablet', '2026-05-01', 250, 3000.00, 3001),
	(17, 'Amoxicillin 500mg', 'Keras', 'Kapsul', '2026-08-15', 200, 5000.00, 3002),
	(18, 'Cefadroxil 500mg', 'Keras', 'Kapsul', '2026-10-30', 150, 7000.00, 3002),
	(19, 'Oralit', 'Bebas', 'Serbuk', '2027-01-01', 300, 2000.00, 3003),
	(20, 'Omeprazole 20mg', 'Keras', 'Kapsul', '2026-06-10', 180, 6000.00, 3001),
	(21, 'Captopril 25mg', 'Keras', 'Tablet', '2026-12-12', 120, 4000.00, 3004),
	(22, 'Metformin 500mg', 'Keras', 'Tablet', '2026-09-09', 130, 5000.00, 3004),
	(23, 'Vitamin B Complex', 'Bebas', 'Tablet', '2027-02-15', 250, 3500.00, 3003),
	(24, 'Azithromycin 250mg', 'Keras', 'Kapsul', '2026-07-07', 100, 8000.00, 3002),
	(25, 'Ibuprofen 400mg', 'Bebas', 'Tablet', '2026-11-30', 160, 4500.00, 3001),
	(26, 'Amlodipine 10 mg', 'Keras', 'Tablet', '2030-12-31', 5000, 660.00, 3004),
	(27, 'Salbutamol 2 mg', 'Keras', 'Tablet', '2030-12-31', 3500, 178.00, 3003),
	(28, 'Tablet Fe (Zat Besi)', 'Bebas Terbatas', 'Tablet', '2030-12-31', 9000, 330.00, 3001),
	(29, 'Meloxicam 7.5 mg', 'Keras', 'Tablet', '2030-12-31', 2500, 1000.00, 3004),
	(30, 'Cetirizine 10 mg', 'Keras', 'Tablet', '2030-12-31', 4500, 500.00, 3002);

-- Dumping structure for table rumah_sakit.patient
CREATE TABLE IF NOT EXISTS `patient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `blood_type` varchar(3) NOT NULL,
  `bpjs_status` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.patient: ~11 rows (approximately)
INSERT INTO `patient` (`id`, `name`, `address`, `phone`, `date_of_birth`, `gender`, `blood_type`, `bpjs_status`, `created_at`, `updated_at`) VALUES
	(1, 'ulil ganteng', 'seturan', '088888888888', '2008-12-01', 'Laki-laki', 'A+', 'Aktif', '2025-11-19 06:09:05.151464', '2025-11-19 06:09:05.151464'),
	(2, 'Andi Pratama', 'Jl. Merpati Indah No. 12, Kel. Cilandak Barat, Kec. Cilandak, Jakarta Selatan', '81234567890', '1990-03-12', 'Laki-laki', 'B+', 'Aktif', '2025-11-19 06:38:16.000000', '2025-11-19 06:51:49.761010'),
	(3, 'Siti Rahmawati', 'Jl. Melati Putih No. 8, Kel. Antapani, Kec. Antapani, Bandung', '081356789012', '1988-07-25', 'Perempuan', 'AB+', 'Non-Aktif', '2025-11-19 06:38:16.000000', '2025-11-19 06:51:14.641100'),
	(4, 'Budi Santoso', 'Jl. Kenanga Timur No. 25, Kel. Wonokromo, Kec. Wonokromo, Surabaya', '081422334455', '1995-11-03', 'Laki-laki', 'B+', 'Aktif', '2025-11-19 06:38:16.000000', '2025-11-19 06:50:53.727928'),
	(5, 'Rina Marlina', 'Jl. Mawar Asri No. 17, Kel. Umbulharjo, Kec. Umbulharjo, Yogyakarta', '081599887766', '1992-05-18', 'Perempuan', 'A+', 'Aktif', '2025-11-19 06:38:16.000000', '2025-11-19 06:50:30.555513'),
	(6, 'Ahmad Fauzan', 'Jl. Cempaka Baru No. 45, Kel. Medan Timur, Kec. Medan Timur, Medan', '081733445566', '1998-12-30', 'Laki-laki', 'B-', 'Aktif', '2025-11-19 06:38:16.000000', '2025-11-19 06:49:41.627736'),
	(7, 'Lina Mentari', 'Jl. Dahlia Lestari No. 22, Kel. Ilir Barat I, Kec. Ilir Barat, Palembang', '081877665544', '1993-01-14', 'Perempuan', 'AB+', 'Aktif', '2025-11-19 06:38:16.000000', '2025-11-19 06:48:50.252214'),
	(8, 'Rudi Hartono', 'Jl. Flamboyan Utama No. 10, Kel. Panakkukang, Kec. Panakkukang, Makassar', '081922331144', '1996-06-22', 'Laki-laki', 'O+', 'Non-Aktif', '2025-11-19 06:38:16.000000', '2025-11-19 06:48:14.916848'),
	(9, 'Maya Sari', 'Jl. Nusa Indah Selatan No. 5, Kel. Sanur, Kec. Denpasar Selatan, Denpasar', '081190807070', '1991-04-07', 'Perempuan', 'B+', 'Non-Aktif', '2025-11-19 06:38:16.000000', '2025-11-19 06:47:47.048650'),
	(10, 'Fajar Khopling', 'Jl. Melur Indah No. 18, Kel. Tanah Sareal, Kec. Tanah Sareal, Bogor', '081266778899', '1999-10-15', 'Laki-laki', 'A+', 'Non-Aktif', '2025-11-19 06:38:16.000000', '2025-11-19 06:47:10.898857'),
	(11, 'Dwi Setiawan', 'Jl. Anggrek Raya No. 3, Kel. Pedurungan, Kec. Pedurungan, Semarang', '081644556677', '1987-09-09', 'Laki-laki', 'O+', 'Non-Aktif', '2025-11-19 06:38:16.000000', '2025-11-19 06:46:41.058679');

-- Dumping structure for table rumah_sakit.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_date` datetime(6) DEFAULT NULL,
  `method` varchar(50) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `due_date` date DEFAULT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `medical_record_id` bigint DEFAULT NULL,
  `notes` longtext NOT NULL,
  `paid_amount` decimal(12,2) NOT NULL,
  `patient_id` bigint DEFAULT NULL,
  `service_name` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  UNIQUE KEY `medical_record_id` (`medical_record_id`),
  KEY `payment_patient_id_379302b3_fk_patient_id` (`patient_id`),
  CONSTRAINT `payment_medical_record_id_924d78e6_fk_medicalrecord_id` FOREIGN KEY (`medical_record_id`) REFERENCES `medicalrecord` (`id`),
  CONSTRAINT `payment_patient_id_379302b3_fk_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.payment: ~10 rows (approximately)
INSERT INTO `payment` (`id`, `payment_date`, `method`, `amount`, `created_at`, `due_date`, `invoice_number`, `medical_record_id`, `notes`, `paid_amount`, `patient_id`, `service_name`, `status`, `updated_at`) VALUES
	(1, '2025-01-15 00:00:00.000000', 'Tunai', 3500000.00, '2025-11-19 07:23:44.000000', NULL, 'INV/2025/01/001', 5, 'Lunas', 3500000.00, NULL, 'Rawat Inap & Pengobatan', 'Lunas', '2025-11-19 07:23:44.000000'),
	(2, '2025-02-02 00:00:00.000000', 'Debit', 8200000.00, '2025-11-19 07:23:44.000000', NULL, 'INV/2025/02/002', 2, 'Lunas', 8200000.00, NULL, 'Rawat Inap & Pengobatan', 'Lunas', '2025-11-19 07:23:44.000000'),
	(3, '2025-02-10 00:00:00.000000', 'QRIS', 36000000.00, '2025-11-19 07:23:44.000000', NULL, 'INV/2025/02/003', 3, 'Lunas', 36000000.00, NULL, 'Rawat Inap & Pengobatan', 'Lunas', '2025-11-19 07:23:44.000000'),
	(4, '2025-03-08 00:00:00.000000', 'BPJS', 4500000.00, '2025-11-19 07:23:44.000000', NULL, 'INV/2025/03/004', 4, 'Klaim BPJS', 4500000.00, NULL, 'Rawat Inap & Pengobatan', 'Lunas', '2025-11-19 07:23:44.000000'),
	(5, '2025-03-21 00:00:00.000000', 'Transfer Bank', 8000000.00, '2025-11-19 07:23:44.000000', NULL, 'INV/2025/03/005', 8, 'Lunas', 8000000.00, NULL, 'Rawat Inap & Pengobatan', 'Lunas', '2025-11-19 07:23:44.000000'),
	(6, '2025-04-05 00:00:00.000000', 'Tunai', 25000000.00, '2025-11-19 07:23:44.000000', NULL, 'INV/2025/04/006', 6, 'Lunas', 25000000.00, NULL, 'Rawat Inap & Pengobatan', 'Lunas', '2025-11-19 07:23:44.000000'),
	(7, '2025-05-11 00:00:00.000000', 'Debit', 17000000.00, '2025-11-19 07:23:44.000000', NULL, 'INV/2025/05/007', 7, 'Lunas', 17000000.00, NULL, 'Rawat Inap & Pengobatan', 'Lunas', '2025-11-19 07:23:44.000000'),
	(8, '2025-06-07 00:00:00.000000', 'QRIS', 5000000.00, '2025-11-19 07:23:44.000000', NULL, 'INV/2025/06/008', 9, 'Lunas', 5000000.00, NULL, 'Rawat Inap & Pengobatan', 'Lunas', '2025-11-19 07:23:44.000000'),
	(9, '2025-07-18 00:00:00.000000', 'BPJS', 32500000.00, '2025-11-19 07:23:44.000000', NULL, 'INV/2025/07/009', 10, 'Klaim BPJS', 32500000.00, NULL, 'Rawat Inap & Pengobatan', 'Lunas', '2025-11-19 07:23:44.000000'),
	(10, '2025-08-22 00:00:00.000000', 'cash', 9000000.00, '2025-11-19 07:23:44.000000', NULL, 'INV/2025/08/010', 1, 'Lunas', 9000000.00, NULL, 'Rawat Inap & Pengobatan', 'paid', '2025-11-21 11:16:32.308290');

-- Dumping structure for table rumah_sakit.prescription
CREATE TABLE IF NOT EXISTS `prescription` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prescription_date` date NOT NULL,
  `dosage` varchar(50) NOT NULL,
  `notes` longtext NOT NULL,
  `medical_record_id` bigint NOT NULL,
  `medicine_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prescription_medical_record_id_23f889a0_fk_medi` (`medical_record_id`),
  KEY `prescription_medicine_id_b5bf7710_fk_medicine_id` (`medicine_id`),
  CONSTRAINT `prescription_medical_record_id_23f889a0_fk_medi` FOREIGN KEY (`medical_record_id`) REFERENCES `medicalrecord` (`id`),
  CONSTRAINT `prescription_medicine_id_b5bf7710_fk_medicine_id` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.prescription: ~10 rows (approximately)
INSERT INTO `prescription` (`id`, `prescription_date`, `dosage`, `notes`, `medical_record_id`, `medicine_id`) VALUES
	(11, '2025-01-15', '1x sehari sesudah makan', 'Amlodipine 10 mg, diminum 1x sehari setelah makan', 1, 26),
	(12, '2025-02-02', '2x sehari sesudah makan', 'Metformin 500 mg, diminum 2x sehari sesudah makan', 2, 22),
	(13, '2025-02-10', '3x sehari selama 5 hari', 'Amoxicillin 500 mg, diminum 3x sehari selama 5 hari', 3, 17),
	(14, '2025-03-08', '1x sehari sebelum sarapan', 'Omeprazole 20 mg, diminum 1x sehari sebelum sarapan', 4, 20),
	(15, '2025-03-21', 'Tiap 6 jam bila demam', 'Paracetamol 500 mg tiap 6 jam bila demam + cairan infus', 5, 16),
	(16, '2025-04-05', '2x semprot per hari', 'Salbutamol inhaler 2x semprot per hari, nebulizer bila sesak', 6, 27),
	(17, '2025-05-11', '1x sehari', 'Tablet Fe 1x sehari, konsumsi makanan kaya zat besi', 7, 28),
	(18, '2025-06-07', '2x sehari selama 5 hari', 'Cefadroxil 500 mg, diminum 2x sehari selama 5 hari', 8, 18),
	(19, '2025-07-18', '1x sehari', 'Meloxicam 7.5 mg, diminum 1x sehari, lakukan fisioterapi', 9, 29),
	(20, '2025-08-22', '1x malam hari', 'Cetirizine 10 mg malam hari + salep hidrokortison tipis-tipis', 10, 30);

-- Dumping structure for table rumah_sakit.room
CREATE TABLE IF NOT EXISTS `room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `room_type` varchar(20) NOT NULL,
  `capacity` int unsigned NOT NULL,
  `daily_rate` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `room_chk_1` CHECK ((`capacity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.room: ~12 rows (approximately)
INSERT INTO `room` (`id`, `name`, `room_type`, `capacity`, `daily_rate`) VALUES
	(1, 'Pattimura 1 - 3A', 'VIP', 1, 1.00),
	(2, 'Pattimura 1 - 3B', 'VIP', 1, 1.00),
	(3, 'Pattimura 1 - 3C', 'VIP', 1, 1.00),
	(4, 'Pattimura 1 - 3D', 'VIP', 1, 1.00),
	(5, 'Pattimura 2 - 3A', 'ICU', 1, 1.00),
	(6, 'Pattimura 2 - 3B', 'ICU', 1, 1.00),
	(7, 'Pattimura 2 - 3C', 'ICU', 1, 1.00),
	(8, 'Pattimura 2 - 3D', 'ICU', 1, 1.00),
	(9, 'Pattimura 3 - 3A', 'Kelas 1', 2, 5.00),
	(10, 'Pattimura 3 - 3B', 'Kelas 1', 2, 5.00),
	(11, 'Pattimura 3 - 3C', 'Kelas 1', 2, 5.00),
	(12, 'Pattimura 3 - 3C', 'Kelas 1', 2, 5.00);

-- Dumping structure for table rumah_sakit.schedule
CREATE TABLE IF NOT EXISTS `schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `examination_date` date NOT NULL,
  `examination_time` time(6) NOT NULL,
  `doctor_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schedule_doctor_id_examination_da_f2d2fe0a_uniq` (`doctor_id`,`examination_date`,`examination_time`),
  CONSTRAINT `schedule_doctor_id_22c0f77c_fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.schedule: ~10 rows (approximately)
INSERT INTO `schedule` (`id`, `examination_date`, `examination_time`, `doctor_id`, `created_at`, `status`) VALUES
	(1, '2025-01-15', '08:30:00.000000', 2, '2025-11-19 07:32:38.000000', 'Terjadwal'),
	(2, '2025-02-02', '09:15:00.000000', 3, '2025-11-19 07:32:38.000000', 'Terjadwal'),
	(3, '2025-02-10', '10:45:00.000000', 4, '2025-11-19 07:32:38.000000', 'Terjadwal'),
	(4, '2025-03-08', '11:20:00.000000', 5, '2025-11-19 07:32:38.000000', 'Terjadwal'),
	(5, '2025-03-21', '13:00:00.000000', 6, '2025-11-19 07:32:38.000000', 'Terjadwal'),
	(6, '2025-04-05', '14:10:00.000000', 7, '2025-11-19 07:32:38.000000', 'Terjadwal'),
	(7, '2025-05-11', '15:30:00.000000', 8, '2025-11-19 07:32:38.000000', 'Terjadwal'),
	(8, '2025-06-07', '08:00:00.000000', 6, '2025-11-19 07:32:38.000000', 'Terjadwal'),
	(9, '2025-07-18', '10:00:00.000000', 10, '2025-11-19 07:32:38.000000', 'Terjadwal'),
	(10, '2025-08-22', '16:15:00.000000', 9, '2025-11-19 07:32:38.000000', 'Terjadwal');

-- Dumping structure for table rumah_sakit.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.supplier: ~4 rows (approximately)
INSERT INTO `supplier` (`id`, `name`, `address`, `phone`, `email`) VALUES
	(3001, 'PT Sehat Selalu Farma', 'Jl. Sudirman No. 88, Jakarta', '021-5556677', 'info@sehatselalu.co.id'),
	(3002, 'CV Medika Utama', 'Jl. Gatot Subroto No. 22, Bandung', '022-6667788', 'cs@medikautama.com'),
	(3003, 'UD Obat Rakyat', 'Jl. Pemuda No. 45, Surabaya', '031-4445599', 'udobatrakyat@gmail.com'),
	(3004, 'PT Farma Indah', 'Jl. Diponegoro No. 90, Yogyakarta', '0274-557890', 'sales@farmaindah.co.id');

-- Dumping structure for table rumah_sakit.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.django_admin_log: ~5 rows (approximately)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2025-11-21 06:45:35.307637', '1', 'cyclocerine (Admin Rumah Sakit)', 2, '[{"changed": {"fields": ["Role"]}}]', 19, 1),
	(2, '2025-11-21 11:16:32.317636', '10', 'INV-INV/2025/08/010 | Unknown Patient - Rp9,000,000', 2, '[{"changed": {"fields": ["Status", "Method"]}}]', 9, 1),
	(3, '2025-11-21 11:18:05.687314', '1', 'doctor', 1, '[{"added": {}}]', 3, 1),
	(4, '2025-11-21 11:18:52.528308', '2', 'akuntan', 1, '[{"added": {}}]', 3, 1),
	(5, '2025-11-21 11:19:04.242043', '3', 'admin', 1, '[{"added": {}}]', 3, 1);

-- Dumping structure for table rumah_sakit.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.django_content_type: ~19 rows (approximately)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(19, 'accounts', 'user'),
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(6, 'core', 'doctor'),
	(18, 'core', 'doctoravailability'),
	(17, 'core', 'doctorleave'),
	(15, 'core', 'inpatient'),
	(12, 'core', 'medicalrecord'),
	(13, 'core', 'medicaltransaction'),
	(7, 'core', 'medicine'),
	(8, 'core', 'patient'),
	(9, 'core', 'payment'),
	(14, 'core', 'prescription'),
	(10, 'core', 'room'),
	(16, 'core', 'schedule'),
	(11, 'core', 'supplier'),
	(5, 'sessions', 'session');

-- Dumping structure for table rumah_sakit.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.django_migrations: ~26 rows (approximately)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'core', '0001_initial', '2025-11-21 06:24:12.873692'),
	(2, 'contenttypes', '0001_initial', '2025-11-21 06:24:12.924392'),
	(3, 'contenttypes', '0002_remove_content_type_name', '2025-11-21 06:24:12.966532'),
	(4, 'auth', '0001_initial', '2025-11-21 06:24:13.130444'),
	(5, 'auth', '0002_alter_permission_name_max_length', '2025-11-21 06:24:13.162536'),
	(6, 'auth', '0003_alter_user_email_max_length', '2025-11-21 06:24:13.165526'),
	(7, 'auth', '0004_alter_user_username_opts', '2025-11-21 06:24:13.168523'),
	(8, 'auth', '0005_alter_user_last_login_null', '2025-11-21 06:24:13.171524'),
	(9, 'auth', '0006_require_contenttypes_0002', '2025-11-21 06:24:13.173510'),
	(10, 'auth', '0007_alter_validators_add_error_messages', '2025-11-21 06:24:13.175507'),
	(11, 'auth', '0008_alter_user_username_max_length', '2025-11-21 06:24:13.178802'),
	(12, 'auth', '0009_alter_user_last_name_max_length', '2025-11-21 06:24:13.181149'),
	(13, 'auth', '0010_alter_group_name_max_length', '2025-11-21 06:24:13.190270'),
	(14, 'auth', '0011_update_proxy_permissions', '2025-11-21 06:24:13.198235'),
	(15, 'auth', '0012_alter_user_first_name_max_length', '2025-11-21 06:24:13.201238'),
	(16, 'accounts', '0001_initial', '2025-11-21 06:24:13.473287'),
	(17, 'admin', '0001_initial', '2025-11-21 06:24:13.557437'),
	(18, 'admin', '0002_logentry_remove_auto_add', '2025-11-21 06:24:13.563453'),
	(19, 'admin', '0003_logentry_add_action_flag_choices', '2025-11-21 06:24:13.567352'),
	(20, 'admin', '0004_fix_admin_log_foreign_key', '2025-11-21 06:24:13.570357'),
	(21, 'core', '0002_alter_patient_gender', '2025-11-21 06:24:13.584357'),
	(22, 'core', '0003_alter_doctor_gender', '2025-11-21 06:24:13.597256'),
	(23, 'core', '0004_alter_medicalrecord_options_alter_schedule_options_and_more', '2025-11-21 06:24:13.798178'),
	(24, 'core', '0005_alter_payment_options_remove_payment_total_amount_and_more', '2025-11-21 06:24:14.125020'),
	(25, 'core', '0006_doctor_is_available_doctor_working_hours_end_and_more', '2025-11-21 06:24:14.342329'),
	(26, 'sessions', '0001_initial', '2025-11-21 06:24:14.368302');

-- Dumping structure for table rumah_sakit.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rumah_sakit.django_session: ~1 rows (approximately)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('ih0byioqpuyuyn1vc7j8c65uuikcy38s', '.eJxVjEEOwiAQRe_C2hAoEQaX7j0DmRkGqRqalHbVeHdt0oVu_3vvbyrhutS0dpnTmNVFWXX63Qj5KW0H-YHtPmme2jKPpHdFH7Tr25TldT3cv4OKvX5rRBvACQaKZJ1kV_jMTgaI1gxkOBAHjsA2ehOFSvBYrC-QDUAA8ur9AfooOEQ:1vMMMR:U5mY8dXpHvhsQOC9IqKVG2nKHZF4nK9r4zGzDEwt4CI', '2025-12-05 08:19:19.286145');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
