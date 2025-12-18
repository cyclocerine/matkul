-- 1. DATA AKUN PENGGUNA (accounts_user)
INSERT INTO `accounts_user` VALUES 
(1,'pbkdf2_sha256$1000000$Vun3WbiGz0jvA8Gka5X6mv$T8bQBaie4JL/LNKaOZIVtD1Dol9KRfQKB08buAGWts8=','2025-11-19 07:42:18.987937',1,'cyclocerine','','','hammamfaiq@protonmail.com',1,1,'2025-11-18 03:28:50.000000','admin',NULL,NULL),
(2,'pbkdf2_sha256$1000000$K0dwLmHKlZhupC4SUEFMUd$av5TrKVytoPW8g935Q5Zr/8K0apWBtqw2wkng70q/Vg=','2025-11-19 07:39:13.575189',0,'ulilganteng_','ulil','ganteng','ulil@gmail.com',0,1,'2025-11-19 06:09:03.075383','patient',NULL,1),
(3,'pbkdf2_sha256$1000000$0tnW0wvJH5ExJWJXPk95uA$oX+RYaPMo9E+Kx1ObsxeB6C+fhxZxO0CqZOffMX2SyE=','2025-11-19 07:41:45.153124',0,'kakaubaedi','kaka','ubed','kaka@usya.com',0,1,'2025-11-19 06:11:56.674612','doctor',1,NULL);

