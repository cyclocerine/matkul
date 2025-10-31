-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2025 at 02:04 AM
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
-- Database: `perpusfti`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `Kode_anggota` char(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` varchar(100) DEFAULT NULL,
  `No_telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`Kode_anggota`, `Nama`, `Alamat`, `No_telp`) VALUES
('A0001', 'Rina Putri', 'Jl. Melati No. 5, Jakarta', '081234567890'),
('A0002', 'Tono Saputra', 'Jl. Mawar No. 7, Bandung', '081278945612'),
('A0003', 'Lia Kartika', 'Jl. Kamboja No. 9, Surabaya', '082134567821'),
('A0004', 'Faisal Rahman', 'Jl. Kenanga No. 2, Malang', '081233445566'),
('A0005', 'Sari Dewi', 'Jl. Teratai No. 10, Yogyakarta', '081267890234'),
('A0006', 'Bayu Setiawan', 'Jl. Kenari No. 3, Bandung', '081298765432'),
('A0007', 'Maya Rachma', 'Jl. Anggrek No. 5, Jakarta', NULL),
('A0008', 'Yoga Pratama', NULL, '081345678901'),
('A0009', 'Silvia Kusuma', 'Jl. Merpati No. 9, Surabaya', '081245678234'),
('A0010', 'Reza Ananda', 'Jl. Sawo No. 2, Bogor', NULL),
('A0011', 'Putri Amelia', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `Kode_buku` char(5) NOT NULL,
  `Judul` varchar(100) NOT NULL,
  `Kode_pengarang` char(4) DEFAULT NULL,
  `Kode_penerbit` char(3) DEFAULT NULL,
  `Tahun_terbit` int(11) DEFAULT NULL,
  `Jml_buku` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`Kode_buku`, `Judul`, `Kode_pengarang`, `Kode_penerbit`, `Tahun_terbit`, `Jml_buku`) VALUES
('B0001', 'Pemrograman Dasar Python', 'A001', 'P01', 2020, 12),
('B0002', 'Basis Data Lanjut', 'A002', 'P02', 2019, 5),
('B0003', 'Jaringan Komputer Modern', 'A003', 'P03', 2021, 8),
('B0004', 'Algoritma dan Struktur Data', 'A001', 'P02', 2018, 15),
('B0005', 'Pemrograman Web dengan PHP', 'A004', 'P01', 2022, 4),
('B0006', 'Dasar-Dasar Desain Grafis', 'A002', 'P03', 2020, 7),
('B0007', 'Pemrograman Mobile Kotlin', 'A001', 'P04', 2023, 10),
('B0008', 'Keamanan Jaringan', 'A003', 'P02', 2021, 2),
('B0009', 'Pemrograman C++', 'A005', 'P01', 2019, 18),
('B0010', 'Pengantar Statistik', 'A002', 'P04', 2022, 5),
('B0011', 'Artificial Intelligence Dasar', 'A006', 'P05', 2024, 9),
('B0012', 'Data Science dengan Python', 'A006', 'P06', 2023, 6),
('B0013', 'Teknologi Masa Depan', 'A006', NULL, 2025, 3),
('B0014', 'Quantum Computing', NULL, 'P05', 2025, 2),
('B0015', 'Belajar Machine Learning', 'A008', 'P10', 2024, 5),
('B0016', 'Deep Learning dengan TensorFlow', 'A008', NULL, 2023, NULL),
('B0017', 'Etika Profesi IT', 'A009', 'P08', 2021, 7),
('B0018', 'Pemrograman Go Lang', 'A010', NULL, 2023, 10),
('B0019', 'Seni Berpikir Komputasional', 'A011', 'P12', 2024, NULL),
('B0020', 'Teknik Big Data', 'A012', 'P03', 2022, 6),
('B0021', 'Robotika Modern', 'A013', NULL, 2025, 2),
('B0022', 'Cyber Security Advanced', 'A003', 'P09', NULL, 4),
('B0023', 'Pemrograman Rust', 'A004', 'P04', 2022, NULL),
('B0024', 'Data Warehouse Terapan', 'A005', NULL, 2020, 8),
('B0025', 'Kecerdasan Buatan Lanjut', 'A006', 'P07', 2025, 9);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `Kode_pinjam` char(6) NOT NULL,
  `Kode_anggota` char(5) NOT NULL,
  `Kode_buku` char(5) DEFAULT NULL,
  `Tgl_pinjam` date NOT NULL,
  `Tgl_kembali` date DEFAULT NULL,
  `Status` enum('Dipinjam','Dikembalikan') DEFAULT 'Dipinjam'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`Kode_pinjam`, `Kode_anggota`, `Kode_buku`, `Tgl_pinjam`, `Tgl_kembali`, `Status`) VALUES
