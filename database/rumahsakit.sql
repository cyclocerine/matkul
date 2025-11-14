-- Membuat database (opsional, jika belum ada)
CREATE DATABASE IF NOT EXISTS rumah_sakit;
USE rumah_sakit;

-- Tabel Pasien
CREATE TABLE Pasien (
    id_pasien INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT,
    no_tlp VARCHAR(20),
    tgl_lahir DATE,
    jenis_kelamin ENUM('L', 'P'),
    gol_darah CHAR(3),
    status_bpjs VARCHAR(50)
);

-- Tabel Dokter
CREATE TABLE Dokter (
    id_dokter INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    no_telp VARCHAR(20),
    no_sip VARCHAR(50),
    no_str VARCHAR(50),
    tgl_lahir DATE,
    jenis_kelamin ENUM('L', 'P'),
    spesialis VARCHAR(100),
    jabatan VARCHAR(100),
    unit_pelayanan VARCHAR(100),
    gaji_perbulan DECIMAL(10,2)
);

-- Tabel Ruangan
CREATE TABLE Ruangan (
    id_ruangan INT AUTO_INCREMENT PRIMARY KEY,
    nama_ruangan VARCHAR(100) NOT NULL,
    tipe_ruangan VARCHAR(50),
    kapasitas INT,
    tarif_perhari DECIMAL(10,2)
);

-- Tabel Suplier_obat
CREATE TABLE Suplier_obat (
    id_suplier INT AUTO_INCREMENT PRIMARY KEY,
    nama_suplier VARCHAR(100) NOT NULL,
    alamat TEXT,
    no_telp VARCHAR(20),
    email VARCHAR(100)
);