-- 2. PERIZINAN (auth_permission)
INSERT INTO `auth_permission` VALUES 
(1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add doctor',6,'add_doctor'),(22,'Can change doctor',6,'change_doctor'),(23,'Can delete doctor',6,'delete_doctor'),(24,'Can view doctor',6,'view_doctor'),(25,'Can add medicine',7,'add_medicine'),(26,'Can change medicine',7,'change_medicine'),(27,'Can delete medicine',7,'delete_medicine'),(28,'Can view medicine',7,'view_medicine'),(29,'Can add patient',8,'add_patient'),(30,'Can change patient',8,'change_patient'),(31,'Can delete patient',8,'delete_patient'),(32,'Can view patient',8,'view_patient'),(33,'Can add payment',9,'add_payment'),(34,'Can change payment',9,'change_payment'),(35,'Can delete payment',9,'delete_payment'),(36,'Can view payment',9,'view_payment'),(37,'Can add room',10,'add_room'),(38,'Can change room',10,'change_room'),(39,'Can delete room',10,'delete_room'),(40,'Can view room',10,'view_room'),(41,'Can add supplier',11,'add_supplier'),(42,'Can change supplier',11,'change_supplier'),(43,'Can delete supplier',11,'delete_supplier'),(44,'Can view supplier',11,'view_supplier'),(45,'Can add medical record',12,'add_medicalrecord'),(46,'Can change medical record',12,'change_medicalrecord'),(47,'Can delete medical record',12,'delete_medicalrecord'),(48,'Can view medical record',12,'view_medicalrecord'),(49,'Can add medical transaction',13,'add_medicaltransaction'),(50,'Can change medical transaction',13,'change_medicaltransaction'),(51,'Can delete medical transaction',13,'delete_medicaltransaction'),(52,'Can view medical transaction',13,'view_medicaltransaction'),(53,'Can add prescription',14,'add_prescription'),(54,'Can change prescription',14,'change_prescription'),(55,'Can delete prescription',14,'delete_prescription'),(56,'Can view prescription',14,'view_prescription'),(57,'Can add inpatient',15,'add_inpatient'),(58,'Can change inpatient',15,'change_inpatient'),(59,'Can delete inpatient',15,'delete_inpatient'),(60,'Can view inpatient',15,'view_inpatient'),(61,'Can add schedule',16,'add_schedule'),(62,'Can change schedule',16,'change_schedule'),(63,'Can delete schedule',16,'delete_schedule'),(64,'Can view schedule',16,'view_schedule'),(65,'Can add doctor leave',17,'add_doctorleave'),(66,'Can change doctor leave',17,'change_doctorleave'),(67,'Can delete doctor leave',17,'delete_doctorleave'),(68,'Can view doctor leave',17,'view_doctorleave'),(69,'Can add doctor availability',18,'add_doctoravailability'),(70,'Can change doctor availability',18,'change_doctoravailability'),(71,'Can delete doctor availability',18,'delete_doctoravailability'),(72,'Can view doctor availability',18,'view_doctoravailability'),(73,'Can add user',19,'add_user'),(74,'Can change user',19,'change_user'),(75,'Can delete user',19,'delete_user'),(76,'Can view user',19,'view_user');

-- 3. DATA DOKTER (doctor) - [Gender distandarisasi]
INSERT INTO `doctor` VALUES 
(1,'dr. Kaka Ubed, Sp.Jp','kaka@usya.com','082338423023','12345678910','','2006-11-19','Laki-laki','Jantung','Spesialis','IGD',0.00,1,'17:00:00.000000','08:00:00.000000'),
(2,'dr. Andi Prasetyo, Sp.PD','andi.prasetyo@rssehat.id','081234567890','30240145','202310001','1981-03-22','Laki-laki','Penyakit Dalam','Dokter Spesialis','Poli Penyakit Dalam',18000000.00,1,'16:00:00.000000','08:00:00.000000'),
(3,'dr. Siti Maemunah, Sp.A','siti.maemunah@rssehat.id','081278900122','30240256','202310002','1985-07-11','Perempuan','Anak','Dokter Spesialis','Poli Anak',17500000.00,1,'16:00:00.000000','08:00:00.000000'),
(4,'dr. Budi Hartanto, Sp.B','budi.hartanto@rssehat.id','081311224455','30240367','202310003','1979-09-05','Laki-laki','Bedah Umum','Dokter Spesialis','Poli Bedah',19000000.00,1,'16:00:00.000000','08:00:00.000000'),
(5,'dr. Rina Kusuma, Sp.KJ','rina.kusuma@rssehat.id','081399002233','30240478','202310004','1987-01-18','Perempuan','Kejiwaan','Dokter Spesialis','Poli Psikiatri',17000000.00,1,'16:00:00.000000','08:00:00.000000'),
(6,'dr. Ahmad Fauzi, Sp.JP','ahmad.fauzi@rssehat.id','081277889900','30240589','202310005','1983-06-27','Laki-laki','Jantung & Pembuluh Darah','Dokter Spesialis','Poli Jantung',20000000.00,1,'16:00:00.000000','08:00:00.000000'),
(7,'dr. Lina Agustina, Sp.M','lina.agustina@rssehat.id','081255667788','30240690','202310006','1988-04-09','Perempuan','Mata','Dokter Spesialis','Poli Jantung',16000000.00,1,'16:00:00.000000','08:00:00.000000'),
(8,'dr. Rudi Setiawan, Sp.OT','rudi.setiawan@rssehat.id','081322334455','30240721','202310007','1980-12-03','Laki-laki','Ortopedi','Dokter Spesialis','Poli Tulang',18500000.00,1,'16:00:00.000000','08:00:00.000000'),
(9,'dr. Maya Lestari, Sp.THT','maya.lestari@rssehat.id','081277733344','30240832','202310008','1990-05-15','Perempuan','Telinga Hidung Tenggorokan','Dokter Spesialis','Poli THT',16500000.00,1,'16:00:00.000000','08:00:00.000000'),
(10,'dr. Fajar Nugroho, Sp.KK','fajar.nugroho@rssehat.id','081366778899','30240943','202310009','1986-11-25','Laki-laki','Kulit & Kelamin','Dokter Spesialis','Poli Kulit & Kelamin',17000000.00,1,'16:00:00.000000','08:00:00.000000'),
(11,'dr. Wulan Sari, Sp.OG','wulan.sari@rssehat.id','081255443322','30241054','202310010','1984-02-14','Perempuan','Kandungan & Kebidanan','Dokter Spesialis','Poli Kebidanan',19000000.00,1,'16:00:00.000000','08:00:00.000000');

-- 4. DATA PASIEN (patient) - [Gender & BPJS distandarisasi]
INSERT INTO `patient` VALUES 
(1,'ulil ganteng','seturan','088888888888','2008-12-01','Laki-laki','A+','Aktif','2025-11-19 06:09:05.151464','2025-11-19 06:09:05.151464'),
(2,'Andi Pratama','Jl. Merpati Indah No. 12, Kel. Cilandak Barat, Kec. Cilandak, Jakarta Selatan','81234567890','1990-03-12','Laki-laki','B+','Aktif','2025-11-19 06:38:16.000000','2025-11-19 06:51:49.761010'),
(3,'Siti Rahmawati','Jl. Melati Putih No. 8, Kel. Antapani, Kec. Antapani, Bandung','081356789012','1988-07-25','Perempuan','AB+','Non-Aktif','2025-11-19 06:38:16.000000','2025-11-19 06:51:14.641100'),
(4,'Budi Santoso','Jl. Kenanga Timur No. 25, Kel. Wonokromo, Kec. Wonokromo, Surabaya','081422334455','1995-11-03','Laki-laki','B+','Aktif','2025-11-19 06:38:16.000000','2025-11-19 06:50:53.727928'),
(5,'Rina Marlina','Jl. Mawar Asri No. 17, Kel. Umbulharjo, Kec. Umbulharjo, Yogyakarta','081599887766','1992-05-18','Perempuan','A+','Aktif','2025-11-19 06:38:16.000000','2025-11-19 06:50:30.555513'),
(6,'Ahmad Fauzan','Jl. Cempaka Baru No. 45, Kel. Medan Timur, Kec. Medan Timur, Medan','081733445566','1998-12-30','Laki-laki','B-','Aktif','2025-11-19 06:38:16.000000','2025-11-19 06:49:41.627736'),
(7,'Lina Mentari','Jl. Dahlia Lestari No. 22, Kel. Ilir Barat I, Kec. Ilir Barat, Palembang','081877665544','1993-01-14','Perempuan','AB+','Aktif','2025-11-19 06:38:16.000000','2025-11-19 06:48:50.252214'),
(8,'Rudi Hartono','Jl. Flamboyan Utama No. 10, Kel. Panakkukang, Kec. Panakkukang, Makassar','081922331144','1996-06-22','Laki-laki','O+','Non-Aktif','2025-11-19 06:38:16.000000','2025-11-19 06:48:14.916848'),
(9,'Maya Sari','Jl. Nusa Indah Selatan No. 5, Kel. Sanur, Kec. Denpasar Selatan, Denpasar','081190807070','1991-04-07','Perempuan','B+','Non-Aktif','2025-11-19 06:38:16.000000','2025-11-19 06:47:47.048650'),
(10,'Fajar Khopling','Jl. Melur Indah No. 18, Kel. Tanah Sareal, Kec. Tanah Sareal, Bogor','081266778899','1999-10-15','Laki-laki','A+','Non-Aktif','2025-11-19 06:38:16.000000','2025-11-19 06:47:10.898857'),
(11,'Dwi Setiawan','Jl. Anggrek Raya No. 3, Kel. Pedurungan, Kec. Pedurungan, Semarang','081644556677','1987-09-09','Laki-laki','O+','Non-Aktif','2025-11-19 06:38:16.000000','2025-11-19 06:46:41.058679');

-- 5. DATA REKAM MEDIS (medicalrecord) - [Status bahasa distandarisasi]
INSERT INTO `medicalrecord` VALUES 
(1,'2025-11-19','Hipertensi','Diberikan Amlodipine 10 mg sekali sehari dan dianjurkan diet rendah garam',1,2,'2025-11-19 06:54:29.000000','06:54:29.000000','-','Selesai','2025-11-19 06:54:29.000000','Disetujui',NULL),
(2,'2025-11-19','Diabetes Mellitus Tipe 2','Diberikan Metformin 500 mg dua kali sehari dan kontrol gula darah rutin',1,3,'2025-11-19 06:54:29.000000','06:54:29.000000','-','Selesai','2025-11-19 06:54:29.000000','Disetujui',NULL),
(3,'2025-11-19','Infeksi Saluran Pernafasan Akut (ISPA)','Diberikan Amoxicillin 500 mg tiga kali sehari selama 5 hari',8,4,'2025-11-19 06:54:29.000000','06:54:29.000000','-','Selesai','2025-11-19 06:54:29.000000','Disetujui',NULL),
(4,'2025-11-19','Gastritis (Maag)','Diberikan Omeprazole 20 mg sebelum makan pagi selama 7 hari',1,5,'2025-11-19 06:54:29.000000','06:54:29.000000','-','Selesai','2025-11-19 06:54:29.000000','Disetujui',NULL),
(5,'2025-11-19','Demam Berdarah Dengue (DBD)','Diberikan cairan infus, Paracetamol, dan observasi suhu tubuh',2,6,'2025-11-19 06:54:29.000000','06:54:29.000000','-','Selesai','2025-11-19 06:54:29.000000','Disetujui',NULL),
(6,'2025-11-19','Asma Bronkial','Diberikan inhaler Salbutamol dan edukasi penggunaan nebulizer',6,11,'2025-11-19 06:54:29.000000','06:54:29.000000','-','Selesai','2025-11-19 06:54:29.000000','Disetujui',NULL),
(7,'2025-11-19','Anemia Defisiensi Zat Besi','Diberikan tablet Fe 1x sehari dan dianjurkan konsumsi makanan tinggi zat besi',1,8,'2025-11-19 06:54:29.000000','06:54:29.000000','-','Selesai','2025-11-19 06:54:29.000000','Disetujui',NULL),
(8,'2025-11-19','Tonsilitis Akut','Diberikan antibiotik Cefadroxil 500 mg dua kali sehari dan istirahat cukup',8,9,'2025-11-19 06:54:29.000000','06:54:29.000000','-','Selesai','2025-11-19 06:54:29.000000','Disetujui',NULL),
(9,'2025-11-19','Osteoarthritis Lutut','Diberikan Meloxicam 7.5 mg sekali sehari dan fisioterapi ringan',3,7,'2025-11-19 06:54:29.000000','06:54:29.000000','-','Selesai','2025-11-19 06:54:29.000000','Disetujui',NULL),
(10,'2025-11-19','Alergi Kulit (Dermatitis)','Diberikan Cetirizine 10 mg malam hari dan salep hidrokortison',9,10,'2025-11-19 06:54:29.000000','06:54:29.000000','-','Selesai','2025-11-19 06:54:29.000000','Disetujui',NULL),
(11,'2025-11-20','Jantung Koroner','Bedah jantung atas bawah',1,1,'2025-11-19 07:39:45.791400','14:42:37.000000','','Selesai','2025-11-19 07:43:07.933122','Disetujui','');

-- 6. DATA TRANSAKSI MEDIS (medicaltransaction)
INSERT INTO `medicaltransaction` VALUES 
(1,'Diagnosis: DBD Biaya Pengobatan: 1500000 Biaya Rawat Inap: 2000000',3500000.00,5,1),
(2,'Diagnosis: Diabetes Mellitus Tipe2 Biaya Pengobatan: 1200000 Biaya Rawat Inap: 7000000',8200000.00,2,2),
(3,'Diagnosis: ISPA Biaya Pengobatan: 15000000 Biaya Rawat Inap: 21000000',36000000.00,3,3),
(4,'Diagnosis: Gastritis Biaya Pengobatan: 1000000 Biaya Rawat Inap: 3500000',4500000.00,4,4),
(5,'Diagnosis: Tonsilitis Akut Biaya Pengobatan: 3000000 Biaya Rawat Inap: 5000000',8000000.00,8,5),
(6,'Diagnosis: Asma Bronkial Biaya Pengobatan: 4000000 Biaya Rawat Inap: 21000000',25000000.00,6,6),
(7,'Diagnosis: Anemia Defisiensi Zat Besi Biaya Pengobatan: 2000000 Biaya Rawat Inap: 15000000',17000000.00,7,7),
(8,'Diagnosis: Osteoarthritis Lutut Biaya Pengobatan: 1500000 Biaya Rawat Inap: 3500000',5000000.00,9,8),
(9,'Diagnosis: Alergi Kulit (Dermatitis) Biaya Pengobatan: 2500000 Biaya Rawat Inap: 30000000',32500000.00,10,9),
(10,'Diagnosis: Hipertensi Biaya Pengobatan: 1500000 Biaya Rawat Inap: 7500000',9000000.00,1,10);

-- 7. DATA OBAT (medicine) - [Tanggal 0000-00-00 diperbaiki]
INSERT INTO `medicine` VALUES 
(16,'Paracetamol 500mg','Bebas','Tablet','2026-05-01',250,3000.00,3001),
(17,'Amoxicillin 500mg','Keras','Kapsul','2026-08-15',200,5000.00,3002),
(18,'Cefadroxil 500mg','Keras','Kapsul','2026-10-30',150,7000.00,3002),
(19,'Oralit','Bebas','Serbuk','2027-01-01',300,2000.00,3003),
(20,'Omeprazole 20mg','Keras','Kapsul','2026-06-10',180,6000.00,3001),
(21,'Captopril 25mg','Keras','Tablet','2026-12-12',120,4000.00,3004),
(22,'Metformin 500mg','Keras','Tablet','2026-09-09',130,5000.00,3004),
(23,'Vitamin B Complex','Bebas','Tablet','2027-02-15',250,3500.00,3003),
(24,'Azithromycin 250mg','Keras','Kapsul','2026-07-07',100,8000.00,3002),
(25,'Ibuprofen 400mg','Bebas','Tablet','2026-11-30',160,4500.00,3001),
(26,'Amlodipine 10 mg','Keras','Tablet','2030-12-31',5000,660.00,3004),
(27,'Salbutamol 2 mg','Keras','Tablet','2030-12-31',3500,178.00,3003),
(28,'Tablet Fe (Zat Besi)','Bebas Terbatas','Tablet','2030-12-31',9000,330.00,3001),
(29,'Meloxicam 7.5 mg','Keras','Tablet','2030-12-31',2500,1000.00,3004),
(30,'Cetirizine 10 mg','Keras','Tablet','2030-12-31',4500,500.00,3002);

-- 8. DATA PEMBAYARAN (payment)
INSERT INTO `payment` VALUES 
(1,'2025-01-15 00:00:00.000000','Tunai',3500000.00,'2025-11-19 07:23:44.000000',NULL,'INV/2025/01/001',5,'Lunas',3500000.00,NULL,'Rawat Inap & Pengobatan','Lunas','2025-11-19 07:23:44.000000'),
(2,'2025-02-02 00:00:00.000000','Debit',8200000.00,'2025-11-19 07:23:44.000000',NULL,'INV/2025/02/002',2,'Lunas',8200000.00,NULL,'Rawat Inap & Pengobatan','Lunas','2025-11-19 07:23:44.000000'),
(3,'2025-02-10 00:00:00.000000','QRIS',36000000.00,'2025-11-19 07:23:44.000000',NULL,'INV/2025/02/003',3,'Lunas',36000000.00,NULL,'Rawat Inap & Pengobatan','Lunas','2025-11-19 07:23:44.000000'),
(4,'2025-03-08 00:00:00.000000','BPJS',4500000.00,'2025-11-19 07:23:44.000000',NULL,'INV/2025/03/004',4,'Klaim BPJS',4500000.00,NULL,'Rawat Inap & Pengobatan','Lunas','2025-11-19 07:23:44.000000'),
(5,'2025-03-21 00:00:00.000000','Transfer Bank',8000000.00,'2025-11-19 07:23:44.000000',NULL,'INV/2025/03/005',8,'Lunas',8000000.00,NULL,'Rawat Inap & Pengobatan','Lunas','2025-11-19 07:23:44.000000'),
(6,'2025-04-05 00:00:00.000000','Tunai',25000000.00,'2025-11-19 07:23:44.000000',NULL,'INV/2025/04/006',6,'Lunas',25000000.00,NULL,'Rawat Inap & Pengobatan','Lunas','2025-11-19 07:23:44.000000'),
(7,'2025-05-11 00:00:00.000000','Debit',17000000.00,'2025-11-19 07:23:44.000000',NULL,'INV/2025/05/007',7,'Lunas',17000000.00,NULL,'Rawat Inap & Pengobatan','Lunas','2025-11-19 07:23:44.000000'),
(8,'2025-06-07 00:00:00.000000','QRIS',5000000.00,'2025-11-19 07:23:44.000000',NULL,'INV/2025/06/008',9,'Lunas',5000000.00,NULL,'Rawat Inap & Pengobatan','Lunas','2025-11-19 07:23:44.000000'),
(9,'2025-07-18 00:00:00.000000','BPJS',32500000.00,'2025-11-19 07:23:44.000000',NULL,'INV/2025/07/009',10,'Klaim BPJS',32500000.00,NULL,'Rawat Inap & Pengobatan','Lunas','2025-11-19 07:23:44.000000'),
(10,'2025-08-22 00:00:00.000000','Transfer Bank',9000000.00,'2025-11-19 07:23:44.000000',NULL,'INV/2025/08/010',1,'Lunas',9000000.00,NULL,'Rawat Inap & Pengobatan','Lunas','2025-11-19 07:23:44.000000');

-- 9. DATA RESEP (prescription)
INSERT INTO `prescription` VALUES 
(11,'2025-01-15','1x sehari sesudah makan','Amlodipine 10 mg, diminum 1x sehari setelah makan',1,26),
(12,'2025-02-02','2x sehari sesudah makan','Metformin 500 mg, diminum 2x sehari sesudah makan',2,22),
(13,'2025-02-10','3x sehari selama 5 hari','Amoxicillin 500 mg, diminum 3x sehari selama 5 hari',3,17),
(14,'2025-03-08','1x sehari sebelum sarapan','Omeprazole 20 mg, diminum 1x sehari sebelum sarapan',4,20),
(15,'2025-03-21','Tiap 6 jam bila demam','Paracetamol 500 mg tiap 6 jam bila demam + cairan infus',5,16),
(16,'2025-04-05','2x semprot per hari','Salbutamol inhaler 2x semprot per hari, nebulizer bila sesak',6,27),
(17,'2025-05-11','1x sehari','Tablet Fe 1x sehari, konsumsi makanan kaya zat besi',7,28),
(18,'2025-06-07','2x sehari selama 5 hari','Cefadroxil 500 mg, diminum 2x sehari selama 5 hari',8,18),
(19,'2025-07-18','1x sehari','Meloxicam 7.5 mg, diminum 1x sehari, lakukan fisioterapi',9,29),
(20,'2025-08-22','1x malam hari','Cetirizine 10 mg malam hari + salep hidrokortison tipis-tipis',10,30);

-- 10. DATA KAMAR (room)
INSERT INTO `room` VALUES 
(1,'Pattimura 1  - 3A','VIP',1,1.00),(2,'Pattimura 1  - 3B','VIP',1,1.00),(3,'Pattimura 1  - 3C','VIP',1,1.00),(4,'Pattimura 1  - 3D','VIP',1,1.00),(5,'Pattimura 2 -  3A','ICU',1,1.00),(6,'Pattimura 2 -  3B','ICU',1,1.00),(7,'Pattimura 2 -  3C','ICU',1,1.00),(8,'Pattimura 2  - 3D','ICU',1,1.00),(9,'Pattimura 3  - 3A','Kelas 1',2,5.00),(10,'Pattimura 3  - 3B','Kelas 1',2,5.00),(11,'Pattimura 3  - 3C','Kelas 1',2,5.00),(12,'Pattimura 3  - 3C','Kelas 1',2,5.00);

-- 11. DATA JADWAL (schedule)
INSERT INTO `schedule` VALUES 
(1,'2025-01-15','08:30:00.000000',2,'2025-11-19 07:32:38.000000','Terjadwal'),(2,'2025-02-02','09:15:00.000000',3,'2025-11-19 07:32:38.000000','Terjadwal'),(3,'2025-02-10','10:45:00.000000',4,'2025-11-19 07:32:38.000000','Terjadwal'),(4,'2025-03-08','11:20:00.000000',5,'2025-11-19 07:32:38.000000','Terjadwal'),(5,'2025-03-21','13:00:00.000000',6,'2025-11-19 07:32:38.000000','Terjadwal'),(6,'2025-04-05','14:10:00.000000',7,'2025-11-19 07:32:38.000000','Terjadwal'),(7,'2025-05-11','15:30:00.000000',8,'2025-11-19 07:32:38.000000','Terjadwal'),(8,'2025-06-07','08:00:00.000000',6,'2025-11-19 07:32:38.000000','Terjadwal'),(9,'2025-07-18','10:00:00.000000',10,'2025-11-19 07:32:38.000000','Terjadwal'),(10,'2025-08-22','16:15:00.000000',9,'2025-11-19 07:32:38.000000','Terjadwal');

-- 12. DATA SUPPLIER (supplier)
INSERT INTO `supplier` VALUES 
(3001,'PT Sehat Selalu Farma','Jl. Sudirman No. 88, Jakarta','021-5556677','info@sehatselalu.co.id'),
(3002,'CV Medika Utama','Jl. Gatot Subroto No. 22, Bandung','022-6667788','cs@medikautama.com'),
(3003,'UD Obat Rakyat','Jl. Pemuda No. 45, Surabaya','031-4445599','udobatrakyat@gmail.com'),
(3004,'PT Farma Indah','Jl. Diponegoro No. 90, Yogyakarta','0274-557890','sales@farmaindah.co.id');

-- 13. DATA LOG ADMIN (django_admin_log)
INSERT INTO `django_admin_log` VALUES 
(1,'2025-11-18 03:37:35.623345','1','cyclocerine (Admin Rumah Sakit)',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',19,1),(2,'2025-11-19 06:14:03.070308','1','Pattimura 1  - 3A',1,'[{\"added\": {}}]',10,1),(3,'2025-11-19 06:14:39.811334','2','Pattimura 1  - 3B',1,'[{\"added\": {}}]',10,1),(4,'2025-11-19 06:15:13.661125','3','Pattimura 1  - 3C',1,'[{\"added\": {}}]',10,1),(5,'2025-11-19 06:15:42.193522','4','Pattimura 1  - 3D',1,'[{\"added\": {}}]',10,1),(6,'2025-11-19 06:16:12.231665','5','Pattimura 2 -  3A',1,'[{\"added\": {}}]',10,1),(7,'2025-11-19 06:16:29.961761','6','Pattimura 2 -  3B',1,'[{\"added\": {}}]',10,1),(8,'2025-11-19 06:16:54.946333','7','Pattimura 2 -  3C',1,'[{\"added\": {}}]',10,1),(9,'2025-11-19 06:17:24.255289','8','Pattimura 2  - 3D',1,'[{\"added\": {}}]',10,1),(10,'2025-11-19 06:18:13.540150','9','Pattimura 3  - 3A',1,'[{\"added\": {}}]',10,1),(11,'2025-11-19 06:18:42.550408','10','Pattimura 3  - 3B',1,'[{\"added\": {}}]',10,1),(12,'2025-11-19 06:19:25.029601','11','Pattimura 3  - 3C',1,'[{\"added\": {}}]',10,1),(13,'2025-11-19 06:20:02.096161','12','Pattimura 3  - 3C',1,'[{\"added\": {}}]',10,1),(14,'2025-11-19 06:46:41.161956','11','Dwi Setiawan',2,'[{\"changed\": {\"fields\": [\"Gender\", \"Blood type\"]}}]',8,1),(15,'2025-11-19 06:47:11.037776','10','Fajar Khopling',2,'[{\"changed\": {\"fields\": [\"Gender\", \"Blood type\"]}}]',8,1),(16,'2025-11-19 06:47:47.159284','9','Maya Sari',2,'[{\"changed\": {\"fields\": [\"Gender\", \"Blood type\"]}}]',8,1),(17,'2025-11-19 06:48:15.012534','8','Rudi Hartono',2,'[{\"changed\": {\"fields\": [\"Gender\", \"Blood type\"]}}]',8,1),(18,'2025-11-19 06:48:50.329599','7','Lina Mentari',2,'[{\"changed\": {\"fields\": [\"Gender\", \"Blood type\"]}}]',8,1),(19,'2025-11-19 06:49:11.288759','6','Ahmad Fauzan',2,'[{\"changed\": {\"fields\": [\"Address\", \"Gender\"]}}]',8,1),(20,'2025-11-19 06:49:41.693049','6','Ahmad Fauzan',2,'[{\"changed\": {\"fields\": [\"Gender\"]}}]',8,1),(21,'2025-11-19 06:50:30.687905','5','Rina Marlina',2,'[{\"changed\": {\"fields\": [\"Gender\", \"Blood type\"]}}]',8,1),(22,'2025-11-19 06:50:53.786375','4','Budi Santoso',2,'[{\"changed\": {\"fields\": [\"Gender\", \"Blood type\"]}}]',8,1),(23,'2025-11-19 06:51:14.735176','3','Siti Rahmawati',2,'[{\"changed\": {\"fields\": [\"Gender\", \"Blood type\"]}}]',8,1),(24,'2025-11-19 06:51:49.822905','2','Andi Pratama',2,'[{\"changed\": {\"fields\": [\"Gender\", \"Blood type\"]}}]',8,1),(25,'2025-11-19 07:35:08.652956','1','Dr. dr. Kaka Ubed, Sp.Jp',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',6,1),(26,'2025-11-19 07:43:08.008184','11','MR-11 | ulil ganteng - completed',2,'[{\"changed\": {\"fields\": [\"Examination time\", \"Diagnosis\", \"Treatment\", \"Status\", \"Confirmation status\"]}}]',12,1);

-- 14. DATA CONTENT TYPE (django_content_type)
INSERT INTO `django_content_type` VALUES 
(19,'accounts','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'core','doctor'),(18,'core','doctoravailability'),(17,'core','doctorleave'),(15,'core','inpatient'),(12,'core','medicalrecord'),(13,'core','medicaltransaction'),(7,'core','medicine'),(8,'core','patient'),(9,'core','payment'),(14,'core','prescription'),(10,'core','room'),(16,'core','schedule'),(11,'core','supplier'),(5,'sessions','session');

-- 15. DATA MIGRATIONS (django_migrations)
INSERT INTO `django_migrations` VALUES 
(1,'core','0001_initial','2025-11-18 03:27:04.599344'),(2,'contenttypes','0001_initial','2025-11-18 03:27:04.796349'),(3,'contenttypes','0002_remove_content_type_name','2025-11-18 03:27:05.134464'),(4,'auth','0001_initial','2025-11-18 03:27:06.210294'),(5,'auth','0002_alter_permission_name_max_length','2025-11-18 03:27:06.441034'),(6,'auth','0003_alter_user_email_max_length','2025-11-18 03:27:06.482385'),(7,'auth','0004_alter_user_username_opts','2025-11-18 03:27:06.524403'),(8,'auth','0005_alter_user_last_login_null','2025-11-18 03:27:06.588225'),(9,'auth','0006_require_contenttypes_0002','2025-11-18 03:27:06.628276'),(10,'auth','0007_alter_validators_add_error_messages','2025-11-18 03:27:06.700533'),(11,'auth','0008_alter_user_username_max_length','2025-11-18 03:27:06.754968'),(12,'auth','0009_alter_user_last_name_max_length','2025-11-18 03:27:06.806060'),(13,'auth','0010_alter_group_name_max_length','2025-11-18 03:27:06.932220'),(14,'auth','0011_update_proxy_permissions','2025-11-18 03:27:07.150312'),(15,'auth','0012_alter_user_first_name_max_length','2025-11-18 03:27:07.207393'),(16,'accounts','0001_initial','2025-11-18 03:27:08.545889'),(17,'admin','0001_initial','2025-11-18 03:27:09.096365'),(18,'admin','0002_logentry_remove_auto_add','2025-11-18 03:27:09.183016'),(19,'admin','0003_logentry_add_action_flag_choices','2025-11-18 03:27:09.255420'),(20,'admin','0004_fix_admin_log_foreign_key','2025-11-18 03:27:09.296856'),(21,'core','0002_alter_patient_gender','2025-11-18 03:27:09.439402'),(22,'core','0003_alter_doctor_gender','2025-11-18 03:27:09.587307'),(23,'core','0004_alter_medicalrecord_options_alter_schedule_options_and_more','2025-11-18 03:27:11.303788'),(24,'core','0005_alter_payment_options_remove_payment_total_amount_and_more','2025-11-18 03:27:13.193473'),(25,'core','0006_doctor_is_available_doctor_working_hours_end_and_more','2025-11-18 03:27:14.410333'),(26,'sessions','0001_initial','2025-11-18 03:27:14.631641');

-- 16. DATA SESSION (django_session)
INSERT INTO `django_session` VALUES 
('hyger6za19wamhm1h2fncu02wlfia013','.eJxVjEsOwiAUAO_C2hAe5evSfc9AHg-QqqFJaVfGuxuSLnQ7M5k3C3jsNRw9b2FJ7MqAXX5ZRHrmNkR6YLuvnNa2b0vkI-Gn7XxeU37dzvZvULHXsfVkpXRROUJAEsrrSWoqylsCr6GkDM5IYwh0MTqBSiLbLEFImIoS7PMFxRI21w:1vLcpX:pogvyaq7p5MEvblyy1BxSmY5jKxaQZGhoF5EDfRbZ3c','2025-12-03 07:42:19.103964');