('PJM001', 'A0001', 'B0001', '2025-10-10', '2025-10-20', 'Dikembalikan'),
('PJM002', 'A0002', 'B0003', '2025-10-15', NULL, 'Dipinjam'),
('PJM003', 'A0003', 'B0005', '2025-10-18', NULL, 'Dipinjam'),
('PJM004', 'A0004', 'B0008', '2025-09-30', '2025-10-07', 'Dikembalikan'),
('PJM005', 'A0005', 'B0011', '2025-10-25', NULL, 'Dipinjam'),
('PJM006', 'A0006', 'B0015', '2025-10-10', NULL, 'Dipinjam'),
('PJM007', 'A0007', 'B0013', '2025-10-05', '2025-10-20', 'Dikembalikan'),
('PJM008', 'A0008', 'B0018', '2025-10-15', NULL, 'Dipinjam'),
('PJM009', 'A0009', 'B0020', '2025-09-25', '2025-10-05', 'Dikembalikan'),
('PJM010', 'A0010', 'B0021', '2025-10-18', NULL, 'Dipinjam'),
('PJM011', 'A0011', NULL, '2025-10-10', NULL, 'Dipinjam'),
('PJM012', 'A0011', 'B0019', '2025-10-01', NULL, 'Dipinjam');

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `Kode_penerbit` char(3) NOT NULL,
  `Nama_penerbit` varchar(50) NOT NULL,
  `Kota` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`Kode_penerbit`, `Nama_penerbit`, `Kota`) VALUES
('P01', 'Media Cerdas', 'Jakarta'),
('P02', 'Sinar Ilmu', 'Bandung'),
('P03', 'Lentera Jaya', 'Surabaya'),
('P04', 'Era Baru', 'Jakarta'),
('P05', 'Cahaya Edukasi', 'Yogyakarta'),
('P06', 'Tekno Press', 'Malang'),
('P07', 'Buku Nusantara', 'Denpasar'),
('P08', 'Cakrawala Press', 'Medan'),
('P09', 'Ilmu Mandiri', 'Padang'),
('P10', 'Digital Learn', NULL),
('P11', 'Pustaka Generasi', 'Palembang'),
('P12', 'Smart Publisher', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengarang`
--

CREATE TABLE `pengarang` (
  `Kode_pengarang` char(4) NOT NULL,
  `Nama_pengarang` varchar(50) NOT NULL,
  `Kota_asal` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengarang`
--

INSERT INTO `pengarang` (`Kode_pengarang`, `Nama_pengarang`, `Kota_asal`) VALUES
('A001', 'Andi Nugroho', 'Jakarta'),
('A002', 'Budi Santoso', 'Bandung'),
('A003', 'Citra Lestari', 'Surabaya'),
('A004', 'Dodi Prasetyo', 'Malang'),
('A005', 'Eka Purnama', 'Yogyakarta'),
('A006', 'Fajar Rahman', 'Semarang'),
('A007', 'Gunawan Pradipta', 'Medan'),
('A008', 'Intan Sari', NULL),
('A009', 'Rizky Hidayat', 'Bali'),
('A010', 'Nanda Kusuma', 'Solo'),
('A011', 'Dewi Anggraini', NULL),
('A012', 'Teguh Santoso', 'Makassar'),
('A013', 'Farhan Lubis', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`Kode_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`Kode_buku`),
  ADD KEY `Kode_penerbit` (`Kode_penerbit`),
  ADD KEY `Kode_pengarang` (`Kode_pengarang`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`Kode_pinjam`),
  ADD KEY `Kode_anggota` (`Kode_anggota`),
  ADD KEY `Kode_buku` (`Kode_buku`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`Kode_penerbit`);

--
-- Indexes for table `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`Kode_pengarang`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_buku_penerbit` FOREIGN KEY (`Kode_penerbit`) REFERENCES `penerbit` (`Kode_penerbit`),
  ADD CONSTRAINT `fk_buku_pengarang` FOREIGN KEY (`Kode_pengarang`) REFERENCES `pengarang` (`Kode_pengarang`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `fk_pinjam_anggota` FOREIGN KEY (`Kode_anggota`) REFERENCES `anggota` (`Kode_anggota`),
  ADD CONSTRAINT `fk_pinjam_buku` FOREIGN KEY (`Kode_buku`) REFERENCES `buku` (`Kode_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;