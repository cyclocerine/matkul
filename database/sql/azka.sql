-- Database
CREATE DATABASE IF NOT EXISTS db_laundry;
USE db_laundry;

-- Pelanggan
CREATE TABLE Pelanggan (
  NoPelanggan VARCHAR(20) PRIMARY KEY,
  Nama_Pelanggan VARCHAR(100) NOT NULL,
  No_Hp VARCHAR(20)
);

-- Petugas_Laundry
CREATE TABLE Petugas_Laundry (
  NoPetugas VARCHAR(20) PRIMARY KEY,
  Nama_Petugas VARCHAR(100) NOT NULL,
  No_Hp VARCHAR(20)
);

-- Jenis_Cuci
CREATE TABLE Jenis_Cuci (
  NoJenis VARCHAR(20) PRIMARY KEY,
  Metode_Cuci VARCHAR(100) NOT NULL,
  Daftar_Harga DECIMAL(12,2) NOT NULL CHECK (Daftar_Harga >= 0)
);

-- Layanan
CREATE TABLE Layanan (
  NoLayanan VARCHAR(20) PRIMARY KEY,
  Waktu_Layanan VARCHAR(50),
  Delivery_Layanan ENUM('Ya','Tidak') DEFAULT 'Tidak'
);

-- Transaksi
CREATE TABLE Transaksi (
  NoTransaksi VARCHAR(30) PRIMARY KEY,
  Tgl_Transaksi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Metode_Transaksi VARCHAR(50),
  Total_Transaksi DECIMAL(14,2) DEFAULT 0,
  NoPelanggan VARCHAR(20),
  CONSTRAINT fk_trans_pelanggan FOREIGN KEY (NoPelanggan) REFERENCES Pelanggan(NoPelanggan) ON DELETE SET NULL
);

-- Detail_Transaksi (junction)
CREATE TABLE Detail_Transaksi (
  NoDetailTransaksi VARCHAR(30) PRIMARY KEY,
  NoTransaksi VARCHAR(30) NOT NULL,
  NoJenis VARCHAR(20) NOT NULL,
  Qty DECIMAL(10,2) NOT NULL DEFAULT 1, -- bisa kg atau jumlah
  Harga_Satuan DECIMAL(12,2) NOT NULL,
  Subtotal DECIMAL(14,2) GENERATED ALWAYS AS (Qty * Harga_Satuan) STORED,
  CONSTRAINT fk_dt_trans FOREIGN KEY (NoTransaksi) REFERENCES Transaksi(NoTransaksi) ON DELETE CASCADE,
  CONSTRAINT fk_dt_jenis FOREIGN KEY (NoJenis) REFERENCES Jenis_Cuci(NoJenis) ON DELETE RESTRICT
);

-- Detail_Membuat (siapa meng-handle transaksi)
CREATE TABLE Detail_Membuat (
  NoDetailMembuat VARCHAR(30) PRIMARY KEY,
  NoTransaksi VARCHAR(30) NOT NULL,
  NoPetugas VARCHAR(20) NOT NULL,
  Keterangan VARCHAR(255),
  CONSTRAINT fk_dm_trans FOREIGN KEY (NoTransaksi) REFERENCES Transaksi(NoTransaksi) ON DELETE CASCADE,
  CONSTRAINT fk_dm_petugas FOREIGN KEY (NoPetugas) REFERENCES Petugas_Laundry(NoPetugas) ON DELETE RESTRICT
);

-- Detail_Layanan (petugas yang menangani jenis layanan)
CREATE TABLE Detail_Layanan (
  NoDetailLayanan VARCHAR(30) PRIMARY KEY,
  NoPetugas VARCHAR(20) NOT NULL,
  NoLayanan VARCHAR(20) NOT NULL,
  Keterangan VARCHAR(255),
  CONSTRAINT fk_dl_petugas FOREIGN KEY (NoPetugas) REFERENCES Petugas_Laundry(NoPetugas) ON DELETE CASCADE,
  CONSTRAINT fk_dl_layanan FOREIGN KEY (NoLayanan) REFERENCES Layanan(NoLayanan) ON DELETE CASCADE
);

-- Log untuk audit trigger
CREATE TABLE Log_Transaksi (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  NoTransaksi VARCHAR(30),
  Action VARCHAR(50),
  CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_log_trans FOREIGN KEY (NoTransaksi) REFERENCES Transaksi(NoTransaksi) ON DELETE SET NULL
);

-- PELANGGAN (10)
INSERT INTO Pelanggan (NoPelanggan, Nama_Pelanggan, No_Hp) VALUES
('P0001','Andi Setiawan','0811111111'),
('P0002','Budi Santoso','0812222222'),
('P0003','Citra Dewi','0813333333'),
('P0004','Dewi Lestari','0814444444'),
('P0005','Eka Pratama','0815555555'),
('P0006','Fajar W','0816666666'),
('P0007','Gita R','0817777777'),
('P0008','Hendra S','0818888888'),
('P0009','Ika N','0819999999'),
('P0010','Joko R','0820000000');

