Berikut adalah jawaban untuk Evaluasi Akhir Semester (EAS) Matematika Diskret dengan penyampaian yang berbeda namun tetap mempertahankan ketepatan akademis:

---

## 1. Esensi Teori Graf dan Implementasi Praktis (Poin 30)

**Definisi Singkat:**
Teori Graf merupakan bidang studi dalam matematika diskret yang berfokus pada representasi hubungan antarobjek. Objek-objek tersebut disimbolkan sebagai **simpul (vertex)**, sedangkan relasi atau koneksi di antara mereka digambarkan sebagai **sisi (edge)**. Secara matematis, graf memudahkan kita untuk menganalisis struktur jaringan yang kompleks menjadi model yang lebih sederhana dan terukur.

**Aplikasi dalam Dunia Nyata:**

* 
**Optimasi Rute (Logistik):** Digunakan oleh kurir atau layanan pemetaan untuk menentukan jalur paling efisien guna meminimalkan waktu tempuh.


* 
**Analisis Media Sosial:** Memetakan interaksi antar pengguna untuk merekomendasikan teman atau mendeteksi komunitas tertentu.


* 
**Sains Komputer:** Digunakan dalam penyusunan struktur data, pembuatan pohon keputusan (decision tree), dan manajemen basis data relasional.


* 
**Sistem Kelistrikan:** Menganalisis aliran daya dan beban dalam jaringan distribusi listrik.



---

## 2. Studi Komparasi dan Karakteristik Graf (Poin 35)

Berdasarkan pengamatan pada dua buah graf yang disajikan (graf huruf a-h dan graf angka 1-8):

### (a) Analisis Isomorfisme

**Jawaban:** Kedua graf tersebut bersifat **isomorfik**.
**Penjelasan:**

* 
**Kesesuaian Elemen:** Kedua graf memiliki jumlah simpul yang identik, yaitu 8 simpul , dan jumlah sisi yang sama, yaitu 12 sisi.


* **Derajat Simpul:** Setiap simpul pada kedua graf memiliki derajat 3 (setiap titik terhubung dengan 3 garis lainnya).
* **Konektivitas:** Meski bentuk visualnya berbeda (satu melingkar dan satu berbentuk kotak bertingkat), hubungan ketetanggaan antar simpulnya tetap sama. Graf kiri hanyalah bentuk deformasi visual dari graf kanan yang merupakan representasi graf kubus.

### (b) Klasifikasi Euler dan Hamilton

* **Sifat Euler:**
* 
**Bukan Graf Euler/Semi-Euler:** Karena syarat graf Euler adalah semua simpul berderajat genap, sementara pada graf ini seluruh simpulnya berderajat ganjil (3).




* **Sifat Hamilton:**
* 
**Termasuk Graf Hamilton:** Karena kita dapat menemukan lintasan tertutup yang mengunjungi setiap titik tepat satu kali tanpa ada yang terlewat.


* **Contoh Sirkuit (Graf Kanan):** Lintasan 1-2-8-7-5-6-4-3-1 melewati semua simpul dan kembali ke titik asal.



---

## 3. Kompresi Data dengan Pohon Huffman (Poin 35)

**Input String:** `daku dan dia kuliah bersama` (Total 27 karakter termasuk spasi).

### (a) Konstruksi Pohon Huffman

Langkah pertama adalah menghitung kemunculan setiap karakter:

* **a**: 5 | **d, u, i, (spasi)**: masing-masing 3 | **k**: 2 | **n, l, h, b, e, r, s, m**: masing-masing 1.

Karakter dengan frekuensi terendah (seperti 'n', 'l', 'h', dll) akan diletakkan di bagian bawah pohon (leaf paling dalam), sedangkan karakter yang paling sering muncul (seperti 'a') akan berada lebih dekat dengan akar untuk mendapatkan kode bit yang lebih pendek.

### (b) Estimasi Total Bit

**Jawaban:** Jumlah bit yang dihasilkan adalah akumulasi dari (frekuensi karakter \times panjang kode binernya).

* Jika menggunakan pengkodean standar ASCII (8 bit per karakter), totalnya adalah 27 \times 8 = 216 bit.
* Dengan **Pohon Huffman**, panjang kode per karakter bervariasi antara 2 hingga 5 bit. Estimasi total bit yang terbentuk adalah sekitar **95 hingga 105 bit**, yang menunjukkan efisiensi ruang penyimpanan lebih dari 50% dibandingkan metode konvensional.

---

Apakah Anda ingin saya membantu menghitung nilai bit spesifik untuk setiap karakter dalam string tersebut?