-- Tabel Obat
CREATE TABLE Obat (
    id_obat INT AUTO_INCREMENT PRIMARY KEY,
    nama_obat VARCHAR(100) NOT NULL,
    gol_obat VARCHAR(50),
    jenis_obat VARCHAR(50),
    tgl_kadaluarsa DATE,
    stok INT DEFAULT 0,
    harga_obat DECIMAL(10,2),
    id_suplier INT,
    FOREIGN KEY (id_suplier) REFERENCES Suplier_obat(id_suplier) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabel Rekam_medis
CREATE TABLE Rekam_medis (
    id_rekammedis INT AUTO_INCREMENT PRIMARY KEY,
    id_pasien INT NOT NULL,
    id_dokter INT NOT NULL,
    tgl_periksa DATE NOT NULL,
    diagnosis TEXT,
    pengobatan TEXT,
    FOREIGN KEY (id_pasien) REFERENCES Pasien(id_pasien) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_dokter) REFERENCES Dokter(id_dokter) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabel Rawat_inap
CREATE TABLE Rawat_inap (
    id_rawat INT AUTO_INCREMENT PRIMARY KEY,
    id_pasien INT NOT NULL,
    id_ruangan INT NOT NULL,
    tgl_masuk DATE NOT NULL,
    tgl_keluar DATE,
    diagnosis TEXT,
    biaya_rawat DECIMAL(10,2),
    FOREIGN KEY (id_pasien) REFERENCES Pasien(id_pasien) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_ruangan) REFERENCES Ruangan(id_ruangan) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabel Resep_obat
CREATE TABLE Resep_obat (
    id_resep INT AUTO_INCREMENT PRIMARY KEY,
    id_rekammedis INT NOT NULL,
    id_obat INT NOT NULL,
    tgl_resep DATE NOT NULL,
    dosis VARCHAR(50),
    keterangan TEXT,
    FOREIGN KEY (id_rekammedis) REFERENCES Rekam_medis(id_rekammedis) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_obat) REFERENCES Obat(id_obat) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabel Jadwal_pemeriksaan
CREATE TABLE Jadwal_pemeriksaan (
    id_jadwal INT AUTO_INCREMENT PRIMARY KEY,
    id_dokter INT NOT NULL,
    tgl_periksa DATE NOT NULL,
    jam_periksa TIME NOT NULL,
    FOREIGN KEY (id_dokter) REFERENCES Dokter(id_dokter) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabel Pembayaran
CREATE TABLE Pembayaran (
    id_pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    tgl_bayar DATE NOT NULL,
    metode_bayar VARCHAR(50),
    total_biaya DECIMAL(10,2)
);

-- Tabel Transaksi_medis
CREATE TABLE Transaksi_medis (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_rekammedis INT NOT NULL,
    id_pembayaran INT NOT NULL,
    detail_transaksi TEXT,
    total_transaksi DECIMAL(10,2),
    FOREIGN KEY (id_rekammedis) REFERENCES Rekam_medis(id_rekammedis) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_pembayaran) REFERENCES Pembayaran(id_pembayaran) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Pasien (nama, alamat, no_tlp, tgl_lahir, jenis_kelamin, gol_darah, status_bpjs) VALUES
('Ahmad Fauzi', 'Jl. Merdeka No.10, Jakarta', '081234567890', '1985-03-12', 'L', 'A+', 'Aktif'),
('Siti Rahayu', 'Jl. Sudirman No.25, Bandung', '082198765432', '1990-07-22', 'P', 'O-', 'Non-Aktif'),
('Budi Santoso', 'Jl. Diponegoro No.5, Surabaya', '085612345678', '1978-11-30', 'L', 'B+', 'Aktif'),
('Dewi Lestari', 'Jl. Gatot Subroto No.15, Yogyakarta', '089876543210', '2000-01-15', 'P', 'AB+', 'Aktif'),
('Rudi Hartono', 'Jl. Imam Bonjol No.8, Medan', '081345678901', '1995-09-05', 'L', 'A-', 'Non-Aktif');

INSERT INTO Dokter (nama, email, no_telp, no_sip, no_str, tgl_lahir, jenis_kelamin, spesialis, jabatan, unit_pelayanan, gaji_perbulan) VALUES
('Dr. Andi Pratama', 'andi.pratama@rs.id', '081122334455', 'SIP-12345/JKT/2020', 'STR-98765', '1980-05-14', 'L', 'Jantung', 'Konsultan Senior', 'Poli Jantung', 25000000),
('Dr. Maya Sari', 'maya.sari@rs.id', '082233445566', 'SIP-23456/BND/2019', 'STR-87654', '1988-12-03', 'P', 'Kandungan', 'Dokter Spesialis', 'Poli Kandungan', 22000000),
('Dr. Rudi Gunawan', 'rudi.gunawan@rs.id', '083344556677', 'SIP-34567/SBY/2021', 'STR-76543', '1983-08-20', 'L', 'Bedah Umum', 'Dokter Bedah', 'Instalasi Bedah', 24000000),
('Dr. Lina Wijaya', 'lina.wijaya@rs.id', '084455667788', 'SIP-45678/YGY/2018', 'STR-65432', '1992-02-28', 'P', 'Anak', 'Dokter Spesialis Anak', 'Poli Anak', 21000000),
('Dr. Eko Prasetyo', 'eko.prasetyo@rs.id', '085566778899', 'SIP-56789/MED/2022', 'STR-54321', '1986-10-10', 'L', 'Mata', 'Dokter Spesialis Mata', 'Poli Mata', 23000000);

INSERT INTO Ruangan (nama_ruangan, tipe_ruangan, kapasitas, tarif_perhari) VALUES
('Ruangan Melati', 'VIP', 1, 1500000),
('Ruangan Kenanga', 'Kelas 1', 2, 900000),
('Ruangan Cempaka', 'Kelas 2', 4, 600000),
('Ruangan Dahlia', 'ICU', 1, 3000000),
('Ruangan Anggrek', 'Kelas 3', 6, 400000);

INSERT INTO Suplier_obat (nama_suplier, alamat, no_telp, email) VALUES
('PT Kimia Farma', 'Jl. Raya Bogor No.100, Jakarta', '021-1234567', 'cs@kimiafarma.co.id'),
('PT Kalbe Farma', 'Jl. Pulomas Selatan No.5, Jakarta', '021-7654321', 'info@kalbefarma.com'),
('PT Tempo Scan Pacific', 'Jl. Raya Bekasi KM.22, Bekasi', '021-8888999', 'customercare@tempo-scan.com');

INSERT INTO Obat (nama_obat, gol_obat, jenis_obat, tgl_kadaluarsa, stok, harga_obat, id_suplier) VALUES
('Amoxicillin 500mg', 'Antibiotik', 'Kapsul', '2026-12-31', 150, 5000, 1),
('Paracetamol 500mg', 'Analgesik', 'Tablet', '2027-06-30', 300, 2000, 2),
('Captopril 12.5mg', 'Antihypertensi', 'Tablet', '2026-08-15', 200, 3000, 1),
('Dextamine', 'Vitamin', 'Syrup', '2027-03-20', 100, 15000, 3),
('Omeprazole 20mg', 'Antasida', 'Kapsul', '2026-11-10', 180, 8000, 2);

INSERT INTO Rekam_medis (id_pasien, id_dokter, tgl_periksa, diagnosis, pengobatan) VALUES
(1, 1, '2025-11-01', 'Hipertensi ringan', 'Captopril 1x1 selama 7 hari'),
(2, 2, '2025-11-02', 'Kehamilan 12 minggu', 'Pemeriksaan USG, suplemen asam folat'),
(3, 3, '2025-11-03', 'Apendisitis akut', 'Operasi apendektomi darurat'),
(4, 4, '2025-11-04', 'Demam tinggi dan batuk', 'Paracetamol + istirahat'),
(1, 5, '2025-11-10', 'Iritasi konjungtiva', 'Tetes mata antibiotik 4x sehari');

INSERT INTO Rawat_inap (id_pasien, id_ruangan, tgl_masuk, tgl_keluar, diagnosis, biaya_rawat) VALUES
(3, 4, '2025-11-03', '2025-11-10', 'Pasca operasi apendisitis', 21000000),  -- 7 hari ICU
(1, 1, '2025-11-05', '2025-11-08', 'Observasi jantung', 4500000),       -- 3 hari VIP
(2, 2, '2025-11-02', '2025-11-04', 'Rawat inap kehamilan', 1800000);     -- 2 hari Kelas 1

INSERT INTO Rawat_inap (id_pasien, id_ruangan, tgl_masuk, tgl_keluar, diagnosis, biaya_rawat) VALUES
(3, 4, '2025-11-03', '2025-11-10', 'Pasca operasi apendisitis', 21000000),  -- 7 hari ICU
(1, 1, '2025-11-05', '2025-11-08', 'Observasi jantung', 4500000),       -- 3 hari VIP
(2, 2, '2025-11-02', '2025-11-04', 'Rawat inap kehamilan', 1800000);     -- 2 hari Kelas 1

INSERT INTO Jadwal_pemeriksaan (id_dokter, tgl_periksa, jam_periksa) VALUES
(1, '2025-11-15', '08:00:00'),
(1, '2025-11-15', '10:00:00'),
(2, '2025-11-16', '09:00:00'),
(3, '2025-11-17', '13:00:00'),
(4, '2025-11-18', '14:00:00');

INSERT INTO Pembayaran (tgl_bayar, metode_bayar, total_biaya) VALUES
('2025-11-08', 'Transfer Bank', 4800000),
('2025-11-04', 'BPJS', 0),
('2025-11-10', 'Cash', 21500000),
('2025-11-12', 'Debit Card', 85000);

INSERT INTO Transaksi_medis (id_rekammedis, id_pembayaran, detail_transaksi, total_transaksi) VALUES
(1, 1, 'Konsultasi + Obat Captopril', 4800000),
(2, 2, 'Pemeriksaan ANC + USG', 0),
(5, 3, 'Konsultasi Mata + Obat Amoxicillin', 21500000),
(4, 4, 'Obat Paracetamol', 85000);