-- PETUGAS (10)
INSERT INTO Petugas_Laundry (NoPetugas, Nama_Petugas, No_Hp) VALUES
('PT001','Rizal','0821000001'),
('PT002','Sari','0821000002'),
('PT003','Toni','0821000003'),
('PT004','Wulan','0821000004'),
('PT005','Yusuf','0821000005'),
('PT006','Zahra','0821000006'),
('PT007','Agus','0821000007'),
('PT008','Bella','0821000008'),
('PT009','Dodi','0821000009'),
('PT010','Erna','0821000010');

-- JENIS_CUCI (10)
INSERT INTO Jenis_Cuci (NoJenis, Metode_Cuci, Daftar_Harga) VALUES
('J001','Cuci Kering','15000'),
('J002','Cuci Basah','12000'),
('J003','Setrika Saja','8000'),
('J004','Cuci Ekspres','25000'),
('J005','Cuci Sepatu','30000'),
('J006','Cuci Bed Cover','45000'),
('J007','Cuci Karpet','60000'),
('J008','Cuci Jaket','20000'),
('J009','Cuci Boneka','35000'),
('J010','Cuci Sofa','75000');

-- LAYANAN (10)
INSERT INTO Layanan (NoLayanan, Waktu_Layanan, Delivery_Layanan) VALUES
('L001','24 jam','Ya'),
('L002','48 jam','Ya'),
('L003','72 jam','Tidak'),
('L004','2 hari kerja','Tidak'),
('L005','Express 6 jam','Ya'),
('L006','Express 12 jam','Ya'),
('L007','Pengambilan dan Antar','Ya'),
('L008','Sameday','Ya'),
('L009','Weekend Service','Tidak'),
('L010','Reguler','Tidak');

-- TRANSAKSI (10)
INSERT INTO Transaksi (NoTransaksi, Tgl_Transaksi, Metode_Transaksi, Total_Transaksi, NoPelanggan) VALUES
('T0001','2025-11-01 09:10:00','Tunai',0,'P0001'),
('T0002','2025-11-02 10:20:00','NonTunai',0,'P0002'),
('T0003','2025-11-02 11:00:00','Tunai',0,'P0003'),
('T0004','2025-11-03 13:30:00','Tunai',0,'P0004'),
('T0005','2025-11-04 15:00:00','NonTunai',0,'P0005'),
('T0006','2025-11-05 16:45:00','Tunai',0,'P0006'),
('T0007','2025-11-06 09:00:00','NonTunai',0,'P0007'),
('T0008','2025-11-06 09:30:00','Tunai',0,'P0008'),
('T0009','2025-11-07 10:30:00','Tunai',0,'P0009'),
('T0010','2025-11-07 11:15:00','NonTunai',0,'P0010');

-- DETAIL_TRANSAKSI (10) -> gunakan harga dari Jenis_Cuci
INSERT INTO Detail_Transaksi (NoDetailTransaksi, NoTransaksi, NoJenis, Qty, Harga_Satuan) VALUES
('DT001','T0001','J001',2,15000),
('DT002','T0001','J003',1,8000),
('DT003','T0002','J002',3,12000),
('DT004','T0003','J004',1,25000),
('DT005','T0004','J006',1,45000),
('DT006','T0005','J005',2,30000),
('DT007','T0006','J001',1,15000),
('DT008','T0007','J008',2,20000),
('DT009','T0008','J010',1,75000),
('DT010','T0009','J007',1,60000);

-- DETAIL_MEMBUAT (10) -> siapa yang membuat/menangani
INSERT INTO Detail_Membuat (NoDetailMembuat, NoTransaksi, NoPetugas, Keterangan) VALUES
('DM001','T0001','PT001','Terima'),
('DM002','T0002','PT002','Terima'),
('DM003','T0003','PT003','Terima'),
('DM004','T0004','PT004','Terima'),
('DM005','T0005','PT005','Terima'),
('DM006','T0006','PT006','Terima'),
('DM007','T0007','PT007','Terima'),
('DM008','T0008','PT008','Terima'),
('DM009','T0009','PT009','Terima'),
('DM010','T0010','PT010','Terima');

-- DETAIL_LAYANAN (10)
INSERT INTO Detail_Layanan (NoDetailLayanan, NoPetugas, NoLayanan, Keterangan) VALUES
('DL001','PT001','L001','Shift Pagi'),
('DL002','PT002','L002','Shift Siang'),
('DL003','PT003','L003','Shift Malam'),
('DL004','PT004','L004','Shift Pagi'),
('DL005','PT005','L005','Express'),
('DL006','PT006','L006','Express'),
('DL007','PT007','L007','Agen'),
('DL008','PT008','L008','Sameday'),
('DL009','PT009','L009','Weekend'),
('DL010','PT010','L010','Reguler');

