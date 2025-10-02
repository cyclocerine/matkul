CREATE DATABASE crafthub;
USE crafthub;

CREATE TABLE penjual (
    id_penjual INT PRIMARY KEY,
    nama_penjual VARCHAR(100) NOT NULL,
    alamat_penjual VARCHAR(255),
    kota_penjual VARCHAR(50),
    nomor_telepon VARCHAR(15) UNIQUE -- Constraint: Unique
);

CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    usia INT,
    alamat VARCHAR(255),
    kota VARCHAR(50),
    nomor_telepon VARCHAR(15) UNIQUE, -- Constraint: Unique
    CONSTRAINT chk_usia CHECK (usia > 0) -- Constraint: Check
);

CREATE TABLE produk (
    id_produk INT PRIMARY KEY,
    nama_produk VARCHAR(100) UNIQUE NOT NULL,
    harga_satuan DECIMAL(10, 2),
    kategori VARCHAR(50),
    stok INT,
    id_penjual INT,
    CONSTRAINT fk_produk_penjual FOREIGN KEY (id_penjual) REFERENCES penjual(id_penjual),
    CONSTRAINT chk_harga CHECK (harga_satuan > 0)
);

-- 4. Membuat Tabel pembelian
CREATE TABLE pembelian (
    id_pembelian INT PRIMARY KEY,
    tanggal_pembelian DATE NOT NULL,
    id_pelanggan INT,
    CONSTRAINT fk_pembelian_pelanggan FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan) -- Constraint: Foreign Key
);

-- 5. Membuat Tabel detail_pembelian
CREATE TABLE detail_pembelian (
    id_pembelian INT,
    id_produk INT,
    jumlah_barang INT NOT NULL,
    PRIMARY KEY (id_pembelian, id_produk), -- Primary Key Komposit
    CONSTRAINT fk_detail_pembelian_pembelian FOREIGN KEY (id_pembelian) REFERENCES pembelian(id_pembelian), -- Constraint: Foreign Key
    CONSTRAINT fk_detail_pembelian_produk FOREIGN KEY (id_produk) REFERENCES produk(id_produk), -- Constraint: Foreign Key
    CONSTRAINT chk_jumlah CHECK (jumlah_barang > 0) -- Constraint: Check
);

-- Input Data (minimal 4 data pada setiap tabel)

INSERT INTO penjual (id_penjual, nama_penjual, alamat_penjual, kota_penjual, nomor_telepon) VALUES
(101, 'Batik Lestari', 'Jl. Solo Km 5', 'Yogyakarta', '081112223333'),
(102, 'Keramik Indah', 'Jl. Pahlawan No. 10', 'Bandung', '082223334444'),
(103, 'Tenun Nusantara', 'Jl. Merdeka No. 20', 'Denpasar', '083334445555'),
(104, 'Perak Jogja', 'Jl. Malioboro 1A', 'Yogyakarta', '084445556666');

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, usia, alamat, kota, nomor_telepon) VALUES
(1, 'Andi Wijaya', 28, 'Jl. Mawar No. 5', 'Yogyakarta', '085556667777'),
(2, 'Budi Santoso', 24, 'Jl. Sudirman 12', 'Jakarta', '086667778888'),
(3, 'Citra Dewi', 30, 'Perumahan Asri Blok C', 'Yogyakarta', '087778889999'),
(4, 'Dian Pratiwi', 20, 'Gg. Melati No. 4', 'Surabaya', '088889990000');

INSERT INTO produk (id_produk, nama_produk, harga_satuan, kategori, stok, id_penjual) VALUES
(1001, 'Kemeja Batik Tulis', 350000.00, 'Pakaian', 50, 101),
(1002, 'Piring Keramik Hias', 120000.00, 'Perabotan', 120, 102),
(1003, 'Selendang Tenun', 450000.00, 'Pakaian', 30, 103),
(1004, 'Cincin Perak Ukir', 180000.00, 'Perhiasan', 80, 104);

INSERT INTO pembelian (id_pembelian, tanggal_pembelian, id_pelanggan) VALUES
(1, '2025-09-20', 1),
(2, '2025-09-21', 2),
(3, '2025-09-21', 3),
(4, '2025-09-22', 1);

INSERT INTO detail_pembelian (id_pembelian, id_produk, jumlah_barang) VALUES
(1, 1001, 2),
(1, 1002, 1),
(2, 1003, 1),
(3, 1004, 5),
(4, 1001, 3);

SELECT
    P.id_pelanggan,
    DP.id_produk,
    (DP.jumlah_barang * PR.harga_satuan) AS total_bayar
FROM
    detail_pembelian DP
JOIN
    pembelian P ON DP.id_pembelian = P.id_pembelian
JOIN
    produk PR ON DP.id_produk = PR.id_produk;


SELECT DISTINCT
    kategori
FROM
    produk;


SELECT
    *
FROM
    pelanggan
WHERE
    usia > 25 AND kota = 'Yogyakarta';


UPDATE
    pelanggan
SET
    alamat = 'Jl. Baru No. 10',
    no_hp = '081234567890'
WHERE
    id_pelanggan = 1;


DELETE FROM
    pelanggan
WHERE
    MOD(id_pelanggan, 2) = 0;