CREATE OR REPLACE VIEW vw_transaksi_detail AS
SELECT
  t.NoTransaksi,
  t.Tgl_Transaksi,
  p.Nama_Pelanggan,
  t.Metode_Transaksi,
  t.Total_Transaksi,
  pm.NoPetugas AS Petugas_PenanggungJawab,
  pt.Nama_Petugas
FROM Transaksi t
LEFT JOIN Pelanggan p ON t.NoPelanggan = p.NoPelanggan
LEFT JOIN Detail_Membuat pm ON pm.NoTransaksi = t.NoTransaksi
LEFT JOIN Petugas_Laundry pt ON pt.NoPetugas = pm.NoPetugas;

DELIMITER $$

CREATE PROCEDURE sp_calculate_total(IN p_NoTransaksi VARCHAR(30), OUT p_Total DECIMAL(14,2))
BEGIN
  SELECT IFNULL(SUM(Subtotal),0) INTO p_Total
  FROM Detail_Transaksi
  WHERE NoTransaksi = p_NoTransaksi;

  -- update di tabel Transaksi juga
  UPDATE Transaksi SET Total_Transaksi = p_Total WHERE NoTransaksi = p_NoTransaksi;
END$$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER trg_after_insert_detail_trans
AFTER INSERT ON Detail_Transaksi
FOR EACH ROW
BEGIN
  -- Update total transaksi dengan menjumlahkan semua subtotal
  UPDATE Transaksi t
  SET t.Total_Transaksi = (
    SELECT IFNULL(SUM(d.Subtotal),0)
    FROM Detail_Transaksi d
    WHERE d.NoTransaksi = NEW.NoTransaksi
  )
  WHERE t.NoTransaksi = NEW.NoTransaksi;

  -- Tambah log
  INSERT INTO Log_Transaksi (NoTransaksi, Action) VALUES (NEW.NoTransaksi, CONCAT('INSERT Detail: ', NEW.NoDetailTransaksi));
END$$

DELIMITER ;
SELECT IFNULL(SUM(d.Subtotal),0)
FROM Detail_Transaksi d
WHERE d.NoTransaksi = NEW.NoTransaksi
DELIMITER $$

CREATE TRIGGER trg_before_delete_trans
BEFORE DELETE ON Transaksi
FOR EACH ROW
BEGIN
  DECLARE cnt INT;
  SELECT COUNT(*) INTO cnt FROM Detail_Transaksi WHERE NoTransaksi = OLD.NoTransaksi;
  IF cnt > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tidak bisa menghapus transaksi yang memiliki detail.';
  END IF;
END$$

DELIMITER ;
SELECT COUNT(*) INTO cnt 
FROM Detail_Transaksi 
WHERE NoTransaksi = OLD.NoTransaksi
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Tidak bisa menghapus transaksi yang memiliki detail.';
SELECT * FROM Transaksi;

SELECT * FROM Transaksi WHERE NoPelanggan = 'P0001';

SELECT * FROM Transaksi ORDER BY Tgl_Transaksi DESC;

SELECT * FROM Transaksi ORDER BY Tgl_Transaksi DESC LIMIT 5;

SELECT t.NoTransaksi, p.Nama_Pelanggan, j.Metode_Cuci, d.Qty
FROM Transaksi t
JOIN Pelanggan p ON t.NoPelanggan = p.NoPelanggan
JOIN Detail_Transaksi d ON d.NoTransaksi = t.NoTransaksi
JOIN Jenis_Cuci j ON j.NoJenis = d.NoJenis;

SELECT p.Nama_Pelanggan, SUM(t.Total_Transaksi) AS TotalBelanja
FROM Pelanggan p
JOIN Transaksi t ON p.NoPelanggan = t.NoPelanggan
GROUP BY p.NoPelanggan;

SELECT p.NoPelanggan, p.Nama_Pelanggan, SUM(t.Total_Transaksi) AS TotalBelanja
FROM Pelanggan p
JOIN Transaksi t ON t.NoPelanggan = p.NoPelanggan
GROUP BY p.NoPelanggan, p.Nama_Pelanggan
HAVING SUM(t.Total_Transaksi) > 50000;

SELECT * FROM Transaksi
WHERE Total_Transaksi = (SELECT MAX(Total_Transaksi) FROM Transaksi);

SELECT * FROM vw_transaksi_detail;

SELECT DISTINCT Nama_Pelanggan
FROM Pelanggan
WHERE NoPelanggan IN (
    SELECT NoPelanggan 
    FROM Transaksi 
    WHERE Total_Transaksi > (SELECT AVG(Total_Transaksi) FROM Transaksi)
);


UPDATE Jenis_Cuci
SET Daftar_Harga = Daftar_Harga * 1.10
WHERE Metode_Cuci = 'Cuci Kering';

DELETE FROM Transaksi WHERE No_Transaksi = 'T0010';
